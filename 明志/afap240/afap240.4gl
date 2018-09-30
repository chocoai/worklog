#該程式未解開Section, 採用最新樣板產出!
#該程式非freestyle程式!
{<section id="afap240.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0025(2015-01-12 17:40:02), PR版次:0025(2018-01-04 11:56:28)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000244
#+ Filename...: afap240
#+ Description: 資產攤提還原作業
#+ Creator....: 02416(2014-02-27 13:49:53)
#+ Modifier...: 02291 -SD/PR- 09773
 
{</section>}
 
{<section id="afap240.global" type="s" >}
#應用 p01 樣板自動產生(Version:20)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#150731-00004#1   2015/08/07 by yangtt  錯誤信息匯總報錯，將舊的報錯方式(cl_errmdg)改成新的報錯方式
#160318-00025#7   2016/04/20 By 07675   將重複內容的錯誤訊息置換為公用錯誤訊息(r.v）
#160530-00036#1   2016/06/06 By albireo 需同步回寫未顯示的faaj狀態
#160125-00005#7   2016/08/09 By 01531 查詢時加上帳套人員權限條件過濾
#160905-00007#1   2016-09-05 By08734    ent调整
#160426-00014#40  2016/09/14 By 01531   按标签部门分摊方式的资产，折旧还原时，累折更新的不对，只还原了分摊中一笔的折旧。
#161024-00008#1   2016/10/24 By Hans   AFA組織類型與職能開窗清單調整。
#161104-00048#3   2016/11/22 By 01531  还原折旧后，更新资产状态改为更新faaj038.
#161123-00011#1   2016/11/24 By 01531    還原或重新執行時, 檢核是否有異動資料時，排除作廢單據的資料。
#161111-00049#14 2016/11/25  By 07900    1.【卡片編號、財產編號、附號：基礎資料類查詢，增加USER據點權限與資產設備的【歸屬法人】，作交互限定可視範圍。
#                                        2.【主要類型】：採集團設置,因應誼山現況，增加依法人限定。
#                                        3.【次要類型】：採集團設置,因應誼山現況，增加參考主類型處理
#161215-00044#1   2016/12/15 by 02481    标准程式定义采用宣告模式,弃用.*写
#161214-00063#1   2016/12/15 By 01531    afai100 录入次类型不是必输,取消固资折旧与折旧还原 次类型的限定
#161221-00028#1   2016/12/23 By 01531    当月先计提折旧，固定资产卡片已进行出售，则不可还原
#170308-00014#1   2017/03/09 By 01531    点击折旧还原  系统会报错：年度期别不可小于等于关账日对应的年度月份
#170426-00053#1   2017/04/26 By 04150    折舊還原後，更新資產狀態需更新faaj038及faah015
#171107-00034#1   2017/11/16 By 07900    出售，销账检核应该是在本月，要加上日期限制
#170619-00054#2   2017/12/27 By 07900    afat509同一會計期, 可多次立折舊帳務
#171227-00042#1   2018/01/04 By 09773    afap230/afap240执行完成后,未还原查询状态
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
#(ver:20) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:20) --- end ---
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_schedule
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_schedule.inc"
GLOBALS
   DEFINE gwin_curr2  ui.Window
   DEFINE gfrm_curr2  ui.Form
   DEFINE gi_hiden_asign       LIKE type_t.num5
   DEFINE gi_hiden_exec        LIKE type_t.num5
   DEFINE gi_hiden_spec        LIKE type_t.num5
   DEFINE gi_hiden_exec_end    LIKE type_t.num5
   DEFINE g_chk_jobid          LIKE type_t.num5
END GLOBALS
 
PRIVATE TYPE type_parameter RECORD
   #add-point:自定背景執行須傳遞的參數(Module Variable) name="global.parameter"
   
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       faamsite LIKE faam_t.faamsite, 
   faamsite_desc LIKE type_t.chr80, 
   glaald LIKE glaa_t.glaald, 
   glaald_desc LIKE type_t.chr80, 
   glaacomp LIKE glaa_t.glaacomp, 
   glaacomp_desc LIKE type_t.chr80, 
   glaa001 LIKE glaa_t.glaa001, 
   glaa001_desc LIKE type_t.chr80, 
   yy LIKE type_t.chr500, 
   mm LIKE type_t.chr500, 
   faah001 LIKE type_t.chr500, 
   faah007 LIKE type_t.chr500, 
   faah003 LIKE type_t.chr500, 
   faah005 LIKE type_t.chr500, 
   faah004 LIKE type_t.chr500, 
   faah008 LIKE type_t.chr500, 
   faah006 LIKE type_t.chr500, 
   faah042 LIKE type_t.chr500,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_glaald,g_glaald_t    LIKE glaa_t.glaald
DEFINE g_faamsite,g_faamsite_t LIKE faam_t.faamsite
DEFINE g_glaacomp             LIKE glaa_t.glaacomp
DEFINE g_glaa001              LIKE glaa_t.glaa001
DEFINE g_yy,g_mm              LIKE type_t.num5
TYPE type_g_faah_d RECORD
     sel             LIKE  type_t.chr1,
     faah003         LIKE faah_t.faah003,
     faah004         LIKE faah_t.faah004,
     faah001 LIKE faah_t.faah001, #20141212 add by chening
     faah015 LIKE faah_t.faah015, #20141212 add by chening     
     faah006         LIKE faah_t.faah006,
     faah006_desc    LIKE type_t.chr80,
     faah007         LIKE faah_t.faah007,
     faah007_desc    LIKE type_t.chr80,
     faah005         LIKE faah_t.faah005,
     faah008         LIKE faah_t.faah008,
     faah008_desc    LIKE type_t.chr80,
     faah042         LIKE faah_t.faah042,
     faah022         LIKE faah_t.faah022,
     faah024         LIKE faah_t.faah024
END RECORD
DEFINE g_faah_d DYNAMIC ARRAY OF type_g_faah_d
DEFINE g_wc2                 STRING
DEFINE g_wc2_table1          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE l_ac                  LIKE type_t.num5
DEFINE g_rec_b               LIKE type_t.num5              #單身筆數
DEFINE g_detail_b            LIKE type_t.num5
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_detail_idx         LIKE type_t.num5
DEFINE g_current_page       LIKE type_t.num5              #目前所在頁數
DEFINE g_faam               DYNAMIC ARRAY OF RECORD 
        faam007             LIKE faam_t.faam007,
        faam026             LIKE faam_t.faam026
                            END RECORD
#161215-00044#1---modify----begin-----------------
#DEFINE 
#       g_faal               DYNAMIC ARRAY OF RECORD LIKE faal_t.*
DEFINE g_faal               DYNAMIC ARRAY OF RECORD  #固定資產主要類型檔
       faalent LIKE faal_t.faalent, #企業編號
       faalld LIKE faal_t.faalld, #帳套
       faal001 LIKE faal_t.faal001, #資產主要類別
       faal002 LIKE faal_t.faal002, #已停用資產是否計提折舊
       faal003 LIKE faal_t.faal003, #當月處置是否計提折舊
       faal004 LIKE faal_t.faal004, #資產處置轉入清理科目
       faal005 LIKE faal_t.faal005, #本月入帳提列方式
       faalownid LIKE faal_t.faalownid, #資料所有者
       faalowndp LIKE faal_t.faalowndp, #資料所屬部門
       faalcrtid LIKE faal_t.faalcrtid, #資料建立者
       faalcrtdp LIKE faal_t.faalcrtdp, #資料建立部門
       faalcrtdt LIKE faal_t.faalcrtdt, #資料創建日
       faalmodid LIKE faal_t.faalmodid, #資料修改者
       faalmoddt LIKE faal_t.faalmoddt, #最近修改日
       faalstus LIKE faal_t.faalstus, #狀態碼
       faalud001 LIKE faal_t.faalud001, #自定義欄位(文字)001
       faalud002 LIKE faal_t.faalud002, #自定義欄位(文字)002
       faalud003 LIKE faal_t.faalud003, #自定義欄位(文字)003
       faalud004 LIKE faal_t.faalud004, #自定義欄位(文字)004
       faalud005 LIKE faal_t.faalud005, #自定義欄位(文字)005
       faalud006 LIKE faal_t.faalud006, #自定義欄位(文字)006
       faalud007 LIKE faal_t.faalud007, #自定義欄位(文字)007
       faalud008 LIKE faal_t.faalud008, #自定義欄位(文字)008
       faalud009 LIKE faal_t.faalud009, #自定義欄位(文字)009
       faalud010 LIKE faal_t.faalud010, #自定義欄位(文字)010
       faalud011 LIKE faal_t.faalud011, #自定義欄位(數字)011
       faalud012 LIKE faal_t.faalud012, #自定義欄位(數字)012
       faalud013 LIKE faal_t.faalud013, #自定義欄位(數字)013
       faalud014 LIKE faal_t.faalud014, #自定義欄位(數字)014
       faalud015 LIKE faal_t.faalud015, #自定義欄位(數字)015
       faalud016 LIKE faal_t.faalud016, #自定義欄位(數字)016
       faalud017 LIKE faal_t.faalud017, #自定義欄位(數字)017
       faalud018 LIKE faal_t.faalud018, #自定義欄位(數字)018
       faalud019 LIKE faal_t.faalud019, #自定義欄位(數字)019
       faalud020 LIKE faal_t.faalud020, #自定義欄位(數字)020
       faalud021 LIKE faal_t.faalud021, #自定義欄位(日期時間)021
       faalud022 LIKE faal_t.faalud022, #自定義欄位(日期時間)022
       faalud023 LIKE faal_t.faalud023, #自定義欄位(日期時間)023
       faalud024 LIKE faal_t.faalud024, #自定義欄位(日期時間)024
       faalud025 LIKE faal_t.faalud025, #自定義欄位(日期時間)025
       faalud026 LIKE faal_t.faalud026, #自定義欄位(日期時間)026
       faalud027 LIKE faal_t.faalud027, #自定義欄位(日期時間)027
       faalud028 LIKE faal_t.faalud028, #自定義欄位(日期時間)028
       faalud029 LIKE faal_t.faalud029, #自定義欄位(日期時間)029
       faalud030 LIKE faal_t.faalud030, #自定義欄位(日期時間)030
       faal006 LIKE faal_t.faal006  #列帳/列管
       END RECORD

#161215-00044#1---modify----end-----------------       
DEFINE g_over               LIKE type_t.chr1
DEFINE g_ym                 LIKE type_t.chr6
DEFINE g_wc_cs_ld          STRING      #160125-00005#7
DEFINE g_wc_cs_orga        STRING      #160125-00005#7
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="afap240.main" type="s" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   
   #end add-point 
  
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("afa","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL afap240_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_afap240 WITH FORM cl_ap_formpath("afa",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL afap240_init()
 
      #進入選單 Menu (="N")
      CALL afap240_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_afap240
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="afap240.init" type="s" >}
#+ 初始化作業
PRIVATE FUNCTION afap240_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   
   #end add-point
 
   LET g_error_show = 1
   LET gwin_curr2 = ui.Window.getCurrent()
   LET gfrm_curr2 = gwin_curr2.getForm()
   CALL cl_schedule_import_4fd()
   CALL cl_set_combo_scc("gzpa003","75")
   IF cl_get_para(g_enterprise,"","E-SYS-0005") = "N" THEN
       CALL cl_set_comp_visible("scheduling_page,history_page",FALSE)
   END IF 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc('faah005','9903')
   CALL cl_set_combo_scc('faah042','9917')
   CALL cl_set_combo_scc('b_faah005','9903') #chenying add
   CALL cl_set_combo_scc('b_faah042','9917') #chenying add
   CALL cl_set_combo_scc('faah015','9914')  #20141212 add by chenying 
   #营运据点范围
   CALL s_axrt300_get_site(g_user,'','1') RETURNING g_wc_cs_orga #160125-00005#7    
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="afap240.ui_dialog" type="s" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION afap240_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
DEFINE l_sel_cnt  LIKE type_t.num5      
 
#  WHILE TRUE 
     CALL afap240_ui_dialog_1()
#     IF INT_FLAG THEN
#        LET INT_FLAG = FALSE
#        EXIT WHILE
#     END IF     
#     IF g_faah_d.getLength() = 0 THEN
#        INITIALIZE g_errparam TO NULL
#        LET g_errparam.code = 'afa-00067'
#        LET g_errparam.extend = ''
#        LET g_errparam.popup = TRUE
#        CALL cl_err()
#
#        CONTINUE WHILE
#     ELSE
#        EXIT WHILE
#     END IF
#     
#  END WHILE
   RETURN
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.glaald,g_master.glaacomp,g_master.glaa001,g_master.yy,g_master.mm,g_master.faah007, 
             g_master.faah008,g_master.faah006 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaald
            
            #add-point:AFTER FIELD glaald name="input.a.glaald"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_master.glaald
            CALL ap_ref_array2(g_ref_fields,"SELECT glaal002 FROM glaal_t WHERE glaalent='"||g_enterprise||"' AND glaalld=? AND glaal001='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_master.glaald_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_master.glaald_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaald
            #add-point:BEFORE FIELD glaald name="input.b.glaald"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE glaald
            #add-point:ON CHANGE glaald name="input.g.glaald"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaacomp
            
            #add-point:AFTER FIELD glaacomp name="input.a.glaacomp"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_master.glaacomp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_master.glaacomp_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_master.glaacomp_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaacomp
            #add-point:BEFORE FIELD glaacomp name="input.b.glaacomp"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE glaacomp
            #add-point:ON CHANGE glaacomp name="input.g.glaacomp"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaa001
            
            #add-point:AFTER FIELD glaa001 name="input.a.glaa001"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_master.glaa001
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_master.glaa001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_master.glaa001_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaa001
            #add-point:BEFORE FIELD glaa001 name="input.b.glaa001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE glaa001
            #add-point:ON CHANGE glaa001 name="input.g.glaa001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD yy
            #add-point:BEFORE FIELD yy name="input.b.yy"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD yy
            
            #add-point:AFTER FIELD yy name="input.a.yy"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE yy
            #add-point:ON CHANGE yy name="input.g.yy"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD mm
            #add-point:BEFORE FIELD mm name="input.b.mm"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD mm
            
            #add-point:AFTER FIELD mm name="input.a.mm"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE mm
            #add-point:ON CHANGE mm name="input.g.mm"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah007
            #add-point:BEFORE FIELD faah007 name="input.b.faah007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah007
            
            #add-point:AFTER FIELD faah007 name="input.a.faah007"


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah007
            #add-point:ON CHANGE faah007 name="input.g.faah007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah008
            #add-point:BEFORE FIELD faah008 name="input.b.faah008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah008
            
            #add-point:AFTER FIELD faah008 name="input.a.faah008"


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah008
            #add-point:ON CHANGE faah008 name="input.g.faah008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah006
            #add-point:BEFORE FIELD faah006 name="input.b.faah006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah006
            
            #add-point:AFTER FIELD faah006 name="input.a.faah006"


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE faah006
            #add-point:ON CHANGE faah006 name="input.g.faah006"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.glaald
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaald
            #add-point:ON ACTION controlp INFIELD glaald name="input.c.glaald"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.glaald             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #
            LET g_qryparam.arg2 = "" #
            
            CALL q_authorised_ld()                                #呼叫開窗

            LET g_master.glaald = g_qryparam.return1              

            DISPLAY g_master.glaald TO glaald              #

            NEXT FIELD glaald                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.glaacomp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaacomp
            #add-point:ON ACTION controlp INFIELD glaacomp name="input.c.glaacomp"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.glaacomp             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooea001_2()                                #呼叫開窗

            LET g_master.glaacomp = g_qryparam.return1              

            DISPLAY g_master.glaacomp TO glaacomp              #

            NEXT FIELD glaacomp                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.glaa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaa001
            #add-point:ON ACTION controlp INFIELD glaa001 name="input.c.glaa001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_master.glaa001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooai001()                                #呼叫開窗

            LET g_master.glaa001 = g_qryparam.return1              

            DISPLAY g_master.glaa001 TO glaa001              #

            NEXT FIELD glaa001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.yy
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD yy
            #add-point:ON ACTION controlp INFIELD yy name="input.c.yy"
            
            #END add-point
 
 
         #Ctrlp:input.c.mm
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD mm
            #add-point:ON ACTION controlp INFIELD mm name="input.c.mm"
            
            #END add-point
 
 
         #Ctrlp:input.c.faah007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah007
            #add-point:ON ACTION controlp INFIELD faah007 name="input.c.faah007"
            
            #END add-point
 
 
         #Ctrlp:input.c.faah008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah008
            #add-point:ON ACTION controlp INFIELD faah008 name="input.c.faah008"
            
            #END add-point
 
 
         #Ctrlp:input.c.faah006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah006
            #add-point:ON ACTION controlp INFIELD faah006 name="input.c.faah006"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON faamsite,glaald,glaacomp,glaa001,yy,mm,faah001,faah007,faah008, 
             faah006
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faamsite
            #add-point:BEFORE FIELD faamsite name="construct.b.faamsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faamsite
            
            #add-point:AFTER FIELD faamsite name="construct.a.faamsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faamsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faamsite
            #add-point:ON ACTION controlp INFIELD faamsite name="construct.c.faamsite"
            
            #END add-point
 
 
         #Ctrlp:construct.c.glaald
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaald
            #add-point:ON ACTION controlp INFIELD glaald name="construct.c.glaald"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_authorised_ld()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO glaald  #顯示到畫面上
            NEXT FIELD glaald                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaald
            #add-point:BEFORE FIELD glaald name="construct.b.glaald"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaald
            
            #add-point:AFTER FIELD glaald name="construct.a.glaald"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.glaacomp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaacomp
            #add-point:ON ACTION controlp INFIELD glaacomp name="construct.c.glaacomp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooea001_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO glaacomp  #顯示到畫面上
            NEXT FIELD glaacomp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaacomp
            #add-point:BEFORE FIELD glaacomp name="construct.b.glaacomp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaacomp
            
            #add-point:AFTER FIELD glaacomp name="construct.a.glaacomp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.glaa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD glaa001
            #add-point:ON ACTION controlp INFIELD glaa001 name="construct.c.glaa001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO glaa001  #顯示到畫面上
            NEXT FIELD glaa001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD glaa001
            #add-point:BEFORE FIELD glaa001 name="construct.b.glaa001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD glaa001
            
            #add-point:AFTER FIELD glaa001 name="construct.a.glaa001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD yy
            #add-point:BEFORE FIELD yy name="construct.b.yy"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD yy
            
            #add-point:AFTER FIELD yy name="construct.a.yy"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.yy
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD yy
            #add-point:ON ACTION controlp INFIELD yy name="construct.c.yy"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD mm
            #add-point:BEFORE FIELD mm name="construct.b.mm"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD mm
            
            #add-point:AFTER FIELD mm name="construct.a.mm"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.mm
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD mm
            #add-point:ON ACTION controlp INFIELD mm name="construct.c.mm"
            
            #END add-point
 
 
         #Ctrlp:construct.c.faah001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah001
            #add-point:ON ACTION controlp INFIELD faah001 name="construct.c.faah001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_faah001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah001  #顯示到畫面上
            NEXT FIELD faah001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah001
            #add-point:BEFORE FIELD faah001 name="construct.b.faah001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah001
            
            #add-point:AFTER FIELD faah001 name="construct.a.faah001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah007
            #add-point:BEFORE FIELD faah007 name="construct.b.faah007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah007
            
            #add-point:AFTER FIELD faah007 name="construct.a.faah007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah007
            #add-point:ON ACTION controlp INFIELD faah007 name="construct.c.faah007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah008
            #add-point:BEFORE FIELD faah008 name="construct.b.faah008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah008
            
            #add-point:AFTER FIELD faah008 name="construct.a.faah008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah008
            #add-point:ON ACTION controlp INFIELD faah008 name="construct.c.faah008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD faah006
            #add-point:BEFORE FIELD faah006 name="construct.b.faah006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD faah006
            
            #add-point:AFTER FIELD faah006 name="construct.a.faah006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.faah006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD faah006
            #add-point:ON ACTION controlp INFIELD faah006 name="construct.c.faah006"
            
            #END add-point
 
 
 
            
            #add-point:其他管控 name="cs.other"
            
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
                
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
                  INPUT ARRAY g_faah_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = FALSE,
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)
             BEFORE INPUT
                CALL afap240_b_fill(g_wc2)
                LET g_rec_b = g_faah_d.getLength()
                CALL cl_set_comp_entry("faah003,faah004",FALSE)
                CALL cl_set_comp_entry("faah003,faah004,faah005,faah006,faah007,faah008,faah042",FALSE)

            BEFORE ROW
               LET l_ac = ARR_CURR()  

         #全選
         ON ACTION sel_all
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_faah_d.getLength()
               LET g_faah_d[li_idx].sel = "Y"
            END FOR

         #取消全選
         ON ACTION sel_none
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_faah_d.getLength()
               LET g_faah_d[li_idx].sel = "N"
            END FOR
            
#         ON ACTION regain
#            LET l_sel_cnt = 0
#            FOR li_idx = 1 TO g_faah_d.getLength()
#               IF g_faah_d[li_idx].sel = "Y" THEN
#                  LET l_sel_cnt = l_sel_cnt + 1
#               END IF
#            END FOR
#            IF l_sel_cnt = 0 THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 'afa-00063'
#               LET g_errparam.extend = ''
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#
#               CONTINUE DIALOG
#            END IF
#            CALL afap240_regain_data()
#            EXIT DIALOG

         END INPUT   

         
         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         #         DISPLAY ARRAY g_faah_d TO s_detail1.* ATTRIBUTE(COUNT=g_rec_b)
#         END DISPLAY
         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL afap240_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            
            #end add-point
 
         ON ACTION batch_execute
            LET g_action_choice = "batch_execute"
            ACCEPT DIALOG
 
         #add-point:ui_dialog段before_qbeclear name="ui_dialog.before_qbeclear"
         
         #end add-point
 
         ON ACTION qbeclear         
            CLEAR FORM
            INITIALIZE g_master.* TO NULL   #畫面變數清空
            INITIALIZE lc_param.* TO NULL   #傳遞參數變數清空
            #add-point:ui_dialog段qbeclear name="ui_dialog.qbeclear"
            
            #end add-point
 
         ON ACTION history_fill
            CALL cl_schedule_history_fill()
 
         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DIALOG
         
         ON ACTION exit
            LET INT_FLAG = TRUE
            EXIT DIALOG
 
         #add-point:ui_dialog段action name="ui_dialog.more_action"
         
         #end add-point
 
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM   
         INITIALIZE g_master.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL afap240_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      IF NOT INT_FLAG THEN
         IF g_success = 'N' THEN    #有返回False的標記就提示失敗，插入失敗
             CALL s_transaction_end('N','0')
             IF NOT cl_ask_confirm('afa-00058') THEN #產生失敗，是否繼續  
                EXIT WHILE
             ELSE
                CALL g_faah_d.clear()
               #CALL afap240_construct()
                CALL afap240_ui_dialog_1()
                CALL afap240_b_fill(g_wc2)
                CONTINUE WHILE
             END IF             
          ELSE
             CALL s_transaction_end('Y','0')
             IF cl_ask_confirm('afa-00059') THEN #產生成功，是否繼續
                CALL g_faah_d.clear()
               #CALL afap240_construct()
                CALL afap240_ui_dialog_1()
                CALL afap240_b_fill(g_wc2)
                CONTINUE WHILE
             ELSE
                EXIT WHILE
             END IF 
          END IF 
       END IF          
      #end add-point
 
      LET ls_js = util.JSON.stringify(lc_param)  #r類使用g_master/p類使用lc_param
 
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         EXIT WHILE
      ELSE
         IF g_chk_jobid THEN 
            LET g_jobid = g_schedule.gzpa001
         ELSE 
            LET g_jobid = cl_schedule_get_jobid(g_prog)
         END IF 
 
         #依照指定模式執行報表列印
         CASE 
            WHEN g_schedule.gzpa003 = "0"
                 CALL afap240_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = afap240_transfer_argv(ls_js)
                 CALL cl_cmdrun(ls_js)
 
            WHEN g_schedule.gzpa003 = "2"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
 
            WHEN g_schedule.gzpa003 = "3"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
         END CASE  
 
         IF g_schedule.gzpa003 = "2" OR g_schedule.gzpa003 = "3" THEN 
            CALL cl_ask_confirm3("std-00014","") #設定完成
         END IF    
         LET g_schedule.gzpa003 = "0" #預設一開始 立即於前景執行
 
         #add-point:ui_dialog段after schedule name="process.after_schedule"
         
         #end add-point
 
         #欄位初始資訊 
         CALL cl_schedule_init_info("all",g_schedule.gzpa003) 
         LET gi_hiden_asign = FALSE 
         LET gi_hiden_exec = FALSE 
         LET gi_hiden_spec = FALSE 
         LET gi_hiden_exec_end = FALSE 
         CALL cl_schedule_hidden()
      END IF
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="afap240.transfer_argv" type="s" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION afap240_transfer_argv(ls_js)
 
   #add-point:transfer_agrv段define (客製用) name="transfer_agrv.define_customerization"
   
   #end add-point
   DEFINE ls_js       STRING
   DEFINE la_cmdrun   RECORD
             prog       STRING,
             actionid   STRING,
             background LIKE type_t.chr1,
             param      DYNAMIC ARRAY OF STRING
                  END RECORD
   DEFINE la_param    type_parameter
   #add-point:transfer_agrv段define name="transfer_agrv.define"
   
   #end add-point
 
   LET la_cmdrun.prog = g_prog
   LET la_cmdrun.background = "Y"
   LET la_cmdrun.param[1] = ls_js
 
   #add-point:transfer.argv段程式內容 name="transfer.argv.define"
   
   #end add-point
 
   RETURN util.JSON.stringify( la_cmdrun )
END FUNCTION
 
{</section>}
 
{<section id="afap240.process" type="s" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION afap240_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_i         LIKE type_t.num5
   DEFINE l_sel_cnt   LIKE type_t.num5 
   DEFINE li_idx      LIKE type_t.num5   
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
#      LET l_sel_cnt = 01
#      FOR li_idx = 1 TO g_faah_d.getLength()
#         IF g_faah_d[li_idx].sel = "Y" THEN
#            LET l_sel_cnt = l_sel_cnt + 1
#         END IF
#      END FOR
#      IF l_sel_cnt = 0 THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'afa-00063'
#         LET g_errparam.extend = ''
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#      END IF
#      CALL afap240_regain_data()
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE afap240_process_cs CURSOR FROM ls_sql
#  FOREACH afap240_process_cs INTO
   #add-point:process段process name="process.process"
 
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
      LET l_sel_cnt = 0
      FOR li_idx = 1 TO g_faah_d.getLength()
         IF g_faah_d[li_idx].sel = "Y" THEN
            LET l_sel_cnt = l_sel_cnt + 1
         END IF
      END FOR
      IF l_sel_cnt = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'afa-00063'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
      CALL afap240_regain_data()
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      LET l_sel_cnt = 0
      FOR li_idx = 1 TO g_faah_d.getLength()
         IF g_faah_d[li_idx].sel = "Y" THEN
            LET l_sel_cnt = l_sel_cnt + 1
         END IF
      END FOR
      IF l_sel_cnt = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'afa-00063'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
      CALL afap240_regain_data()
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL afap240_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="afap240.get_buffer" type="s" >}
PRIVATE FUNCTION afap240_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.glaald = p_dialog.getFieldBuffer('glaald')
   LET g_master.glaacomp = p_dialog.getFieldBuffer('glaacomp')
   LET g_master.glaa001 = p_dialog.getFieldBuffer('glaa001')
   LET g_master.yy = p_dialog.getFieldBuffer('yy')
   LET g_master.mm = p_dialog.getFieldBuffer('mm')
   LET g_master.faah007 = p_dialog.getFieldBuffer('faah007')
   LET g_master.faah008 = p_dialog.getFieldBuffer('faah008')
   LET g_master.faah006 = p_dialog.getFieldBuffer('faah006')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="afap240.msgcentre_notify" type="s" >}
PRIVATE FUNCTION afap240_msgcentre_notify()
 
   #add-point:process段define (客製用) name="msgcentre_notify.define_customerization"
   
   #end add-point
   DEFINE lc_state LIKE type_t.chr5
   #add-point:process段define name="msgcentre_notify.define"
   
   #end add-point
 
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = "process"
 
   #add-point:msgcentre其他通知 name="msg_centre.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="afap240.other_function" readonly="Y" type="s" >}
#add-point:自定義元件(Function) name="other.function"
################################################################################
# Descriptions...: 描述说明
################################################################################
PRIVATE FUNCTION afap240_glaald_desc()
#DEFINE g_glaacomp   LIKE glaa_t.glaacomp
DEFINE g_glaa001    LIKE glaa_t.glaa001
DEFINE l_glaald_desc    LIKE type_t.chr80
DEFINE l_glaacomp_desc  LIKE type_t.chr80
DEFINE l_glaa001_desc   LIKE type_t.chr80
   SELECT glaacomp,glaa001
     INTO g_glaacomp,g_glaa001
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = g_glaald
      AND glaastus = 'Y'
   DISPLAY g_glaacomp TO glaacomp
   DISPLAY g_glaa001 TO glaa001
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_glaald
   CALL ap_ref_array2(g_ref_fields,"SELECT glaal002 FROM glaal_t WHERE glaalent='"||g_enterprise||"' AND glaalld=? AND glaal001='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET l_glaald_desc = '', g_rtn_fields[1] , ''
   DISPLAY l_glaald_desc TO glaald_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_glaacomp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET l_glaacomp_desc = '', g_rtn_fields[1] , ''
   DISPLAY l_glaacomp_desc TO glaacomp_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_glaa001
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET l_glaa001_desc = '', g_rtn_fields[1] , ''
   DISPLAY l_glaa001_desc TO glaa001_desc
END FUNCTION
################################################################################
# Descriptions...: 還原數據
################################################################################
PRIVATE FUNCTION afap240_data_deal(p_faah003,p_faah004)
DEFINE p_faah003  LIKE faah_t.faah003
DEFINE p_faah004  LIKE faah_t.faah004
DEFINE l_yy,l_mm  LIKE type_t.num5
DEFINE l_faam013  LIKE faam_t.faam013
DEFINE l_faam104  LIKE faam_t.faam104
DEFINE l_faam154  LIKE faam_t.faam154
DEFINE l_faam026  LIKE faam_t.faam026
DEFINE l_faaj004  LIKE faaj_t.faaj004
DEFINE l_faaj005  LIKE faaj_t.faaj005
DEFINE l_faaj029  LIKE faaj_t.faaj029
DEFINE l_faaj109  LIKE faaj_t.faaj109  
DEFINE l_faaj159  LIKE faaj_t.faaj159
DEFINE l_faah014  LIKE faah_t.faah014
DEFINE l_cnt      LIKE type_t.num5


   LET l_yy = g_yy
   LET l_mm = g_mm - 1
   SELECT faam013,faam104,faam154,faam026 
     INTO l_faam013,l_faam104,l_faam154,l_faam026
     FROM faam_t
    WHERE faament = g_enterprise
      AND faamld  = g_glaald
      AND faam001 = p_faah003
      AND faam002 = p_faah004
      AND faam004 = g_yy
      AND faam005 = g_mm
      
   SELECT faaj004,faaj005,faaj029,faaj109,faaj159 
     INTO l_faaj004,l_faaj005,l_faaj029,l_faaj109,l_faaj159
     FROM faaj_t
     WHERE faajent = g_enterprise
       AND faajld  = g_glaald
       AND faaj001 = p_faah003
       AND faaj002 = p_faah004
  
   IF cl_null(l_faaj005) THEN LET l_faaj005 = 0 END IF   
   IF cl_null(l_faaj029) THEN LET l_faaj029 = 0 END IF
   IF cl_null(l_faaj109) THEN LET l_faaj109 = 0 END IF
   IF cl_null(l_faaj159) THEN LET l_faaj159 = 0 END IF
   
   #判斷計提方式是否為 4:本月
   IF g_faal[l_cnt].faal005 = '4' THEN #BEGIN
   IF l_faaj005 = 0 THEN #此次需加入計提方式的判斷 為4的時候才需回寫第一次折舊額(暫時參數未設置)
      LET l_faaj029 = l_faam013
      LET l_faaj109 = l_faam104
      LET l_faaj159 = l_faam154
   END IF
   #折舊次數
   LET l_cnt = 0
   SELECT COUNT(faam001) INTO l_cnt FROM faam_t
   WHERE faament = g_enterprise
      AND faamld  = g_glaald
      AND faam001 = p_faah003
      AND faam002 = p_faah004
      AND faam004 = g_yy
   #取得日期
   SELECT faah014 INTO l_faah014
     FROM faah_t
    WHERE faahent = g_enterprise
     AND faahld  = g_glaald
     AND faah003 = p_faah003
     AND faah004 = p_faah004
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF (l_faam026 = '4' OR l_faam026 ='7') AND (l_faaj004 = l_cnt + 1) AND DAY(l_faah014) != '1' THEN
       LET l_faaj005 = 0
   ELSE
       LET l_faaj005 = l_faaj005 + 1
   END IF
   #判斷是否為第一次折舊再提
   IF l_faam026 = '7'  THEN
      LET l_cnt = 0
      SELECT COUNT(faam026) INTO l_cnt
        FROM faam_t
       WHERE faament = g_enterprise
         AND faamld  = g_glaald
         AND faam001 = p_faah003
         AND faam002 = p_faah004
         AND faam004 = g_yy
         AND faam005 < g_mm 
         AND faam026 = '7'
      IF l_cnt = 0 THEN
         LET l_faaj005 = 1
      END IF
   END IF
   END IF #計提判斷結束
   IF cl_null(l_faam013) THEN LET l_faam013 = 0 END IF
   #更新帳套折舊明細檔faaj
   UPDATE faaj_t SET faaj009 = l_yy,  #折舊年度
                     faaj010 = l_mm,  #折舊期別
                     faaj005 = l_faaj005, #未使用年限
                     faaj017 = faaj017 - l_faam013, #累折
                     faaj018 = faaj018 - l_faam013, #本期累折
                     #faaj022 = faaj022 - l_faam013, #年折舊額    #mark by huangtao
#                     faaj028 = faaj028 + l_faam013, #未折減額  
#                     faaj029 = l_faaj029,           #第一個月未折減額
                     faaj029 = faaj029 + l_faam013, #第一個月未折減額 
                     faaj104 = faaj104 - l_faam104, #本位幣二累折
                     faaj111 = faaj111 - l_faam104, #本位幣二本年累折
                     faaj107 = faaj107 - l_faam104, #本位幣二年折舊額
                     faaj108 = faaj108 + l_faam104, #本位幣二未折減額
                     faaj109 = l_faaj109,           #本位幣二第一個月未折減額  
                     faaj154 = faaj154 - l_faam154, #本位幣三累折
                     faaj161 = faaj161 - l_faam154, #本位幣三本年累折
                     faaj157 = faaj157 - l_faam154, #本位幣三年折舊額   
                     faaj158 = faaj158 + l_faam154, #本位幣三未折減額
                     faaj159 = l_faaj159            #本位幣三第一個月未折減額                     
     WHERE faajent = g_enterprise
       AND faajld  = g_glaald
       AND faaj001 = p_faah003
       AND faaj002 = p_faah004
  IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
      #150731-00004#1 20150807 str---
      #CALL cl_errmsg('',p_faah003||p_faah004,'','afa-00043',1)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'afa-00043'
      LET g_errparam.extend = p_faah003||p_faah004
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #150731-00004#1 20150807 end---
      RETURN FALSE
  END IF
  #需更新faah的資產狀態為'2折舊中'
  UPDATE faah_t SET faah015 = '2'
   WHERE faahent = g_enterprise
    #AND faahld  = g_glaald
     AND faah003 = p_faah003
     AND faah004 = p_faah004
  IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
      #150731-00004#1 20150807 str---
      #CALL cl_errmsg('',p_faah003||p_faah004,'','afa-00043',1)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'afa-00043'
      LET g_errparam.extend = p_faah003||p_faah004
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #150731-00004#1 20150807 end---
      RETURN FALSE
  END IF        

  
  #刪除本期折舊明細資料faam_t
  DELETE FROM faam_t WHERE faament = g_enterprise AND faamld = g_glaald
                       AND faamsite = g_faamsite
                       AND faam001 = p_faah003 
                       AND faam002 = p_faah004
                       AND faam004 = g_yy
                       AND faam005 = g_mm
  IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
      #150731-00004#1 20150807 str---
      #CALL cl_errmsg('',p_faah003||p_faah004,'','afa-00043',1)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'afa-00043'
      LET g_errparam.extend = p_faah003||p_faah004
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #150731-00004#1 20150807 end---
     RETURN FALSE
  END IF   
  RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 获取查询条件
################################################################################
PRIVATE FUNCTION afap240_construct()
      CLEAR FORM
      LET g_wc2 = NULL
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:ui_dialog段display array
      INPUT g_glaald,g_yy,g_mm FROM  glaald,yy,mm
         BEFORE INPUT
            LET g_yy = YEAR(g_today)
            LET g_mm = MONTH(g_today)
            SELECT glaald INTO g_glaald FROM glaa_t
             WHERE glaaent = g_enterprise AND glaacomp = g_site
               AND glaa014 ='Y' 
            DISPLAY BY NAME g_glaald
            DISPLAY g_yy,g_mm TO yy,mm            
            CALL afap240_glaald_desc()
             
         #此段落由子樣板a01產生
         BEFORE FIELD glaald
            #add-point:BEFORE FIELD faaeld

            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD glaald            
            IF cl_null(g_glaald) THEN
               NEXT FIELD glaald
            END IF
            IF NOT cl_null(g_glaald) THEN

               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_glaald
               #160318-00025#7--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "agl-00051:sub-01302|agli010|",cl_get_progname("agli010",g_lang,"2"),"|:EXEPROGagli010"
               #160318-00025#7--add--end

               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_glaald") THEN

               ELSE
                  LET g_glaald = g_glaald_t
                  NEXT FIELD CURRENT
               END IF
            END IF
            CALL afap240_glaald_desc() 

         AFTER INPUT

            
         ON ACTION controlp INFIELD glaald
            #add-point:ON ACTION controlp INFIELD faaeld
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_user
            LET g_qryparam.arg2 = g_dept			
            CALL q_authorised_ld()              #呼叫開窗
            LET g_glaald = g_qryparam.return1
            DISPLAY  g_glaald TO glaald  #顯示到畫面上
            NEXT FIELD glaald                     #返回原欄位


            #END add-point
           
 
 
               
         END INPUT       
         #end add-point
         #add-point:ui_dialog段construct
         CONSTRUCT g_wc2 ON faah003,faah004,faah006,faah007,faah005,faah008,faah042
                      FROM s_detail1[1].faah003,s_detail1[1].faah004,s_detail1[1].faah006,
                           s_detail1[1].faah007,s_detail1[1].faah005,s_detail1[1].faah008,
                           s_detail1[1].faah042

         ON ACTION controlp INFIELD faah003
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_faah003()                       
            DISPLAY g_qryparam.return1 TO faah003  

            NEXT FIELD faah003                     #返回原欄位

         ON ACTION controlp INFIELD faah004
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_faah004()                       
            DISPLAY g_qryparam.return1 TO faah004  

            NEXT FIELD faah004                     #返回原欄位

         ON ACTION controlp INFIELD faah006
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_faac001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah006  #顯示到畫面上

            NEXT FIELD faah006                     #返回原欄位

         ON ACTION controlp INFIELD faah007
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_faad001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah007  #顯示到畫面上
            NEXT FIELD faah007                     #返回原欄位

         ON ACTION controlp INFIELD faah008
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '3903'
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO faah008  #顯示到畫面上
            NEXT FIELD faah008                     #返回原欄位
         END CONSTRUCT                  
 
         ON ACTION qbe_select
#saki       CALL cl_qbe_select()
 
         ON ACTION qbe_save
#saki       CALL cl_qbe_save()
 
         ON ACTION accept
            ACCEPT DIALOG
 
         ON ACTION cancel
            LET INT_FLAG = TRUE
            EXIT DIALOG 
         
#         ON ACTION CLOSE 
#            LET INT_FLAG = TRUE
#            EXIT DIALOG
#         
#         ON ACTION exit
#            LET INT_FLAG = TRUE
#            EXIT DIALOG
 
         #交談指令共用ACTION
         &include "main_menu.4gl"
         &include "relating_action.4gl"
         &include "common_action.4gl"
      END DIALOG
 
END FUNCTION
################################################################################
# Descriptions...: 填充满足条件的数据
################################################################################
PRIVATE FUNCTION afap240_b_fill(p_wc2)
DEFINE p_wc2  STRING
DEFINE l_sql  STRING
DEFINE l_cnt  LIKE type_t.num5

   #CALL cl_showmsg_init()       #150731-00004#1 20150807 mark
    CALL cl_err_collect_init()   #150731-00004#1 20150807 add
    CALL g_faah_d.clear()
    LET l_cnt = 1
    #chenying add
    IF cl_null(p_wc2) THEN
       LET p_wc2 = " 1=1" 
    END IF
    #161111-00049#14--ADD--S--
	 LET p_wc2 = p_wc2 ," AND faah032 IN (SELECT glaacomp FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald = '",g_glaald,"' ) "    
    #主要类型限定
    LET l_sql = " SELECT faal001  FROM faal_t  WHERE faalent = ",g_enterprise," AND faalld = '",g_glaald,"'"
    LET p_wc2 = p_wc2," AND faah006 IN (",l_sql,")"
#161214-00063#1 mark s---    
#    #次要类型限定
#    LET l_sql = " SELECT faad001  FROM faad_t  WHERE faadent = ",g_enterprise," AND faad002 IN (SELECT faal001 FROM faal_t WHERE faalent = ",g_enterprise," AND faalld = '",g_glaald,"')" 
#    LET p_wc2 = p_wc2," AND faah007 IN (",l_sql,")"  
#161214-00063#1 mark e---
	 #161111-00049#14--ADD--E--
    #chenying add
    #LET l_sql = " SELECT 'Y',faah003,faah004,faah001,faah015,faah006,'',faah007,'',faah005,faah008,'',faah042,faah022,faah024 ", #20141212 add by chening faah001,faah015 #161104-00048#3 mark
    LET l_sql = " SELECT 'Y',faah003,faah004,faah001,faaj038,faah006,'',faah007,'',faah005,faah008,'',faah042,faah022,faah024 ", #20141212 add by chening faah001,faah015  #161104-00048#3 add faah015-->faaj038 
                " ,faam007,faam026 ",
                "   FROM faaj_t,faam_t,faah_t ",
                "  WHERE faajent = faament AND faajld = faamld ",
                "    AND faaj001 = faam001 AND faaj002 = faam002 ",
                "    AND faaj037 = faam000 AND faahent = faament ",
                "    AND faah003 = faam001 AND faah004 = faam002 ",
                "    AND faah001 = faam000 ",
                "    AND faament = '",g_enterprise,"'",
                "    AND faamld  = '",g_glaald,"'",
                "    AND faamsite = '",g_faamsite,"'",
                "    AND faam007 <> '3' ",
                "    AND faam024 IS NULL ",
                "    AND faam004 = '",g_yy,"'",
                "    AND faam005 = '",g_mm,"'",
                "    AND faahstus = 'Y' ",
                "    AND ((faaj009 = '",g_yy,"' AND faaj010 <= '",g_mm,"') OR faaj009 <= '",g_yy,"')", #chenying add
                "    AND ",p_wc2 CLIPPED,
                "  ORDER BY faah003,faah004 "
    PREPARE afap240_bp_pre FROM l_sql
    DECLARE afap240_bp_cs CURSOR FOR afap240_bp_pre
    FOREACH afap240_bp_cs INTO g_faah_d[l_cnt].*,g_faam[l_cnt].faam007,g_faam[l_cnt].faam026
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
         #抓取參數資料
         SELECT faal002,faal003,faal004,faal005 
           INTO g_faal[l_cnt].faal002,g_faal[l_cnt].faal003,g_faal[l_cnt].faal004,g_faal[l_cnt].faal005 
           FROM faal_t
          WHERE faalent = g_enterprise AND faalld = g_glaald
            AND faal001 = g_faah_d[l_cnt].faah006
         
         IF cl_null(g_faal[l_cnt].faal002) THEN LET g_faal[l_cnt].faal002 = 'N' END IF
         IF cl_null(g_faal[l_cnt].faal003) THEN LET g_faal[l_cnt].faal003 = 'N' END IF
         IF cl_null(g_faal[l_cnt].faal004) THEN LET g_faal[l_cnt].faal004 = 'N' END IF
         IF cl_null(g_faal[l_cnt].faal005) THEN LET g_faal[l_cnt].faal005 = '2' END IF
         
         IF NOT afap240_fill_chk(g_faah_d[l_cnt].faah003,g_faah_d[l_cnt].faah004,g_faah_d[l_cnt].faah001,g_faah_d[l_cnt].faah006,g_faal[l_cnt].faal003) THEN #20141212 add faah001 by chening 
            CALL g_faah_d.deleteElement(l_cnt)
            CONTINUE FOREACH
         END IF   
         INITIALIZE g_ref_fields TO NULL
          LET g_ref_fields[1] = g_faah_d[l_cnt].faah006
          CALL ap_ref_array2(g_ref_fields,"SELECT faacl003 FROM faacl_t WHERE faaclent='"||g_enterprise||"' AND faacl001=? AND faacl002='"||g_dlang||"'","") RETURNING g_rtn_fields
          LET g_faah_d[l_cnt].faah006_desc = '', g_rtn_fields[1] , ''

          INITIALIZE g_ref_fields TO NULL
          LET g_ref_fields[1] = g_faah_d[l_cnt].faah007
          CALL ap_ref_array2(g_ref_fields,"SELECT faadl003 FROM faadl_t WHERE faadlent='"||g_enterprise||"' AND faadl001=? AND faadl002='"||g_dlang||"'","") RETURNING g_rtn_fields
          LET g_faah_d[l_cnt].faah007_desc = '', g_rtn_fields[1] , ''

          INITIALIZE g_ref_fields TO NULL
          LET g_ref_fields[1] = g_faah_d[l_cnt].faah008
          CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='3903' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
          LET g_faah_d[l_cnt].faah008_desc = '', g_rtn_fields[1] , ''
                 
         LET l_cnt = l_cnt + 1
         IF l_cnt > g_max_rec THEN
            EXIT FOREACH
         END IF         
    END FOREACH
    CALL g_faah_d.deleteElement(g_faah_d.getLength())
   #CALL cl_err_showmsg()         #150731-00004#1 20150807 mark
   CALL cl_err_collect_show()     #150731-00004#1 20150807 add
END FUNCTION
################################################################################
# Descriptions...: 資料過濾檢查
################################################################################
PRIVATE FUNCTION afap240_fill_chk(p_faah003,p_faah004,p_faah001,p_faah006,p_faal003)
DEFINE l_n LIKE type_t.num5
DEFINE p_faah006 LIKE faah_t.faah006
DEFINE p_faah003 LIKE faah_t.faah003
DEFINE p_faah004 LIKE faah_t.faah004
DEFINE p_faah001 LIKE faah_t.faah001 #20141212 add by chening
DEFINE p_faal003 LIKE faal_t.faal003
DEFINE l_faaj005 LIKE faaj_t.faaj005
DEFINE l_faaj009 LIKE faaj_t.faaj009
DEFINE l_faaj010 LIKE faaj_t.faaj010
DEFINE l_faah006 LIKE faah_t.faah006
DEFINE l_mm      LIKE type_t.chr20    #20150515 add lujh

#2不可有大于该还原月份的异动
#後續表還
#3不可有大于该还原月份的折旧明细档
   SELECT COUNT(faam001) INTO l_n FROM faam_t
    WHERE faament = g_enterprise
      AND faamld  = g_glaald
      AND faam001 = p_faah003
      AND faam002 = p_faah004
      AND faam000 = p_faah001 #20141212 add by chening
      AND faam004 = g_yy
      AND faam005 > g_mm
   IF l_n > 0 THEN
      #150731-00004#1 20150807 str---
      #CALL cl_errmsg('',p_faah003||p_faah004,'','afa-00043',1)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'afa-00043'
      LET g_errparam.extend = p_faah003||p_faah004
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #150731-00004#1 20150807 end---
      RETURN FALSE
   END IF
   #171107-00034#1--add--s--xul
   LET l_mm = g_mm
   IF l_mm < 10 THEN 
      LET l_mm = '0' CLIPPED,l_mm
   END IF
   #171107-00034#1--add--e--xul
#4参数：当月处份是否计提折旧=Y，处分需先确认还原
   IF p_faal003 = 'Y' THEN
      LET l_n = 0
      #為銷賬，fabg005='6'
      SELECT COUNT(*) INTO l_n FROM fabg_t,fabh_t
       WHERE fabgent = fabhent AND fabgld = fabhld 
         AND fabgdocno = fabhdocno AND fabgent = g_enterprise
         AND fabgld = g_glaald AND fabg005 = '6'
         AND fabh001 = p_faah003
         AND fabh002 = p_faah004
         AND TO_CHAR(fabgdocdt,'YYYY') = g_yy #171107-00034#1 xul add 
         AND TO_CHAR(fabgdocdt,'MM') = l_mm   #171107-00034#1 xul add 
         #AND fabgstus <> 'S' #161221-00028#1  mark
         AND fabgstus <> 'X'  #161221-00028#1 add
      IF l_n > 0 THEN
         RETURN FALSE
      END IF
      LET l_n = 0
      #為出售，fabg005='4'
      SELECT COUNT(*) INTO l_n FROM fabg_t,fabo_t
       WHERE fabgent = faboent AND fabgld = fabold 
         AND fabgdocno = fabodocno AND fabgent = g_enterprise
         AND fabgld = g_glaald AND fabg005 = '4'
         AND fabo001 = p_faah003
         AND fabo002 = p_faah004
         AND TO_CHAR(fabgdocdt,'YYYY') = g_yy #171107-00034#1 xul add 
         AND TO_CHAR(fabgdocdt,'MM') = l_mm   #171107-00034#1 xul add 
         #AND fabgstus <> 'S' #161221-00028#1  mark
         AND fabgstus <> 'X'  #161221-00028#1 add
      IF l_n > 0 THEN
         RETURN FALSE
      END IF
      LET l_n = 0
#      #為報廢，fabg005='21'，單身檔案未開
#      SELECT COUNT(*) INTO l_n FROM fabg_t,fabo_t
#       WHERE fabgent = faboent AND fabgld = fabold 
#         AND fabgdocno = fabodocno AND fabgent = g_enterprise
#         AND fabgld = g_glaald
#         AND fabo001 = p_faah003
#         AND fabo002 = p_faah004
#         AND fabgstus <> 'S'
#      IF l_n > 0 THEN
#         RETURN FALSE
#      END IF
     END IF
#5：若在折旧月份前就为先前折毕
   SELECT faaj005,faaj009,faaj010
     INTO l_faaj005,l_faaj009,l_faaj010
     FROM faaj_t
     WHERE faajent = g_enterprise
       AND faajld  = g_glaald
       AND faaj001 = p_faah003
       AND faaj002 = p_faah004
       AND faaj037 = p_faah001 #20141212 add by chening
   IF cl_null(l_faaj005) THEN LET l_faaj005 = 0 END IF
   IF l_faaj005 = 0 AND (l_faaj009 < g_yy 
                       OR (l_faaj009=g_yy AND l_faaj010<g_mm)) THEN #此次需加入計提方式的判斷 為4的時候才需回寫第一次折舊額(暫時參數未設置)
      RETURN FALSE    
   END IF
   #若未使用年限為0，最近折舊年小於當前折舊還原年或者最近折舊年等於當前年且最近折舊月小月折舊還遠月
   IF l_faaj005 = 0 and ( l_faaj009 < g_yy or
         ( l_faaj009=g_yy and l_faaj010< g_mm )) THEN
      LET g_over = 'Y'    
   ELSE 
      LET g_over = 'N'    
   END IF    
   
   #20150515--add--str--lujh
   #171107-00034#1--mark--s--xul
#   LET l_mm = g_mm
#   IF l_mm < 10 THEN 
#      LET l_mm = '0' CLIPPED,l_mm
#   END IF
   #171107-00034#1--mark--e--xul
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM fabg_t,fabh_t 
    WHERE fabgent = g_enterprise
      AND fabgent = fabhent 
      AND fabgld = fabhld 
      AND fabgdocno = fabhdocno 
      AND fabgld = g_glaald
      AND TO_CHAR(fabgdocdt,'YYYY') = g_yy
      AND TO_CHAR(fabgdocdt,'MM') = l_mm
      AND fabh001 = p_faah003
      AND fabh000 = p_faah001
      AND fabh002 = p_faah004
      AND fabg005 = '0'
      AND fabgstus <> 'X' #161123-00011#1 add  
      AND fabgstus = 'N'  #170619-00054#2 xul add 
   
   IF l_n > 0 THEN
      #150731-00004#1 20150807 str---
      #CALL cl_errmsg('',p_faah003||p_faah004,'','afa-01018',1)
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'afa-01018'
      LET g_errparam.extend = p_faah003||p_faah004
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #150731-00004#1 20150807 end---
      RETURN FALSE
   END IF
   #170619-00054#2--add--s--xul
   #afat509是 Y,S 的资料直接排除，不用报错
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM fabg_t,fabh_t 
    WHERE fabgent = g_enterprise
      AND fabgent = fabhent 
      AND fabgld = fabhld 
      AND fabgdocno = fabhdocno 
      AND fabgld = g_glaald
      AND TO_CHAR(fabgdocdt,'YYYY') = g_yy
      AND TO_CHAR(fabgdocdt,'MM') = l_mm
      AND fabh001 = p_faah003
      AND fabh000 = p_faah001
      AND fabh002 = p_faah004
      AND fabg005 = '0'
      AND fabgstus <> 'X' 
      AND fabgstus IN ('S','Y')  
   IF l_n > 0 THEN    
      RETURN FALSE
   END IF
   #170619-00054#2--add--e--xul
   #LET l_n = 0
   #SELECT COUNT(*) INTO l_n
   #  FROM faba_t,fabb_t 
   # WHERE fabaent = g_enterprise
   #   AND fabaent = fabbent 
   #   AND fabadocno = fabbdocno 
   #   AND fabacomp = g_glaacomp
   #   AND TO_CHAR(fabadocdt,'YYYY') = g_yy
   #   AND TO_CHAR(fabadocdt,'MM') = l_mm
   #   AND fabb001 = p_faah003
   #   AND fabb000 = p_faah001
   #   AND fabb002 = p_faah004
   #
   #IF l_n > 0 THEN
   #   CALL cl_errmsg('',p_faah003||p_faah004,'','afa-01018',1)
   #   RETURN FALSE
   #END IF
   #20150515--add--end--lujh
   
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 執行攤提還原
################################################################################
PRIVATE FUNCTION afap240_regain_data()
DEFINE l_i   LIKE type_t.num5
DEFINE l_yy,l_mm  LIKE type_t.num5
DEFINE l_faam013  LIKE faam_t.faam013
DEFINE l_faam104  LIKE faam_t.faam104
DEFINE l_faam154  LIKE faam_t.faam154
DEFINE l_faam026  LIKE faam_t.faam026
DEFINE l_faaj004  LIKE faaj_t.faaj004
DEFINE l_faaj005  LIKE faaj_t.faaj005
DEFINE l_faaj019  LIKE faaj_t.faaj019
DEFINE l_faaj008  LIKE faaj_t.faaj008
DEFINE l_faaj028  LIKE faaj_t.faaj028
DEFINE l_faaj029  LIKE faaj_t.faaj029
DEFINE l_faaj109  LIKE faaj_t.faaj109  
DEFINE l_faaj159  LIKE faaj_t.faaj159
DEFINE l_faah014  LIKE faah_t.faah014
DEFINE l_cnt      LIKE type_t.num5
DEFINE l_faaj013  LIKE faaj_t.faaj013
DEFINE l_faaj038  LIKE faaj_t.faaj038
DEFINE l_faah015  LIKE faah_t.faah015
DEFINE  l_yy2     LIKE type_t.chr4,   
        l_mm2     LIKE type_t.chr2,
        l_ym      LIKE type_t.chr6
DEFINE  l_faam016 LIKE faam_t.faam016
   
   LET g_success = 'Y'
  #CALL cl_showmsg_init()        #150731-00004#1 20150807 mark
   CALL cl_err_collect_init()   #150731-00004#1 20150807 add
   CALL s_transaction_begin()
   IF g_faah_d.getLength() = 0 THEN
      LET g_success = 'N'
   END IF
   FOR l_i = 1 TO g_faah_d.getLength()
      IF g_faah_d[l_i].sel = 'Y' THEN
#         IF NOT afap240_data_deal(g_faah_d[l_i].faah003,g_faah_d[l_i].faah004) THEN
#            LET g_success = 'N'
#            EXIT FOR
#         END IF
          LET l_mm = g_mm - 1      
           LET l_yy = g_yy
           IF l_mm < 1 THEN
              LET l_yy = g_yy - 1
              LET l_mm = 12 
           END IF
          IF g_over = 'N' AND g_faam[l_i].faam007 !='3' THEN
             SELECT faam013,faam104,faam154,faam026 
               INTO l_faam013,l_faam104,l_faam154,l_faam026
               FROM faam_t
              WHERE faament = g_enterprise
                AND faamld  = g_glaald
                AND faam001 = g_faah_d[l_i].faah003
                AND faam002 = g_faah_d[l_i].faah004
                AND faam000 = g_faah_d[l_i].faah001 #20141212 add by chening
                AND faam004 = g_yy
                AND faam005 = g_mm
                AND faam007 != '3'  #160426-00014#40 add 
             ###############################add by huangtao
             #在跨年还原的时候，本年累折这个栏位要取上一年度faam，12月的本年累折，如果没有，就取faam中开帐的本年累折
             IF g_mm = 1 THEN
               SELECT faam016 INTO l_faam016  FROM faam_t
              WHERE faament = g_enterprise
                AND faamld  = g_glaald
                AND faam001 = g_faah_d[l_i].faah003
                AND faam002 = g_faah_d[l_i].faah004
                AND faam000 = g_faah_d[l_i].faah001 
                AND faam004 = g_yy-1 AND faam005 = 12 AND faam006 <> '0'
                AND faam007 != '3'  #160426-00014#40 add
                IF cl_null(l_faam016) OR l_faam016 = 0 THEN
                  SELECT faam016 INTO l_faam016  FROM faam_t
                   WHERE faament = g_enterprise
                     AND faamld  = g_glaald
                     AND faam001 = g_faah_d[l_i].faah003
                     AND faam002 = g_faah_d[l_i].faah004
                     AND faam000 = g_faah_d[l_i].faah001 
                     AND faam004 = g_yy-1 AND faam005 = 12 AND faam006 = '0'
                     AND faam007 != '3'  #160426-00014#40 add
                   IF cl_null(l_faam016) OR l_faam016 = 0 THEN
                      LET l_faam016 = 0
                   END IF
                END IF                
             END IF    
             ###############################add by huangtao
             
             #資產狀態,第一个月未折减额,折畢再提年限   入賬日期，
             SELECT faaj038,faaj029,faaj013,faaj004,faaj005,faaj109,faaj159 
               INTO l_faaj038,l_faaj029,l_faaj013,l_faaj004,l_faaj005,l_faaj109,l_faaj159
               FROM faaj_t
               WHERE faajent = g_enterprise
                 AND faajld  = g_glaald
                 AND faaj001 = g_faah_d[l_i].faah003
                 AND faaj002 = g_faah_d[l_i].faah004
                 AND faaj037 = g_faah_d[l_i].faah001 #20141212 add by chening
             
             IF cl_null(l_faaj005) THEN LET l_faaj005 = 0 END IF   
             IF cl_null(l_faaj029) THEN LET l_faaj029 = 0 END IF
             IF cl_null(l_faaj109) THEN LET l_faaj109 = 0 END IF
             IF cl_null(l_faaj159) THEN LET l_faaj159 = 0 END IF
             
             #取得日期
             SELECT faah014,faah015 INTO l_faah014,l_faah015
               FROM faah_t
              WHERE faahent = g_enterprise
              #AND faahld  = g_glaald
               AND faah003 = g_faah_d[l_i].faah003
               AND faah004 = g_faah_d[l_i].faah004
               AND faah001 = g_faah_d[l_i].faah001 #20141212 add by chening
                  
             #判斷計提方式是否為 4:本月
             IF g_faal[l_i].faal005 = '4' THEN #BEGIN
                LET l_cnt = 0                                                                                                          
#                SELECT COUNT(DISTINCT faam003||faam004) INTO l_cnt    #20141210 mark by chenying
                SELECT COUNT(DISTINCT faam004||faam005) INTO l_cnt     #20141210 add by chenying               
                  FROM faam_t                                                                                                        
                 WHERE faam001 = g_faah_d[l_i].faah003 AND faam02 = g_faah_d[l_i].faah004  
                   AND faam000 = g_faah_d[l_i].faah001 #20141212 add by chening  
                   AND faament=g_enterprise  #160905-00007#1 add 
                   AND faam007 != '3'  #160426-00014#40 add 
                IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF 
                
                #如何判斷此次還原是否為殘月,                                                                                           
                #狀態為4或7可能為一般/續提折舊的最後一期,                                                                              
                #再判斷已存在折舊檔折舊次數+1是否等於耐用年限,且入帳日不為1,                                                           
                #還原時,faj30還是要為0,faj331需寫回 
                IF (l_faaj038 = '7' OR l_faaj038 ='4') AND                                                                                 
                   l_cnt = l_faaj004+1 AND DAY(l_faah014) != '1' THEN                                                                        
                   LET l_faaj005=0                                                                                                       
                ELSE                                                                                                                   
                   LET l_faaj005=l_faaj005 + 1                                                                                             
                END IF                                                                                                                 
             ELSE    
                IF l_faaj038 = '7' THEN
                   IF l_faaj005=l_faaj013 THEN
                      #第一次進入折畢再提,還原的話是要將未用年限回寫為1
                      LET l_faaj005=1
                   ELSE
                      LET l_faaj005=l_faaj005 + 1
                   END IF
                ELSE 
                   LET l_faaj005=l_faaj005 + 1
                END IF
             END IF 
#             IF l_faaj005 = 0 THEN #此次需加入計提方式的判斷 為4的時候才需回寫第一次折舊額(暫時參數未設置)
#                LET l_faaj029 = l_faam013
#                LET l_faaj109 = l_faam104
#                LET l_faaj159 = l_faam154
#             END IF
             #折舊次數
#             LET l_cnt = 0
#             SELECT COUNT(faam001) INTO l_cnt FROM faam_t
#             WHERE faament = g_enterprise
#                AND faamld  = g_glaald
#                AND faam001 = p_faah003
#                AND faam002 = p_faah004
#                AND faam004 = g_yy
#  
#20141210 mod by chenying faam003->faam004,faam004->faam005
#             SELECT MAX(faam003*100+faam004) INTO l_ym FROM faam_t
#              WHERE faament= g_enterprise AND faamld = g_glaald
#                AND faam001=g_faah_d[l_i].faah003 AND faam002 = g_faah_d[l_i].faah004
#                AND ((faam003 = g_yy AND faam004 < g_mm)
#                 OR faam003< g_yy)
             SELECT MAX(faam004*100+faam005) INTO l_ym FROM faam_t
              WHERE faament = g_enterprise AND faamld = g_glaald
                AND faam001 = g_faah_d[l_i].faah003 AND faam002 = g_faah_d[l_i].faah004
                AND faam000 = g_faah_d[l_i].faah001 #20141212 add by chening
                AND ((faam004 = g_yy AND faam005 < g_mm)
                 OR faam004< g_yy)
                AND faam007 != '3'  #160426-00014#40 add  
#20141210 mod by chenying faam003->faam004,faam004->faam005                 
             IF STATUS THEN
                IF cl_null(l_ym) THEN     
                   LET l_yy2 = ''
                   LET l_mm2 = ''
                END IF          
             ELSE
                LET l_yy2 = l_ym[1,4]
                LET l_mm2 = l_ym[5,6]
             END IF
             
             IF cl_null(l_faam013) THEN LET l_faam013 = 0 END IF
             IF g_faal[l_i].faal005 != '4' THEN
                #更新帳套折舊明細檔faaj
                UPDATE faaj_t SET faaj009 = l_yy2,  #折舊年度
                                  faaj010 = l_mm2,  #折舊期別
                                  faaj005 = l_faaj005, #未使用年限
                                  faaj017 = faaj017 - l_faam013, #累折
                                  ###################mod by huangtao
                                  #faaj018 = faaj018 - l_faam013, #本期累折
                                  faaj018 =(CASE WHEN g_mm=1 THEN l_faam016 ELSE faaj018 - l_faam013 END ),
                                  ###################mod by huangtao
                                  #faaj022 = faaj022 - l_faam013, #年折舊額   mark by huangtao
                                  faaj028 = faaj028 + l_faam013, #未折減額  
                                  faaj104 = faaj104 - l_faam104, #本位幣二累折
                                  faaj111 = faaj111 - l_faam104, #本位幣二本年累折
                                  faaj107 = faaj107 - l_faam104, #本位幣二年折舊額
                                  faaj108 = faaj108 + l_faam104, #本位幣二未折減額                                  
                                  faaj154 = faaj154 - l_faam154, #本位幣三累折
                                  faaj161 = faaj161 - l_faam154, #本位幣三本年累折
                                  faaj157 = faaj157 - l_faam154, #本位幣三年折舊額   
                                  faaj158 = faaj158 + l_faam154  #本位幣三未折減額               
                  WHERE faajent = g_enterprise
                    AND faajld  = g_glaald
                    AND faaj001 = g_faah_d[l_i].faah003
                    AND faaj002 = g_faah_d[l_i].faah004
                    AND faaj037 = g_faah_d[l_i].faah001 #20141212 add by chening
                IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                    LET g_success = 'N'
                    #150731-00004#1 20150807 str---
                    #CALL cl_errmsg('',g_faah_d[l_i].faah003||g_faah_d[l_i].faah004,'','afa-00043',1)
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'afa-00043'
                    LET g_errparam.extend = g_faah_d[l_i].faah003||g_faah_d[l_i].faah004
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                    #150731-00004#1 20150807 end---
                   #RETURN FALSE
                END IF
             ELSE
                #當最後那個殘月的折舊還原,需還原第一個月未折減額
                SELECT faaj019,faaj028,faaj008,faaj004                                                                            
                  INTO l_faaj019,l_faaj028,l_faaj008,l_faaj004                                                               
                  FROM faaj_t                                                                                                        
                 WHERE faajent = g_enterprise
                   AND faajld  = g_glaald
                   AND faaj001 = g_faah_d[l_i].faah003
                   AND faaj002 = g_faah_d[l_i].faah004 
                   AND faaj037 = g_faah_d[l_i].faah001 #20141212 add by chening                   
                                      
                LET l_cnt = 0                                                                                                          
#                SELECT COUNT(DISTINCT faam003||faam004) INTO l_cnt #20141210 mark by chenying  
                SELECT COUNT(DISTINCT faam004||faam005) INTO l_cnt  #20141210 add by chenying                
                  FROM faam_t                                                                                                        
                 WHERE faament = g_enterprise AND faamld = g_glaald
                   AND faam001 = g_faah_d[l_i].faah003 
                   AND faam002 = g_faah_d[l_i].faah004
                   AND faam000 = g_faah_d[l_i].faah001 #20141212 add by chening
                   AND faam004 = g_yy
                   AND faam005 = g_mm   
                   AND faam007 != '3'  #160426-00014#40 add                    
                IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF   
                IF cl_null(l_faam013) THEN LET l_faam013 = 0 END IF   
                IF cl_null(l_faam104) THEN LET l_faam104 = 0 END IF
                IF cl_null(l_faam154) THEN LET l_faam154 = 0 END IF
                IF cl_null(l_faaj029) THEN LET l_faaj029 = 0 END IF
                IF cl_null(l_faaj109) THEN LET l_faaj109 = 0 END IF
                IF cl_null(l_faaj159) THEN LET l_faaj159 = 0 END IF
                #如何判斷此次還原是否為殘月,                                                                                           
                #狀態為4或7可能為一般/續提折舊的最後一期,                                                                              
                #再判斷已存在折舊檔折舊次數+1是否等於耐用年限,且入帳日不為1,                                                           
                #還原時,faj30還是要為0,faj331需寫回                                                                                    
                #IF (l_faah015 = '7' OR l_faah015 ='4') AND  #161104-00048#3 mark
                IF (l_faaj038 = '7' OR l_faaj038 ='4') AND   #161104-00048#3 add             
                   l_cnt = l_faaj004+1 AND DAY(l_faah014) != 1 THEN
                   #最後那個殘月的折舊還原 
                   #更新帳套折舊明細檔faaj
                   UPDATE faaj_t SET faaj009 = l_yy2,  #折舊年度
                                     faaj010 = l_mm2,  #折舊期別
                                     faaj005 = l_faaj005, #未使用年限
                                     faaj017 = faaj017 - l_faam013, #累折
                                     faaj038 = g_faam[l_i].faam026,  #albireo 160530   #160530-00036#1 
                                     ###################mod by huangtao
                                     #faaj018 = faaj018 - l_faam013, #本期累折
                                     faaj018 =(CASE WHEN g_mm=1 THEN l_faam016 ELSE faaj018 - l_faam013 END ),
                                     ###################mod by huangtao
                                     #faaj022 = faaj022 - l_faam013, #年折舊額    mark by huangtao
                                     faaj029 = faaj029 + l_faam013, #第一個月未折減額 
                                     faaj104 = faaj104 - l_faam104, #本位幣二累折
                                     faaj111 = faaj111 - l_faam104, #本位幣二本年累折
                                     faaj107 = faaj107 - l_faam104, #本位幣二年折舊額
                                     faaj109 = faaj109 + l_faam104, #本位幣二第一個月未折減額  
                                     faaj154 = faaj154 - l_faam154, #本位幣三累折
                                     faaj161 = faaj161 - l_faam154, #本位幣三本年累折
                                     faaj157 = faaj157 - l_faam154, #本位幣三年折舊額   
                                     faaj159 = faaj159 + l_faam104  #本位幣三第一個月未折減額                     
                     WHERE faajent = g_enterprise
                       AND faajld  = g_glaald
                       AND faaj001 = g_faah_d[l_i].faah003
                       AND faaj002 = g_faah_d[l_i].faah004
                       AND faaj037 = g_faah_d[l_i].faah001 #20141212 add by chening
                   IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                       LET g_success = 'N'
                       #150731-00004#1 20150807 str---
                       #CALL cl_errmsg('',g_faah_d[l_i].faah003||g_faah_d[l_i].faah004,'','afa-00043',1)
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = 'afa-00043'
                       LET g_errparam.extend = g_faah_d[l_i].faah003||g_faah_d[l_i].faah004
                       LET g_errparam.popup = TRUE
                       CALL cl_err()
                       #150731-00004#1 20150807 end---
                      #RETURN FALSE
                   END IF       
                ELSE
                   IF g_ym = l_faaj008 THEN  #第一期攤提還原
                      #更新帳套折舊明細檔faaj
                      UPDATE faaj_t SET faaj009 = l_yy2,  #折舊年度
                                        faaj010 = l_mm2,  #折舊期別
                                        faaj005 = l_faaj005, #未使用年限
                                        faaj017 = faaj017 - l_faam013, #累折
                                        faaj038 = g_faam[l_i].faam026,  #albireo 160530   #160530-00036#1
                                        ###################mod by huangtao
                                        #faaj018 = faaj018 - l_faam013, #本期累折
                                        faaj018 =(CASE WHEN g_mm=1 THEN l_faam016 ELSE faaj018 - l_faam013 END ),
                                        ###################mod by huangtao
                                        #faaj022 = faaj022 - l_faam013, #年折舊額   mark by huangtao
                                        faaj028 = faaj028 + l_faam013 + l_faaj029, #未折減額  
                                        faaj029 = 0,           #第一個月未折減額
                                        faaj104 = faaj104 - l_faam104, #本位幣二累折
                                        faaj111 = faaj111 - l_faam104, #本位幣二本年累折
                                        faaj107 = faaj107 - l_faam104, #本位幣二年折舊額
                                        faaj108 = faaj108 + l_faam104 + l_faaj109, #本位幣二未折減額
                                        faaj109 = 0,                   #本位幣二第一個月未折減額  
                                        faaj154 = faaj154 - l_faam154, #本位幣三累折
                                        faaj161 = faaj161 - l_faam154, #本位幣三本年累折
                                        faaj157 = faaj157 - l_faam154, #本位幣三年折舊額   
                                        faaj158 = faaj158 + l_faam154 + l_faaj159, #本位幣三未折減額
                                        faaj159 = 0                    #本位幣三第一個月未折減額                     
                        WHERE faajent = g_enterprise
                          AND faajld  = g_glaald
                          AND faaj001 = g_faah_d[l_i].faah003
                          AND faaj002 = g_faah_d[l_i].faah004
                          AND faaj037 = g_faah_d[l_i].faah001 #20141212 add by chening
                      IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                          LET g_success = 'N'
                          #150731-00004#1 20150807 str---
                          #CALL cl_errmsg('',g_faah_d[l_i].faah003||g_faah_d[l_i].faah004,'','afa-00043',1)
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = 'afa-00043'
                          LET g_errparam.extend = g_faah_d[l_i].faah003||g_faah_d[l_i].faah004
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                          #150731-00004#1 20150807 end---
                         #RETURN FALSE
                      END IF       
                   ELSE
                      #更新帳套折舊明細檔faaj
                      UPDATE faaj_t SET faaj009 = l_yy2,  #折舊年度
                                        faaj010 = l_mm2,  #折舊期別
                                        faaj005 = l_faaj005, #未使用年限
                                        faaj017 = faaj017 - l_faam013, #累折
                                        faaj038 = g_faam[l_i].faam026,  #albireo 160530   #160530-00036#1
                                        ###################mod by huangtao
                                        #faaj018 = faaj018 - l_faam013, #本期累折
                                        faaj018 =(CASE WHEN g_mm=1 THEN l_faam016 ELSE faaj018 - l_faam013 END ),
                                        ###################mod by huangtao
                                        #faaj022 = faaj022 - l_faam013, #年折舊額    #mark by huangtao
                                        faaj028 = faaj028 + l_faam013, #未折減額  
                                        faaj104 = faaj104 - l_faam104, #本位幣二累折
                                        faaj111 = faaj111 - l_faam104, #本位幣二本年累折
                                        faaj107 = faaj107 - l_faam104, #本位幣二年折舊額
                                        faaj108 = faaj108 + l_faam104, #本位幣二未折減額
                                        faaj154 = faaj154 - l_faam154, #本位幣三累折
                                        faaj161 = faaj161 - l_faam154, #本位幣三本年累折
                                        faaj157 = faaj157 - l_faam154, #本位幣三年折舊額   
                                        faaj158 = faaj158 + l_faam154  #本位幣三未折減額                   
                        WHERE faajent = g_enterprise
                          AND faajld  = g_glaald
                          AND faaj001 = g_faah_d[l_i].faah003
                          AND faaj002 = g_faah_d[l_i].faah004
                          AND faaj037 = g_faah_d[l_i].faah001 #20141212 add by chening
                      IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
                          LET g_success = 'N'
                          #150731-00004#1 20150807 str---
                          #CALL cl_errmsg('',g_faah_d[l_i].faah003||g_faah_d[l_i].faah004,'','afa-00043',1)
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = 'afa-00043'
                          LET g_errparam.extend = g_faah_d[l_i].faah003||g_faah_d[l_i].faah004
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                          #150731-00004#1 20150807 end---
                         #RETURN FALSE
                      END IF
                   END IF
              END IF
           END IF
        END IF

#161104-00048#3 mod s---
#--170426-00053#1 remark start--
          #需更新faah的資產狀態為'2折舊中'
          UPDATE faah_t SET faah015 = g_faam[l_i].faam026
           WHERE faahent = g_enterprise
             AND faah003 = g_faah_d[l_i].faah003
             AND faah004 = g_faah_d[l_i].faah004
             AND faah001 = g_faah_d[l_i].faah001 #20141212 add by chening
#--170426-00053#1 remark end--
          UPDATE faaj_t SET faaj038 = g_faam[l_i].faam026
           WHERE faajent = g_enterprise
             AND faaj001 = g_faah_d[l_i].faah003
             AND faaj002 = g_faah_d[l_i].faah004
             AND faaj037 = g_faah_d[l_i].faah001 
#161104-00048#3 mod e--- 
         IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
            LET g_success = 'N'            
            #150731-00004#1 20150807 str---
            #CALL cl_errmsg('',g_faah_d[l_i].faah003||g_faah_d[l_i].faah004,'','afa-00043',1)
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'afa-00043'
            LET g_errparam.extend = g_faah_d[l_i].faah003||g_faah_d[l_i].faah004
            LET g_errparam.popup = TRUE
            CALL cl_err()
            #150731-00004#1 20150807 end---
           #RETURN FALSE
         END IF 
         
         #刪除本期折舊明細資料faam_t
         DELETE FROM faam_t WHERE faament = g_enterprise AND faamld = g_glaald
                              AND faamsite = g_faamsite
                              AND faam001 = g_faah_d[l_i].faah003 
                              AND faam002 = g_faah_d[l_i].faah004
                              AND faam000 = g_faah_d[l_i].faah001 #20141212 add by chening
                              AND faam004 = g_yy
                              AND faam005 = g_mm
         IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
            LET g_success = 'N'
            #150731-00004#1 20150807 str---
            #CALL cl_errmsg('',g_faah_d[l_i].faah003||g_faah_d[l_i].faah004,'','afa-00043',1)
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'afa-00043'
            LET g_errparam.extend = g_faah_d[l_i].faah003||g_faah_d[l_i].faah004
            LET g_errparam.popup = TRUE
            CALL cl_err()
            #150731-00004#1 20150807 end---
           #RETURN FALSE
         END IF              
      ELSE
         CONTINUE FOR
      END IF
   END FOR 
  #CALL cl_err_showmsg()        #150731-00004#1 20150807 mark
   CALL cl_err_collect_show()   #150731-00004#1 20150807 add
   IF g_success = 'Y' THEN
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
END FUNCTION

################################################################################
# Descriptions...: 描述说明
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
PRIVATE FUNCTION afap240_ui_dialog_1()
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num5
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   DEFINE l_sel_cnt  LIKE type_t.num5  
   DEFINE l_origin_str STRING
   DEFINE g_bookno     LIKE glaa_t.glaald
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_year       LIKE type_t.num5
   DEFINE l_month      LIKE type_t.num5
   DEFINE l_ooab002    LIKE ooab_t.ooab002
   DEFINE l_glaa013    LIKE glaa_t.glaa013
   #170619-00054#2--add--s--xul
   DEFINE l_first_day   LIKE type_t.dat
   DEFINE l_last_day    LIKE type_t.dat
   DEFINE l_days        LIKE type_t.num5 
   #170619-00054#2--add--e--xul   
   
   WHILE TRUE
      #add-point:ui_dialog段before dialog2

      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
         #20141210 add by chenying
         INPUT g_faamsite,g_glaald,g_yy,g_mm FROM  faamsite,glaald,yy,mm 
            BEFORE INPUT
#               CALL s_afat503_default(g_bookno) RETURNING l_success,g_faamsite,g_glaald,g_glaacomp
#               CALL afap240_faamsite_desc(g_faamsite) RETURNING  g_master.faamsite_desc
##               SELECT * INTO g_glaa_t.* FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaald  
#               CALL cl_get_para(g_enterprise,g_faamsite,'S-FIN-9018') RETURNING g_yy
#               CALL cl_get_para(g_enterprise,g_faamsite,'S-FIN-9019') RETURNING g_mm
# 
##               LET g_yy = YEAR(g_today)
##               LET g_mm = MONTH(g_today)
##               SELECT glaald INTO g_glaald FROM glaa_t
##                WHERE glaaent = g_enterprise AND glaacomp = g_site
##                  AND glaa014 ='Y' 
#               DISPLAY g_glaald TO glaald
#               DISPLAY g_faamsite TO faamsite
#               DISPLAY g_master.faamsite_desc TO faamsite_desc
#               DISPLAY g_yy,g_mm TO yy,mm            
#               CALL afap240_glaald_desc()
                
         BEFORE FIELD faamsite
            LET g_faamsite_t = g_faamsite
            
         AFTER FIELD faamsite
            IF NOT cl_null(g_faamsite) THEN
               
               #检查组织资料的合理性             
               IF NOT s_afat502_site_chk(g_faamsite) THEN
                  LET g_faamsite = g_faamsite_t
                  CALL afap240_faamsite_desc(g_faamsite) RETURNING  g_master.faamsite_desc
                  DISPLAY g_master.faamsite_desc TO faamsite_desc
                  NEXT FIELD CURRENT
               END IF  
               
               #user需要檢查和資產中心的權限
               IF NOT s_afat502_site_user_chk(g_faamsite,g_user) THEN
                  LET g_faamsite = g_faamsite_t
                  CALL afap240_faamsite_desc(g_faamsite) RETURNING g_master.faamsite_desc
                  DISPLAY g_master.faamsite_desc TO faamsite_desc
                  NEXT FIELD CURRENT  
               END IF
                   
               
               #帐套不为空检查法人归属是否相同
               IF NOT cl_null(g_glaald) THEN
                  IF NOT s_afat502_site_ld_chk(g_faamsite,g_glaald) THEN
                     LET g_faamsite = g_faamsite_t
                     CALL afap240_faamsite_desc(g_faamsite) RETURNING g_master.faamsite_desc
                     DISPLAY g_master.faamsite_desc TO faamsite_desc
                     NEXT FIELD CURRENT  
                  END IF
               END IF
               
               IF NOT cl_null(g_glaald) THEN
                  #SELECT * INTO g_master.glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaald   #170308-00014#1 mark
                  SELECT glaacomp INTO g_master.glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaald  #170308-00014#1 add
                   CALL afap240_glaald_desc()  
               END IF                   
         END IF       
         
         BEFORE FIELD glaald
            LET g_glaald_t = g_glaald
          
         AFTER FIELD glaald
        
            IF NOT cl_null(g_glaald) THEN
                
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1=g_glaald
               #160318-00025#7--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "agl-00051:sub-01302|agli010|",cl_get_progname("agli010",g_lang,"2"),"|:EXEPROGagli010"
               #160318-00025#7--add--end 
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_glaald") THEN
               
               ELSE
                  LET g_glaald = g_glaald_t
                  CALL afap240_glaald_desc()                
               END IF               
            
               IF NOT s_ld_chk_authorization(g_user,g_glaald) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00165'
                  LET g_errparam.extend = g_glaald
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET g_glaald = g_glaald_t
                  CALL afap240_glaald_desc() 
                  NEXT FIELD CURRENT
               END IF
               
               #资产中心不为空时
               IF NOT cl_null(g_faamsite) THEN
                  IF NOT s_afat502_site_ld_chk(g_faamsite,g_glaald) THEN
                     LET g_glaald = g_glaald_t
                     CALL afap240_glaald_desc()
                     NEXT FIELD CURRENT
                  END IF
               END IF
               
               #SELECT * INTO g_master.glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaald  #170308-00014#1 mark
               SELECT glaacomp INTO g_master.glaacomp FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaald #170308-00014#1 add
               CALL afap240_glaald_desc()      
                                 
            END IF                  
                
         ON ACTION controlp INFIELD faamsite
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_faamsite             #給予default值
            LET g_qryparam.where = " ooef207 = 'Y' "
            #給予arg
            LET g_qryparam.arg1 = "" #
            #160125-00005#7--add--str--
            IF NOT cl_null(g_wc_cs_orga) THEN
			      LET g_qryparam.where = g_wc_cs_orga
			   END IF
			   #160125-00005#7--add--end
            
            #CALL q_ooef001()                                #呼叫開窗#161024-00008#1
            CALL q_ooef001_47()                                       #161024-00008#1

            LET g_faamsite = g_qryparam.return1              

            DISPLAY g_faamsite TO faamsite              #
            CALL afap240_faamsite_desc(g_faamsite) RETURNING g_master.faamsite_desc
            DISPLAY g_master.faamsite_desc TO faamsite_desc
            NEXT FIELD faamsite                          #返回原欄位
          
          ON ACTION controlp INFIELD glaald
	  	     #此段落由子樣板a07產生
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_glaald             #給予default值

            CALL s_fin_create_account_center_tmp()   
            #取得资产組織下所屬成員
            CALL s_fin_account_center_sons_query('5',g_faamsite,g_today,'1')
            #取得资产中心下所屬成員之帳別   
            CALL s_fin_account_center_comp_str() RETURNING l_origin_str
            #將取回的字串轉換為SQL條件
            CALL afap240_change_to_sql(l_origin_str) RETURNING l_origin_str  
            LET l_origin_str=l_origin_str.substring(2,l_origin_str.getLength()-1) #160125-00005#7 add             
            #LET g_qryparam.where = " (glaa008 = 'Y' OR glaa014 = 'Y') AND glaacomp IN (",l_origin_str," )" #160125-00005#7 mark
            LET g_qryparam.where = "  (glaa008 = 'Y' OR glaa014 = 'Y') " #160125-00005#7 add
            #給予arg
            LET g_qryparam.arg1 = g_user #
            LET g_qryparam.arg2 = g_dept #
            #160125-00005#7--add--str--
            #账套范围
            CALL s_axrt300_get_site(g_user,l_origin_str,'2')  RETURNING g_wc_cs_ld
            IF NOT cl_null(g_wc_cs_ld) THEN   
               LET g_qryparam.where = g_qryparam.where," AND ",g_wc_cs_ld
            END IF
            #160125-00005#7--add--end              
            
            CALL q_authorised_ld()                                #呼叫開窗

            LET g_glaald = g_qryparam.return1              

            DISPLAY g_glaald TO glaald              #
             
#            SELECT * INTO g_glaa_t.* FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaald  
            CALL afap240_glaald_desc()

            NEXT FIELD glaald                          #返回原欄位
            
         AFTER INPUT
            IF NOT cl_null(g_yy) AND NOT cl_null(g_mm)  THEN
               CALL cl_get_para(g_enterprise,g_master.glaacomp,'S-FIN-9003') RETURNING l_ooab002
               IF NOT cl_null(l_ooab002) THEN
                  LET l_year = YEAR(l_ooab002)
                  LET l_month = MONTH(l_ooab002)   
                  IF (g_yy <l_year) OR (g_yy =l_year AND g_mm <=l_month) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "afa-00375"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD yy
                  END IF
               END IF
               
               SELECT glaa013 INTO l_glaa013 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = g_glaald
               IF NOT cl_null(l_glaa013) THEN
                  LET l_year = YEAR(l_glaa013)
                  LET l_month = MONTH(l_glaa013) 
                  IF (g_yy <l_year) OR (g_yy =l_year AND g_mm <=l_month) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "afa-00376"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD yy
                  END IF
               END IF           
          
            END IF
         
         END INPUT  
         
         CONSTRUCT BY NAME g_wc2 ON faah001,faah003,faah004,faah006,faah007,faah005,faah008,faah042 #20141212 add faah001 by chenying
                        
            #170619-00054#2--add--s--xul
            BEFORE CONSTRUCT
            #起始日期
            LET l_first_day = MDY(g_mm,1,g_yy)
            CALL s_date_get_max_day(g_yy,g_mm) RETURNING l_days
            #截止日期
            LET l_last_day = MDY(g_mm,l_days,g_yy)
            #170619-00054#2--add--e--xul
            
            #20141212 add by chening       
            ON ACTION controlp INFIELD faah001  #主帳套開窗
	           INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
		         LET g_qryparam.reqry = FALSE
		         #161111-00049#14--ADD--S--
		         LET g_qryparam.where = " faah032 IN (SELECT glaacomp FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald = '",g_glaald,"' ) " 			  
		         #161111-00049#14--ADD--E--
		         #170619-00054#1--add--s--xul
		         #不存在afat509
		         LET g_qryparam.where = g_qryparam.where," AND NOT EXISTS( SELECT 1 FROM fabg_t,fabh_t ",
                                                       "                  WHERE fabgent = fabhent AND fabgdocno = fabhdocno ",
                                                       "                    AND fabgld  = fabhld  AND fabg005 = '0'",
                                                       "                    AND fabgdocdt BETWEEN '",l_first_day,"' ",
                                                       "                    AND '",l_last_day,"'  AND fabgstus <> 'X' ",
                                                       "                    AND fabh001 = faah003 AND fabh002 = faah004 AND fabh000 =faah001)"
		         #170619-00054#1--add--e--xul
               CALL q_faah001()                #呼叫開窗
               DISPLAY g_qryparam.return1 TO faah001 #顯示到畫面上
            
               NEXT FIELD faah001                    #返回原欄位 
            #20141212 add by chening
       
            ON ACTION controlp INFIELD faah003
			      INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
			      LET g_qryparam.reqry = FALSE
			      #161111-00049#14--ADD--S--
		         LET g_qryparam.where = " faah032 IN (SELECT glaacomp FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald = '",g_glaald,"' ) " 			  
		         #161111-00049#14--ADD--E--
		         #170619-00054#1--add--s--xul
		         #不存在afat509
		         LET g_qryparam.where = g_qryparam.where," AND NOT EXISTS( SELECT 1 FROM fabg_t,fabh_t ",
                                                       "                  WHERE fabgent = fabhent AND fabgdocno = fabhdocno ",
                                                       "                    AND fabgld  = fabhld  AND fabg005 = '0'",
                                                       "                    AND fabgdocdt BETWEEN '",l_first_day,"' ",
                                                       "                    AND '",l_last_day,"'  AND fabgstus <> 'X' ",
                                                       "                    AND fabh001 = faah003 AND fabh002 = faah004 AND fabh000 =faah001)"
		         #170619-00054#1--add--e--xul
               CALL q_faah003_8()                       
               DISPLAY g_qryparam.return1 TO faah003  
            
               NEXT FIELD faah003                     #返回原欄位
            
            ON ACTION controlp INFIELD faah004
			      INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
			      LET g_qryparam.reqry = FALSE
			      #161111-00049#14--ADD--S--
		         LET g_qryparam.where = " faah032 IN (SELECT glaacomp FROM glaa_t WHERE glaaent = ",g_enterprise," AND glaald = '",g_glaald,"' ) " 			  
		         #161111-00049#14--ADD--E--
		         #170619-00054#1--add--s--xul
		         #不存在afat509
		         LET g_qryparam.where = g_qryparam.where," AND NOT EXISTS( SELECT 1 FROM fabg_t,fabh_t ",
                                                       "                  WHERE fabgent = fabhent AND fabgdocno = fabhdocno ",
                                                       "                    AND fabgld  = fabhld  AND fabg005 = '0'",
                                                       "                    AND fabgdocdt BETWEEN '",l_first_day,"' ",
                                                       "                    AND '",l_last_day,"'  AND fabgstus <> 'X' ",
                                                       "                    AND fabh001 = faah003 AND fabh002 = faah004 AND fabh000 =faah001)"
		         #170619-00054#1--add--e--xul
               CALL q_faah004_2()                       
               DISPLAY g_qryparam.return1 TO faah004  
            
               NEXT FIELD faah004                     #返回原欄位
            
            ON ACTION controlp INFIELD faah006
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               #161111-00049#14--ADD--S--		   
               LET g_qryparam.where = " faalld = '",g_glaald,"'" 
               CALL q_faal001_1() 
               #161111-00049#14--ADD--E--
               #CALL q_faac001()           #161111-00049#14--MARK--                     #呼叫開窗
               DISPLAY g_qryparam.return1 TO faah006  #顯示到畫面上
            
               NEXT FIELD faah006                     #返回原欄位
            
            ON ACTION controlp INFIELD faah007
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               #161111-00049#14--ADD--S--		   
               LET g_qryparam.where = " faad002 IN (SELECT faal001 FROM faal_t WHERE faalent = ",g_enterprise," AND faalld = '",g_glaald,"')"
               #161111-00049#14--ADD--E--
               CALL q_faad001()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO faah007  #顯示到畫面上
               NEXT FIELD faah007                     #返回原欄位
            
            ON ACTION controlp INFIELD faah008
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = '3903'
               CALL q_oocq002()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO faah008  #顯示到畫面上
               NEXT FIELD faah008                     #返回原欄位
         END CONSTRUCT          
         #20141210 add by chenying
         INPUT ARRAY g_faah_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = FALSE,
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)
             BEFORE INPUT
#                CALL afap240_b_fill(g_wc2)  #chenying mark
                LET g_rec_b = g_faah_d.getLength()
                CALL cl_set_comp_entry("faah003,faah004",FALSE)
                CALL cl_set_comp_entry("faah003,faah004,faah005,faah006,faah007,faah008,faah042",FALSE)

            BEFORE ROW
               LET l_ac = ARR_CURR()  
        
         
#         #全選
#         ON ACTION sel_all
#            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
#            FOR li_idx = 1 TO g_faah_d.getLength()
#               LET g_faah_d[li_idx].sel = "Y"
#            END FOR
#
#         #取消全選
#         ON ACTION sel_none
#            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
#            FOR li_idx = 1 TO g_faah_d.getLength()
#               LET g_faah_d[li_idx].sel = "N"
#            END FOR
            
#         ON ACTION regain
#            LET l_sel_cnt = 0
#            FOR li_idx = 1 TO g_faah_d.getLength()
#               IF g_faah_d[li_idx].sel = "Y" THEN
#                  LET l_sel_cnt = l_sel_cnt + 1
#               END IF
#            END FOR
#            IF l_sel_cnt = 0 THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 'afa-00063'
#               LET g_errparam.extend = ''
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#
#               CONTINUE DIALOG
#            END IF
#            CALL afap240_regain_data()
#            EXIT DIALOG

         END INPUT
         
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL cl_qbe_display_condition(FGL_GETENV("QUERYPLANID"), g_user)
            CALL afap240_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog
#            CALL afap240_construct()  #chenying mark
#            NEXT FIELD sel            #chenying mark 
            #171227-00042#1 add--s 
            CLEAR FORM
            CALL g_faah_d.clear()
            INITIALIZE g_wc2 TO NULL
            #171227-00042#1 add--e 
            #end add-point
            
           CALL s_afat503_default(g_bookno) RETURNING l_success,g_faamsite,g_glaald,g_glaacomp
           CALL afap240_faamsite_desc(g_faamsite) RETURNING  g_master.faamsite_desc

           CALL cl_get_para(g_enterprise,g_faamsite,'S-FIN-9018') RETURNING g_yy
           CALL cl_get_para(g_enterprise,g_faamsite,'S-FIN-9019') RETURNING g_mm

           DISPLAY g_glaald TO glaald
           DISPLAY g_faamsite TO faamsite
           DISPLAY g_master.faamsite_desc TO faamsite_desc
           DISPLAY g_yy,g_mm TO yy,mm            
           CALL afap240_glaald_desc()
 
         #chenying add
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            FOR li_idx = 1 TO g_faah_d.getLength()
               LET g_faah_d[li_idx].sel = "Y"
               #add-point:ui_dialog段on action selall
 
               #end add-point
            END FOR
            #add-point:ui_dialog段on action selall

            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_faah_d.getLength()
               LET g_faah_d[li_idx].sel = "N"
               #add-point:ui_dialog段on action selnone

               #end add-point
            END FOR
            #add-point:ui_dialog段on action selnone

            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_faah_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_faah_d[li_idx].sel = "Y"
               END IF
            END FOR
            #add-point:ui_dialog段on action sel
 
            #end add-point
         
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_faah_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_faah_d[li_idx].sel = "N"
               END IF
            END FOR
            #add-point:ui_dialog段on action unsel

            #end add-point
            
         #chenying add
         ON ACTION qbe_select
            LET ls_wc = ""
            #需要用ITM類程式查詢方案在CONSTRUCT的功能，將值set到畫面上
            CALL cl_qbe_list("c") RETURNING ls_wc
            CALL afap240_get_buffer(l_dialog)
            IF NOT cl_null(ls_wc) THEN
               LET lc_param.wc = ls_wc
               #取得條件後需要執行項目,應新增於下方adp
               #add-point:ui_dialog段qbe_select後

               #end add-point
            END IF
 
         ON ACTION qbe_save
            CALL cl_qbe_save()
 
         ON ACTION batch_execute
            ACCEPT DIALOG
 
         ON ACTION qbeclear         
            CLEAR FORM
            INITIALIZE lc_param.* TO NULL
            #add-point:ui_dialog段qbeclear

            #end add-point
 
         ON ACTION history_fill
            CALL cl_schedule_history_fill()
 
         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DIALOG
         
         ON ACTION exit
            LET INT_FLAG = TRUE
            EXIT DIALOG
 
         #add-point:ui_dialog段action
         #chenying add
         ON ACTION accept
            CALL afap240_b_fill(g_wc2)
            NEXT FIELD sel
         #chenying   
         #end add-point
 
         #主選單用ACTION
         &include "main_menu.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
 
      #add-point:ui_dialog段exit dialog
               
      #end add-point
 
      LET ls_js = util.JSON.stringify(lc_param)
 
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         EXIT WHILE
      ELSE
         #LET g_jobid = cl_schedule_get_jobid(g_prog)
         IF g_chk_jobid THEN 
            LET g_jobid = g_schedule.gzpa001
         ELSE 
            LET g_jobid = cl_schedule_get_jobid(g_prog)
         END IF 
         CASE 
            WHEN g_schedule.gzpa003 = "0"
                 CALL afap240_process(ls_js)
            WHEN g_schedule.gzpa003 = "1"
            #    CALL cl_schedule_update_data(g_jobid,ls_js)
                 LET ls_js = afap240_transfer_argv(ls_js)
                 CALL cl_cmdrun(ls_js)
            WHEN g_schedule.gzpa003 = "2"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
            WHEN g_schedule.gzpa003 = "3"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
         END CASE  
         IF g_schedule.gzpa003 = "2" OR g_schedule.gzpa003 = "3" THEN 
            CALL cl_ask_confirm3("std-00014","") #設定完成
         END IF    
         LET g_schedule.gzpa003 = "0" #預設一開始 立即於前景執行
 
         #add-point:ui_dialog段after schedule
#chenying mark
#         IF NOT INT_FLAG THEN
#         IF g_success = 'N' THEN    #有返回False的標記就提示失敗，插入失敗
#             CALL s_transaction_end('N','0')
#             IF NOT cl_ask_confirm('afa-00058') THEN #產生失敗，是否繼續  
#                EXIT WHILE
#             ELSE
#                CALL g_faah_d.clear()
#               #CALL afap240_construct()
#               #CALL afap240_ui_dialog_1()
#                CALL afap240_b_fill(g_wc2)
#               #CONTINUE WHILE
#             END IF             
#          ELSE
#             CALL s_transaction_end('Y','0')
#             IF cl_ask_confirm('afa-00059') THEN #產生成功，是否繼續
#                CALL g_faah_d.clear()
#               #CALL afap240_construct()
#               #CALL afap240_ui_dialog_1()
#                CALL afap240_b_fill(g_wc2)
#               #CONTINUE WHILE
#             ELSE
#                EXIT WHILE
#             END IF 
#          END IF 
#       END IF 
#chenying mark
         #end add-point
 
         #欄位初始資訊 
         CALL cl_schedule_init_info("all",g_schedule.gzpa003) 
         LET gi_hiden_asign = FALSE 
         LET gi_hiden_exec = FALSE 
         LET gi_hiden_spec = FALSE 
         LET gi_hiden_exec_end = FALSE 
         CALL cl_schedule_hidden()
      END IF
   END WHILE
END FUNCTION

################################################################################
# Descriptions...:  
# Memo...........:
# Usage..........: CALL afap240_faamsite_desc(p_ooef001)
# Input parameter:  
# Modify.........:
################################################################################
PRIVATE FUNCTION afap240_faamsite_desc(p_ooef001)
   DEFINE p_ooef001         LIKE ooef_t.ooef001
   DEFINE r_desc           LIKE ooefl_t.ooefl003
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = p_ooef001
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET r_desc = '', g_rtn_fields[1] , ''
   RETURN r_desc
END FUNCTION

################################################################################
# Descriptions...:  
# Memo...........:
# Usage..........: CALL afap240_change_to_sql(p_wc)
# Input parameter:  
# Modify.........:
################################################################################
PRIVATE FUNCTION afap240_change_to_sql(p_wc)
   DEFINE p_wc       STRING
   DEFINE r_wc       STRING
   DEFINE tok        base.StringTokenizer
   DEFINE l_str      STRING

   LET tok = base.StringTokenizer.create(p_wc,",")
   WHILE tok.hasMoreTokens()
      IF cl_null(l_str) THEN
         LET l_str = tok.nextToken()
      ELSE
         LET l_str = l_str,"','",tok.nextToken()
      END IF
   END WHILE
   LET r_wc = "'",l_str,"'"

   RETURN r_wc
END FUNCTION

#end add-point
 
{</section>}
 
