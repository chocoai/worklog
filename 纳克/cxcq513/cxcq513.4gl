{<section id="cxcq513.description" >}
#應用 a00 樣板自動產生(Version:2)
#+ Version..: T100-ERP-1.01.00(SD版次:5,PR版次:5) Build-000001
#+ 
#+ Filename...: cxcq513
#+ Description: 
#+ Creator....: tiptop(2016-08-11 11:33:09)
#+ Modifier...: tiptop(2016-08-12 01:01:25) -SD/PR- tiptop(2016-11-29 11:09:22)
 
{</section>}
 
{<section id="cxcq513.global" >}
#應用 q04 樣板自動產生(Version:27)
#add-point:填寫註解說明 name="global.memo"

#end add-point
 
IMPORT os
IMPORT util
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_master        RECORD
       xckbcomp LIKE xckb_t.xckbcomp, 
   xckbcomp_desc LIKE type_t.chr80, 
   xckbld LIKE xckb_t.xckbld, 
   xckbld_desc LIKE type_t.chr80, 
   xckb007 LIKE xckb_t.xckb007, 
   xckb008 LIKE xckb_t.xckb008, 
   ca LIKE type_t.chr500
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_detail RECORD
       
       xckb003 LIKE xckb_t.xckb003, 
   xckb004 LIKE xckb_t.xckb004, 
   xckb005 LIKE xckb_t.xckb005, 
   xckb006 LIKE xckb_t.xckb006, 
   xckb009 LIKE xckb_t.xckb009, 
   xckb009_desc LIKE type_t.chr500, 
   xckb010 LIKE xckb_t.xckb010, 
   xckb010_desc LIKE type_t.chr500, 
   xckb011 LIKE xckb_t.xckb011, 
   xckb011_desc LIKE type_t.chr500, 
   xckb012 LIKE xckb_t.xckb012, 
   xckb012_desc LIKE type_t.chr500, 
   xckb012_desc2 LIKE type_t.chr500, 
   imag011 LIKE imag_t.imag011, 
   imag011_desc LIKE type_t.chr500, 
   imaaud005 LIKE imaa_t.imaaud005, 
   xckb013 LIKE xckb_t.xckb013, 
   xckb014 LIKE xckb_t.xckb014, 
   xckb015 LIKE xckb_t.xckb015, 
   xckb015_desc LIKE type_t.chr500, 
   xckb102 LIKE xckb_t.xckb102, 
   xckb101 LIKE xckb_t.xckb101, 
   xckb101a LIKE xckb_t.xckb101a, 
   xckb101b LIKE xckb_t.xckb101b, 
   xckb101c LIKE xckb_t.xckb101c, 
   xckb101d LIKE xckb_t.xckb101d, 
   xckb101e LIKE xckb_t.xckb101e, 
   xckb101f LIKE xckb_t.xckb101f, 
   xckb101g LIKE xckb_t.xckb101g, 
   xckb101h LIKE xckb_t.xckb101h, 
   isag101 LIKE isag_t.isag101, 
   isag113 LIKE isag_t.isag113, 
   isag114 LIKE isag_t.isag114, 
   isagud011 LIKE isag_t.isagud011
       END RECORD
PRIVATE TYPE type_g_detail2 RECORD
       xckc004 LIKE xckc_t.xckc004, 
   xckc004_desc LIKE type_t.chr500, 
   xckc004_desc2 LIKE type_t.chr500, 
   imag011 LIKE imag_t.imag011, 
   imag011_0_desc LIKE type_t.chr500, 
   imaaud005 LIKE imaa_t.imaaud005, 
   xckb011 LIKE xckb_t.xckb011, 
   xckb011_0_desc LIKE type_t.chr500, 
   xckc006 LIKE xckc_t.xckc006, 
   xckc003 LIKE xckc_t.xckc003, 
   xckc003_desc LIKE type_t.chr500, 
   xckb015 LIKE xckb_t.xckb015, 
   xckb015_0_desc LIKE type_t.chr500, 
   xckc011 LIKE xckc_t.xckc011, 
   xckc012 LIKE xckc_t.xckc012, 
   isag113 LIKE isag_t.isag113, 
   isag114 LIKE isag_t.isag114, 
   isagud011 LIKE isag_t.isagud011
       END RECORD
 
 
 
#add-point:自定義模組變數-標準(Module Variable)  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
 
#end add-point
 
#模組變數(Module Variables)
DEFINE g_master            type_g_master
DEFINE g_master_t          type_g_master
 
   
 
DEFINE g_detail            DYNAMIC ARRAY OF type_g_detail
DEFINE g_detail_t          type_g_detail
DEFINE g_detail2     DYNAMIC ARRAY OF type_g_detail2
DEFINE g_detail2_t   type_g_detail2
 
 
 
DEFINE g_wc                  STRING                        #儲存 user 的查詢條件
DEFINE g_wc_t                STRING                        #儲存 user 的查詢條件
DEFINE g_wc2                 STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
DEFINE g_sql                 STRING                        #組 sql 用 
DEFINE g_cnt_sql             STRING                        #組 sql 用 
DEFINE g_forupd_sql          STRING                        #SELECT ... FOR UPDATE  SQL    
DEFINE g_cnt                 LIKE type_t.num10              
DEFINE l_ac                  LIKE type_t.num10             #目前處理的ARRAY CNT 
DEFINE g_curr_diag           ui.Dialog                     #Current Dialog     
DEFINE gwin_curr             ui.Window                     #Current Window
DEFINE gfrm_curr             ui.Form                       #Current Form
DEFINE g_current_page        LIKE type_t.num5              #目前所在頁數
DEFINE g_current_row         LIKE type_t.num10             #目前所在筆數
DEFINE g_current_idx         LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10             #單身 總筆數(所有資料)
DEFINE g_page                STRING                        #第幾頁
DEFINE g_ch                  base.Channel                  #外串程式用
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_error_show          LIKE type_t.num5
DEFINE g_master_idx          LIKE type_t.num10
DEFINE g_detail_idx          LIKE type_t.num10             #單身 所在筆數(所有資料)
DEFINE g_detail_idx2         LIKE type_t.num10
DEFINE g_hyper_url           STRING                        #hyperlink的主要網址
DEFINE g_msg                 STRING
DEFINE g_jump                LIKE type_t.num10
DEFINE g_no_ask              LIKE type_t.num5
DEFINE g_row_count           LIKE type_t.num10
DEFINE g_qbe_hidden          LIKE type_t.num5              #qbe頁籤折疊
DEFINE g_tot_cnt             LIKE type_t.num10             #計算總筆數
DEFINE g_num_in_page         LIKE type_t.num10             #每頁筆數
DEFINE g_page_act_list       STRING                        #分頁ACTION清單
DEFINE g_current_row_tot     LIKE type_t.num10             #目前所在總筆數
DEFINE g_page_start_num      LIKE type_t.num10             #目前頁面起始筆數
DEFINE g_page_end_num        LIKE type_t.num10             #目前頁面結束筆數
DEFINE g_master_row_move     LIKE type_t.chr1              #是否為單頭筆數更動
 
#多table用wc
DEFINE g_wc_table           STRING
DEFINE g_detail_page_action STRING
DEFINE g_pagestart          LIKE type_t.num10
 
 
 
DEFINE g_wc_filter_table           STRING
 
 
 
#add-point:自定義模組變數-客製(Module Variable) name="global.variable_customerization"
TYPE type_tm RECORD  #左边查询区域
             xckbcomp LIKE xckb_t.xckbcomp,
             xckbld   LIKE xckb_t.xckbld,
             xckb007  LIKE xckb_t.xckb007, 
             xckb008  LIKE xckb_t.xckb008, 
             xckb009  LIKE xckb_t.xckb009, 
             xckb012  LIKE xckb_t.xckb012, 
             xckb015  LIKE xckb_t.xckb015,
             ca       LIKE type_t.chr1   #汇总条件
             END RECORD
DEFINE tm    type_tm

DEFINE g_browser  DYNAMIC ARRAY OF RECORD    #資料瀏覽之欄位,中间变量，用于笔数定位
                  xckbcomp LIKE xckb_t.xckbcomp,
                  xckbld   LIKE xckb_t.xckbld,
                  xckb007  LIKE xckb_t.xckb007, 
                  xckb008  LIKE xckb_t.xckb008
                  END RECORD 
                  
DEFINE g_qbe_hidden_t       LIKE type_t.num5              #qbe頁籤折疊
DEFINE g_glaa015             LIKE glaa_t.glaa015
DEFINE g_glaa019             LIKE glaa_t.glaa019
#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="cxcq513.main" >}
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
   CALL cl_ap_init("cxc","")
 
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
   DECLARE cxcq513_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT  ",
               " FROM  t0",
               
               " WHERE  "
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
 
   #end add-point
   PREPARE cxcq513_master_referesh FROM g_sql
 
   #add-point:main段define_sql name="main.body.define_sql"
   
   #end add-point 
   LET g_forupd_sql = ""
   #add-point:main段define_sql name="main.body.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE cxcq513_bcl CURSOR FROM g_forupd_sql
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_cxcq513 WITH FORM cl_ap_formpath("cxc",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL cxcq513_init()   
 
      #進入選單 Menu (="N")
      CALL cxcq513_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_cxcq513
      
   END IF 
   
   CLOSE cxcq513_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="cxcq513.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION cxcq513_init()
   #add-point:init段define-客製 name="init.define_customerization"
   
   #end add-point
   #add-point:init段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="init.before_function"
   
   #end add-point
 
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1" 
   LET g_error_show  = 1
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_master_row_move = "Y"
   
     
 
   #add-point:畫面資料初始化 name="init.init"

   CALL cl_set_act_visible_toolbaritem("insert,datainfo,output",FALSE)
   #end add-point
 
   CALL cxcq513_default_search()
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.default_search" >}
PRIVATE FUNCTION cxcq513_default_search()
   #add-point:default_search段define-客製 name="default_search.define_customerization"
   
   #end add-point
   #add-point:default_search段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point
 
 
   #add-point:default_search段開始前 name="default_search.before"
   
   #end add-point
 
   
 
   IF NOT cl_null(g_wc) THEN
      LET g_wc = g_wc.subString(1,g_wc.getLength()-5)
   ELSE
      #預設查詢條件
      LET g_wc = " 1=2"
   END IF
 
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION cxcq513_ui_dialog() 
   #add-point:ui_dialog段define-客製 name="ui_dialog.define_customerization"
   DEFINE l_xcbk001  LIKE xcbk_t.xcbk001 #无用
   #end add-point
   DEFINE li_exit   LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx    LIKE type_t.num10
   DEFINE ls_result STRING
   DEFINE la_param  RECORD
                    prog       STRING,
                    actionid   STRING,
                    background LIKE type_t.chr1,
                    param      DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   DEFINE ls_wc     STRING
   DEFINE lc_action_choice_old    STRING
   #add-point:ui_dialog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
 
   #end add-point
 
   #add-point:FUNCTION前置處理 name="ui_dialog.before_function"
   
   #end add-point
 
   CLEAR FORM  
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_get_num_in_page() RETURNING g_num_in_page
 
   LET li_exit = FALSE
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   LET g_current_idx = 1
   LET g_action_choice = " "
   LET lc_action_choice_old = ""
   LET g_current_row_tot = 0
   LET g_page_start_num = 1
   LET g_page_end_num = g_num_in_page
   LET g_master_row_move = "Y"
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   LET l_ac = 1
 
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   IF cl_null(tm.ca) THEN
      LET tm.ca = '3'
   END IF
   IF cl_null(g_wc) OR g_wc=" 1=1" OR g_wc=" 1=2"  THEN
      #预设当前site的法人，主账套，年度期别，#成本计算类型
      CALL s_axc_set_site_default() RETURNING tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008,l_xcbk001
   END IF
   #end add-point
 
   
 
   IF NOT cl_null(g_wc) AND g_wc != " 1=2" THEN
      CALL cxcq513_cs()
   END IF
 
   WHILE li_exit = FALSE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         INITIALIZE g_master.* TO NULL
         CALL g_detail.clear()
         CALL g_detail2.clear()
 
 
         LET g_wc  = " 1=2"
         LET g_wc2 = " 1=1"
         LET g_action_choice = ""
         LET g_detail_page_action = "detail_first"
         LET g_pagestart = 1
         LET g_current_row_tot = 0
         LET g_page_start_num = 1
         LET g_page_end_num = g_num_in_page
         LET g_master_row_move = "Y"
         LET g_detail_idx = 1
         LET g_detail_idx2 = 1
 
         CALL cxcq513_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:input段落 name="ui_dialog.input"
         INPUT BY NAME tm.ca
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            ON CHANGE ca

         END INPUT
         #end add-point
 
         #add-point:construct段落 name="ui_dialog.construct"
         CONSTRUCT BY NAME g_wc ON xckbcomp,xckbld,xckb007,xckb008,xckb009,xckb012,xckb015      
            BEFORE CONSTRUCT
               DISPLAY BY NAME tm.xckbcomp,tm.xckbld,tm.xckb007,tm.xckb008
               
            AFTER FIELD xckbcomp
               LET tm.xckbcomp= GET_FLDBUF(xckbcomp)
               
            AFTER FIELD xckbld
               LET tm.xckbld  = GET_FLDBUF(xckbld)
               
            AFTER FIELD xckb007
               LET tm.xckb007 = GET_FLDBUF(xckb007)
               
            AFTER FIELD xckb008
               LET tm.xckb008 = GET_FLDBUF(xckb008)
               
            ON ACTION controlp INFIELD xckbcomp   #法人
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_ooef001_2()                #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckbcomp  #顯示到畫面上
               NEXT FIELD xckbcomp              #返回原欄位
            
            
            ON ACTION controlp INFIELD xckbld   #账别
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = g_user
               LET g_qryparam.arg2 = g_dept
               CALL q_authorised_ld()                #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckbld  #顯示到畫面上
               NEXT FIELD xckbld                     #返回原欄位
            
            ON ACTION controlp INFIELD xckb009   #客户编号
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_pmaa001_7()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckb009  #顯示到畫面上
               NEXT FIELD xckb009                     #返回原欄位
            
            ON ACTION controlp INFIELD xckb012   #产品编号
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_imaa001()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO xckb012  #顯示到畫面上
               NEXT FIELD xckb012                     #返回原欄位
               
            ON ACTION controlp INFIELD xckb015   #仓库
               #開窗c段
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_imaa001()                           #呼叫開窗  #add by dengsy160811
               DISPLAY g_qryparam.return1 TO xckb015  #顯示到畫面上
               NEXT FIELD xckb015                     #返回原欄位
            
         END CONSTRUCT
         #end add-point
     
         DISPLAY ARRAY g_detail TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 1
 
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               CALL cxcq513_detail_action_trans()
               LET g_master_idx = l_ac
               CALL cxcq513_b_fill2()
 
               #add-point:input段before row name="input.body.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_1)
            
 
            #add-point:page1自定義行為 name="ui_dialog.body.page1.action"
            
            #end add-point
 
         END DISPLAY
 
         DISPLAY ARRAY g_detail2 TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)
 
            BEFORE DISPLAY
               LET g_current_page = 2
 
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx2
               LET g_detail_idx2 = l_ac
               DISPLAY g_detail_idx2 TO FORMONLY.idx
 
               #add-point:input段before row name="input.body2.before_row"
               
               #end add-point
 
            #自訂ACTION(detail_show,page_2)
            
 
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
 
         END DISPLAY
 
 
 
         #add-point:ui_dialog段define name="ui_dialog.more_displayarray"
 
         #end add-point
    
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            CALL cxcq513_fetch('')
 
            #add-point:ui_dialog段before dialog name="ui_dialog.bef_dialog"
            
            #end add-point
            NEXT FIELD xckbcomp
 
         AFTER DIALOG
            #add-point:ui_dialog段 after dialog name="ui_dialog.after_dialog"
            
            #end add-point
            
         ON ACTION exit
            LET g_action_choice="exit"
            LET INT_FLAG = FALSE
            LET li_exit = TRUE
            EXIT DIALOG 
      
         ON ACTION close
            LET INT_FLAG=FALSE
            LET li_exit = TRUE
            EXIT DIALOG
 
         ON ACTION accept
            INITIALIZE g_wc_filter TO NULL
            IF cl_null(g_wc) THEN
               LET g_wc = " 1=1"
            END IF
 
 
   
            IF cl_null(g_wc2) THEN
               LET g_wc2 = " 1=1"
            END IF
 
 
 
            #add-point:ON ACTION accept name="ui_dialog.accept"
            IF g_qbe_hidden_t != 8 AND g_qbe_hidden_t != g_qbe_hidden THEN  #原隐藏变成显示，现在还原隐藏
               CALL gfrm_curr.setElementHidden("qbe",1)
               CALL gfrm_curr.setElementImage("qbehidden","16/worksheethidden.png")
               LET g_qbe_hidden = 1     #hidden
            END IF
            LET g_qbe_hidden_t = 8  #相当于清空的意思，清空还是0不好判断，就用了个8
            #end add-point
 
            CALL cxcq513_cs()
 
         ON ACTION agendum   # 待辦事項
            #add-point:ON ACTION agendum name="ui_dialog.agendum"
            
            #end add-point
            CALL cl_user_overview()
 
         ON ACTION exporttoexcel   #匯出excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               LET g_export_node[1] = base.typeInfo.create(g_detail)
               LET g_export_id[1]   = "s_detail1"
               LET g_export_node[2] = base.typeInfo.create(g_detail2)
               LET g_export_id[2]   = "s_detail2"
 
 
               #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
               
               #end add-point
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
            END IF
 
 
         ON ACTION datarefresh   # 重新整理
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL cxcq513_fetch('F')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION qbehidden     #qbe頁籤折疊
            IF g_qbe_hidden THEN
               CALL gfrm_curr.setElementHidden("qbe",0)
               CALL gfrm_curr.setElementImage("qbehidden","16/mainhidden.png")
               LET g_qbe_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("qbe",1)
               CALL gfrm_curr.setElementImage("qbehidden","16/worksheethidden.png")
               LET g_qbe_hidden = 1     #hidden
            END IF
 
         ON ACTION datainfo   #串查至主維護程式
            #add-point:ON ACTION datainfo name="ui_dialog.datainfo"
            
            #end add-point
            CALL cxcq513_maintain_prog()
 
         ON ACTION first   # 第一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL cxcq513_fetch('F')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION previous   # 上一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL cxcq513_fetch('P')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION jump   # 跳至第幾筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL cxcq513_fetch('/')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION next   # 下一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL cxcq513_fetch('N')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION last   # 最後一筆
            #為避免按上下筆影響效能，所以有作一些處理
            LET lc_action_choice_old = g_action_choice
            LET g_action_choice = "fetch"
            CALL cxcq513_fetch('L')
            LET g_action_choice = lc_action_choice_old
 
         ON ACTION detail_first               #page first
            LET g_action_choice = "detail_first"
            LET g_detail_page_action = "detail_first"
            LET g_master_row_move = "N"
            CALL cxcq513_b_fill()
 
         ON ACTION detail_previous                #page previous
            LET g_action_choice = "detail_previous"
            LET g_detail_page_action = "detail_previous"
            LET g_master_row_move = "N"
            CALL cxcq513_b_fill()
 
         ON ACTION detail_next                #page next
            LET g_action_choice = "detail_next"
            LET g_detail_page_action = "detail_next"
            LET g_master_row_move = "N"
            CALL cxcq513_b_fill()
 
         ON ACTION detail_last                #page last
            LET g_action_choice = "detail_last"
            LET g_detail_page_action = "detail_last"
            LET g_master_row_move = "N"
            CALL cxcq513_b_fill()
 
         
         
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               
               #add-point:ON ACTION query name="menu.query"
               LET g_qbe_hidden_t = g_qbe_hidden   #旧值备份
               IF g_qbe_hidden_t THEN  #隐藏
                  CALL gfrm_curr.setElementHidden("qbe",0)
                  CALL gfrm_curr.setElementImage("qbehidden","16/mainhidden.png")
                  LET g_qbe_hidden = 0     #visible
               END IF
               #END add-point
               
               
            END IF
 
 
 
 
      
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
 
         #add-point:查詢方案相關ACTION設定前 name="ui_dialog.set_qbe_action_before"
         
         #end add-point
 
         ON ACTION qbeclear   # 條件清除
            CLEAR FORM
            #add-point:條件清除後 name="ui_dialog.qbeclear"
            #单头不清除，只应清除左边查询段
            DISPLAY g_master.xckbcomp      TO  b_xckbcomp
            DISPLAY g_master.xckbld        TO  b_xckbld
            DISPLAY g_master.xckb007       TO  b_xckb007
            DISPLAY g_master.xckb008       TO  b_xckb008
            DISPLAY g_master.xckbcomp_desc TO xckbcomp_desc
            DISPLAY g_master.xckbld_desc   TO xckbld_desc
            #end add-point 
 
         #add-point:查詢方案相關ACTION設定後 name="ui_dialog.set_qbe_action_after"
         
         #end add-point 
 
      END DIALOG 
   
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.cs" >}
#+ 組單頭CURSOR
PRIVATE FUNCTION cxcq513_cs()
   #add-point:cs段define-客製 name="cs.define_customerization"
   DEFINE ls_wc           STRING
   #end add-point
   #add-point:cs段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
 
   #end add-point
 
   #add-point:FUNCTION前置處理 name="cs.before_function"
   
   #end add-point
 
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
 
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
   IF g_wc2 = " 1=1" THEN
      #add-point:cs段單頭sql組成(未下單身條件) name="cs.sql_define_1"
      #抓出单头资料
      LET g_sql = "SELECT UNIQUE xckbcomp,xckbld,xckb007,xckb008 ",
                  "  FROM xckb_t ",
                  " WHERE xckbent = ",g_enterprise,
                  "   AND ",g_wc
      LET g_sql = g_sql, cl_sql_add_filter("xckb_t"),  #額外的過濾條件
                 " ORDER BY xckbcomp,xckbld,xckb007,xckb008 "
      #end add-point
   ELSE
      #add-point:cs段單頭sql組成(有下單身條件) name="cs.sql_define_2"
      LET g_sql = "SELECT UNIQUE xckbcomp,xckbld,xckb007,xckb008 ",
                  "  FROM xckb_t ",
                  " WHERE xkbent = ",g_enterprise,
                  "   AND ",g_wc
      LET g_sql = g_sql, cl_sql_add_filter("xckb_t"),  #額外的過濾條件
                 " ORDER BY xckbcomp,xckbld,xckb007,xckb008 "
      #end add-point
   END IF
 
   PREPARE cxcq513_pre FROM g_sql
   DECLARE cxcq513_curs SCROLL CURSOR WITH HOLD FOR cxcq513_pre
   OPEN cxcq513_curs
 
   #add-point:cs段單頭總筆數計算 name="cs.head_total_row_count"

   #抓出資料筆數
   LET g_cnt_sql = "SELECT COUNT(DISTINCT xckbcomp||xckbld||xckb007||xckb008) ",
                   "  FROM xckb_t",
                   " WHERE xckbent = ",g_enterprise,
                   "   AND ",g_wc
   LET g_sql = g_sql, cl_sql_add_filter("xckb_t")   #額外的過濾條件
   #end add-point
   PREPARE cxcq513_precount FROM g_cnt_sql
   EXECUTE cxcq513_precount INTO g_row_count
 
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code   = SQLCA.SQLCODE 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
 
   ELSE
      CALL cxcq513_fetch("F")
   END IF
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.fetch" >}
#+ 抓取單頭資料
PRIVATE FUNCTION cxcq513_fetch(p_flag)
   #add-point:fetch段define-客製 name="fetch.define_customerization"
   DEFINE li_ac           LIKE type_t.num10
   #end add-point
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
 
   #end add-point
 
   #add-point:FUNCTION前置處理 name="fetch.before_function"
   
   #end add-point
 
   MESSAGE ""
 
   #FETCH段CURSOR移動
   #應用 qs18 樣板自動產生(Version:3)
   #add-point:fetch段CURSOR移動 name="fetch.cursor_action"
   #没符合条件的资料
   IF g_row_count = 0 THEN
      # 清空右側畫面欄位值，但須保留左側qbe查詢條件
      INITIALIZE g_master.* TO NULL
      DISPLAY g_master.* TO b_xckbcomp,b_xckbcomp_desc,b_xckbld,b_xckbld_desc,b_xckb007,b_xckb008,ca
      CALL g_detail.clear()
      CALL g_detail2.clear()
      DISPLAY '' TO FORMONLY.h_index
      DISPLAY '' TO FORMONLY.h_count
      DISPLAY '' TO FORMONLY.idx
      DISPLAY '' TO FORMONLY.cnt
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code   = '-100' 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   #受pattern限制，使用g_fetch变量，非空为版型所有，不需要调用的
   IF cl_null(p_flag) THEN
      RETURN
   END IF
   
   LET li_ac=1
   FOREACH cxcq513_curs INTO g_browser[li_ac].xckbcomp,g_browser[li_ac].xckbld,g_browser[li_ac].xckb007,g_browser[li_ac].xckb008
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'foreach:' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      LET li_ac = li_ac + 1
      IF li_ac > g_max_rec THEN
         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_browser.deleteElement(li_ac)
   #end add-point
 
 
 
 
 
   IF SQLCA.sqlcode THEN
      # 清空右側畫面欄位值，但須保留左側qbe查詢條件
      INITIALIZE g_master.* TO NULL
      DISPLAY g_master.* TO b_xckbcomp,b_xckbcomp_desc,b_xckbld,b_xckbld_desc,b_xckb007,b_xckb008,ca
      CALL g_detail.clear()
      CALL g_detail2.clear()
 
 
      #add-point:陣列清空 name="fetch.array_clear"
      
      #end add-point
      DISPLAY '' TO FORMONLY.h_index
      DISPLAY '' TO FORMONLY.h_count
      DISPLAY '' TO FORMONLY.idx
      DISPLAY '' TO FORMONLY.cnt
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code   = '-100' 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
 
      RETURN
   ELSE
      CASE p_flag
         WHEN 'F' LET g_current_idx = 1
         WHEN 'P' LET g_current_idx = g_current_idx - 1
         WHEN 'N' LET g_current_idx = g_current_idx + 1
         WHEN 'L' LET g_current_idx = g_row_count
         WHEN '/' LET g_current_idx = g_jump
      END CASE
      DISPLAY g_current_idx TO FORMONLY.h_index
      DISPLAY g_row_count TO FORMONLY.h_count
      CALL cl_navigator_setting( g_current_idx, g_row_count )
   END IF
 
   #add-point:fetch結束前 name="fetch.after"
   LET g_master.xckbcomp= g_browser[g_current_idx].xckbcomp
   LET g_master.xckbld  = g_browser[g_current_idx].xckbld
   LET g_master.xckb007 = g_browser[g_current_idx].xckb007
   LET g_master.xckb008 = g_browser[g_current_idx].xckb008
   
   CALL s_desc_get_department_desc(g_master.xckbcomp) RETURNING g_master.xckbcomp_desc #法人組織
   DISPLAY g_master.xckbcomp_desc TO xckbcomp_desc
   CALL s_desc_get_ld_desc(g_master.xckbld) RETURNING g_master.xckbld_desc #帳別編號
   DISPLAY g_master.xckbld_desc TO xckbld_desc
   #end add-point
 
   LET g_master_row_move = "Y"
   #重新顯示
   CALL cxcq513_show()
 
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.show" >}
PRIVATE FUNCTION cxcq513_show()
   #add-point:show段define-客製 name="show.define_customerization"
   
   #end add-point
   DEFINE ls_sql    STRING
   #add-point:show段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="show.before_function"
   
   #end add-point
 
   DISPLAY g_master.* TO b_xckbcomp,b_xckbcomp_desc,b_xckbld,b_xckbld_desc,b_xckb007,b_xckb008,ca
 
   #讀入ref值
   #add-point:show段單身reference name="show.head.reference"
 
   #end add-point
 
   LET g_detail_page_action = "detail_first"
   LET g_pagestart = 1
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   CALL cxcq513_b_fill()
 
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION cxcq513_b_fill()
   #add-point:b_fill段define-客製 name="b_fill.define_customerization"
   DEFINE li_ac           LIKE type_t.num10
   DEFINE l_success       LIKE type_t.num5
   
   #end add-point
   DEFINE ls_wc           STRING
   DEFINE ls_sql_rank     STRING
   #add-point:b_fill段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   define l_xckbcomp    LIKE xckb_t.xckbcomp,
          l_xckbld      LIKE xckb_t.xckbld,
          l_xckb007     LIKE xckb_t.xckb007  ,
          l_xckb008     LIKE xckb_t.xckb008
    DEFINE g_glaa003     LIKE glaa_t.glaa003  #会计周期参照表号 
    DEFINE g_bdate       LIKE glav_t.glav004  #年度+期別對應的起始截止日期
    DEFINE g_edate       LIKE glav_t.glav004    
   #end add-point
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   LET g_glaa003=''
   SELECT glaa003
     INTO g_glaa003
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = g_master.xckbld
   CALL s_fin_date_get_period_range(g_glaa003,g_master.xckb007,g_master.xckb008)
       RETURNING g_bdate,g_edate
   #end add-point
 
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
 
   CALL g_detail.clear()
 
   #add-point:陣列清空 name="b_fill.array_clear"
   call cxcq513_create_table()  #临时表
   CALL g_detail2.clear()
   #end add-point
 
   LET l_ac = 1
 
   # b_fill段sql組成及FOREACH撰寫
   #應用 qs09 樣板自動產生(Version:3)
   #+ b_fill段資料取得(包含sql組成及FOREACH段撰寫)
   #add-point:b_fill段sql name="b_fill.sql"

   LET g_sql = "SELECT UNIQUE xckbcomp,xckbld,xckb007,xckb008,xckb003,xckb004,xckb005,xckb006,xckb009,pmaal004,xckb010,ooag011, ",
               "              isaf004,ooefl003,xckb012,imaal003,imaal004, ",
               "              imag011,oocql004,imaaud005,",
               "              xckb013,(case isag015 when -1 then -xckb014 else xckb014 end) xckb014,xckb015,'', ",
               "              xckb102,",
               "              xckb101,xckb101a,xckb101b,xckb101c,xckb101d,xckb101e,xckb101f,xckb101g,xckb101h, ",
               "              round(isag113/xckb014,6) isag101,(case isag015 when -1 then -isag113 else isag113 end) isag113,",
               "              0,",
               "              0 ",
               "  FROM xckb_t LEFT JOIN pmaal_t ON pmaalent='"||g_enterprise||"' AND pmaal001=xckb009 AND pmaal002='"||g_dlang||"' ",
               "              LEFT JOIN ooag_t  ON ooagent ='"||g_enterprise||"' AND ooag001 =xckb010 ",
               "              LEFT JOIN imaal_t ON imaalent='"||g_enterprise||"' AND imaal001=xckb012 AND imaal002='"||g_dlang||"' ",
               "              LEFT JOIN xmdk_t  ON xmdkent ='"||g_enterprise||"' AND xmdkdocno=xckb005 ",
#               "              LEFT JOIN isag_t  ON isagent ='"||g_enterprise||"' AND isag002=xckb005 and isag003=xckb006 ",#modify by guorui160811 #mark by guorui160930
               #add by guorui160930 增加了同一张出货单分次开票,和一张出货单对账单不同的情况匹配 str--
               "              LEFT JOIN (select distinct isag015,isag113,isaf011,isag003,isagent,isag002,isagdocno,isag004 from isag_t,isaf_t where isafdocno=isagdocno and isafent=isagent )
                              ON isagent ='"||g_enterprise||"' AND isag002=xckb005 and isag003=xckb006 and isag004*isag015=xckb014 and isaf011=xckb003 ",
               "              LEFT JOIN isaf_t ON isafdocno=isagdocno and isafent='"||g_enterprise||"' and isafcomp=xckbcomp ",
               "              LEFT JOIN ooefl_t ON ooeflent='"||g_enterprise||"' AND ooefl001=isaf004 AND ooefl002='"||g_dlang||"' ", #guorui160811 modify
               "              LEFT outer JOIN imag_t ON imagent='"||g_enterprise||"' AND imag001=xckb012 AND imagsite=xckbcomp ",
#               "              left outer join (select distinct oocqlent,oocql004,oocql002,oocql003 from oocql_t) ON oocqlent='"||g_enterprise||"' and oocql002=   imag011 and oocql003='",g_lang,"' ", #mark by guorui160930
               "              left outer join (select distinct oocqlent,oocql001,oocql004,oocql002,oocql003 from oocql_t) ON oocqlent='"||g_enterprise||"' and oocql002=   imag011 and oocql001='206' and oocql003='",g_lang,"' ", #add by guorui160930
               "              LEFT outer JOIN imaa_t ON imaa001=xckb012 and imaaent='"||g_enterprise||"' ",
               " WHERE xckb001='4' and xckbent = ",g_enterprise,
               "   AND xckbcomp='",g_master.xckbcomp,"' ",
               "   AND xckbld  ='",g_master.xckbld,"' ",
               "   AND xckb007 = ",g_master.xckb007,
               "   AND xckb008 = ",g_master.xckb008,
               "   AND ",g_wc CLIPPED 
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE cxcq513_pb FROM g_sql
   DECLARE b_fill_cs CURSOR FOR cxcq513_pb
   
   #end add-point
 
 
 
 
 
   #add-point:b_fill段資料填充(其他單身) name="b_fill.others.fill"
   LET li_ac = 1
   FOREACH b_fill_cs INTO l_xckbcomp,l_xckbld,l_xckb007,l_xckb008,g_detail[li_ac].*
                     
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
      #库位名称
      CALL s_desc_get_stock_desc(g_detail[li_ac].xckb004,g_detail[li_ac].xckb015)
         RETURNING g_detail[li_ac].xckb015_desc
         
       select  sum(isag114) INTO g_detail[li_ac].isag114
           FROM isag_t ,isaf_t
           WHERE isagent=isafent and isafcomp = isagcomp AND isafdocno = isagdocno
             and isagent =g_enterprise AND isag002=g_detail[li_ac].xckb005 and isag003=g_detail[li_ac].xckb006
              AND isafstus IN ('S' ,'Y') 
              AND isafdocdt BETWEEN g_bdate AND g_edate  
              AND isag009 IS NOT NULL 
              AND isaf011=g_detail[li_ac].xckb003

#      let g_detail[li_ac].isag114=g_detail[li_ac].isag113-g_detail[li_ac].xckb102
      if g_detail[li_ac].isag113<>0 then 
         let g_detail[li_ac].isagud011=(g_detail[li_ac].isag114/g_detail[li_ac].isag113)*100
      else
         let g_detail[li_ac].isagud011=0      
      end if 
      if g_detail[li_ac].isag101 is null THEN 
#         select distinct round(isag113/g_detail[li_ac].xckb014,6) INTO g_detail[li_ac].isag101 
#           FROM isag_t ,isaf_t
#           WHERE isagent=isafent and isafcomp = isagcomp AND isafdocno = isagdocno
#             and isagent =g_enterprise AND isag002=g_detail[li_ac].xckb005 and isag003=g_detail[li_ac].xckb006
#              AND isafstus IN ('S' ,'Y') 
#              AND isafdocdt BETWEEN g_bdate AND g_edate  
#              AND isag009 IS NOT NULL 
#         
         select  sum(isag113),sum(isag114) INTO g_detail[li_ac].isag113 ,g_detail[li_ac].isag114
           FROM isag_t ,isaf_t
           WHERE isagent=isafent and isafcomp = isagcomp AND isafdocno = isagdocno
             and isagent =g_enterprise AND isag002=g_detail[li_ac].xckb005 and isag003=g_detail[li_ac].xckb006
              AND isafstus IN ('S' ,'Y') 
              AND isafdocdt BETWEEN g_bdate AND g_edate  
              AND isag009 IS NOT NULL 
#              AND isaf011=g_detail[li_ac].xckb003
#                 AND EXISTS (SELECT 1 FROM xmdk_t,xmdm_t,inaa_t a left outer join inaa_t b on b.inaaent = a.inaaent
#                             AND a.inaasite = b.inaasite
#                             AND a.inaa018 = b.inaa001 
#                              WHERE xmdkent = xmdment AND xmdkdocno = xmdmdocno 
#                                AND a.inaaent = xmdment AND a.inaasite  = xmdmsite  AND a.inaa001 = xmdm005 
#                               AND ((xmdk000 IN ('1','2','3','4','5') AND xmdk002 IN ('1','2')) 
#                                   OR xmdk000 ='6')    #销退
#                                AND xmdkent = g_enterprise
#                               AND xmdksite IN(SELECT ooef001 FROM ooef_t WHERE ooefent = g_enterprise
#                               AND ooefstus ='Y' AND ooef017 =g_master.xckbcomp
#                               AND xmdkstus='S' 
#                               AND (a.inaa010 = 'Y' or b.inaa010 = 'Y') 
#                               AND xmdmdocno = isag002 
#                               AND xmdmseq   = isag003   
#                           ) 
           let g_detail[li_ac].isag101=g_detail[li_ac].isag113/g_detail[li_ac].xckb014
#         let g_detail[li_ac].isag113=g_detail[li_ac].isag101*g_detail[li_ac].xckb014
         
#      let g_detail[li_ac].isag114=g_detail[li_ac].isag113-g_detail[li_ac].xckb102
      if g_detail[li_ac].isag113<>0 then 
         let g_detail[li_ac].isagud011=(g_detail[li_ac].isag114/g_detail[li_ac].isag113)*100
      else
         let g_detail[li_ac].isagud011=0      
      end if 
     end if
      insert into cxcq513_tmp values (l_xckbcomp,l_xckbld,l_xckb007,l_xckb008,g_detail[li_ac].*)
       
      IF li_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code   = 9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         END IF 
         EXIT FOREACH
      END IF
      
      LET li_ac = li_ac + 1
          
   END FOREACH
   FREE cxcq513_pb
   #end add-point
 
   CALL g_detail.deleteElement(g_detail.getLength())
 
   #add-point:陣列長度調整 name="b_fill.array_deleteElement"
   let g_detail[li_ac].xckb003="总计"
   select sum(xckb014),sum(xckb102),sum(isag113),sum(isag114)
   into g_detail[li_ac].xckb014,g_detail[li_ac].xckb102,g_detail[li_ac].isag113,g_detail[li_ac].isag114
   from cxcq513_tmp 
   #end add-point
 
   LET g_error_show = 0
 
   #單身總筆數顯示
   LET g_detail_cnt = g_detail.getLength()
 
   #調整單身index指標，避免翻頁後指到空白筆數
   CALL cxcq513_detail_index_setting()
 
   #重新計算單身筆數並呈現
   CALL cxcq513_detail_action_trans()
 
   CALL cxcq513_b_fill2()
 
   
 
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION cxcq513_b_fill2()
   #add-point:b_fill2段define-客製 name="b_fill2.define_customerization"
   DEFINE lr_wc     STRING
   DEFINE l_success       LIKE type_t.num5
   
   DEFINE l_xcbb010_t     LIKE xcbb_t.xcbb010
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:b_fill2段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   define l_xckc011,l_xckc012,l_isag113,l_isag114  LIKE xckc_t.xckc011
   #end add-point
 
   #add-point:FUNCTION前置處理 name="b_fill2.before_function"
   
   #end add-point
 
   LET li_ac = 1
 
   #單身組成
   #應用 qs11 樣板自動產生(Version:3)
   #+ b_fill2段table資料取得(包含sql組成及資料填充)
   #add-point:sql組成 name="b_fill2.fill"

   call cl_set_comp_visible('b_xckc004_0,b_xckc004_desc,b_xckc004_desc2,b_imag011_0,b_imag011_0_desc,b_imaaud005_0,
                             b_xckb011_0,b_xckb011_0_desc,b_xckc006_0,b_xckc003_0,b_xckc003_desc,b_xckb015_0,
                             b_xckb015_0_desc',true)
   CASE tm.ca
      WHEN '1'  #客户
           CALL cl_set_comp_visible('b_xckc004_0,b_xckc004_desc,b_xckc004_desc2,b_imag011_0,b_imag011_0_desc,b_imaaud005_0
                                     ,b_xckb011_0,b_xckb011_0_desc,b_xckc006_0,b_xckb015_0,b_xckb015_0_desc',FALSE)
      WHEN '2'  #产品
           CALL cl_set_comp_visible('b_xckc003,b_xckc003_desc',FALSE)
           call cl_set_comp_visible('b_xckb011_0,b_xckb011_0_desc,b_xckc006_0,b_xckb015_0,b_xckb015_0_desc',false)  #add by dengsy160809
      when '3'  #部门
           CALL cl_set_comp_visible('b_xckc004_0,b_xckc004_desc,b_xckc004_desc2,b_imag011_0,b_imag011_0_desc,b_imaaud005_0
                                     ,b_xckc003_0,b_xckc003_desc,b_xckc006_0,b_xckb015_0,b_xckb015_0_desc',FALSE)
      WHEN '4'  #客户+产品
           #无
           #call cl_set_comp_visible('b_xckc003_0,b_xckc003_desc,b_xckb015_0,b_xckb015_0_desc',false)  #add by dengsy160809 #marked by shijl 160928
           call cl_set_comp_visible('b_xckb011_0,b_xckb011_0_desc,b_xckb015_0,b_xckb015_0_desc',false)  #add by shijl 160928
      #str------- add by dengsy160809
      when '5'   #产品+仓库
           call cl_set_comp_visible('b_xckb011_0,b_xckb011_0_desc,b_xckc006_0,b_xckc003_0,b_xckc003_desc',false)
      #end------- add by dengsy160809
   END CASE
   
   CALL g_detail2.clear()
   LET lr_wc = g_wc
   
   CASE tm.ca
      WHEN '1'  #客户
           LET g_sql = "SELECT '','','','','','',",  #产品，研发，成本分群
                       "  '','','',xckb009,xckb009_desc,'','',",  #部门，简称，库存单位，客户编号，简称，仓库，库位名称
                       "  sum(xckb014),sum(xckb102),sum(isag113),sum(isag114),0 ",  
                       "  FROM cxcq513_tmp ",
                       " WHERE ",lr_wc CLIPPED,
                       " GROUP BY xckb009,xckb009_desc ",
                       " ORDER BY xckb009,xckb009_desc "
      WHEN '2'  #产品
           LET g_sql = "SELECT xckb012,xckb012_desc,xckb012_desc2,imag011,oocql004,imaaud005,",  #产品，研发，成本分群
                       "  '','',xckb013,'','','','',",  #部门，简称，库存单位，客户编号，简称，仓库，库位名称
                       "  sum(xckb014),sum(xckb102),sum(isag113),sum(isag114),0 ",  
                       "  FROM cxcq513_tmp   ",
                       " WHERE ",lr_wc CLIPPED,
                       " GROUP BY xckb012,xckb012_desc,xckb012_desc2,imag011,oocql004,imaaud005,xckb013 ",
                       " ORDER BY xckb012,xckb012_desc,xckb012_desc2,imag011,oocql004,imaaud005,xckb013 "
       WHEN '3'  #部门
           LET g_sql = "SELECT '','','','','','',",  #产品，研发，成本分群
                       "  xckb011,xckb011_desc,'','','','','',",  #部门，简称，库存单位，客户编号，简称，仓库，库位名称
                       "  sum(xckb014),sum(xckb102),sum(isag113),sum(isag114),0 ",
                       "  FROM cxcq513_tmp   ",                       
                       " WHERE ",lr_wc CLIPPED,
                       " GROUP BY xckb011,xckb011_desc ",
                       " ORDER BY xckb011,xckb011_desc "
       WHEN '4'  #客户+产品
           LET g_sql = "SELECT xckb012,xckb012_desc,xckb012_desc2,imag011,oocql004,imaaud005,",  #产品，研发，成本分群
                       "  '','',xckb013,xckb009,xckb009_desc,'','',",  #部门，简称，库存单位，客户编号，简称，仓库，库位名称
                       "  sum(xckb014),sum(xckb102),sum(isag113),sum(isag114),0 ",  
                       "  FROM cxcq513_tmp  ",
                       " WHERE ",lr_wc CLIPPED,
                       " GROUP BY xckb012,xckb012_desc2,xckb012_desc,imag011,oocql004,imaaud005,xckb013,xckb009,xckb009_desc ",
                       " ORDER BY xckb012,xckb012_desc2,xckb012_desc,imag011,oocql004,imaaud005,xckb013,xckb009,xckb009_desc "
         #str------- add by dengsy160809
         WHEN '5'  #产品+仓库
           LET g_sql = "SELECT xckb012,xckb012_desc,xckb012_desc2,imag011,oocql004,imaaud005,",  #产品，研发，成本分群
                       "  '','',xckb013,'','',xckb015,xckb015_desc,",  #部门，简称，库存单位，客户编号，简称，仓库，库位名称
                       "  sum(xckb014),sum(xckb102),sum(isag113),sum(isag114),0 ",  
                       "  FROM cxcq513_tmp  ",
                       " WHERE ",lr_wc CLIPPED,
                       " GROUP BY xckb012,xckb012_desc,xckb012_desc2,imag011,oocql004,imaaud005,xckb013,xckb015,xckb015_desc ",
                       " ORDER BY xckb012,xckb012_desc,xckb012_desc2,imag011,oocql004,imaaud005,xckb013,xckb015,xckb015_desc "
         #end------- add by dengsy160809
   END CASE
   
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   PREPARE cxcq513_pb2 FROM g_sql
   DECLARE b_fill_cs2 CURSOR FOR cxcq513_pb2
   let l_xckc011=0
   let l_xckc012=0
   let l_isag113=0
   let l_isag114=0
   #end add-point
 
 
 
 
 
 
   #add-point:單身填充後 name="b_fill2.after_fill"

   FOREACH b_fill_cs2 INTO g_detail2[li_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
      END IF
       
      #str------- add by dengsy160809
      {CALL s_desc_get_stock_desc(g_site,g_detail2[li_ac].xckb015)
         RETURNING g_detail2[li_ac].xckb015_0_desc}
      if g_detail2[li_ac].isag113<>0 then 
        let g_detail2[li_ac].isagud011=(g_detail2[li_ac].isag114/g_detail2[li_ac].isag113)*100
      else 
        let g_detail2[li_ac].isagud011=0
      end if 
      let l_xckc011=l_xckc011+g_detail2[li_ac].xckc011
      let l_xckc012=l_xckc012+g_detail2[li_ac].xckc012
      let l_isag113=l_isag113+g_detail2[li_ac].isag113
      let l_isag114=l_isag114+g_detail2[li_ac].isag114
      #end------- add by dengsy160809                                       
     
      
      IF li_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code   = 9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
         END IF 
         EXIT FOREACH
      END IF
      
      LET li_ac = li_ac + 1
          
   END FOREACH
  
   
   FREE cxcq513_pb2
   #CALL g_detail2.deleteElement(g_detail2.getLength())
   case tm.ca
      when '1' 
          let g_detail2[li_ac].xckc003="总计"
      when '2' 
          let g_detail2[li_ac].xckc004="总计"
      when '3' 
          let g_detail2[li_ac].xckb011="总计"
      when '4' 
          let g_detail2[li_ac].xckc004="总计"
      when '5' 
          let g_detail2[li_ac].xckc004="总计"
   end case
   let g_detail2[li_ac].xckc011=l_xckc011
   let g_detail2[li_ac].xckc012=l_xckc012
   let g_detail2[li_ac].isag113=l_isag113
   let g_detail2[li_ac].isag114=l_isag114
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION cxcq513_detail_show(ps_page)
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
 
   IF ps_page.getIndexOf("'2'",1) > 0 THEN
      #帶出公用欄位reference值page2
      
 
      #add-point:show段單身reference name="detail_show.body2.reference"
 
      #end add-point
   END IF
 
 
 
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.maintain_prog" >}
#+ 串查至主維護程式
PRIVATE FUNCTION cxcq513_maintain_prog()
   #add-point:maintain_prog段define-客製 name="maintain_prog.define_customerization"
   
   #end add-point
   DEFINE ls_js      STRING
   DEFINE la_param   RECORD
                     prog       STRING,
                     actionid   STRING,
                     background LIKE type_t.chr1,
                     param      DYNAMIC ARRAY OF STRING
                     END RECORD
   DEFINE ls_j       LIKE type_t.num5
   #add-point:maintain_prog段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="maintain_prog.define"
   
   #end add-point
 
 
   #add-point:maintain_prog段開始前 name="maintain_prog.before"
   
   #end add-point
 
   LET la_param.prog = ""
 
 
 
   IF NOT cl_null(la_param.prog) THEN
      LET ls_js = util.JSON.stringify(la_param)
      CALL cl_cmdrun_wait(ls_js)
   END IF
 
   #add-point:maintain_prog段結束前 name="maintain_prog.after"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.detail_action_trans" >}
#+ 單身分頁筆數顯示及action圖片顯示切換功能
PRIVATE FUNCTION cxcq513_detail_action_trans()
   #add-point:detail_action_trans段define-客製 name="detail_action_trans.define_customerization"
   
   #end add-point
   #add-point:detail_action_trans段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_action_trans.define"
   
   #end add-point
 
   #add-point:FUNCTION前置處理 name="detail_action_trans.before_function"
   
   #end add-point
 
   #因應單身切頁功能，筆數計算方式調整
   LET g_current_row_tot = g_pagestart + g_detail_idx - 1
   DISPLAY g_current_row_tot TO FORMONLY.idx
   DISPLAY g_tot_cnt TO FORMONLY.cnt
 
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
 
{<section id="cxcq513.detail_index_setting" >}
#+ 單身切頁後，index重新調整，避免翻頁後指到空白筆數
PRIVATE FUNCTION cxcq513_detail_index_setting()
   #add-point:detail_index_setting段define-客製 name="detail_index_setting.define_customerization"
   
   #end add-point
   DEFINE li_redirect     BOOLEAN
   DEFINE ldig_curr       ui.Dialog
   #add-point:detail_index_setting段define-標準  (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_index_setting.define"
   
   #end add-point
 
 
   #add-point:FUNCTION前置處理 name="detail_index_setting.before_function"
   
   #end add-point
 
   IF g_master_row_move = "Y" THEN
      LET g_detail_idx = 1
      LET li_redirect = TRUE
   ELSE
      IF g_curr_diag IS NOT NULL THEN
         CASE
            WHEN g_curr_diag.getCurrentRow("s_detail1") <= "0"
               LET g_detail_idx = 1
            WHEN g_curr_diag.getCurrentRow("s_detail1") > g_detail.getLength() AND g_detail.getLength() > 0
               LET g_detail_idx = g_detail.getLength()
               LET li_redirect = TRUE
            WHEN g_curr_diag.getCurrentRow("s_detail1") != g_detail_idx
               IF g_detail_idx > g_detail.getLength() THEN
                  LET g_detail_idx = g_detail.getLength()
               END IF
               LET li_redirect = TRUE
         END CASE
      END IF
   END IF
 
   IF li_redirect THEN
      LET ldig_curr = ui.Dialog.getCurrent()
      CALL ldig_curr.setCurrentRow("s_detail1", g_detail_idx)
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="cxcq513.mask_functions" >}
 &include "erp/cxc/cxcq513_mask.4gl"
 
{</section>}
 
{<section id="cxcq513.other_function" readonly="Y" >}

#变量清0
PRIVATE FUNCTION cxcq513_xcbb010_sum_to_0()
   DEFINE r_xcbb010_sum   RECORD  #按成本分群小计
                          xckc007  LIKE xckc_t.xckc007, 
                          xckc008  LIKE xckc_t.xckc008, 
                          xckc008a LIKE xckc_t.xckc008a, 
                          xckc008b LIKE xckc_t.xckc008b, 
                          xckc008c LIKE xckc_t.xckc008c, 
                          xckc008d LIKE xckc_t.xckc008d, 
                          xckc008e LIKE xckc_t.xckc008e, 
                          xckc008f LIKE xckc_t.xckc008f, 
                          xckc008g LIKE xckc_t.xckc008g, 
                          xckc008h LIKE xckc_t.xckc008h, 
                          xckc009  LIKE xckc_t.xckc009, 
                          xckc010  LIKE xckc_t.xckc010, 
                          xckc010a LIKE xckc_t.xckc010a, 
                          xckc010b LIKE xckc_t.xckc010b, 
                          xckc010c LIKE xckc_t.xckc010c, 
                          xckc010d LIKE xckc_t.xckc010d, 
                          xckc010e LIKE xckc_t.xckc010e, 
                          xckc010f LIKE xckc_t.xckc010f, 
                          xckc010g LIKE xckc_t.xckc010g, 
                          xckc010h LIKE xckc_t.xckc010h, 
                          xckc011  LIKE xckc_t.xckc011, 
                          xckc012  LIKE xckc_t.xckc012, 
                          xckc012a LIKE xckc_t.xckc012a, 
                          xckc012b LIKE xckc_t.xckc012b, 
                          xckc012c LIKE xckc_t.xckc012c, 
                          xckc012d LIKE xckc_t.xckc012d, 
                          xckc012e LIKE xckc_t.xckc012e, 
                          xckc012f LIKE xckc_t.xckc012f, 
                          xckc012g LIKE xckc_t.xckc012g, 
                          xckc012h LIKE xckc_t.xckc012h, 
                          xckc013  LIKE xckc_t.xckc013, 
                          xckc014  LIKE xckc_t.xckc014, 
                          xckc014a LIKE xckc_t.xckc014a, 
                          xckc014b LIKE xckc_t.xckc014b, 
                          xckc014c LIKE xckc_t.xckc014c, 
                          xckc014d LIKE xckc_t.xckc014d, 
                          xckc014e LIKE xckc_t.xckc014e, 
                          xckc014f LIKE xckc_t.xckc014f, 
                          xckc014g LIKE xckc_t.xckc014g, 
                          xckc014h LIKE xckc_t.xckc014h,
                          xckc015  LIKE xckc_t.xckc015, 
                          xckc015a LIKE xckc_t.xckc015a, 
                          xckc015b LIKE xckc_t.xckc015b, 
                          xckc015c LIKE xckc_t.xckc015c, 
                          xckc015d LIKE xckc_t.xckc015d, 
                          xckc015e LIKE xckc_t.xckc015e, 
                          xckc015f LIKE xckc_t.xckc015f, 
                          xckc015g LIKE xckc_t.xckc015g, 
                          xckc015h LIKE xckc_t.xckc015h,
                          xckc016  LIKE xckc_t.xckc016, 
                          xckc016a LIKE xckc_t.xckc016a, 
                          xckc016b LIKE xckc_t.xckc016b, 
                          xckc016c LIKE xckc_t.xckc016c, 
                          xckc016d LIKE xckc_t.xckc016d, 
                          xckc016e LIKE xckc_t.xckc016e, 
                          xckc016f LIKE xckc_t.xckc016f, 
                          xckc016g LIKE xckc_t.xckc016g, 
                          xckc016h LIKE xckc_t.xckc016h,
                          xckc017  LIKE xckc_t.xckc017, 
                          xckc017a LIKE xckc_t.xckc017a, 
                          xckc017b LIKE xckc_t.xckc017b, 
                          xckc017c LIKE xckc_t.xckc017c, 
                          xckc017d LIKE xckc_t.xckc017d, 
                          xckc017e LIKE xckc_t.xckc017e, 
                          xckc017f LIKE xckc_t.xckc017f, 
                          xckc017g LIKE xckc_t.xckc017g, 
                          xckc017h LIKE xckc_t.xckc017h,
                          xckc018  LIKE xckc_t.xckc018, 
                          xckc018a LIKE xckc_t.xckc018a, 
                          xckc018b LIKE xckc_t.xckc018b, 
                          xckc018c LIKE xckc_t.xckc018c, 
                          xckc018d LIKE xckc_t.xckc018d, 
                          xckc018e LIKE xckc_t.xckc018e, 
                          xckc018f LIKE xckc_t.xckc018f, 
                          xckc018g LIKE xckc_t.xckc018g, 
                          xckc018h LIKE xckc_t.xckc018h,
                          xckc019  LIKE xckc_t.xckc019, 
                          xckc019a LIKE xckc_t.xckc019a, 
                          xckc019b LIKE xckc_t.xckc019b, 
                          xckc019c LIKE xckc_t.xckc019c, 
                          xckc019d LIKE xckc_t.xckc019d, 
                          xckc019e LIKE xckc_t.xckc019e, 
                          xckc019f LIKE xckc_t.xckc019f, 
                          xckc019g LIKE xckc_t.xckc019g, 
                          xckc019h LIKE xckc_t.xckc019h,
                          xckc020  LIKE xckc_t.xckc020, 
                          xckc020a LIKE xckc_t.xckc020a, 
                          xckc020b LIKE xckc_t.xckc020b, 
                          xckc020c LIKE xckc_t.xckc020c, 
                          xckc020d LIKE xckc_t.xckc020d, 
                          xckc020e LIKE xckc_t.xckc020e, 
                          xckc020f LIKE xckc_t.xckc020f, 
                          xckc020g LIKE xckc_t.xckc020g, 
                          xckc020h LIKE xckc_t.xckc020h,
                          xckc021  LIKE xckc_t.xckc021, 
                          xckc021a LIKE xckc_t.xckc021a, 
                          xckc021b LIKE xckc_t.xckc021b, 
                          xckc021c LIKE xckc_t.xckc021c, 
                          xckc021d LIKE xckc_t.xckc021d, 
                          xckc021e LIKE xckc_t.xckc021e, 
                          xckc021f LIKE xckc_t.xckc021f, 
                          xckc021g LIKE xckc_t.xckc021g, 
                          xckc021h LIKE xckc_t.xckc021h,
                          xckc022  LIKE xckc_t.xckc022, 
                          xckc022a LIKE xckc_t.xckc022a, 
                          xckc022b LIKE xckc_t.xckc022b, 
                          xckc022c LIKE xckc_t.xckc022c, 
                          xckc022d LIKE xckc_t.xckc022d, 
                          xckc022e LIKE xckc_t.xckc022e, 
                          xckc022f LIKE xckc_t.xckc022f, 
                          xckc022g LIKE xckc_t.xckc022g, 
                          xckc022h LIKE xckc_t.xckc022h
                          END RECORD

   LET r_xcbb010_sum.xckc007  = 0
   LET r_xcbb010_sum.xckc008  = 0
   LET r_xcbb010_sum.xckc008a = 0
   LET r_xcbb010_sum.xckc008b = 0
   LET r_xcbb010_sum.xckc008c = 0
   LET r_xcbb010_sum.xckc008d = 0
   LET r_xcbb010_sum.xckc008e = 0
   LET r_xcbb010_sum.xckc008f = 0
   LET r_xcbb010_sum.xckc008g = 0
   LET r_xcbb010_sum.xckc008h = 0
   LET r_xcbb010_sum.xckc009  = 0
   LET r_xcbb010_sum.xckc010  = 0
   LET r_xcbb010_sum.xckc010a = 0
   LET r_xcbb010_sum.xckc010b = 0
   LET r_xcbb010_sum.xckc010c = 0
   LET r_xcbb010_sum.xckc010d = 0
   LET r_xcbb010_sum.xckc010e = 0
   LET r_xcbb010_sum.xckc010f = 0
   LET r_xcbb010_sum.xckc010g = 0
   LET r_xcbb010_sum.xckc010h = 0
   LET r_xcbb010_sum.xckc011  = 0
   LET r_xcbb010_sum.xckc012  = 0
   LET r_xcbb010_sum.xckc012a = 0
   LET r_xcbb010_sum.xckc012b = 0
   LET r_xcbb010_sum.xckc012c = 0
   LET r_xcbb010_sum.xckc012d = 0
   LET r_xcbb010_sum.xckc012e = 0
   LET r_xcbb010_sum.xckc012f = 0
   LET r_xcbb010_sum.xckc012g = 0
   LET r_xcbb010_sum.xckc012h = 0
   LET r_xcbb010_sum.xckc013  = 0
   LET r_xcbb010_sum.xckc014  = 0
   #str-------- add by dengsy160809
   LET r_xcbb010_sum.xckc014a = 0
   LET r_xcbb010_sum.xckc014b = 0
   LET r_xcbb010_sum.xckc014c = 0
   LET r_xcbb010_sum.xckc014d = 0
   LET r_xcbb010_sum.xckc014e = 0
   LET r_xcbb010_sum.xckc014f = 0
   LET r_xcbb010_sum.xckc014g = 0
   LET r_xcbb010_sum.xckc014h = 0
   #end-------- add by dengsy160809
   LET r_xcbb010_sum.xckc015  = 0
   LET r_xcbb010_sum.xckc015a = 0
   LET r_xcbb010_sum.xckc015b = 0
   LET r_xcbb010_sum.xckc015c = 0
   LET r_xcbb010_sum.xckc015d = 0
   LET r_xcbb010_sum.xckc015e = 0
   LET r_xcbb010_sum.xckc015f = 0
   LET r_xcbb010_sum.xckc015g = 0
   LET r_xcbb010_sum.xckc015h = 0
   LET r_xcbb010_sum.xckc016  = 0
   LET r_xcbb010_sum.xckc016a = 0
   LET r_xcbb010_sum.xckc016b = 0
   LET r_xcbb010_sum.xckc016c = 0
   LET r_xcbb010_sum.xckc016d = 0
   LET r_xcbb010_sum.xckc016e = 0
   LET r_xcbb010_sum.xckc016f = 0
   LET r_xcbb010_sum.xckc016g = 0
   LET r_xcbb010_sum.xckc016h = 0
   LET r_xcbb010_sum.xckc017  = 0
   LET r_xcbb010_sum.xckc017a = 0
   LET r_xcbb010_sum.xckc017b = 0
   LET r_xcbb010_sum.xckc017c = 0
   LET r_xcbb010_sum.xckc017d = 0
   LET r_xcbb010_sum.xckc017e = 0
   LET r_xcbb010_sum.xckc017f = 0
   LET r_xcbb010_sum.xckc017g = 0
   LET r_xcbb010_sum.xckc017h = 0
   LET r_xcbb010_sum.xckc018  = 0
   LET r_xcbb010_sum.xckc018a = 0
   LET r_xcbb010_sum.xckc018b = 0
   LET r_xcbb010_sum.xckc018c = 0
   LET r_xcbb010_sum.xckc018d = 0
   LET r_xcbb010_sum.xckc018e = 0
   LET r_xcbb010_sum.xckc018f = 0
   LET r_xcbb010_sum.xckc018g = 0
   LET r_xcbb010_sum.xckc018h = 0
   LET r_xcbb010_sum.xckc019  = 0
   LET r_xcbb010_sum.xckc019a = 0
   LET r_xcbb010_sum.xckc019b = 0
   LET r_xcbb010_sum.xckc019c = 0
   LET r_xcbb010_sum.xckc019d = 0
   LET r_xcbb010_sum.xckc019e = 0
   LET r_xcbb010_sum.xckc019f = 0
   LET r_xcbb010_sum.xckc019g = 0
   LET r_xcbb010_sum.xckc019h = 0
   LET r_xcbb010_sum.xckc020  = 0
   LET r_xcbb010_sum.xckc020a = 0
   LET r_xcbb010_sum.xckc020b = 0
   LET r_xcbb010_sum.xckc020c = 0
   LET r_xcbb010_sum.xckc020d = 0
   LET r_xcbb010_sum.xckc020e = 0
   LET r_xcbb010_sum.xckc020f = 0
   LET r_xcbb010_sum.xckc020g = 0
   LET r_xcbb010_sum.xckc020h = 0
   LET r_xcbb010_sum.xckc021  = 0
   LET r_xcbb010_sum.xckc021a = 0
   LET r_xcbb010_sum.xckc021b = 0
   LET r_xcbb010_sum.xckc021c = 0
   LET r_xcbb010_sum.xckc021d = 0
   LET r_xcbb010_sum.xckc021e = 0
   LET r_xcbb010_sum.xckc021f = 0
   LET r_xcbb010_sum.xckc021g = 0
   LET r_xcbb010_sum.xckc021h = 0
   LET r_xcbb010_sum.xckc022  = 0
   LET r_xcbb010_sum.xckc022a = 0
   LET r_xcbb010_sum.xckc022b = 0
   LET r_xcbb010_sum.xckc022c = 0
   LET r_xcbb010_sum.xckc022d = 0
   LET r_xcbb010_sum.xckc022e = 0
   LET r_xcbb010_sum.xckc022f = 0
   LET r_xcbb010_sum.xckc022g = 0
   LET r_xcbb010_sum.xckc022h = 0


END FUNCTION

#变量清0
PRIVATE FUNCTION cxcq513_xckc_tot_to_0()
   DEFINE r_xckc_tot      RECORD   #总计
                          xckc007  LIKE xckc_t.xckc007, 
                          xckc008  LIKE xckc_t.xckc008, 
                          xckc008a LIKE xckc_t.xckc008a, 
                          xckc008b LIKE xckc_t.xckc008b, 
                          xckc008c LIKE xckc_t.xckc008c, 
                          xckc008d LIKE xckc_t.xckc008d, 
                          xckc008e LIKE xckc_t.xckc008e, 
                          xckc008f LIKE xckc_t.xckc008f, 
                          xckc008g LIKE xckc_t.xckc008g, 
                          xckc008h LIKE xckc_t.xckc008h, 
                          xckc009  LIKE xckc_t.xckc009, 
                          xckc010  LIKE xckc_t.xckc010, 
                          xckc010a LIKE xckc_t.xckc010a, 
                          xckc010b LIKE xckc_t.xckc010b, 
                          xckc010c LIKE xckc_t.xckc010c, 
                          xckc010d LIKE xckc_t.xckc010d, 
                          xckc010e LIKE xckc_t.xckc010e, 
                          xckc010f LIKE xckc_t.xckc010f, 
                          xckc010g LIKE xckc_t.xckc010g, 
                          xckc010h LIKE xckc_t.xckc010h, 
                          xckc011  LIKE xckc_t.xckc011, 
                          xckc012  LIKE xckc_t.xckc012, 
                          xckc012a LIKE xckc_t.xckc012a, 
                          xckc012b LIKE xckc_t.xckc012b, 
                          xckc012c LIKE xckc_t.xckc012c, 
                          xckc012d LIKE xckc_t.xckc012d, 
                          xckc012e LIKE xckc_t.xckc012e, 
                          xckc012f LIKE xckc_t.xckc012f, 
                          xckc012g LIKE xckc_t.xckc012g, 
                          xckc012h LIKE xckc_t.xckc012h, 
                          xckc013  LIKE xckc_t.xckc013, 
                          xckc014  LIKE xckc_t.xckc014, 
                          xckc014a LIKE xckc_t.xckc014a, 
                          xckc014b LIKE xckc_t.xckc014b, 
                          xckc014c LIKE xckc_t.xckc014c, 
                          xckc014d LIKE xckc_t.xckc014d, 
                          xckc014e LIKE xckc_t.xckc014e, 
                          xckc014f LIKE xckc_t.xckc014f, 
                          xckc014g LIKE xckc_t.xckc014g, 
                          xckc014h LIKE xckc_t.xckc014h,
                          xckc015  LIKE xckc_t.xckc015, 
                          xckc015a LIKE xckc_t.xckc015a, 
                          xckc015b LIKE xckc_t.xckc015b, 
                          xckc015c LIKE xckc_t.xckc015c, 
                          xckc015d LIKE xckc_t.xckc015d, 
                          xckc015e LIKE xckc_t.xckc015e, 
                          xckc015f LIKE xckc_t.xckc015f, 
                          xckc015g LIKE xckc_t.xckc015g, 
                          xckc015h LIKE xckc_t.xckc015h,
                          xckc016  LIKE xckc_t.xckc016, 
                          xckc016a LIKE xckc_t.xckc016a, 
                          xckc016b LIKE xckc_t.xckc016b, 
                          xckc016c LIKE xckc_t.xckc016c, 
                          xckc016d LIKE xckc_t.xckc016d, 
                          xckc016e LIKE xckc_t.xckc016e, 
                          xckc016f LIKE xckc_t.xckc016f, 
                          xckc016g LIKE xckc_t.xckc016g, 
                          xckc016h LIKE xckc_t.xckc016h,
                          xckc017  LIKE xckc_t.xckc017, 
                          xckc017a LIKE xckc_t.xckc017a, 
                          xckc017b LIKE xckc_t.xckc017b, 
                          xckc017c LIKE xckc_t.xckc017c, 
                          xckc017d LIKE xckc_t.xckc017d, 
                          xckc017e LIKE xckc_t.xckc017e, 
                          xckc017f LIKE xckc_t.xckc017f, 
                          xckc017g LIKE xckc_t.xckc017g, 
                          xckc017h LIKE xckc_t.xckc017h,
                          xckc018  LIKE xckc_t.xckc018, 
                          xckc018a LIKE xckc_t.xckc018a, 
                          xckc018b LIKE xckc_t.xckc018b, 
                          xckc018c LIKE xckc_t.xckc018c, 
                          xckc018d LIKE xckc_t.xckc018d, 
                          xckc018e LIKE xckc_t.xckc018e, 
                          xckc018f LIKE xckc_t.xckc018f, 
                          xckc018g LIKE xckc_t.xckc018g, 
                          xckc018h LIKE xckc_t.xckc018h,
                          xckc019  LIKE xckc_t.xckc019, 
                          xckc019a LIKE xckc_t.xckc019a, 
                          xckc019b LIKE xckc_t.xckc019b, 
                          xckc019c LIKE xckc_t.xckc019c, 
                          xckc019d LIKE xckc_t.xckc019d, 
                          xckc019e LIKE xckc_t.xckc019e, 
                          xckc019f LIKE xckc_t.xckc019f, 
                          xckc019g LIKE xckc_t.xckc019g, 
                          xckc019h LIKE xckc_t.xckc019h,
                          xckc020  LIKE xckc_t.xckc020, 
                          xckc020a LIKE xckc_t.xckc020a, 
                          xckc020b LIKE xckc_t.xckc020b, 
                          xckc020c LIKE xckc_t.xckc020c, 
                          xckc020d LIKE xckc_t.xckc020d, 
                          xckc020e LIKE xckc_t.xckc020e, 
                          xckc020f LIKE xckc_t.xckc020f, 
                          xckc020g LIKE xckc_t.xckc020g, 
                          xckc020h LIKE xckc_t.xckc020h,
                          xckc021  LIKE xckc_t.xckc021, 
                          xckc021a LIKE xckc_t.xckc021a, 
                          xckc021b LIKE xckc_t.xckc021b, 
                          xckc021c LIKE xckc_t.xckc021c, 
                          xckc021d LIKE xckc_t.xckc021d, 
                          xckc021e LIKE xckc_t.xckc021e, 
                          xckc021f LIKE xckc_t.xckc021f, 
                          xckc021g LIKE xckc_t.xckc021g, 
                          xckc021h LIKE xckc_t.xckc021h,
                          xckc022  LIKE xckc_t.xckc022, 
                          xckc022a LIKE xckc_t.xckc022a, 
                          xckc022b LIKE xckc_t.xckc022b, 
                          xckc022c LIKE xckc_t.xckc022c, 
                          xckc022d LIKE xckc_t.xckc022d, 
                          xckc022e LIKE xckc_t.xckc022e, 
                          xckc022f LIKE xckc_t.xckc022f, 
                          xckc022g LIKE xckc_t.xckc022g, 
                          xckc022h LIKE xckc_t.xckc022h
                          END RECORD

   LET r_xckc_tot.xckc007  = 0
   LET r_xckc_tot.xckc008  = 0
   LET r_xckc_tot.xckc008a = 0
   LET r_xckc_tot.xckc008b = 0
   LET r_xckc_tot.xckc008c = 0
   LET r_xckc_tot.xckc008d = 0
   LET r_xckc_tot.xckc008e = 0
   LET r_xckc_tot.xckc008f = 0
   LET r_xckc_tot.xckc008g = 0
   LET r_xckc_tot.xckc008h = 0
   LET r_xckc_tot.xckc009  = 0
   LET r_xckc_tot.xckc010  = 0
   LET r_xckc_tot.xckc010a = 0
   LET r_xckc_tot.xckc010b = 0
   LET r_xckc_tot.xckc010c = 0
   LET r_xckc_tot.xckc010d = 0
   LET r_xckc_tot.xckc010e = 0
   LET r_xckc_tot.xckc010f = 0
   LET r_xckc_tot.xckc010g = 0
   LET r_xckc_tot.xckc010h = 0
   LET r_xckc_tot.xckc011  = 0
   LET r_xckc_tot.xckc012  = 0
   LET r_xckc_tot.xckc012a = 0
   LET r_xckc_tot.xckc012b = 0
   LET r_xckc_tot.xckc012c = 0
   LET r_xckc_tot.xckc012d = 0
   LET r_xckc_tot.xckc012e = 0
   LET r_xckc_tot.xckc012f = 0
   LET r_xckc_tot.xckc012g = 0
   LET r_xckc_tot.xckc012h = 0
   LET r_xckc_tot.xckc013  = 0
   LET r_xckc_tot.xckc014  = 0
   LET r_xckc_tot.xckc014a = 0
   LET r_xckc_tot.xckc014b = 0
   LET r_xckc_tot.xckc014c = 0
   LET r_xckc_tot.xckc014d = 0
   LET r_xckc_tot.xckc014e = 0
   LET r_xckc_tot.xckc014f = 0
   LET r_xckc_tot.xckc014g = 0
   LET r_xckc_tot.xckc014h = 0
   LET r_xckc_tot.xckc015  = 0
   LET r_xckc_tot.xckc015a = 0
   LET r_xckc_tot.xckc015b = 0
   LET r_xckc_tot.xckc015c = 0
   LET r_xckc_tot.xckc015d = 0
   LET r_xckc_tot.xckc015e = 0
   LET r_xckc_tot.xckc015f = 0
   LET r_xckc_tot.xckc015g = 0
   LET r_xckc_tot.xckc015h = 0
   LET r_xckc_tot.xckc016  = 0
   LET r_xckc_tot.xckc016a = 0
   LET r_xckc_tot.xckc016b = 0
   LET r_xckc_tot.xckc016c = 0
   LET r_xckc_tot.xckc016d = 0
   LET r_xckc_tot.xckc016e = 0
   LET r_xckc_tot.xckc016f = 0
   LET r_xckc_tot.xckc016g = 0
   LET r_xckc_tot.xckc016h = 0
   LET r_xckc_tot.xckc017  = 0
   LET r_xckc_tot.xckc017a = 0
   LET r_xckc_tot.xckc017b = 0
   LET r_xckc_tot.xckc017c = 0
   LET r_xckc_tot.xckc017d = 0
   LET r_xckc_tot.xckc017e = 0
   LET r_xckc_tot.xckc017f = 0
   LET r_xckc_tot.xckc017g = 0
   LET r_xckc_tot.xckc017h = 0
   LET r_xckc_tot.xckc018  = 0
   LET r_xckc_tot.xckc018a = 0
   LET r_xckc_tot.xckc018b = 0
   LET r_xckc_tot.xckc018c = 0
   LET r_xckc_tot.xckc018d = 0
   LET r_xckc_tot.xckc018e = 0
   LET r_xckc_tot.xckc018f = 0
   LET r_xckc_tot.xckc018g = 0
   LET r_xckc_tot.xckc018h = 0
   LET r_xckc_tot.xckc019  = 0
   LET r_xckc_tot.xckc019a = 0
   LET r_xckc_tot.xckc019b = 0
   LET r_xckc_tot.xckc019c = 0
   LET r_xckc_tot.xckc019d = 0
   LET r_xckc_tot.xckc019e = 0
   LET r_xckc_tot.xckc019f = 0
   LET r_xckc_tot.xckc019g = 0
   LET r_xckc_tot.xckc019h = 0
   LET r_xckc_tot.xckc020  = 0
   LET r_xckc_tot.xckc020a = 0
   LET r_xckc_tot.xckc020b = 0
   LET r_xckc_tot.xckc020c = 0
   LET r_xckc_tot.xckc020d = 0
   LET r_xckc_tot.xckc020e = 0
   LET r_xckc_tot.xckc020f = 0
   LET r_xckc_tot.xckc020g = 0
   LET r_xckc_tot.xckc020h = 0
   LET r_xckc_tot.xckc021  = 0
   LET r_xckc_tot.xckc021a = 0
   LET r_xckc_tot.xckc021b = 0
   LET r_xckc_tot.xckc021c = 0
   LET r_xckc_tot.xckc021d = 0
   LET r_xckc_tot.xckc021e = 0
   LET r_xckc_tot.xckc021f = 0
   LET r_xckc_tot.xckc021g = 0
   LET r_xckc_tot.xckc021h = 0
   LET r_xckc_tot.xckc022  = 0
   LET r_xckc_tot.xckc022a = 0
   LET r_xckc_tot.xckc022b = 0
   LET r_xckc_tot.xckc022c = 0
   LET r_xckc_tot.xckc022d = 0
   LET r_xckc_tot.xckc022e = 0
   LET r_xckc_tot.xckc022f = 0
   LET r_xckc_tot.xckc022g = 0
   LET r_xckc_tot.xckc022h = 0
   

END FUNCTION

################################################################################
# Descriptions...: 创建临时表
# Memo...........:
# Usage..........: CALL cxcq513_create_table()
# Date & Author..: 160811 By dengsy
# Modify.........:
################################################################################
PRIVATE FUNCTION cxcq513_create_table()
  WHENEVER ERROR CONTINUE 
   DROP TABLE cxcq513_tmp;
   CREATE TEMP TABLE cxcq513_tmp(
   xckbcomp LIKE xckb_t.xckbcomp,
   xckbld   LIKE xckb_t.xckbld,
   xckb007  LIKE xckb_t.xckb007,
   xckb008  LIKE xckb_t.xckb008,
   xckb003 LIKE xckb_t.xckb003, 
   xckb004 LIKE xckb_t.xckb004, 
   xckb005 LIKE xckb_t.xckb005, 
   xckb006 LIKE xckb_t.xckb006, 
   xckb009 LIKE xckb_t.xckb009, 
   xckb009_desc LIKE type_t.chr500, 
   xckb010 LIKE xckb_t.xckb010, 
   xckb010_desc LIKE type_t.chr500, 
   xckb011 LIKE xckb_t.xckb011, 
   xckb011_desc LIKE type_t.chr500, 
   xckb012 LIKE xckb_t.xckb012, 
   xckb012_desc LIKE type_t.chr500, 
   xckb012_desc2 LIKE type_t.chr500, 
   imag011      LIKE imag_t.imag011,
   oocql004     LIKE oocql_t.oocql004,
   imaaud005    LIKE imaa_t.imaaud005,
   xckb013 LIKE xckb_t.xckb013, 
   xckb014 LIKE xckb_t.xckb014, 
   xckb015 LIKE xckb_t.xckb015, 
   xckb015_desc LIKE type_t.chr500, 
   xckb102 LIKE xckb_t.xckb102, 
   xckb101 LIKE xckb_t.xckb101, 
   xckb101a LIKE xckb_t.xckb101a, 
   xckb101b LIKE xckb_t.xckb101b, 
   xckb101c LIKE xckb_t.xckb101c, 
   xckb101d LIKE xckb_t.xckb101d, 
   xckb101e LIKE xckb_t.xckb101e, 
   xckb101f LIKE xckb_t.xckb101f, 
   xckb101g LIKE xckb_t.xckb101g, 
   xckb101h LIKE xckb_t.xckb101h, 
   isag101 LIKE isag_t.isag101, 
   isag113 LIKE isag_t.isag113, 
   isag114 LIKE isag_t.isag114, 
   isagud011 LIKE isag_t.isagud011)  
END FUNCTION

 
{</section>}
 
