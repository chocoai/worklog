#該程式未解開Section, 採用最新樣板產出!
{<section id="apjt302.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0009(2016-12-21 16:07:42), PR版次:0009(2017-08-01 14:39:39)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000086
#+ Filename...: apjt302
#+ Description: 專案進度維護作業
#+ Creator....: 02295(2015-11-13 10:46:34)
#+ Modifier...: 02294 -SD/PR- 09772
 
{</section>}
 
{<section id="apjt302.global" >}
#應用 t01 樣板自動產生(Version:89)
#add-point:填寫註解說明 name="global.memo" 
#160318-00025#31    2016/04/11  By pengxin     將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#161109-00032#5     2016/12/08  By lixiang     隐藏收款条件、交易条件、币别、汇率、税别、含税否、税率,将成本相关栏位拿到项目成本页签（该页签也显示项次、专案编号，方便查看)
#161221-00015#1     2016/12/21  By zhujing     成本页签栏位代号改成xxxx000a，防止产生到insert_b段。
#160824-00007#332   2017/01/16  By lori        舊植備份處理調整
#160711-00040#23    2017/02/16  By xujing T類作業的單別開窗的where條件(找CALL q_ooba002_開頭的)增加如下程式段
#                                        CALL s_control_get_docno_sql(g_user,g_dept) RETURNING l_success,l_sql1
#170516-00015#1     2017/05/16  By 00768       当历史进度有变化时，及时刷新本期进度
#170703-00025#13    2017/07/24  By wanghaoz    调整construct/input中的开窗调用，将q_ooag001/q_ooag001_4调整成q_ooag001_2
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

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
PRIVATE type type_g_pjda_m        RECORD
       pjdadocno LIKE pjda_t.pjdadocno, 
   pjdadocno_desc LIKE type_t.chr80, 
   pjdadocdt LIKE pjda_t.pjdadocdt, 
   pjdasite LIKE pjda_t.pjdasite, 
   pjda001 LIKE pjda_t.pjda001, 
   pjda001_desc LIKE type_t.chr80, 
   pjda002 LIKE pjda_t.pjda002, 
   pjda002_desc LIKE type_t.chr80, 
   pjdastus LIKE pjda_t.pjdastus, 
   pjdaownid LIKE pjda_t.pjdaownid, 
   pjdaownid_desc LIKE type_t.chr80, 
   pjdaowndp LIKE pjda_t.pjdaowndp, 
   pjdaowndp_desc LIKE type_t.chr80, 
   pjdacrtid LIKE pjda_t.pjdacrtid, 
   pjdacrtid_desc LIKE type_t.chr80, 
   pjdacrtdp LIKE pjda_t.pjdacrtdp, 
   pjdacrtdp_desc LIKE type_t.chr80, 
   pjdacrtdt LIKE pjda_t.pjdacrtdt, 
   pjdamodid LIKE pjda_t.pjdamodid, 
   pjdamodid_desc LIKE type_t.chr80, 
   pjdamoddt LIKE pjda_t.pjdamoddt, 
   pjdacnfid LIKE pjda_t.pjdacnfid, 
   pjdacnfid_desc LIKE type_t.chr80, 
   pjdacnfdt LIKE pjda_t.pjdacnfdt, 
   pjdapstid LIKE pjda_t.pjdapstid, 
   pjdapstid_desc LIKE type_t.chr80, 
   pjdapstdt LIKE pjda_t.pjdapstdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_pjdb_d        RECORD
       pjdbseq LIKE pjdb_t.pjdbseq, 
   pjdb001 LIKE pjdb_t.pjdb001, 
   pjdb001_desc LIKE type_t.chr500, 
   pjdb002 LIKE pjdb_t.pjdb002, 
   pjdb002_desc LIKE type_t.chr500, 
   pjab003 LIKE type_t.chr10, 
   pjab003_desc LIKE type_t.chr500, 
   pjab004 LIKE type_t.chr20, 
   pjab004_desc LIKE type_t.chr500, 
   pjdb012 LIKE pjdb_t.pjdb012, 
   pjdb013 LIKE pjdb_t.pjdb013, 
   pjdb014 LIKE pjdb_t.pjdb014, 
   pjdb010 LIKE pjdb_t.pjdb010, 
   pjdb011 LIKE pjdb_t.pjdb011, 
   pjdb015 LIKE pjdb_t.pjdb015, 
   pjdb016 LIKE pjdb_t.pjdb016, 
   pjdb050 LIKE pjdb_t.pjdb050, 
   pjdbsite LIKE pjdb_t.pjdbsite
       END RECORD
PRIVATE TYPE type_g_pjdb2_d RECORD
       pjdbseq LIKE pjdb_t.pjdbseq, 
   pjdb001a LIKE type_t.chr20, 
   pjdb001_1_desc LIKE type_t.chr500, 
   pjdb026 LIKE pjdb_t.pjdb026, 
   pjdb027 LIKE pjdb_t.pjdb027, 
   pjdb028 LIKE pjdb_t.pjdb028, 
   pjdb029 LIKE pjdb_t.pjdb029, 
   pjdb030 LIKE pjdb_t.pjdb030, 
   pjdb031 LIKE pjdb_t.pjdb031, 
   pjdb032 LIKE pjdb_t.pjdb032, 
   pjdb033 LIKE pjdb_t.pjdb033, 
   pjdb034 LIKE pjdb_t.pjdb034, 
   pjdb035 LIKE pjdb_t.pjdb035, 
   pjdb036 LIKE pjdb_t.pjdb036, 
   pjdb037 LIKE pjdb_t.pjdb037, 
   pjdb038 LIKE pjdb_t.pjdb038, 
   pjdb039 LIKE pjdb_t.pjdb039, 
   pjdb040 LIKE pjdb_t.pjdb040, 
   pjdb041 LIKE pjdb_t.pjdb041, 
   pjdb042 LIKE pjdb_t.pjdb042, 
   pjdb043 LIKE pjdb_t.pjdb043, 
   pjdb044 LIKE pjdb_t.pjdb044, 
   pjdb045 LIKE pjdb_t.pjdb045, 
   pjdb046 LIKE pjdb_t.pjdb046, 
   pjdb047 LIKE pjdb_t.pjdb047, 
   pjdb048 LIKE pjdb_t.pjdb048, 
   pjdb049 LIKE pjdb_t.pjdb049, 
   pjdb003 LIKE type_t.chr10, 
   pjdb003_desc LIKE type_t.chr500, 
   pjdb004 LIKE type_t.chr10, 
   pjdb004_desc LIKE type_t.chr500, 
   pjdb005 LIKE type_t.chr10, 
   pjdb005_desc LIKE type_t.chr500, 
   pjdb006 LIKE type_t.num26_10, 
   pjdb007 LIKE type_t.chr10, 
   pjdb007_desc LIKE type_t.chr500, 
   pjdb008 LIKE type_t.chr1, 
   pjdb009 LIKE type_t.num26_10
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_pjdadocno LIKE pjda_t.pjdadocno,
      b_pjdadocdt LIKE pjda_t.pjdadocdt,
      b_pjda001 LIKE pjda_t.pjda001,
   b_pjda001_desc LIKE type_t.chr80,
      b_pjda002 LIKE pjda_t.pjda002,
   b_pjda002_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"

#end add-point
       
#模組變數(Module Variables)
DEFINE g_pjda_m          type_g_pjda_m
DEFINE g_pjda_m_t        type_g_pjda_m
DEFINE g_pjda_m_o        type_g_pjda_m
DEFINE g_pjda_m_mask_o   type_g_pjda_m #轉換遮罩前資料
DEFINE g_pjda_m_mask_n   type_g_pjda_m #轉換遮罩後資料
 
   DEFINE g_pjdadocno_t LIKE pjda_t.pjdadocno
 
 
DEFINE g_pjdb_d          DYNAMIC ARRAY OF type_g_pjdb_d
DEFINE g_pjdb_d_t        type_g_pjdb_d
DEFINE g_pjdb_d_o        type_g_pjdb_d
DEFINE g_pjdb_d_mask_o   DYNAMIC ARRAY OF type_g_pjdb_d #轉換遮罩前資料
DEFINE g_pjdb_d_mask_n   DYNAMIC ARRAY OF type_g_pjdb_d #轉換遮罩後資料
DEFINE g_pjdb2_d          DYNAMIC ARRAY OF type_g_pjdb2_d
DEFINE g_pjdb2_d_t        type_g_pjdb2_d
DEFINE g_pjdb2_d_o        type_g_pjdb2_d
DEFINE g_pjdb2_d_mask_o   DYNAMIC ARRAY OF type_g_pjdb2_d #轉換遮罩前資料
DEFINE g_pjdb2_d_mask_n   DYNAMIC ARRAY OF type_g_pjdb2_d #轉換遮罩後資料
 
 
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
DEFINE g_err_rec             LIKE type_t.chr1              #紀錄是否有錯誤   #161130-00056
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"
DEFINE g_ooef004   LIKE ooef_t.ooef004
DEFINE g_ooef019   LIKE ooef_t.ooef019
#end add-point
 
{</section>}
 
{<section id="apjt302.main" >}
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
   CALL cl_ap_init("apj","")
 
   #add-point:作業初始化 name="main.init"
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT pjdadocno,'',pjdadocdt,pjdasite,pjda001,'',pjda002,'',pjdastus,pjdaownid, 
       '',pjdaowndp,'',pjdacrtid,'',pjdacrtdp,'',pjdacrtdt,pjdamodid,'',pjdamoddt,pjdacnfid,'',pjdacnfdt, 
       pjdapstid,'',pjdapstdt", 
                      " FROM pjda_t",
                      " WHERE pjdaent= ? AND pjdadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE apjt302_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.pjdadocno,t0.pjdadocdt,t0.pjdasite,t0.pjda001,t0.pjda002,t0.pjdastus, 
       t0.pjdaownid,t0.pjdaowndp,t0.pjdacrtid,t0.pjdacrtdp,t0.pjdacrtdt,t0.pjdamodid,t0.pjdamoddt,t0.pjdacnfid, 
       t0.pjdacnfdt,t0.pjdapstid,t0.pjdapstdt,t1.oobxl003 ,t2.ooag011 ,t3.ooefl003 ,t4.ooag011 ,t5.ooefl003 , 
       t6.ooag011 ,t7.ooefl003 ,t8.ooag011 ,t9.ooag011 ,t10.ooag011",
               " FROM pjda_t t0",
                              " LEFT JOIN oobxl_t t1 ON t1.oobxlent="||g_enterprise||" AND t1.oobxl001=t0.pjdadocno AND t1.oobxl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t2 ON t2.ooagent="||g_enterprise||" AND t2.ooag001=t0.pjda001  ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.pjda002 AND t3.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.pjdaownid  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.pjdaowndp AND t5.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.pjdacrtid  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.pjdacrtdp AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.pjdamodid  ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.pjdacnfid  ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.pjdapstid  ",
 
               " WHERE t0.pjdaent = " ||g_enterprise|| " AND t0.pjdadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE apjt302_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_apjt302 WITH FORM cl_ap_formpath("apj",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL apjt302_init()   
 
      #進入選單 Menu (="N")
      CALL apjt302_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_apjt302
      
   END IF 
   
   CLOSE apjt302_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="apjt302.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION apjt302_init()
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
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
   LET g_err_rec = "N"   #161130-00056
      CALL cl_set_combo_scc_part('pjdastus','13','N,Y,X')
 
   
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1','2',","1")
   CALL g_idx_group.addAttribute("","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   SELECT ooef004,ooef019 INTO g_ooef004,g_ooef019 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_site
   #end add-point
   
   #初始化搜尋條件
   CALL apjt302_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="apjt302.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION apjt302_ui_dialog()
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
            CALL apjt302_insert()
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
         INITIALIZE g_pjda_m.* TO NULL
         CALL g_pjdb_d.clear()
         CALL g_pjdb2_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL apjt302_init()
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
               
               CALL apjt302_fetch('') # reload data
               LET l_ac = 1
               CALL apjt302_ui_detailshow() #Setting the current row 
         
               CALL apjt302_idx_chk()
               #NEXT FIELD pjdbseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_pjdb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL apjt302_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1','2',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1','2',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL apjt302_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_pjdb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL apjt302_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body2.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue(""))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               #顯示單身筆數
               CALL apjt302_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL apjt302_browser_fill("")
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
               CALL apjt302_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL apjt302_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL apjt302_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL apjt302_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL apjt302_set_act_visible()   
            CALL apjt302_set_act_no_visible()
            IF NOT (g_pjda_m.pjdadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " pjdaent = " ||g_enterprise|| " AND",
                                  " pjdadocno = '", g_pjda_m.pjdadocno, "' "
 
               #填到對應位置
               CALL apjt302_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "pjda_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "pjdb_t" 
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
               CALL apjt302_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "pjda_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "pjdb_t" 
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
                  CALL apjt302_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL apjt302_fetch("F")
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
               CALL apjt302_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL apjt302_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL apjt302_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL apjt302_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL apjt302_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL apjt302_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL apjt302_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL apjt302_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL apjt302_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL apjt302_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL apjt302_idx_chk()
          
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
                        LET l_arr_len = g_pjdb_d.getLength()
                        LET g_export_tag[1] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[1] = "s_detail1"
                        FOR l_arr_cnt = 1 TO l_arr_len
                           LET g_export_tag[1][l_arr_cnt] = g_pjdb_d[l_arr_cnt]
                        END FOR
 
                        LET l_arr_len = g_pjdb2_d.getLength()
                        LET g_export_tag[2] = rec_arr_type.create(l_arr_len)
                        LET g_export_tabname[2] = "s_detail2"
                        FOR l_arr_cnt = 1 TO l_arr_len
                            LET g_export_tag[2][l_arr_cnt] = g_pjdb2_d[l_arr_cnt]
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
                        LET g_export_node[1] = base.typeInfo.create(g_pjdb_d)
                        LET g_export_id[1]   = "s_detail1"
                        LET g_export_node[2] = base.typeInfo.create(g_pjdb2_d)
                        LET g_export_id[2]   = "s_detail2"
 
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
               NEXT FIELD pjdbseq
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
               CALL apjt302_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL apjt302_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL apjt302_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL apjt302_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL apjt302_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL apjt302_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL apjt302_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL apjt302_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_pjda_m.pjdadocdt)
 
 
 
         
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
 
{<section id="apjt302.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION apjt302_browser_fill(ps_page_action)
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
   LET l_wc = l_wc," AND pjdasite = '",g_site,"' "
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT pjdadocno ",
                      " FROM pjda_t ",
                      " ",
                      " LEFT JOIN pjdb_t ON pjdbent = pjdaent AND pjdadocno = pjdbdocno ", "  ",
                      #add-point:browser_fill段sql(pjdb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE pjdaent = " ||g_enterprise|| " AND pjdbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("pjda_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT pjdadocno ",
                      " FROM pjda_t ", 
                      "  ",
                      "  ",
                      " WHERE pjdaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("pjda_t")
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
      INITIALIZE g_pjda_m.* TO NULL
      CALL g_pjdb_d.clear()        
      CALL g_pjdb2_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.pjdadocno,t0.pjdadocdt,t0.pjda001,t0.pjda002 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.pjdastus,t0.pjdadocno,t0.pjdadocdt,t0.pjda001,t0.pjda002,t1.ooag002 , 
          t2.ooefl003 ",
                  " FROM pjda_t t0",
                  "  ",
                  "  LEFT JOIN pjdb_t ON pjdbent = pjdaent AND pjdadocno = pjdbdocno ", "  ", 
                  #add-point:browser_fill段sql(pjdb_t1) name="browser_fill.join.pjdb_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.pjda001  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.pjda002 AND t2.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.pjdaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("pjda_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.pjdastus,t0.pjdadocno,t0.pjdadocdt,t0.pjda001,t0.pjda002,t1.ooag002 , 
          t2.ooefl003 ",
                  " FROM pjda_t t0",
                  "  ",
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.pjda001  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.pjda002 AND t2.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.pjdaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("pjda_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY pjdadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"pjda_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_pjdadocno,g_browser[g_cnt].b_pjdadocdt, 
          g_browser[g_cnt].b_pjda001,g_browser[g_cnt].b_pjda002,g_browser[g_cnt].b_pjda001_desc,g_browser[g_cnt].b_pjda002_desc 
 
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
         CALL apjt302_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
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
   
   IF cl_null(g_browser[g_cnt].b_pjdadocno) THEN
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
 
{<section id="apjt302.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION apjt302_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_pjda_m.pjdadocno = g_browser[g_current_idx].b_pjdadocno   
 
   EXECUTE apjt302_master_referesh USING g_pjda_m.pjdadocno INTO g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt, 
       g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002,g_pjda_m.pjdastus,g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp, 
       g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt, 
       g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid,g_pjda_m.pjdapstdt,g_pjda_m.pjdadocno_desc, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002_desc,g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdamodid_desc,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdapstid_desc 
 
   
   CALL apjt302_pjda_t_mask()
   CALL apjt302_show()
      
END FUNCTION
 
{</section>}
 
{<section id="apjt302.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION apjt302_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION apjt302_ui_browser_refresh()
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
      IF g_browser[l_i].b_pjdadocno = g_pjda_m.pjdadocno 
 
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
 
{<section id="apjt302.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION apjt302_construct()
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
   INITIALIZE g_pjda_m.* TO NULL
   CALL g_pjdb_d.clear()        
   CALL g_pjdb2_d.clear() 
 
   
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
      CONSTRUCT BY NAME g_wc ON pjdadocno,pjdadocdt,pjdasite,pjda001,pjda002,pjdastus,pjdaownid,pjdaowndp, 
          pjdacrtid,pjdacrtdp,pjdacrtdt,pjdamodid,pjdamoddt,pjdacnfid,pjdacnfdt,pjdapstid,pjdapstdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<pjdacrtdt>>----
         AFTER FIELD pjdacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<pjdamoddt>>----
         AFTER FIELD pjdamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<pjdacnfdt>>----
         AFTER FIELD pjdacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<pjdapstdt>>----
         AFTER FIELD pjdapstdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.pjdadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdadocno
            #add-point:ON ACTION controlp INFIELD pjdadocno name="construct.c.pjdadocno"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pjdadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdadocno  #顯示到畫面上
            NEXT FIELD pjdadocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdadocno
            #add-point:BEFORE FIELD pjdadocno name="construct.b.pjdadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdadocno
            
            #add-point:AFTER FIELD pjdadocno name="construct.a.pjdadocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdadocdt
            #add-point:BEFORE FIELD pjdadocdt name="construct.b.pjdadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdadocdt
            
            #add-point:AFTER FIELD pjdadocdt name="construct.a.pjdadocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pjdadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdadocdt
            #add-point:ON ACTION controlp INFIELD pjdadocdt name="construct.c.pjdadocdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdasite
            #add-point:BEFORE FIELD pjdasite name="construct.b.pjdasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdasite
            
            #add-point:AFTER FIELD pjdasite name="construct.a.pjdasite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pjdasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdasite
            #add-point:ON ACTION controlp INFIELD pjdasite name="construct.c.pjdasite"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pjda001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjda001
            #add-point:ON ACTION controlp INFIELD pjda001 name="construct.c.pjda001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
           #CALL q_ooag001()             #呼叫開窗               #mark by wanghaoz 2017/07/24 170703-00025#13
            CALL q_ooag001_2()                          #add by wanghaoz 2017/07/24 170703-00025#13
            DISPLAY g_qryparam.return1 TO pjda001  #顯示到畫面上
            NEXT FIELD pjda001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjda001
            #add-point:BEFORE FIELD pjda001 name="construct.b.pjda001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjda001
            
            #add-point:AFTER FIELD pjda001 name="construct.a.pjda001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pjda002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjda002
            #add-point:ON ACTION controlp INFIELD pjda002 name="construct.c.pjda002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjda002  #顯示到畫面上
            NEXT FIELD pjda002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjda002
            #add-point:BEFORE FIELD pjda002 name="construct.b.pjda002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjda002
            
            #add-point:AFTER FIELD pjda002 name="construct.a.pjda002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdastus
            #add-point:BEFORE FIELD pjdastus name="construct.b.pjdastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdastus
            
            #add-point:AFTER FIELD pjdastus name="construct.a.pjdastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pjdastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdastus
            #add-point:ON ACTION controlp INFIELD pjdastus name="construct.c.pjdastus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pjdaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdaownid
            #add-point:ON ACTION controlp INFIELD pjdaownid name="construct.c.pjdaownid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdaownid  #顯示到畫面上
            NEXT FIELD pjdaownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdaownid
            #add-point:BEFORE FIELD pjdaownid name="construct.b.pjdaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdaownid
            
            #add-point:AFTER FIELD pjdaownid name="construct.a.pjdaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pjdaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdaowndp
            #add-point:ON ACTION controlp INFIELD pjdaowndp name="construct.c.pjdaowndp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdaowndp  #顯示到畫面上
            NEXT FIELD pjdaowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdaowndp
            #add-point:BEFORE FIELD pjdaowndp name="construct.b.pjdaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdaowndp
            
            #add-point:AFTER FIELD pjdaowndp name="construct.a.pjdaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pjdacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdacrtid
            #add-point:ON ACTION controlp INFIELD pjdacrtid name="construct.c.pjdacrtid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdacrtid  #顯示到畫面上
            NEXT FIELD pjdacrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdacrtid
            #add-point:BEFORE FIELD pjdacrtid name="construct.b.pjdacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdacrtid
            
            #add-point:AFTER FIELD pjdacrtid name="construct.a.pjdacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pjdacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdacrtdp
            #add-point:ON ACTION controlp INFIELD pjdacrtdp name="construct.c.pjdacrtdp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdacrtdp  #顯示到畫面上
            NEXT FIELD pjdacrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdacrtdp
            #add-point:BEFORE FIELD pjdacrtdp name="construct.b.pjdacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdacrtdp
            
            #add-point:AFTER FIELD pjdacrtdp name="construct.a.pjdacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdacrtdt
            #add-point:BEFORE FIELD pjdacrtdt name="construct.b.pjdacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pjdamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdamodid
            #add-point:ON ACTION controlp INFIELD pjdamodid name="construct.c.pjdamodid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdamodid  #顯示到畫面上
            NEXT FIELD pjdamodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdamodid
            #add-point:BEFORE FIELD pjdamodid name="construct.b.pjdamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdamodid
            
            #add-point:AFTER FIELD pjdamodid name="construct.a.pjdamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdamoddt
            #add-point:BEFORE FIELD pjdamoddt name="construct.b.pjdamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pjdacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdacnfid
            #add-point:ON ACTION controlp INFIELD pjdacnfid name="construct.c.pjdacnfid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdacnfid  #顯示到畫面上
            NEXT FIELD pjdacnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdacnfid
            #add-point:BEFORE FIELD pjdacnfid name="construct.b.pjdacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdacnfid
            
            #add-point:AFTER FIELD pjdacnfid name="construct.a.pjdacnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdacnfdt
            #add-point:BEFORE FIELD pjdacnfdt name="construct.b.pjdacnfdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pjdapstid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdapstid
            #add-point:ON ACTION controlp INFIELD pjdapstid name="construct.c.pjdapstid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdapstid  #顯示到畫面上
            NEXT FIELD pjdapstid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdapstid
            #add-point:BEFORE FIELD pjdapstid name="construct.b.pjdapstid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdapstid
            
            #add-point:AFTER FIELD pjdapstid name="construct.a.pjdapstid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdapstdt
            #add-point:BEFORE FIELD pjdapstdt name="construct.b.pjdapstdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON pjdbseq,pjdb001,pjdb002,pjdb012,pjdb013,pjdb014,pjdb010,pjdb011,pjdb015, 
          pjdb016,pjdb050,pjdbsite,pjdb026,pjdb027,pjdb028,pjdb029,pjdb030,pjdb031,pjdb032,pjdb033,pjdb034, 
          pjdb035,pjdb036,pjdb037,pjdb038,pjdb039,pjdb040,pjdb041,pjdb042,pjdb043,pjdb044,pjdb045,pjdb046, 
          pjdb047,pjdb048,pjdb049,pjdb003,pjdb004,pjdb005,pjdb006,pjdb007,pjdb008,pjdb009
           FROM s_detail1[1].pjdbseq,s_detail1[1].pjdb001,s_detail1[1].pjdb002,s_detail1[1].pjdb012, 
               s_detail1[1].pjdb013,s_detail1[1].pjdb014,s_detail1[1].pjdb010,s_detail1[1].pjdb011,s_detail1[1].pjdb015, 
               s_detail1[1].pjdb016,s_detail1[1].pjdb050,s_detail1[1].pjdbsite,s_detail2[1].pjdb026, 
               s_detail2[1].pjdb027,s_detail2[1].pjdb028,s_detail2[1].pjdb029,s_detail2[1].pjdb030,s_detail2[1].pjdb031, 
               s_detail2[1].pjdb032,s_detail2[1].pjdb033,s_detail2[1].pjdb034,s_detail2[1].pjdb035,s_detail2[1].pjdb036, 
               s_detail2[1].pjdb037,s_detail2[1].pjdb038,s_detail2[1].pjdb039,s_detail2[1].pjdb040,s_detail2[1].pjdb041, 
               s_detail2[1].pjdb042,s_detail2[1].pjdb043,s_detail2[1].pjdb044,s_detail2[1].pjdb045,s_detail2[1].pjdb046, 
               s_detail2[1].pjdb047,s_detail2[1].pjdb048,s_detail2[1].pjdb049,s_detail2[1].pjdb003,s_detail2[1].pjdb004, 
               s_detail2[1].pjdb005,s_detail2[1].pjdb006,s_detail2[1].pjdb007,s_detail2[1].pjdb008,s_detail2[1].pjdb009 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdbseq
            #add-point:BEFORE FIELD pjdbseq name="construct.b.page1.pjdbseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdbseq
            
            #add-point:AFTER FIELD pjdbseq name="construct.a.page1.pjdbseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdbseq
            #add-point:ON ACTION controlp INFIELD pjdbseq name="construct.c.page1.pjdbseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.pjdb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb001
            #add-point:ON ACTION controlp INFIELD pjdb001 name="construct.c.page1.pjdb001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pjba001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdb001  #顯示到畫面上
            NEXT FIELD pjdb001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb001
            #add-point:BEFORE FIELD pjdb001 name="construct.b.page1.pjdb001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb001
            
            #add-point:AFTER FIELD pjdb001 name="construct.a.page1.pjdb001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb002
            #add-point:ON ACTION controlp INFIELD pjdb002 name="construct.c.page1.pjdb002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_pmaa001_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdb002  #顯示到畫面上
            NEXT FIELD pjdb002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb002
            #add-point:BEFORE FIELD pjdb002 name="construct.b.page1.pjdb002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb002
            
            #add-point:AFTER FIELD pjdb002 name="construct.a.page1.pjdb002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb012
            #add-point:BEFORE FIELD pjdb012 name="construct.b.page1.pjdb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb012
            
            #add-point:AFTER FIELD pjdb012 name="construct.a.page1.pjdb012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb012
            #add-point:ON ACTION controlp INFIELD pjdb012 name="construct.c.page1.pjdb012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb013
            #add-point:BEFORE FIELD pjdb013 name="construct.b.page1.pjdb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb013
            
            #add-point:AFTER FIELD pjdb013 name="construct.a.page1.pjdb013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb013
            #add-point:ON ACTION controlp INFIELD pjdb013 name="construct.c.page1.pjdb013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb014
            #add-point:BEFORE FIELD pjdb014 name="construct.b.page1.pjdb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb014
            
            #add-point:AFTER FIELD pjdb014 name="construct.a.page1.pjdb014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb014
            #add-point:ON ACTION controlp INFIELD pjdb014 name="construct.c.page1.pjdb014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb010
            #add-point:BEFORE FIELD pjdb010 name="construct.b.page1.pjdb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb010
            
            #add-point:AFTER FIELD pjdb010 name="construct.a.page1.pjdb010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb010
            #add-point:ON ACTION controlp INFIELD pjdb010 name="construct.c.page1.pjdb010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb011
            #add-point:BEFORE FIELD pjdb011 name="construct.b.page1.pjdb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb011
            
            #add-point:AFTER FIELD pjdb011 name="construct.a.page1.pjdb011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb011
            #add-point:ON ACTION controlp INFIELD pjdb011 name="construct.c.page1.pjdb011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb015
            #add-point:BEFORE FIELD pjdb015 name="construct.b.page1.pjdb015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb015
            
            #add-point:AFTER FIELD pjdb015 name="construct.a.page1.pjdb015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb015
            #add-point:ON ACTION controlp INFIELD pjdb015 name="construct.c.page1.pjdb015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb016
            #add-point:BEFORE FIELD pjdb016 name="construct.b.page1.pjdb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb016
            
            #add-point:AFTER FIELD pjdb016 name="construct.a.page1.pjdb016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb016
            #add-point:ON ACTION controlp INFIELD pjdb016 name="construct.c.page1.pjdb016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb050
            #add-point:BEFORE FIELD pjdb050 name="construct.b.page1.pjdb050"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb050
            
            #add-point:AFTER FIELD pjdb050 name="construct.a.page1.pjdb050"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdb050
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb050
            #add-point:ON ACTION controlp INFIELD pjdb050 name="construct.c.page1.pjdb050"
            #此段落由子樣板a08產生
            #開窗c段
   			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
   			LET g_qryparam.arg1 = '1'
   			LET g_qryparam.where = " xmdk002 <> '8' "
			
            CALL q_xmdkdocno_2()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdb050  #顯示到畫面上

            NEXT FIELD pjdb050                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdbsite
            #add-point:BEFORE FIELD pjdbsite name="construct.b.page1.pjdbsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdbsite
            
            #add-point:AFTER FIELD pjdbsite name="construct.a.page1.pjdbsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pjdbsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdbsite
            #add-point:ON ACTION controlp INFIELD pjdbsite name="construct.c.page1.pjdbsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb026
            #add-point:BEFORE FIELD pjdb026 name="construct.b.page2.pjdb026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb026
            
            #add-point:AFTER FIELD pjdb026 name="construct.a.page2.pjdb026"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb026
            #add-point:ON ACTION controlp INFIELD pjdb026 name="construct.c.page2.pjdb026"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb027
            #add-point:BEFORE FIELD pjdb027 name="construct.b.page2.pjdb027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb027
            
            #add-point:AFTER FIELD pjdb027 name="construct.a.page2.pjdb027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb027
            #add-point:ON ACTION controlp INFIELD pjdb027 name="construct.c.page2.pjdb027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb028
            #add-point:BEFORE FIELD pjdb028 name="construct.b.page2.pjdb028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb028
            
            #add-point:AFTER FIELD pjdb028 name="construct.a.page2.pjdb028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb028
            #add-point:ON ACTION controlp INFIELD pjdb028 name="construct.c.page2.pjdb028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb029
            #add-point:BEFORE FIELD pjdb029 name="construct.b.page2.pjdb029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb029
            
            #add-point:AFTER FIELD pjdb029 name="construct.a.page2.pjdb029"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb029
            #add-point:ON ACTION controlp INFIELD pjdb029 name="construct.c.page2.pjdb029"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb030
            #add-point:BEFORE FIELD pjdb030 name="construct.b.page2.pjdb030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb030
            
            #add-point:AFTER FIELD pjdb030 name="construct.a.page2.pjdb030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb030
            #add-point:ON ACTION controlp INFIELD pjdb030 name="construct.c.page2.pjdb030"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb031
            #add-point:BEFORE FIELD pjdb031 name="construct.b.page2.pjdb031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb031
            
            #add-point:AFTER FIELD pjdb031 name="construct.a.page2.pjdb031"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb031
            #add-point:ON ACTION controlp INFIELD pjdb031 name="construct.c.page2.pjdb031"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb032
            #add-point:BEFORE FIELD pjdb032 name="construct.b.page2.pjdb032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb032
            
            #add-point:AFTER FIELD pjdb032 name="construct.a.page2.pjdb032"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb032
            #add-point:ON ACTION controlp INFIELD pjdb032 name="construct.c.page2.pjdb032"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb033
            #add-point:BEFORE FIELD pjdb033 name="construct.b.page2.pjdb033"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb033
            
            #add-point:AFTER FIELD pjdb033 name="construct.a.page2.pjdb033"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb033
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb033
            #add-point:ON ACTION controlp INFIELD pjdb033 name="construct.c.page2.pjdb033"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb034
            #add-point:BEFORE FIELD pjdb034 name="construct.b.page2.pjdb034"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb034
            
            #add-point:AFTER FIELD pjdb034 name="construct.a.page2.pjdb034"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb034
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb034
            #add-point:ON ACTION controlp INFIELD pjdb034 name="construct.c.page2.pjdb034"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb035
            #add-point:BEFORE FIELD pjdb035 name="construct.b.page2.pjdb035"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb035
            
            #add-point:AFTER FIELD pjdb035 name="construct.a.page2.pjdb035"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb035
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb035
            #add-point:ON ACTION controlp INFIELD pjdb035 name="construct.c.page2.pjdb035"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb036
            #add-point:BEFORE FIELD pjdb036 name="construct.b.page2.pjdb036"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb036
            
            #add-point:AFTER FIELD pjdb036 name="construct.a.page2.pjdb036"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb036
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb036
            #add-point:ON ACTION controlp INFIELD pjdb036 name="construct.c.page2.pjdb036"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb037
            #add-point:BEFORE FIELD pjdb037 name="construct.b.page2.pjdb037"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb037
            
            #add-point:AFTER FIELD pjdb037 name="construct.a.page2.pjdb037"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb037
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb037
            #add-point:ON ACTION controlp INFIELD pjdb037 name="construct.c.page2.pjdb037"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb038
            #add-point:BEFORE FIELD pjdb038 name="construct.b.page2.pjdb038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb038
            
            #add-point:AFTER FIELD pjdb038 name="construct.a.page2.pjdb038"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb038
            #add-point:ON ACTION controlp INFIELD pjdb038 name="construct.c.page2.pjdb038"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb039
            #add-point:BEFORE FIELD pjdb039 name="construct.b.page2.pjdb039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb039
            
            #add-point:AFTER FIELD pjdb039 name="construct.a.page2.pjdb039"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb039
            #add-point:ON ACTION controlp INFIELD pjdb039 name="construct.c.page2.pjdb039"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb040
            #add-point:BEFORE FIELD pjdb040 name="construct.b.page2.pjdb040"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb040
            
            #add-point:AFTER FIELD pjdb040 name="construct.a.page2.pjdb040"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb040
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb040
            #add-point:ON ACTION controlp INFIELD pjdb040 name="construct.c.page2.pjdb040"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb041
            #add-point:BEFORE FIELD pjdb041 name="construct.b.page2.pjdb041"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb041
            
            #add-point:AFTER FIELD pjdb041 name="construct.a.page2.pjdb041"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb041
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb041
            #add-point:ON ACTION controlp INFIELD pjdb041 name="construct.c.page2.pjdb041"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb042
            #add-point:BEFORE FIELD pjdb042 name="construct.b.page2.pjdb042"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb042
            
            #add-point:AFTER FIELD pjdb042 name="construct.a.page2.pjdb042"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb042
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb042
            #add-point:ON ACTION controlp INFIELD pjdb042 name="construct.c.page2.pjdb042"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb043
            #add-point:BEFORE FIELD pjdb043 name="construct.b.page2.pjdb043"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb043
            
            #add-point:AFTER FIELD pjdb043 name="construct.a.page2.pjdb043"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb043
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb043
            #add-point:ON ACTION controlp INFIELD pjdb043 name="construct.c.page2.pjdb043"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb044
            #add-point:BEFORE FIELD pjdb044 name="construct.b.page2.pjdb044"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb044
            
            #add-point:AFTER FIELD pjdb044 name="construct.a.page2.pjdb044"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb044
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb044
            #add-point:ON ACTION controlp INFIELD pjdb044 name="construct.c.page2.pjdb044"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb045
            #add-point:BEFORE FIELD pjdb045 name="construct.b.page2.pjdb045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb045
            
            #add-point:AFTER FIELD pjdb045 name="construct.a.page2.pjdb045"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb045
            #add-point:ON ACTION controlp INFIELD pjdb045 name="construct.c.page2.pjdb045"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb046
            #add-point:BEFORE FIELD pjdb046 name="construct.b.page2.pjdb046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb046
            
            #add-point:AFTER FIELD pjdb046 name="construct.a.page2.pjdb046"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb046
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb046
            #add-point:ON ACTION controlp INFIELD pjdb046 name="construct.c.page2.pjdb046"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb047
            #add-point:BEFORE FIELD pjdb047 name="construct.b.page2.pjdb047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb047
            
            #add-point:AFTER FIELD pjdb047 name="construct.a.page2.pjdb047"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb047
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb047
            #add-point:ON ACTION controlp INFIELD pjdb047 name="construct.c.page2.pjdb047"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb048
            #add-point:BEFORE FIELD pjdb048 name="construct.b.page2.pjdb048"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb048
            
            #add-point:AFTER FIELD pjdb048 name="construct.a.page2.pjdb048"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb048
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb048
            #add-point:ON ACTION controlp INFIELD pjdb048 name="construct.c.page2.pjdb048"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb049
            #add-point:BEFORE FIELD pjdb049 name="construct.b.page2.pjdb049"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb049
            
            #add-point:AFTER FIELD pjdb049 name="construct.a.page2.pjdb049"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb049
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb049
            #add-point:ON ACTION controlp INFIELD pjdb049 name="construct.c.page2.pjdb049"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.pjdb003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb003
            #add-point:ON ACTION controlp INFIELD pjdb003 name="construct.c.page2.pjdb003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmad002_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdb003  #顯示到畫面上
            NEXT FIELD pjdb003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb003
            #add-point:BEFORE FIELD pjdb003 name="construct.b.page2.pjdb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb003
            
            #add-point:AFTER FIELD pjdb003 name="construct.a.page2.pjdb003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb004
            #add-point:ON ACTION controlp INFIELD pjdb004 name="construct.c.page2.pjdb004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '238'    #161109-00032#5 add
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdb004  #顯示到畫面上
            NEXT FIELD pjdb004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb004
            #add-point:BEFORE FIELD pjdb004 name="construct.b.page2.pjdb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb004
            
            #add-point:AFTER FIELD pjdb004 name="construct.a.page2.pjdb004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb005
            #add-point:ON ACTION controlp INFIELD pjdb005 name="construct.c.page2.pjdb005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooaj002_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdb005  #顯示到畫面上
            NEXT FIELD pjdb005                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb005
            #add-point:BEFORE FIELD pjdb005 name="construct.b.page2.pjdb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb005
            
            #add-point:AFTER FIELD pjdb005 name="construct.a.page2.pjdb005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb006
            #add-point:BEFORE FIELD pjdb006 name="construct.b.page2.pjdb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb006
            
            #add-point:AFTER FIELD pjdb006 name="construct.a.page2.pjdb006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb006
            #add-point:ON ACTION controlp INFIELD pjdb006 name="construct.c.page2.pjdb006"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdb006  #顯示到畫面上
            NEXT FIELD pjdb006                     #返回原欄位
    



            #END add-point
 
 
         #Ctrlp:construct.c.page2.pjdb007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb007
            #add-point:ON ACTION controlp INFIELD pjdb007 name="construct.c.page2.pjdb007"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pjdb007  #顯示到畫面上
            NEXT FIELD pjdb007                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb007
            #add-point:BEFORE FIELD pjdb007 name="construct.b.page2.pjdb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb007
            
            #add-point:AFTER FIELD pjdb007 name="construct.a.page2.pjdb007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb008
            #add-point:BEFORE FIELD pjdb008 name="construct.b.page2.pjdb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb008
            
            #add-point:AFTER FIELD pjdb008 name="construct.a.page2.pjdb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb008
            #add-point:ON ACTION controlp INFIELD pjdb008 name="construct.c.page2.pjdb008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb009
            #add-point:BEFORE FIELD pjdb009 name="construct.b.page2.pjdb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb009
            
            #add-point:AFTER FIELD pjdb009 name="construct.a.page2.pjdb009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.pjdb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb009
            #add-point:ON ACTION controlp INFIELD pjdb009 name="construct.c.page2.pjdb009"
            
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
                  WHEN la_wc[li_idx].tableid = "pjda_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "pjdb_t" 
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
 
{<section id="apjt302.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION apjt302_filter()
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
      CONSTRUCT g_wc_filter ON pjdadocno,pjdadocdt,pjda001,pjda002
                          FROM s_browse[1].b_pjdadocno,s_browse[1].b_pjdadocdt,s_browse[1].b_pjda001, 
                              s_browse[1].b_pjda002
 
         BEFORE CONSTRUCT
               DISPLAY apjt302_filter_parser('pjdadocno') TO s_browse[1].b_pjdadocno
            DISPLAY apjt302_filter_parser('pjdadocdt') TO s_browse[1].b_pjdadocdt
            DISPLAY apjt302_filter_parser('pjda001') TO s_browse[1].b_pjda001
            DISPLAY apjt302_filter_parser('pjda002') TO s_browse[1].b_pjda002
      
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
 
      CALL apjt302_filter_show('pjdadocno')
   CALL apjt302_filter_show('pjdadocdt')
   CALL apjt302_filter_show('pjda001')
   CALL apjt302_filter_show('pjda002')
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION apjt302_filter_parser(ps_field)
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
 
{<section id="apjt302.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION apjt302_filter_show(ps_field)
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
   LET ls_condition = apjt302_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION apjt302_query()
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
   CALL g_pjdb_d.clear()
   CALL g_pjdb2_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL apjt302_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL apjt302_browser_fill("")
      CALL apjt302_fetch("")
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
   LET g_detail_idx_list[2] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL apjt302_filter_show('pjdadocno')
   CALL apjt302_filter_show('pjdadocdt')
   CALL apjt302_filter_show('pjda001')
   CALL apjt302_filter_show('pjda002')
   CALL apjt302_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL apjt302_fetch("F") 
      #顯示單身筆數
      CALL apjt302_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION apjt302_fetch(p_flag)
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
   
   LET g_pjda_m.pjdadocno = g_browser[g_current_idx].b_pjdadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE apjt302_master_referesh USING g_pjda_m.pjdadocno INTO g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt, 
       g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002,g_pjda_m.pjdastus,g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp, 
       g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt, 
       g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid,g_pjda_m.pjdapstdt,g_pjda_m.pjdadocno_desc, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002_desc,g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdamodid_desc,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdapstid_desc 
 
   
   #遮罩相關處理
   LET g_pjda_m_mask_o.* =  g_pjda_m.*
   CALL apjt302_pjda_t_mask()
   LET g_pjda_m_mask_n.* =  g_pjda_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL apjt302_set_act_visible()   
   CALL apjt302_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_pjda_m_t.* = g_pjda_m.*
   LET g_pjda_m_o.* = g_pjda_m.*
   
   LET g_data_owner = g_pjda_m.pjdaownid      
   LET g_data_dept  = g_pjda_m.pjdaowndp
   
   #重新顯示   
   CALL apjt302_show()
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.insert" >}
#+ 資料新增
PRIVATE FUNCTION apjt302_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_pjdb_d.clear()   
   CALL g_pjdb2_d.clear()  
 
 
   INITIALIZE g_pjda_m.* TO NULL             #DEFAULT 設定
   
   LET g_pjdadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_pjda_m.pjdaownid = g_user
      LET g_pjda_m.pjdaowndp = g_dept
      LET g_pjda_m.pjdacrtid = g_user
      LET g_pjda_m.pjdacrtdp = g_dept 
      LET g_pjda_m.pjdacrtdt = cl_get_current()
      LET g_pjda_m.pjdamodid = g_user
      LET g_pjda_m.pjdamoddt = cl_get_current()
      LET g_pjda_m.pjdastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      LET g_pjda_m.pjda001 = g_user
      LET g_pjda_m.pjda002 = g_dept
      LET g_pjda_m.pjdasite = g_site
      LET g_pjda_m.pjdadocdt = cl_get_current()
      CALL s_desc_get_person_desc(g_pjda_m.pjda001) RETURNING g_pjda_m.pjda001_desc
      CALL s_desc_get_department_desc(g_pjda_m.pjda002) RETURNING g_pjda_m.pjda002_desc
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_pjda_m_t.* = g_pjda_m.*
      LET g_pjda_m_o.* = g_pjda_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_pjda_m.pjdastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL apjt302_input("a")
      
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
         INITIALIZE g_pjda_m.* TO NULL
         INITIALIZE g_pjdb_d TO NULL
         INITIALIZE g_pjdb2_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL apjt302_show()
         CALL apjt302_idx_chk()   #(ver:83)
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_pjdb_d.clear()
      #CALL g_pjdb2_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL apjt302_set_act_visible()   
   CALL apjt302_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_pjdadocno_t = g_pjda_m.pjdadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " pjdaent = " ||g_enterprise|| " AND",
                      " pjdadocno = '", g_pjda_m.pjdadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL apjt302_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE apjt302_cl
   
   CALL apjt302_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE apjt302_master_referesh USING g_pjda_m.pjdadocno INTO g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt, 
       g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002,g_pjda_m.pjdastus,g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp, 
       g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt, 
       g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid,g_pjda_m.pjdapstdt,g_pjda_m.pjdadocno_desc, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002_desc,g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdamodid_desc,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdapstid_desc 
 
   
   
   #遮罩相關處理
   LET g_pjda_m_mask_o.* =  g_pjda_m.*
   CALL apjt302_pjda_t_mask()
   LET g_pjda_m_mask_n.* =  g_pjda_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_pjda_m.pjdadocno,g_pjda_m.pjdadocno_desc,g_pjda_m.pjdadocdt,g_pjda_m.pjdasite,g_pjda_m.pjda001, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002,g_pjda_m.pjda002_desc,g_pjda_m.pjdastus,g_pjda_m.pjdaownid, 
       g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamodid_desc, 
       g_pjda_m.pjdamoddt,g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid, 
       g_pjda_m.pjdapstid_desc,g_pjda_m.pjdapstdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_pjda_m.pjdaownid      
   LET g_data_dept  = g_pjda_m.pjdaowndp
   
   #功能已完成,通報訊息中心
   CALL apjt302_msgcentre_notify('insert')
   
   CALL apjt302_idx_chk()   #(ver:83)
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.modify" >}
#+ 資料修改
PRIVATE FUNCTION apjt302_modify()
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
   LET g_pjda_m_t.* = g_pjda_m.*
   LET g_pjda_m_o.* = g_pjda_m.*
   
   IF g_pjda_m.pjdadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_pjdadocno_t = g_pjda_m.pjdadocno
 
   CALL s_transaction_begin()
   
   OPEN apjt302_cl USING g_enterprise,g_pjda_m.pjdadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN apjt302_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE apjt302_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE apjt302_master_referesh USING g_pjda_m.pjdadocno INTO g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt, 
       g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002,g_pjda_m.pjdastus,g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp, 
       g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt, 
       g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid,g_pjda_m.pjdapstdt,g_pjda_m.pjdadocno_desc, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002_desc,g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdamodid_desc,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdapstid_desc 
 
   
   #檢查是否允許此動作
   IF NOT apjt302_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_pjda_m_mask_o.* =  g_pjda_m.*
   CALL apjt302_pjda_t_mask()
   LET g_pjda_m_mask_n.* =  g_pjda_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL apjt302_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_pjdadocno_t = g_pjda_m.pjdadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_pjda_m.pjdamodid = g_user 
LET g_pjda_m.pjdamoddt = cl_get_current()
LET g_pjda_m.pjdamodid_desc = cl_get_username(g_pjda_m.pjdamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL apjt302_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE pjda_t SET (pjdamodid,pjdamoddt) = (g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt)
          WHERE pjdaent = g_enterprise AND pjdadocno = g_pjdadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_pjda_m.* = g_pjda_m_t.*
         #  CALL apjt302_show()   #(ver:83)
         END IF
         CALL apjt302_show()   #(ver:83)
         CALL apjt302_idx_chk()   #(ver:83)
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_pjda_m.pjdadocno != g_pjda_m_t.pjdadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE pjdb_t SET pjdbdocno = g_pjda_m.pjdadocno
 
          WHERE pjdbent = g_enterprise AND pjdbdocno = g_pjda_m_t.pjdadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "pjdb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "pjdb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
 
         
 
         
         #UPDATE 多語言table key值
         
            #161130-00056 add
         
            #161130-00056 add
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL apjt302_set_act_visible()   
   CALL apjt302_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " pjdaent = " ||g_enterprise|| " AND",
                      " pjdadocno = '", g_pjda_m.pjdadocno, "' "
 
   #填到對應位置
   CALL apjt302_browser_fill("")
 
   CLOSE apjt302_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL apjt302_msgcentre_notify('modify')
   
   CALL apjt302_idx_chk() #ver:83
 
END FUNCTION 
 
{</section>}
 
{<section id="apjt302.input" >}
#+ 資料輸入
PRIVATE FUNCTION apjt302_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
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
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_sql1                 STRING   #160711-00040#23 add
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
   DISPLAY BY NAME g_pjda_m.pjdadocno,g_pjda_m.pjdadocno_desc,g_pjda_m.pjdadocdt,g_pjda_m.pjdasite,g_pjda_m.pjda001, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002,g_pjda_m.pjda002_desc,g_pjda_m.pjdastus,g_pjda_m.pjdaownid, 
       g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamodid_desc, 
       g_pjda_m.pjdamoddt,g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid, 
       g_pjda_m.pjdapstid_desc,g_pjda_m.pjdapstdt
   
   #ver:82
   #清空單身條件
   LET g_wc2 = " 1=1"
   LET g_wc2_table1 = " 1=1 "
 
   #CALL apjt302_b_fill()
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
   LET g_forupd_sql = "SELECT pjdbseq,pjdb001,pjdb002,pjdb012,pjdb013,pjdb014,pjdb010,pjdb011,pjdb015, 
       pjdb016,pjdb050,pjdbsite,pjdbseq,pjdb026,pjdb027,pjdb028,pjdb029,pjdb030,pjdb031,pjdb032,pjdb033, 
       pjdb034,pjdb035,pjdb036,pjdb037,pjdb038,pjdb039,pjdb040,pjdb041,pjdb042,pjdb043,pjdb044,pjdb045, 
       pjdb046,pjdb047,pjdb048,pjdb049,pjdb003,pjdb004,pjdb005,pjdb006,pjdb007,pjdb008,pjdb009 FROM  
       pjdb_t WHERE pjdbent=? AND pjdbdocno=? AND pjdbseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE apjt302_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL apjt302_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL apjt302_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt,g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002, 
       g_pjda_m.pjdastus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   LET g_errshow = 1
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="apjt302.input.head" >}
      #單頭段
      INPUT BY NAME g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt,g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002, 
          g_pjda_m.pjdastus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN apjt302_cl USING g_enterprise,g_pjda_m.pjdadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN apjt302_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE apjt302_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL apjt302_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL apjt302_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdadocno
            
            #add-point:AFTER FIELD pjdadocno name="input.a.pjdadocno"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            CALL s_aooi200_get_slip_desc(g_pjda_m.pjdadocno) RETURNING g_pjda_m.pjdadocno_desc
            DISPLAY BY NAME g_pjda_m.pjdadocno_desc            
            IF NOT cl_null(g_pjda_m.pjdadocno) THEN 
               CALL s_aooi200_chk_docno(g_site,g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt,g_prog) RETURNING l_success
               IF NOT l_success THEN
                  LET g_pjda_m.pjdadocno = g_pjda_m_t.pjdadocno
                  NEXT FIELD CURRENT
               END IF
            ELSE   
               NEXT FIELD CURRENT   
            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdadocno
            #add-point:BEFORE FIELD pjdadocno name="input.b.pjdadocno"
            CALL s_aooi200_get_slip_desc(g_pjda_m.pjdadocno) RETURNING g_pjda_m.pjdadocno_desc
            DISPLAY BY NAME g_pjda_m.pjdadocno_desc 
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdadocno
            #add-point:ON CHANGE pjdadocno name="input.g.pjdadocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdadocdt
            #add-point:BEFORE FIELD pjdadocdt name="input.b.pjdadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdadocdt
            
            #add-point:AFTER FIELD pjdadocdt name="input.a.pjdadocdt"
            IF cl_null(g_pjda_m.pjdadocdt) THEN 
               NEXT FIELD pjdadocdt
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdadocdt
            #add-point:ON CHANGE pjdadocdt name="input.g.pjdadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdasite
            #add-point:BEFORE FIELD pjdasite name="input.b.pjdasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdasite
            
            #add-point:AFTER FIELD pjdasite name="input.a.pjdasite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdasite
            #add-point:ON CHANGE pjdasite name="input.g.pjdasite"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjda001
            
            #add-point:AFTER FIELD pjda001 name="input.a.pjda001"
            CALL s_desc_get_person_desc(g_pjda_m.pjda001) RETURNING g_pjda_m.pjda001_desc
            DISPLAY BY NAME g_pjda_m.pjda001_desc
            IF NOT cl_null(g_pjda_m.pjda001) THEN
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_pjda_m.pjda001 != g_pjda_m_t.pjda001 OR cl_null(g_pjda_m_t.pjda001))) THEN   #160824-00007#332 170116 by lori mark
              #IF g_pjda_m.pjda001 != g_pjda_m_o.pjda001 OR cl_null(g_pjda_m_o.pjda001) THEN        #160824-00007#332 170116 by lori add       #mark by wanghaoz 2017/07/24 170703-00025#13
               IF p_cmd = 'a' OR (g_pjda_m.pjda001 != g_pjda_m_o.pjda001 OR cl_null(g_pjda_m_o.pjda001)) THEN             #add by wanghaoz 2017/07/24 170703-00025#13
                  #此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL                
                  LET g_errshow = TRUE #是否開窗 #160318-00025#31  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_pjda_m.pjda001
                  LET g_chkparam.arg2 = g_site               #add by wanghaoz 2017/07/24 170703-00025#13
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#31  add
                  #呼叫檢查存在並帶值的library
                 #IF cl_chk_exist("v_ooag001") THEN       #mark by wanghaoz 2017/07/24 170703-00025#13
                  IF cl_chk_exist("v_ooag001_6") THEN          #add by wanghaoz 2017/07/24 170703-00025#13
                     SELECT ooag003 INTO g_pjda_m.pjda002 FROM ooag_t WHERE ooagent = g_enterprise AND ooag001 = g_pjda_m.pjda001
                     CALL s_desc_get_department_desc(g_pjda_m.pjda002) RETURNING g_pjda_m.pjda002_desc
                     
                     DISPLAY BY NAME g_pjda_m.pjda002,g_pjda_m.pjda002_desc   #160824-00007#332 170116 by lori add
                  ELSE
                     #檢查失敗時後續處理
                    #160824-00007#332 170116 by lori mod---(S)
                    #LET g_pjda_m.pjda001 = g_pjda_m_t.pjda001   
                     LET g_pjda_m.pjda001 = g_pjda_m_o.pjda001   
                     CALL s_desc_get_person_desc(g_pjda_m.pjda001) RETURNING g_pjda_m.pjda001_desc
                     
                     DISPLAY BY NAME g_pjda_m.pjda001,g_pjda_m.pjda001_desc
                    #160824-00007#332 170116 by lori mod---(E)
                     NEXT FIELD CURRENT
                  END IF
               
                  CALL s_desc_get_person_desc(g_pjda_m.pjda001) RETURNING g_pjda_m.pjda001_desc
                  DISPLAY BY NAME g_pjda_m.pjda001_desc 
               END IF
            END IF 
            
            #160824-00007#332 170116 by lori add---(S)           
            LET g_pjda_m_o.pjda001 = g_pjda_m.pjda001
            LET g_pjda_m_o.pjda002 = g_pjda_m.pjda002
            #160824-00007#332 170116 by lori add---(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjda001
            #add-point:BEFORE FIELD pjda001 name="input.b.pjda001"
            CALL s_desc_get_person_desc(g_pjda_m.pjda001) RETURNING g_pjda_m.pjda001_desc
            DISPLAY BY NAME g_pjda_m.pjda001_desc
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjda001
            #add-point:ON CHANGE pjda001 name="input.g.pjda001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjda002
            
            #add-point:AFTER FIELD pjda002 name="input.a.pjda002"
            CALL s_desc_get_department_desc(g_pjda_m.pjda002) RETURNING g_pjda_m.pjda002_desc
            DISPLAY BY NAME g_pjda_m.pjda002_desc
            IF NOT cl_null(g_pjda_m.pjda002) THEN 
               IF g_pjda_m.pjda002 <> g_pjda_m_o.pjda002 OR cl_null(g_pjda_m_o.pjda002) THEN   #160824-00007#332 by lori add
                  #此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#31  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_pjda_m.pjda002
                  LET g_chkparam.arg2 = g_pjda_m.pjdadocdt
                  LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#31  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooeg001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
                  
                  ELSE
                     #檢查失敗時後續處理
                    #160824-00007#332 170116 by lori mod---(S) 
                    #LET g_pjda_m.pjda002 = g_pjda_m_t.pjda002                 
                     LET g_pjda_m.pjda002 = g_pjda_m_o.pjda002
                     CALL s_desc_get_department_desc(g_pjda_m.pjda002) RETURNING g_pjda_m.pjda002_desc

                     DISPLAY BY NAME g_pjda_m.pjda002,g_pjda_m.pjda002_desc
                    #160824-00007#332 170116 by lori mod---(E)
                     NEXT FIELD CURRENT
                  END IF
               END IF   #160824-00007#332 170116 by lori add   
            END IF 

            #160824-00007#332 170116 by lori add---(S)
            CALL s_desc_get_department_desc(g_pjda_m.pjda002) RETURNING g_pjda_m.pjda002_desc
            DISPLAY BY NAME g_pjda_m.pjda002_desc
            
            LET g_pjda_m_o.pjda002 = g_pjda_m.pjda002   
            #160824-00007#332 170116 by lori add---(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjda002
            #add-point:BEFORE FIELD pjda002 name="input.b.pjda002"
            CALL s_desc_get_department_desc(g_pjda_m.pjda002) RETURNING g_pjda_m.pjda002_desc
            DISPLAY BY NAME g_pjda_m.pjda002_desc
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjda002
            #add-point:ON CHANGE pjda002 name="input.g.pjda002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdastus
            #add-point:BEFORE FIELD pjdastus name="input.b.pjdastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdastus
            
            #add-point:AFTER FIELD pjdastus name="input.a.pjdastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdastus
            #add-point:ON CHANGE pjdastus name="input.g.pjdastus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.pjdadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdadocno
            #add-point:ON ACTION controlp INFIELD pjdadocno name="input.c.pjdadocno"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pjda_m.pjdadocno             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_ooef004
            #LET g_qryparam.arg2 = 'apjt302'     #160705-00042#4 160711 by sakura mark
            LET g_qryparam.arg2 = g_prog         #160705-00042#4 160711 by sakura add
            #160711-00040#23 add(s)
            CALL s_control_get_docno_sql(g_user,g_dept)
                RETURNING l_success,l_sql1
            IF NOT cl_null(l_sql1) THEN
               LET g_qryparam.where = l_sql1
            END IF
            #160711-00040#23 add(e)
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_pjda_m.pjdadocno = g_qryparam.return1              

            DISPLAY g_pjda_m.pjdadocno TO pjdadocno              #

            NEXT FIELD pjdadocno                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.pjdadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdadocdt
            #add-point:ON ACTION controlp INFIELD pjdadocdt name="input.c.pjdadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.pjdasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdasite
            #add-point:ON ACTION controlp INFIELD pjdasite name="input.c.pjdasite"
            
            #END add-point
 
 
         #Ctrlp:input.c.pjda001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjda001
            #add-point:ON ACTION controlp INFIELD pjda001 name="input.c.pjda001"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pjda_m.pjda001             #給予default值

           #CALL q_ooag001()             #呼叫開窗               #mark by wanghaoz 2017/07/24 170703-00025#13
            CALL q_ooag001_2()                          #add by wanghaoz 2017/07/24 170703-00025#13

            LET g_pjda_m.pjda001 = g_qryparam.return1              

            DISPLAY g_pjda_m.pjda001 TO pjda001              #

            NEXT FIELD pjda001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.pjda002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjda002
            #add-point:ON ACTION controlp INFIELD pjda002 name="input.c.pjda002"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pjda_m.pjda002             #給予default值
            LET g_qryparam.default2 = "" #g_pjda_m.ooefl003 #說明(簡稱)
            #給予arg
            LET g_qryparam.arg1 = g_today


            CALL q_ooeg001()                                #呼叫開窗

            LET g_pjda_m.pjda002 = g_qryparam.return1              
            #LET g_pjda_m.ooefl003 = g_qryparam.return2 
            DISPLAY g_pjda_m.pjda002 TO pjda002              #
            #DISPLAY g_pjda_m.ooefl003 TO ooefl003 #說明(簡稱)
            NEXT FIELD pjda002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.pjdastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdastus
            #add-point:ON ACTION controlp INFIELD pjdastus name="input.c.pjdastus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_pjda_m.pjdadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            #add wanghaoz 2017/07/24 #170703-00025#13--(s)
            IF NOT cl_null(g_pjda_m.pjda001) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗
               LET g_chkparam.arg1 = g_pjda_m.pjda001
               LET g_chkparam.arg2 = g_site
               LET g_chkparam.err_str[1] ="aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
               IF NOT cl_chk_exist("v_ooag001_6") THEN
                  LET g_pjda_m.pjda001 = g_pjda_m_o.pjda001
                  CALL s_desc_get_person_desc(g_pjda_m.pjda001)RETURNING g_pjda_m.pjda001_desc
                  DISPLAY BY NAME g_pjda_m.pjda001
                  NEXT FIELD pjda001
               END IF
            END IF
            #add wanghaoz 2017/07/24 #170703-00025#13--(e)
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt,g_prog) RETURNING l_success,g_pjda_m.pjdadocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_pjda_m.pjdadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                
                  NEXT FIELD pjdadocno
               END IF
               #end add-point
               
               INSERT INTO pjda_t (pjdaent,pjdadocno,pjdadocdt,pjdasite,pjda001,pjda002,pjdastus,pjdaownid, 
                   pjdaowndp,pjdacrtid,pjdacrtdp,pjdacrtdt,pjdamodid,pjdamoddt,pjdacnfid,pjdacnfdt,pjdapstid, 
                   pjdapstdt)
               VALUES (g_enterprise,g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt,g_pjda_m.pjdasite,g_pjda_m.pjda001, 
                   g_pjda_m.pjda002,g_pjda_m.pjdastus,g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp,g_pjda_m.pjdacrtid, 
                   g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt,g_pjda_m.pjdacnfid, 
                   g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid,g_pjda_m.pjdapstdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_pjda_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               
               #end add-point
               
               
               
                  #161130-00056
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL apjt302_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL apjt302_b_fill()
                  CALL apjt302_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL apjt302_pjda_t_mask_restore('restore_mask_o')
               
               UPDATE pjda_t SET (pjdadocno,pjdadocdt,pjdasite,pjda001,pjda002,pjdastus,pjdaownid,pjdaowndp, 
                   pjdacrtid,pjdacrtdp,pjdacrtdt,pjdamodid,pjdamoddt,pjdacnfid,pjdacnfdt,pjdapstid,pjdapstdt) = (g_pjda_m.pjdadocno, 
                   g_pjda_m.pjdadocdt,g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002,g_pjda_m.pjdastus, 
                   g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp,g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt, 
                   g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt,g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid, 
                   g_pjda_m.pjdapstdt)
                WHERE pjdaent = g_enterprise AND pjdadocno = g_pjdadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "pjda_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
                  #161130-00056
               
               #將遮罩欄位進行遮蔽
               CALL apjt302_pjda_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_pjda_m_t)
               LET g_log2 = util.JSON.stringify(g_pjda_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_pjdadocno_t = g_pjda_m.pjdadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="apjt302.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_pjdb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_pjdb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL apjt302_b_fill() #ver:82
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1','2',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_pjdb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            
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
            OPEN apjt302_cl USING g_enterprise,g_pjda_m.pjdadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN apjt302_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE apjt302_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_pjdb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_pjdb_d[l_ac].pjdbseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_pjdb_d_t.* = g_pjdb_d[l_ac].*  #BACKUP
               LET g_pjdb_d_o.* = g_pjdb_d[l_ac].*  #BACKUP
               CALL apjt302_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL apjt302_set_no_entry_b(l_cmd)
               IF NOT apjt302_lock_b("pjdb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH apjt302_bcl INTO g_pjdb_d[l_ac].pjdbseq,g_pjdb_d[l_ac].pjdb001,g_pjdb_d[l_ac].pjdb002, 
                      g_pjdb_d[l_ac].pjdb012,g_pjdb_d[l_ac].pjdb013,g_pjdb_d[l_ac].pjdb014,g_pjdb_d[l_ac].pjdb010, 
                      g_pjdb_d[l_ac].pjdb011,g_pjdb_d[l_ac].pjdb015,g_pjdb_d[l_ac].pjdb016,g_pjdb_d[l_ac].pjdb050, 
                      g_pjdb_d[l_ac].pjdbsite,g_pjdb2_d[l_ac].pjdbseq,g_pjdb2_d[l_ac].pjdb026,g_pjdb2_d[l_ac].pjdb027, 
                      g_pjdb2_d[l_ac].pjdb028,g_pjdb2_d[l_ac].pjdb029,g_pjdb2_d[l_ac].pjdb030,g_pjdb2_d[l_ac].pjdb031, 
                      g_pjdb2_d[l_ac].pjdb032,g_pjdb2_d[l_ac].pjdb033,g_pjdb2_d[l_ac].pjdb034,g_pjdb2_d[l_ac].pjdb035, 
                      g_pjdb2_d[l_ac].pjdb036,g_pjdb2_d[l_ac].pjdb037,g_pjdb2_d[l_ac].pjdb038,g_pjdb2_d[l_ac].pjdb039, 
                      g_pjdb2_d[l_ac].pjdb040,g_pjdb2_d[l_ac].pjdb041,g_pjdb2_d[l_ac].pjdb042,g_pjdb2_d[l_ac].pjdb043, 
                      g_pjdb2_d[l_ac].pjdb044,g_pjdb2_d[l_ac].pjdb045,g_pjdb2_d[l_ac].pjdb046,g_pjdb2_d[l_ac].pjdb047, 
                      g_pjdb2_d[l_ac].pjdb048,g_pjdb2_d[l_ac].pjdb049,g_pjdb2_d[l_ac].pjdb003,g_pjdb2_d[l_ac].pjdb004, 
                      g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb006,g_pjdb2_d[l_ac].pjdb007,g_pjdb2_d[l_ac].pjdb008, 
                      g_pjdb2_d[l_ac].pjdb009
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_pjdb_d_t.pjdbseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_pjdb_d_mask_o[l_ac].* =  g_pjdb_d[l_ac].*
                  CALL apjt302_pjdb_t_mask()
                  LET g_pjdb_d_mask_n[l_ac].* =  g_pjdb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL apjt302_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
 
            #其他table進行lock
            
 
 
            CALL apjt302_idx_chk()   #(ver:83)
        
         BEFORE INSERT  
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            CALL apjt302_idx_chk()   #(ver:83)
            INITIALIZE g_pjdb_d[l_ac].* TO NULL 
            INITIALIZE g_pjdb_d_t.* TO NULL 
            INITIALIZE g_pjdb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_pjdb_d[l_ac].pjdb013 = "0"
      LET g_pjdb_d[l_ac].pjdb014 = "0"
      LET g_pjdb_d[l_ac].pjdb010 = "0"
      LET g_pjdb_d[l_ac].pjdb011 = "0"
      LET g_pjdb_d[l_ac].pjdb015 = "0"
      LET g_pjdb_d[l_ac].pjdb016 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            LET g_pjdb_d[l_ac].pjdbsite = g_pjda_m.pjdasite
            SELECT MAX(pjdbseq)+1 INTO g_pjdb_d[l_ac].pjdbseq 
              FROM pjdb_t
             WHERE pjdbent = g_enterprise 
               AND pjdbdocno = g_pjda_m.pjdadocno
            IF cl_null(g_pjdb_d[l_ac].pjdbseq) OR g_pjdb_d[l_ac].pjdbseq = 0 THEN
               LET g_pjdb_d[l_ac].pjdbseq = 1
            END IF            
            #end add-point
            LET g_pjdb_d_t.* = g_pjdb_d[l_ac].*     #新輸入資料
            LET g_pjdb_d_o.* = g_pjdb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL apjt302_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL apjt302_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_pjdb_d[li_reproduce_target].* = g_pjdb_d[li_reproduce].*
               LET g_pjdb2_d[li_reproduce_target].* = g_pjdb2_d[li_reproduce].*
 
               LET g_pjdb_d[li_reproduce_target].pjdbseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM pjdb_t 
             WHERE pjdbent = g_enterprise AND pjdbdocno = g_pjda_m.pjdadocno
 
               AND pjdbseq = g_pjdb_d[l_ac].pjdbseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_pjda_m.pjdadocno
               LET gs_keys[2] = g_pjdb_d[g_detail_idx].pjdbseq
               CALL apjt302_insert_b('pjdb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_pjdb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "pjdb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL apjt302_b_fill()
               #資料多語言用-增/改
               
                  #161130-00056 add
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
               LET gs_keys[01] = g_pjda_m.pjdadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_pjdb_d_t.pjdbseq
 
            
               #刪除同層單身
               IF NOT apjt302_delete_b('pjdb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE apjt302_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT apjt302_key_delete_b(gs_keys,'pjdb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE apjt302_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
 
               
 
   #161130-00056 add
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE apjt302_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_pjdb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_pjdb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdbseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_pjdb_d[l_ac].pjdbseq,"1","1","","","azz-00079",1) THEN
               NEXT FIELD pjdbseq
            END IF 
 
 
 
            #add-point:AFTER FIELD pjdbseq name="input.a.page1.pjdbseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_pjda_m.pjdadocno IS NOT NULL AND g_pjdb_d[g_detail_idx].pjdbseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_pjda_m.pjdadocno != g_pjdadocno_t OR g_pjdb_d[g_detail_idx].pjdbseq != g_pjdb_d_t.pjdbseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM pjdb_t WHERE "||"pjdbent = '" ||g_enterprise|| "' AND "||"pjdbdocno = '"||g_pjda_m.pjdadocno ||"' AND "|| "pjdbseq = '"||g_pjdb_d[g_detail_idx].pjdbseq ||"'",'std-00004',0) THEN 
                     LET g_pjdb_d[l_ac].pjdbseq = g_pjdb_d_t.pjdbseq
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdbseq
            #add-point:BEFORE FIELD pjdbseq name="input.b.page1.pjdbseq"
            IF cl_null(g_pjdb_d[l_ac].pjdbseq) OR g_pjdb_d[l_ac].pjdbseq < 1 THEN 
               SELECT MAX(pjdbseq)+1 INTO g_pjdb_d[l_ac].pjdbseq FROM pjdb_t
                  WHERE pjdbent = g_enterprise AND pjdbdocno = g_pjda_m.pjdadocno
               IF cl_null(g_pjdb_d[l_ac].pjdbseq) OR g_pjdb_d[l_ac].pjdbseq = 0 THEN
                  LET g_pjdb_d[l_ac].pjdbseq = 1
               END IF              
            END IF
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdbseq
            #add-point:ON CHANGE pjdbseq name="input.g.page1.pjdbseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb001
            
            #add-point:AFTER FIELD pjdb001 name="input.a.page1.pjdb001"
            CALL apjt302_pjdb001_desc()
            IF NOT cl_null(g_pjdb_d[l_ac].pjdb001) THEN 
               IF  g_pjda_m.pjdadocno IS NOT NULL AND g_pjdb_d[g_detail_idx].pjdbseq IS NOT NULL THEN 
                  IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_pjda_m.pjdadocno != g_pjdadocno_t OR g_pjdb_d[g_detail_idx].pjdbseq != g_pjdb_d_t.pjdbseq)) THEN 
                     IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM pjdb_t WHERE "||"pjdbent = '" ||g_enterprise|| "' AND "||"pjdbdocno = '"||g_pjda_m.pjdadocno ||"' AND "|| "pjdb001 = '"||g_pjdb_d[g_detail_idx].pjdb001 ||"'",'std-00004',0) THEN 
                        LET g_pjdb_d[l_ac].pjdb001 = g_pjdb_d_t.pjdb001
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF               
               #此段落由子樣板a19產生
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = TRUE #是否開窗 #160318-00025#31  add
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_pjdb_d[l_ac].pjdb001
               LET g_chkparam.err_str[1] = "apj-00012:sub-01302|apjm200|",cl_get_progname("apjm200",g_lang,"2"),"|:EXEPROGapjm200"  #160318-00025#31  add
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_pjba001") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
                  IF NOT apjt302_pjdb001_chk()THEN 
                     LET g_pjdb_d[l_ac].pjdb001 = g_pjdb_d_t.pjdb001
                     CALL apjt302_pjdb001_ref()                      
                     NEXT FIELD CURRENT 
                  ELSE
                     CALL apjt302_pjdb001_ref()                  
                  END IF 
               ELSE
                  #檢查失敗時後續處理
                  LET g_pjdb_d[l_ac].pjdb001 = g_pjdb_d_t.pjdb001                  
                  NEXT FIELD CURRENT
               END IF
            END IF
            CALL apjt302_set_entry_b(l_cmd)            
            CALL apjt302_set_no_entry_b(l_cmd)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb001
            #add-point:BEFORE FIELD pjdb001 name="input.b.page1.pjdb001"
            CALL apjt302_pjdb001_desc()
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb001
            #add-point:ON CHANGE pjdb001 name="input.g.page1.pjdb001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb002
            
            #add-point:AFTER FIELD pjdb002 name="input.a.page1.pjdb002"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb002
            #add-point:BEFORE FIELD pjdb002 name="input.b.page1.pjdb002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb002
            #add-point:ON CHANGE pjdb002 name="input.g.page1.pjdb002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb012
            #add-point:BEFORE FIELD pjdb012 name="input.b.page1.pjdb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb012
            
            #add-point:AFTER FIELD pjdb012 name="input.a.page1.pjdb012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb012
            #add-point:ON CHANGE pjdb012 name="input.g.page1.pjdb012"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb013
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_pjdb_d[l_ac].pjdb013,"0","1","100","1","azz-00087",1) THEN
               NEXT FIELD pjdb013
            END IF 
 
 
 
            #add-point:AFTER FIELD pjdb013 name="input.a.page1.pjdb013"
            IF NOT cl_null(g_pjdb_d[l_ac].pjdb013) THEN
               IF g_pjdb_d[l_ac].pjdb013 <> g_pjdb_d_o.pjdb013 OR cl_null(g_pjdb_d_o.pjdb013) THEN           
                  LET g_pjdb_d[l_ac].pjdb014 = g_pjdb_d[l_ac].pjdb013 - g_pjdb_d[l_ac].pjdb012
                  CALL apjt302_get_amt('1')
               END IF
            END IF 
            LET g_pjdb_d_o.pjdb013 = g_pjdb_d[l_ac].pjdb013
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb013
            #add-point:BEFORE FIELD pjdb013 name="input.b.page1.pjdb013"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb013
            #add-point:ON CHANGE pjdb013 name="input.g.page1.pjdb013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb014
            #add-point:BEFORE FIELD pjdb014 name="input.b.page1.pjdb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb014
            
            #add-point:AFTER FIELD pjdb014 name="input.a.page1.pjdb014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb014
            #add-point:ON CHANGE pjdb014 name="input.g.page1.pjdb014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb010
            #add-point:BEFORE FIELD pjdb010 name="input.b.page1.pjdb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb010
            
            #add-point:AFTER FIELD pjdb010 name="input.a.page1.pjdb010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb010
            #add-point:ON CHANGE pjdb010 name="input.g.page1.pjdb010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb011
            #add-point:BEFORE FIELD pjdb011 name="input.b.page1.pjdb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb011
            
            #add-point:AFTER FIELD pjdb011 name="input.a.page1.pjdb011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb011
            #add-point:ON CHANGE pjdb011 name="input.g.page1.pjdb011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb015
            #add-point:BEFORE FIELD pjdb015 name="input.b.page1.pjdb015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb015
            
            #add-point:AFTER FIELD pjdb015 name="input.a.page1.pjdb015"
            IF NOT cl_null(g_pjdb_d[l_ac].pjdb015) THEN
               IF NOT apjt302_pjdb015_chk() THEN 
                  LET g_pjdb_d[l_ac].pjdb015 = g_pjdb_d_t.pjdb015 
                  NEXT FIELD CURRENt                  
               END IF
               
               IF g_pjdb_d[l_ac].pjdb015 <> g_pjdb_d_o.pjdb015 OR cl_null(g_pjdb_d_o.pjdb015) THEN           
                  CALL apjt302_get_amt('2')
               END IF
            END IF 
            LET g_pjdb_d_o.pjdb015 = g_pjdb_d[l_ac].pjdb015
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb015
            #add-point:ON CHANGE pjdb015 name="input.g.page1.pjdb015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb016
            #add-point:BEFORE FIELD pjdb016 name="input.b.page1.pjdb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb016
            
            #add-point:AFTER FIELD pjdb016 name="input.a.page1.pjdb016"
            IF NOT cl_null(g_pjdb_d[l_ac].pjdb016) THEN
               IF NOT apjt302_pjdb016_chk() THEN 
                  LET g_pjdb_d[l_ac].pjdb016 = g_pjdb_d_t.pjdb016 
                  NEXT FIELD CURRENt                  
               END IF
               
               IF g_pjdb_d[l_ac].pjdb016 <> g_pjdb_d_o.pjdb016 OR cl_null(g_pjdb_d_o.pjdb016) THEN           
                  CALL apjt302_get_amt('3')
               END IF
            END IF 
            LET g_pjdb_d_o.pjdb016 = g_pjdb_d[l_ac].pjdb016
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb016
            #add-point:ON CHANGE pjdb016 name="input.g.page1.pjdb016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdb050
            #add-point:BEFORE FIELD pjdb050 name="input.b.page1.pjdb050"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdb050
            
            #add-point:AFTER FIELD pjdb050 name="input.a.page1.pjdb050"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdb050
            #add-point:ON CHANGE pjdb050 name="input.g.page1.pjdb050"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pjdbsite
            #add-point:BEFORE FIELD pjdbsite name="input.b.page1.pjdbsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pjdbsite
            
            #add-point:AFTER FIELD pjdbsite name="input.a.page1.pjdbsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pjdbsite
            #add-point:ON CHANGE pjdbsite name="input.g.page1.pjdbsite"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.pjdbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdbseq
            #add-point:ON ACTION controlp INFIELD pjdbseq name="input.c.page1.pjdbseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb001
            #add-point:ON ACTION controlp INFIELD pjdb001 name="input.c.page1.pjdb001"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pjdb_d[l_ac].pjdb001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_pjba001()                                #呼叫開窗

            LET g_pjdb_d[l_ac].pjdb001 = g_qryparam.return1              

            DISPLAY g_pjdb_d[l_ac].pjdb001 TO pjdb001              #

            NEXT FIELD pjdb001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb002
            #add-point:ON ACTION controlp INFIELD pjdb002 name="input.c.page1.pjdb002"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pjdb_d[l_ac].pjdb002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_pmaa001_6()                                #呼叫開窗

            LET g_pjdb_d[l_ac].pjdb002 = g_qryparam.return1              

            DISPLAY g_pjdb_d[l_ac].pjdb002 TO pjdb002              #

            NEXT FIELD pjdb002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb012
            #add-point:ON ACTION controlp INFIELD pjdb012 name="input.c.page1.pjdb012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb013
            #add-point:ON ACTION controlp INFIELD pjdb013 name="input.c.page1.pjdb013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb014
            #add-point:ON ACTION controlp INFIELD pjdb014 name="input.c.page1.pjdb014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb010
            #add-point:ON ACTION controlp INFIELD pjdb010 name="input.c.page1.pjdb010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb011
            #add-point:ON ACTION controlp INFIELD pjdb011 name="input.c.page1.pjdb011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb015
            #add-point:ON ACTION controlp INFIELD pjdb015 name="input.c.page1.pjdb015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb016
            #add-point:ON ACTION controlp INFIELD pjdb016 name="input.c.page1.pjdb016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdb050
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdb050
            #add-point:ON ACTION controlp INFIELD pjdb050 name="input.c.page1.pjdb050"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pjdbsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pjdbsite
            #add-point:ON ACTION controlp INFIELD pjdbsite name="input.c.page1.pjdbsite"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_pjdb_d[l_ac].* = g_pjdb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE apjt302_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_pjdb_d[l_ac].pjdbseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_pjdb_d[l_ac].* = g_pjdb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL apjt302_pjdb_t_mask_restore('restore_mask_o')
      
               UPDATE pjdb_t SET (pjdbdocno,pjdbseq,pjdb001,pjdb002,pjdb012,pjdb013,pjdb014,pjdb010, 
                   pjdb011,pjdb015,pjdb016,pjdb050,pjdbsite,pjdb026,pjdb027,pjdb028,pjdb029,pjdb030, 
                   pjdb031,pjdb032,pjdb033,pjdb034,pjdb035,pjdb036,pjdb037,pjdb038,pjdb039,pjdb040,pjdb041, 
                   pjdb042,pjdb043,pjdb044,pjdb045,pjdb046,pjdb047,pjdb048,pjdb049,pjdb003,pjdb004,pjdb005, 
                   pjdb006,pjdb007,pjdb008,pjdb009) = (g_pjda_m.pjdadocno,g_pjdb_d[l_ac].pjdbseq,g_pjdb_d[l_ac].pjdb001, 
                   g_pjdb_d[l_ac].pjdb002,g_pjdb_d[l_ac].pjdb012,g_pjdb_d[l_ac].pjdb013,g_pjdb_d[l_ac].pjdb014, 
                   g_pjdb_d[l_ac].pjdb010,g_pjdb_d[l_ac].pjdb011,g_pjdb_d[l_ac].pjdb015,g_pjdb_d[l_ac].pjdb016, 
                   g_pjdb_d[l_ac].pjdb050,g_pjdb_d[l_ac].pjdbsite,g_pjdb2_d[l_ac].pjdb026,g_pjdb2_d[l_ac].pjdb027, 
                   g_pjdb2_d[l_ac].pjdb028,g_pjdb2_d[l_ac].pjdb029,g_pjdb2_d[l_ac].pjdb030,g_pjdb2_d[l_ac].pjdb031, 
                   g_pjdb2_d[l_ac].pjdb032,g_pjdb2_d[l_ac].pjdb033,g_pjdb2_d[l_ac].pjdb034,g_pjdb2_d[l_ac].pjdb035, 
                   g_pjdb2_d[l_ac].pjdb036,g_pjdb2_d[l_ac].pjdb037,g_pjdb2_d[l_ac].pjdb038,g_pjdb2_d[l_ac].pjdb039, 
                   g_pjdb2_d[l_ac].pjdb040,g_pjdb2_d[l_ac].pjdb041,g_pjdb2_d[l_ac].pjdb042,g_pjdb2_d[l_ac].pjdb043, 
                   g_pjdb2_d[l_ac].pjdb044,g_pjdb2_d[l_ac].pjdb045,g_pjdb2_d[l_ac].pjdb046,g_pjdb2_d[l_ac].pjdb047, 
                   g_pjdb2_d[l_ac].pjdb048,g_pjdb2_d[l_ac].pjdb049,g_pjdb2_d[l_ac].pjdb003,g_pjdb2_d[l_ac].pjdb004, 
                   g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb006,g_pjdb2_d[l_ac].pjdb007,g_pjdb2_d[l_ac].pjdb008, 
                   g_pjdb2_d[l_ac].pjdb009)
                WHERE pjdbent = g_enterprise AND pjdbdocno = g_pjda_m.pjdadocno 
 
                  AND pjdbseq = g_pjdb_d_t.pjdbseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_pjdb_d[l_ac].* = g_pjdb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "pjdb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_pjdb_d[l_ac].* = g_pjdb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "pjdb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                        #161130-00056 add
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_pjda_m.pjdadocno
               LET gs_keys_bak[1] = g_pjdadocno_t
               LET gs_keys[2] = g_pjdb_d[g_detail_idx].pjdbseq
               LET gs_keys_bak[2] = g_pjdb_d_t.pjdbseq
               CALL apjt302_update_b('pjdb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL apjt302_pjdb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_pjdb_d[g_detail_idx].pjdbseq = g_pjdb_d_t.pjdbseq 
 
                  ) THEN
                  LET gs_keys[01] = g_pjda_m.pjdadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_pjdb_d_t.pjdbseq
 
                  CALL apjt302_key_update_b(gs_keys,'pjdb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_pjda_m),util.JSON.stringify(g_pjdb_d_t)
               LET g_log2 = util.JSON.stringify(g_pjda_m),util.JSON.stringify(g_pjdb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL apjt302_unlock_b("pjdb_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               #170920-00028 ---modify start---
               #新增判斷是否有上一筆資料可供複製
               IF l_ac_t <= 0 OR l_ac_t IS NULL THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ""
                  LET g_errparam.code   = "adz-01032"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
               ELSE
                  LET li_reproduce = l_ac_t
                  LET li_reproduce_target = l_ac
                  LET g_pjdb_d[li_reproduce_target].* = g_pjdb_d[li_reproduce].*
               LET g_pjdb2_d[li_reproduce_target].* = g_pjdb2_d[li_reproduce].*
 
                  LET g_pjdb_d[li_reproduce_target].pjdbseq = NULL
 
               END IF
               #170920-00028 --- modify end ---
            ELSE
               CALL FGL_SET_ARR_CURR(g_pjdb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_pjdb_d.getLength()+1
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
      
 
      
 
      DISPLAY ARRAY g_pjdb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
         BEFORE ROW
            CALL apjt302_idx_chk()
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            LET g_detail_idx = l_ac
            
            #add-point:page2, before row動作 name="input.body2.before_row"
            
            #end add-point
            
         BEFORE DISPLAY
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue(""))
            END IF
            LET g_loc = 'm'
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            CALL apjt302_idx_chk()
            LET g_current_page = 2
      
         #add-point:page2自定義行為 name="input.body2.action"
         
         #end add-point
      
      END DISPLAY
 
 
 
{</section>}
 
{<section id="apjt302.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1','2',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue(""))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD pjdadocno #170906-00011#1
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD pjdbseq #170906-00011#1
 
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
         
         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
         LET g_detail_idx_list[2] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         
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
         LET g_detail_idx_list[2] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION apjt302_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL apjt302_b_fill() #單身填充
      CALL apjt302_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL apjt302_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   CALL s_aooi200_get_slip_desc(g_pjda_m.pjdadocno) RETURNING g_pjda_m.pjdadocno_desc
   #end add-point
   
   #遮罩相關處理
   LET g_pjda_m_mask_o.* =  g_pjda_m.*
   CALL apjt302_pjda_t_mask()
   LET g_pjda_m_mask_n.* =  g_pjda_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_pjda_m.pjdadocno,g_pjda_m.pjdadocno_desc,g_pjda_m.pjdadocdt,g_pjda_m.pjdasite,g_pjda_m.pjda001, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002,g_pjda_m.pjda002_desc,g_pjda_m.pjdastus,g_pjda_m.pjdaownid, 
       g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamodid_desc, 
       g_pjda_m.pjdamoddt,g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid, 
       g_pjda_m.pjdapstid_desc,g_pjda_m.pjdapstdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_pjda_m.pjdastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_pjdb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      CALL apjt302_pjdb001_desc_1()
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_pjdb2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
      
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL apjt302_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION apjt302_detail_show()
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
 
{<section id="apjt302.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION apjt302_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE pjda_t.pjdadocno 
   DEFINE l_oldno     LIKE pjda_t.pjdadocno 
 
   DEFINE l_master    RECORD LIKE pjda_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE pjdb_t.* #此變數樣板目前無使用
 
 
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
   
   IF g_pjda_m.pjdadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_pjdadocno_t = g_pjda_m.pjdadocno
 
    
   LET g_pjda_m.pjdadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_pjda_m.pjdaownid = g_user
      LET g_pjda_m.pjdaowndp = g_dept
      LET g_pjda_m.pjdacrtid = g_user
      LET g_pjda_m.pjdacrtdp = g_dept 
      LET g_pjda_m.pjdacrtdt = cl_get_current()
      LET g_pjda_m.pjdamodid = g_user
      LET g_pjda_m.pjdamoddt = cl_get_current()
      LET g_pjda_m.pjdastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_pjda_m.pjdastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
      LET g_pjda_m.pjdadocno_desc = ''
   DISPLAY BY NAME g_pjda_m.pjdadocno_desc
 
   
   CALL apjt302_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_pjda_m.* TO NULL
      INITIALIZE g_pjdb_d TO NULL
      INITIALIZE g_pjdb2_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL apjt302_show()
      CALL apjt302_idx_chk()   #(ver:83)
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
   CALL apjt302_set_act_visible()   
   CALL apjt302_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_pjdadocno_t = g_pjda_m.pjdadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " pjdaent = " ||g_enterprise|| " AND",
                      " pjdadocno = '", g_pjda_m.pjdadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL apjt302_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL apjt302_idx_chk()
   
   LET g_data_owner = g_pjda_m.pjdaownid      
   LET g_data_dept  = g_pjda_m.pjdaowndp
   
   #功能已完成,通報訊息中心
   CALL apjt302_msgcentre_notify('reproduce')
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION apjt302_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE pjdb_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE apjt302_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM pjdb_t
    WHERE pjdbent = g_enterprise AND pjdbdocno = g_pjdadocno_t
 
    INTO TEMP apjt302_detail
 
   #將key修正為調整後   
   UPDATE apjt302_detail 
      #更新key欄位
      SET pjdbdocno = g_pjda_m.pjdadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO pjdb_t SELECT * FROM apjt302_detail
   
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
   DROP TABLE apjt302_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_pjdadocno_t = g_pjda_m.pjdadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.delete" >}
#+ 資料刪除
PRIVATE FUNCTION apjt302_delete()
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
   
   IF g_pjda_m.pjdadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN apjt302_cl USING g_enterprise,g_pjda_m.pjdadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN apjt302_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE apjt302_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE apjt302_master_referesh USING g_pjda_m.pjdadocno INTO g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt, 
       g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002,g_pjda_m.pjdastus,g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp, 
       g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt, 
       g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid,g_pjda_m.pjdapstdt,g_pjda_m.pjdadocno_desc, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002_desc,g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdamodid_desc,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdapstid_desc 
 
   
   
   #檢查是否允許此動作
   IF NOT apjt302_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_pjda_m_mask_o.* =  g_pjda_m.*
   CALL apjt302_pjda_t_mask()
   LET g_pjda_m_mask_n.* =  g_pjda_m.*
   
   CALL apjt302_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL apjt302_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_pjdadocno_t = g_pjda_m.pjdadocno
 
 
      DELETE FROM pjda_t
       WHERE pjdaent = g_enterprise AND pjdadocno = g_pjda_m.pjdadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_pjda_m.pjdadocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt) THEN 
         CALL s_transaction_end('N','0') 
         RETURN 
      END IF 
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM pjdb_t
       WHERE pjdbent = g_enterprise AND pjdbdocno = g_pjda_m.pjdadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "pjdb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_pjda_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE apjt302_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_pjdb_d.clear() 
      CALL g_pjdb2_d.clear()       
 
     
      CALL apjt302_ui_browser_refresh()  
      #CALL apjt302_ui_headershow()  
      #CALL apjt302_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
         #161130-00056 add
      
      #單身多語言刪除
      
         #161130-00056 add
      
         #161130-00056 add
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL apjt302_browser_fill("")
         CALL apjt302_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE apjt302_cl
 
   #功能已完成,通報訊息中心
   CALL apjt302_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="apjt302.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION apjt302_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_pjdb_d.clear()
   CALL g_pjdb2_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF apjt302_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      #若有觸發條件(g_wc2)異動的任何行為都需添加在下方條件中,避免條件無正常刷新 ver:81
      IF (g_action_choice = "query" OR cl_null(g_action_choice) OR g_action_choice = "queryplan" OR 
          g_action_choice = "insert" OR g_action_choice = "modify" OR g_action_choice = "reproduce" ) #ver:81 #ver:82
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT pjdbseq,pjdb001,pjdb002,pjdb012,pjdb013,pjdb014,pjdb010,pjdb011, 
             pjdb015,pjdb016,pjdb050,pjdbsite,pjdbseq,pjdb026,pjdb027,pjdb028,pjdb029,pjdb030,pjdb031, 
             pjdb032,pjdb033,pjdb034,pjdb035,pjdb036,pjdb037,pjdb038,pjdb039,pjdb040,pjdb041,pjdb042, 
             pjdb043,pjdb044,pjdb045,pjdb046,pjdb047,pjdb048,pjdb049,pjdb003,pjdb004,pjdb005,pjdb006, 
             pjdb007,pjdb008,pjdb009 ,t1.pjbal003 ,t2.pmaal004 ,t5.ooibl004 ,t6.oocql004 ,t7.ooail003 , 
             t8.oodbl004 FROM pjdb_t",   
                     " INNER JOIN pjda_t ON pjdaent = " ||g_enterprise|| " AND pjdadocno = pjdbdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN pjbal_t t1 ON t1.pjbalent="||g_enterprise||" AND t1.pjbal001=pjdb001 AND t1.pjbal002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=pjdb002 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooibl_t t5 ON t5.ooiblent="||g_enterprise||" AND t5.ooibl002=pjdb003 AND t5.ooibl003='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t6 ON t6.oocqlent="||g_enterprise||" AND t6.oocql001='238' AND t6.oocql002=pjdb004 AND t6.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t7 ON t7.ooailent="||g_enterprise||" AND t7.ooail001=pjdb005 AND t7.ooail002='"||g_dlang||"' ",
               " LEFT JOIN oodbl_t t8 ON t8.oodblent="||g_enterprise||" AND t8.oodbl002=pjdb007 AND t8.oodbl003='"||g_dlang||"' ",
 
                     " WHERE pjdbent=? AND pjdbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         #161221-00015#1 mod-S
#         LET g_sql = "SELECT  UNIQUE pjdbseq,pjdb001,pjdb002,pjdb003,pjdb004,pjdb005,pjdb006,pjdb007, ",
#                     "        pjdb008,pjdb009,pjdb012,pjdb013,pjdb014,pjdb010,pjdb011,pjdb015,pjdb016,pjdb026,pjdb027, ",
#                     "        pjdb028,pjdb029,pjdb030,pjdb031,pjdb032,pjdb033,pjdb034,pjdb035,pjdb036,pjdb037,pjdb038, ",
#                     "        pjdb039,pjdb040,pjdb041,pjdb042,pjdb043,pjdb044,pjdb045,pjdb046,pjdb047,pjdb048,pjdb049, ",
#                     "        pjdb050,pjdbsite ,",
#                     "        pjdbseq,pjdb001,pjdb003,pjdb004,pjdb005,pjdb006,pjdb007,pjdb008,pjdb009 ,  ",  #161109-00032#5 add
#                     "        t1.pjbal003 ,t2.pmaal004 ,",
#                     "        '', ",   #161109-00032#5 add
#                     "        t3.ooibl004 ,t4.oocql004 ,t5.ooail003 ,t6.oodbl004 FROM pjdb_t",  
         LET g_sql = "SELECT  UNIQUE pjdbseq,pjdb001,pjdb002,pjdb012,pjdb013,pjdb014,pjdb010,pjdb011,pjdb015,pjdb016, ",
                     #"        pjdb026,pjdb027, ",   #161109-00032#5
                     #"        pjdb028,pjdb029,pjdb030,pjdb031,pjdb032,pjdb033,pjdb034,pjdb035,pjdb036,pjdb037,pjdb038, ", #161109-00032#5
                     #"        pjdb039,pjdb040,pjdb041,pjdb042,pjdb043,pjdb044,pjdb045,pjdb046,pjdb047,pjdb048,pjdb049, ", #161109-00032#5
                     "        pjdb050,pjdbsite ,",
                     "        pjdbseq,",
                     "        pjdb026,pjdb027, ",   #161109-00032#5
                     "        pjdb028,pjdb029,pjdb030,pjdb031,pjdb032,pjdb033,pjdb034,pjdb035,pjdb036,pjdb037,pjdb038, ", #161109-00032#5
                     "        pjdb039,pjdb040,pjdb041,pjdb042,pjdb043,pjdb044,pjdb045,pjdb046,pjdb047,pjdb048,pjdb049, ", #161109-00032#5
                     "        pjdb003,pjdb004,pjdb005,pjdb006,pjdb007,pjdb008,pjdb009 ,  ",  #161109-00032#5 add
                     "        t1.pjbal003 ,t2.pmaal004 ,",
#                     "        '', ",   #161109-00032#5 add
                     "        t3.ooibl004 ,t4.oocql004 ,t5.ooail003 ,t6.oodbl004 FROM pjdb_t",    
         #161221-00015#1 mod-E
                     " INNER JOIN pjda_t ON pjdaent = pjdbent AND pjdadocno = pjdbdocno ",
                     " LEFT JOIN pjbal_t t1 ON t1.pjbalent='"||g_enterprise||"' AND t1.pjbal001=pjdb001 AND t1.pjbal002='"||g_dlang||"' ",
                     " LEFT JOIN pmaal_t t2 ON t2.pmaalent='"||g_enterprise||"' AND t2.pmaal001=pjdb002 AND t2.pmaal002='"||g_dlang||"' ",
                     " LEFT JOIN ooibl_t t3 ON t3.ooiblent='"||g_enterprise||"' AND t3.ooibl002=pjdb003 AND t3.ooibl003='"||g_dlang||"' ",
                     " LEFT JOIN oocql_t t4 ON t4.oocqlent='"||g_enterprise||"' AND t4.oocql001='238' AND t4.oocql002=pjdb004 AND t4.oocql003='"||g_dlang||"' ",
                     " LEFT JOIN ooail_t t5 ON t5.ooailent='"||g_enterprise||"' AND t5.ooail001=pjdb005 AND t5.ooail002='"||g_dlang||"' ",
                     " LEFT JOIN oodbl_t t6 ON t6.oodblent='"||g_enterprise||"' AND t6.oodbl001='"||g_ooef019||"' AND t6.oodbl002=pjdb007 AND t6.oodbl003='"||g_dlang||"' ",
                     " WHERE pjdbent=? AND pjdbdocno=?"         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY pjdb_t.pjdbseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE apjt302_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR apjt302_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_pjda_m.pjdadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_pjda_m.pjdadocno INTO g_pjdb_d[l_ac].pjdbseq,g_pjdb_d[l_ac].pjdb001, 
          g_pjdb_d[l_ac].pjdb002,g_pjdb_d[l_ac].pjdb012,g_pjdb_d[l_ac].pjdb013,g_pjdb_d[l_ac].pjdb014, 
          g_pjdb_d[l_ac].pjdb010,g_pjdb_d[l_ac].pjdb011,g_pjdb_d[l_ac].pjdb015,g_pjdb_d[l_ac].pjdb016, 
          g_pjdb_d[l_ac].pjdb050,g_pjdb_d[l_ac].pjdbsite,g_pjdb2_d[l_ac].pjdbseq,g_pjdb2_d[l_ac].pjdb026, 
          g_pjdb2_d[l_ac].pjdb027,g_pjdb2_d[l_ac].pjdb028,g_pjdb2_d[l_ac].pjdb029,g_pjdb2_d[l_ac].pjdb030, 
          g_pjdb2_d[l_ac].pjdb031,g_pjdb2_d[l_ac].pjdb032,g_pjdb2_d[l_ac].pjdb033,g_pjdb2_d[l_ac].pjdb034, 
          g_pjdb2_d[l_ac].pjdb035,g_pjdb2_d[l_ac].pjdb036,g_pjdb2_d[l_ac].pjdb037,g_pjdb2_d[l_ac].pjdb038, 
          g_pjdb2_d[l_ac].pjdb039,g_pjdb2_d[l_ac].pjdb040,g_pjdb2_d[l_ac].pjdb041,g_pjdb2_d[l_ac].pjdb042, 
          g_pjdb2_d[l_ac].pjdb043,g_pjdb2_d[l_ac].pjdb044,g_pjdb2_d[l_ac].pjdb045,g_pjdb2_d[l_ac].pjdb046, 
          g_pjdb2_d[l_ac].pjdb047,g_pjdb2_d[l_ac].pjdb048,g_pjdb2_d[l_ac].pjdb049,g_pjdb2_d[l_ac].pjdb003, 
          g_pjdb2_d[l_ac].pjdb004,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb006,g_pjdb2_d[l_ac].pjdb007, 
          g_pjdb2_d[l_ac].pjdb008,g_pjdb2_d[l_ac].pjdb009,g_pjdb_d[l_ac].pjdb001_desc,g_pjdb_d[l_ac].pjdb002_desc, 
          g_pjdb2_d[l_ac].pjdb003_desc,g_pjdb2_d[l_ac].pjdb004_desc,g_pjdb2_d[l_ac].pjdb005_desc,g_pjdb2_d[l_ac].pjdb007_desc  
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
         #161221-00015#1 add-S
         LET g_pjdb2_d[l_ac].pjdb001a = g_pjdb_d[l_ac].pjdb001
         #161221-00015#1 add-E
         #161109-00032#5---s
         LET g_pjdb2_d[l_ac].pjdb001_1_desc = g_pjdb_d[l_ac].pjdb001_desc
         #161109-00032#5---e 



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
   LET g_detail_cnt = l_ac -1
   #end add-point
   
   CALL g_pjdb_d.deleteElement(g_pjdb_d.getLength())
   CALL g_pjdb2_d.deleteElement(g_pjdb2_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE apjt302_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_pjdb_d.getLength()
      LET g_pjdb_d_mask_o[l_ac].* =  g_pjdb_d[l_ac].*
      CALL apjt302_pjdb_t_mask()
      LET g_pjdb_d_mask_n[l_ac].* =  g_pjdb_d[l_ac].*
   END FOR
   
   LET g_pjdb2_d_mask_o.* =  g_pjdb2_d.*
   FOR l_ac = 1 TO g_pjdb2_d.getLength()
      LET g_pjdb2_d_mask_o[l_ac].* =  g_pjdb2_d[l_ac].*
      CALL apjt302_pjdb_t_mask()
      LET g_pjdb2_d_mask_n[l_ac].* =  g_pjdb2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION apjt302_delete_b(ps_table,ps_keys_bak,ps_page)
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
   LET ls_group = "'1','2',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
      
      #end add-point    
      DELETE FROM pjdb_t
       WHERE pjdbent = g_enterprise AND
         pjdbdocno = ps_keys_bak[1] AND pjdbseq = ps_keys_bak[2]
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
         CALL g_pjdb_d.deleteElement(li_idx) 
      END IF 
      IF ps_page <> "'2'" THEN 
         CALL g_pjdb2_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION apjt302_insert_b(ps_table,ps_keys,ps_page)
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
   LET ls_group = "'1','2',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO pjdb_t
                  (pjdbent,
                   pjdbdocno,
                   pjdbseq
                   ,pjdb001,pjdb002,pjdb012,pjdb013,pjdb014,pjdb010,pjdb011,pjdb015,pjdb016,pjdb050,pjdbsite,pjdb026,pjdb027,pjdb028,pjdb029,pjdb030,pjdb031,pjdb032,pjdb033,pjdb034,pjdb035,pjdb036,pjdb037,pjdb038,pjdb039,pjdb040,pjdb041,pjdb042,pjdb043,pjdb044,pjdb045,pjdb046,pjdb047,pjdb048,pjdb049,pjdb003,pjdb004,pjdb005,pjdb006,pjdb007,pjdb008,pjdb009) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_pjdb_d[g_detail_idx].pjdb001,g_pjdb_d[g_detail_idx].pjdb002,g_pjdb_d[g_detail_idx].pjdb012, 
                       g_pjdb_d[g_detail_idx].pjdb013,g_pjdb_d[g_detail_idx].pjdb014,g_pjdb_d[g_detail_idx].pjdb010, 
                       g_pjdb_d[g_detail_idx].pjdb011,g_pjdb_d[g_detail_idx].pjdb015,g_pjdb_d[g_detail_idx].pjdb016, 
                       g_pjdb_d[g_detail_idx].pjdb050,g_pjdb_d[g_detail_idx].pjdbsite,g_pjdb2_d[g_detail_idx].pjdb026, 
                       g_pjdb2_d[g_detail_idx].pjdb027,g_pjdb2_d[g_detail_idx].pjdb028,g_pjdb2_d[g_detail_idx].pjdb029, 
                       g_pjdb2_d[g_detail_idx].pjdb030,g_pjdb2_d[g_detail_idx].pjdb031,g_pjdb2_d[g_detail_idx].pjdb032, 
                       g_pjdb2_d[g_detail_idx].pjdb033,g_pjdb2_d[g_detail_idx].pjdb034,g_pjdb2_d[g_detail_idx].pjdb035, 
                       g_pjdb2_d[g_detail_idx].pjdb036,g_pjdb2_d[g_detail_idx].pjdb037,g_pjdb2_d[g_detail_idx].pjdb038, 
                       g_pjdb2_d[g_detail_idx].pjdb039,g_pjdb2_d[g_detail_idx].pjdb040,g_pjdb2_d[g_detail_idx].pjdb041, 
                       g_pjdb2_d[g_detail_idx].pjdb042,g_pjdb2_d[g_detail_idx].pjdb043,g_pjdb2_d[g_detail_idx].pjdb044, 
                       g_pjdb2_d[g_detail_idx].pjdb045,g_pjdb2_d[g_detail_idx].pjdb046,g_pjdb2_d[g_detail_idx].pjdb047, 
                       g_pjdb2_d[g_detail_idx].pjdb048,g_pjdb2_d[g_detail_idx].pjdb049,g_pjdb2_d[g_detail_idx].pjdb003, 
                       g_pjdb2_d[g_detail_idx].pjdb004,g_pjdb2_d[g_detail_idx].pjdb005,g_pjdb2_d[g_detail_idx].pjdb006, 
                       g_pjdb2_d[g_detail_idx].pjdb007,g_pjdb2_d[g_detail_idx].pjdb008,g_pjdb2_d[g_detail_idx].pjdb009) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "pjdb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_pjdb_d.insertElement(li_idx) 
      END IF 
      IF ps_page <> "'2'" THEN 
         CALL g_pjdb2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION apjt302_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   LET ls_group = "'1','2',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "pjdb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL apjt302_pjdb_t_mask_restore('restore_mask_o')
               
      UPDATE pjdb_t 
         SET (pjdbdocno,
              pjdbseq
              ,pjdb001,pjdb002,pjdb012,pjdb013,pjdb014,pjdb010,pjdb011,pjdb015,pjdb016,pjdb050,pjdbsite,pjdb026,pjdb027,pjdb028,pjdb029,pjdb030,pjdb031,pjdb032,pjdb033,pjdb034,pjdb035,pjdb036,pjdb037,pjdb038,pjdb039,pjdb040,pjdb041,pjdb042,pjdb043,pjdb044,pjdb045,pjdb046,pjdb047,pjdb048,pjdb049,pjdb003,pjdb004,pjdb005,pjdb006,pjdb007,pjdb008,pjdb009) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_pjdb_d[g_detail_idx].pjdb001,g_pjdb_d[g_detail_idx].pjdb002,g_pjdb_d[g_detail_idx].pjdb012, 
                  g_pjdb_d[g_detail_idx].pjdb013,g_pjdb_d[g_detail_idx].pjdb014,g_pjdb_d[g_detail_idx].pjdb010, 
                  g_pjdb_d[g_detail_idx].pjdb011,g_pjdb_d[g_detail_idx].pjdb015,g_pjdb_d[g_detail_idx].pjdb016, 
                  g_pjdb_d[g_detail_idx].pjdb050,g_pjdb_d[g_detail_idx].pjdbsite,g_pjdb2_d[g_detail_idx].pjdb026, 
                  g_pjdb2_d[g_detail_idx].pjdb027,g_pjdb2_d[g_detail_idx].pjdb028,g_pjdb2_d[g_detail_idx].pjdb029, 
                  g_pjdb2_d[g_detail_idx].pjdb030,g_pjdb2_d[g_detail_idx].pjdb031,g_pjdb2_d[g_detail_idx].pjdb032, 
                  g_pjdb2_d[g_detail_idx].pjdb033,g_pjdb2_d[g_detail_idx].pjdb034,g_pjdb2_d[g_detail_idx].pjdb035, 
                  g_pjdb2_d[g_detail_idx].pjdb036,g_pjdb2_d[g_detail_idx].pjdb037,g_pjdb2_d[g_detail_idx].pjdb038, 
                  g_pjdb2_d[g_detail_idx].pjdb039,g_pjdb2_d[g_detail_idx].pjdb040,g_pjdb2_d[g_detail_idx].pjdb041, 
                  g_pjdb2_d[g_detail_idx].pjdb042,g_pjdb2_d[g_detail_idx].pjdb043,g_pjdb2_d[g_detail_idx].pjdb044, 
                  g_pjdb2_d[g_detail_idx].pjdb045,g_pjdb2_d[g_detail_idx].pjdb046,g_pjdb2_d[g_detail_idx].pjdb047, 
                  g_pjdb2_d[g_detail_idx].pjdb048,g_pjdb2_d[g_detail_idx].pjdb049,g_pjdb2_d[g_detail_idx].pjdb003, 
                  g_pjdb2_d[g_detail_idx].pjdb004,g_pjdb2_d[g_detail_idx].pjdb005,g_pjdb2_d[g_detail_idx].pjdb006, 
                  g_pjdb2_d[g_detail_idx].pjdb007,g_pjdb2_d[g_detail_idx].pjdb008,g_pjdb2_d[g_detail_idx].pjdb009)  
 
         WHERE pjdbent = g_enterprise AND pjdbdocno = ps_keys_bak[1] AND pjdbseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "pjdb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "pjdb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL apjt302_pjdb_t_mask_restore('restore_mask_n')
               
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
 
{<section id="apjt302.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION apjt302_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="apjt302.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION apjt302_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="apjt302.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION apjt302_lock_b(ps_table,ps_page)
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
   #CALL apjt302_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1','2',"
   #僅鎖定自身table
   LET ls_group = "pjdb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN apjt302_bcl USING g_enterprise,
                                       g_pjda_m.pjdadocno,g_pjdb_d[g_detail_idx].pjdbseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "apjt302_bcl:",SQLERRMESSAGE 
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
 
{<section id="apjt302.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION apjt302_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point  
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
    
   LET ls_group = "'1','2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE apjt302_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION apjt302_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("pjdadocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("pjdadocno",TRUE)
      CALL cl_set_comp_entry("pjdadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("pjdadocdt",TRUE) 
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION apjt302_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("pjdadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("pjdadocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("pjdadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="apjt302.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION apjt302_set_entry_b(p_cmd)
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
   CALL cl_set_comp_entry("pjdb015,pjdb016",TRUE)
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="apjt302.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION apjt302_set_no_entry_b(p_cmd)
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
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   #161221-00015#1 mod-S
#   IF g_pjdb_d[l_ac].pjdb008 = 'Y' THEN 
   IF g_pjdb2_d[l_ac].pjdb008 = 'Y' THEN 
   #161221-00015#1 mod-E
      CALL cl_set_comp_entry("pjdb015",FALSE)
   ELSE
      CALL cl_set_comp_entry("pjdb016",FALSE)
   END IF
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="apjt302.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION apjt302_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("modify,delete,modify_detail,statechange", TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION apjt302_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_pjda_m.pjdastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   IF g_pjda_m.pjdastus MATCHES "[X]" THEN   
      CALL cl_set_act_visible("statechange", FALSE)
   END IF

   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION apjt302_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION apjt302_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION apjt302_default_search()
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
      LET ls_wc = ls_wc, " pjdadocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "pjda_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "pjdb_t" 
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
 
{<section id="apjt302.state_change" >}
   #應用 a09 樣板自動產生(Version:21)
#+ 確認碼變更 
PRIVATE FUNCTION apjt302_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
 
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_pjda_m.pjdadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN apjt302_cl USING g_enterprise,g_pjda_m.pjdadocno
   IF SQLCA.SQLCODE THEN
      CLOSE apjt302_cl
   #  CALL s_transaction_end('N','0')   #(ver:19)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN apjt302_cl:",SQLERRMESSAGE
      LET g_errparam.code   = SQLCA.SQLCODE
      LET g_errparam.popup = TRUE 
      CALL s_transaction_end('N','0')   #(ver:19)
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE apjt302_master_referesh USING g_pjda_m.pjdadocno INTO g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt, 
       g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002,g_pjda_m.pjdastus,g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp, 
       g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt, 
       g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid,g_pjda_m.pjdapstdt,g_pjda_m.pjdadocno_desc, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002_desc,g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdamodid_desc,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdapstid_desc 
 
   
 
   #檢查是否允許此動作
   IF NOT apjt302_action_chk() THEN
      CLOSE apjt302_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_pjda_m.pjdadocno,g_pjda_m.pjdadocno_desc,g_pjda_m.pjdadocdt,g_pjda_m.pjdasite,g_pjda_m.pjda001, 
       g_pjda_m.pjda001_desc,g_pjda_m.pjda002,g_pjda_m.pjda002_desc,g_pjda_m.pjdastus,g_pjda_m.pjdaownid, 
       g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtid_desc, 
       g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamodid_desc, 
       g_pjda_m.pjdamoddt,g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid, 
       g_pjda_m.pjdapstid_desc,g_pjda_m.pjdapstdt
 
   CASE g_pjda_m.pjdastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_pjda_m.pjdastus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      CALL cl_set_act_visible("invalid",TRUE)
      IF g_pjda_m.pjdastus = 'Y' THEN 
         CALL cl_set_act_visible("invalid",FALSE)
      END IF
      #end add-point
      
      
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            CALL cl_err_collect_init() 
            CALL s_apjt302_unconf_chk(g_pjda_m.pjdadocno) RETURNING l_success
            CALL cl_err_collect_show()
            IF NOT l_success THEN
               LET lc_state = ''
            ELSE
               IF NOT cl_ask_confirm('aim-00110') THEN
                  LET lc_state = ''
               ELSE
                  CALL cl_err_collect_init() 
                  CALL s_apjt302_unconf_upd(g_pjda_m.pjdadocno) RETURNING l_success
                  CALL cl_err_collect_show()
                  IF NOT l_success THEN
                     LET lc_state = ''
                  END IF
               END IF
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            CALL cl_err_collect_init() 
            CALL s_apjt302_conf_chk(g_pjda_m.pjdadocno) RETURNING l_success
            CALL cl_err_collect_show()
            IF NOT l_success THEN
               LET lc_state = ''
            ELSE
               IF NOT cl_ask_confirm('aim-00108') THEN
                  LET lc_state = ''
               ELSE                 
                  CALL cl_err_collect_init() 
                  CALL s_apjt302_conf_upd(g_pjda_m.pjdadocno) RETURNING l_success
                  CALL cl_err_collect_show()
                  IF NOT l_success THEN
                     LET lc_state = ''
                  END IF
               END IF
            END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            CALL cl_err_collect_init() 
            CALL s_apjt302_invalid_chk(g_pjda_m.pjdadocno) RETURNING l_success
            CALL cl_err_collect_show()
            IF NOT l_success THEN
               LET lc_state = ''
            ELSE
               IF NOT cl_ask_confirm('aim-00109') THEN
                  LET lc_state = ''
               ELSE   
                  CALL cl_err_collect_init() 
                  CALL s_apjt302_invalid_upd(g_pjda_m.pjdadocno) RETURNING l_success
                  CALL cl_err_collect_show()
                  IF NOT l_success THEN
                     LET lc_state = ''
                  END IF
               END IF
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
      AND lc_state <> "X"
      ) OR 
      g_pjda_m.pjdastus = lc_state OR cl_null(lc_state) THEN
      CLOSE apjt302_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_pjda_m.pjdamodid = g_user
   LET g_pjda_m.pjdamoddt = cl_get_current()
   LET g_pjda_m.pjdastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE pjda_t 
      SET (pjdastus,pjdamodid,pjdamoddt) 
        = (g_pjda_m.pjdastus,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt)     
    WHERE pjdaent = g_enterprise AND pjdadocno = g_pjda_m.pjdadocno
 
    
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      #170801-00033 ---start---
      CLOSE apjt302_cl
      CALL s_transaction_end('N','0')
      RETURN
      #170801-00033 --- end ---
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE apjt302_master_referesh USING g_pjda_m.pjdadocno INTO g_pjda_m.pjdadocno,g_pjda_m.pjdadocdt, 
          g_pjda_m.pjdasite,g_pjda_m.pjda001,g_pjda_m.pjda002,g_pjda_m.pjdastus,g_pjda_m.pjdaownid,g_pjda_m.pjdaowndp, 
          g_pjda_m.pjdacrtid,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid,g_pjda_m.pjdamoddt, 
          g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfdt,g_pjda_m.pjdapstid,g_pjda_m.pjdapstdt,g_pjda_m.pjdadocno_desc, 
          g_pjda_m.pjda001_desc,g_pjda_m.pjda002_desc,g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp_desc, 
          g_pjda_m.pjdacrtid_desc,g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdamodid_desc,g_pjda_m.pjdacnfid_desc, 
          g_pjda_m.pjdapstid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_pjda_m.pjdadocno,g_pjda_m.pjdadocno_desc,g_pjda_m.pjdadocdt,g_pjda_m.pjdasite, 
          g_pjda_m.pjda001,g_pjda_m.pjda001_desc,g_pjda_m.pjda002,g_pjda_m.pjda002_desc,g_pjda_m.pjdastus, 
          g_pjda_m.pjdaownid,g_pjda_m.pjdaownid_desc,g_pjda_m.pjdaowndp,g_pjda_m.pjdaowndp_desc,g_pjda_m.pjdacrtid, 
          g_pjda_m.pjdacrtid_desc,g_pjda_m.pjdacrtdp,g_pjda_m.pjdacrtdp_desc,g_pjda_m.pjdacrtdt,g_pjda_m.pjdamodid, 
          g_pjda_m.pjdamodid_desc,g_pjda_m.pjdamoddt,g_pjda_m.pjdacnfid,g_pjda_m.pjdacnfid_desc,g_pjda_m.pjdacnfdt, 
          g_pjda_m.pjdapstid,g_pjda_m.pjdapstid_desc,g_pjda_m.pjdapstdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   CALL apjt302_show() 
   #end add-point  
 
   CLOSE apjt302_cl
   CALL s_transaction_end('Y','0')
   
   #(ver:20) ---start---
   #add-point:transaction結束後 name="statechange.transaction_after"
   
   #end add-point  
   #(ver:20) --- end --- 
 
   #功能已完成,通報訊息中心
   CALL apjt302_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="apjt302.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION apjt302_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   LET g_curr_diag = ui.DIALOG.getCurrent()   #(ver:83)
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_pjdb_d.getLength() THEN
         LET g_detail_idx = g_pjdb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_pjdb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_pjdb_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_pjdb2_d.getLength() THEN
         LET g_detail_idx = g_pjdb2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_pjdb2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_pjdb2_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION apjt302_b_fill2(pi_idx)
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
   
   CALL apjt302_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION apjt302_fill_chk(ps_idx)
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
 
{<section id="apjt302.status_show" >}
PRIVATE FUNCTION apjt302_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="apjt302.mask_functions" >}
&include "erp/apj/apjt302_mask.4gl"
 
{</section>}
 
{<section id="apjt302.signature" >}
   
 
{</section>}
 
{<section id="apjt302.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION apjt302_set_pk_array()
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
   LET g_pk_array[1].values = g_pjda_m.pjdadocno
   LET g_pk_array[1].column = 'pjdadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="apjt302.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="apjt302.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION apjt302_msgcentre_notify(lc_state)
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
   CALL apjt302_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_pjda_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="apjt302.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION apjt302_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="apjt302.other_function" readonly="Y" >}
################################################################################
#专案编号说明
################################################################################
PRIVATE FUNCTION apjt302_pjdb001_desc()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_pjdb_d[l_ac].pjdb001
   CALL ap_ref_array2(g_ref_fields,"SELECT pjbal003 FROM pjbal_t WHERE pjbalent='"||g_enterprise||"' AND pjbal001=? AND pjbal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_pjdb_d[l_ac].pjdb001_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_pjdb_d[l_ac].pjdb001_desc     
   CALL apjt302_pjdb001_desc_1()
END FUNCTION

################################################################################
# 专案编号带立项申请作业中的负责部门和专案负责人
################################################################################
PRIVATE FUNCTION apjt302_pjdb001_desc_1()
   INITIALIZE g_ref_fields TO NULL 
   LET g_ref_fields[1] = g_pjdb_d[l_ac].pjdb001
   CALL ap_ref_array2(g_ref_fields," SELECT pjab003,ooefl003,pjab004,ooag011 FROM pjab_t 
                                      LEFT JOIN ooefl_t ON ooeflent = pjabent AND ooefl001 = pjab003 AND ooefl002 = '"||g_dlang||"' 
                                      LEFT JOIN ooag_t ON ooagent = pjabent AND ooag001 = pjab004 
                                      WHERE pjabent = '"||g_enterprise||"' AND pjab001 = ? ","") RETURNING g_rtn_fields 
   LET g_pjdb_d[l_ac].pjab003 = g_rtn_fields[1] 
   LET g_pjdb_d[l_ac].pjab003_desc = g_rtn_fields[2]
   LET g_pjdb_d[l_ac].pjab004 = g_rtn_fields[3] 
   LET g_pjdb_d[l_ac].pjab004_desc = g_rtn_fields[4]    
   DISPLAY BY NAME g_pjdb_d[l_ac].pjab003,g_pjdb_d[l_ac].pjab003_desc,g_pjdb_d[l_ac].pjab004,g_pjdb_d[l_ac].pjab004_desc
END FUNCTION

################################################################################
#根据专案编号抓取订单单头相关资料
################################################################################
PRIVATE FUNCTION apjt302_pjdb001_ref()
DEFINE l_xmdcdocno  LIKE xmdc_t.xmdcdocno

   LET l_xmdcdocno = ''
   SELECT DISTINCT xmdadocno
     INTO l_xmdcdocno   
     FROM xmda_t,xmdc_t 
    WHERE xmdaent = xmdcent 
      AND xmdadocno = xmdcdocno
      AND xmdcent = g_enterprise
      AND xmdcsite = g_site
      AND xmdc036 = g_pjdb_d[l_ac].pjdb001
      AND xmdastus = 'Y'
      
   SELECT xmda004,pmaal003,xmda009,ooibl004,xmda010,oocql004,
          xmda015,ooail003,xmda016
     INTO g_pjdb_d[l_ac].pjdb002,g_pjdb_d[l_ac].pjdb002_desc,
          #161109-00032#1---s
          #g_pjdb_d[l_ac].pjdb003,g_pjdb_d[l_ac].pjdb003_desc,
          #g_pjdb_d[l_ac].pjdb004,g_pjdb_d[l_ac].pjdb004_desc,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb005_desc,
          #g_pjdb_d[l_ac].pjdb006
          g_pjdb2_d[l_ac].pjdb003,g_pjdb2_d[l_ac].pjdb003_desc,
          g_pjdb2_d[l_ac].pjdb004,g_pjdb2_d[l_ac].pjdb004_desc,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb005_desc,
          g_pjdb2_d[l_ac].pjdb006
          #161109-00032#1---e
     FROM xmda_t
     LEFT JOIN pmaal_t ON pmaalent= g_enterprise AND pmaal001=xmda004 AND pmaal002= g_dlang 
     LEFT JOIN ooibl_t ON ooiblent= g_enterprise AND ooibl002=xmda009 AND ooibl003= g_dlang 
     LEFT JOIN oocql_t ON oocqlent= g_enterprise AND oocql001='238' AND oocql002=xmda010 AND oocql003= g_dlang 
     LEFT JOIN ooail_t ON ooailent= g_enterprise AND ooail001=xmda015 AND ooail002= g_dlang       
    WHERE xmdaent = g_enterprise
      AND xmdadocno = l_xmdcdocno
   IF SQLCA.sqlcode = 100 THEN 
      LET g_pjdb_d[l_ac].pjdb002 = ''
      LET g_pjdb_d[l_ac].pjdb002_desc = ''  
      #161109-00032#1---s
      #LET g_pjdb_d[l_ac].pjdb003 = ''
      #LET g_pjdb_d[l_ac].pjdb003_desc = ''
      #LET g_pjdb_d[l_ac].pjdb004 = ''
      #LET g_pjdb_d[l_ac].pjdb004_desc = ''
      #LET g_pjdb_d[l_ac].pjdb005 = ''
      #LET g_pjdb_d[l_ac].pjdb005_desc = ''
      #LET g_pjdb_d[l_ac].pjdb006 = ''
      #LET g_pjdb_d[l_ac].pjdb007 = ''
      #LET g_pjdb_d[l_ac].pjdb007_desc = ''
      #LET g_pjdb_d[l_ac].pjdb008 = ''
      #LET g_pjdb_d[l_ac].pjdb009 = ''
      LET g_pjdb2_d[l_ac].pjdb003 = ''
      LET g_pjdb2_d[l_ac].pjdb003_desc = ''
      LET g_pjdb2_d[l_ac].pjdb004 = ''
      LET g_pjdb2_d[l_ac].pjdb004_desc = ''
      LET g_pjdb2_d[l_ac].pjdb005 = ''
      LET g_pjdb2_d[l_ac].pjdb005_desc = ''
      LET g_pjdb2_d[l_ac].pjdb006 = ''
      LET g_pjdb2_d[l_ac].pjdb007 = ''
      LET g_pjdb2_d[l_ac].pjdb007_desc = ''
      LET g_pjdb2_d[l_ac].pjdb008 = ''
      LET g_pjdb2_d[l_ac].pjdb009 = ''
      #161109-00032---e
      LET g_pjdb_d[l_ac].pjdb010 = ''
      LET g_pjdb_d[l_ac].pjdb011 = ''
   END IF
   
   SELECT xmdc016,oodbl004,oodb005,xmdc017,xmdc046,xmdc047
     #161109-00032#1---s
     #INTO g_pjdb_d[l_ac].pjdb007,g_pjdb_d[l_ac].pjdb007_desc,g_pjdb_d[l_ac].pjdb008,
     #     g_pjdb_d[l_ac].pjdb009,
     INTO g_pjdb2_d[l_ac].pjdb007,g_pjdb2_d[l_ac].pjdb007_desc,g_pjdb2_d[l_ac].pjdb008,
          g_pjdb2_d[l_ac].pjdb009,
     #161109-00032#1---e
          g_pjdb_d[l_ac].pjdb010,g_pjdb_d[l_ac].pjdb011
     FROM xmdc_t
     INNER JOIN oodb_t ON xmdcent = oodbent AND oodb001= g_ooef019 AND xmdc016=oodb002
     LEFT JOIN oodbl_t ON oodblent=g_enterprise AND oodbl001 = g_ooef019 AND oodbl002=xmdc016 AND oodbl003=g_dlang 
    WHERE xmdcent = g_enterprise
      AND xmdcdocno = l_xmdcdocno  
      AND xmdc036 = g_pjdb_d[l_ac].pjdb001
   IF SQLCA.sqlcode = 100 THEN 
      LET g_pjdb_d[l_ac].pjdb010 = ''
      LET g_pjdb_d[l_ac].pjdb011 = ''
   END IF
   SELECT SUM(pjdb014),SUM(pjdb042),SUM(pjdb043),SUM(pjdb044),SUM(pjdb045),
          SUM(pjdb046),SUM(pjdb047),SUM(pjdb048),SUM(pjdb049)
     INTO g_pjdb_d[l_ac].pjdb012,
          #g_pjdb_d[l_ac].pjdb034,g_pjdb_d[l_ac].pjdb035,g_pjdb_d[l_ac].pjdb036,g_pjdb_d[l_ac].pjdb037,  #161109-00032#5
          #g_pjdb_d[l_ac].pjdb038,g_pjdb_d[l_ac].pjdb039,g_pjdb_d[l_ac].pjdb040,g_pjdb_d[l_ac].pjdb041   #161109-00032#5
          g_pjdb2_d[l_ac].pjdb034,g_pjdb2_d[l_ac].pjdb035,g_pjdb2_d[l_ac].pjdb036,g_pjdb2_d[l_ac].pjdb037,  #161109-00032#5
          g_pjdb2_d[l_ac].pjdb038,g_pjdb2_d[l_ac].pjdb039,g_pjdb2_d[l_ac].pjdb040,g_pjdb2_d[l_ac].pjdb041   #161109-00032#5
     FROM pjdb_t,pjda_t
    WHERE pjdaent = pjdbent 
      AND pjdadocno = pjdbdocno
      AND pjdbent = g_enterprise
      AND pjdbsite = g_site
      AND pjdb001 = g_pjdb_d[l_ac].pjdb001
      AND pjdbdocno <> g_pjda_m.pjdadocno
      AND pjdastus <> 'X'
   IF cl_null(g_pjdb_d[l_ac].pjdb012) THEN 
      LET g_pjdb_d[l_ac].pjdb012 = 0
   END IF
   
   #170516-00015 add--s
   IF NOT cl_null(g_pjdb_d[l_ac].pjdb013) THEN
      LET g_pjdb_d[l_ac].pjdb014 = g_pjdb_d[l_ac].pjdb013 - g_pjdb_d[l_ac].pjdb012
   END IF
   #170516-00015 add--e
   
   #161109-00032#5---s
   #IF cl_null(g_pjdb_d[l_ac].pjdb034) THEN 
   #   LET g_pjdb_d[l_ac].pjdb034 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb035) THEN 
   #   LET g_pjdb_d[l_ac].pjdb035 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb036) THEN 
   #   LET g_pjdb_d[l_ac].pjdb036 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb037) THEN 
   #   LET g_pjdb_d[l_ac].pjdb037 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb038) THEN 
   #   LET g_pjdb_d[l_ac].pjdb038 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb039) THEN 
   #   LET g_pjdb_d[l_ac].pjdb039 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb040) THEN 
   #   LET g_pjdb_d[l_ac].pjdb040 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb041) THEN 
   #   LET g_pjdb_d[l_ac].pjdb041 = 0
   #END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb034) THEN 
      LET g_pjdb2_d[l_ac].pjdb034 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb035) THEN 
      LET g_pjdb2_d[l_ac].pjdb035 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb036) THEN 
      LET g_pjdb2_d[l_ac].pjdb036 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb037) THEN 
      LET g_pjdb2_d[l_ac].pjdb037 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb038) THEN 
      LET g_pjdb2_d[l_ac].pjdb038 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb039) THEN 
      LET g_pjdb2_d[l_ac].pjdb039 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb040) THEN 
      LET g_pjdb2_d[l_ac].pjdb040 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb041) THEN 
      LET g_pjdb2_d[l_ac].pjdb041 = 0
   END IF
   #161109-00032#5---e
   
   
   #161221-00015#1 mod-S  
#   #161109-00032#1---s
#   LET g_pjdb_d[l_ac].pjdb003 = g_pjdb2_d[l_ac].pjdb003
#   LET g_pjdb_d[l_ac].pjdb004 = g_pjdb2_d[l_ac].pjdb004
#   LET g_pjdb_d[l_ac].pjdb005 = g_pjdb2_d[l_ac].pjdb005
#   LET g_pjdb_d[l_ac].pjdb006 = g_pjdb2_d[l_ac].pjdb006
#   LET g_pjdb_d[l_ac].pjdb007 = g_pjdb2_d[l_ac].pjdb007
#   LET g_pjdb_d[l_ac].pjdb008 = g_pjdb2_d[l_ac].pjdb008
#   LET g_pjdb_d[l_ac].pjdb009 = g_pjdb2_d[l_ac].pjdb009
#   #161109-00032---e
   #161221-00015#1 mod-E
   
   SELECT pjba051,pjba052,pjba053,pjba054,pjba055,pjba056,pjba057,pjba058 
     #161109-00032#5---s
     #INTO g_pjdb_d[l_ac].pjdb026,g_pjdb_d[l_ac].pjdb027,g_pjdb_d[l_ac].pjdb028,g_pjdb_d[l_ac].pjdb029,
     #     g_pjdb_d[l_ac].pjdb030,g_pjdb_d[l_ac].pjdb031,g_pjdb_d[l_ac].pjdb032,g_pjdb_d[l_ac].pjdb033
     INTO g_pjdb2_d[l_ac].pjdb026,g_pjdb2_d[l_ac].pjdb027,g_pjdb2_d[l_ac].pjdb028,g_pjdb2_d[l_ac].pjdb029,
          g_pjdb2_d[l_ac].pjdb030,g_pjdb2_d[l_ac].pjdb031,g_pjdb2_d[l_ac].pjdb032,g_pjdb2_d[l_ac].pjdb033          
     #161109-00032#5---s
     FROM pjba_t
    WHERE pjbaent = g_enterprise
      AND pjba001 = g_pjdb_d[l_ac].pjdb001
   #161109-00032#5---s
   #IF cl_null(g_pjdb_d[l_ac].pjdb026) THEN 
   #   LET g_pjdb_d[l_ac].pjdb026 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb027) THEN 
   #   LET g_pjdb_d[l_ac].pjdb027 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb028) THEN 
   #   LET g_pjdb_d[l_ac].pjdb028 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb029) THEN 
   #   LET g_pjdb_d[l_ac].pjdb029 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb030) THEN 
   #   LET g_pjdb_d[l_ac].pjdb030 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb031) THEN 
   #   LET g_pjdb_d[l_ac].pjdb031 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb032) THEN 
   #   LET g_pjdb_d[l_ac].pjdb032 = 0
   #END IF
   #IF cl_null(g_pjdb_d[l_ac].pjdb033) THEN 
   #   LET g_pjdb_d[l_ac].pjdb033 = 0
   #END IF    
   IF cl_null(g_pjdb2_d[l_ac].pjdb026) THEN 
      LET g_pjdb2_d[l_ac].pjdb026 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb027) THEN 
      LET g_pjdb2_d[l_ac].pjdb027 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb028) THEN 
      LET g_pjdb2_d[l_ac].pjdb028 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb029) THEN 
      LET g_pjdb2_d[l_ac].pjdb029 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb030) THEN 
      LET g_pjdb2_d[l_ac].pjdb030 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb031) THEN 
      LET g_pjdb2_d[l_ac].pjdb031 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb032) THEN 
      LET g_pjdb2_d[l_ac].pjdb032 = 0
   END IF
   IF cl_null(g_pjdb2_d[l_ac].pjdb033) THEN 
      LET g_pjdb2_d[l_ac].pjdb033 = 0
   END IF   
   #161109-00032#5---e
   
   #161109-00032#5 mod-S
#   IF NOT cl_null(g_pjdb_d[l_ac].pjdb005) THEN  
#      LET g_pjdb_d[l_ac].pjdb012 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb012,'2')
#      LET g_pjdb_d[l_ac].pjdb026 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb026,'2') 
#      LET g_pjdb_d[l_ac].pjdb027 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb027,'2')
#      LET g_pjdb_d[l_ac].pjdb028 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb028,'2')
#      LET g_pjdb_d[l_ac].pjdb029 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb029,'2')
#      LET g_pjdb_d[l_ac].pjdb030 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb030,'2')
#      LET g_pjdb_d[l_ac].pjdb031 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb031,'2')
#      LET g_pjdb_d[l_ac].pjdb032 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb032,'2')
#      LET g_pjdb_d[l_ac].pjdb033 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb033,'2')     
#      LET g_pjdb_d[l_ac].pjdb034 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb034,'2') 
#      LET g_pjdb_d[l_ac].pjdb035 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb035,'2')
#      LET g_pjdb_d[l_ac].pjdb036 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb036,'2')
#      LET g_pjdb_d[l_ac].pjdb037 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb037,'2')
#      LET g_pjdb_d[l_ac].pjdb038 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb038,'2')
#      LET g_pjdb_d[l_ac].pjdb039 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb039,'2')
#      LET g_pjdb_d[l_ac].pjdb040 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb040,'2')
#      LET g_pjdb_d[l_ac].pjdb041 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb041,'2')
#   END IF   
   IF NOT cl_null(g_pjdb2_d[l_ac].pjdb005) THEN  
      LET g_pjdb_d[l_ac].pjdb012 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb012,'2')
      LET g_pjdb2_d[l_ac].pjdb026 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb026,'2') 
      LET g_pjdb2_d[l_ac].pjdb027 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb027,'2')
      LET g_pjdb2_d[l_ac].pjdb028 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb028,'2')
      LET g_pjdb2_d[l_ac].pjdb029 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb029,'2')
      LET g_pjdb2_d[l_ac].pjdb030 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb030,'2')
      LET g_pjdb2_d[l_ac].pjdb031 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb031,'2')
      LET g_pjdb2_d[l_ac].pjdb032 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb032,'2')
      LET g_pjdb2_d[l_ac].pjdb033 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb033,'2')     
      LET g_pjdb2_d[l_ac].pjdb034 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb034,'2') 
      LET g_pjdb2_d[l_ac].pjdb035 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb035,'2')
      LET g_pjdb2_d[l_ac].pjdb036 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb036,'2')
      LET g_pjdb2_d[l_ac].pjdb037 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb037,'2')
      LET g_pjdb2_d[l_ac].pjdb038 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb038,'2')
      LET g_pjdb2_d[l_ac].pjdb039 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb039,'2')
      LET g_pjdb2_d[l_ac].pjdb040 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb040,'2')
      LET g_pjdb2_d[l_ac].pjdb041 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb041,'2')
   END IF  
   #161109-00032#5 mod-E
   
END FUNCTION

################################################################################
#专案编号抓取订单，如果有对应多笔订单则报错不给于继续维护此专案编号
################################################################################
PRIVATE FUNCTION apjt302_pjdb001_chk()
DEFINE l_cnt     LIKE type_t.num5
DEFINE r_success LIKE type_t.num5
  
   LET r_success = TRUE
   LET l_cnt = 0

   SELECT COUNT(xmdcdocno)
     INTO l_cnt   
     FROM xmda_t,xmdc_t 
    WHERE xmdaent = xmdcent 
      AND xmdadocno = xmdcdocno
      AND xmdcent = g_enterprise
      AND xmdcsite = g_site
      AND xmdc036 = g_pjdb_d[l_ac].pjdb001
      AND xmdastus = 'Y'      
   IF l_cnt > 1 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = g_pjdb_d[l_ac].pjdb001 
      LET g_errparam.code   = "apj-00075" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
      LET r_success = FALSE
      RETURN r_success
   END IF
   IF l_cnt = 0 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = g_pjdb_d[l_ac].pjdb001 
      LET g_errparam.code   = "apj-00090" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
      LET r_success = FALSE
      RETURN r_success
   END IF   
   
   LET l_cnt = 0
   SELECT COUNT(*) 
     INTO l_cnt
     FROM pjda_t,pjdb_t
    WHERE pjdaent = pjdbent
      AND pjdasite = pjdbsite
      AND pjdadocno = pjdbdocno
      AND pjdaent = g_enterprise
      AND pjdasite = g_site
      AND pjdb001 = g_pjdb_d[l_ac].pjdb001
      AND pjdastus = 'N'
      AND pjdadocno <> g_pjda_m.pjdadocno      
   IF l_cnt > 0 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = g_pjdb_d[l_ac].pjdb001 
      LET g_errparam.code   = "apj-00074" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
      LET r_success = FALSE
      RETURN r_success
   END IF  
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 当前进度/本期未税金额/本期含税金额有调整时，重新抓取本期未税金额和本期含税金额
################################################################################
PRIVATE FUNCTION apjt302_get_amt(p_type)
DEFINE p_type       LIKE type_t.chr1
  
   CASE p_type
      WHEN '1'
         #161221-00015#1 mod-S
#         IF g_pjdb_d[l_ac].pjdb008 = 'Y' THEN 
         IF g_pjdb2_d[l_ac].pjdb008 = 'Y' THEN 
         #161221-00015#1 mod-E
            LET g_pjdb_d[l_ac].pjdb016 = g_pjdb_d[l_ac].pjdb011 * g_pjdb_d[l_ac].pjdb014/100
            #161109-00032#5 mod-S
#            LET g_pjdb_d[l_ac].pjdb016 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb016,'2')
            LET g_pjdb_d[l_ac].pjdb016 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb016,'2')
#            LET g_pjdb_d[l_ac].pjdb015 = g_pjdb_d[l_ac].pjdb016/(1+g_pjdb_d[l_ac].pjdb009/100)
            LET g_pjdb_d[l_ac].pjdb015 = g_pjdb_d[l_ac].pjdb016/(1+g_pjdb2_d[l_ac].pjdb009/100)
#            LET g_pjdb_d[l_ac].pjdb015 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb015,'2')
            LET g_pjdb_d[l_ac].pjdb015 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb015,'2')
            #161109-00032#5 mod-E
         ELSE
            LET g_pjdb_d[l_ac].pjdb015 = g_pjdb_d[l_ac].pjdb010 * g_pjdb_d[l_ac].pjdb014/100
            #161109-00032#5 mod-S
#            LET g_pjdb_d[l_ac].pjdb015 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb015,'2')
            LET g_pjdb_d[l_ac].pjdb015 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb015,'2')
#            LET g_pjdb_d[l_ac].pjdb016 = g_pjdb_d[l_ac].pjdb015 * (1+g_pjdb_d[l_ac].pjdb009/100)
            LET g_pjdb_d[l_ac].pjdb016 = g_pjdb_d[l_ac].pjdb015 * (1+g_pjdb2_d[l_ac].pjdb009/100)
#            LET g_pjdb_d[l_ac].pjdb016 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb016,'2')            
            LET g_pjdb_d[l_ac].pjdb016 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb016,'2')            
            #161109-00032#5 mod-E
         END IF
         IF g_pjdb_d[l_ac].pjdb013 = 100 THEN 
            #161109-00032#5---s
            #LET g_pjdb_d[l_ac].pjdb042 = g_pjdb_d[l_ac].pjdb026 - g_pjdb_d[l_ac].pjdb034
            #LET g_pjdb_d[l_ac].pjdb043 = g_pjdb_d[l_ac].pjdb027 - g_pjdb_d[l_ac].pjdb035
            #LET g_pjdb_d[l_ac].pjdb044 = g_pjdb_d[l_ac].pjdb028 - g_pjdb_d[l_ac].pjdb036
            #LET g_pjdb_d[l_ac].pjdb045 = g_pjdb_d[l_ac].pjdb029 - g_pjdb_d[l_ac].pjdb037
            #LET g_pjdb_d[l_ac].pjdb046 = g_pjdb_d[l_ac].pjdb030 - g_pjdb_d[l_ac].pjdb038
            #LET g_pjdb_d[l_ac].pjdb047 = g_pjdb_d[l_ac].pjdb031 - g_pjdb_d[l_ac].pjdb039
            #LET g_pjdb_d[l_ac].pjdb048 = g_pjdb_d[l_ac].pjdb032 - g_pjdb_d[l_ac].pjdb040
            #LET g_pjdb_d[l_ac].pjdb049 = g_pjdb_d[l_ac].pjdb033 - g_pjdb_d[l_ac].pjdb041
            LET g_pjdb2_d[l_ac].pjdb042 = g_pjdb2_d[l_ac].pjdb026 - g_pjdb2_d[l_ac].pjdb034
            LET g_pjdb2_d[l_ac].pjdb043 = g_pjdb2_d[l_ac].pjdb027 - g_pjdb2_d[l_ac].pjdb035
            LET g_pjdb2_d[l_ac].pjdb044 = g_pjdb2_d[l_ac].pjdb028 - g_pjdb2_d[l_ac].pjdb036
            LET g_pjdb2_d[l_ac].pjdb045 = g_pjdb2_d[l_ac].pjdb029 - g_pjdb2_d[l_ac].pjdb037
            LET g_pjdb2_d[l_ac].pjdb046 = g_pjdb2_d[l_ac].pjdb030 - g_pjdb2_d[l_ac].pjdb038
            LET g_pjdb2_d[l_ac].pjdb047 = g_pjdb2_d[l_ac].pjdb031 - g_pjdb2_d[l_ac].pjdb039
            LET g_pjdb2_d[l_ac].pjdb048 = g_pjdb2_d[l_ac].pjdb032 - g_pjdb2_d[l_ac].pjdb040
            LET g_pjdb2_d[l_ac].pjdb049 = g_pjdb2_d[l_ac].pjdb033 - g_pjdb2_d[l_ac].pjdb041
            #161109-00032#5---e
         ELSE
            #161109-00032#5---s
            #LET g_pjdb_d[l_ac].pjdb042 = g_pjdb_d[l_ac].pjdb026*g_pjdb_d[l_ac].pjdb014/100
            #LET g_pjdb_d[l_ac].pjdb043 = g_pjdb_d[l_ac].pjdb027*g_pjdb_d[l_ac].pjdb014/100
            #LET g_pjdb_d[l_ac].pjdb044 = g_pjdb_d[l_ac].pjdb028*g_pjdb_d[l_ac].pjdb014/100
            #LET g_pjdb_d[l_ac].pjdb045 = g_pjdb_d[l_ac].pjdb029*g_pjdb_d[l_ac].pjdb014/100
            #LET g_pjdb_d[l_ac].pjdb046 = g_pjdb_d[l_ac].pjdb030*g_pjdb_d[l_ac].pjdb014/100
            #LET g_pjdb_d[l_ac].pjdb047 = g_pjdb_d[l_ac].pjdb031*g_pjdb_d[l_ac].pjdb014/100
            #LET g_pjdb_d[l_ac].pjdb048 = g_pjdb_d[l_ac].pjdb032*g_pjdb_d[l_ac].pjdb014/100
            #LET g_pjdb_d[l_ac].pjdb049 = g_pjdb_d[l_ac].pjdb033*g_pjdb_d[l_ac].pjdb014/100 
            LET g_pjdb2_d[l_ac].pjdb042 = g_pjdb2_d[l_ac].pjdb026*g_pjdb_d[l_ac].pjdb014/100
            LET g_pjdb2_d[l_ac].pjdb043 = g_pjdb2_d[l_ac].pjdb027*g_pjdb_d[l_ac].pjdb014/100
            LET g_pjdb2_d[l_ac].pjdb044 = g_pjdb2_d[l_ac].pjdb028*g_pjdb_d[l_ac].pjdb014/100
            LET g_pjdb2_d[l_ac].pjdb045 = g_pjdb2_d[l_ac].pjdb029*g_pjdb_d[l_ac].pjdb014/100
            LET g_pjdb2_d[l_ac].pjdb046 = g_pjdb2_d[l_ac].pjdb030*g_pjdb_d[l_ac].pjdb014/100
            LET g_pjdb2_d[l_ac].pjdb047 = g_pjdb2_d[l_ac].pjdb031*g_pjdb_d[l_ac].pjdb014/100
            LET g_pjdb2_d[l_ac].pjdb048 = g_pjdb2_d[l_ac].pjdb032*g_pjdb_d[l_ac].pjdb014/100
            LET g_pjdb2_d[l_ac].pjdb049 = g_pjdb2_d[l_ac].pjdb033*g_pjdb_d[l_ac].pjdb014/100 
            #161109-00032#5---e
            
            #161109-00032#5 mod-S
#            LET g_pjdb_d[l_ac].pjdb042 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb042,'2')
#            LET g_pjdb_d[l_ac].pjdb043 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb043,'2')
#            LET g_pjdb_d[l_ac].pjdb044 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb044,'2')
#            LET g_pjdb_d[l_ac].pjdb045 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb045,'2')
#            LET g_pjdb_d[l_ac].pjdb046 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb046,'2')
#            LET g_pjdb_d[l_ac].pjdb047 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb047,'2')
#            LET g_pjdb_d[l_ac].pjdb048 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb048,'2')
#            LET g_pjdb_d[l_ac].pjdb049 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb049,'2')          
            LET g_pjdb2_d[l_ac].pjdb042 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb042,'2')
            LET g_pjdb2_d[l_ac].pjdb043 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb043,'2')
            LET g_pjdb2_d[l_ac].pjdb044 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb044,'2')
            LET g_pjdb2_d[l_ac].pjdb045 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb045,'2')
            LET g_pjdb2_d[l_ac].pjdb046 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb046,'2')
            LET g_pjdb2_d[l_ac].pjdb047 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb047,'2')
            LET g_pjdb2_d[l_ac].pjdb048 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb048,'2')
            LET g_pjdb2_d[l_ac].pjdb049 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb2_d[l_ac].pjdb049,'2')          
            #161109-00032#5 mod-E
         END IF         
      WHEN '2'
         #161109-00032#5 mod-S
#         LET g_pjdb_d[l_ac].pjdb016 = g_pjdb_d[l_ac].pjdb015 * (1+g_pjdb_d[l_ac].pjdb009/100)
         LET g_pjdb_d[l_ac].pjdb016 = g_pjdb_d[l_ac].pjdb015 * (1+g_pjdb2_d[l_ac].pjdb009/100)
#         LET g_pjdb_d[l_ac].pjdb016 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb016,'2')         
         LET g_pjdb_d[l_ac].pjdb016 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb016,'2')         
         #161109-00032#5 mod-E
      WHEN '3'
         #161109-00032#5 mod-S
#         LET g_pjdb_d[l_ac].pjdb015 = g_pjdb_d[l_ac].pjdb016/(1+g_pjdb_d[l_ac].pjdb009/100)
         LET g_pjdb_d[l_ac].pjdb015 = g_pjdb_d[l_ac].pjdb016/(1+g_pjdb2_d[l_ac].pjdb009/100)
#         LET g_pjdb_d[l_ac].pjdb015 = s_curr_round(g_site,g_pjdb_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb015,'2')      
         LET g_pjdb_d[l_ac].pjdb015 = s_curr_round(g_site,g_pjdb2_d[l_ac].pjdb005,g_pjdb_d[l_ac].pjdb015,'2')      
         #161109-00032#5 mod-E
   END CASE
END FUNCTION

################################################################################
#已经报工的本期未税金额之和不能超过合同未税金额
################################################################################
PRIVATE FUNCTION apjt302_pjdb015_chk()
DEFINE l_sum     LIKE pjdb_t.pjdb015
DEFINE r_success LIKE type_t.num5

   LET r_success = TRUE
   SELECT SUM(pjdn015) INTO l_sum
     FROM pjdb_t,pjda_t
    WHERE pjdaent = pjdbent
      AND pjdasite = pjdbsite
      AND pjdadocno = pjdbdocno
      AND pjdaent = g_enterprise
      AND pjdasite = g_site
      AND pjdadocno <> g_pjda_m.pjdadocno
      AND pjdastus = 'Y' 
   IF cl_null(l_sum) THEN LET l_sum = 0 END IF  
   IF l_sum + g_pjdb_d[l_ac].pjdb015 > g_pjdb_d[l_ac].pjdb010 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = g_pjdb_d[l_ac].pjdb015 
      LET g_errparam.code   = "apj-00079" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
      LET r_success = FALSE
      RETURN r_success
   END IF
   RETURN r_success
END FUNCTION

################################################################################
#已经报工的本期含税金额之和不能超过合同含税金额
################################################################################
PRIVATE FUNCTION apjt302_pjdb016_chk()
DEFINE l_sum     LIKE pjdb_t.pjdb015
DEFINE r_success LIKE type_t.num5

   LET r_success = TRUE
   SELECT SUM(pjdn016) INTO l_sum
     FROM pjdb_t,pjda_t
    WHERE pjdaent = pjdbent
      AND pjdasite = pjdbsite
      AND pjdadocno = pjdbdocno
      AND pjdaent = g_enterprise
      AND pjdasite = g_site
      AND pjdadocno <> g_pjda_m.pjdadocno
      AND pjdastus = 'Y' 
   IF cl_null(l_sum) THEN LET l_sum = 0 END IF  
   IF l_sum + g_pjdb_d[l_ac].pjdb016 > g_pjdb_d[l_ac].pjdb011 THEN 
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = g_pjdb_d[l_ac].pjdb016 
      LET g_errparam.code   = "apj-00080" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
      LET r_success = FALSE
      RETURN r_success
   END IF
   RETURN r_success
END FUNCTION

 
{</section>}
 
