#該程式未解開Section, 採用最新樣板產出!
{<section id="asfp310.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0020(2017-02-22 16:35:58), PR版次:0020(2017-10-23 11:34:03)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000299
#+ Filename...: asfp310
#+ Description: 整批發料作業
#+ Creator....: 00768(2014-04-02 10:29:52)
#+ Modifier...: 05426 -SD/PR- 07423
 
{</section>}
 
{<section id="asfp310.global" >}
#應用 p01 樣板自動產生(Version:20)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#150101 单位转换率改写
#150120 对数量做单位取位 采用无条件截位，防止超出库存可用量或发料量
#160411-00020#1  16/05/12  By Sarah         asfp310帶出的取替代料單身不需要對發料量給預設值,一律=0,應該這部分應該讓USER自己輸入
#161109-00085#39 2016/11/17 By lienjunqi    整批調整系統星號寫法
#170123-00011#1  2016/01/24 By 08992        補上SQL遺漏ent條件
#170220-00055#1  2017/02/21 By liuym        批量产生发料单之后，程序任然处于INPUT逻辑段中导致栏位管控必输，调整逻辑，执行产生发料单之后退出当前DIALOG即可重新再次查询操作
#170303-00042#1  2017/03/10 By ywtsai       將庫儲位QBE加入查詢庫存資料的限定庫儲位條件
#170302-00012#8  2017/03/14 By 08734        整批调整未产生数据时，提示消息修正。
#170618-00169#1  2017/07/04 By zhujing      开窗过滤掉倒扣料的单据。
#170703-00025#24 2017/07/26 By 09771        调整construct/input中的开窗调用，将q_ooag001/q_ooag001_4调整成q_ooag001_2
#                                               在对应的AFTER FIELD 人员编号的区块，调用v_ooag001_6进行检核
#170313-00003#1  2017/08/31 By zhujing      效能优化
#171012-00031#3  2017/10/13 By 09772        程式没有删除按钮但仍能删除单身资料。会导致删除相应主档的资料，产生异常。(使用ctrl+d),故使DELETE ROW = FALSE
#171018-00042#1  2017/10/18 By 05423        修正#170313-00003#1，去除pmdlud自定义字段的限定
#170926-00027#1  2017/10/23 By 07423        修正#170313-00003#1，取消限制只抓取委外工單的問題
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
       sfaadocno LIKE type_t.chr20, 
   sfaa010 LIKE type_t.chr500, 
   sfaa019 LIKE type_t.dat, 
   sfaa020 LIKE type_t.dat, 
   sfaa017 LIKE type_t.chr10, 
   sfaa002 LIKE type_t.chr20, 
   sfba003 LIKE type_t.chr10, 
   sfba003_desc LIKE type_t.chr80, 
   sfba004 LIKE type_t.chr10, 
   no_sets LIKE type_t.chr500, 
   priority1 LIKE type_t.chr500, 
   priority2 LIKE type_t.chr500, 
   priority3 LIKE type_t.chr500, 
   priority4 LIKE type_t.chr500, 
   can_sets LIKE type_t.chr500, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE tm            RECORD
                     #--工单范围QBE
                     wc1        STRING,  #工單範圍QBE
                     #--发料作业
                     sfba003    LIKE sfba_t.sfba003,  #作业编号
                     sfba003_desc LIKE type_t.chr80,  #作业说明
                     sfba004    LIKE sfba_t.sfba004,  #作业序
                     #--优先顺序
                     no_sets    LIKE type_t.chr1,     #优先满足已发料未齐套工单
                     priority1  LIKE type_t.chr1,     #优先顺序1
                     priority2  LIKE type_t.chr1,     #优先顺序2
                     priority3  LIKE type_t.chr1,     #优先顺序3
                     priority4  LIKE type_t.chr1,     #优先顺序4
                     can_sets   LIKE type_t.chr1,     #优可足套数者优先满足
                     # 以上部分根据架构的变更，改为g_master
                     #--仓库范围QBE
                     wc2        STRING,   #倉庫範圍QBE
                     wc3        STRING    #进阶-元件料号QBE
                     END RECORD
TYPE type_g_sfaa_d   RECORD
                     sel_1       LIKE type_t.chr1,      #选择
                     lock_1      LIKE type_t.chr1,      #锁定
                     seq_1       LIKE type_t.num5,      #顺序
                     sfaadocno_1 LIKE sfaa_t.sfaadocno, #工单单号
                     sfaa010_1   LIKE sfaa_t.sfaa010,   #生产料号
                     sfaa010_imaal003_1  LIKE imaal_t.imaal003,
                     sfaa010_imaal004_1  LIKE imaal_t.imaal004,
                     sfaa019_1   LIKE sfaa_t.sfaa019,   #预计开工日
                     sfaa020_1   LIKE sfaa_t.sfaa020,   #预计完工日
                     sfaa017_1   LIKE sfaa_t.sfaa017,   #部门厂商
                     sfaa017_desc_1      LIKE type_t.chr80,
                     sfaa002_1   LIKE sfaa_t.sfaa002,   #生管员
                     sfaa002_desc_1      LIKE type_t.chr80,
                     sfba003_1   LIKE sfba_t.sfba003,   #作业编号
                     sfba004_1   LIKE sfba_t.sfba004,   #作业序
                     sfaa012_1   LIKE sfaa_t.sfaa012,   #生产数量
                     sfaa049_1   LIKE sfaa_t.sfaa049,   #已发套数
                     has_sets_1  LIKE sfaa_t.sfaa049,   #已发齐套数
                     can_sets_1  LIKE sfaa_t.sfaa049    #可齐料套数
                     END RECORD
TYPE type_g_sfba_d   RECORD
                     seq_2       LIKE type_t.num5,      #项次
                     seq1_2      LIKE type_t.num5,      #项序
                     sfba002_2   LIKE sfba_t.sfba002,   #部位
                     sfba003_2   LIKE sfba_t.sfba003,   #作业
                     sfba004_2   LIKE sfba_t.sfba004,   #作业序
                     sfba006_2   LIKE sfba_t.sfba006,   #发料料号
                     sfba006_imaal003_2  LIKE imaal_t.imaal003,
                     sfba006_imaal004_2  LIKE imaal_t.imaal004,
                     sfba021_2   LIKE sfba_t.sfba021,   #产品特征
                     sfba021_2_desc   LIKE type_t.chr80,   #说明
                     imaf034_2           LIKE imaf_t.imaf034,   #保税料
                     imae092_2           LIKE imae_t.imae092,   #发料前调拨
                     sfba014_2   LIKE sfba_t.sfba014,   #单位
                     sfba013_2   LIKE sfba_t.sfba013,   #应发数量  
                     sfba016_2   LIKE sfba_t.sfba016,   #已发数量
                     no_issue_2  LIKE sfba_t.sfba016,   #未发数量
                     issue_qty_2 LIKE sfba_t.sfba016,   #发料量
                     inag008_2   LIKE sfba_t.sfba016,   #库存可用量
                     inan010_2   LIKE sfba_t.sfba016    #在捡量
                     END RECORD
TYPE type_g_inag_d   RECORD
                     inag004_3   LIKE inag_t.inag004,   #库位
                     inag005_3   LIKE inag_t.inag005,   #储位
                     inag006_3   LIKE inag_t.inag006,   #批号
                     inag003_3   LIKE inag_t.inag003,   #库存管理特征
                     inag007_3   LIKE inag_t.inag007,   #单位
                     inag008_3   LIKE inag_t.inag008,   #现有库存数量
                     inan010_3   LIKE inan_t.inan010,   #库存在捡量
                     has_qty_3   LIKE inag_t.inag008,   #其他工单分配量
                     issue_qty_3 LIKE inag_t.inag008    #发料量
                     END RECORD
TYPE type_g_bmea_d   RECORD
                     bmea007_4   LIKE bmea_t.bmea007,   #取替代特性
                     bmea008_4   LIKE bmea_t.bmea008,   #料件编号
                     bmea008_imaal003_4  LIKE imaal_t.imaal003,
                     bmea008_imaal004_4  LIKE imaal_t.imaal004,
                     bmea019_4   LIKE bmea_t.bmea019,   #產品特徵
                     bmea019_desc        LIKE imecl_t.imecl005, 
                     replace_rate_4 LIKE sfba_t.sfba022,   #替代率
                     bmea016_4   LIKE bmea_t.bmea016,   #替代方式
                     bmea017_4   LIKE bmea_t.bmea017,   #替代上限比率
                     inag004_4   LIKE inag_t.inag004,   #库位
                     inag005_4   LIKE inag_t.inag005,   #储位
                     inag006_4   LIKE inag_t.inag006,   #批号
                     inag003_4   LIKE inag_t.inag003,   #库存管理特征 
                     inag007_4   LIKE inag_t.inag007,   #单位
                     inag008_4   LIKE inag_t.inag008,   #现有库存数量 
                     inan010_4   LIKE inan_t.inan010,   #库存在捡量
                     has_qty_4   LIKE inag_t.inag008,   #其他工单分配量    
                     issue_qty_4 LIKE inag_t.inag008    #发料量
                     END RECORD
DEFINE g_sfaa_d      DYNAMIC ARRAY OF type_g_sfaa_d
DEFINE g_sfaa_d_t    type_g_sfaa_d
DEFINE g_sfba_d      DYNAMIC ARRAY OF type_g_sfba_d
DEFINE g_sfba_d_t    type_g_sfba_d
DEFINE g_inag_d      DYNAMIC ARRAY OF type_g_inag_d
DEFINE g_inag_d_t    type_g_inag_d
DEFINE g_bmea_d      DYNAMIC ARRAY OF type_g_bmea_d
DEFINE g_bmea_d_t    type_g_bmea_d

DEFINE l_ac_sfaa     LIKE type_t.num5
DEFINE l_ac_sfba     LIKE type_t.num5
DEFINE l_ac_inag     LIKE type_t.num5
DEFINE l_ac_bmea     LIKE type_t.num5
DEFINE g_ac_inag     LIKE type_t.num5  #走不到 ON CHANGE ROW 做的特殊控制
DEFINE g_ac_bmea     LIKE type_t.num5  #走不到 ON CHANGE ROW 做的特殊控制
DEFINE g_rec_b_sfaa  LIKE type_t.num5
DEFINE g_rec_b_sfba  LIKE type_t.num5
DEFINE g_rec_b_inag  LIKE type_t.num5
DEFINE g_rec_b_bmea  LIKE type_t.num5

DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列

DEFINE la_param  RECORD
         prog   STRING,
         param  DYNAMIC ARRAY OF STRING
                END RECORD
DEFINE ls_js  STRING

DEFINE g_today_dt     LIKE ooff_t.ooff007
DEFINE g_inag008_2    LIKE inan_t.inan010  #库存可用量
DEFINE g_inan010_2    LIKE inan_t.inan010  #在捡量
DEFINE g_issue_qty_2  LIKE inan_t.inan010  #asfp310_sfba表中发料量
DEFINE g_no_issue_2   LIKE inan_t.inan010  #asfp310_sfba表中未发数量=应发-已发-代买 用于分配

DEFINE  l_allow_insert  LIKE type_t.num5                #可新增否
DEFINE  l_allow_delete  LIKE type_t.num5                #可刪除否

DEFINE g_can_sets     LIKE type_t.chr1     #需足套否（g_master.can_sets：可足套数者优先满足）
DEFINE g_need_issue   LIKE type_t.chr1     #需分配数量否

DEFINE g_un_qty        LIKE inan_t.inan010  #未分配的库存量
DEFINE g_ooba002       LIKE ooba_t.ooba002  #单别
DEFINE g_para          LIKE type_t.chr80  #工單指定發料庫儲，發料時允許修改

DEFINE g_qty_t         LIKE inag_t.inag008   #150101 add
DEFINE g_qty_t2        LIKE inag_t.inag008   #150101 add
DEFINE g_ooca002     LIKE ooca_t.ooca002  #小數位數  #add 150119
DEFINE g_ooca004     LIKE ooca_t.ooca004  #捨入類型  #add 150119
DEFINE g_flag        LIKE type_t.num5  #170302-00012#8   2017/03/14  By 08734 add
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="asfp310.main" >}
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
   CALL cl_ap_init("asf","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL asfp310_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asfp310 WITH FORM cl_ap_formpath("asf",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL asfp310_init()
 
      #進入選單 Menu (="N")
      CALL asfp310_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      CALL asfp310_drop_table()
      CALL s_asft340_drop_table()   #170313-00003#1 add
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_asfp310
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="asfp310.init" >}
#+ 初始化作業
PRIVATE FUNCTION asfp310_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE lwin_curr      ui.Window
   DEFINE lfrm_curr      ui.Form
   DEFINE ls_path        STRING
   
   DEFINE l_success      LIKE type_t.num5
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
   #LET lwin_curr = ui.Window.getCurrent()
   #LET lfrm_curr = lwin_curr.getForm()
   #LET ls_path = os.Path.join(os.Path.join(FGL_GETENV("ERP"),"cfg"),"4tb")
   #LET ls_path = os.Path.join(ls_path,"toolbar_q.4tb")
   #CALL lfrm_curr.loadToolBar(ls_path)

   CALL cl_set_act_visible_toolbaritem("batch_execute",FALSE)

   CALL cl_set_combo_scc('priority1','4023')
   CALL cl_set_combo_scc('priority2','4023')
   CALL cl_set_combo_scc('priority3','4023')
   CALL cl_set_combo_scc('priority4','4023')
   CALL cl_set_combo_scc('bmea007_4','4011')  #取替代建議
   
   LET g_today_dt = cl_get_current()
   LET g_today    = cl_get_today()
   
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   #创建临时表，创建失败离开作业
   CALL asfp310_crt_table() RETURNING l_success
   IF NOT l_success THEN
      CLOSE WINDOW w_asfp310
      CALL cl_ap_exitprogram("0")
   END IF
   CALL s_asft340_create_table() #170313-00003#1 add
   IF cl_null(g_master.no_sets) THEN LET g_master.no_sets='Y' END IF
   IF cl_null(g_master.priority1) THEN LET g_master.priority1='1' END IF
   IF cl_null(g_master.priority2) THEN LET g_master.priority2='2' END IF
   IF cl_null(g_master.priority3) THEN LET g_master.priority3='3' END IF
   IF cl_null(g_master.priority4) THEN LET g_master.priority4='4' END IF
   IF cl_null(g_master.can_sets) THEN LET g_master.can_sets='Y' END IF
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asfp310.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION asfp310_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_success_tot  LIKE type_t.num5
   DEFINE l_count    LIKE type_t.num5
   DEFINE l_cmd      LIKE type_t.chr1
DEFINE l_has_sets_1  LIKE sfaa_t.sfaa049  #已发齐套数
DEFINE l_can_sets_1  LIKE sfaa_t.sfaa049  #可齐料套数
DEFINE l_sfaa011   LIKE sfaa_t.sfaa011
DEFINE l_is_full   LIKE type_t.chr1
DEFINE l_is_gen    LIKE type_t.chr1
#DEFINE l_can_qty        LIKE inan_t.inan010  #可发量
#DEFINE l_issue_qty_2    LIKE inan_t.inan010  #单身汇总的备料发料量
#DEFINE l_qty            LIKE inan_t.inan010
#DEFINE l_i              LIKE type_t.num5
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   LET g_ac_inag = 0
   LET g_ac_bmea = 0
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.sfba003,g_master.sfba004,g_master.no_sets,g_master.priority1,g_master.priority2, 
             g_master.priority3,g_master.priority4,g_master.can_sets 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               CALL asfp310_set_entry()
               CALL asfp310_set_no_entry()
               #end add-point
         
                     #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba003
            
            #add-point:AFTER FIELD sfba003 name="input.a.sfba003"
            IF NOT cl_null(g_master.sfba003) THEN
               IF NOT s_azzi650_chk_exist('221',g_master.sfba003) THEN
                  NEXT FIELD CURRENT
               ELSE
                  #作业说明
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = '221'
                  LET g_chkparam.arg2 = g_master.sfba003
                  CALL cl_ref_val("v_oocql002")
                  LET g_master.sfba003_desc = g_chkparam.return1
                  DISPLAY BY NAME g_master.sfba003_desc
               END IF
            END IF
            CALL asfp310_set_no_entry()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba003
            #add-point:BEFORE FIELD sfba003 name="input.b.sfba003"
            CALL asfp310_set_entry()
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfba003
            #add-point:ON CHANGE sfba003 name="input.g.sfba003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba004
            #add-point:BEFORE FIELD sfba004 name="input.b.sfba004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba004
            
            #add-point:AFTER FIELD sfba004 name="input.a.sfba004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfba004
            #add-point:ON CHANGE sfba004 name="input.g.sfba004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD no_sets
            #add-point:BEFORE FIELD no_sets name="input.b.no_sets"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD no_sets
            
            #add-point:AFTER FIELD no_sets name="input.a.no_sets"
            IF g_master.no_sets NOT MATCHES '[NY]' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'agl-00144'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE no_sets
            #add-point:ON CHANGE no_sets name="input.g.no_sets"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD priority1
            #add-point:BEFORE FIELD priority1 name="input.b.priority1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD priority1
            
            #add-point:AFTER FIELD priority1 name="input.a.priority1"
            IF g_master.priority1 NOT MATCHES '[1234]' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00209'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE priority1
            #add-point:ON CHANGE priority1 name="input.g.priority1"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD priority2
            #add-point:BEFORE FIELD priority2 name="input.b.priority2"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD priority2
            
            #add-point:AFTER FIELD priority2 name="input.a.priority2"
            IF g_master.priority2 NOT MATCHES '[1234]' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00209'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE priority2
            #add-point:ON CHANGE priority2 name="input.g.priority2"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD priority3
            #add-point:BEFORE FIELD priority3 name="input.b.priority3"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD priority3
            
            #add-point:AFTER FIELD priority3 name="input.a.priority3"
            IF g_master.priority3 NOT MATCHES '[1234]' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00209'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE priority3
            #add-point:ON CHANGE priority3 name="input.g.priority3"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD priority4
            #add-point:BEFORE FIELD priority4 name="input.b.priority4"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD priority4
            
            #add-point:AFTER FIELD priority4 name="input.a.priority4"
            IF g_master.priority4 NOT MATCHES '[1234]' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00209'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE priority4
            #add-point:ON CHANGE priority4 name="input.g.priority4"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD can_sets
            #add-point:BEFORE FIELD can_sets name="input.b.can_sets"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD can_sets
            
            #add-point:AFTER FIELD can_sets name="input.a.can_sets"
            IF g_master.can_sets NOT MATCHES '[NY]' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'agl-00144'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD CURRENT
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE can_sets
            #add-point:ON CHANGE can_sets name="input.g.can_sets"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.sfba003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba003
            #add-point:ON ACTION controlp INFIELD sfba003 name="input.c.sfba003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_master.sfba003
            LET g_qryparam.arg1 = "221"
            CALL q_oocq002()                                #呼叫開窗
            LET g_master.sfba003 = g_qryparam.return1     #將開窗取得的值>
            DISPLAY g_master.sfba003 TO sfba003              #
            NEXT FIELD sfba003                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.sfba004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba004
            #add-point:ON ACTION controlp INFIELD sfba004 name="input.c.sfba004"
            
            #END add-point
 
 
         #Ctrlp:input.c.no_sets
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD no_sets
            #add-point:ON ACTION controlp INFIELD no_sets name="input.c.no_sets"
            
            #END add-point
 
 
         #Ctrlp:input.c.priority1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD priority1
            #add-point:ON ACTION controlp INFIELD priority1 name="input.c.priority1"
            
            #END add-point
 
 
         #Ctrlp:input.c.priority2
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD priority2
            #add-point:ON ACTION controlp INFIELD priority2 name="input.c.priority2"
            
            #END add-point
 
 
         #Ctrlp:input.c.priority3
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD priority3
            #add-point:ON ACTION controlp INFIELD priority3 name="input.c.priority3"
            
            #END add-point
 
 
         #Ctrlp:input.c.priority4
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD priority4
            #add-point:ON ACTION controlp INFIELD priority4 name="input.c.priority4"
            
            #END add-point
 
 
         #Ctrlp:input.c.can_sets
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD can_sets
            #add-point:ON ACTION controlp INFIELD can_sets name="input.c.can_sets"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               IF INT_FLAG THEN
                  EXIT DIALOG
               END IF
         
               CALL cl_showmsg()      #錯誤訊息統整顯示
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            ON ACTION accept
               #ACCEPT DIALOG
               CALL asfp310_ins_table()
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON sfaadocno,sfaa010,sfaa019,sfaa020,sfaa017,sfaa002
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.sfaadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfaadocno
            #add-point:ON ACTION controlp INFIELD sfaadocno name="construct.c.sfaadocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = " sfaasite ='",g_site,"' AND sfaastus='F'"
                                   ," AND sfaa004 <> '2' "  #170618-00169#1 add 
            CALL q_sfaadocno_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfaadocno  #顯示到畫面上
            NEXT FIELD sfaadocno                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfaadocno
            #add-point:BEFORE FIELD sfaadocno name="construct.b.sfaadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfaadocno
            
            #add-point:AFTER FIELD sfaadocno name="construct.a.sfaadocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfaa010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfaa010
            #add-point:ON ACTION controlp INFIELD sfaa010 name="construct.c.sfaa010"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001_10()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfaa010  #顯示到畫面上
            NEXT FIELD sfaa010                     #返回原欄位

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfaa010
            #add-point:BEFORE FIELD sfaa010 name="construct.b.sfaa010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfaa010
            
            #add-point:AFTER FIELD sfaa010 name="construct.a.sfaa010"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfaa019
            #add-point:BEFORE FIELD sfaa019 name="construct.b.sfaa019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfaa019
            
            #add-point:AFTER FIELD sfaa019 name="construct.a.sfaa019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfaa019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfaa019
            #add-point:ON ACTION controlp INFIELD sfaa019 name="construct.c.sfaa019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfaa020
            #add-point:BEFORE FIELD sfaa020 name="construct.b.sfaa020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfaa020
            
            #add-point:AFTER FIELD sfaa020 name="construct.a.sfaa020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfaa020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfaa020
            #add-point:ON ACTION controlp INFIELD sfaa020 name="construct.c.sfaa020"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfaa017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfaa017
            #add-point:ON ACTION controlp INFIELD sfaa017 name="construct.c.sfaa017"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_ooeg001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfaa017  #顯示到畫面上
            NEXT FIELD sfaa017                     #返回原欄位

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfaa017
            #add-point:BEFORE FIELD sfaa017 name="construct.b.sfaa017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfaa017
            
            #add-point:AFTER FIELD sfaa017 name="construct.a.sfaa017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfaa002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfaa002
            #add-point:ON ACTION controlp INFIELD sfaa002 name="construct.c.sfaa002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
        #   CALL q_ooag001()                           #呼叫開窗           #170703-00025#24  2017/07/26 By 09771  mark   
            CALL q_ooag001_2()                         #呼叫開窗            #170703-00025#24  2017/07/26 By 09771  add 
            DISPLAY g_qryparam.return1 TO sfaa002  #顯示到畫面上
            NEXT FIELD sfaa002                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfaa002
            #add-point:BEFORE FIELD sfaa002 name="construct.b.sfaa002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfaa002
            
            #add-point:AFTER FIELD sfaa002 name="construct.a.sfaa002"
            
            #END add-point
            
 
 
 
            
            #add-point:其他管控 name="cs.other"
         ON ACTION accept
            #ACCEPT DIALOG
            CALL asfp310_ins_table()
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         CONSTRUCT BY NAME tm.wc2 ON inag004,inag005
	      
            BEFORE CONSTRUCT

            ON ACTION controlp INFIELD inag004  #库位
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_inag004()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO inag004  #顯示到畫面上
               NEXT FIELD inag004                     #返回原欄位

            ON ACTION controlp INFIELD inag005  #储位
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.arg1 = g_site
               CALL q_inag005_3()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO inag005  #顯示到畫面上
               NEXT FIELD inag005                     #返回原欄位

            ON ACTION accept
               #ACCEPT DIALOG
               CALL asfp310_ins_table()

            #ON ACTION cancel
            #   LET INT_FLAG = 1
            #   EXIT DIALOG
         END CONSTRUCT
      
         CONSTRUCT BY NAME tm.wc3 ON sfba006
	   
            BEFORE CONSTRUCT

            ON ACTION controlp INFIELD sfba006  #元件料号
               INITIALIZE g_qryparam.* TO NULL
               LET g_qryparam.state = 'c'
               LET g_qryparam.reqry = FALSE
               CALL q_imaa001()                           #呼叫開窗
               DISPLAY g_qryparam.return1 TO sfba006  #顯示到畫面上
               NEXT FIELD sfba006                     #返回原欄位

            ON ACTION accept
               #ACCEPT DIALOG
               CALL asfp310_ins_table()

            #ON ACTION cancel
            #   LET INT_FLAG = 1
            #   EXIT DIALOG
         END CONSTRUCT
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         INPUT ARRAY g_sfaa_d FROM s_detail1.*
             ATTRIBUTE(COUNT = g_rec_b_sfaa,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = l_allow_insert,
                  #DELETE ROW = l_allow_delete,         #171012-00031#3 mark by 09772 2017/10/13
                  DELETE ROW = FALSE,         #171012-00031#3 add by 09772 2017/10/13
                  APPEND ROW = l_allow_insert)

            BEFORE INPUT
               CALL asfp310_b_fill_sfaa()
               
               LET g_rec_b_sfaa = g_sfaa_d.getLength()

            BEFORE ROW
               LET l_cmd = ''
               LET l_ac_sfaa = ARR_CURR()
            
               LET g_rec_b_sfaa = g_sfaa_d.getLength()
            
               IF g_rec_b_sfaa >= l_ac_sfaa AND g_sfaa_d[l_ac_sfaa].seq_1 IS NOT NULL THEN
                  LET l_cmd='u'
                  LET g_sfaa_d_t.* = g_sfaa_d[l_ac_sfaa].*  #BACKUP
               ELSE
                  LET l_cmd='a'
               END IF
               CALL asfp310_set_entry_sfaa(l_cmd)
               CALL asfp310_set_no_entry_sfaa(l_cmd)
               CALL cl_set_comp_required("sfaa004_1",FALSE)
               CALL asfp310_b_fill_sfba()
               CALL asfp310_b_fill_inag()
               CALL asfp310_b_fill_bmea()
               
            BEFORE INSERT
               LET l_cmd = 'a'
               INITIALIZE g_sfaa_d[l_ac_sfaa].* TO NULL
               LET g_sfaa_d_t.* = g_sfaa_d[l_ac_sfaa].*     #新輸入資料
               CALL cl_show_fld_cont()
               LET g_sfaa_d[l_ac_sfaa].sel_1 = 'N'
               LET g_sfaa_d[l_ac_sfaa].lock_1= 'N'
               SELECT MAX(seq_1) INTO g_sfaa_d[l_ac_sfaa].seq_1
                 FROM asfp310_sfaa
               IF g_sfaa_d[l_ac_sfaa].seq_1 IS NULL THEN
                  LET g_sfaa_d[l_ac_sfaa].seq_1 = 0
               END IF
               LET g_sfaa_d[l_ac_sfaa].seq_1 = g_sfaa_d[l_ac_sfaa].seq_1 + 1
            
            AFTER INSERT
               IF INT_FLAG THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 9001
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET INT_FLAG = 0
                  CANCEL INSERT
               END IF

               #单身画面能编辑的，不能合并的栏位：工单+项次+项序+参考单位+库位+储位+批号+库存管理特征+理由码 最后需合并的
               LET l_count = 1
               SELECT COUNT(*) INTO l_count FROM asfp310_sfaa
                WHERE seq_1 = g_sfaa_d[l_ac_sfaa].seq_1
               #資料未重複, 插入新增資料
               IF l_count = 0 THEN 
                  IF cl_null(g_sfaa_d[l_ac_sfaa].sfba003_1) THEN LET g_sfaa_d[l_ac_sfaa].sfba003_1 = ' ' END IF #作业
                  IF cl_null(g_sfaa_d[l_ac_sfaa].sfba004_1) THEN LET g_sfaa_d[l_ac_sfaa].sfba004_1 = ' ' END IF #作业序
                  INSERT INTO asfp310_sfaa
                              #锁定       顺序      工单单号     生产料号   预计开工日
                              (lock_1   ,seq_1    ,sfaadocno_1,sfaa010_1 ,sfaa019_1,
                              #预计完工日 部门厂商   生管员       作业编号   作业序 
                               sfaa020_1,sfaa017_1,sfaa002_1  ,sfba003_1 ,sfba004_1,
                              #生产数量   已发套数   已发齐套数   可齐料套数
                               sfaa012_1,sfaa049_1,has_sets_1)# ,can_sets_1)
                        VALUES(g_sfaa_d[l_ac_sfaa].lock_1,g_sfaa_d[l_ac_sfaa].seq_1,g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfaa010_1 ,g_sfaa_d[l_ac_sfaa].sfaa019_1,
                               g_sfaa_d[l_ac_sfaa].sfaa020_1,g_sfaa_d[l_ac_sfaa].sfaa017_1,g_sfaa_d[l_ac_sfaa].sfaa002_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1,
                               g_sfaa_d[l_ac_sfaa].sfaa012_1,g_sfaa_d[l_ac_sfaa].sfaa049_1,g_sfaa_d[l_ac_sfaa].has_sets_1)#,g_sfaa_d[l_ac_sfaa].can_sets_1)
                  IF SQLCA.SQLcode  THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "ins asfp310_sfaa"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CANCEL INSERT
                  ELSE
                     #自动插入sfba,inag,bmea
                     LET g_can_sets   = 'N'  #需足套否
                     LET g_need_issue = 'N'  #需分配数量否
                     SELECT sfaa011 INTO l_sfaa011 FROM sfaa_t
                      WHERE sfaaent  = g_enterprise
                        AND sfaadocno= g_sfaa_d[l_ac_sfaa].sfaadocno_1
                     #                           顺序                       工单单号                        作业编号                       作业序                         主件料号                      特征
                     CALL asfp310_ins_table_sfba(g_sfaa_d[l_ac_sfaa].seq_1,g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1,g_sfaa_d[l_ac_sfaa].sfaa010_1,l_sfaa011)  #产生第二单身asfp310_sfba
                        RETURNING l_success,l_is_full,l_is_gen
                     IF NOT l_success THEN
                        CANCEL INSERT
                     ELSE
                        ERROR 'INSERT O.K'
                        LET g_rec_b_sfaa = g_rec_b_sfaa + 1
                     END IF
                                          
                  END IF
               ELSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "std-00006"
                  LET g_errparam.extend = 'INSERT'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  INITIALIZE g_sfaa_d[l_ac_sfaa].* TO NULL
                  CANCEL INSERT
               END IF

            BEFORE DELETE                            #是否取消單身
               IF l_cmd = 'a' THEN
                  CALL FGL_SET_ARR_CURR(l_ac_sfaa - 1)
                  CALL g_sfaa_d.deleteElement(l_ac_sfaa)
                  NEXT FIELD seq_1
               END IF

               IF g_sfaa_d[l_ac_sfaa].seq_1 IS NOT NULL THEN
                  IF NOT cl_ask_del_detail() THEN
                     CANCEL DELETE
                  END IF
               
                  DELETE FROM asfp310_sfaa
                   WHERE seq_1 = g_sfaa_d_t.seq_1
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "del asfp310_sfaa"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CANCEL DELETE
                  ELSE
                     LET l_success = TRUE
                     DELETE FROM asfp310_sfba WHERE seq_1 = g_sfaa_d_t.seq_1 
                     IF SQLCA.sqlcode THEN
                        LET l_success = FALSE
                     END IF
                     DELETE FROM asfp310_inag WHERE seq_1 = g_sfaa_d_t.seq_1 
                     IF SQLCA.sqlcode THEN
                        LET l_success = FALSE
                     END IF
                     DELETE FROM asfp310_bmea WHERE seq_1 = g_sfaa_d_t.seq_1 
                     IF SQLCA.sqlcode THEN
                        LET l_success = FALSE
                     END IF
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "del asfp310_sfaa"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        CANCEL DELETE
                     ELSE
                        LET g_rec_b_sfaa = g_rec_b_sfaa - 1
                     END IF
                  END IF
               END IF
            
            AFTER FIELD sel_1
               IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sel_1) THEN
                  IF g_sfaa_d[l_ac_sfaa].sel_1 NOT MATCHES '[YN]' THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
               
            AFTER FIELD lock_1
               IF NOT cl_null(g_sfaa_d[l_ac_sfaa].lock_1) THEN
                  IF g_sfaa_d[l_ac_sfaa].lock_1 NOT MATCHES '[YN]' THEN
                     NEXT FIELD CURRENT
                  END IF
               END IF
            ON CHANGE lock_1
               UPDATE asfp310_sfaa SET lock_1 = g_sfaa_d[l_ac_sfaa].lock_1
                WHERE seq_1 = g_sfaa_d_t.seq_1 #項次
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "upd asfp310_sfaa"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD CURRENT
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "upd asfp310_sfaa"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     NEXT FIELD CURRENT
               END CASE
               
            #AFTER FIELD seq_1
            ON CHANGE seq_1
               IF NOT cl_null(g_sfaa_d[l_ac_sfaa].seq_1) THEN
                  IF g_sfaa_d_t.seq_1 IS NULL OR g_sfaa_d_t.seq_1 != g_sfaa_d[l_ac_sfaa].seq_1 THEN
                     SELECT COUNT(*) INTO l_count FROM asfp310_sfaa
                      WHERE seq_1 = g_sfaa_d[l_ac_sfaa].seq_1
                     IF l_count > 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'std-00006'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
               
            AFTER FIELD sfaadocno_1
               IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sfaadocno_1) THEN
                  IF g_sfaa_d_t.sfaadocno_1 IS NULL OR g_sfaa_d_t.sfaadocno_1 != g_sfaa_d[l_ac_sfaa].sfaadocno_1 THEN
                     #检查是否存在此工单，顺带预设相关资料
                     CALL asfp310_sfaadocno_1_def() RETURNING l_success
                     IF NOT l_success THEN
                        NEXT FIELD CURRENT
                     END IF
                     #检查是不是已存在于分摊列表中
                     SELECT COUNT(*) INTO l_count FROM asfp310_sfaa
                      WHERE sfaadocno_1 = g_sfaa_d[l_ac_sfaa].sfaadocno_1
                     IF l_count > 0 THEN
                        #此工单已存在于分配列表中，无需再维护
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'asf-00223'
                        LET g_errparam.extend = g_sfaa_d[l_ac_sfaa].sfaadocno_1
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
            
            BEFORE FIELD sfba003_1
               CALL asfp310_set_entry_sfaa(l_cmd)
               CALL cl_set_comp_required("sfaa004_1",FALSE)
               
            AFTER FIELD sfba003_1
               IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sfba003_1) AND NOT cl_null(g_sfaa_d[l_ac_sfaa].sfaadocno_1) THEN
                  SELECT COUNT(*) INTO l_count FROM sfba_t
                   WHERE sfbaent  = g_enterprise
                     AND sfbadocno= g_sfaa_d[l_ac_sfaa].sfaadocno_1
                     AND sfba003  = g_sfaa_d[l_ac_sfaa].sfba003_1
                  IF l_count = 0 THEN
                     #此作业编号不存在工单中，请输入正确的数据
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00231'
                     LET g_errparam.extend = g_sfaa_d[l_ac_sfaa].sfba003_1
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     NEXT FIELD CURRENT
                  END IF
                  IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sfba004_1) THEN
                     SELECT COUNT(*) INTO l_count FROM sfba_t
                      WHERE sfbaent  = g_enterprise
                        AND sfbadocno= g_sfaa_d[l_ac_sfaa].sfaadocno_1
                        AND sfba003  = g_sfaa_d[l_ac_sfaa].sfba003_1
                        AND sfba004  = g_sfaa_d[l_ac_sfaa].sfba004_1
                     IF l_count = 0 THEN
                        #此作业编号+作业序不存在工单中，请输入正确的数据
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'asf-00232'
                        LET g_errparam.extend = g_sfaa_d[l_ac_sfaa].sfba003_1
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
               
               #已发齐套数
               CALL s_asft340_full_sets(g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1,'')
                    RETURNING l_success,g_sfaa_d[l_ac_sfaa].has_sets_1
               IF NOT l_success THEN
                  NEXT FIELD CURRENT
               END IF
               
               #可齐料套数
               CALL asfp310_full_sets(g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1)
                    RETURNING l_success,g_sfaa_d[l_ac_sfaa].can_sets_1
               IF NOT l_success THEN
                  NEXT FIELD CURRENT
               END IF
               LET g_sfaa_d[l_ac_sfaa].can_sets_1 = g_sfaa_d[l_ac_sfaa].can_sets_1 - g_sfaa_d[l_ac_sfaa].has_sets_1
           
               IF cl_null(g_sfaa_d[l_ac_sfaa].sfba003_1) THEN
                  LET g_sfaa_d[l_ac_sfaa].sfba003_1 = ' '
                  LET g_sfaa_d[l_ac_sfaa].sfba004_1 = ' '
               ELSE
                  CALL cl_set_comp_required("sfaa004_1",TRUE)
               END IF
               CALL asfp310_set_no_entry_sfaa(l_cmd)
            
            AFTER FIELD sfba004_1
               IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sfba004_1) AND NOT cl_null(g_sfaa_d[l_ac_sfaa].sfaadocno_1) THEN
                  IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sfba003_1) THEN
                     SELECT COUNT(*) INTO l_count FROM sfba_t
                      WHERE sfbaent  = g_enterprise
                        AND sfbadocno= g_sfaa_d[l_ac_sfaa].sfaadocno_1
                        AND sfba003  = g_sfaa_d[l_ac_sfaa].sfba003_1
                        AND sfba004  = g_sfaa_d[l_ac_sfaa].sfba004_1
                     IF l_count = 0 THEN
                        #此作业编号+作业序不存在工单中，请输入正确的数据
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'asf-00232'
                        LET g_errparam.extend = g_sfaa_d[l_ac_sfaa].sfba003_1
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
               #已发齐套数
               CALL s_asft340_full_sets(g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1,'')
                    RETURNING l_success,g_sfaa_d[l_ac_sfaa].has_sets_1
               IF NOT l_success THEN
                  NEXT FIELD CURRENT
               END IF
               
               #可齐料套数
               CALL asfp310_full_sets(g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1)
                    RETURNING l_success,g_sfaa_d[l_ac_sfaa].can_sets_1
               IF NOT l_success THEN
                  NEXT FIELD CURRENT
               END IF
               LET g_sfaa_d[l_ac_sfaa].can_sets_1 = g_sfaa_d[l_ac_sfaa].can_sets_1 - g_sfaa_d[l_ac_sfaa].has_sets_1
            
            ON ACTION controlp INFIELD sfaadocno_1
               #工单单号
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "i"
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_sfaa_d[l_ac_sfaa].sfaadocno_1
               LET g_qryparam.where = " sfaasite ='",g_site,"' AND sfaastus='F'"
                                      ," AND sfaa004 <> '2' "  #170618-00169#1 add
               CALL q_sfaadocno_3()
               LET g_sfaa_d[l_ac_sfaa].sfaadocno_1 = g_qryparam.return1
               DISPLAY g_sfaa_d[l_ac_sfaa].sfaadocno_1 TO sfaadocno_1

            ON ACTION controlp INFIELD sfba003_1
               #作业编号
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "i"
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_sfaa_d[l_ac_sfaa].sfba003_1
               IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sfaadocno_1) THEN
                  LET g_qryparam.where = " sfbadocno ='",g_sfaa_d[l_ac_sfaa].sfaadocno_1,"' "
               END IF
               CALL q_sfba003()
               LET g_sfaa_d[l_ac_sfaa].sfba003_1 = g_qryparam.return1
               DISPLAY g_sfaa_d[l_ac_sfaa].sfba003_1 TO sfba003_1

            ON ACTION controlp INFIELD sfba004_1
               #作业序
               INITIALIZE g_qryparam.* TO NULL 
               LET g_qryparam.state = "i"
               LET g_qryparam.reqry = FALSE
               LET g_qryparam.default1 = g_sfaa_d[l_ac_sfaa].sfba004_1
               IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sfaadocno_1) THEN
                  LET g_qryparam.where = " sfbadocno ='",g_sfaa_d[l_ac_sfaa].sfaadocno_1,"' "
                  IF NOT cl_null(g_sfaa_d[l_ac_sfaa].sfba003_1) THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED," AND sfba003 ='",g_sfaa_d[l_ac_sfaa].sfba003_1,"' "
                  END IF
               END IF
               CALL q_sfba004()
               LET g_sfaa_d[l_ac_sfaa].sfba004_1 = g_qryparam.return1
               DISPLAY g_sfaa_d[l_ac_sfaa].sfba004_1 TO sfba004_1

            ON ROW CHANGE
               IF INT_FLAG THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 9001
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET INT_FLAG = 0
                  LET g_sfaa_d[l_ac_sfaa].* = g_sfaa_d_t.*
                  NEXT FIELD seq_1
               END IF

               #寫入修改者/修改日期資訊(單身)
               IF cl_null(g_sfaa_d[l_ac_sfaa].sfba003_1) THEN LET g_sfaa_d[l_ac_sfaa].sfba003_1 = ' ' END IF #作业
               IF cl_null(g_sfaa_d[l_ac_sfaa].sfba004_1) THEN LET g_sfaa_d[l_ac_sfaa].sfba004_1 = ' ' END IF #作业序
               UPDATE asfp310_sfaa SET
                                     #锁定       顺序      工单单号     生产料号   预计开工日
                                     (lock_1   ,seq_1    ,sfaadocno_1,sfaa010_1 ,sfaa019_1,
                                     #预计完工日 部门厂商   生管员       作业编号   作业序 
                                      sfaa020_1,sfaa017_1,sfaa002_1  ,sfba003_1 ,sfba004_1,
                                     #生产数量   已发套数   已发齐套数   可齐料套数
                                      sfaa012_1,sfaa049_1,has_sets_1)# ,can_sets_1)
                                   = (g_sfaa_d[l_ac_sfaa].lock_1,g_sfaa_d[l_ac_sfaa].seq_1,g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfaa010_1 ,g_sfaa_d[l_ac_sfaa].sfaa019_1,
                                      g_sfaa_d[l_ac_sfaa].sfaa020_1,g_sfaa_d[l_ac_sfaa].sfaa017_1,g_sfaa_d[l_ac_sfaa].sfaa002_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1,
                                      g_sfaa_d[l_ac_sfaa].sfaa012_1,g_sfaa_d[l_ac_sfaa].sfaa049_1,g_sfaa_d[l_ac_sfaa].has_sets_1)#,g_sfaa_d[l_ac_sfaa].can_sets_1)
                WHERE seq_1 = g_sfaa_d_t.seq_1 #項次
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "upd asfp310_sfaa"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_sfaa_d[l_ac_sfaa].* = g_sfaa_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "upd asfp310_sfaa"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_sfaa_d[l_ac_sfaa].* = g_sfaa_d_t.*
                  OTHERWISE
                     ##删除旧值
                     #LET l_success_tot = TRUE
                     #DELETE FROM asfp310_sfba WHERE seq_1 = g_sfaa_d_t.seq_1 
                     #IF SQLCA.sqlcode THEN
                     #   LET l_success_tot = FALSE
                     #END IF
                     #DELETE FROM asfp310_inag WHERE seq_1 = g_sfaa_d_t.seq_1 
                     #IF SQLCA.sqlcode THEN
                     #   LET l_success_tot = FALSE
                     #END IF
                     #DELETE FROM asfp310_bmea WHERE seq_1 = g_sfaa_d_t.seq_1 
                     #IF SQLCA.sqlcode THEN
                     #   LET l_success_tot = FALSE
                     #END IF
                     ##产生新增--自动插入sfba,inag,bmea
                     #LET g_can_sets   = 'N'  #需足套否
                     #LET g_need_issue = 'N'  #需分配数量否
                     #SELECT sfaa011 INTO l_sfaa011 FROM sfaa_t  #特性
                     # WHERE sfaaent  = g_enterprise
                     #   AND sfaadocno= g_sfaa_d[l_ac_sfaa].sfaadocno_1
                     ##                           顺序                       工单单号                        作业编号                       作业序                         主件料号                      特征
                     #CALL asfp310_ins_table_sfba(g_sfaa_d[l_ac_sfaa].seq_1,g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1,g_sfaa_d[l_ac_sfaa].sfaa010_1,l_sfaa011)  #产生第二单身asfp310_sfba
                     #   RETURNING l_success,l_is_full,l_is_gen
                     #IF NOT l_success THEN
                     #   LET l_success_tot = l_success
                     #END IF
                     #IF NOT l_success_tot THEN
                     #   INITIALIZE g_errparam TO NULL
                     #   LET g_errparam.code = "std-00009"
                     #   LET g_errparam.extend = "upd asfp310_sfaa"
                     #   LET g_errparam.popup = TRUE
                     #   CALL cl_err()

                     #   LET g_sfaa_d[l_ac_sfaa].* = g_sfaa_d_t.*
                     #END IF
               END CASE

            AFTER ROW


            AFTER INPUT
            
            ON ACTION selall
               CALL asfp310_sel_all("Y")

            ON ACTION selnone
               CALL asfp310_sel_all("N")

         END INPUT
         
         INPUT ARRAY g_inag_d FROM s_detail3.*
             ATTRIBUTE(COUNT = g_rec_b_inag,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = FALSE,
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)

            BEFORE INPUT
               CALL asfp310_b_fill_inag()
               LET g_rec_b_inag = g_inag_d.getLength()

            BEFORE ROW
               LET l_cmd = ''
               LET l_ac_inag = ARR_CURR()
               LET g_ac_inag = l_ac_inag
            
               LET g_rec_b_inag = g_inag_d.getLength()
            
               IF g_rec_b_inag >= l_ac_inag AND g_inag_d[l_ac_inag].inag004_3 IS NOT NULL THEN
                  LET l_cmd='u'
                  LET g_inag_d_t.* = g_inag_d[l_ac_inag].*  #BACKUP
               ELSE
                  LET l_cmd='a'
               END IF


            #AFTER FIELD issue_qty_3
            ON CHANGE issue_qty_3
               IF NOT cl_null(g_inag_d[l_ac_inag].issue_qty_3) THEN
                  CALL asfp310_chk_column() RETURNING l_success
                  IF NOT l_success THEN
                     NEXT FIELD CURRENT
                     LET g_inag_d[l_ac_inag].* = g_inag_d_t.*
                  END IF
               
               END IF
               
               #ON ROW CHANGE 移过来
               CALL asfp310_upd_temp() RETURNING l_success #先汇总数量，再更新inag sfba
               IF NOT l_success THEN
                  NEXT FIELD CURRENT
                  LET g_inag_d[l_ac_inag].* = g_inag_d_t.*
               END IF
               
            ON ROW CHANGE
               IF INT_FLAG THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 9001
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET INT_FLAG = 0
                  LET g_inag_d[l_ac_inag].* = g_inag_d_t.*
                  NEXT FIELD issue_qty_3
               END IF
               
            AFTER ROW
               LET g_ac_inag = 0
               

            AFTER INPUT
               LET g_ac_inag = 0
               
         END INPUT
         
         INPUT ARRAY g_bmea_d FROM s_detail4.*
             ATTRIBUTE(COUNT = g_rec_b_bmea,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                  INSERT ROW = FALSE,
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)

            BEFORE INPUT
               CALL asfp310_b_fill_bmea()
               LET g_rec_b_bmea = g_bmea_d.getLength()

            BEFORE ROW
               LET l_cmd = ''
               LET l_ac_bmea = ARR_CURR()
               LET g_ac_bmea = l_ac_bmea
            
               LET g_rec_b_bmea = g_bmea_d.getLength()
            
               IF g_rec_b_bmea >= l_ac_bmea AND g_bmea_d[l_ac_bmea].bmea008_4 IS NOT NULL THEN
                  LET l_cmd='u'
                  LET g_bmea_d_t.* = g_bmea_d[l_ac_bmea].*  #BACKUP
               ELSE
                  LET l_cmd='a'
               END IF


            AFTER FIELD issue_qty_4
               IF NOT cl_null(g_bmea_d[l_ac_bmea].issue_qty_4) THEN
                  CALL asfp310_chk_column() RETURNING l_success
                  IF NOT l_success THEN
                     NEXT FIELD CURRENT
                     LET g_inag_d[l_ac_inag].* = g_inag_d_t.*
                  END IF
                  
               END IF
               
               #ON ROW CHANGE 移过来
               CALL asfp310_upd_temp() RETURNING l_success #先汇总数量，再更新bmea sfba
               IF NOT l_success THEN
                  NEXT FIELD CURRENT
                  LET g_inag_d[l_ac_inag].* = g_inag_d_t.*
               END IF
               
            ON ROW CHANGE
               IF INT_FLAG THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 9001
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = FALSE
                  CALL cl_err()

                  LET INT_FLAG = 0
                  LET g_bmea_d[l_ac_bmea].* = g_bmea_d_t.*
                  NEXT FIELD issue_qty_4
               END IF
               
            AFTER ROW
               LET g_ac_bmea = 0


            AFTER INPUT
               LET g_ac_bmea = 0

         END INPUT
         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_sfba_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b_sfba) #page1
            BEFORE ROW
               LET l_ac_sfba = DIALOG.getCurrentRow("s_detail2")
               CALL asfp310_b_fill_inag()
               CALL asfp310_b_fill_bmea()

            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(l_ac_sfba)
               LET l_ac_sfba = DIALOG.getCurrentRow("s_detail2")
         END DISPLAY
         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL asfp310_get_buffer(l_dialog)
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
         ON ACTION gen_asft310      #产生发料单
            CALL asfp310_chk_column() RETURNING l_success   #走不到ON CHANGE 栏位 这边再算一次
            IF l_success THEN
               CALL asfp310_upd_temp() RETURNING l_success     #走不到ON CHANGE 栏位 这边再算一次
               IF l_success THEN
                  CALL asfp310_gen_asft310()
                  EXIT DIALOG    #170220-00055#1 add
               END IF
            END IF
           
             
         ON ACTION redistribution   #重新分配
            CALL asfp310_redistribution()
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
         CALL asfp310_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      
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
                 CALL asfp310_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = asfp310_transfer_argv(ls_js)
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
 
{<section id="asfp310.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION asfp310_transfer_argv(ls_js)
 
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
 
{<section id="asfp310.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION asfp310_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   
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
      
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE asfp310_process_cs CURSOR FROM ls_sql
#  FOREACH asfp310_process_cs INTO
   #add-point:process段process name="process.process"
   
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
 
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
      
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL asfp310_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="asfp310.get_buffer" >}
PRIVATE FUNCTION asfp310_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.sfba003 = p_dialog.getFieldBuffer('sfba003')
   LET g_master.sfba004 = p_dialog.getFieldBuffer('sfba004')
   LET g_master.no_sets = p_dialog.getFieldBuffer('no_sets')
   LET g_master.priority1 = p_dialog.getFieldBuffer('priority1')
   LET g_master.priority2 = p_dialog.getFieldBuffer('priority2')
   LET g_master.priority3 = p_dialog.getFieldBuffer('priority3')
   LET g_master.priority4 = p_dialog.getFieldBuffer('priority4')
   LET g_master.can_sets = p_dialog.getFieldBuffer('can_sets')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asfp310.msgcentre_notify" >}
PRIVATE FUNCTION asfp310_msgcentre_notify()
 
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
 
{<section id="asfp310.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"
#建立临时表
PRIVATE FUNCTION asfp310_crt_table()
DEFINE r_success       LIKE type_t.num5

   WHENEVER ERROR CONTINUE
   LET r_success = FALSE

   #检查事务中
   IF NOT s_transaction_chk('N',1) THEN
      RETURN r_success
   END IF

   #
   #基本资料单身-上
   DROP TABLE asfp310_sfaa;
   CREATE TEMP TABLE asfp310_sfaa(
      lock_1      LIKE type_t.chr1,      #锁定
      seq_1       LIKE type_t.num5,      #顺序
      sfaadocno_1 LIKE sfaa_t.sfaadocno, #工单单号
      sfaa010_1   LIKE sfaa_t.sfaa010,   #生产料号
      sfaa019_1   LIKE sfaa_t.sfaa019,   #预计开工日
      sfaa020_1   LIKE sfaa_t.sfaa020,   #预计完工日
      sfaa017_1   LIKE sfaa_t.sfaa017,   #部门厂商
      sfaa002_1   LIKE sfaa_t.sfaa002,   #生管员
      sfba003_1   LIKE sfba_t.sfba003,   #作业编号
      sfba004_1   LIKE sfba_t.sfba004,   #作业序
      sfaa012_1   LIKE sfaa_t.sfaa012,   #生产数量
      sfaa049_1   LIKE sfaa_t.sfaa049,   #已发套数
      has_sets_1  LIKE sfaa_t.sfaa049    #已发齐套数
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create table'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   CREATE UNIQUE INDEX asfp310_sfaa_01 on asfp310_sfaa (seq_1)
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create index'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF

   #基本资料单身-下
   DROP TABLE asfp310_sfba;
   CREATE TEMP TABLE asfp310_sfba(
      seq_1       LIKE type_t.num5,      #顺序
      seq_2       LIKE type_t.num5,      #项次
      seq1_2      LIKE type_t.num5,      #项序
      sfba002_2   LIKE sfba_t.sfba002,   #部位
      sfba003_2   LIKE sfba_t.sfba003,   #作业
      sfba004_2   LIKE sfba_t.sfba004,   #作业序
      sfba006_2   LIKE sfba_t.sfba006,   #发料料号
      sfba021_2   LIKE sfba_t.sfba021,   #产品特征
      sfba014_2   LIKE sfba_t.sfba014,   #单位
      sfba013_2   LIKE sfba_t.sfba013,   #应发数量  
      sfba016_2   LIKE sfba_t.sfba016,   #已发数量
      no_issue_2  LIKE sfba_t.sfba016,   #未发数量
      issue_qty_2 LIKE sfba_t.sfba016,   #发料量
      inag008_2   LIKE sfba_t.sfba016,   #库存可用量
      inan010_2   LIKE sfba_t.sfba016,   #在捡量
      sfba001_2   LIKE sfba_t.sfba001    #上阶料
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create table'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   CREATE UNIQUE INDEX asfp310_sfba_01 on asfp310_sfba (seq_1,seq_2,seq1_2)
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create index'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF

   #主要用料库存页签
   DROP TABLE asfp310_inag;
   CREATE TEMP TABLE asfp310_inag(
      seq_1       LIKE type_t.num5,      #顺序
      seq_2       LIKE type_t.num5,      #项次
      seq1_2      LIKE type_t.num5,      #项序
      inag004_3   LIKE inag_t.inag004,   #库位
      inag005_3   LIKE inag_t.inag005,   #储位
      inag006_3   LIKE inag_t.inag006,   #批号
      inag003_3   LIKE inag_t.inag003,   #库存管理特征
      inag007_3   LIKE inag_t.inag007,   #单位
      inag008_3   LIKE inag_t.inag008,   #现有库存数量
      inan010_3   LIKE inan_t.inan010,   #库存在捡量
      issue_qty_3 LIKE inag_t.inag008    #发料量
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create table'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   CREATE UNIQUE INDEX asfp310_inag_01 on asfp310_inag (seq_1,seq_2,seq1_2,inag004_3,inag005_3,inag006_3,inag003_3,inag007_3)
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create index'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF

   #取替代料页签
   DROP TABLE asfp310_bmea;
   CREATE TEMP TABLE asfp310_bmea(
      seq_1       LIKE type_t.num5,      #顺序
      seq_2       LIKE type_t.num5,      #项次
      seq1_2      LIKE type_t.num5,      #项序
      bmea007_4   LIKE bmea_t.bmea007,   #取替代特性
      bmea008_4   LIKE bmea_t.bmea008,   #料件编号
      bmea019_4   LIKE bmea_t.bmea019,   #產品特徵
      replace_rate_4    LIKE sfba_t.sfba022,   #替代率
      bmea016_4   LIKE bmea_t.bmea016,   #替代方式
      bmea017_4   LIKE bmea_t.bmea017,   #替代上限比率
      inag004_4   LIKE inag_t.inag004,   #库位
      inag005_4   LIKE inag_t.inag005,   #储位
      inag006_4   LIKE inag_t.inag006,   #批号
      inag003_4   LIKE inag_t.inag003,   #库存管理特征 
      inag007_4   LIKE inag_t.inag007,   #单位
      inag008_4   LIKE inag_t.inag008,   #现有库存数量 
      inan010_4   LIKE inan_t.inan010,   #库存在捡量 
      issue_qty_4 LIKE inag_t.inag008    #发料量
   );
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create table'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   CREATE UNIQUE INDEX asfp310_bmea_01 on asfp310_bmea (seq_1,seq_2,seq1_2,bmea007_4,bmea008_4,bmea019_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4)
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create index'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   LET r_success = TRUE
   RETURN r_success
END FUNCTION
#产生asfp310_sfba
#第二单身--获取工单备料信息
PRIVATE FUNCTION asfp310_ins_table_sfba(p_seq,p_sfaadocno,p_sfba003,p_sfba004,p_sfaa010,p_sfaa011)
DEFINE p_seq          LIKE type_t.num5     #顺序
DEFINE p_sfaadocno    LIKE sfaa_t.sfaadocno   #工单单号
DEFINE p_sfba003      LIKE sfba_t.sfba003     #作业编号
DEFINE p_sfba004      LIKE sfba_t.sfba004     #作业序
DEFINE p_sfaa010      LIKE sfaa_t.sfaa010     #主件料号
DEFINE p_sfaa011      LIKE sfaa_t.sfaa011     #特征
DEFINE r_success      LIKE type_t.num5
DEFINE r_is_full      LIKE type_t.chr1    #检查结果：可足套否
DEFINE r_is_gen       LIKE type_t.chr1    #工单需产生否  计算包括未审核未过账发料单中的料，已足料的工单无需产生
DEFINE l_sql          STRING
#161109-00085#39-s
#DEFINE l_sfba         RECORD LIKE sfba_t.*
DEFINE l_sfba RECORD  #工單備料單身檔
       sfbaent LIKE sfba_t.sfbaent, #企業編號
       sfbasite LIKE sfba_t.sfbasite, #營運據點
       sfbadocno LIKE sfba_t.sfbadocno, #單號
       sfbaseq LIKE sfba_t.sfbaseq, #項次
       sfbaseq1 LIKE sfba_t.sfbaseq1, #項序
       sfba001 LIKE sfba_t.sfba001, #上階料號
       sfba002 LIKE sfba_t.sfba002, #部位
       sfba003 LIKE sfba_t.sfba003, #作業編號
       sfba004 LIKE sfba_t.sfba004, #作業序
       sfba005 LIKE sfba_t.sfba005, #BOM料號
       sfba006 LIKE sfba_t.sfba006, #發料料號
       sfba007 LIKE sfba_t.sfba007, #投料時距
       sfba008 LIKE sfba_t.sfba008, #必要特性
       sfba009 LIKE sfba_t.sfba009, #倒扣料
       sfba010 LIKE sfba_t.sfba010, #標準QPA分子
       sfba011 LIKE sfba_t.sfba011, #標準QPA分母
       sfba012 LIKE sfba_t.sfba012, #允許誤差率
       sfba013 LIKE sfba_t.sfba013, #應發數量
       sfba014 LIKE sfba_t.sfba014, #單位
       sfba015 LIKE sfba_t.sfba015, #委外代買數量
       sfba016 LIKE sfba_t.sfba016, #已發數量
       sfba017 LIKE sfba_t.sfba017, #報廢數量
       sfba018 LIKE sfba_t.sfba018, #盤虧數量
       sfba019 LIKE sfba_t.sfba019, #指定發料倉庫
       sfba020 LIKE sfba_t.sfba020, #指定發料儲位
       sfba021 LIKE sfba_t.sfba021, #產品特徵
       sfba022 LIKE sfba_t.sfba022, #替代率
       sfba023 LIKE sfba_t.sfba023, #標準應發數量
       sfba024 LIKE sfba_t.sfba024, #調整應發數量
       sfba025 LIKE sfba_t.sfba025, #超領數量
       sfba026 LIKE sfba_t.sfba026, #SET替代狀態
       sfba027 LIKE sfba_t.sfba027, #SET替代群組
       sfba028 LIKE sfba_t.sfba028, #客供料
       sfba029 LIKE sfba_t.sfba029, #指定發料批號
       sfba030 LIKE sfba_t.sfba030, #指定庫存管理特徵
       sfba031 LIKE sfba_t.sfba031, #備置量
       sfba032 LIKE sfba_t.sfba032, #備置理由碼
       sfba033 LIKE sfba_t.sfba033, #保稅否
       sfba034 LIKE sfba_t.sfba034, #SET被替代群組
       sfba035 LIKE sfba_t.sfba035  #SET替代套數
END RECORD
#161109-00085#39-e
DEFINE l_imaf053      LIKE imaf_t.imaf053  #据点库存单位
DEFINE l_imaf054      LIKE imaf_t.imaf054  #库存多单位
DEFINE l_sfdc007      LIKE sfdc_t.sfdc007  #发料单中的未作废未过账的数量
DEFINE l_count        LIKE type_t.num5     #备料中有发料需求的笔数

   LET r_success = TRUE
   LET r_is_full = 'N'
   LET r_is_gen  = 'Y'
   LET l_count   = 0
   
   IF g_can_sets='Y' AND g_need_issue='N' THEN  #需满足足套，又不需分配数量，两者不能同时，冲突，如果不分配数量怎么知道可足套否
      LET r_success = FALSE
      RETURN r_success,r_is_full,r_is_gen
   END IF
   #161109-00085#39-s
   #LET l_sql = " SELECT sfba_t.*,imaf053,imaf054 FROM sfba_t,imaf_t ",
   LET l_sql = 
   " SELECT sfbaent,sfbasite,sfbadocno,sfbaseq,sfbaseq1,
            sfba001,sfba002,sfba003,sfba004,sfba005,
            sfba006,sfba007,sfba008,sfba009,sfba010,
            sfba011,sfba012,sfba013,sfba014,sfba015,
            sfba016,sfba017,sfba018,sfba019,sfba020,
            sfba021,sfba022,sfba023,sfba024,sfba025,
            sfba026,sfba027,sfba028,sfba029,sfba030,
            sfba031,sfba032,sfba033,sfba034,sfba035,
            imaf053,imaf054 FROM sfba_t,imaf_t ",
   #161109-00085#39-e
               "  WHERE sfbaent = imafent ",
               "    AND sfbasite= imafsite",
               "    AND sfba006 = imaf001 ",  #料件
               "    AND sfbaent  = ",g_enterprise,
               "    AND sfbasite ='",g_site,"' ",
               "    AND ",tm.wc3 CLIPPED,  #进阶查询QBE--元件料号sfba006
               "    AND sfba013 > sfba015 + sfba016 ",   #应发 > 代买+已发
               "    AND sfba009 = 'N' ",   #非倒扣料
               "    AND sfbadocno ='",p_sfaadocno,"' "
   IF NOT cl_null(p_sfba003) THEN
      LET l_sql = l_sql CLIPPED," AND sfba003='",p_sfba003,"' "  #作业编号
      IF NOT cl_null(p_sfba004) AND p_sfba004 != 0 THEN
         LET l_sql = l_sql CLIPPED," AND sfba004='",p_sfba004,"' "   #作业序
      END IF
   END IF
   PREPARE asfp310_ins_table_sfba_p FROM l_sql
   DECLARE asfp310_ins_table_sfba_c CURSOR FOR asfp310_ins_table_sfba_p
   #161109-00085#39-s
   #FOREACH asfp310_ins_table_sfba_c INTO l_sfba.*,l_imaf053,l_imaf054
   FOREACH asfp310_ins_table_sfba_c 
   INTO l_sfba.sfbaent,l_sfba.sfbasite,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,
        l_sfba.sfba001,l_sfba.sfba002,l_sfba.sfba003,l_sfba.sfba004,l_sfba.sfba005,
        l_sfba.sfba006,l_sfba.sfba007,l_sfba.sfba008,l_sfba.sfba009,l_sfba.sfba010,
        l_sfba.sfba011,l_sfba.sfba012,l_sfba.sfba013,l_sfba.sfba014,l_sfba.sfba015,
        l_sfba.sfba016,l_sfba.sfba017,l_sfba.sfba018,l_sfba.sfba019,l_sfba.sfba020,
        l_sfba.sfba021,l_sfba.sfba022,l_sfba.sfba023,l_sfba.sfba024,l_sfba.sfba025,
        l_sfba.sfba026,l_sfba.sfba027,l_sfba.sfba028,l_sfba.sfba029,l_sfba.sfba030,
        l_sfba.sfba031,l_sfba.sfba032,l_sfba.sfba033,l_sfba.sfba034,l_sfba.sfba035,
        l_imaf053,l_imaf054
   #161109-00085#39-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF cl_null(l_imaf054) THEN
         LET l_imaf054 = 'N'
         IF cl_null(l_imaf053) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00476'
            LET g_errparam.extend = l_sfba.sfba006
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END IF
      
      IF cl_null(l_sfba.sfba014) THEN
         #工单备料缺少单位信息,请到[工单维护作业asft300]查核
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00403'
         LET g_errparam.extend = p_sfaadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #计算发料单中未作废未过账的数量
      LET l_sfdc007 = 0
      SELECT SUM(sfdc007) INTO l_sfdc007
        FROM sfdc_t,sfda_t
       WHERE sfdcent = sfdaent AND sfdcdocno = sfdadocno
         AND sfdcent = l_sfba.sfbaent  #170123-00011#1 add
         AND sfdc001 = l_sfba.sfbadocno
         AND sfdc002 = l_sfba.sfbaseq
         AND sfdc003 = l_sfba.sfbaseq1
         AND sfdastus NOT IN ('X','S')
      IF cl_null(l_sfdc007) THEN LET l_sfdc007=0 END IF
      
      LET g_no_issue_2  =  l_sfba.sfba013 - l_sfba.sfba016 - l_sfba.sfba015 - l_sfdc007 #未发数量=应发-已发-代买-发料单中未作废未过账的数量
      IF g_no_issue_2 <=0 THEN
         CONTINUE FOREACH
      ELSE
         LET l_count = l_count + 1
      END IF
      
      LET g_issue_qty_2 =  0 #发料量
      
      LET g_inag008_2   =  0 #库存可用量
      LET g_inan010_2   =  0 #在捡量
      
      IF cl_null(l_sfba.sfba021) THEN LET l_sfba.sfba021 = ' ' END IF #特征
      #                        顺序          项次         项序         部位         作业
      INSERT INTO asfp310_sfba(seq_1      , seq_2      , seq1_2     , sfba002_2  , sfba003_2  , 
      #                        作业序        发料料号      产品特征     单位         应发数量 
                               sfba004_2  , sfba006_2  , sfba021_2  , sfba014_2  , sfba013_2  , 
      #                        已发数量      未发数量      发料量       库存可用量    在捡量 
                               sfba016_2  , no_issue_2 , issue_qty_2, inag008_2  , inan010_2  ,
      #                        上阶料
                               sfba001_2 )
        VALUES(p_seq         , l_sfba.sfbaseq, l_sfba.sfbaseq1, l_sfba.sfba002, l_sfba.sfba003,
               l_sfba.sfba004, l_sfba.sfba006, l_sfba.sfba021 , l_sfba.sfba014, l_sfba.sfba013,
               l_sfba.sfba016, g_no_issue_2  , g_issue_qty_2  , g_inag008_2   , g_inan010_2   ,
               l_sfba.sfba001)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins asfp310_sfba"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #------产生主要用料库存单身（同时累加g_inag008_2，g_inan010_2）------
      #                           顺序   工单单号         项次            项序            元件料号        产品特征       单位
      CALL asfp310_ins_table_inag(p_seq,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,l_sfba.sfba006,l_sfba.sfba021,l_sfba.sfba014,l_imaf053,l_imaf054)
         RETURNING r_success
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      IF l_sfba.sfbaseq1 = 0 THEN #项序为0，非0的为已经被取替代的料，不可能再有替代资料
         #------产生取替代料单身（同时累加g_inag008_2，g_inan010_2）------
         #                           顺序   工单单号         项次            项序
         CALL asfp310_ins_table_bmea(p_seq,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,
         #                           主件料号   特性      元件料号        部位           作业编号        作业序         产品特征        单位            应发量         上阶料号
                                     p_sfaa010,p_sfaa011,l_sfba.sfba006,l_sfba.sfba002,l_sfba.sfba003,l_sfba.sfba004,l_sfba.sfba021,l_sfba.sfba014,l_sfba.sfba013,l_sfba.sfba001)
            RETURNING r_success
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
      END IF

      #IF g_issue_qty_2 <= g_no_issue_2 THEN  #发料量<未发量
      IF g_no_issue_2 > 0 THEN  #未发量还有未分配的
         LET r_is_full = 'N'  #足套否
      ELSE
         LET r_is_full = 'Y'  #足套否
      END IF
      #若需判断足套
      IF g_can_sets = 'Y' AND r_is_full='N' THEN
         EXIT FOREACH
      END IF

      UPDATE asfp310_sfba SET issue_qty_2= g_issue_qty_2,  #发料量
                              inag008_2  = g_inag008_2,    #库存可用量
                              inan010_2  = g_inan010_2     #在捡量
       WHERE seq_1 = p_seq
         AND seq_2 = l_sfba.sfbaseq
         AND seq1_2= l_sfba.sfbaseq1
      IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd asfp310_sfba err'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

   END FOREACH
   IF l_count = 0 THEN
      LET r_is_gen = 'N'
   END IF

   RETURN r_success,r_is_full,r_is_gen
END FUNCTION
#根据条件产生新的资料，同时进行分配
PRIVATE FUNCTION asfp310_ins_table_sfaa()
DEFINE r_success     LIKE type_t.num5
DEFINE l_seq_1       LIKE type_t.num5
DEFINE l_sql1        STRING
DEFINE l_sql         STRING
#161109-00085#39-s
#DEFINE l_sfaa        RECORD LIKE sfaa_t.*
DEFINE l_sfaa RECORD  #工單單頭檔
       sfaaent LIKE sfaa_t.sfaaent, #企業編號
       sfaaownid LIKE sfaa_t.sfaaownid, #資料所有者
       sfaaowndp LIKE sfaa_t.sfaaowndp, #資料所有部門
       sfaacrtid LIKE sfaa_t.sfaacrtid, #資料建立者
       sfaacrtdp LIKE sfaa_t.sfaacrtdp, #資料建立部門
       sfaacrtdt LIKE sfaa_t.sfaacrtdt, #資料創建日
       sfaamodid LIKE sfaa_t.sfaamodid, #資料修改者
       sfaamoddt LIKE sfaa_t.sfaamoddt, #最近修改日
       sfaacnfid LIKE sfaa_t.sfaacnfid, #資料確認者
       sfaacnfdt LIKE sfaa_t.sfaacnfdt, #資料確認日
       sfaapstid LIKE sfaa_t.sfaapstid, #資料過帳者
       sfaapstdt LIKE sfaa_t.sfaapstdt, #資料過帳日
       sfaastus LIKE sfaa_t.sfaastus, #狀態碼
       sfaasite LIKE sfaa_t.sfaasite, #營運據點
       sfaadocno LIKE sfaa_t.sfaadocno, #單號
       sfaadocdt LIKE sfaa_t.sfaadocdt, #單據日期
       sfaa001 LIKE sfaa_t.sfaa001, #變更版本
       sfaa002 LIKE sfaa_t.sfaa002, #生管人員
       sfaa003 LIKE sfaa_t.sfaa003, #工單類型
       sfaa004 LIKE sfaa_t.sfaa004, #發料制度
       sfaa005 LIKE sfaa_t.sfaa005, #工單來源
       sfaa006 LIKE sfaa_t.sfaa006, #來源單號
       sfaa007 LIKE sfaa_t.sfaa007, #來源項次
       sfaa008 LIKE sfaa_t.sfaa008, #來源項序
       sfaa009 LIKE sfaa_t.sfaa009, #參考客戶
       sfaa010 LIKE sfaa_t.sfaa010, #生產料號
       sfaa011 LIKE sfaa_t.sfaa011, #特性
       sfaa012 LIKE sfaa_t.sfaa012, #生產數量
       sfaa013 LIKE sfaa_t.sfaa013, #生產單位
       sfaa014 LIKE sfaa_t.sfaa014, #BOM版本
       sfaa015 LIKE sfaa_t.sfaa015, #BOM有效日期
       sfaa016 LIKE sfaa_t.sfaa016, #製程編號
       sfaa017 LIKE sfaa_t.sfaa017, #部門供應商
       sfaa018 LIKE sfaa_t.sfaa018, #協作據點
       sfaa019 LIKE sfaa_t.sfaa019, #預計開工日
       sfaa020 LIKE sfaa_t.sfaa020, #預計完工日
       sfaa021 LIKE sfaa_t.sfaa021, #母工單單號
       sfaa022 LIKE sfaa_t.sfaa022, #參考原始單號
       sfaa023 LIKE sfaa_t.sfaa023, #參考原始項次
       sfaa024 LIKE sfaa_t.sfaa024, #參考原始項序
       sfaa025 LIKE sfaa_t.sfaa025, #前工單單號
       sfaa026 LIKE sfaa_t.sfaa026, #料表批號(PBI)
       sfaa027 LIKE sfaa_t.sfaa027, #No Use
       sfaa028 LIKE sfaa_t.sfaa028, #專案編號
       sfaa029 LIKE sfaa_t.sfaa029, #WBS
       sfaa030 LIKE sfaa_t.sfaa030, #活動
       sfaa031 LIKE sfaa_t.sfaa031, #理由碼
       sfaa032 LIKE sfaa_t.sfaa032, #緊急比率
       sfaa033 LIKE sfaa_t.sfaa033, #優先順序
       sfaa034 LIKE sfaa_t.sfaa034, #預計入庫庫位
       sfaa035 LIKE sfaa_t.sfaa035, #預計入庫儲位
       sfaa036 LIKE sfaa_t.sfaa036, #手冊編號
       sfaa037 LIKE sfaa_t.sfaa037, #保稅核准文號
       sfaa038 LIKE sfaa_t.sfaa038, #保稅核銷
       sfaa039 LIKE sfaa_t.sfaa039, #備料已產生
       sfaa040 LIKE sfaa_t.sfaa040, #生產途程已確認
       sfaa041 LIKE sfaa_t.sfaa041, #凍結
       sfaa042 LIKE sfaa_t.sfaa042, #重工
       sfaa043 LIKE sfaa_t.sfaa043, #備置
       sfaa044 LIKE sfaa_t.sfaa044, #FQC
       sfaa045 LIKE sfaa_t.sfaa045, #實際開始發料日
       sfaa046 LIKE sfaa_t.sfaa046, #最後入庫日
       sfaa047 LIKE sfaa_t.sfaa047, #生管結案日
       sfaa048 LIKE sfaa_t.sfaa048, #成本結案日
       sfaa049 LIKE sfaa_t.sfaa049, #已發料套數
       sfaa050 LIKE sfaa_t.sfaa050, #已入庫合格量
       sfaa051 LIKE sfaa_t.sfaa051, #已入庫不合格量
       sfaa052 LIKE sfaa_t.sfaa052, #Bouns
       sfaa053 LIKE sfaa_t.sfaa053, #工單轉入數量
       sfaa054 LIKE sfaa_t.sfaa054, #工單轉出數量
       sfaa055 LIKE sfaa_t.sfaa055, #下線數量
       sfaa056 LIKE sfaa_t.sfaa056, #報廢數量
       sfaa057 LIKE sfaa_t.sfaa057, #委外類型
       sfaa058 LIKE sfaa_t.sfaa058, #參考數量
       sfaa059 LIKE sfaa_t.sfaa059, #預計入庫批號
       sfaa060 LIKE sfaa_t.sfaa060, #參考單位
       sfaa061 LIKE sfaa_t.sfaa061, #製程
       sfaa062 LIKE sfaa_t.sfaa062, #納入APS計算
       sfaa063 LIKE sfaa_t.sfaa063, #來源分批序
       sfaa064 LIKE sfaa_t.sfaa064, #參考原始分批序
       sfaa065 LIKE sfaa_t.sfaa065, #生管結案狀態
       sfaa066 LIKE sfaa_t.sfaa066, #多角流程編號
       sfaa067 LIKE sfaa_t.sfaa067, #多角流程式號
       sfaa068 LIKE sfaa_t.sfaa068, #成本中心
       sfaa069 LIKE sfaa_t.sfaa069, #可供給量
       sfaa070 LIKE sfaa_t.sfaa070, #原始預計完工日期
       sfaa071 LIKE sfaa_t.sfaa071, #齊料套數
       sfaa072 LIKE sfaa_t.sfaa072  #保稅否
END RECORD
#161109-00085#39-e
DEFINE l_sfba003     LIKE sfba_t.sfba003
DEFINE l_sfba004     LIKE sfba_t.sfba004
DEFINE l_has_sets_1  LIKE sfaa_t.sfaa049  #已发齐套数
DEFINE l_can_sets_1  LIKE sfaa_t.sfaa049  #可齐料套数
DEFINE l_string      STRING
DEFINE l_sfba016     LIKE sfba_t.sfba016  #已发量
DEFINE l_is_full     LIKE type_t.chr1     #检查结果：可足套否
DEFINE l_is_gen      LIKE type_t.chr1
DEFINE l_cnt         LIKE type_t.num5

   LET r_success = TRUE
   LET g_need_issue = 'Y'  #需分配数量否
   
   SELECT MAX(seq_1) INTO l_seq_1 FROM asfp310_sfaa
   IF cl_null(l_seq_1) THEN LET l_seq_1 = 0 END IF
   
   #------第一单身------------------------------------------
   IF NOT cl_null(g_master.sfba003) THEN
                  #161109-00085#39-s
                  #LET l_sql1= " SELECT unique sfaa_t.*,sfba003,sfba004 ",
                  LET l_sql1= " SELECT unique 
                                sfaaent,sfaaownid,sfaaowndp,sfaacrtid,sfaacrtdp,
                                sfaacrtdt,sfaamodid,sfaamoddt,sfaacnfid,sfaacnfdt,
                                sfaapstid,sfaapstdt,sfaastus,sfaasite,sfaadocno,
                                sfaadocdt,sfaa001,sfaa002,sfaa003,sfaa004,
                                sfaa005,sfaa006,sfaa007,sfaa008,sfaa009,
                                sfaa010,sfaa011,sfaa012,sfaa013,sfaa014,
                                sfaa015,sfaa016,sfaa017,sfaa018,sfaa019,
                                sfaa020,sfaa021,sfaa022,sfaa023,sfaa024,
                                sfaa025,sfaa026,sfaa027,sfaa028,sfaa029,
                                sfaa030,sfaa031,sfaa032,sfaa033,sfaa034,
                                sfaa035,sfaa036,sfaa037,sfaa038,sfaa039,
                                sfaa040,sfaa041,sfaa042,sfaa043,sfaa044,
                                sfaa045,sfaa046,sfaa047,sfaa048,sfaa049,
                                sfaa050,sfaa051,sfaa052,sfaa053,sfaa054,
                                sfaa055,sfaa056,sfaa057,sfaa058,sfaa059,
                                sfaa060,sfaa061,sfaa062,sfaa063,sfaa064,
                                sfaa065,sfaa066,sfaa067,sfaa068,sfaa069,
                                sfaa070,sfaa071,sfaa072,sfba003,sfba004 ",
                  #161109-00085#39-e
                  "   FROM sfaa_t,sfba_t ",
                  "  WHERE sfaaent  = sfbaent ",
                  "    AND sfaadocno= sfbadocno ",
                  "    AND sfaaent  = ",g_enterprise,
                  "    AND sfaasite = '",g_site,"' ",
                  "    AND sfaastus = 'F' ",
                  "    AND ",g_master.wc CLIPPED,  #工单范围QBE
                  "    AND ",tm.wc3 CLIPPED,  #进阶查询QBE--元件料号sfba006
                  "    AND sfba013 > sfba015 + sfba016 ",   #应发 > 代买+已发
                  "    AND sfba009 = 'N' ",   #非倒扣料
                  "    AND sfba003='",g_master.sfba003,"' "  #作业编号
      IF NOT cl_null(g_master.sfba004) AND g_master.sfba004 != 0 THEN
         LET l_sql1= l_sql1 CLIPPED," AND sfba004='",g_master.sfba004,"' "   #作业序
      END IF
   ELSE        
                  #161109-00085#39-s
                  #LET l_sql1= " SELECT unique sfaa_t.*,'','' FROM sfaa_t,sfba_t ",
                  LET l_sql1= " SELECT unique 
                                sfaaent,sfaaownid,sfaaowndp,sfaacrtid,sfaacrtdp,
                                sfaacrtdt,sfaamodid,sfaamoddt,sfaacnfid,sfaacnfdt,
                                sfaapstid,sfaapstdt,sfaastus,sfaasite,sfaadocno,
                                sfaadocdt,sfaa001,sfaa002,sfaa003,sfaa004,
                                sfaa005,sfaa006,sfaa007,sfaa008,sfaa009,
                                sfaa010,sfaa011,sfaa012,sfaa013,sfaa014,
                                sfaa015,sfaa016,sfaa017,sfaa018,sfaa019,
                                sfaa020,sfaa021,sfaa022,sfaa023,sfaa024,
                                sfaa025,sfaa026,sfaa027,sfaa028,sfaa029,
                                sfaa030,sfaa031,sfaa032,sfaa033,sfaa034,
                                sfaa035,sfaa036,sfaa037,sfaa038,sfaa039,
                                sfaa040,sfaa041,sfaa042,sfaa043,sfaa044,
                                sfaa045,sfaa046,sfaa047,sfaa048,sfaa049,
                                sfaa050,sfaa051,sfaa052,sfaa053,sfaa054,
                                sfaa055,sfaa056,sfaa057,sfaa058,sfaa059,
                                sfaa060,sfaa061,sfaa062,sfaa063,sfaa064,
                                sfaa065,sfaa066,sfaa067,sfaa068,sfaa069,
                                sfaa070,sfaa071,sfaa072,'','' FROM sfaa_t,sfba_t",
                  #161109-00085#39-e
                  "  WHERE sfaaent  = sfbaent ",
                  "    AND sfaadocno= sfbadocno ",
                  "    AND sfaaent  = ",g_enterprise,
                  "    AND sfaasite = '",g_site,"' ",
                  "    AND sfaastus = 'F' ",
                  "    AND ",g_master.wc CLIPPED,  #工单范围QBE
                  "    AND ",tm.wc3 CLIPPED,  #进阶查询QBE--元件料号sfba006
                  "    AND sfba013 > sfba015 + sfba016 ",  #应发 > 代买+已发
                  "    AND sfba009 = 'N' "   #非倒扣料
   END IF
   CASE g_master.priority1
      WHEN '1'  #预计开工日
           LET l_string = "sfaa019"
      WHEN '2'  #预计完工日
           LET l_string = "sfaa020 "
      WHEN '3'  #紧急比率
           LET l_string = "sfaa032 "
      WHEN '4'  #工单单号
           LET l_string = "sfaadocno "
   END CASE
   CASE g_master.priority2
      WHEN '1'  #预计开工日
           LET l_string = l_string CLIPPED,",sfaa019"
      WHEN '2'  #预计完工日
           LET l_string = l_string CLIPPED,",sfaa020 "
      WHEN '3'  #紧急比率
           LET l_string = l_string CLIPPED,",sfaa032 "
      WHEN '4'  #工单单号
           LET l_string = l_string CLIPPED,",sfaadocno "
   END CASE
   CASE g_master.priority3
      WHEN '1'  #预计开工日
           LET l_string = l_string CLIPPED,",sfaa019"
      WHEN '2'  #预计完工日
           LET l_string = l_string CLIPPED,",sfaa020 "
      WHEN '3'  #紧急比率
           LET l_string = l_string CLIPPED,",sfaa032 "
      WHEN '4'  #工单单号
           LET l_string = l_string CLIPPED,",sfaadocno "
   END CASE
   CASE g_master.priority4
      WHEN '1'  #预计开工日
           LET l_string = l_string CLIPPED,",sfaa019"
      WHEN '2'  #预计完工日
           LET l_string = l_string CLIPPED,",sfaa020 "
      WHEN '3'  #紧急比率
           LET l_string = l_string CLIPPED,",sfaa032 "
      WHEN '4'  #工单单号
           LET l_string = l_string CLIPPED,",sfaadocno "
   END CASE
   
   #----若勾选g_master.no_sets：优先满足已发料未齐套工单
   #    则先走发过料的工单（先走可足套的，再走未足套的），再走未发过料的工单（先走可足套的，再走未足套的）
   #    
   #已发过料+可足套的
   LET l_sql = l_sql1 CLIPPED," ORDER BY ",l_string
   PREPARE asfp310_ins_table_p1 FROM l_sql
   DECLARE asfp310_ins_table_c1 CURSOR FOR asfp310_ins_table_p1
   IF g_master.can_sets = 'Y' THEN  #可足套数者优先满足
      LET g_can_sets = 'Y'  #需足套否
   END IF
   #161109-00085#39-s   
   #FOREACH asfp310_ins_table_c1 INTO l_sfaa.*,l_sfba003,l_sfba004
   FOREACH asfp310_ins_table_c1 
   INTO l_sfaa.sfaaent,l_sfaa.sfaaownid,l_sfaa.sfaaowndp,l_sfaa.sfaacrtid,l_sfaa.sfaacrtdp,
        l_sfaa.sfaacrtdt,l_sfaa.sfaamodid,l_sfaa.sfaamoddt,l_sfaa.sfaacnfid,l_sfaa.sfaacnfdt,
        l_sfaa.sfaapstid,l_sfaa.sfaapstdt,l_sfaa.sfaastus,l_sfaa.sfaasite,l_sfaa.sfaadocno,
        l_sfaa.sfaadocdt,l_sfaa.sfaa001,l_sfaa.sfaa002,l_sfaa.sfaa003,l_sfaa.sfaa004,
        l_sfaa.sfaa005,l_sfaa.sfaa006,l_sfaa.sfaa007,l_sfaa.sfaa008,l_sfaa.sfaa009,
        l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013,l_sfaa.sfaa014,
        l_sfaa.sfaa015,l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa018,l_sfaa.sfaa019,
        l_sfaa.sfaa020,l_sfaa.sfaa021,l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa024,
        l_sfaa.sfaa025,l_sfaa.sfaa026,l_sfaa.sfaa027,l_sfaa.sfaa028,l_sfaa.sfaa029,
        l_sfaa.sfaa030,l_sfaa.sfaa031,l_sfaa.sfaa032,l_sfaa.sfaa033,l_sfaa.sfaa034,
        l_sfaa.sfaa035,l_sfaa.sfaa036,l_sfaa.sfaa037,l_sfaa.sfaa038,l_sfaa.sfaa039,
        l_sfaa.sfaa040,l_sfaa.sfaa041,l_sfaa.sfaa042,l_sfaa.sfaa043,l_sfaa.sfaa044,
        l_sfaa.sfaa045,l_sfaa.sfaa046,l_sfaa.sfaa047,l_sfaa.sfaa048,l_sfaa.sfaa049,
        l_sfaa.sfaa050,l_sfaa.sfaa051,l_sfaa.sfaa052,l_sfaa.sfaa053,l_sfaa.sfaa054,
        l_sfaa.sfaa055,l_sfaa.sfaa056,l_sfaa.sfaa057,l_sfaa.sfaa058,l_sfaa.sfaa059,
        l_sfaa.sfaa060,l_sfaa.sfaa061,l_sfaa.sfaa062,l_sfaa.sfaa063,l_sfaa.sfaa064,
        l_sfaa.sfaa065,l_sfaa.sfaa066,l_sfaa.sfaa067,l_sfaa.sfaa068,l_sfaa.sfaa069,
        l_sfaa.sfaa070,l_sfaa.sfaa071,l_sfaa.sfaa072,l_sfba003,l_sfba004
   #161109-00085#39-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      SELECT COUNT(*) INTO l_cnt FROM sfba_t
       WHERE sfbaent   = l_sfaa.sfaaent
         AND sfbadocno = l_sfaa.sfaadocno
         AND (sfba014 IS NULL OR sfba014 = ' ')
      IF l_cnt > 0 THEN
         #工单备料缺少单位信息,请到[工单维护作业asft300]查核
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00403'
         LET g_errparam.extend = l_sfaa.sfaadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      #检查g_master.no_sets：优先满足已发料未齐套工单
      IF g_master.no_sets = 'Y' THEN
         SELECT SUM(sfba016) INTO l_sfba016 FROM sfba_t
          WHERE sfbaent  = l_sfaa.sfaaent
            AND sfbadocno= l_sfaa.sfaadocno
         IF l_sfba016 = 0 THEN
            CONTINUE FOREACH
         END IF
      END IF
      
      LET l_seq_1 = l_seq_1 + 10  #顺序
      
      IF cl_null(l_sfba003) THEN LET l_sfba003 = ' ' END IF #作业
      IF cl_null(l_sfba004) THEN LET l_sfba004 = ' ' END IF #作业序
      
      #先插入sfba，因需判断足套否
      LET g_need_issue = 'Y'  #需分配数量否
      #                           顺序    工单单号          作业编号   作业序     主件料号        特征
      CALL asfp310_ins_table_sfba(l_seq_1,l_sfaa.sfaadocno,l_sfba003,l_sfba004,l_sfaa.sfaa010,l_sfaa.sfaa011)  #产生第二单身asfp310_sfba
         RETURNING r_success,l_is_full,l_is_gen
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      #检查g_master.can_sets：可足套数者优先满足
      IF (g_master.can_sets = 'Y' AND l_is_full='N') OR l_is_gen='N' THEN #未足套，则此工单先不产生 or 备料已足
         DELETE FROM asfp310_sfba WHERE seq_1 = l_seq_1
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         DELETE FROM asfp310_inag WHERE seq_1 = l_seq_1
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         DELETE FROM asfp310_bmea WHERE seq_1 = l_seq_1
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         LET l_seq_1 = l_seq_1 - 10  #顺序
         CONTINUE FOREACH
      END IF
 
      #已发齐套数
      CALL s_asft340_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004,'')
           RETURNING r_success,l_has_sets_1
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      ##可齐料套数
      #CALL asfp310_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004)
      #     RETURNING r_success,l_can_sets_1
      #IF NOT r_success THEN
      #   EXIT FOREACH
      #END IF
      #LET l_can_sets_1 = l_can_sets_1 - l_has_sets_1
      
      #                        锁定        顺序       工单单号      生产料号   预计开工日
      INSERT INTO asfp310_sfaa(lock_1,    seq_1,     sfaadocno_1, sfaa010_1, sfaa019_1,
      #                        预计完工日  部门厂商    生管员        作业编号    作业序
                               sfaa020_1, sfaa017_1, sfaa002_1,   sfba003_1, sfba004_1,
      #                        生产数量    已发套数    已发齐套数    可齐料套数
                               sfaa012_1, sfaa049_1, has_sets_1)#,  can_sets_1)
        VALUES('N',            l_seq_1,        l_sfaa.sfaadocno, l_sfaa.sfaa010, l_sfaa.sfaa019,
               l_sfaa.sfaa020, l_sfaa.sfaa017, l_sfaa.sfaa002,   l_sfba003,      l_sfba004,
               l_sfaa.sfaa012, l_sfaa.sfaa049, l_has_sets_1)#,     l_can_sets_1)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins asfp310_sfaa"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

   END FOREACH
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   #已发过料+不能足套的（剔除可足套后的）
   IF g_master.can_sets = 'Y' THEN
      LET g_can_sets = 'N'  #可足套数者优先满足
      LET l_sql = l_sql1 CLIPPED," AND sfaadocno NOT IN (select unique sfaadocno_1 FROM asfp310_sfaa) ",
                                 " ORDER BY ",l_string
      PREPARE asfp310_ins_table_p12 FROM l_sql
      DECLARE asfp310_ins_table_c12 CURSOR FOR asfp310_ins_table_p12
   #161109-00085#39-s   
   #FOREACH asfp310_ins_table_c12 INTO l_sfaa.*,l_sfba003,l_sfba004
   FOREACH asfp310_ins_table_c12 
   INTO l_sfaa.sfaaent,l_sfaa.sfaaownid,l_sfaa.sfaaowndp,l_sfaa.sfaacrtid,l_sfaa.sfaacrtdp,
        l_sfaa.sfaacrtdt,l_sfaa.sfaamodid,l_sfaa.sfaamoddt,l_sfaa.sfaacnfid,l_sfaa.sfaacnfdt,
        l_sfaa.sfaapstid,l_sfaa.sfaapstdt,l_sfaa.sfaastus,l_sfaa.sfaasite,l_sfaa.sfaadocno,
        l_sfaa.sfaadocdt,l_sfaa.sfaa001,l_sfaa.sfaa002,l_sfaa.sfaa003,l_sfaa.sfaa004,
        l_sfaa.sfaa005,l_sfaa.sfaa006,l_sfaa.sfaa007,l_sfaa.sfaa008,l_sfaa.sfaa009,
        l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013,l_sfaa.sfaa014,
        l_sfaa.sfaa015,l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa018,l_sfaa.sfaa019,
        l_sfaa.sfaa020,l_sfaa.sfaa021,l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa024,
        l_sfaa.sfaa025,l_sfaa.sfaa026,l_sfaa.sfaa027,l_sfaa.sfaa028,l_sfaa.sfaa029,
        l_sfaa.sfaa030,l_sfaa.sfaa031,l_sfaa.sfaa032,l_sfaa.sfaa033,l_sfaa.sfaa034,
        l_sfaa.sfaa035,l_sfaa.sfaa036,l_sfaa.sfaa037,l_sfaa.sfaa038,l_sfaa.sfaa039,
        l_sfaa.sfaa040,l_sfaa.sfaa041,l_sfaa.sfaa042,l_sfaa.sfaa043,l_sfaa.sfaa044,
        l_sfaa.sfaa045,l_sfaa.sfaa046,l_sfaa.sfaa047,l_sfaa.sfaa048,l_sfaa.sfaa049,
        l_sfaa.sfaa050,l_sfaa.sfaa051,l_sfaa.sfaa052,l_sfaa.sfaa053,l_sfaa.sfaa054,
        l_sfaa.sfaa055,l_sfaa.sfaa056,l_sfaa.sfaa057,l_sfaa.sfaa058,l_sfaa.sfaa059,
        l_sfaa.sfaa060,l_sfaa.sfaa061,l_sfaa.sfaa062,l_sfaa.sfaa063,l_sfaa.sfaa064,
        l_sfaa.sfaa065,l_sfaa.sfaa066,l_sfaa.sfaa067,l_sfaa.sfaa068,l_sfaa.sfaa069,
        l_sfaa.sfaa070,l_sfaa.sfaa071,l_sfaa.sfaa072,l_sfba003,l_sfba004
   #161109-00085#39-e
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #检查g_master.no_sets：优先满足已发料未齐套工单
         IF g_master.no_sets = 'Y' THEN
            SELECT SUM(sfba016) INTO l_sfba016 FROM sfba_t
             WHERE sfbaent  = l_sfaa.sfaaent
               AND sfbadocno= l_sfaa.sfaadocno
            IF l_sfba016 = 0 THEN
               CONTINUE FOREACH
            END IF
         END IF
      
         LET l_seq_1 = l_seq_1 + 10  #顺序
         
         IF cl_null(l_sfba003) THEN LET l_sfba003 = ' ' END IF #作业
         IF cl_null(l_sfba004) THEN LET l_sfba004 = ' ' END IF #作业序
         
         #先插入sfba，因需判断足套否
         #                           顺序    工单单号          作业编号   作业序     主件料号        特征
         CALL asfp310_ins_table_sfba(l_seq_1,l_sfaa.sfaadocno,l_sfba003,l_sfba004,l_sfaa.sfaa010,l_sfaa.sfaa011)  #产生第二单身asfp310_sfba
            RETURNING r_success,l_is_full,l_is_gen
         IF NOT r_success THEN
            EXIT FOREACH
         END IF

         IF l_is_gen='N' THEN #备料已足
            DELETE FROM asfp310_sfba WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_inag WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_bmea WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            LET l_seq_1 = l_seq_1 - 10  #顺序
            CONTINUE FOREACH
         END IF
 
       
         #已发齐套数
         CALL s_asft340_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004,'')
              RETURNING r_success,l_has_sets_1
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
       
         ##可齐料套数
         #CALL asfp310_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004)
         #     RETURNING r_success,l_can_sets_1
         #IF NOT r_success THEN
         #   EXIT FOREACH
         #END IF
         #LET l_can_sets_1 = l_can_sets_1 - l_has_sets_1
         
         #                        锁定        顺序       工单单号      生产料号   预计开工日
         INSERT INTO asfp310_sfaa(lock_1,    seq_1,     sfaadocno_1, sfaa010_1, sfaa019_1,
         #                        预计完工日  部门厂商    生管员        作业编号    作业序
                                  sfaa020_1, sfaa017_1, sfaa002_1,   sfba003_1, sfba004_1,
         #                        生产数量    已发套数    已发齐套数    可齐料套数
                                  sfaa012_1, sfaa049_1, has_sets_1)#,  can_sets_1)
           VALUES('N',            l_seq_1,        l_sfaa.sfaadocno, l_sfaa.sfaa010, l_sfaa.sfaa019,
                  l_sfaa.sfaa020, l_sfaa.sfaa017, l_sfaa.sfaa002,   l_sfba003,      l_sfba004,
                  l_sfaa.sfaa012, l_sfaa.sfaa049, l_has_sets_1)#,     l_can_sets_1)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins asfp310_sfaa"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH
   END IF
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   #----未发过料的工单
   #未发过料（经过上面，都已剔除发过料，剩余未发过料的）+可足套的
   IF g_master.no_sets = 'Y' THEN
      IF g_master.can_sets = 'Y' THEN  #可足套数者优先满足
         LET g_can_sets = 'Y'
      END IF
      LET l_sql = l_sql1 CLIPPED," AND sfaadocno NOT IN (select unique sfaadocno_1 FROM asfp310_sfaa) ",
                                 " ORDER BY ",l_string
      PREPARE asfp310_ins_table_p2 FROM l_sql
      DECLARE asfp310_ins_table_c2 CURSOR FOR asfp310_ins_table_p2
   #161109-00085#39-s   
   #FOREACH asfp310_ins_table_c2 INTO l_sfaa.*,l_sfba003,l_sfba004
   FOREACH asfp310_ins_table_c2 
   INTO l_sfaa.sfaaent,l_sfaa.sfaaownid,l_sfaa.sfaaowndp,l_sfaa.sfaacrtid,l_sfaa.sfaacrtdp,
        l_sfaa.sfaacrtdt,l_sfaa.sfaamodid,l_sfaa.sfaamoddt,l_sfaa.sfaacnfid,l_sfaa.sfaacnfdt,
        l_sfaa.sfaapstid,l_sfaa.sfaapstdt,l_sfaa.sfaastus,l_sfaa.sfaasite,l_sfaa.sfaadocno,
        l_sfaa.sfaadocdt,l_sfaa.sfaa001,l_sfaa.sfaa002,l_sfaa.sfaa003,l_sfaa.sfaa004,
        l_sfaa.sfaa005,l_sfaa.sfaa006,l_sfaa.sfaa007,l_sfaa.sfaa008,l_sfaa.sfaa009,
        l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013,l_sfaa.sfaa014,
        l_sfaa.sfaa015,l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa018,l_sfaa.sfaa019,
        l_sfaa.sfaa020,l_sfaa.sfaa021,l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa024,
        l_sfaa.sfaa025,l_sfaa.sfaa026,l_sfaa.sfaa027,l_sfaa.sfaa028,l_sfaa.sfaa029,
        l_sfaa.sfaa030,l_sfaa.sfaa031,l_sfaa.sfaa032,l_sfaa.sfaa033,l_sfaa.sfaa034,
        l_sfaa.sfaa035,l_sfaa.sfaa036,l_sfaa.sfaa037,l_sfaa.sfaa038,l_sfaa.sfaa039,
        l_sfaa.sfaa040,l_sfaa.sfaa041,l_sfaa.sfaa042,l_sfaa.sfaa043,l_sfaa.sfaa044,
        l_sfaa.sfaa045,l_sfaa.sfaa046,l_sfaa.sfaa047,l_sfaa.sfaa048,l_sfaa.sfaa049,
        l_sfaa.sfaa050,l_sfaa.sfaa051,l_sfaa.sfaa052,l_sfaa.sfaa053,l_sfaa.sfaa054,
        l_sfaa.sfaa055,l_sfaa.sfaa056,l_sfaa.sfaa057,l_sfaa.sfaa058,l_sfaa.sfaa059,
        l_sfaa.sfaa060,l_sfaa.sfaa061,l_sfaa.sfaa062,l_sfaa.sfaa063,l_sfaa.sfaa064,
        l_sfaa.sfaa065,l_sfaa.sfaa066,l_sfaa.sfaa067,l_sfaa.sfaa068,l_sfaa.sfaa069,
        l_sfaa.sfaa070,l_sfaa.sfaa071,l_sfaa.sfaa072,l_sfba003,l_sfba004
   #161109-00085#39-e
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         LET l_seq_1 = l_seq_1 + 10  #顺序
         
         IF cl_null(l_sfba003) THEN LET l_sfba003 = ' ' END IF #作业
         IF cl_null(l_sfba004) THEN LET l_sfba004 = ' ' END IF #作业序
         
         #先插入sfba，因需判断足套否
         #                           顺序    工单单号          作业编号   作业序     主件料号        特征
         CALL asfp310_ins_table_sfba(l_seq_1,l_sfaa.sfaadocno,l_sfba003,l_sfba004,l_sfaa.sfaa010,l_sfaa.sfaa011)  #产生第二单身asfp310_sfba
            RETURNING r_success,l_is_full,l_is_gen
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         
         #检查g_master.can_sets：可足套数者优先满足
         IF (g_master.can_sets = 'Y' AND l_is_full='N') OR l_is_gen='N' THEN #未足套，则此工单先不产生 or 备料已足
            DELETE FROM asfp310_sfba WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_inag WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_bmea WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            LET l_seq_1 = l_seq_1 - 10  #顺序
            CONTINUE FOREACH
         END IF
       
         #已发齐套数
         CALL s_asft340_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004,'')
              RETURNING r_success,l_has_sets_1
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
       
         ##可齐料套数
         #CALL asfp310_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004)
         #     RETURNING r_success,l_can_sets_1
         #IF NOT r_success THEN
         #   EXIT FOREACH
         #END IF
         #LET l_can_sets_1 = l_can_sets_1 - l_has_sets_1
         
         #                        锁定        顺序       工单单号      生产料号   预计开工日
         INSERT INTO asfp310_sfaa(lock_1,    seq_1,     sfaadocno_1, sfaa010_1, sfaa019_1,
         #                        预计完工日  部门厂商    生管员        作业编号    作业序
                                  sfaa020_1, sfaa017_1, sfaa002_1,   sfba003_1, sfba004_1,
         #                        生产数量    已发套数    已发齐套数    可齐料套数
                                  sfaa012_1, sfaa049_1, has_sets_1)#,  can_sets_1)
           VALUES('N',            l_seq_1,        l_sfaa.sfaadocno, l_sfaa.sfaa010, l_sfaa.sfaa019,
                  l_sfaa.sfaa020, l_sfaa.sfaa017, l_sfaa.sfaa002,   l_sfba003,      l_sfba004,
                  l_sfaa.sfaa012, l_sfaa.sfaa049, l_has_sets_1)#,     l_can_sets_1)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins asfp310_sfaa"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF

      END FOREACH
   END IF
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   #未发过料+不能足套的（剔除可足套后的）
   IF g_master.can_sets = 'Y' THEN
      LET g_can_sets = 'N'  #可足套数者优先满足
      LET l_sql = l_sql1 CLIPPED," AND sfaadocno NOT IN (select unique sfaadocno_1 FROM asfp310_sfaa) ",
                                 " ORDER BY ",l_string
      PREPARE asfp310_ins_table_p22 FROM l_sql
      DECLARE asfp310_ins_table_c22 CURSOR FOR asfp310_ins_table_p22
   #161109-00085#39-s   
   #FOREACH asfp310_ins_table_c22 INTO l_sfaa.*,l_sfba003,l_sfba004
   FOREACH asfp310_ins_table_c22 
   INTO l_sfaa.sfaaent,l_sfaa.sfaaownid,l_sfaa.sfaaowndp,l_sfaa.sfaacrtid,l_sfaa.sfaacrtdp,
        l_sfaa.sfaacrtdt,l_sfaa.sfaamodid,l_sfaa.sfaamoddt,l_sfaa.sfaacnfid,l_sfaa.sfaacnfdt,
        l_sfaa.sfaapstid,l_sfaa.sfaapstdt,l_sfaa.sfaastus,l_sfaa.sfaasite,l_sfaa.sfaadocno,
        l_sfaa.sfaadocdt,l_sfaa.sfaa001,l_sfaa.sfaa002,l_sfaa.sfaa003,l_sfaa.sfaa004,
        l_sfaa.sfaa005,l_sfaa.sfaa006,l_sfaa.sfaa007,l_sfaa.sfaa008,l_sfaa.sfaa009,
        l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013,l_sfaa.sfaa014,
        l_sfaa.sfaa015,l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa018,l_sfaa.sfaa019,
        l_sfaa.sfaa020,l_sfaa.sfaa021,l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa024,
        l_sfaa.sfaa025,l_sfaa.sfaa026,l_sfaa.sfaa027,l_sfaa.sfaa028,l_sfaa.sfaa029,
        l_sfaa.sfaa030,l_sfaa.sfaa031,l_sfaa.sfaa032,l_sfaa.sfaa033,l_sfaa.sfaa034,
        l_sfaa.sfaa035,l_sfaa.sfaa036,l_sfaa.sfaa037,l_sfaa.sfaa038,l_sfaa.sfaa039,
        l_sfaa.sfaa040,l_sfaa.sfaa041,l_sfaa.sfaa042,l_sfaa.sfaa043,l_sfaa.sfaa044,
        l_sfaa.sfaa045,l_sfaa.sfaa046,l_sfaa.sfaa047,l_sfaa.sfaa048,l_sfaa.sfaa049,
        l_sfaa.sfaa050,l_sfaa.sfaa051,l_sfaa.sfaa052,l_sfaa.sfaa053,l_sfaa.sfaa054,
        l_sfaa.sfaa055,l_sfaa.sfaa056,l_sfaa.sfaa057,l_sfaa.sfaa058,l_sfaa.sfaa059,
        l_sfaa.sfaa060,l_sfaa.sfaa061,l_sfaa.sfaa062,l_sfaa.sfaa063,l_sfaa.sfaa064,
        l_sfaa.sfaa065,l_sfaa.sfaa066,l_sfaa.sfaa067,l_sfaa.sfaa068,l_sfaa.sfaa069,
        l_sfaa.sfaa070,l_sfaa.sfaa071,l_sfaa.sfaa072,l_sfba003,l_sfba004
   #161109-00085#39-e      
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         

         LET l_seq_1 = l_seq_1 + 10  #顺序
         
         IF cl_null(l_sfba003) THEN LET l_sfba003 = ' ' END IF #作业
         IF cl_null(l_sfba004) THEN LET l_sfba004 = ' ' END IF #作业序
         
         #先插入sfba，因需判断足套否
         #                           顺序    工单单号          作业编号   作业序     主件料号        特征
         CALL asfp310_ins_table_sfba(l_seq_1,l_sfaa.sfaadocno,l_sfba003,l_sfba004,l_sfaa.sfaa010,l_sfaa.sfaa011)  #产生第二单身asfp310_sfba
            RETURNING r_success,l_is_full,l_is_gen
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
       
         IF l_is_gen='N' THEN #备料已足
            DELETE FROM asfp310_sfba WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_inag WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_bmea WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            LET l_seq_1 = l_seq_1 - 10  #顺序
            CONTINUE FOREACH
         END IF
 
         #已发齐套数
         CALL s_asft340_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004,'')
              RETURNING r_success,l_has_sets_1
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
       
         ##可齐料套数
         #CALL asfp310_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004)
         #     RETURNING r_success,l_can_sets_1
         #IF NOT r_success THEN
         #   EXIT FOREACH
         #END IF
         #LET l_can_sets_1 = l_can_sets_1 - l_has_sets_1
         
         #                        锁定        顺序       工单单号      生产料号   预计开工日
         INSERT INTO asfp310_sfaa(lock_1,    seq_1,     sfaadocno_1, sfaa010_1, sfaa019_1,
         #                        预计完工日  部门厂商    生管员        作业编号    作业序
                                  sfaa020_1, sfaa017_1, sfaa002_1,   sfba003_1, sfba004_1,
         #                        生产数量    已发套数    已发齐套数    可齐料套数
                                  sfaa012_1, sfaa049_1, has_sets_1)#,  can_sets_1)
           VALUES('N',            l_seq_1,        l_sfaa.sfaadocno, l_sfaa.sfaa010, l_sfaa.sfaa019,
                  l_sfaa.sfaa020, l_sfaa.sfaa017, l_sfaa.sfaa002,   l_sfba003,      l_sfba004,
                  l_sfaa.sfaa012, l_sfaa.sfaa049, l_has_sets_1)#,     l_can_sets_1)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins asfp310_sfaa"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH
   END IF
   
   RETURN r_success
END FUNCTION
#重新分配
PRIVATE FUNCTION asfp310_redistribution()
DEFINE l_count   LIKE type_t.num5
DEFINE l_sql     STRING
DEFINE l_sfba    RECORD
                 seq_1       LIKE type_t.num5,      #顺序
                 sfaadocno_1 LIKE sfaa_t.sfaadocno, #工单单号
                 seq_2       LIKE type_t.num5,      #项次
                 seq1_2      LIKE type_t.num5,      #项序
                 sfba002_2   LIKE sfba_t.sfba002,   #部位
                 sfba003_2   LIKE sfba_t.sfba003,   #作业
                 sfba004_2   LIKE sfba_t.sfba004,   #作业序
                 sfba006_2   LIKE sfba_t.sfba006,   #发料料号
                 sfba021_2   LIKE sfba_t.sfba021,   #产品特征
                 sfba014_2   LIKE sfba_t.sfba014,   #单位
                 sfba013_2   LIKE sfba_t.sfba013,   #应发量
                 no_issue_2  LIKE sfba_t.sfba016,   #未发数量
                 sfba001_2   LIKE sfba_t.sfba001,   #上阶料号
                 sfaa010     LIKE sfaa_t.sfaa010,   #主件料号
                 sfaa011     LIKE sfaa_t.sfaa011,   #特性
                 imaf053     LIKE imaf_t.imaf053,
                 imaf054     LIKE imaf_t.imaf054
                 END RECORD
DEFINE l_success LIKE type_t.num5

   IF g_rec_b_sfaa = 0 THEN
      #无可分配的数据，请先选择数据
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00244'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF
   
   IF NOT cl_ask_confirm('asf-00210') THEN
      RETURN
   END IF
      
   CALL s_transaction_begin()

   #删除未锁定的分配资料
   UPDATE asfp310_sfba SET issue_qty_2 = 0,  #发料量
                           inag008_2   = 0,  #库存可用量
                           inan010_2   = 0   #在捡量
    WHERE seq_1 IN (select seq_1 from asfp310_sfaa where lock_1 = 'N')
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'upd asfp310_sfba'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   DELETE FROM asfp310_inag
    WHERE seq_1 IN (select seq_1 from asfp310_sfaa where lock_1 = 'N')
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'del asfp310_inag'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   DELETE FROM asfp310_bmea
    WHERE seq_1 IN (select seq_1 from asfp310_sfaa where lock_1 = 'N')
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'del asfp310_bmea'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #分配资料
   LET l_sql = "SELECT asfp310_sfaa.seq_1,    asfp310_sfaa.sfaadocno_1,asfp310_sfba.seq_2,asfp310_sfba.seq1_2, ",
               "       asfp310_sfba.sfba002_2, asfp310_sfba.sfba003_2, asfp310_sfba.sfba004_2, ",
               "       asfp310_sfba.sfba006_2, asfp310_sfba.sfba021_2, asfp310_sfba.sfba014_2, ",
               "       asfp310_sfba.sfba013_2, asfp310_sfba.no_issue_2,asfp310_sfba.sfba001_2, ",
               "       sfaa_t.sfaa010, sfaa_t.sfaa011,  imaf_t.imaf053,  imaf_t.imaf054 ",
               "  FROM asfp310_sfba,asfp310_sfaa,sfaa_t,imaf_t ",
               " WHERE asfp310_sfba.seq_1 = asfp310_sfaa.seq_1 ",
               "   AND sfaa_t.sfaaent     = ",g_enterprise,
               "   AND sfaa_t.sfaadocno   = asfp310_sfaa.sfaadocno_1 ",
               "   AND imaf_t.imafent     = ",g_enterprise,
               "   AND imaf_t.imafsite    ='",g_site,"' ",
               "   AND imaf_t.imaf001     = asfp310_sfba.sfba006_2 ",  #料件
               "   AND asfp310_sfaa.lock_1 = 'N' "
   PREPARE asfp310_redistribution_p FROM l_sql
   DECLARE asfp310_redistribution_c CURSOR FOR asfp310_redistribution_p  
   FOREACH asfp310_redistribution_c INTO l_sfba.*

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      
      #庫存多單位
      IF cl_null(l_sfba.imaf054) THEN
         LET l_sfba.imaf054 = 'N'
         IF cl_null(l_sfba.imaf053) THEN  #據點庫存單位
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00476'
            LET g_errparam.extend = l_sfba.sfba006_2
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')
            RETURN
         END IF
      END IF
   
      LET g_no_issue_2  =  l_sfba.no_issue_2 #未发数量
      LET g_issue_qty_2 =  0 #发料量
      LET g_inag008_2   =  0 #库存可用量
      LET g_inan010_2   =  0 #在捡量
      
      #------产生主要用料库存单身（同时累加g_inag008_2，g_inan010_2）------
      #                           顺序          工单单号            项次         项序           元件料号         产品特征          单位
      CALL asfp310_ins_table_inag(l_sfba.seq_1,l_sfba.sfaadocno_1,l_sfba.seq_2,l_sfba.seq1_2,l_sfba.sfba006_2,l_sfba.sfba021_2,l_sfba.sfba014_2,l_sfba.imaf053,l_sfba.imaf054)
         RETURNING l_success
      IF NOT l_success THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF

      IF l_sfba.seq1_2 = 0 THEN  #项序为0，非0的为已经被取替代的料，不可能再有替代资料
         #------产生取替代料单身（同时累加g_inag008_2，g_inan010_2）------
         #                           顺序          工单单号            项次         项序
         CALL asfp310_ins_table_bmea(l_sfba.seq_1,l_sfba.sfaadocno_1,l_sfba.seq_2,l_sfba.seq1_2,
         #                           主件料号        特性           元件料号          部位             作业编号          作业序            产品特征          单位             应发量           上阶料
                                     l_sfba.sfaa010,l_sfba.sfaa011,l_sfba.sfba006_2,l_sfba.sfba002_2,l_sfba.sfba003_2,l_sfba.sfba004_2,l_sfba.sfba021_2,l_sfba.sfba014_2,l_sfba.sfba013_2,l_sfba.sfba001_2)
            RETURNING l_success
         IF NOT l_success THEN
            CALL s_transaction_end('N','0')
            RETURN
         END IF
      END IF

      UPDATE asfp310_sfba SET issue_qty_2= g_issue_qty_2,  #发料量
                              inag008_2  = g_inag008_2,    #库存可用量
                              inan010_2  = g_inan010_2     #在捡量
       WHERE seq_1 = l_sfba.seq_1
         AND seq_2 = l_sfba.seq_2
         AND seq1_2= l_sfba.seq1_2
      IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd asfp310_sfba err'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         CALL s_transaction_end('N','0')
         RETURN
      END IF
   END FOREACH


   CALL s_transaction_end('Y','0')
   
   #资料显示
   CALL asfp310_b_fill()
END FUNCTION
#产生asfp310_bmea
#取替代料单身
PRIVATE FUNCTION asfp310_ins_table_bmea(p_seq,p_sfaadocno,p_sfbaseq,p_sfbaseq1,p_sfaa010,p_sfaa011,p_sfba006,p_sfba002,p_sfba003,p_sfba004,p_sfba021,p_sfba014,p_no_issue_2,p_sfba001)
DEFINE p_seq            LIKE type_t.num5     #顺序
DEFINE p_sfaadocno      LIKE sfaa_t.sfaadocno #工单单号 用于判断参数D-MFG-0050工單指定發料庫儲，發料時允許修改
DEFINE p_sfbaseq        LIKE sfba_t.sfbaseq  #项次
DEFINE p_sfbaseq1       LIKE sfba_t.sfbaseq1 #项序
DEFINE p_sfaa010        LIKE sfaa_t.sfaa010  #主件料号
DEFINE p_sfaa011        LIKE sfaa_t.sfaa011  #特性
DEFINE p_sfba006        LIKE sfba_t.sfba006  #元件料号
DEFINE p_sfba002        LIKE sfba_t.sfba002  #部位
DEFINE p_sfba003        LIKE sfba_t.sfba003  #作业编号
DEFINE p_sfba004        LIKE sfba_t.sfba004  #作业序
DEFINE p_sfba021        LIKE sfba_t.sfba021  #产品特征
DEFINE p_sfba014        LIKE sfba_t.sfba014  #单位--元件备料
DEFINE p_no_issue_2     LIKE inan_t.inan010  #此笔备料总需求量
DEFINE p_sfba001        LIKE sfba_t.sfba001  #备料档的上阶料号
DEFINE r_success        LIKE type_t.num5
DEFINE l_sql            STRING
#161109-00085#39-s
#DEFINE l_bmea           RECORD LIKE bmea_t.*
DEFINE l_bmea RECORD  #取替代料檔
       bmeaent LIKE bmea_t.bmeaent, #企業編號
       bmeasite LIKE bmea_t.bmeasite, #營運據點
       bmea001 LIKE bmea_t.bmea001, #主件料號
       bmea002 LIKE bmea_t.bmea002, #特性
       bmea003 LIKE bmea_t.bmea003, #元件料號
       bmea004 LIKE bmea_t.bmea004, #部位
       bmea005 LIKE bmea_t.bmea005, #作業
       bmea006 LIKE bmea_t.bmea006, #製程式
       bmea007 LIKE bmea_t.bmea007, #取代/替代
       bmea008 LIKE bmea_t.bmea008, #取替代料件編號
       bmea009 LIKE bmea_t.bmea009, #生效日期
       bmea010 LIKE bmea_t.bmea010, #失效日期
       bmea011 LIKE bmea_t.bmea011, #取替代量
       bmea012 LIKE bmea_t.bmea012, #元件底數
       bmea013 LIKE bmea_t.bmea013, #替代料發料單位
       bmea014 LIKE bmea_t.bmea014, #限定客戶
       bmea015 LIKE bmea_t.bmea015, #優先順序
       bmea016 LIKE bmea_t.bmea016, #替代方式
       bmea017 LIKE bmea_t.bmea017, #部份替代上限比率
       bmea018 LIKE bmea_t.bmea018, #參照研發中心
       bmea019 LIKE bmea_t.bmea019, #產品特徵
       bmea020 LIKE bmea_t.bmea020  #保稅否
END RECORD
#161109-00085#39-e
#161109-00085#39-s
#DEFINE l_inag           RECORD LIKE inag_t.*
DEFINE l_inag RECORD  #庫存明細檔
       inagent LIKE inag_t.inagent, #企業編號
       inagsite LIKE inag_t.inagsite, #營運據點
       inag001 LIKE inag_t.inag001, #料件編號
       inag002 LIKE inag_t.inag002, #產品特徵
       inag003 LIKE inag_t.inag003, #庫存管理特徵
       inag004 LIKE inag_t.inag004, #庫位編號
       inag005 LIKE inag_t.inag005, #儲位編號
       inag006 LIKE inag_t.inag006, #批號
       inag007 LIKE inag_t.inag007, #庫存單位
       inag008 LIKE inag_t.inag008, #帳面庫存數量
       inag009 LIKE inag_t.inag009, #實際庫存數量
       inag010 LIKE inag_t.inag010, #庫存可用否
       inag011 LIKE inag_t.inag011, #MRP可用否
       inag012 LIKE inag_t.inag012, #成本庫否
       inag013 LIKE inag_t.inag013, #揀貨優先序
       inag014 LIKE inag_t.inag014, #最近一次盤點日期
       inag015 LIKE inag_t.inag015, #最後異動日期
       inag016 LIKE inag_t.inag016, #呆滯日期
       inag017 LIKE inag_t.inag017, #第一次入庫日期
       inag018 LIKE inag_t.inag018, #No Use
       inag019 LIKE inag_t.inag019, #留置否
       inag020 LIKE inag_t.inag020, #留置原因
       inag021 LIKE inag_t.inag021, #備置數量
       inag022 LIKE inag_t.inag022, #No Use
       inag023 LIKE inag_t.inag023, #Tag二進位碼
       inag024 LIKE inag_t.inag024, #參考單位
       inag025 LIKE inag_t.inag025, #參考數量
       inag026 LIKE inag_t.inag026, #最近一次檢驗日期
       inag027 LIKE inag_t.inag027, #下次檢驗日期
       inag028 LIKE inag_t.inag028, #留置日期
       inag029 LIKE inag_t.inag029, #留置人員
       inag030 LIKE inag_t.inag030, #留置部門
       inag031 LIKE inag_t.inag031, #留置單號
       inag032 LIKE inag_t.inag032, #基礎單位
       inag033 LIKE inag_t.inag033  #基礎單位數量
END RECORD
#161109-00085#39-e
DEFINE l_inan010        LIKE inan_t.inan010  #在捡量
DEFINE l_replace_rate_4 LIKE sfdd_t.sfdd002  #替代率
DEFINE l_issue_qty_4    LIKE inan_t.inan010  #发料量
DEFINE l_imaf053        LIKE imaf_t.imaf053  #据点库存单位
DEFINE l_imaf054        LIKE imaf_t.imaf054  #库存多单位
DEFINE l_bmba010        LIKE bmba_t.bmba010  #bom元件单身
DEFINE l_can_qty        LIKE inan_t.inan010  #可发量
DEFINE l_has_qty        LIKE inan_t.inan010  #本单据已占用的量
DEFINE l_max_qty        LIKE inan_t.inan010  #最大可被取替代量
DEFINE l_cnt            LIKE type_t.num5
DEFINE l_success        LIKE type_t.num5
DEFINE l_sfba019  LIKE sfba_t.sfba019  #指定库位
DEFINE l_sfba020  LIKE sfba_t.sfba020  #指定储位
DEFINE l_sfba029  LIKE sfba_t.sfba029  #指定批号
DEFINE l_sfba030  LIKE sfba_t.sfba030  #指定库存管理特征
DEFINE l_ooca001  LIKE ooca_t.ooca001  #170313-00003#1 add 记录单位

   LET r_success = TRUE

   LET l_issue_qty_4 = 0   #160411-00020#1 add
   #170313-00003#1 mark-S
#   #检查参数D-MFG-0050工單指定發料庫儲，發料時允許修改
#   CALL s_aooi200_get_slip(p_sfaadocno) RETURNING l_success,g_ooba002
#   IF NOT l_success THEN
#      LET r_success = FALSE
#      RETURN r_success
#   END IF
#   CALL cl_get_doc_para(g_enterprise,g_site,g_ooba002,'D-MFG-0050')
#      RETURNING g_para  #工單指定發料庫儲，發料時允許修改
   #170313-00003#1 mark-E
   IF g_para = 'N' THEN
      SELECT sfba019,sfba020,sfba029,sfba030
        INTO l_sfba019,l_sfba020,l_sfba029,l_sfba030
        FROM sfba_t
       WHERE sfbaent  = g_enterprise
         AND sfbadocno= p_sfaadocno
         AND sfbaseq  = p_sfbaseq
         AND sfbaseq1 = p_sfbaseq1
   END IF
      
   #需要调用以下元件去抓取一下bom单位，因为工单备料档可以修改单位
   #p_sfba001 可以为空 工单备料可能自行输入不存在于bom中的料件，此料件也可能被取替代，abmm211中主件可以为ALL
   #回传的bmba010也可能为空
   CALL asfp310_get_bmba010(p_sfba001,p_sfaa011,p_sfba006,p_sfba002,p_sfba003,p_sfba004)
      RETURNING l_success,l_bmba010  #bom元件单位
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   IF cl_null(l_bmba010) THEN
      LET l_bmba010=p_sfba014
   END IF
      
   
   #161109-00085#39-s
   #LET l_sql = " SELECT bmea_t.*,imaf053,imaf054 FROM bmea_t,imaf_t ",   
   LET l_sql = " SELECT bmeaent,bmeasite,bmea001,bmea002,bmea003,
                        bmea004,bmea005,bmea006,bmea007,bmea008,
                        bmea009,bmea010,bmea011,bmea012,bmea013,
                        bmea014,bmea015,bmea016,bmea017,bmea018,
                        bmea019,bmea020,
                        imaf053,imaf054 FROM bmea_t,imaf_t ",
   #161109-00085#39-e
               "  WHERE bmeaent = imafent ",
               "    AND bmeasite= imafsite",
               "    AND bmea008 = imaf001 ",  #替代料件
               "    AND bmeaent = ",g_enterprise,
               "    AND bmeasite='",g_site,"' ",
               "    AND ( ",
               "         (bmea001 ='",p_sfba001,"' ",  #p_sfaa010 主件料号
               "          AND bmea002 ='",p_sfaa011,"' ",  #特性
               "          AND bmea003 ='",p_sfba006,"' ",  #元件料号
               "          AND bmea004 ='",p_sfba002,"' ",  #部位
               "          AND bmea005 ='",p_sfba003,"' ",  #作业
               "          AND bmea006 ='",p_sfba004,"' ) ",  #作业序
               "         OR ",
               "         (bmea001 ='ALL' AND bmea003 ='",p_sfba006,"') ", #主件料号，元件料号
               "        )",
               "    AND bmea009 <= '",g_today,"' ",
               "    AND (bmea010 > '",g_today,"' OR bmea010 IS NULL) "
   PREPARE asfp310_ins_table_p4 FROM l_sql
   DECLARE asfp310_ins_table_c4 CURSOR FOR asfp310_ins_table_p4
   #170313-00003#1 add-S 声明放到foreach外
   #取替代料单身--获取取替代料的库存信息
   LET l_sql = " SELECT inagent,inagsite,inag001,inag002,inag003,
                        inag004,inag005,inag006,inag007,inag008,
                        inag009,inag010,inag011,inag012,inag013,
                        inag014,inag015,inag016,inag017,inag018,
                        inag019,inag020,inag021,inag022,inag023,
                        inag024,inag025,inag026,inag027,inag028,
                        inag029,inag030,inag031,inag032,inag033,inan010 ",
               " FROM inag_t LEFT OUTER JOIN inan_t ON inagent = inanent AND inagsite= inansite AND inag001 = inan001 AND inag002 = inan002 AND inag003 = inan003 AND inag004 = inan004 AND inag005 = inan005 AND inag006 = inan006 AND inag007 = inan007 ",
               "    AND inan000 = '1' ",
               "  WHERE inagent = ",g_enterprise,
               "    AND inagsite='",g_site,"' ",
               "    AND inag001 =? ",  #料件
               "    AND inag002 =? ",  #产品特征
               "    AND inag008 >= 0 ",   #库存量大于0   可用库存等于0也可以发料
               "    AND (inag019 = 'N' OR inag019 IS NULL) ", #未留置的
               "    AND inag007 = ? "  #不做多单位管理，只能从据点库存单位中出货imaf053;做库存单位管理，出货只能从单据指定单位出bmea013;
   
   #检查参数D-MFG-0050工單指定發料庫儲，發料時允許修改
   IF NOT cl_null(l_sfba019) AND g_para = 'N' THEN
      LET l_sql = l_sql CLIPPED," AND inag004 = '",l_sfba019,"' "  #只能从工单指定库位发料
   END IF
   IF NOT cl_null(l_sfba020) AND g_para = 'N' THEN
      LET l_sql = l_sql CLIPPED," AND inag005 = '",l_sfba020,"' "  #只能从工单指定储位发料
   END IF
   IF NOT cl_null(l_sfba029) AND g_para = 'N' THEN
      LET l_sql = l_sql CLIPPED," AND inag006 = '",l_sfba029,"' "  #只能从工单指定批号发料
   END IF
   IF NOT cl_null(l_sfba030) AND g_para = 'N' THEN
      LET l_sql = l_sql CLIPPED," AND inag003 = '",l_sfba030,"' "  #只能从工单指定库存管理特征发料
   END IF
    
   PREPARE asfp310_ins_table_p32 FROM l_sql
   DECLARE asfp310_ins_table_c32 CURSOR FOR asfp310_ins_table_p32
   
   LET l_sql = " INSERT INTO asfp310_bmea(seq_1         ,seq_2         ,seq1_2        ,bmea007_4     ,bmea008_4     ,bmea019_4,  ",
         #                                替代率         替代方式        替代上限比率     库位           储位                           
        "                                 replace_rate_4,bmea016_4     ,bmea017_4     ,inag004_4     ,inag005_4     ,                ",
         #                                批号           库存管理特征    单位            现有库存数量    库存在捡量                      
         "                                inag006_4     ,inag003_4     ,inag007_4     ,inag008_4     ,inan010_4     ,                ",
         #                                发料量                                                                                      
        "                                 issue_qty_4)                                                                               ",
         "  VALUES(?,?,?,?,?,?,",
         "         ?,?,?,?,?,",
         "         ?,?,?,?,?,",
         "         ?)"
   PREPARE ins_asfp310_bmea FROM l_sql
   #170313-00003#1 add-E
   #取替代料单身--获取取替代料
   #OPEN asfp310_ins_table_c4 USING p_sfaa010,p_sfaa011,p_sfba006,p_sfba002,p_sfba003,p_sfba004,p_sfba006  #主件料号,特性,元件料号,部位,作业编号,作业序,元件料号
   #161109-00085#39-s
   #FOREACH asfp310_ins_table_c4 INTO l_bmea.*,l_imaf053,l_imaf054
   FOREACH asfp310_ins_table_c4 
   INTO l_bmea.bmeaent,l_bmea.bmeasite,l_bmea.bmea001,l_bmea.bmea002,l_bmea.bmea003,
        l_bmea.bmea004,l_bmea.bmea005,l_bmea.bmea006,l_bmea.bmea007,l_bmea.bmea008,
        l_bmea.bmea009,l_bmea.bmea010,l_bmea.bmea011,l_bmea.bmea012,l_bmea.bmea013,
        l_bmea.bmea014,l_bmea.bmea015,l_bmea.bmea016,l_bmea.bmea017,l_bmea.bmea018,
        l_bmea.bmea019,l_bmea.bmea020,l_imaf053,l_imaf054
   #161109-00085#39-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF cl_null(l_imaf054) THEN
         LET l_imaf054 = 'N'
         IF cl_null(l_imaf053) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00476'
            LET g_errparam.extend = l_bmea.bmea008
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END IF
      
      #170313-00003#1 mark-S 声明上移   
#      #取替代料单身--获取取替代料的库存信息
#      #161109-00085#39-s
#      #LET l_sql = " SELECT inag_t.*,inan010 ",
#      LET l_sql = " SELECT inagent,inagsite,inag001,inag002,inag003,
#                           inag004,inag005,inag006,inag007,inag008,
#                           inag009,inag010,inag011,inag012,inag013,
#                           inag014,inag015,inag016,inag017,inag018,
#                           inag019,inag020,inag021,inag022,inag023,
#                           inag024,inag025,inag026,inag027,inag028,
#                           inag029,inag030,inag031,inag032,inag033,inan010 ",
#      #161109-00085#39-e
#                  " FROM inag_t LEFT OUTER JOIN inan_t ON inagent = inanent AND inagsite= inansite AND inag001 = inan001 AND inag002 = inan002 AND inag003 = inan003 AND inag004 = inan004 AND inag005 = inan005 AND inag006 = inan006 AND inag007 = inan007 ",
#                  "  AND inan000 = '1' ",  #160630-00020 by whitney add
#                  "  WHERE inagent = ",g_enterprise,
#                  "    AND inagsite='",g_site,"' ",
#                  "    AND inag001 ='",l_bmea.bmea008,"' ",  #料件
#                  "    AND inag002 ='",l_bmea.bmea019,"' ",  #产品特征
#                  "    AND inag008 > 0 ",   #库存量大于0
#                  "    AND (inag019 = 'N' OR inag019 IS NULL) " #未留置的
#      IF l_imaf054 = 'N' THEN  #不做多单位管理，只能从据点库存单位中出货
#         LET l_sql = l_sql CLIPPED," AND inag007 = '",l_imaf053,"' "
#      ELSE   #做库存单位管理，出货只能从单据指定单位出
#         LET l_sql = l_sql CLIPPED," AND inag007 = '",l_bmea.bmea013,"' "  #替代料发料单位
#      END IF
#      
#      #检查参数D-MFG-0050工單指定發料庫儲，發料時允許修改
#      IF NOT cl_null(l_sfba019) AND g_para = 'N' THEN
#         LET l_sql = l_sql CLIPPED," AND inag004 = '",l_sfba019,"' "  #只能从工单指定库位发料
#      END IF
#      IF NOT cl_null(l_sfba020) AND g_para = 'N' THEN
#         LET l_sql = l_sql CLIPPED," AND inag005 = '",l_sfba020,"' "  #只能从工单指定储位发料
#      END IF
#      IF NOT cl_null(l_sfba029) AND g_para = 'N' THEN
#         LET l_sql = l_sql CLIPPED," AND inag006 = '",l_sfba029,"' "  #只能从工单指定批号发料
#      END IF
#      IF NOT cl_null(l_sfba030) AND g_para = 'N' THEN
#         LET l_sql = l_sql CLIPPED," AND inag003 = '",l_sfba030,"' "  #只能从工单指定库存管理特征发料
#      END IF
#
#      PREPARE asfp310_ins_table_p32 FROM l_sql
#      DECLARE asfp310_ins_table_c32 CURSOR FOR asfp310_ins_table_p32
   #161109-00085#39-s
   #FOREACH asfp310_ins_table_c32 INTO l_inag.*,l_inan010
#   FOREACH asfp310_ins_table_c32
      #170313-00003#1 mark-E
   #170313-00003#1 add-S
   IF l_imaf054 = 'N' THEN  #不做多单位管理，只能从据点库存单位中出货
      LET l_ooca001 = l_imaf053
   ELSE   #做库存单位管理，出货只能从单据指定单位出
      LET l_ooca001 = l_bmea.bmea013    #替代料发料单位
   END IF
   FOREACH asfp310_ins_table_c32 USING l_bmea.bmea008,l_bmea.bmea019,l_ooca001
   #170313-00003#1 add-E
   INTO 
   l_inag.inagent,l_inag.inagsite,l_inag.inag001,l_inag.inag002,l_inag.inag003,
   l_inag.inag004,l_inag.inag005,l_inag.inag006,l_inag.inag007,l_inag.inag008,
   l_inag.inag009,l_inag.inag010,l_inag.inag011,l_inag.inag012,l_inag.inag013,
   l_inag.inag014,l_inag.inag015,l_inag.inag016,l_inag.inag017,l_inag.inag018,
   l_inag.inag019,l_inag.inag020,l_inag.inag021,l_inag.inag022,l_inag.inag023,
   l_inag.inag024,l_inag.inag025,l_inag.inag026,l_inag.inag027,l_inag.inag028,
   l_inag.inag029,l_inag.inag030,l_inag.inag031,l_inag.inag032,l_inag.inag033,l_inan010
   #161109-00085#39-e
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #检查库存量
         IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
         IF l_inag.inag008 - l_inan010 <= 0 THEN  #库存量-在捡量
            CONTINUE FOREACH
         END IF
               
         IF l_bmea.bmea011 = 0 OR l_bmea.bmea012 = 0 THEN 
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'asf-00093'
            LET g_errparam.extend = l_bmea.bmea008
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         #计算替代率
         #考虑bom中元件和替代料的单位，与此作业中备料和替代料发料单位的换算率
         #                          需求料号 需求料件单位 替代料号        替代发料单位    取替代量       元件底數        替代料發料單位   bom档的单位
         CALL s_asft310_get_sfdd002_2(p_sfba006,p_sfba014,l_bmea.bmea008,l_inag.inag007,l_bmea.bmea011,l_bmea.bmea012,l_bmea.bmea013,l_bmba010)
            RETURNING r_success,l_replace_rate_4
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         
         IF g_need_issue='Y' THEN  #需要分配数量
            #----------------------
            #完全取替代
            IF l_bmea.bmea016 = '2' THEN
               #检查是否有被其他料取替代
               SELECT COUNT(*) INTO l_cnt FROM asfp310_bmea
                WHERE seq_1     = l_seq_1
                  AND seq_2     = l_seq_2
                  AND seq1_2    = l_seq1_2
                  AND issue_qty_4 > 0
                  #AND (bmea007_4,bmea008_4,bmea019_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4) NOT IN
                  #    (select bmea007_4,bmea008_4,bmea019_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4
                  #       from asfp310_bmea
                  #      where seq_1     = l_seq_1
                  #        and seq_2     = l_seq_2
                  #        and seq1_2    = l_seq1_2
                  #        and bmea007_4 = l_bmea007
                  #        and bmea008_4 = l_bmea008
                  #        and bmea019_4 = l_bmea019
                  #        and inag004_4 = p_inag004
                  #        and inag005_4 = p_inag005
                  #        and inag006_4 = p_inag006
                  #        and inag003_4 = p_inag003
                  #        and inag007_4 = p_inag007
                  #    )
                  AND NOT EXISTS
                      (select bmea007_4,bmea008_4,bmea019_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4
                         from asfp310_bmea
                        where seq_1     = l_seq_1
                          and seq_2     = l_seq_2
                          and seq1_2    = l_seq1_2
                          and bmea007_4 = l_bmea.bmea007
                          and bmea008_4 = l_bmea.bmea008
                          and bmea019_4 = l_bmea.bmea019
                          and inag004_4 = p_inag004
                          and inag005_4 = p_inag005
                          and inag006_4 = p_inag006
                          and inag003_4 = p_inag003
                          and inag007_4 = p_inag007)
               IF l_cnt > 0 THEN  #有被其他料取替代过了，此料不能做取替代
                  LET l_issue_qty_4 = 0
               ELSE
                  #计算库存可发量=库存量-在捡量-本作业上已占用的量
                  #本作业上已占用的量
                  #                        料件           特征            库             储
                  CALL asfp310_get_has_qty(l_inag.inag001,l_inag.inag002,l_inag.inag004,l_inag.inag005,
                  #                        批             库存管理特征    库存单位        本笔发料量
                                           l_inag.inag006,l_inag.inag003,l_inag.inag007,0)
                     RETURNING l_has_qty
                  LET l_can_qty = l_inag.inag008 - l_inan010 - l_has_qty
                 
                  #将未发量转换成库存单位的量
                  LET g_no_issue_2= g_no_issue_2 * l_replace_rate_4

#160411-00020#1 mark str
#詢問過SA,不需要幫取替代料自動計算發料量,一律=0
#                  #计算l_issue_qty_4发料量
#                  IF g_no_issue_2 > l_can_qty THEN #未发数量 > 库存量
#                     LET l_issue_qty_4 = l_can_qty  #发料量
#                     #add 150120 单位取位
#                     CALL s_aooi250_get_msg(l_inag.inag007) RETURNING l_success,g_ooca002,g_ooca004
#                     IF l_success THEN
#                        CALL s_num_round('3',l_issue_qty_4,g_ooca002) RETURNING l_issue_qty_4  #3：无条件截位
#                     END IF
#                     #add 150120 end
#                     #LET g_no_issue_2 = g_no_issue_2 - l_can_qty  #剩余未发量
#                     LET g_no_issue_2 = g_no_issue_2 - l_issue_qty_4  #剩余未发量 #mod 150120
#                  ELSE
#                     LET l_issue_qty_4 = g_no_issue_2  #发料量
#                     #add 150120 单位取位
#                     CALL s_aooi250_get_msg(l_inag.inag007) RETURNING l_success,g_ooca002,g_ooca004
#                     IF l_success THEN
#                        CALL s_num_round('3',l_issue_qty_4,g_ooca002) RETURNING l_issue_qty_4  #3：无条件截位
#                     END IF
#                     #add 150120 end
#                     LET g_no_issue_2 = 0  #剩余未发量
#                  END IF
#160411-00020#1 mark end
                  #将未发量再转换回备料单位的量
                  LET g_no_issue_2= g_no_issue_2 / l_replace_rate_4
               END IF
            END IF
            
            #----------------------
            #部分取替代
            IF l_bmea.bmea016 = '1' THEN
                  #从替换角度看，能替换的量=所有的需备料的量=未发量 * 替换率 * 替代上限比率
                  LET l_max_qty = p_no_issue_2 * l_replace_rate_4 * l_bmea.bmea017/100
                  
                  #计算库存可发量=库存量-在捡量-本作业上已占用的量
                  #本作业上已占用的量
                  #                        料件           特征            库             储
                  CALL asfp310_get_has_qty(l_inag.inag001,l_inag.inag002,l_inag.inag004,l_inag.inag005,
                  #                        批             库存管理特征    库存单位        本笔发料量
                                           l_inag.inag006,l_inag.inag003,l_inag.inag007,0)
                     RETURNING l_has_qty
                  LET l_can_qty = l_inag.inag008 - l_inan010 - l_has_qty
                 
                  #将未发量转换成库存单位的量
                  LET g_no_issue_2= g_no_issue_2 * l_replace_rate_4

#160411-00020#1 mark str
#詢問過SA,不需要幫取替代料自動計算發料量,一律=0
#                  #计算l_issue_qty_4发料量
#                  IF g_no_issue_2 > l_can_qty THEN #未发数量 > 库存量
#                     LET l_issue_qty_4 = l_can_qty  #发料量
#                  ELSE
#                     LET l_issue_qty_4 = g_no_issue_2  #发料量
#                  END IF
#                  IF l_issue_qty_4 > l_max_qty THEN
#                     LET l_issue_qty_4 = l_max_qty
#                  END IF
#                  #add 150120 单位取位
#                  CALL s_aooi250_get_msg(l_inag.inag007) RETURNING l_success,g_ooca002,g_ooca004
#                  IF l_success THEN
#                     CALL s_num_round('3',l_issue_qty_4,g_ooca002) RETURNING l_issue_qty_4  #3：无条件截位
#                  END IF
#                  #add 150120 end
#                  LET g_no_issue_2 = g_no_issue_2 - l_issue_qty_4  #剩余未发量
#160411-00020#1 mark end

                  #将未发量再转换回备料单位的量
                  LET g_no_issue_2= g_no_issue_2 / l_replace_rate_4
            END IF
         ELSE
            LET l_issue_qty_4 = 0
         END IF
         
         #汇总备料库存可用量g_inag008_2,在捡量g_inan010_2
         LET g_issue_qty_2= g_issue_qty_2 + l_issue_qty_4 / l_replace_rate_4 #asfp310_sfba表中发料量
         LET g_inag008_2  = g_inag008_2 + l_inag.inag008 / l_replace_rate_4  #库存可用量
         LET g_inan010_2  = g_inan010_2 + l_inan010 / l_replace_rate_4       #在捡量
         #170313-00003#1 mark-S 移到foreach外面
#         #                        顺序           项次            项序           取替代特性      料件编号        產品特徵
#         INSERT INTO asfp310_bmea(seq_1         ,seq_2         ,seq1_2        ,bmea007_4     ,bmea008_4     ,bmea019_4,
#         #                        替代率         替代方式        替代上限比率     库位           储位
#                                  replace_rate_4,bmea016_4     ,bmea017_4     ,inag004_4     ,inag005_4     ,
#         #                        批号           库存管理特征    单位            现有库存数量    库存在捡量
#                                  inag006_4     ,inag003_4     ,inag007_4     ,inag008_4     ,inan010_4     ,
#         #                        发料量
#                                  issue_qty_4)
#           VALUES(p_seq           ,p_sfbaseq     ,p_sfbaseq1     ,l_bmea.bmea007,l_bmea.bmea008,l_bmea.bmea019,
#                  l_replace_rate_4,l_bmea.bmea016,l_bmea.bmea017 ,l_inag.inag004,l_inag.inag005,
#                  l_inag.inag006  ,l_inag.inag003,l_inag.inag007 ,l_inag.inag008,l_inan010,
#                  l_issue_qty_4)
         #170313-00003#1 mark-E
         #170313-00003#1 add-S
         EXECUTE ins_asfp310_bmea USING p_seq           ,p_sfbaseq     ,p_sfbaseq1     ,l_bmea.bmea007,l_bmea.bmea008,l_bmea.bmea019,
                  l_replace_rate_4,l_bmea.bmea016,l_bmea.bmea017 ,l_inag.inag004,l_inag.inag005,
                  l_inag.inag006  ,l_inag.inag003,l_inag.inag007 ,l_inag.inag008,l_inan010,
                  l_issue_qty_4
         #170313-00003#1 add-E
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins asfp310_bmea"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         LET l_inan010 = 0
         
      END FOREACH
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      #取替代料单身--获取取替代料的库存信息--end
   END FOREACH
   #取替代料单身--获取取替代料--end
         
   RETURN r_success
END FUNCTION
#产生asfp310_inag
#主要用料库存单身--获取工单备料的库存信息
PRIVATE FUNCTION asfp310_ins_table_inag(p_seq,p_sfaadocno,p_sfbaseq,p_sfbaseq1,p_sfba006,p_sfba021,p_sfba014,p_imaf053,p_imaf054)
DEFINE p_seq            LIKE type_t.num5     #顺序
DEFINE p_sfaadocno      LIKE sfaa_t.sfaadocno #工单单号 用于判断参数D-MFG-0050工單指定發料庫儲，發料時允許修改
DEFINE p_sfbaseq        LIKE sfba_t.sfbaseq  #项次
DEFINE p_sfbaseq1       LIKE sfba_t.sfbaseq1 #项序
DEFINE p_sfba006        LIKE sfba_t.sfba006  #元件料号
DEFINE p_sfba021        LIKE sfba_t.sfba021  #产品特征
DEFINE p_sfba014        LIKE sfba_t.sfba014  #单位
DEFINE p_imaf053        LIKE imaf_t.imaf053  #据点库存单位
DEFINE p_imaf054        LIKE imaf_t.imaf054  #库存多单位
DEFINE r_success        LIKE type_t.num5
#161109-00085#39-s
#DEFINE l_inag           RECORD LIKE inag_t.*
DEFINE l_inag RECORD  #庫存明細檔
       inagent LIKE inag_t.inagent, #企業編號
       inagsite LIKE inag_t.inagsite, #營運據點
       inag001 LIKE inag_t.inag001, #料件編號
       inag002 LIKE inag_t.inag002, #產品特徵
       inag003 LIKE inag_t.inag003, #庫存管理特徵
       inag004 LIKE inag_t.inag004, #庫位編號
       inag005 LIKE inag_t.inag005, #儲位編號
       inag006 LIKE inag_t.inag006, #批號
       inag007 LIKE inag_t.inag007, #庫存單位
       inag008 LIKE inag_t.inag008, #帳面庫存數量
       inag009 LIKE inag_t.inag009, #實際庫存數量
       inag010 LIKE inag_t.inag010, #庫存可用否
       inag011 LIKE inag_t.inag011, #MRP可用否
       inag012 LIKE inag_t.inag012, #成本庫否
       inag013 LIKE inag_t.inag013, #揀貨優先序
       inag014 LIKE inag_t.inag014, #最近一次盤點日期
       inag015 LIKE inag_t.inag015, #最後異動日期
       inag016 LIKE inag_t.inag016, #呆滯日期
       inag017 LIKE inag_t.inag017, #第一次入庫日期
       inag018 LIKE inag_t.inag018, #No Use
       inag019 LIKE inag_t.inag019, #留置否
       inag020 LIKE inag_t.inag020, #留置原因
       inag021 LIKE inag_t.inag021, #備置數量
       inag022 LIKE inag_t.inag022, #No Use
       inag023 LIKE inag_t.inag023, #Tag二進位碼
       inag024 LIKE inag_t.inag024, #參考單位
       inag025 LIKE inag_t.inag025, #參考數量
       inag026 LIKE inag_t.inag026, #最近一次檢驗日期
       inag027 LIKE inag_t.inag027, #下次檢驗日期
       inag028 LIKE inag_t.inag028, #留置日期
       inag029 LIKE inag_t.inag029, #留置人員
       inag030 LIKE inag_t.inag030, #留置部門
       inag031 LIKE inag_t.inag031, #留置單號
       inag032 LIKE inag_t.inag032, #基礎單位
       inag033 LIKE inag_t.inag033  #基礎單位數量
END RECORD
#161109-00085#39-e
DEFINE l_inan010        LIKE inan_t.inan010  #在捡量
DEFINE l_issue_qty_3    LIKE inan_t.inan010  #发料量
DEFINE l_rate           LIKE sfdd_t.sfdd002  #库存单位对备料单位的换算率，目的备料单位
DEFINE l_success        LIKE type_t.num5
DEFINE l_sql            STRING
DEFINE l_can_qty        LIKE inan_t.inan010  #可发量
DEFINE l_has_qty        LIKE inan_t.inan010  #本单据已占用的量
DEFINE l_sfba019  LIKE sfba_t.sfba019  #指定库位
DEFINE l_sfba020  LIKE sfba_t.sfba020  #指定储位
DEFINE l_sfba029  LIKE sfba_t.sfba029  #指定批号
DEFINE l_sfba030  LIKE sfba_t.sfba030  #指定库存管理特征

   LET r_success = TRUE
   
   #--库存页签单身游标定义
   #161109-00085#39-s
      #LET l_sql = " SELECT inag_t.*,inan010 ",
      LET l_sql = " SELECT inagent,inagsite,inag001,inag002,inag003,
                           inag004,inag005,inag006,inag007,inag008,
                           inag009,inag010,inag011,inag012,inag013,
                           inag014,inag015,inag016,inag017,inag018,
                           inag019,inag020,inag021,inag022,inag023,
                           inag024,inag025,inag026,inag027,inag028,
                           inag029,inag030,inag031,inag032,inag033,inan010 ",
   #161109-00085#39-e
               " FROM inag_t LEFT OUTER JOIN inan_t ON inagent = inanent AND inagsite= inansite AND inag001 = inan001 AND inag002 = inan002 AND inag003 = inan003 AND inag004 = inan004 AND inag005 = inan005 AND inag006 = inan006 AND inag007 = inan007 ",
               "  AND inan000 = '1' ",  #160630-00020 by whitney add
               "  WHERE inagent = ",g_enterprise,
               "    AND inagsite='",g_site,"' ",
               "    AND inag001 ='",p_sfba006,"' ",  #料件
               "    AND inag002 ='",p_sfba021,"' ",  #产品特征
               "    AND inag008 > 0 ",  #库存量大于0
               "    AND (inag019 = 'N' OR inag019 IS NULL) " #未留置的
   IF p_imaf054 = 'N' THEN  #不做多单位管理，只能从据点库存单位中出货
      LET l_sql = l_sql CLIPPED," AND inag007 = '",p_imaf053,"' "
   ELSE   #做库存单位管理，出货只能从单据指定单位出
      LET l_sql = l_sql CLIPPED," AND inag007 = '",p_sfba014,"' "
   END IF
   
   #170303-00042#1 add---start---
   IF tm.wc2 <> " 1=1" THEN
      LET l_sql = l_sql CLIPPED," AND ",tm.wc2 CLIPPED
   END IF
   #170303-00042#1 add---end---
   #检查参数D-MFG-0050工單指定發料庫儲，發料時允許修改
   CALL s_aooi200_get_slip(p_sfaadocno) RETURNING l_success,g_ooba002
   IF NOT l_success THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   CALL cl_get_doc_para(g_enterprise,g_site,g_ooba002,'D-MFG-0050')
      RETURNING g_para  #工單指定發料庫儲，發料時允許修改
   IF g_para = 'N' THEN
      SELECT sfba019,sfba020,sfba029,sfba030
        INTO l_sfba019,l_sfba020,l_sfba029,l_sfba030
        FROM sfba_t
       WHERE sfbaent  = g_enterprise
         AND sfbadocno= p_sfaadocno
         AND sfbaseq  = p_sfbaseq
         AND sfbaseq1 = p_sfbaseq1
      IF NOT cl_null(l_sfba019) THEN
         LET l_sql = l_sql CLIPPED," AND inag004 = '",l_sfba019,"' "  #只能从工单指定库位发料
      END IF
      IF NOT cl_null(l_sfba020) THEN
         LET l_sql = l_sql CLIPPED," AND inag005 = '",l_sfba020,"' "  #只能从工单指定储位发料
      END IF
      IF NOT cl_null(l_sfba029) THEN
         LET l_sql = l_sql CLIPPED," AND inag006 = '",l_sfba029,"' "  #只能从工单指定批号发料
      END IF
      IF NOT cl_null(l_sfba030) THEN
         LET l_sql = l_sql CLIPPED," AND inag003 = '",l_sfba030,"' "  #只能从工单指定库存管理特征发料
      END IF
   END IF
      
   PREPARE asfp310_ins_table_p31 FROM l_sql
   DECLARE asfp310_ins_table_c31 CURSOR FOR asfp310_ins_table_p31
   #170313-00003#1 add-S
   LET l_sql = "INSERT INTO asfp310_inag(seq_1       ,seq_2       ,seq1_2      ,inag004_3   ,inag005_3   ,",
               #                        批号         库存管理特征   单位         现有库存数量  库存在捡量
               "                         inag006_3   ,inag003_3   ,inag007_3   ,inag008_3   ,inan010_3   ,",
               #                        发料量
                "                        issue_qty_3) ",
                " VALUES(?,?,?,?,?,",
                "       ?,?,? ,?,?,",
                "       ?)"
   PREPARE ins_asfp310_inag FROM l_sql
   #170313-00003#1 add-E
   #161109-00085#39-s
   #FOREACH asfp310_ins_table_c31 INTO l_inag.*,l_inan010
   FOREACH asfp310_ins_table_c31 
   INTO 
   l_inag.inagent,l_inag.inagsite,l_inag.inag001,l_inag.inag002,l_inag.inag003,
   l_inag.inag004,l_inag.inag005,l_inag.inag006,l_inag.inag007,l_inag.inag008,
   l_inag.inag009,l_inag.inag010,l_inag.inag011,l_inag.inag012,l_inag.inag013,
   l_inag.inag014,l_inag.inag015,l_inag.inag016,l_inag.inag017,l_inag.inag018,
   l_inag.inag019,l_inag.inag020,l_inag.inag021,l_inag.inag022,l_inag.inag023,
   l_inag.inag024,l_inag.inag025,l_inag.inag026,l_inag.inag027,l_inag.inag028,
   l_inag.inag029,l_inag.inag030,l_inag.inag031,l_inag.inag032,l_inag.inag033,l_inan010
   #161109-00085#39-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #检查库存量
      IF cl_null(l_inan010) THEN LET l_inan010 = 0 END IF
      IF l_inag.inag008 - l_inan010 <=0 THEN #库存量-在捡量
         CONTINUE FOREACH
      END IF
      
      #计算l_issue_qty_3发料量
      IF g_need_issue='Y' THEN  #需要分配数量
         #计算库存可发量=库存量-在捡量-本作业上已占用的量
         #本作业上已占用的量
         #                        料件           特征            库             储
         CALL asfp310_get_has_qty(l_inag.inag001,l_inag.inag002,l_inag.inag004,l_inag.inag005,
         #                        批             库存管理特征    库存单位        本笔发料量
                                  l_inag.inag006,l_inag.inag003,l_inag.inag007,0)
            RETURNING l_has_qty
         LET l_can_qty = l_inag.inag008 - l_inan010 - l_has_qty
      
         #将未发量转换成库存单位的量
         #mod 150101
         #IF l_inag.inag007 = p_sfba014 THEN  #库存单位=备料单位
         #   LET l_rate = 1
         #ELSE
         #   CALL s_aimi190_get_convert(p_sfba006,p_sfba014,l_inag.inag007) RETURNING l_success,l_rate
         #   IF NOT l_success THEN
         #      #LET l_rate = 1
         #      LET r_success = FALSE
         #      EXIT FOREACH
         #   END IF
         #END IF
         #LET g_no_issue_2= g_no_issue_2 * l_rate
         IF l_inag.inag007 != p_sfba014 THEN  #库存单位=备料单位
            CALL s_aooi250_convert_qty(p_sfba006,p_sfba014,l_inag.inag007,g_no_issue_2)
               RETURNING l_success,g_qty_t
            IF NOT l_success THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            LET g_no_issue_2 = g_qty_t #剩余未发量 asfp310_sfba表中未发数量=应发-已发-代买 用于分配
         END IF
         #mod 150101 end
      
         IF g_no_issue_2 > l_can_qty THEN #未发数量 > 库存量
            LET l_issue_qty_3 = l_can_qty  #发料量
            #add 150120 单位取位
            CALL s_aooi250_get_msg(l_inag.inag007) RETURNING l_success,g_ooca002,g_ooca004
            IF l_success THEN
               CALL s_num_round('3',l_issue_qty_3,g_ooca002) RETURNING l_issue_qty_3  #3：无条件截位
            END IF
            #add 150120 end
            #LET g_no_issue_2 = g_no_issue_2 - l_can_qty  #剩余未发量
            LET g_no_issue_2 = g_no_issue_2 - l_issue_qty_3  #剩余未发量 #mod 150120
         ELSE
            LET l_issue_qty_3 = g_no_issue_2  #发料量
            #add 150120 单位取位
            CALL s_aooi250_get_msg(l_inag.inag007) RETURNING l_success,g_ooca002,g_ooca004
            IF l_success THEN
               CALL s_num_round('3',l_issue_qty_3,g_ooca002) RETURNING l_issue_qty_3  #3：无条件截位
            END IF
            #add 150120 end
            LET g_no_issue_2 = 0  #剩余未发量
         END IF
         
         #将未发量再转换回备料单位的量
         #mod 150101
         #LET g_no_issue_2= g_no_issue_2 / l_rate
         IF l_inag.inag007 != p_sfba014 THEN  #库存单位=备料单位
            CALL s_aooi250_convert_qty(p_sfba006,l_inag.inag007,p_sfba014,g_no_issue_2)
               RETURNING l_success,g_qty_t
            IF NOT l_success THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            LET g_no_issue_2 = g_qty_t
         END IF
         #mod 150101 end
      ELSE
         LET l_issue_qty_3 = 0
      END IF
      
      #汇总备料：g_issue_qty_2发料量,库存可用量g_inag008_2,在捡量g_inan010_2
      IF l_inag.inag007 = p_sfba014 THEN  #库存单位=备料单位
         LET g_issue_qty_2= g_issue_qty_2 + l_issue_qty_3 #asfp310_sfba表中发料量
         LET g_inag008_2  = g_inag008_2 + l_inag.inag008  #库存可用量
         LET g_inan010_2  = g_inan010_2 + l_inan010       #在捡量
      ELSE
         #mod 150101
         #CALL s_aimi190_get_convert(p_sfba006,l_inag.inag007,p_sfba014) RETURNING l_success,l_rate
         #IF NOT l_success THEN
         #   #LET l_rate = 1
         #   LET r_success = FALSE
         #   EXIT FOREACH
         #END IF
         #LET g_issue_qty_2= g_issue_qty_2 + l_issue_qty_3 * l_rate
         #LET g_inag008_2  = g_inag008_2 + l_inag.inag008 * l_rate
         #LET g_inan010_2  = g_inan010_2 + l_inan010 * l_rate
         CALL s_aooi250_convert_qty(p_sfba006,l_inag.inag007,p_sfba014,l_issue_qty_3)
            RETURNING l_success,g_qty_t
         IF NOT l_success THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         LET g_issue_qty_2= g_issue_qty_2 + g_qty_t #asfp310_sfba表中发料量
         CALL s_aooi250_convert_qty(p_sfba006,l_inag.inag007,p_sfba014,l_inag.inag008)
            RETURNING l_success,g_qty_t
         IF NOT l_success THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         LET g_inag008_2  = g_inag008_2 + g_qty_t #库存可用量
         CALL s_aooi250_convert_qty(p_sfba006,l_inag.inag007,p_sfba014,l_inan010)
            RETURNING l_success,g_qty_t
         IF NOT l_success THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         LET g_inan010_2  = g_inan010_2 + g_qty_t #在捡量
         #mod 150101 end
      END IF
      #170313-00003#1 mark-S   
#      #                        顺序         项次          项序         库位          储位
#      INSERT INTO asfp310_inag(seq_1       ,seq_2       ,seq1_2      ,inag004_3   ,inag005_3   ,
#      #                        批号         库存管理特征   单位         现有库存数量  库存在捡量
#                               inag006_3   ,inag003_3   ,inag007_3   ,inag008_3   ,inan010_3   ,
#      #                        发料量
#                               issue_qty_3)
#        VALUES(p_seq         ,p_sfbaseq     ,p_sfbaseq1     ,l_inag.inag004,l_inag.inag005,
#               l_inag.inag006,l_inag.inag003,l_inag.inag007 ,l_inag.inag008,l_inan010,
#               l_issue_qty_3)
      #170313-00003#1 mark-E
      #170313-00003#1 add-S
      EXECUTE ins_asfp310_inag USING  p_seq         ,p_sfbaseq     ,p_sfbaseq1     ,l_inag.inag004,l_inag.inag005,
                                      l_inag.inag006,l_inag.inag003,l_inag.inag007 ,l_inag.inag008,l_inan010,
                                      l_issue_qty_3
      #170313-00003#1 add-E
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins asfp310_inag"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      LET l_inan010 = 0
      
   END FOREACH

   RETURN r_success
END FUNCTION
#画面显示
PRIVATE FUNCTION asfp310_b_fill()
   CALL asfp310_b_fill_sfaa()
   CALL asfp310_b_fill_sfba()
   CALL asfp310_b_fill_inag()
   CALL asfp310_b_fill_bmea()
END FUNCTION
#sfaa填充
PRIVATE FUNCTION asfp310_b_fill_sfaa()
DEFINE l_sfaa057   LIKE sfaa_t.sfaa057
DEFINE l_success   LIKE type_t.num5
DEFINE l_ac_l      LIKE type_t.num5

   CALL g_sfaa_d.clear()

   LET g_sql = "SELECT 'N',lock_1,seq_1,sfaadocno_1,sfaa010_1,'','',sfaa019_1,sfaa020_1,sfaa017_1,'',sfaa002_1,'',sfba003_1,sfba004_1,sfaa012_1,sfaa049_1,has_sets_1 ", #,can_sets_1 ",
               "  FROM asfp310_sfaa",
               " ORDER BY seq_1 "
   PREPARE b_fill_sfaa_p FROM g_sql
   DECLARE b_fill_sfaa_c CURSOR FOR b_fill_sfaa_p
   LET l_ac_l = 1
   FOREACH b_fill_sfaa_c INTO g_sfaa_d[l_ac_l].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      
      CALL s_desc_get_item_desc(g_sfaa_d[l_ac_l].sfaa010_1) RETURNING g_sfaa_d[l_ac_l].sfaa010_imaal003_1,g_sfaa_d[l_ac_l].sfaa010_imaal004_1

      #人员姓名
      CALL s_desc_get_person_desc(g_sfaa_d[l_ac_l].sfaa002_1) RETURNING g_sfaa_d[l_ac_l].sfaa002_desc_1

      SELECT sfaa057 INTO l_sfaa057 FROM sfaa_t
       WHERE sfaaent   = g_enterprise
         AND sfaadocno = g_sfaa_d[l_ac_l].sfaadocno_1
      IF l_sfaa057 = '2' THEN
         INITIALIZE g_chkparam.* TO NULL
         LET g_chkparam.arg1 = g_sfaa_d[l_ac_l].sfaa017_1
         CALL cl_ref_val("v_pmaal004")
         LET g_sfaa_d[l_ac_l].sfaa017_desc_1 = g_chkparam.return1
      ELSE
         CALL s_desc_get_department_desc(g_sfaa_d[l_ac_l].sfaa017_1) RETURNING g_sfaa_d[l_ac_l].sfaa017_desc_1
      END IF
      
      #可齐料套数
      CALL asfp310_full_sets(g_sfaa_d[l_ac_l].sfaadocno_1,g_sfaa_d[l_ac_l].sfba003_1,g_sfaa_d[l_ac_l].sfba004_1)
           RETURNING l_success,g_sfaa_d[l_ac_l].can_sets_1
      LET g_sfaa_d[l_ac_l].can_sets_1 = g_sfaa_d[l_ac_l].can_sets_1 - g_sfaa_d[l_ac_l].has_sets_1

      LET l_ac_l = l_ac_l + 1
      IF l_ac_l > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_sfaa_d.deleteElement(l_ac_l)
   LET g_rec_b_sfaa = l_ac_l - 1

   FREE b_fill_sfaa_p
END FUNCTION
#sfba填充
PRIVATE FUNCTION asfp310_b_fill_sfba()
   DEFINE l_ac_l      LIKE type_t.num5
   DEFINE l_success   LIKE type_t.num5
   
   CALL g_sfba_d.clear()
   
   IF cl_null(l_ac_sfaa) OR l_ac_sfaa = 0 THEN
      RETURN
   END IF

   LET g_sql = "SELECT seq_2,seq1_2,sfba002_2,sfba003_2,sfba004_2,sfba006_2,'','',sfba021_2,'','','',sfba014_2,sfba013_2,sfba016_2,no_issue_2,issue_qty_2,inag008_2,inan010_2 ",
               "  FROM asfp310_sfba",
               " WHERE seq_1=?",
               " ORDER BY seq_2,seq1_2 "
   PREPARE b_fill_sfba_p FROM g_sql
   DECLARE b_fill_sfba_c CURSOR FOR b_fill_sfba_p
   OPEN b_fill_sfba_c USING g_sfaa_d[l_ac_sfaa].seq_1
   LET l_ac_l = 1
   FOREACH b_fill_sfba_c INTO g_sfba_d[l_ac_l].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF

      CALL s_desc_get_item_desc(g_sfba_d[l_ac_l].sfba006_2) RETURNING g_sfba_d[l_ac_l].sfba006_imaal003_2,g_sfba_d[l_ac_l].sfba006_imaal004_2 
      
      #产品特征说明
      CALL s_feature_description(g_sfba_d[l_ac_l].sfba006_2,g_sfba_d[l_ac_l].sfba021_2)
         RETURNING l_success,g_sfba_d[l_ac_l].sfba021_2_desc
      
      #保税料
      SELECT imaf034 INTO g_sfba_d[l_ac_l].imaf034_2
        FROM imaf_t
       WHERE imafent = g_enterprise
         AND imafsite= g_site
         AND imaf001 = g_sfba_d[l_ac_l].sfba006_2
      
      #发料前调拨
      SELECT imae092 INTO g_sfba_d[l_ac_l].imae092_2 FROM imae_t
       WHERE imaeent = g_enterprise
         AND imaesite= g_site
         AND imae001 = g_sfba_d[l_ac_l].sfba006_2

      LET l_ac_l = l_ac_l + 1
      IF l_ac_l > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_sfba_d.deleteElement(l_ac_l)
   LET g_rec_b_sfba = l_ac_l- 1
   FREE b_fill_sfba_p
END FUNCTION
#inag填充
PRIVATE FUNCTION asfp310_b_fill_inag()
   DEFINE l_ac_l      LIKE type_t.num5
   
   CALL g_inag_d.clear()
   
   IF cl_null(l_ac_sfaa) OR l_ac_sfaa = 0 THEN
      RETURN
   END IF
   IF cl_null(l_ac_sfba) OR l_ac_sfba = 0 THEN
      RETURN
   END IF

   LET g_sql = "SELECT inag004_3,inag005_3,inag006_3,inag003_3,inag007_3,inag008_3,inan010_3,0,issue_qty_3 ",
               "  FROM asfp310_inag",
               " WHERE seq_1=? AND seq_2=? AND seq1_2=?",
               " ORDER BY inag004_3,inag005_3,inag006_3,inag003_3,inag007_3 "
   PREPARE b_fill_inag_p FROM g_sql
   DECLARE b_fill_inag_c CURSOR FOR b_fill_inag_p
   OPEN b_fill_inag_c USING g_sfaa_d[l_ac_sfaa].seq_1,g_sfba_d[l_ac_sfba].seq_2,g_sfba_d[l_ac_sfba].seq1_2
   LET l_ac_l = 1
   FOREACH b_fill_inag_c INTO g_inag_d[l_ac_l].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF

      #其他工单分配量
      #                        料件                          特征
      CALL asfp310_get_has_qty(g_sfba_d[l_ac_sfba].sfba006_2,g_sfba_d[l_ac_sfba].sfba021_2,
      #                        库                            储
                               g_inag_d[l_ac_l].inag004_3,g_inag_d[l_ac_l].inag005_3,
      #                        批                            库存管理特征
                               g_inag_d[l_ac_l].inag006_3,g_inag_d[l_ac_l].inag003_3,
      #                        库存单位                       本笔发料量
                               g_inag_d[l_ac_l].inag007_3,g_inag_d[l_ac_l].issue_qty_3)
         RETURNING g_inag_d[l_ac_l].has_qty_3

      LET l_ac_l = l_ac_l + 1
      IF l_ac_l > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_inag_d.deleteElement(l_ac_l)
   LET g_rec_b_inag = l_ac_l - 1
   FREE b_fill_inag_p
END FUNCTION
#获得其他工单分配量
#此作业内，其他笔资料占用此库存的数量
PRIVATE FUNCTION asfp310_get_has_qty(p_inag001,p_inag002,p_inag004,p_inag005,p_inag006,p_inag003,p_inag007,p_issue_qty)
DEFINE p_inag001  LIKE inag_t.inag001  #料件编号
DEFINE p_inag002  LIKE inag_t.inag002  #产品特征
DEFINE p_inag004  LIKE inag_t.inag004  #库位编号
DEFINE p_inag005  LIKE inag_t.inag005  #储位编号
DEFINE p_inag006  LIKE inag_t.inag006  #批号
DEFINE p_inag003  LIKE inag_t.inag003  #库存管理特征
DEFINE p_inag007  LIKE inag_t.inag007  #库存单位
DEFINE p_issue_qty LIKE inag_t.inag008  #当笔发料量
DEFINE r_qty      LIKE inag_t.inag008  #
DEFINE l_qty      LIKE inag_t.inag008

   LET r_qty = 0
   
   IF cl_null(p_inag002) THEN LET p_inag002 = ' ' END IF #特征
   IF cl_null(p_inag004) THEN LET p_inag004 = ' ' END IF #库位 
   IF cl_null(p_inag005) THEN LET p_inag005 = ' ' END IF #储位
   IF cl_null(p_inag006) THEN LET p_inag006 = ' ' END IF #批号
   IF cl_null(p_inag003) THEN LET p_inag003 = ' ' END IF #库存管理特征
   
   #计算inag
   SELECT SUM(issue_qty_3) INTO l_qty
     FROM asfp310_inag,asfp310_sfba
    WHERE asfp310_inag.seq_1 = asfp310_sfba.seq_1
      AND asfp310_inag.seq_2 = asfp310_sfba.seq_2
      AND asfp310_inag.seq1_2 = asfp310_sfba.seq1_2
      AND asfp310_sfba.sfba006_2 = p_inag001  #料
      AND asfp310_sfba.sfba021_2 = p_inag002  #特征
      AND asfp310_inag.inag004_3 = p_inag004  #库位 
      AND asfp310_inag.inag005_3 = p_inag005  #储位
      AND asfp310_inag.inag006_3 = p_inag006  #批号
      AND asfp310_inag.inag003_3 = p_inag003  #库存管理特征
      AND asfp310_inag.inag007_3 = p_inag007  #库存单位
   IF cl_null(l_qty) THEN LET l_qty = 0 END IF
   LET r_qty = r_qty + l_qty
   
   #计算bmea
   #SELECT SUM(issue_qty_4) INTO l_qty
   #  FROM asfp310_bmea,asfp310_sfba
   # WHERE asfp310_bmea.seq_1 = asfp310_sfba.seq_1
   #   AND asfp310_bmea.seq_2 = asfp310_sfba.seq_2
   #   AND asfp310_bmea.seq1_2 = asfp310_sfba.seq1_2
   #   AND asfp310_bmea.bmea008_4 = p_inag001  #料
   #   AND asfp310_sfba.sfba021_2 = p_inag002  #特征
   #   AND asfp310_bmea.inag004_4 = p_inag004  #库位 
   #   AND asfp310_bmea.inag005_4 = p_inag005  #储位
   #   AND asfp310_bmea.inag006_4 = p_inag006  #批号
   #   AND asfp310_bmea.inag003_4 = p_inag003  #库存管理特征
   #   AND asfp310_bmea.inag007_4 = p_inag007  #库存单位
   SELECT SUM(issue_qty_4) INTO l_qty
     FROM asfp310_bmea
    WHERE asfp310_bmea.bmea008_4 = p_inag001  #料
      AND asfp310_bmea.bmea019_4 = p_inag002  #特征
      AND asfp310_bmea.inag004_4 = p_inag004  #库位 
      AND asfp310_bmea.inag005_4 = p_inag005  #储位
      AND asfp310_bmea.inag006_4 = p_inag006  #批号
      AND asfp310_bmea.inag003_4 = p_inag003  #库存管理特征
      AND asfp310_bmea.inag007_4 = p_inag007  #库存单位
   IF cl_null(l_qty) THEN LET l_qty = 0 END IF
   LET r_qty = r_qty + l_qty
   
   LET r_qty = r_qty - p_issue_qty  #减去本笔发料量 为其他已发量

   RETURN r_qty
END FUNCTION
#bmea填充
PRIVATE FUNCTION asfp310_b_fill_bmea()
   DEFINE l_ac_l      LIKE type_t.num5
   DEFINE l_success   LIKE type_t.num5
   
   CALL g_bmea_d.clear()
   
   IF cl_null(l_ac_sfaa) OR l_ac_sfaa = 0 THEN
      RETURN
   END IF
   IF cl_null(l_ac_sfba) OR l_ac_sfba = 0 THEN
      RETURN
   END IF

   LET g_sql = "SELECT bmea007_4,bmea008_4,'','',bmea019_4,'',replace_rate_4,bmea016_4,bmea017_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4,inag008_4,inan010_4,0,issue_qty_4 ",
               "  FROM asfp310_bmea",
               " WHERE seq_1=? AND seq_2=? AND seq1_2=?",
               " ORDER BY bmea007_4,bmea008_4,bmea019_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4 "
   PREPARE b_fill_bmea_p FROM g_sql
   DECLARE b_fill_bmea_c CURSOR FOR b_fill_bmea_p
   OPEN b_fill_bmea_c USING g_sfaa_d[l_ac_sfaa].seq_1,g_sfba_d[l_ac_sfba].seq_2,g_sfba_d[l_ac_sfba].seq1_2
   LET l_ac_l = 1
   FOREACH b_fill_bmea_c INTO g_bmea_d[l_ac_l].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF

      #料件品名、规格
      CALL s_desc_get_item_desc(g_bmea_d[l_ac_l].bmea008_4) RETURNING g_bmea_d[l_ac_l].bmea008_imaal003_4,g_bmea_d[l_ac_l].bmea008_imaal004_4
      #產品特徵說明
      CALL s_feature_description(g_bmea_d[l_ac_l].bmea008_4,g_bmea_d[l_ac_l].bmea019_4)
         RETURNING l_success,g_bmea_d[l_ac_l].bmea019_desc
      IF NOT l_success THEN
         LET g_bmea_d[l_ac_l].bmea019_desc = ''
      END IF
   
      #其他工单分配量
      #                        料件                          特征
      CALL asfp310_get_has_qty(g_bmea_d[l_ac_l].bmea008_4,g_bmea_d[l_ac_l].bmea019_4,
      #                        库                            储
                               g_bmea_d[l_ac_l].inag004_4,g_bmea_d[l_ac_l].inag005_4,
      #                        批                            库存管理特征
                               g_bmea_d[l_ac_l].inag006_4,g_bmea_d[l_ac_l].inag003_4,
      #                        库存单位                       本笔发料量
                               g_bmea_d[l_ac_l].inag007_4,g_bmea_d[l_ac_l].issue_qty_4)
         RETURNING g_bmea_d[l_ac_l].has_qty_4

      LET l_ac_l = l_ac_l + 1
      IF l_ac_l > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_bmea_d.deleteElement(l_ac_l)
   LET g_rec_b_bmea = l_ac_l - 1
   FREE b_fill_bmea_p
END FUNCTION
#产生发料单
PRIVATE FUNCTION asfp310_gen_asft310()
DEFINE l_cnt     LIKE type_t.num5
DEFINE l_i       LIKE type_t.num5
DEFINE l_success LIKE type_t.num5

   IF g_rec_b_sfaa = 0 THEN
      #无可产生的数据，请先选择数据
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00242'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF
   LET g_flag = FALSE  #170302-00012#8   2017/03/14  By 08734 add
   
   ##插入需处理的资料，同时检查是否有选择产生资料
   #检查是否有选择产生资料
   LET l_cnt = 0
   FOR l_i = 1 TO g_rec_b_sfaa
       IF g_sfaa_d[l_i].sel_1 = 'Y' THEN
          LET l_cnt = l_cnt + 1
          EXIT FOR
       END IF
   END FOR
   IF l_cnt = 0 THEN
      #无可产生的数据，请先选择数据
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00242'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN
   END IF

   #IF NOT cl_ask_confirm('asf-00211') THEN
   #   RETURN
   #END IF
   
   CALL asfp310_01(g_sfaa_d) RETURNING l_success
   #执行成功，需刷新画面资料
   IF l_success THEN
      CALL asfp310_del_temp() RETURNING l_success
      CALL asfp310_ins_table()
      LET g_flag = TRUE  #170302-00012#8   2017/03/14  By 08734 add(E)
   END IF
   #170302-00012#8   2017/03/14  By 08734 add(S)
   IF g_flag = FALSE THEN
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.code = 'sub-00491'   #無資料產生
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN   
   END IF
   #170302-00012#8   2017/03/14  By 08734 add(E)

END FUNCTION

PRIVATE FUNCTION asfp310_set_entry()
DEFINE p_cmd   LIKE type_t.chr1

   CALL cl_set_comp_entry("sfba004",TRUE)  #作业序

END FUNCTION

PRIVATE FUNCTION asfp310_set_no_entry()
DEFINE p_cmd   LIKE type_t.chr1

   IF cl_null(g_master.sfba003) THEN
      CALL cl_set_comp_entry("sfba004",FALSE)  #作业序
   END IF
END FUNCTION
#预设工单信息
PRIVATE FUNCTION asfp310_sfaadocno_1_def()
DEFINE r_success     LIKE type_t.num5
#161109-00085#39-s
#DEFINE l_sfaa        RECORD LIKE sfaa_t.*
DEFINE l_sfaa RECORD  #工單單頭檔
       sfaaent LIKE sfaa_t.sfaaent, #企業編號
       sfaaownid LIKE sfaa_t.sfaaownid, #資料所有者
       sfaaowndp LIKE sfaa_t.sfaaowndp, #資料所有部門
       sfaacrtid LIKE sfaa_t.sfaacrtid, #資料建立者
       sfaacrtdp LIKE sfaa_t.sfaacrtdp, #資料建立部門
       sfaacrtdt LIKE sfaa_t.sfaacrtdt, #資料創建日
       sfaamodid LIKE sfaa_t.sfaamodid, #資料修改者
       sfaamoddt LIKE sfaa_t.sfaamoddt, #最近修改日
       sfaacnfid LIKE sfaa_t.sfaacnfid, #資料確認者
       sfaacnfdt LIKE sfaa_t.sfaacnfdt, #資料確認日
       sfaapstid LIKE sfaa_t.sfaapstid, #資料過帳者
       sfaapstdt LIKE sfaa_t.sfaapstdt, #資料過帳日
       sfaastus LIKE sfaa_t.sfaastus, #狀態碼
       sfaasite LIKE sfaa_t.sfaasite, #營運據點
       sfaadocno LIKE sfaa_t.sfaadocno, #單號
       sfaadocdt LIKE sfaa_t.sfaadocdt, #單據日期
       sfaa001 LIKE sfaa_t.sfaa001, #變更版本
       sfaa002 LIKE sfaa_t.sfaa002, #生管人員
       sfaa003 LIKE sfaa_t.sfaa003, #工單類型
       sfaa004 LIKE sfaa_t.sfaa004, #發料制度
       sfaa005 LIKE sfaa_t.sfaa005, #工單來源
       sfaa006 LIKE sfaa_t.sfaa006, #來源單號
       sfaa007 LIKE sfaa_t.sfaa007, #來源項次
       sfaa008 LIKE sfaa_t.sfaa008, #來源項序
       sfaa009 LIKE sfaa_t.sfaa009, #參考客戶
       sfaa010 LIKE sfaa_t.sfaa010, #生產料號
       sfaa011 LIKE sfaa_t.sfaa011, #特性
       sfaa012 LIKE sfaa_t.sfaa012, #生產數量
       sfaa013 LIKE sfaa_t.sfaa013, #生產單位
       sfaa014 LIKE sfaa_t.sfaa014, #BOM版本
       sfaa015 LIKE sfaa_t.sfaa015, #BOM有效日期
       sfaa016 LIKE sfaa_t.sfaa016, #製程編號
       sfaa017 LIKE sfaa_t.sfaa017, #部門供應商
       sfaa018 LIKE sfaa_t.sfaa018, #協作據點
       sfaa019 LIKE sfaa_t.sfaa019, #預計開工日
       sfaa020 LIKE sfaa_t.sfaa020, #預計完工日
       sfaa021 LIKE sfaa_t.sfaa021, #母工單單號
       sfaa022 LIKE sfaa_t.sfaa022, #參考原始單號
       sfaa023 LIKE sfaa_t.sfaa023, #參考原始項次
       sfaa024 LIKE sfaa_t.sfaa024, #參考原始項序
       sfaa025 LIKE sfaa_t.sfaa025, #前工單單號
       sfaa026 LIKE sfaa_t.sfaa026, #料表批號(PBI)
       sfaa027 LIKE sfaa_t.sfaa027, #No Use
       sfaa028 LIKE sfaa_t.sfaa028, #專案編號
       sfaa029 LIKE sfaa_t.sfaa029, #WBS
       sfaa030 LIKE sfaa_t.sfaa030, #活動
       sfaa031 LIKE sfaa_t.sfaa031, #理由碼
       sfaa032 LIKE sfaa_t.sfaa032, #緊急比率
       sfaa033 LIKE sfaa_t.sfaa033, #優先順序
       sfaa034 LIKE sfaa_t.sfaa034, #預計入庫庫位
       sfaa035 LIKE sfaa_t.sfaa035, #預計入庫儲位
       sfaa036 LIKE sfaa_t.sfaa036, #手冊編號
       sfaa037 LIKE sfaa_t.sfaa037, #保稅核准文號
       sfaa038 LIKE sfaa_t.sfaa038, #保稅核銷
       sfaa039 LIKE sfaa_t.sfaa039, #備料已產生
       sfaa040 LIKE sfaa_t.sfaa040, #生產途程已確認
       sfaa041 LIKE sfaa_t.sfaa041, #凍結
       sfaa042 LIKE sfaa_t.sfaa042, #重工
       sfaa043 LIKE sfaa_t.sfaa043, #備置
       sfaa044 LIKE sfaa_t.sfaa044, #FQC
       sfaa045 LIKE sfaa_t.sfaa045, #實際開始發料日
       sfaa046 LIKE sfaa_t.sfaa046, #最後入庫日
       sfaa047 LIKE sfaa_t.sfaa047, #生管結案日
       sfaa048 LIKE sfaa_t.sfaa048, #成本結案日
       sfaa049 LIKE sfaa_t.sfaa049, #已發料套數
       sfaa050 LIKE sfaa_t.sfaa050, #已入庫合格量
       sfaa051 LIKE sfaa_t.sfaa051, #已入庫不合格量
       sfaa052 LIKE sfaa_t.sfaa052, #Bouns
       sfaa053 LIKE sfaa_t.sfaa053, #工單轉入數量
       sfaa054 LIKE sfaa_t.sfaa054, #工單轉出數量
       sfaa055 LIKE sfaa_t.sfaa055, #下線數量
       sfaa056 LIKE sfaa_t.sfaa056, #報廢數量
       sfaa057 LIKE sfaa_t.sfaa057, #委外類型
       sfaa058 LIKE sfaa_t.sfaa058, #參考數量
       sfaa059 LIKE sfaa_t.sfaa059, #預計入庫批號
       sfaa060 LIKE sfaa_t.sfaa060, #參考單位
       sfaa061 LIKE sfaa_t.sfaa061, #製程
       sfaa062 LIKE sfaa_t.sfaa062, #納入APS計算
       sfaa063 LIKE sfaa_t.sfaa063, #來源分批序
       sfaa064 LIKE sfaa_t.sfaa064, #參考原始分批序
       sfaa065 LIKE sfaa_t.sfaa065, #生管結案狀態
       sfaa066 LIKE sfaa_t.sfaa066, #多角流程編號
       sfaa067 LIKE sfaa_t.sfaa067, #多角流程式號
       sfaa068 LIKE sfaa_t.sfaa068, #成本中心
       sfaa069 LIKE sfaa_t.sfaa069, #可供給量
       sfaa070 LIKE sfaa_t.sfaa070, #原始預計完工日期
       sfaa071 LIKE sfaa_t.sfaa071, #齊料套數
       sfaa072 LIKE sfaa_t.sfaa072  #保稅否
END RECORD
#161109-00085#39-e
DEFINE l_has_sets_1  LIKE sfaa_t.sfaa049  #已发齐套数
DEFINE l_can_sets_1  LIKE sfaa_t.sfaa049  #可齐料套数

   LET r_success = TRUE
   #161109-00085#39-s
   #SELECT * INTO l_sfaa.* FROM sfaa_t
   SELECT sfaaent,sfaaownid,sfaaowndp,sfaacrtid,sfaacrtdp,
          sfaacrtdt,sfaamodid,sfaamoddt,sfaacnfid,sfaacnfdt,
          sfaapstid,sfaapstdt,sfaastus,sfaasite,sfaadocno,
          sfaadocdt,sfaa001,sfaa002,sfaa003,sfaa004,
          sfaa005,sfaa006,sfaa007,sfaa008,sfaa009,
          sfaa010,sfaa011,sfaa012,sfaa013,sfaa014,
          sfaa015,sfaa016,sfaa017,sfaa018,sfaa019,
          sfaa020,sfaa021,sfaa022,sfaa023,sfaa024,
          sfaa025,sfaa026,sfaa027,sfaa028,sfaa029,
          sfaa030,sfaa031,sfaa032,sfaa033,sfaa034,
          sfaa035,sfaa036,sfaa037,sfaa038,sfaa039,
          sfaa040,sfaa041,sfaa042,sfaa043,sfaa044,
          sfaa045,sfaa046,sfaa047,sfaa048,sfaa049,
          sfaa050,sfaa051,sfaa052,sfaa053,sfaa054,
          sfaa055,sfaa056,sfaa057,sfaa058,sfaa059,
          sfaa060,sfaa061,sfaa062,sfaa063,sfaa064,
          sfaa065,sfaa066,sfaa067,sfaa068,sfaa069,
          sfaa070,sfaa071,sfaa072
     INTO l_sfaa.sfaaent,l_sfaa.sfaaownid,l_sfaa.sfaaowndp,l_sfaa.sfaacrtid,l_sfaa.sfaacrtdp,
          l_sfaa.sfaacrtdt,l_sfaa.sfaamodid,l_sfaa.sfaamoddt,l_sfaa.sfaacnfid,l_sfaa.sfaacnfdt,
          l_sfaa.sfaapstid,l_sfaa.sfaapstdt,l_sfaa.sfaastus,l_sfaa.sfaasite,l_sfaa.sfaadocno,
          l_sfaa.sfaadocdt,l_sfaa.sfaa001,l_sfaa.sfaa002,l_sfaa.sfaa003,l_sfaa.sfaa004,
          l_sfaa.sfaa005,l_sfaa.sfaa006,l_sfaa.sfaa007,l_sfaa.sfaa008,l_sfaa.sfaa009,
          l_sfaa.sfaa010,l_sfaa.sfaa011,l_sfaa.sfaa012,l_sfaa.sfaa013,l_sfaa.sfaa014,
          l_sfaa.sfaa015,l_sfaa.sfaa016,l_sfaa.sfaa017,l_sfaa.sfaa018,l_sfaa.sfaa019,
          l_sfaa.sfaa020,l_sfaa.sfaa021,l_sfaa.sfaa022,l_sfaa.sfaa023,l_sfaa.sfaa024,
          l_sfaa.sfaa025,l_sfaa.sfaa026,l_sfaa.sfaa027,l_sfaa.sfaa028,l_sfaa.sfaa029,
          l_sfaa.sfaa030,l_sfaa.sfaa031,l_sfaa.sfaa032,l_sfaa.sfaa033,l_sfaa.sfaa034,
          l_sfaa.sfaa035,l_sfaa.sfaa036,l_sfaa.sfaa037,l_sfaa.sfaa038,l_sfaa.sfaa039,
          l_sfaa.sfaa040,l_sfaa.sfaa041,l_sfaa.sfaa042,l_sfaa.sfaa043,l_sfaa.sfaa044,
          l_sfaa.sfaa045,l_sfaa.sfaa046,l_sfaa.sfaa047,l_sfaa.sfaa048,l_sfaa.sfaa049,
          l_sfaa.sfaa050,l_sfaa.sfaa051,l_sfaa.sfaa052,l_sfaa.sfaa053,l_sfaa.sfaa054,
          l_sfaa.sfaa055,l_sfaa.sfaa056,l_sfaa.sfaa057,l_sfaa.sfaa058,l_sfaa.sfaa059,
          l_sfaa.sfaa060,l_sfaa.sfaa061,l_sfaa.sfaa062,l_sfaa.sfaa063,l_sfaa.sfaa064,
          l_sfaa.sfaa065,l_sfaa.sfaa066,l_sfaa.sfaa067,l_sfaa.sfaa068,l_sfaa.sfaa069,
          l_sfaa.sfaa070,l_sfaa.sfaa071,l_sfaa.sfaa072
     FROM sfaa_t
   #161109-00085#39-e
    WHERE sfaaent   = g_enterprise
      AND sfaadocno = g_sfaa_d[l_ac_sfaa].sfaadocno_1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = g_sfaa_d[l_ac_sfaa].sfaadocno_1
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success  = FALSE
      RETURN r_success
   END IF
         
   LET g_sfaa_d[l_ac_sfaa].sfaa010_1 = l_sfaa.sfaa010  #生产料号
   LET g_sfaa_d[l_ac_sfaa].sfaa019_1 = l_sfaa.sfaa019  #预计开工日
   LET g_sfaa_d[l_ac_sfaa].sfaa020_1 = l_sfaa.sfaa020  #预计完工日
   LET g_sfaa_d[l_ac_sfaa].sfaa017_1 = l_sfaa.sfaa017  #部门厂商
   LET g_sfaa_d[l_ac_sfaa].sfaa002_1 = l_sfaa.sfaa002  #生管员
   LET g_sfaa_d[l_ac_sfaa].sfba003_1 = g_master.sfba003      #作业编号
   LET g_sfaa_d[l_ac_sfaa].sfba004_1 = g_master.sfba004      #作业序
   LET g_sfaa_d[l_ac_sfaa].sfaa012_1 = l_sfaa.sfaa012  #生产数量
   LET g_sfaa_d[l_ac_sfaa].sfaa049_1 = l_sfaa.sfaa049  #已发套数
   
   #已发齐套数
   CALL s_asft340_full_sets(g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1,'')
        RETURNING r_success,l_has_sets_1
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   #可齐料套数  计算发料单中只要未作废的算出齐套，再减去上面的已发齐套数l_has_sets_1
   CALL asfp310_full_sets(g_sfaa_d[l_ac_sfaa].sfaadocno_1,g_sfaa_d[l_ac_sfaa].sfba003_1,g_sfaa_d[l_ac_sfaa].sfba004_1)
        RETURNING r_success,l_can_sets_1
   IF NOT r_success THEN
      RETURN r_success
   END IF
   LET l_can_sets_1 = l_can_sets_1 - l_has_sets_1
   
   LET g_sfaa_d[l_ac_sfaa].has_sets_1= l_has_sets_1    #已发齐套数
   LET g_sfaa_d[l_ac_sfaa].can_sets_1= l_can_sets_1    #可齐料套数

   RETURN r_success
END FUNCTION

PRIVATE FUNCTION asfp310_set_no_entry_sfaa(p_cmd)
   DEFINE p_cmd    LIKE type_t.chr1
   
   IF cl_null(g_sfaa_d[l_ac_sfaa].sfba003_1) THEN
      CALL cl_set_comp_entry("sfba004_1",FALSE)  #作业序
   END IF
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("sfaadocno_1,sfba003_1,sfba004_1",FALSE)  #作业序 zll这块测试没通过，原因为lib没写好
   END IF
END FUNCTION
#根据条件产生新的资料，同时进行分配
PRIVATE FUNCTION asfp310_ins_table()
DEFINE l_cnt     LIKE type_t.num5
DEFINE l_success LIKE type_t.num5
   
   SELECT COUNT(*) INTO l_cnt FROM asfp310_sfaa
   IF l_cnt > 0 THEN
      #是否确定重新查询？
      IF NOT cl_ask_confirm('asf-00234') THEN
         RETURN
      END IF
   #ELSE
   #   #是否确定查询？
   #   IF NOT cl_ask_confirm('asf-00241') THEN
   #      RETURN
   #   END IF
   END IF
   CALL s_transaction_begin()

   #删除旧有资料
   CALL asfp310_del_temp() RETURNING l_success
   IF NOT l_success THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF

   #根据条件产生新的资料，同时进行分配
#   IF NOT asfp310_ins_table_sfaa() THEN   #170313-00003#1 mark
   IF NOT asfp310_ins_table_sfaa_new() THEN  #170313-00003#1 add
      CALL s_transaction_end('N','0')
      #资料显示
      CALL asfp310_b_fill()
      RETURN
   END IF

   CALL s_transaction_end('Y','0')
   
   #资料显示
   CALL asfp310_b_fill() 
END FUNCTION
# 工单可齐料套数计算：目前工单已经发料的部分+本作业界面上的发料量
PRIVATE FUNCTION asfp310_full_sets(p_sfaadocno,p_sfba003,p_sfba004)
   DEFINE p_sfaadocno          LIKE sfaa_t.sfaadocno  #工单单号
   DEFINE p_sfba003            LIKE sfba_t.sfba003    #作业编号
   DEFINE p_sfba004            LIKE sfba_t.sfba004    #作业序
   DEFINE r_success            LIKE type_t.num5       #处理状态 TRUE/FALSE
   DEFINE r_sets               LIKE type_t.num26_10   #工单齐料套数
   DEFINE l_sfaa012            LIKE sfaa_t.sfaa012                   #工单生产数量
   DEFINE l_sql                STRING
   #161109-00085#39-s
   #DEFINE l_sfdd               RECORD LIKE sfdd_t.*
   DEFINE l_sfdd RECORD  #發退料明細檔
       sfddent LIKE sfdd_t.sfddent, #企業編號
       sfddsite LIKE sfdd_t.sfddsite, #營運據點
       sfdddocno LIKE sfdd_t.sfdddocno, #發退料單號
       sfddseq LIKE sfdd_t.sfddseq, #項次
       sfddseq1 LIKE sfdd_t.sfddseq1, #項序
       sfdd001 LIKE sfdd_t.sfdd001, #發退料料號
       sfdd002 LIKE sfdd_t.sfdd002, #替代率
       sfdd003 LIKE sfdd_t.sfdd003, #庫位
       sfdd004 LIKE sfdd_t.sfdd004, #儲位
       sfdd005 LIKE sfdd_t.sfdd005, #批號
       sfdd006 LIKE sfdd_t.sfdd006, #單位
       sfdd007 LIKE sfdd_t.sfdd007, #數量
       sfdd008 LIKE sfdd_t.sfdd008, #參考單位
       sfdd009 LIKE sfdd_t.sfdd009, #參考單位數量
       sfdd010 LIKE sfdd_t.sfdd010, #庫存管理特徵
       sfdd011 LIKE sfdd_t.sfdd011, #包裝容器
       sfdd012 LIKE sfdd_t.sfdd012, #正負
       sfdd013 LIKE sfdd_t.sfdd013, #產品特徵
       sfdd014 LIKE sfdd_t.sfdd014, #備置量
       sfdd015 LIKE sfdd_t.sfdd015  #在揀量
   END RECORD
   #161109-00085#39-e
   #161109-00085#39-s
   #DEFINE l_sfdc               RECORD LIKE sfdc_t.*
   DEFINE l_sfdc RECORD  #發退料需求檔
       sfdcent LIKE sfdc_t.sfdcent, #企業編號
       sfdcsite LIKE sfdc_t.sfdcsite, #營運據點
       sfdcdocno LIKE sfdc_t.sfdcdocno, #發退料單號
       sfdcseq LIKE sfdc_t.sfdcseq, #項次
       sfdc001 LIKE sfdc_t.sfdc001, #工單單號
       sfdc002 LIKE sfdc_t.sfdc002, #工單項次
       sfdc003 LIKE sfdc_t.sfdc003, #工單項序
       sfdc004 LIKE sfdc_t.sfdc004, #需求料號
       sfdc005 LIKE sfdc_t.sfdc005, #產品特徵
       sfdc006 LIKE sfdc_t.sfdc006, #單位
       sfdc007 LIKE sfdc_t.sfdc007, #申請數量
       sfdc008 LIKE sfdc_t.sfdc008, #實際數量
       sfdc009 LIKE sfdc_t.sfdc009, #參考單位
       sfdc010 LIKE sfdc_t.sfdc010, #參考單位需求數量
       sfdc011 LIKE sfdc_t.sfdc011, #參考單位實際數量
       sfdc012 LIKE sfdc_t.sfdc012, #指定庫位
       sfdc013 LIKE sfdc_t.sfdc013, #指定儲位
       sfdc014 LIKE sfdc_t.sfdc014, #指定批號
       sfdc015 LIKE sfdc_t.sfdc015, #理由碼
       sfdc016 LIKE sfdc_t.sfdc016, #庫存管理特徴
       sfdc017 LIKE sfdc_t.sfdc017  #正負

   END RECORD
   #161109-00085#39-e
#161109-00085#39-s
#DEFINE l_sfba         RECORD LIKE sfba_t.*
DEFINE l_sfba RECORD  #工單備料單身檔
       sfbaent LIKE sfba_t.sfbaent, #企業編號
       sfbasite LIKE sfba_t.sfbasite, #營運據點
       sfbadocno LIKE sfba_t.sfbadocno, #單號
       sfbaseq LIKE sfba_t.sfbaseq, #項次
       sfbaseq1 LIKE sfba_t.sfbaseq1, #項序
       sfba001 LIKE sfba_t.sfba001, #上階料號
       sfba002 LIKE sfba_t.sfba002, #部位
       sfba003 LIKE sfba_t.sfba003, #作業編號
       sfba004 LIKE sfba_t.sfba004, #作業序
       sfba005 LIKE sfba_t.sfba005, #BOM料號
       sfba006 LIKE sfba_t.sfba006, #發料料號
       sfba007 LIKE sfba_t.sfba007, #投料時距
       sfba008 LIKE sfba_t.sfba008, #必要特性
       sfba009 LIKE sfba_t.sfba009, #倒扣料
       sfba010 LIKE sfba_t.sfba010, #標準QPA分子
       sfba011 LIKE sfba_t.sfba011, #標準QPA分母
       sfba012 LIKE sfba_t.sfba012, #允許誤差率
       sfba013 LIKE sfba_t.sfba013, #應發數量
       sfba014 LIKE sfba_t.sfba014, #單位
       sfba015 LIKE sfba_t.sfba015, #委外代買數量
       sfba016 LIKE sfba_t.sfba016, #已發數量
       sfba017 LIKE sfba_t.sfba017, #報廢數量
       sfba018 LIKE sfba_t.sfba018, #盤虧數量
       sfba019 LIKE sfba_t.sfba019, #指定發料倉庫
       sfba020 LIKE sfba_t.sfba020, #指定發料儲位
       sfba021 LIKE sfba_t.sfba021, #產品特徵
       sfba022 LIKE sfba_t.sfba022, #替代率
       sfba023 LIKE sfba_t.sfba023, #標準應發數量
       sfba024 LIKE sfba_t.sfba024, #調整應發數量
       sfba025 LIKE sfba_t.sfba025, #超領數量
       sfba026 LIKE sfba_t.sfba026, #SET替代狀態
       sfba027 LIKE sfba_t.sfba027, #SET替代群組
       sfba028 LIKE sfba_t.sfba028, #客供料
       sfba029 LIKE sfba_t.sfba029, #指定發料批號
       sfba030 LIKE sfba_t.sfba030, #指定庫存管理特徵
       sfba031 LIKE sfba_t.sfba031, #備置量
       sfba032 LIKE sfba_t.sfba032, #備置理由碼
       sfba033 LIKE sfba_t.sfba033, #保稅否
       sfba034 LIKE sfba_t.sfba034, #SET被替代群組
       sfba035 LIKE sfba_t.sfba035  #SET替代套數
END RECORD
#161109-00085#39-e
#161109-00085#39-s
#DEFINE l_sfba2         RECORD LIKE sfba_t.*
DEFINE l_sfba2 RECORD  #工單備料單身檔
       sfbaent LIKE sfba_t.sfbaent, #企業編號
       sfbasite LIKE sfba_t.sfbasite, #營運據點
       sfbadocno LIKE sfba_t.sfbadocno, #單號
       sfbaseq LIKE sfba_t.sfbaseq, #項次
       sfbaseq1 LIKE sfba_t.sfbaseq1, #項序
       sfba001 LIKE sfba_t.sfba001, #上階料號
       sfba002 LIKE sfba_t.sfba002, #部位
       sfba003 LIKE sfba_t.sfba003, #作業編號
       sfba004 LIKE sfba_t.sfba004, #作業序
       sfba005 LIKE sfba_t.sfba005, #BOM料號
       sfba006 LIKE sfba_t.sfba006, #發料料號
       sfba007 LIKE sfba_t.sfba007, #投料時距
       sfba008 LIKE sfba_t.sfba008, #必要特性
       sfba009 LIKE sfba_t.sfba009, #倒扣料
       sfba010 LIKE sfba_t.sfba010, #標準QPA分子
       sfba011 LIKE sfba_t.sfba011, #標準QPA分母
       sfba012 LIKE sfba_t.sfba012, #允許誤差率
       sfba013 LIKE sfba_t.sfba013, #應發數量
       sfba014 LIKE sfba_t.sfba014, #單位
       sfba015 LIKE sfba_t.sfba015, #委外代買數量
       sfba016 LIKE sfba_t.sfba016, #已發數量
       sfba017 LIKE sfba_t.sfba017, #報廢數量
       sfba018 LIKE sfba_t.sfba018, #盤虧數量
       sfba019 LIKE sfba_t.sfba019, #指定發料倉庫
       sfba020 LIKE sfba_t.sfba020, #指定發料儲位
       sfba021 LIKE sfba_t.sfba021, #產品特徵
       sfba022 LIKE sfba_t.sfba022, #替代率
       sfba023 LIKE sfba_t.sfba023, #標準應發數量
       sfba024 LIKE sfba_t.sfba024, #調整應發數量
       sfba025 LIKE sfba_t.sfba025, #超領數量
       sfba026 LIKE sfba_t.sfba026, #SET替代狀態
       sfba027 LIKE sfba_t.sfba027, #SET替代群組
       sfba028 LIKE sfba_t.sfba028, #客供料
       sfba029 LIKE sfba_t.sfba029, #指定發料批號
       sfba030 LIKE sfba_t.sfba030, #指定庫存管理特徵
       sfba031 LIKE sfba_t.sfba031, #備置量
       sfba032 LIKE sfba_t.sfba032, #備置理由碼
       sfba033 LIKE sfba_t.sfba033, #保稅否
       sfba034 LIKE sfba_t.sfba034, #SET被替代群組
       sfba035 LIKE sfba_t.sfba035  #SET替代套數
END RECORD
#161109-00085#39-e   
   DEFINE l_sfda002            LIKE sfda_t.sfda002
   DEFINE l_flag               LIKE type_t.chr1       #是否需要管控套数  工单备料有无参与计算齐料套数的备料
   DEFINE l_sfba013_tot        LIKE sfba_t.sfba013    #汇总实际发料数量
   DEFINE l_sfba013_rep        LIKE sfba_t.sfba013    #替代料 实际发料数量
   DEFINE l_sfba013            LIKE sfba_t.sfba013    #单笔发料数量 折算成项序为0的量
   DEFINE l_success            LIKE type_t.num5
   DEFINE l_min_sets           LIKE type_t.num26_10   #最小套数
   DEFINE l_sets               LIKE type_t.num26_10   #单项套数
   DEFINE l_rate               LIKE inaj_t.inaj014    #单位转换率
   DEFINE l_sql1               STRING              #170313-00003#1 add
   DEFINE l_cnt                LIKE type_t.num10   #170313-00003#1 add
   
   WHENEVER ERROR CONTINUE

   LET r_success = FALSE
   LET r_sets = 0
   IF cl_null(p_sfaadocno) THEN
      RETURN r_success,r_sets
   END IF

   #工单生产数量
   SELECT sfaa012 INTO l_sfaa012 FROM sfaa_t
    WHERE sfaaent   = g_enterprise
      AND sfaadocno = p_sfaadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success,r_sets
   END IF

   #仅找出项序为0的备料资料
   #161109-00085#39-s
   #LET l_sql = " SELECT sfba_t.* ",
   LET l_sql = " SELECT sfba_t.sfbaent,sfba_t.sfbasite,sfba_t.sfbadocno,sfba_t.sfbaseq,sfba_t.sfbaseq1,
                        sfba_t.sfba001,sfba_t.sfba002,sfba_t.sfba003,sfba_t.sfba004,sfba_t.sfba005,
                        sfba_t.sfba006,sfba_t.sfba007,sfba_t.sfba008,sfba_t.sfba009,sfba_t.sfba010,
                        sfba_t.sfba011,sfba_t.sfba012,sfba_t.sfba013,sfba_t.sfba014,sfba_t.sfba015,
                        sfba_t.sfba016,sfba_t.sfba017,sfba_t.sfba018,sfba_t.sfba019,sfba_t.sfba020,
                        sfba_t.sfba021,sfba_t.sfba022,sfba_t.sfba023,sfba_t.sfba024,sfba_t.sfba025,
                        sfba_t.sfba026,sfba_t.sfba027,sfba_t.sfba028,sfba_t.sfba029,sfba_t.sfba030,
                        sfba_t.sfba031,sfba_t.sfba032,sfba_t.sfba033,sfba_t.sfba034,sfba_t.sfba035",
   #161109-00085#39-s
               "  FROM sfaa_t,sfba_t ",
               " WHERE sfaaent   = sfbaent ",
               "   AND sfaasite  = sfbasite ",
               "   AND sfaadocno = sfbadocno ",
               "   AND sfaaent   = ",g_enterprise,
               "   AND sfaasite  = '",g_site,"'",
               "   AND sfaadocno = '",p_sfaadocno,"'",
               "   AND (sfba008  = '1' OR sfba008 = '2' )",    #1.主要材料  2.次要材料
               "   AND sfba009   = 'N' ",                      #倒扣料='N'
               "   AND sfbaseq1  = 0 ",                        #项次为0
               "   AND sfba023+sfba024-sfba015 > 0 ",          #总应发量-代买量>0
               " ORDER BY sfbaseq "
   #作业编号
   IF NOT cl_null(p_sfba003) THEN
      LET l_sql = l_sql CLIPPED," AND sfba003 = '",p_sfba003,"'"
   END IF
   #制程序
   IF NOT cl_null(p_sfba004) THEN
      LET l_sql = l_sql CLIPPED," AND sfba004 = '",p_sfba004,"'"
   END IF
   PREPARE asfp310_full_sets_2_p1 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'asfp310_full_sets_2_p1'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success,r_sets
   END IF
   DECLARE asfp310_full_sets_2_cs1 CURSOR FOR asfp310_full_sets_2_p1
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'asfp310_full_sets_2_cs1'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success,r_sets
   END IF
   #170313-00003#1 add-S
   LET l_sql = " SELECT SUM((sfba015+sfba016)/sfba022) ",
                  "  FROM sfaa_t,sfba_t ",
                  " WHERE sfaaent   = sfbaent ",
                  "   AND sfaasite  = sfbasite ",
                  "   AND sfaadocno = sfbadocno ",
                  "   AND sfaaent   = ",g_enterprise,
                  "   AND sfaasite  = '",g_site,"'",
                  "   AND sfaadocno = '",p_sfaadocno,"'",
                  "   AND sfbaseq   = ?",
                  "   AND sfbaseq1  > 0 "                        #项次不为0 表示取替代料
   #传入日期值不空时,找的发退料过帐日期不可大于此日期值
   PREPARE asfp310_full_sets_2_p3 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'asfp310_full_sets_2_p3'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF
   
   LET l_sql = " SELECT SUM(NVL(issue_qty_2,0)) ",
                  "  FROM sfaa_t,sfba_t,asfp310_sfba,asfp310_sfaa ",
                  " WHERE sfaaent   = sfbaent ",
                  "   AND sfaasite  = sfbasite ",
                  "   AND sfaadocno = sfbadocno ",
                  "   AND sfaaent   = ",g_enterprise,
                  "   AND sfaasite  = '",g_site,"'",
                  "   AND sfaadocno = '",p_sfaadocno,"'",
                  "   AND sfbaseq   = ?",
                  "   AND sfbaseq1  > 0 ",                        #项次不为0 表示取替代料
                  "   AND asfp310_sfba.seq_1 = asfp310_sfaa.seq_1 ",
                  "   AND asfp310_sfaa.sfaadocno_1 = sfba_t.sfbadocno ", #工单单号
                  "   AND asfp310_sfba.seq_2       = sfba_t.sfbaseq  ", #项次
                  "   AND asfp310_sfba.seq1_2      = sfba_t.sfbaseq1 " #项序
   PREPARE asfp310_full_sets_2_p4 FROM l_sql
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'asfp310_full_sets_2_p4'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN r_success
   END IF 
   #170313-00003#1 add-E
   
   LET l_flag = 'N'   #不需要管控套数
   #161109-00085#39-s   
   #FOREACH asfp310_full_sets_2_cs1 INTO l_sfba.*
   FOREACH asfp310_full_sets_2_cs1
   INTO l_sfba.sfbaent,l_sfba.sfbasite,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,
        l_sfba.sfba001,l_sfba.sfba002,l_sfba.sfba003,l_sfba.sfba004,l_sfba.sfba005,
        l_sfba.sfba006,l_sfba.sfba007,l_sfba.sfba008,l_sfba.sfba009,l_sfba.sfba010,
        l_sfba.sfba011,l_sfba.sfba012,l_sfba.sfba013,l_sfba.sfba014,l_sfba.sfba015,
        l_sfba.sfba016,l_sfba.sfba017,l_sfba.sfba018,l_sfba.sfba019,l_sfba.sfba020,
        l_sfba.sfba021,l_sfba.sfba022,l_sfba.sfba023,l_sfba.sfba024,l_sfba.sfba025,
        l_sfba.sfba026,l_sfba.sfba027,l_sfba.sfba028,l_sfba.sfba029,l_sfba.sfba030,
        l_sfba.sfba031,l_sfba.sfba032,l_sfba.sfba033,l_sfba.sfba034,l_sfba.sfba035
   #161109-00085#39-e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach asfp310_full_sets_2_cs1'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_success,r_sets
      END IF

      LET l_flag = 'Y'   #有需要管控套数

      LET l_sfba013_tot = 0  #汇总实际发料数量
      
      #----------------计算原始备料的可发汇-----------------------
      #委外代买数量算成已发料 BY SA
      #汇总实际发料数量 = 汇总实际发料数量 + 工单原始备料代买量 + 工单原始备料已发量
      LET l_sfba013_tot = l_sfba013_tot + l_sfba.sfba015 + l_sfba.sfba016

      #本作业中的发料量
      SELECT issue_qty_2 INTO l_sfba013
        FROM asfp310_sfba,asfp310_sfaa
       WHERE asfp310_sfba.seq_1       = asfp310_sfaa.seq_1
         AND asfp310_sfaa.sfaadocno_1 = l_sfba.sfbadocno #工单单号
         AND asfp310_sfba.seq_2       = l_sfba.sfbaseq   #项次
         AND asfp310_sfba.seq1_2      = l_sfba.sfbaseq1  #项序
      IF cl_null(l_sfba013) THEN LET l_sfba013 = 0 END IF
      #汇总实际发料数量  = 汇总实际发料数量 + 此作业中的原始备料的发料量
      LET l_sfba013_tot = l_sfba013_tot + l_sfba013
      #170313-00003#1 add-S
      LET l_sfba013_rep = 0
      LET l_sfba013 = 0
      EXECUTE asfp310_full_sets_2_p3 USING l_sfba.sfbaseq INTO l_sfba013_rep
      EXECUTE asfp310_full_sets_2_p4 USING l_sfba.sfbaseq INTO l_sfba013
      IF cl_null(l_sfba013_rep) THEN LET l_sfba013_rep = 0 END IF
      IF cl_null(l_sfba013) THEN LET l_sfba013 = 0 END IF
      LET l_sfba013_rep = l_sfba013_rep + l_sfba013      
      #170313-00003#1 add-E
      #170313-00003#1 mark-S
#      #----------------计算替代料的可发汇总,暂存为变量l_sfba013_rep-----------------------
#      #161109-00085#39-s 
#      #LET l_sql = " SELECT sfba_t.* ",
#      LET l_sql = " SELECT sfba_t.sfbaent,sfba_t.sfbasite,sfba_t.sfbadocno,sfba_t.sfbaseq,sfba_t.sfbaseq1,
#                           sfba_t.sfba001,sfba_t.sfba002,sfba_t.sfba003,sfba_t.sfba004,sfba_t.sfba005,
#                           sfba_t.sfba006,sfba_t.sfba007,sfba_t.sfba008,sfba_t.sfba009,sfba_t.sfba010,
#                           sfba_t.sfba011,sfba_t.sfba012,sfba_t.sfba013,sfba_t.sfba014,sfba_t.sfba015,
#                           sfba_t.sfba016,sfba_t.sfba017,sfba_t.sfba018,sfba_t.sfba019,sfba_t.sfba020,
#                           sfba_t.sfba021,sfba_t.sfba022,sfba_t.sfba023,sfba_t.sfba024,sfba_t.sfba025,
#                           sfba_t.sfba026,sfba_t.sfba027,sfba_t.sfba028,sfba_t.sfba029,sfba_t.sfba030,
#                           sfba_t.sfba031,sfba_t.sfba032,sfba_t.sfba033,sfba_t.sfba034,sfba_t.sfba035",
#      #161109-00085#39-e
#                  "  FROM sfaa_t,sfba_t ",
#                  " WHERE sfaaent   = sfbaent ",
#                  "   AND sfaasite  = sfbasite ",
#                  "   AND sfaadocno = sfbadocno ",
#                  "   AND sfaaent   = ",g_enterprise,
#                  "   AND sfaasite  = '",g_site,"'",
#                  "   AND sfaadocno = '",p_sfaadocno,"'",
#                  "   AND sfbaseq   = ",l_sfba.sfbaseq,
#                  "   AND sfbaseq1  > 0 ",                        #项次不为0 表示取替代料
#                  " ORDER BY sfbaseq1 "
#      #传入日期值不空时,找的发退料过帐日期不可大于此日期值
#      PREPARE asfp310_full_sets_2_p3 FROM l_sql
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'asfp310_full_sets_2_p3'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         RETURN r_success
#      END IF
#      DECLARE asfp310_full_sets_2_cs3 CURSOR FOR asfp310_full_sets_2_p3
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'asfp310_full_sets_2_cs3'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#
#         RETURN r_success
#      END IF
#      #开始计算当笔原始备料，总被取替代的量=工单中被取替代料的已发量 + 此作业中被取替代料的发料量
#      LET l_sfba013_rep = 0
#      #161109-00085#39-s
#      #FOREACH asfp310_full_sets_2_cs3 INTO l_sfba2.*
#      FOREACH asfp310_full_sets_2_cs3 INTO l_sfba2.sfbaent,l_sfba2.sfbasite,l_sfba2.sfbadocno,l_sfba2.sfbaseq,l_sfba2.sfbaseq1,
#                                           l_sfba2.sfba001,l_sfba2.sfba002,l_sfba2.sfba003,l_sfba2.sfba004,l_sfba2.sfba005,
#                                           l_sfba2.sfba006,l_sfba2.sfba007,l_sfba2.sfba008,l_sfba2.sfba009,l_sfba2.sfba010,
#                                           l_sfba2.sfba011,l_sfba2.sfba012,l_sfba2.sfba013,l_sfba2.sfba014,l_sfba2.sfba015,
#                                           l_sfba2.sfba016,l_sfba2.sfba017,l_sfba2.sfba018,l_sfba2.sfba019,l_sfba2.sfba020,
#                                           l_sfba2.sfba021,l_sfba2.sfba022,l_sfba2.sfba023,l_sfba2.sfba024,l_sfba2.sfba025,
#                                           l_sfba2.sfba026,l_sfba2.sfba027,l_sfba2.sfba028,l_sfba2.sfba029,l_sfba2.sfba030,
#                                           l_sfba2.sfba031,l_sfba2.sfba032,l_sfba2.sfba033,l_sfba2.sfba034,l_sfba2.sfba035
#      #161109-00085#39-e
#         IF SQLCA.sqlcode THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = SQLCA.sqlcode
#            LET g_errparam.extend = 'foreach asfp310_full_sets_2_cs2'
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            RETURN r_success,r_sets
#         END IF
#
#         #总被取替代的量    = 总被取替代的量 + （代买量 + 已发量）/ 替代率
#         LET l_sfba013_rep = l_sfba013_rep + (l_sfba.sfba015 + l_sfba.sfba016)/ l_sfba.sfba022
#
#         #本作业中的发料量
#         SELECT issue_qty_2 INTO l_sfba013
#           FROM asfp310_sfba,asfp310_sfaa
#          WHERE asfp310_sfba.seq_1       = asfp310_sfaa.seq_1
#            AND asfp310_sfaa.sfaadocno_1 = l_sfba2.sfbadocno #工单单号
#            AND asfp310_sfba.seq_2       = l_sfba2.sfbaseq   #项次
#            AND asfp310_sfba.seq1_2      = l_sfba2.sfbaseq1  #项序
#         IF cl_null(l_sfba013) THEN LET l_sfba013 = 0 END IF
#         #汇总实际发料数量  = 汇总实际发料数量 + 此作业中的原始备料的发料量
#         LET l_sfba013_rep = l_sfba013_rep + l_sfba013
#
#      END FOREACH
      #170313-00003#1 mark-E
      #汇总实际发料数量  = 汇总实际发料数量 + 被取替代的量（工单中被取替代料的已发量+此作业中被取替代料的发料量）
      LET l_sfba013_tot = l_sfba013_tot + l_sfba013_rep

      #单项足套数=(SUM(已发数量*替代率) / 项序0的标准QPA分子 * 项序0的标准QPA分母 WHERE 相同工单+项次)/(100-项序0的允许误差率)*100
      LET l_sets = (l_sfba013_tot  / l_sfba.sfba010 * l_sfba.sfba011 ) / (100 - l_sfba.sfba012) * 100

      IF cl_null(l_min_sets) OR l_min_sets > l_sets THEN
         LET l_min_sets = l_sets
      END IF

   END FOREACH

   #若工单无备料,或是工单备料均是事后扣帐或备料均为非主要材料,次要材料时,不卡控套数,直接赋生产数量
   IF l_flag = 'N' THEN
      LET l_min_sets = l_sfaa012
   ELSE
      #若算出的套数>生产数量,则套数置为生产数量
      IF l_min_sets > l_sfaa012 THEN
         LET l_min_sets = l_sfaa012
      END IF
   END IF
   LET r_sets = l_min_sets

   LET r_success = TRUE
   RETURN r_success,r_sets
   
END FUNCTION

PRIVATE FUNCTION asfp310_set_entry_sfaa(p_cmd)
   DEFINE p_cmd    LIKE type_t.chr1
   
   IF p_cmd != 'u' THEN
      CALL cl_set_comp_entry("sfaadocno_1,sfba003_1,sfba004_1",TRUE)  #工单、作业、作业序
   END IF
END FUNCTION

PRIVATE FUNCTION asfp310_sel_all(p_flag)
   DEFINE p_flag         LIKE type_t.chr1
   DEFINE l_i            LIKE type_t.num5

   FOR l_i = 1 TO g_rec_b_sfaa
       LET g_sfaa_d[l_i].sel_1 = p_flag
   END FOR

END FUNCTION

PRIVATE FUNCTION asfp310_adjust(p_flag,p_item,p_feature,p_inag004,p_inag005,p_inag006,p_inag003,p_inag007,p_can_qty)
DEFINE p_flag     LIKE type_t.chr1     #+：将差异量按优先顺序加到下一张   -：将差异量按优先顺序，从最后的开始扣
DEFINE p_item     LIKE sfba_t.sfba006  #料
DEFINE p_feature  LIKE sfba_t.sfba021  #产品特征
DEFINE p_inag004  LIKE inag_t.inag004  #仓
DEFINE p_inag005  LIKE inag_t.inag005  #储
DEFINE p_inag006  LIKE inag_t.inag006  #批
DEFINE p_inag003  LIKE inag_t.inag003  #库存管理特征
DEFINE p_inag007  LIKE inag_t.inag007  #单位
DEFINE p_can_qty  LIKE inan_t.inan010  #调整量 对发料在仓储批库存管理特征单位中的调整的量
DEFINE r_success  LIKE type_t.num5
DEFINE r_qty      LIKE inan_t.inan010  #调整掉的量
DEFINE l_qty      LIKE inan_t.inan010  #未备料的量
DEFINE l_qty2     LIKE inan_t.inan010 
DEFINE l_rate     LIKE sfdd_t.sfdd002
DEFINE l_type            LIKE type_t.chr10
DEFINE l_seq_1           LIKE type_t.num5
DEFINE l_seq_2           LIKE sfba_t.sfbaseq
DEFINE l_seq1_2          LIKE sfba_t.sfbaseq1
DEFINE l_no_issue_2      LIKE inan_t.inan010
DEFINE l_issue_qty_2     LIKE inan_t.inan010
DEFINE l_sfba006         LIKE sfba_t.sfba006
DEFINE l_sfba014         LIKE sfba_t.sfba014
DEFINE l_inag007         LIKE inag_t.inag007
DEFINE l_issue_qty       LIKE inan_t.inan010
DEFINE l_replace_rate_4  LIKE sfdd_t.sfdd002
DEFINE l_bmea007         LIKE bmea_t.bmea007
DEFINE l_bmea008         LIKE bmea_t.bmea008
DEFINE l_bmea019         LIKE bmea_t.bmea019
DEFINE l_bmea016         LIKE bmea_t.bmea016
DEFINE l_bmea017         LIKE bmea_t.bmea017
DEFINE l_max_qty         LIKE inan_t.inan010 #最大可被取替代量
DEFINE l_sql      STRING
DEFINE l_success  LIKE type_t.num5
DEFINE l_cnt      LIKE type_t.num5

   LET r_success = TRUE
   LET r_qty = 0
   
   #########################################################
   #+：将差异量按优先顺序加到下一张
   #########################################################
   IF p_flag = '+' THEN
      #找到下一张需要分配的资料
      LET l_sql = " SELECT 'inag',asfp310_sfba.seq_1,asfp310_sfba.seq_2,asfp310_sfba.seq1_2, ",
                  "        asfp310_sfba.no_issue_2,asfp310_sfba.issue_qty_2, ",
                  "        asfp310_sfba.sfba006_2,asfp310_sfba.sfba014_2, ",
                  "        asfp310_inag.inag007_3,asfp310_inag.issue_qty_3, ",
                  "        1,'', ",
                  "        '','', ",
                  "        '0',0 ",
                  "   FROM asfp310_sfba,asfp310_inag ",
                  "  WHERE asfp310_sfba.seq_1 = asfp310_inag.seq_1 ",
                  "    AND asfp310_sfba.seq_2 = asfp310_inag.seq_2 ",
                  "    AND asfp310_sfba.seq1_2 = asfp310_inag.seq1_2 ",
                  "    AND asfp310_sfba.seq_1 > ",g_sfaa_d[l_ac_sfaa].seq_1 ,        #优先顺序再其之后的
                  "    AND asfp310_sfba.no_issue_2 > asfp310_sfba.issue_qty_2 ",     #未发完的
                  "    AND asfp310_sfba.sfba006_2 = '",p_item,"'",     #料
                  "    AND asfp310_sfba.sfba021_2 = '",p_feature,"'",     #产品特征 add 141021 zhangllc
                  "    AND asfp310_inag.inag004_3 = '",p_inag004,"'",  #仓
                  "    AND asfp310_inag.inag005_3 = '",p_inag005,"'",  #储
                  "    AND asfp310_inag.inag006_3 = '",p_inag006,"'",  #批
                  "    AND asfp310_inag.inag003_3 = '",p_inag003,"'",  #库存管理特征
                  "    AND asfp310_inag.inag007_3 = '",p_inag007,"'",  #单位
                  " UNION ",
                  " SELECT 'bmea',asfp310_sfba.seq_1,asfp310_sfba.seq_2,asfp310_sfba.seq1_2, ",
                  "        asfp310_sfba.no_issue_2,asfp310_sfba.issue_qty_2, ",
                  "        asfp310_sfba.sfba006_2,asfp310_sfba.sfba014_2, ",
                  "        asfp310_bmea.inag007_4,asfp310_bmea.issue_qty_4, ",
                  "        asfp310_bmea.replace_rate_4,asfp310_bmea.bmea007_4, ",
                  "        asfp310_bmea.bmea008_4,asfp310_bmea.bmea019_4, ",
                  "        asfp310_bmea.bmea016_4,asfp310_bmea.bmea017_4 ",
                  "   FROM asfp310_sfba,asfp310_bmea ",
                  "  WHERE asfp310_sfba.seq_1 = asfp310_bmea.seq_1 ",
                  "    AND asfp310_sfba.seq_2 = asfp310_bmea.seq_2 ",
                  "    AND asfp310_sfba.seq1_2 = asfp310_bmea.seq1_2 ",
                  "    AND asfp310_sfba.seq_1 > ",g_sfaa_d[l_ac_sfaa].seq_1,         #优先顺序再其之后的
                  "    AND asfp310_sfba.no_issue_2 > asfp310_sfba.issue_qty_2 ",     #未发完的
                  "    AND asfp310_bmea.bmea008_4 = '",p_item,"' ",     #料
                  "    AND asfp310_bmea.bmea019_4 = '",p_feature,"'",     #产品特征 add 141021 zhangllc
                  "    AND asfp310_bmea.inag004_4 = '",p_inag004,"' ",  #仓
                  "    AND asfp310_bmea.inag005_4 = '",p_inag005,"' ",  #储
                  "    AND asfp310_bmea.inag006_4 = '",p_inag006,"' ",  #批
                  "    AND asfp310_bmea.inag003_4 = '",p_inag003,"' ",  #库存管理特征
                  "    AND asfp310_bmea.inag007_4 = '",p_inag007,"' ",  #单位
                  "  ORDER BY asfp310_sfba.seq_1 "
      PREPARE asfp310_adjust_p1 FROM l_sql
      DECLARE asfp310_adjust_c1 CURSOR FOR asfp310_adjust_p1
      FOREACH asfp310_adjust_c1 INTO l_type,l_seq_1,l_seq_2,l_seq1_2,
                                     l_no_issue_2,l_issue_qty_2,
                                     l_sfba006,l_sfba014,
                                     l_inag007,l_issue_qty,
                                     l_replace_rate_4,l_bmea007,l_bmea008,l_bmea019,l_bmea016,l_bmea017
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success,r_qty
         END IF
         #------------------------------------
         IF l_type = 'inag' THEN
            LET l_qty = l_no_issue_2 - l_issue_qty_2  #未备料的量=未发量-发料量
            #将未备料量转换成库存单位的量
            #mod 150101
            #IF l_inag007 = l_sfba014 THEN  #库存单位=备料单位
            #   LET l_rate = 1
            #ELSE
            #   CALL s_aimi190_get_convert(l_sfba006,l_sfba014,l_inag007) RETURNING l_success,l_rate
            #   IF NOT l_success THEN
            #      LET l_rate = 1
            #   END IF
            #END IF
            #LET l_qty= l_qty * l_rate
            IF l_inag007 != l_sfba014 THEN  #库存单位=备料单位
               CALL s_aooi250_convert_qty(l_sfba006,l_sfba014,l_inag007,l_qty)
                  RETURNING l_success,g_qty_t
               IF l_success THEN
                  LET l_qty = g_qty_t
               END IF
            END IF
            #mod 150101 end
            
            IF l_qty > p_can_qty THEN #未备料量 > 调整
               LET l_qty2 = p_can_qty  #调整的量
            ELSE
               LET l_qty2 = l_qty  #调整的量
            END IF
            LET l_issue_qty = l_issue_qty + l_qty2     #发料量
            LET p_can_qty = p_can_qty - l_qty2         #剩余调整量
            LET r_qty = r_qty + l_qty2   #总调整的量
            
            UPDATE asfp310_inag SET issue_qty_3 = l_issue_qty 
             WHERE seq_1     = l_seq_1
               AND seq_2     = l_seq_2
               AND seq1_2    = l_seq1_2
               AND inag004_3 = p_inag004
               AND inag005_3 = p_inag005
               AND inag006_3 = p_inag006
               AND inag003_3 = p_inag003
               AND inag007_3 = p_inag007
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd asfp310_inag'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_qty
            END IF
            
            #将调整的量转换回备料单位的量
            #mod 150101
            #LET l_qty2 = l_qty2 / l_rate
            IF l_inag007 != l_sfba014 THEN  #库存单位=备料单位
               CALL s_aooi250_convert_qty(l_sfba006,l_inag007,l_sfba014,l_qty2)
                  RETURNING l_success,g_qty_t
               IF l_success THEN
                  LET l_qty2= g_qty_t
               END IF
            END IF
            #mod 150101 end
            UPDATE asfp310_sfba SET issue_qty_2 = issue_qty_2 + l_qty2
             WHERE seq_1     = l_seq_1
               AND seq_2     = l_seq_2
               AND seq1_2    = l_seq1_2
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd asfp310_sfba'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_qty
            END IF

            IF p_can_qty = 0 THEN  #剩余调整的量=0 代表分配完毕
               EXIT FOREACH
            END IF            
         END IF
         
         #-------------------------------------
         IF l_type = 'bmea' THEN
            #完全取替代 计算能替换的量
            IF l_bmea016 = '2' THEN
               #检查是否有被其他料取替代
               SELECT COUNT(*) INTO l_cnt FROM asfp310_bmea
                WHERE seq_1     = l_seq_1
                  AND seq_2     = l_seq_2
                  AND seq1_2    = l_seq1_2
                  AND issue_qty_4 > 0
                  #AND (bmea007_4,bmea008_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4) NOT IN
                  #    (select bmea007_4,bmea008_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4
                  #       from asfp310_bmea
                  #      where seq_1     = l_seq_1
                  #        and seq_2     = l_seq_2
                  #        and seq1_2    = l_seq1_2
                  #        and bmea007_4 = l_bmea007
                  #        and bmea008_4 = l_bmea008
                  #        and inag004_4 = p_inag004
                  #        and inag005_4 = p_inag005
                  #        and inag006_4 = p_inag006
                  #        and inag003_4 = p_inag003
                  #        and inag007_4 = p_inag007
                  #    )
                  AND NOT EXISTS
                      (select bmea007_4,bmea008_4,bmea019_4,inag004_4,inag005_4,inag006_4,inag003_4,inag007_4
                         from asfp310_bmea
                        where seq_1     = l_seq_1
                          and seq_2     = l_seq_2
                          and seq1_2    = l_seq1_2
                          and bmea007_4 = l_bmea007
                          and bmea008_4 = l_bmea008
                          and bmea019_4 = l_bmea019
                          and inag004_4 = p_inag004
                          and inag005_4 = p_inag005
                          and inag006_4 = p_inag006
                          and inag003_4 = p_inag003
                          and inag007_4 = p_inag007)
               IF l_cnt > 0 THEN
                  CONTINUE FOREACH
               END IF
               #从替换角度看，能替换的量=所有的需备料的量=未发量 * 替换率
               LET l_max_qty = l_no_issue_2 * l_replace_rate_4
            END IF
            #部分取替代 计算能替换的量
            IF l_bmea016 = '1' THEN
               #从替换角度看，能替换的量=未发量 * 替换率 * 替代上限比率
               LET l_max_qty = l_no_issue_2 * l_replace_rate_4 * l_bmea017/100
            END IF

            LET l_qty = l_no_issue_2 - l_issue_qty_2  #未备料的量=未发量-发料量
            LET l_qty = l_qty * l_replace_rate_4  #将未备料量转换成库存单位的量

            IF l_qty > p_can_qty THEN #未备料量 > 剩余调整量
               LET l_qty2 = p_can_qty  #调整的量  
            ELSE
               LET l_qty2 = l_qty      #调整的量
            END IF     
            #调整后的发料量 不能超过 可替换的量 
            IF l_issue_qty + l_qty2 >  l_max_qty THEN
               LET l_qty2 = l_max_qty - l_issue_qty
            END IF       
            LET l_issue_qty = l_issue_qty + l_qty2  #发料量
            LET p_can_qty = p_can_qty - l_qty2  #剩余调整量
            LET r_qty = r_qty + l_qty2   #总调整的量
            
            UPDATE asfp310_bmea SET issue_qty_4 = l_issue_qty 
             WHERE seq_1     = l_seq_1
               AND seq_2     = l_seq_2
               AND seq1_2    = l_seq1_2
               AND bmea007_4 = l_bmea007
               AND bmea008_4 = l_bmea008
               AND bmea019_4 = l_bmea019
               AND inag004_4 = p_inag004
               AND inag005_4 = p_inag005
               AND inag006_4 = p_inag006
               AND inag003_4 = p_inag003
               AND inag007_4 = p_inag007
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd asfp310_bmea'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_qty
            END IF
            
            #将调整的量转换回备料单位的量
            LET l_qty2 = l_qty2 / l_replace_rate_4
            UPDATE asfp310_sfba SET issue_qty_2 = issue_qty_2 + l_qty2
             WHERE seq_1     = l_seq_1
               AND seq_2     = l_seq_2
               AND seq1_2    = l_seq1_2
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd asfp310_sfba'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_qty
            END IF
               
            IF p_can_qty = 0 THEN  #剩余调整的量=0 代表分配完毕
               EXIT FOREACH
            END IF  
         END IF
      END FOREACH
      
   END IF
   

   #########################################################
   #-：将差异量按优先顺序，从最后的开始扣
   #########################################################
   IF p_flag = '-' THEN
      #找到最后一张需要扣减的资料
      LET l_sql = " SELECT 'inag',asfp310_sfba.seq_1,asfp310_sfba.seq_2,asfp310_sfba.seq1_2, ",
                  "        asfp310_sfba.no_issue_2,asfp310_sfba.issue_qty_2, ",
                  "        asfp310_sfba.sfba006_2,asfp310_sfba.sfba014_2, ",
                  "        asfp310_inag.inag007_3,asfp310_inag.issue_qty_3, ",
                  "        1,'', ",
                  "        '','', ",
                  "        '0',0 ",
                  "   FROM asfp310_sfba,asfp310_inag ",
                  "  WHERE asfp310_sfba.seq_1 = asfp310_inag.seq_1 ",
                  "    AND asfp310_sfba.seq_2 = asfp310_inag.seq_2 ",
                  "    AND asfp310_sfba.seq1_2 = asfp310_inag.seq1_2 ",
                  "    AND asfp310_sfba.seq_1 > ",g_sfaa_d[l_ac_sfaa].seq_1 ,        #优先顺序再其之后的
                  "    AND asfp310_sfba.sfba006_2 = '",p_item,"'",     #料
                  "    AND asfp310_sfba.sfba021_2 = '",p_feature,"'",     #产品特征 add 141021 zhangllc
                  "    AND asfp310_inag.inag004_3 = '",p_inag004,"'",  #仓
                  "    AND asfp310_inag.inag005_3 = '",p_inag005,"'",  #储
                  "    AND asfp310_inag.inag006_3 = '",p_inag006,"'",  #批
                  "    AND asfp310_inag.inag003_3 = '",p_inag003,"'",  #库存管理特征
                  "    AND asfp310_inag.inag007_3 = '",p_inag007,"'",  #单位
                  "    AND asfp310_inag.issue_qty_3 > 0 ",   #有发过料的
                  " UNION ",
                  " SELECT 'bmea',asfp310_sfba.seq_1,asfp310_sfba.seq_2,asfp310_sfba.seq1_2, ",
                  "        asfp310_sfba.no_issue_2,asfp310_sfba.issue_qty_2, ",
                  "        asfp310_sfba.sfba006_2,asfp310_sfba.sfba014_2, ",
                  "        asfp310_bmea.inag007_4,asfp310_bmea.issue_qty_4, ",
                  "        asfp310_bmea.replace_rate_4,asfp310_bmea.bmea007_4, ",
                  "        asfp310_bmea.bmea008_4,asfp310_bmea.bmea019_4, ",
                  "        asfp310_bmea.bmea016_4,asfp310_bmea.bmea017_4 ",
                  "   FROM asfp310_sfba,asfp310_bmea ",
                  "  WHERE asfp310_sfba.seq_1 = asfp310_bmea.seq_1 ",
                  "    AND asfp310_sfba.seq_2 = asfp310_bmea.seq_2 ",
                  "    AND asfp310_sfba.seq1_2 = asfp310_bmea.seq1_2 ",
                  "    AND asfp310_sfba.seq_1 > ",g_sfaa_d[l_ac_sfaa].seq_1,         #优先顺序再其之后的
                  "    AND asfp310_bmea.bmea008_4 = '",p_item,"' ",     #料
                  "    AND asfp310_bmea.bmea019_4 = '",p_feature,"'",     #产品特征 add 141021 zhangllc
                  "    AND asfp310_bmea.inag004_4 = '",p_inag004,"' ",  #仓
                  "    AND asfp310_bmea.inag005_4 = '",p_inag005,"' ",  #储
                  "    AND asfp310_bmea.inag006_4 = '",p_inag006,"' ",  #批
                  "    AND asfp310_bmea.inag003_4 = '",p_inag003,"' ",  #库存管理特征
                  "    AND asfp310_bmea.inag007_4 = '",p_inag007,"' ",  #单位
                  "    AND asfp310_bmea.issue_qty_4 > 0 ",   #有发过料的
                  "  ORDER BY asfp310_sfba.seq_1 DESC "
      PREPARE asfp310_adjust_p2 FROM l_sql
      DECLARE asfp310_adjust_c2 CURSOR FOR asfp310_adjust_p2
      FOREACH asfp310_adjust_c2 INTO l_type,l_seq_1,l_seq_2,l_seq1_2,
                                     l_no_issue_2,l_issue_qty_2,
                                     l_sfba006,l_sfba014,
                                     l_inag007,l_issue_qty,
                                     l_replace_rate_4,l_bmea007,l_bmea008,l_bmea019,l_bmea016,l_bmea017
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success,r_qty
         END IF
         
         IF l_issue_qty > p_can_qty THEN  #发料量>剩余调整的量
            LET l_qty2 = p_can_qty    #本笔调整的量
         ELSE
            LET l_qty2 = l_issue_qty  #本笔调整的量
         END IF
         LET l_issue_qty = l_issue_qty - l_qty2 #发料量
         LET p_can_qty = p_can_qty - l_qty2 #剩余调整的量
         LET r_qty = r_qty + l_qty2   #总调整的量
         #-------------------------------------
         IF l_type = 'inag' THEN
            UPDATE asfp310_inag SET issue_qty_3 = l_issue_qty 
             WHERE seq_1     = l_seq_1
               AND seq_2     = l_seq_2
               AND seq1_2    = l_seq1_2
               AND inag004_3 = p_inag004
               AND inag005_3 = p_inag005
               AND inag006_3 = p_inag006
               AND inag003_3 = p_inag003
               AND inag007_3 = p_inag007
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd asfp310_inag'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_qty
            END IF
            
            #将调整的量转换回备料单位的量
            #mod 150101
            #IF l_inag007 = l_sfba014 THEN  #库存单位=备料单位
            #   LET l_rate = 1
            #ELSE
            #   CALL s_aimi190_get_convert(l_sfba006,l_sfba014,l_inag007) RETURNING l_success,l_rate
            #   IF NOT l_success THEN
            #      LET l_rate = 1
            #   END IF
            #END IF
            #LET l_qty2 = l_qty2 / l_rate
            IF l_inag007 != l_sfba014 THEN  #库存单位=备料单位
               CALL s_aooi250_convert_qty(l_sfba006,l_inag007,l_sfba014,l_qty2)
                  RETURNING l_success,g_qty_t
               IF l_success THEN
                  LET l_qty2 = g_qty_t
               END IF
            END IF
            #mod 150101 end
            UPDATE asfp310_sfba SET issue_qty_2 = issue_qty_2 - l_qty2
             WHERE seq_1     = l_seq_1
               AND seq_2     = l_seq_2
               AND seq1_2    = l_seq1_2
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd asfp310_sfba'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_qty
            END IF
         END IF
         
         #-------------------------------------
         IF l_type = 'bmea' THEN
            UPDATE asfp310_bmea SET issue_qty_4 = l_issue_qty 
             WHERE seq_1     = l_seq_1
               AND seq_2     = l_seq_2
               AND seq1_2    = l_seq1_2
               AND bmea007_4 = l_bmea007
               AND bmea008_4 = l_bmea008
               AND bmea019_4 = l_bmea019
               AND inag004_4 = p_inag004
               AND inag005_4 = p_inag005
               AND inag006_4 = p_inag006
               AND inag003_4 = p_inag003
               AND inag007_4 = p_inag007
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd asfp310_bmea'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_qty
            END IF
            
            #将调整的量转换回备料单位的量
            LET l_qty2 = l_qty2 / l_replace_rate_4
            UPDATE asfp310_sfba SET issue_qty_2 = issue_qty_2 - l_qty2
             WHERE seq_1     = l_seq_1
               AND seq_2     = l_seq_2
               AND seq1_2    = l_seq1_2
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd asfp310_sfba'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success,r_qty
            END IF
         END IF
         
         IF p_can_qty = 0 THEN  #剩余调整的量=0 代表扣减完毕
            EXIT FOREACH
         END IF 
      END FOREACH
      IF p_can_qty > 0 THEN  #剩余调整的量>0 表示超出可调整的数量范围
         #库存数量不足，不可超过可发数量r_qty(扣掉低优先级的发料量+未分配的库存量)
         LET r_qty = r_qty + g_un_qty
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00250'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = r_qty
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_qty
      END IF
   END IF

   RETURN r_success,r_qty
END FUNCTION

PRIVATE FUNCTION asfp310_drop_table()
   WHENEVER ERROR CONTINUE

   #检查事务中
   IF NOT s_transaction_chk('N',1) THEN
      RETURN
   END IF


   #基本资料单身-上
   DROP TABLE asfp310_sfaa;


   #基本资料单身-下
   DROP TABLE asfp310_sfba;

   #主要用料库存页签
   DROP TABLE asfp310_inag;


   #取替代料页签
   DROP TABLE asfp310_bmea;

END FUNCTION
#汇总备料发料量
PRIVATE FUNCTION asfp310_get_issue_qty2(p_type)
DEFINE p_type           LIKE type_t.chr10
DEFINE r_issue_qty_2    LIKE sfba_t.sfba016  #总备料发料量 
DEFINE l_inag007_3      LIKE inag_t.inag007
DEFINE l_issue_qty_3    LIKE sfba_t.sfba016
DEFINE l_rate           LIKE sfdd_t.sfdd002
DEFINE l_replace_rate_4 LIKE sfdd_t.sfdd002
DEFINE l_issue_qty_4    LIKE sfba_t.sfba016
DEFINE l_sql            STRING
DEFINE l_success        LIKE type_t.num5
DEFINE l_qty            LIKE sfba_t.sfba016
                  
   LET r_issue_qty_2 = 0

   #inag
   LET l_sql = " SELECT inag007_3,issue_qty_3 FROM asfp310_inag ",
               "  WHERE seq_1 = ",g_sfaa_d[l_ac_sfaa].seq_1, #顺序
               "    AND seq_2 = ",g_sfba_d[l_ac_sfba].seq_2, #项次
               "    AND seq1_2= ",g_sfba_d[l_ac_sfba].seq1_2 #项序
   PREPARE asfp310_get_issue_qty2_p1 FROM l_sql
   DECLARE asfp310_get_issue_qty2_c1 CURSOR FOR asfp310_get_issue_qty2_p1
   FOREACH asfp310_get_issue_qty2_c1 INTO l_inag007_3,l_issue_qty_3
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_issue_qty_2
      END IF
                  
      IF l_inag007_3 = g_sfba_d[l_ac_sfba].sfba014_2 THEN  #库存单位=备料单位
         LET r_issue_qty_2 = r_issue_qty_2 + l_issue_qty_3
      ELSE
         #mod 150101
         #CALL s_aimi190_get_convert(g_sfba_d[l_ac_sfba].sfba006_2,l_inag007_3,g_sfba_d[l_ac_sfba].sfba014_2) RETURNING l_success,l_rate
         #IF NOT l_success THEN
         #   LET l_rate = 1
         #END IF
         #LET r_issue_qty_2 = r_issue_qty_2 + l_issue_qty_3 * l_rate
         CALL s_aooi250_convert_qty(g_sfba_d[l_ac_sfba].sfba006_2,l_inag007_3,g_sfba_d[l_ac_sfba].sfba014_2,l_issue_qty_3)
            RETURNING l_success,g_qty_t
         IF NOT l_success THEN
            LET g_qty_t = l_issue_qty_3
         END IF
         LET r_issue_qty_2 = r_issue_qty_2 + g_qty_t
         #mod 150101 end
      END IF
   END FOREACH
                  
   #bmea
   LET l_sql = " SELECT replace_rate_4,issue_qty_4 FROM asfp310_bmea ",
               "  WHERE seq_1 = ",g_sfaa_d[l_ac_sfaa].seq_1, #顺序
               "    AND seq_2 = ",g_sfba_d[l_ac_sfba].seq_2, #项次
               "    AND seq1_2= ",g_sfba_d[l_ac_sfba].seq1_2 #项序
   PREPARE asfp310_get_issue_qty2_p2 FROM l_sql
   DECLARE asfp310_get_issue_qty2_c2 CURSOR FOR asfp310_get_issue_qty2_p2
   FOREACH asfp310_get_issue_qty2_c2 INTO l_replace_rate_4,l_issue_qty_4
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN r_issue_qty_2
      END IF
   
      LET r_issue_qty_2 = r_issue_qty_2 + l_issue_qty_4 / l_replace_rate_4
   END FOREACH
                  
   #-旧值+新值
   CASE p_type
      WHEN 'inag'
           LET l_qty = g_inag_d[g_ac_inag].issue_qty_3
           IF cl_null(l_qty) THEN LET l_qty = 0 END IF
           IF g_inag_d[g_ac_inag].inag007_3 = g_sfba_d[l_ac_sfba].sfba014_2 THEN  #库存单位=备料单位
              LET r_issue_qty_2 = r_issue_qty_2 - g_inag_d_t.issue_qty_3 + l_qty
           ELSE
              #mod 150101
              #CALL s_aimi190_get_convert(g_sfba_d[l_ac_sfba].sfba006_2,g_inag_d[g_ac_inag].inag007_3,g_sfba_d[l_ac_sfba].sfba014_2) RETURNING l_success,l_rate
              #IF NOT l_success THEN
              #   LET l_rate = 1
              #END IF
              #LET r_issue_qty_2 = r_issue_qty_2 - g_inag_d_t.issue_qty_3 * l_rate
              #                                  + l_qty * l_rate
              CALL s_aooi250_convert_qty(g_sfba_d[l_ac_sfba].sfba006_2,g_inag_d[g_ac_inag].inag007_3,g_sfba_d[l_ac_sfba].sfba014_2,g_inag_d_t.issue_qty_3)
                 RETURNING l_success,g_qty_t
              IF NOT l_success THEN
                 LET g_qty_t = g_inag_d_t.issue_qty_3
              END IF
              CALL s_aooi250_convert_qty(g_sfba_d[l_ac_sfba].sfba006_2,g_inag_d[g_ac_inag].inag007_3,g_sfba_d[l_ac_sfba].sfba014_2,l_qty)
                 RETURNING l_success,g_qty_t2
              IF NOT l_success THEN
                 LET g_qty_t2 = l_qty
              END IF
              LET r_issue_qty_2 = r_issue_qty_2 - g_qty_t
                                                + g_qty_t2
              #mod 150101 end
           END IF
      WHEN 'bmea'
           LET l_qty = g_bmea_d[g_ac_bmea].issue_qty_4
           IF cl_null(l_qty) THEN LET l_qty = 0 END IF
           LET r_issue_qty_2= r_issue_qty_2 - g_bmea_d_t.issue_qty_4 / l_replace_rate_4
                                            + l_qty / l_replace_rate_4
   END CASE
   
   RETURN r_issue_qty_2
END FUNCTION
#根据备料档资料，获取bom中的单位
PRIVATE FUNCTION asfp310_get_bmba010(p_sfba001,p_sfaa011,p_sfba006,p_sfba002,p_sfba003,p_sfba004)
DEFINE p_sfba001        LIKE sfba_t.sfba001  #备料档的上阶料号
DEFINE p_sfaa011        LIKE sfaa_t.sfaa011  #特性
DEFINE p_sfba006        LIKE sfba_t.sfba006  #元件料号
DEFINE p_sfba002        LIKE sfba_t.sfba002  #部位
DEFINE p_sfba003        LIKE sfba_t.sfba003  #作业编号
DEFINE p_sfba004        LIKE sfba_t.sfba004  #作业序
DEFINE r_success        LIKE type_t.num5
DEFINE r_bmba010        LIKE bmba_t.bmba010  #bom元件单位

   LET r_success = TRUE
   
   SELECT UNIQUE bmba010 INTO r_bmba010 FROM bmba_t  #bom元件单位
    WHERE bmbaent = g_enterprise  #l_bmea.bmeaent 
      AND bmbasite= g_site        #l_bmea.bmeasite
      AND bmba001 = p_sfba001     #l_bmea.bmea001   #主件料號
      AND bmba002 = p_sfaa011     #l_bmea.bmea002   #特性
      AND bmba003 = p_sfba006     #l_bmea.bmea003   #元件料號
      AND bmba004 = p_sfba002     #l_bmea.bmea004   #部位
      AND bmba007 = p_sfba003     #l_bmea.bmea005   #作業
      AND bmba008 = p_sfba004     #l_bmea.bmea006   #作業序
      AND to_char(bmba005,'yyyy-mm-dd hh24:mi:ss')<= g_today_dt
      AND (to_char(bmba006,'yyyy-mm-dd hh24:mi:ss')> g_today_dt OR to_char(bmba006,'yyyy-mm-dd hh24:mi:ss') IS NULL )
   IF SQLCA.sqlcode = 0 THEN
      RETURN r_success,r_bmba010
   END IF
   #此处若抓到多笔资料，说明bom资料异常，看生失效日期区间是否有重复的资料
   IF SQLCA.sqlcode != 100 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'sel bmba'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_bmba010
   END IF

   #没选择到  先按部位来取  部位作业序有否再做关联
   SELECT UNIQUE bmba010 INTO r_bmba010 FROM bmba_t  #bom元件单位
    WHERE bmbaent = g_enterprise  #l_bmea.bmeaent 
      AND bmbasite= g_site        #l_bmea.bmeasite
      AND bmba001 = p_sfba001     #l_bmea.bmea001   #主件料號
      AND bmba002 = p_sfaa011     #l_bmea.bmea002   #特性
      AND bmba003 = p_sfba006     #l_bmea.bmea003   #元件料號
      AND bmba004 = p_sfba002     #l_bmea.bmea004   #部位
      AND to_char(bmba005,'yyyy-mm-dd hh24:mi:ss')<= g_today_dt
      AND (to_char(bmba006,'yyyy-mm-dd hh24:mi:ss')> g_today_dt OR to_char(bmba006,'yyyy-mm-dd hh24:mi:ss') IS NULL )
   IF SQLCA.sqlcode = 0 THEN
      RETURN r_success,r_bmba010
   END IF
   #此处可能抓到多笔资料，如bom中有
   #部位 作业 作业序
   #B1   Z01  1
   #B1   Z02  1
   #工单备料中就部位维护了B1，作业、作业序不维护会有此种情况
   
   SELECT UNIQUE bmba010 INTO r_bmba010 FROM bmba_t  #bom元件单位
    WHERE bmbaent = g_enterprise  #l_bmea.bmeaent 
      AND bmbasite= g_site        #l_bmea.bmeasite
      AND bmba001 = p_sfba001     #l_bmea.bmea001   #主件料號
      AND bmba002 = p_sfaa011     #l_bmea.bmea002   #特性
      AND bmba003 = p_sfba006     #l_bmea.bmea003   #元件料號
      AND bmba007 = p_sfba003     #l_bmea.bmea005   #作業
      AND bmba008 = p_sfba004     #l_bmea.bmea006   #作業序
      AND to_char(bmba005,'yyyy-mm-dd hh24:mi:ss')<= g_today_dt
      AND (to_char(bmba006,'yyyy-mm-dd hh24:mi:ss')> g_today_dt OR to_char(bmba006,'yyyy-mm-dd hh24:mi:ss') IS NULL )
   IF SQLCA.sqlcode = 0 THEN
      RETURN r_success,r_bmba010
   END IF
   #此处可能抓到多笔资料，如bom中有
   #部位 作业 作业序
   #B1   Z01  1
   #B2   Z01  1
   #工单备料中就作业、作业序维护了Z01、1，部位不维护会有此种情况
        
   SELECT UNIQUE bmba010 INTO r_bmba010 FROM bmba_t  #bom元件单位
    WHERE bmbaent = g_enterprise  #l_bmea.bmeaent 
      AND bmbasite= g_site        #l_bmea.bmeasite
      AND bmba001 = p_sfba001     #l_bmea.bmea001   #主件料號
      AND bmba002 = p_sfaa011     #l_bmea.bmea002   #特性
      AND bmba003 = p_sfba006     #l_bmea.bmea003   #元件料號
      AND to_char(bmba005,'yyyy-mm-dd hh24:mi:ss')<= g_today_dt
      AND (to_char(bmba006,'yyyy-mm-dd hh24:mi:ss')> g_today_dt OR to_char(bmba006,'yyyy-mm-dd hh24:mi:ss') IS NULL )
   IF SQLCA.sqlcode = 0 THEN
      RETURN r_success,r_bmba010
   END IF
   #此处可能抓到多笔资料，如bom中有
   #部位 作业 作业序
   #B1   Z01  1
   #B2   Z01  1
   #B2   Z02  1
   #工单备料中部位、作业、作业序不维护会有此种情况
   #对应不到资料，也无法抓出元件单位
   
   #工单备料中有可能不存在于bom中的资料,可能抓不到bmba010的情况
   
   RETURN r_success,r_bmba010
END FUNCTION
#删除临时表资料
PRIVATE FUNCTION asfp310_del_temp()
   DEFINE r_success   LIKE type_t.num5
   
   LET r_success = TRUE
   
   DELETE FROM asfp310_sfaa
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'del asfp310_sfaa'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   DELETE FROM asfp310_sfba
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'del asfp310_sfba'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   DELETE FROM asfp310_inag
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'del asfp310_inag'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   DELETE FROM asfp310_bmea
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'del asfp310_bmea'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION
#
PRIVATE FUNCTION asfp310_upd_temp()
   DEFINE r_success        LIKE type_t.num5
   DEFINE l_issue_qty_2    LIKE inan_t.inan010  #单身汇总的备料发料量
   
   LET r_success = TRUE
   
   #g_ac_inag 和 g_ac_bmea 只可能有一个是大于0的 否则就是这变量给值错误
   IF g_ac_inag > 0 AND g_ac_bmea > 0 THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   ######
   #inag
   ######
   IF g_ac_inag > 0 THEN
      #先汇总数量，再更新
      CALL asfp310_get_issue_qty2('inag') RETURNING l_issue_qty_2
               
      UPDATE asfp310_inag SET issue_qty_3 = g_inag_d[g_ac_inag].issue_qty_3
       WHERE seq_1     = g_sfaa_d[l_ac_sfaa].seq_1 #項次
         AND seq_2     = g_sfba_d[l_ac_sfba].seq_2
         AND seq1_2    = g_sfba_d[l_ac_sfba].seq1_2
         AND inag004_3 = g_inag_d[g_ac_inag].inag004_3
         AND inag005_3 = g_inag_d[g_ac_inag].inag005_3
         AND inag006_3 = g_inag_d[g_ac_inag].inag006_3
         AND inag003_3 = g_inag_d[g_ac_inag].inag003_3
         AND inag007_3 = g_inag_d[g_ac_inag].inag007_3
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "upd asfp310_inag"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "upd asfp310_inag"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         OTHERWISE
            #更新issue_qty_2
            UPDATE asfp310_sfba SET issue_qty_2 = l_issue_qty_2
             WHERE seq_1 = g_sfaa_d[l_ac_sfaa].seq_1 #項次
               AND seq_2 = g_sfba_d[l_ac_sfba].seq_2
               AND seq1_2= g_sfba_d[l_ac_sfba].seq1_2
            IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "upd asfp310_sfba"
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success
            END IF    
            LET g_sfba_d[l_ac_sfba].issue_qty_2 = l_issue_qty_2                  
            #DISPLAY BY NAME g_sfba_d[l_ac_sfba].issue_qty_2                 
      END CASE

   END IF
   
   ######
   #bmea
   ######
   IF g_ac_bmea > 0 THEN
      #先汇总数量再更新
      CALL asfp310_get_issue_qty2('bmea') RETURNING l_issue_qty_2

      UPDATE asfp310_bmea SET issue_qty_4 = g_bmea_d[g_ac_bmea].issue_qty_4
       WHERE seq_1     = g_sfaa_d[l_ac_sfaa].seq_1 #項次
         AND seq_2     = g_sfba_d[l_ac_sfba].seq_2
         AND seq1_2    = g_sfba_d[l_ac_sfba].seq1_2
         AND bmea007_4 = g_bmea_d[g_ac_bmea].bmea007_4
         AND bmea008_4 = g_bmea_d[g_ac_bmea].bmea008_4
         AND bmea019_4 = g_bmea_d[g_ac_bmea].bmea019_4
         AND inag004_4 = g_bmea_d[g_ac_bmea].inag004_4
         AND inag005_4 = g_bmea_d[g_ac_bmea].inag005_4
         AND inag006_4 = g_bmea_d[g_ac_bmea].inag006_4
         AND inag003_4 = g_bmea_d[g_ac_bmea].inag003_4
         AND inag007_4 = g_bmea_d[g_ac_bmea].inag007_4
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "upd asfp310_bmea"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "upd asfp310_bmea"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         OTHERWISE
            #更新issue_qty_2
            UPDATE asfp310_sfba SET issue_qty_2 = l_issue_qty_2
             WHERE seq_1 = g_sfaa_d[l_ac_sfaa].seq_1 #項次
               AND seq_2 = g_sfba_d[l_ac_sfba].seq_2
               AND seq1_2= g_sfba_d[l_ac_sfba].seq1_2
            IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "upd asfp310_sfba"
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
               RETURN r_success
            END IF
            LET g_sfba_d[l_ac_sfba].issue_qty_2 = l_issue_qty_2                  
            #DISPLAY BY NAME g_sfba_d[l_ac_sfba].issue_qty_2
      END CASE

   END IF
   
   RETURN r_success
END FUNCTION

PRIVATE FUNCTION asfp310_chk_column()
   DEFINE r_success        LIKE type_t.num5
   DEFINE l_success        LIKE type_t.num5
   DEFINE l_issue_qty_2    LIKE inan_t.inan010  #单身汇总的备料发料量
   DEFINE l_can_qty        LIKE inan_t.inan010  #可发量
   DEFINE l_i              LIKE type_t.num5
   DEFINE l_qty            LIKE inan_t.inan010
   
   LET r_success = TRUE
   
   #g_ac_inag 和 g_ac_bmea 只可能有一个是大于0的 否则就是这变量给值错误
   IF g_ac_inag > 0 AND g_ac_bmea > 0 THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   ######
   #inag
   ######
   IF g_ac_inag > 0 THEN
      IF cl_null(g_inag_d[g_ac_inag].issue_qty_3) THEN
         RETURN r_success
      END IF
      #不可小于0
      IF g_inag_d[g_ac_inag].issue_qty_3 < 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'agl-00041'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      #不可超过库存量
      #可发量 =  现有库存数量 - 库存在捡量      # -    其他工单分配量
      LET l_can_qty = g_inag_d[g_ac_inag].inag008_3 - g_inag_d[g_ac_inag].inan010_3    # - g_inag_d[g_ac_inag].has_qty_3
      IF g_inag_d[g_ac_inag].issue_qty_3 > l_can_qty THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00042'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_can_qty
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      #加总不可超过未发数量
      CALL asfp310_get_issue_qty2('inag') RETURNING l_issue_qty_2
      IF l_issue_qty_2 > g_sfba_d[l_ac_sfba].no_issue_2 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00047'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_sfba_d[l_ac_sfba].no_issue_2
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF


      #----------------------------------------------
      #自动分配其他工单
      #當有調整分配數量時，若其他工單有需要此料件則將其他沒有鎖定的工單分配數量自動加減
      #例如兩張工單WO-1、WO-2都需要A料號，A料號庫存量只有100，
      #原來100全部都分配給WO-1，當把WO-1的數量減少為80時，則WO-2自動加入20的數量，(加到下一張的時候從優先順序最大的開始加)
      #如果再把WO-1的數量改為100，則WO-2的數量則再減少為0(扣的時候從順序最後的開始扣)
      #----------------------------------------------
      #库存未分配的量=库存量                         - 在捡量                        - 其他工单分配量                 - 本笔原始分配量
      LET g_un_qty = g_inag_d[g_ac_inag].inag008_3 - g_inag_d[g_ac_inag].inan010_3 - g_inag_d[g_ac_inag].has_qty_3 - g_inag_d_t.issue_qty_3
                  
      IF g_inag_d[g_ac_inag].issue_qty_3 > g_inag_d_t.issue_qty_3 THEN  #数量改大
         #需调整的量    =                              差异量                      - 未分配量
         LET l_can_qty = g_inag_d[g_ac_inag].issue_qty_3 - g_inag_d_t.issue_qty_3 - g_un_qty
         #将差异量按优先顺序，从最后的开始扣
         IF l_can_qty > 0 THEN
            #                  调整方式  料                        产品特征                       仓                            储                            批                            库存管理特征                    单位                          调整量
            CALL asfp310_adjust('-',g_sfba_d[l_ac_sfba].sfba006_2,g_sfba_d[l_ac_sfba].sfba021_2,g_inag_d[g_ac_inag].inag004_3,g_inag_d[g_ac_inag].inag005_3,g_inag_d[g_ac_inag].inag006_3,g_inag_d[g_ac_inag].inag003_3,g_inag_d[g_ac_inag].inag007_3,l_can_qty)
               RETURNING l_success,l_qty
            IF NOT l_success THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
            #刷新其他工单分配量
            LET g_inag_d[g_ac_inag].has_qty_3 = g_inag_d[g_ac_inag].has_qty_3 - l_qty
         END IF
      END IF
      IF g_inag_d[g_ac_inag].issue_qty_3 < g_inag_d_t.issue_qty_3 THEN  #数量改小
         IF g_un_qty <= 0 THEN   #若库存未分配量>0则代表之前库存分配的时候足够了，此次改小，多出的数量也无其他需求可分配
            #将差异量按优先顺序加到下一张
            LET l_can_qty = g_inag_d_t.issue_qty_3 - g_inag_d[g_ac_inag].issue_qty_3
            #                  调整方式  料                        产品特征                       仓                            储                            批                            库存管理特征                    单位                          调整量
            CALL asfp310_adjust('+',g_sfba_d[l_ac_sfba].sfba006_2,g_sfba_d[l_ac_sfba].sfba021_2,g_inag_d[g_ac_inag].inag004_3,g_inag_d[g_ac_inag].inag005_3,g_inag_d[g_ac_inag].inag006_3,g_inag_d[g_ac_inag].inag003_3,g_inag_d[g_ac_inag].inag007_3,l_can_qty)
               RETURNING l_success,l_qty
            IF NOT l_success THEN
               LET r_success = FALSE
               RETURN r_success
            END IF
            #刷新其他工单分配量
            LET g_inag_d[g_ac_inag].has_qty_3 = g_inag_d[g_ac_inag].has_qty_3 + l_qty
         END IF
      END IF

   END IF
   
   ######
   #bmea
   ######
   IF g_ac_bmea > 0 THEN
      IF cl_null(g_bmea_d[g_ac_bmea].issue_qty_4) THEN
         RETURN r_success
      END IF
      #不可小于0
      IF g_bmea_d[g_ac_bmea].issue_qty_4 < 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'agl-00041'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      #不可超过库存量
      #可发量 =  现有库存数量 - 库存在捡量 -    其他工单分配量
      LET l_can_qty = g_bmea_d[g_ac_bmea].inag008_4 - g_bmea_d[g_ac_bmea].inan010_4 - g_bmea_d[g_ac_bmea].has_qty_4
      IF g_bmea_d[g_ac_bmea].issue_qty_4 > l_can_qty THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00042'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_can_qty
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
      #不可超过应发量-->未发量
      CALL asfp310_get_issue_qty2('bmea') RETURNING l_issue_qty_2
      IF l_issue_qty_2 > g_sfba_d[l_ac_sfba].no_issue_2 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00047'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_sfba_d[l_ac_sfba].no_issue_2
         CALL cl_err()

         LET r_success = FALSE
         RETURN r_success
      END IF
 
      #替代方式如果是完全取替代時，只可發其中一個料件，不可混發
      IF g_bmea_d[g_ac_bmea].bmea016_4 = '2' AND g_bmea_d[g_ac_bmea].issue_qty_4 > 0 THEN
         FOR l_i = 1 TO g_rec_b_bmea
             IF l_i != g_ac_bmea THEN
                IF g_bmea_d[l_i].issue_qty_4 > 0 THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'asf-00248'
                   LET g_errparam.extend = g_sfba_d[l_ac_sfba].sfba006_2
                   LET g_errparam.popup = TRUE
                   LET g_errparam.replace[1] = g_bmea_d[l_i].bmea008_4
                   CALL cl_err()
                   LET r_success = FALSE
                   RETURN r_success
                END IF
             END IF
         END FOR
         #NEXT FIELD CURRENT
      END IF
      #替代方式如果是部分取代時，同一個料的發料量不可超過上限比率
      LET l_can_qty = g_sfba_d[l_ac_sfba].no_issue_2 * g_bmea_d[g_ac_bmea].replace_rate_4 * g_bmea_d[g_ac_bmea].bmea017_4/100  #上线比率的数量
      IF g_bmea_d[g_ac_bmea].bmea016_4 = '1' AND g_bmea_d[g_ac_bmea].issue_qty_4 > l_can_qty THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00249'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_can_qty
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: #170313-00003#1 add
################################################################################
PRIVATE FUNCTION asfp310_ins_table_sfaa_new()
DEFINE r_success     LIKE type_t.num5
DEFINE l_seq_1       LIKE type_t.num5
DEFINE l_sql1        STRING
DEFINE l_sql         STRING
DEFINE l_sfaa RECORD  #工單單頭檔
       sfaaent LIKE sfaa_t.sfaaent, #企業編號
       sfaaownid LIKE sfaa_t.sfaaownid, #資料所有者
       sfaaowndp LIKE sfaa_t.sfaaowndp, #資料所有部門
       sfaacrtid LIKE sfaa_t.sfaacrtid, #資料建立者
       sfaacrtdp LIKE sfaa_t.sfaacrtdp, #資料建立部門
       sfaacrtdt LIKE sfaa_t.sfaacrtdt, #資料創建日
       sfaamodid LIKE sfaa_t.sfaamodid, #資料修改者
       sfaamoddt LIKE sfaa_t.sfaamoddt, #最近修改日
       sfaacnfid LIKE sfaa_t.sfaacnfid, #資料確認者
       sfaacnfdt LIKE sfaa_t.sfaacnfdt, #資料確認日
       sfaapstid LIKE sfaa_t.sfaapstid, #資料過帳者
       sfaapstdt LIKE sfaa_t.sfaapstdt, #資料過帳日
       sfaastus LIKE sfaa_t.sfaastus, #狀態碼
       sfaasite LIKE sfaa_t.sfaasite, #營運據點
       sfaadocno LIKE sfaa_t.sfaadocno, #單號
       sfaadocdt LIKE sfaa_t.sfaadocdt, #單據日期
       sfaa001 LIKE sfaa_t.sfaa001, #變更版本
       sfaa002 LIKE sfaa_t.sfaa002, #生管人員
       sfaa003 LIKE sfaa_t.sfaa003, #工單類型
       sfaa004 LIKE sfaa_t.sfaa004, #發料制度
       sfaa005 LIKE sfaa_t.sfaa005, #工單來源
       sfaa006 LIKE sfaa_t.sfaa006, #來源單號
       sfaa007 LIKE sfaa_t.sfaa007, #來源項次
       sfaa008 LIKE sfaa_t.sfaa008, #來源項序
       sfaa009 LIKE sfaa_t.sfaa009, #參考客戶
       sfaa010 LIKE sfaa_t.sfaa010, #生產料號
       sfaa011 LIKE sfaa_t.sfaa011, #特性
       sfaa012 LIKE sfaa_t.sfaa012, #生產數量
       sfaa013 LIKE sfaa_t.sfaa013, #生產單位
       sfaa014 LIKE sfaa_t.sfaa014, #BOM版本
       sfaa015 LIKE sfaa_t.sfaa015, #BOM有效日期
       sfaa016 LIKE sfaa_t.sfaa016, #製程編號
       sfaa017 LIKE sfaa_t.sfaa017, #部門供應商
       sfaa018 LIKE sfaa_t.sfaa018, #協作據點
       sfaa019 LIKE sfaa_t.sfaa019, #預計開工日
       sfaa020 LIKE sfaa_t.sfaa020, #預計完工日
       sfaa021 LIKE sfaa_t.sfaa021, #母工單單號
       sfaa022 LIKE sfaa_t.sfaa022, #參考原始單號
       sfaa023 LIKE sfaa_t.sfaa023, #參考原始項次
       sfaa024 LIKE sfaa_t.sfaa024, #參考原始項序
       sfaa025 LIKE sfaa_t.sfaa025, #前工單單號
       sfaa026 LIKE sfaa_t.sfaa026, #料表批號(PBI)
       sfaa027 LIKE sfaa_t.sfaa027, #No Use
       sfaa028 LIKE sfaa_t.sfaa028, #專案編號
       sfaa029 LIKE sfaa_t.sfaa029, #WBS
       sfaa030 LIKE sfaa_t.sfaa030, #活動
       sfaa031 LIKE sfaa_t.sfaa031, #理由碼
       sfaa032 LIKE sfaa_t.sfaa032, #緊急比率
       sfaa033 LIKE sfaa_t.sfaa033, #優先順序
       sfaa034 LIKE sfaa_t.sfaa034, #預計入庫庫位
       sfaa035 LIKE sfaa_t.sfaa035, #預計入庫儲位
       sfaa036 LIKE sfaa_t.sfaa036, #手冊編號
       sfaa037 LIKE sfaa_t.sfaa037, #保稅核准文號
       sfaa038 LIKE sfaa_t.sfaa038, #保稅核銷
       sfaa039 LIKE sfaa_t.sfaa039, #備料已產生
       sfaa040 LIKE sfaa_t.sfaa040, #生產途程已確認
       sfaa041 LIKE sfaa_t.sfaa041, #凍結
       sfaa042 LIKE sfaa_t.sfaa042, #重工
       sfaa043 LIKE sfaa_t.sfaa043, #備置
       sfaa044 LIKE sfaa_t.sfaa044, #FQC
       sfaa045 LIKE sfaa_t.sfaa045, #實際開始發料日
       sfaa046 LIKE sfaa_t.sfaa046, #最後入庫日
       sfaa047 LIKE sfaa_t.sfaa047, #生管結案日
       sfaa048 LIKE sfaa_t.sfaa048, #成本結案日
       sfaa049 LIKE sfaa_t.sfaa049, #已發料套數
       sfaa050 LIKE sfaa_t.sfaa050, #已入庫合格量
       sfaa051 LIKE sfaa_t.sfaa051, #已入庫不合格量
       sfaa052 LIKE sfaa_t.sfaa052, #Bouns
       sfaa053 LIKE sfaa_t.sfaa053, #工單轉入數量
       sfaa054 LIKE sfaa_t.sfaa054, #工單轉出數量
       sfaa055 LIKE sfaa_t.sfaa055, #下線數量
       sfaa056 LIKE sfaa_t.sfaa056, #報廢數量
       sfaa057 LIKE sfaa_t.sfaa057, #委外類型
       sfaa058 LIKE sfaa_t.sfaa058, #參考數量
       sfaa059 LIKE sfaa_t.sfaa059, #預計入庫批號
       sfaa060 LIKE sfaa_t.sfaa060, #參考單位
       sfaa061 LIKE sfaa_t.sfaa061, #製程
       sfaa062 LIKE sfaa_t.sfaa062, #納入APS計算
       sfaa063 LIKE sfaa_t.sfaa063, #來源分批序
       sfaa064 LIKE sfaa_t.sfaa064, #參考原始分批序
       sfaa065 LIKE sfaa_t.sfaa065, #生管結案狀態
       sfaa066 LIKE sfaa_t.sfaa066, #多角流程編號
       sfaa067 LIKE sfaa_t.sfaa067, #多角流程式號
       sfaa068 LIKE sfaa_t.sfaa068, #成本中心
       sfaa069 LIKE sfaa_t.sfaa069, #可供給量
       sfaa070 LIKE sfaa_t.sfaa070, #原始預計完工日期
       sfaa071 LIKE sfaa_t.sfaa071, #齊料套數
       sfaa072 LIKE sfaa_t.sfaa072 #保稅否
END RECORD
DEFINE l_sfba003     LIKE sfba_t.sfba003
DEFINE l_sfba004     LIKE sfba_t.sfba004
DEFINE l_has_sets_1  LIKE sfaa_t.sfaa049  #已发齐套数
DEFINE l_can_sets_1  LIKE sfaa_t.sfaa049  #可齐料套数
DEFINE l_string      STRING
DEFINE l_sfba016     LIKE sfba_t.sfba016  #已发量
DEFINE l_is_full     LIKE type_t.chr1     #检查结果：可足套否
DEFINE l_is_gen      LIKE type_t.chr1
DEFINE l_cnt         LIKE type_t.num5
DEFINE l_cnt1        LIKE type_t.num5 
DEFINE l_sql99       STRING 
DEFINE l_cnt2        LIKE type_t.num5 
DEFINE l_cnt3        LIKE type_t.num5

   LET r_success = TRUE
   LET g_need_issue = 'Y'  #需分配数量否
   
   SELECT MAX(seq_1) INTO l_seq_1 FROM asfp310_sfaa
   IF cl_null(l_seq_1) THEN LET l_seq_1 = 0 END IF
   
   #------第一单身------------------------------------------
   IF NOT cl_null(g_master.sfba003) THEN
     LET l_sql1= " SELECT UNIQUE sfaaent,sfaaownid,sfaaowndp,sfaacrtid,sfaacrtdp,",
                 "               sfaacrtdt,sfaamodid,sfaamoddt,sfaacnfid,sfaacnfdt,",
                 "               sfaapstid,sfaapstdt,sfaastus,sfaasite,sfaadocno,",
                 "               sfaadocdt,sfaa001,sfaa002,sfaa003,sfaa004,",
                 "               sfaa005,sfaa006,sfaa007,sfaa008,sfaa009,",
                 "               sfaa010,sfaa011,sfaa012,sfaa013,sfaa014,",
                 "               sfaa015,sfaa016,sfaa017,sfaa018,sfaa019,",
                 "               sfaa020,sfaa021,sfaa022,sfaa023,sfaa024,",
                 "               sfaa025,sfaa026,sfaa027,sfaa028,sfaa029,",
                 "               sfaa030,sfaa031,sfaa032,sfaa033,sfaa034,",
                 "               sfaa035,sfaa036,sfaa037,sfaa038,sfaa039,",
                 "               sfaa040,sfaa041,sfaa042,sfaa043,sfaa044,",
                 "               sfaa045,sfaa046,sfaa047,sfaa048,sfaa049,",
                 "               sfaa050,sfaa051,sfaa052,sfaa053,sfaa054,",
                 "               sfaa055,sfaa056,sfaa057,sfaa058,sfaa059,",
                 "               sfaa060,sfaa061,sfaa062,sfaa063,sfaa064,",
                 "               sfaa065,sfaa066,sfaa067,sfaa068,sfaa069,",
                 "               sfaa070,sfaa071,sfaa072,sfba003,sfba004 ", 
                 "   FROM sfaa_t,sfba_t ", 
#                 "    ,pmdl_t,pmdn_t ",   #171018-00042#1 mark
                 "  WHERE sfaaent  = sfbaent ",
                 "    AND sfaadocno= sfbadocno ",
#                 "    AND ((pmdnud001 = sfaaud001 AND pmdn001 = sfaa010 AND pmdnent = sfaaent )",  #171018-00042#1 mark
#                 "    OR (pmdlent = sfaaent  AND pmdl008 = sfaadocno)) ",  #171018-00042#1 mark
                 "    AND sfaaent  = ",g_enterprise,
                 "    AND sfaasite = '",g_site,"' ",
                 "    AND sfaastus = 'F' ",
                 "    AND ",g_master.wc CLIPPED,  #工单范围QBE
                 "    AND ",tm.wc3 CLIPPED,  #进阶查询QBE--元件料号sfba006
                 "    AND sfba013 > sfba015 + sfba016 ",   #应发 > 代买+已发
                 "    AND sfba009 = 'N' ",   #非倒扣料
                #"    AND sfaa057 = '2' ",   #170926-00027#1 mark
                 "    AND sfba003='",g_master.sfba003,"' "  #作业编号   
      IF NOT cl_null(g_master.sfba004) AND g_master.sfba004 != 0 THEN
         LET l_sql1= l_sql1 CLIPPED," AND sfba004='",g_master.sfba004,"' "   #作业序
      END IF
   ELSE  
      LET l_sql1= " SELECT UNIQUE sfaaent,sfaaownid,sfaaowndp,sfaacrtid,sfaacrtdp,",
                  "               sfaacrtdt,sfaamodid,sfaamoddt,sfaacnfid,sfaacnfdt,",
                  "               sfaapstid,sfaapstdt,sfaastus,sfaasite,sfaadocno,",
                  "               sfaadocdt,sfaa001,sfaa002,sfaa003,sfaa004,",
                  "               sfaa005,sfaa006,sfaa007,sfaa008,sfaa009,",
                  "               sfaa010,sfaa011,sfaa012,sfaa013,sfaa014,",
                  "               sfaa015,sfaa016,sfaa017,sfaa018,sfaa019,",
                  "               sfaa020,sfaa021,sfaa022,sfaa023,sfaa024,",
                  "               sfaa025,sfaa026,sfaa027,sfaa028,sfaa029,",
                  "               sfaa030,sfaa031,sfaa032,sfaa033,sfaa034,",
                  "               sfaa035,sfaa036,sfaa037,sfaa038,sfaa039,",
                  "               sfaa040,sfaa041,sfaa042,sfaa043,sfaa044,",
                  "               sfaa045,sfaa046,sfaa047,sfaa048,sfaa049,",
                  "               sfaa050,sfaa051,sfaa052,sfaa053,sfaa054,",
                  "               sfaa055,sfaa056,sfaa057,sfaa058,sfaa059,",
                  "               sfaa060,sfaa061,sfaa062,sfaa063,sfaa064,",
                  "               sfaa065,sfaa066,sfaa067,sfaa068,sfaa069,",
                  "               sfaa070,sfaa071,sfaa072,'','' FROM sfaa_t,sfba_t ", 
#                  "  ,pmdl_t,pmdn_t ", #171018-00042#1 mark
                  "  WHERE sfaaent  = sfbaent ",
                  "    AND sfaadocno= sfbadocno ",
#                  "    AND ((pmdnud001 = sfaaud001 AND pmdn001 = sfaa010 AND pmdnent = sfaaent )", #171018-00042#1 mark
#                  "    OR (pmdlent = sfaaent  AND pmdl008 = sfaadocno)) ", #171018-00042#1 mark
                  "    AND sfaaent  = ",g_enterprise,
                  "    AND sfaasite = '",g_site,"' ",
                  "    AND sfaastus = 'F' ",
                  "    AND ",g_master.wc CLIPPED,  #工单范围QBE
                  "    AND ",tm.wc3 CLIPPED,  #进阶查询QBE--元件料号sfba006
                  "    AND sfba013 > sfba015 + sfba016 ",  #应发 > 代买+已发
                 #"    AND sfaa057 = '2' ",   #170926-00027#1 mark
                  "    AND sfba009 = 'N' "   #非倒扣料
   END IF

   CASE g_master.priority1
      WHEN '1'  #预计开工日
           LET l_string = "sfaa019"
      WHEN '2'  #预计完工日
           LET l_string = "sfaa020 "
      WHEN '3'  #紧急比率
           LET l_string = "sfaa032 "
      WHEN '4'  #工单单号
           LET l_string = "sfaadocno "
   END CASE
   CASE g_master.priority2
      WHEN '1'  #预计开工日
           LET l_string = l_string CLIPPED,",sfaa019"
      WHEN '2'  #预计完工日
           LET l_string = l_string CLIPPED,",sfaa020 "
      WHEN '3'  #紧急比率
           LET l_string = l_string CLIPPED,",sfaa032 "
      WHEN '4'  #工单单号
           LET l_string = l_string CLIPPED,",sfaadocno "
   END CASE
   CASE g_master.priority3
      WHEN '1'  #预计开工日
           LET l_string = l_string CLIPPED,",sfaa019"
      WHEN '2'  #预计完工日
           LET l_string = l_string CLIPPED,",sfaa020 "
      WHEN '3'  #紧急比率
           LET l_string = l_string CLIPPED,",sfaa032 "
      WHEN '4'  #工单单号
           LET l_string = l_string CLIPPED,",sfaadocno "
   END CASE
   CASE g_master.priority4
      WHEN '1'  #预计开工日
           LET l_string = l_string CLIPPED,",sfaa019"
      WHEN '2'  #预计完工日
           LET l_string = l_string CLIPPED,",sfaa020 "
      WHEN '3'  #紧急比率
           LET l_string = l_string CLIPPED,",sfaa032 "
      WHEN '4'  #工单单号
           LET l_string = l_string CLIPPED,",sfaadocno "
   END CASE
   
   #----若勾选g_master.no_sets：优先满足已发料未齐套工单
   #    则先走发过料的工单（先走可足套的，再走未足套的），再走未发过料的工单（先走可足套的，再走未足套的）
   #    
   #已发过料+可足套的
   
   LET l_sql1 = l_sql1," AND (NVL(sfba013,0)-NVL(sfba016,0)-NVL(sfba015,0)-NVL((SELECT SUM(NVL(sfdc007,0)) ",     
                  "           FROM sfdc_t,sfda_t                              ",
                  "          WHERE sfdcent = sfdaent AND sfdcdocno = sfdadocno",
                  "            AND sfdcent = ",g_enterprise,
                  "            AND sfdcent = sfbaent ",
                  "            AND sfdc001 = sfbadocno            ",
                  "            AND sfdc002 = sfbaseq                ",
                  "            AND sfdc003 = sfbaseq1             ",
                  "            AND sfdastus NOT IN ('X','S') ),0) ) > 0"
   IF g_master.no_sets = 'Y' THEN
      LET l_sql = l_sql1 CLIPPED," AND sfba016 <> 0 ORDER BY ",l_string  
   ELSE
      LET l_sql = l_sql1 CLIPPED," ORDER BY ",l_string
   END IF      
   PREPARE asfp310_ins_table_p14 FROM l_sql
   DECLARE asfp310_ins_table_c14 CURSOR FOR asfp310_ins_table_p14
   IF g_master.can_sets = 'Y' THEN  #可足套数者优先满足
      LET g_can_sets = 'Y'  #需足套否
   END IF
   LET l_cnt1 = 0  #xujing add
   LET l_cnt2 = 0  #xujing add
   FOREACH asfp310_ins_table_c14 INTO l_sfaa.*,l_sfba003,l_sfba004
      LET l_cnt1 = l_cnt1 + 1   #xujing add
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      SELECT COUNT(*) INTO l_cnt FROM sfba_t
       WHERE sfbaent   = l_sfaa.sfaaent
         AND sfbadocno = l_sfaa.sfaadocno
         AND (sfba014 IS NULL OR sfba014 = ' ')
      IF l_cnt > 0 THEN
         #工单备料缺少单位信息,请到[工单维护作业asft300]查核
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00403'
         LET g_errparam.extend = l_sfaa.sfaadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      LET l_seq_1 = l_seq_1 + 10  #顺序
      
      IF cl_null(l_sfba003) THEN LET l_sfba003 = ' ' END IF #作业
      IF cl_null(l_sfba004) THEN LET l_sfba004 = ' ' END IF #作业序
      
      #先插入sfba，因需判断足套否
      LET g_need_issue = 'Y'  #需分配数量否
      #                           顺序    工单单号          作业编号   作业序     主件料号        特征
      CALL asfp310_ins_table_sfba_new(l_seq_1,l_sfaa.sfaadocno,l_sfba003,l_sfba004,l_sfaa.sfaa010,l_sfaa.sfaa011)  #产生第二单身asfp310_sfba
         RETURNING r_success,l_is_full,l_is_gen
      IF NOT r_success THEN
         EXIT FOREACH
      END IF
      #检查g_master.can_sets：可足套数者优先满足
      IF (g_master.can_sets = 'Y' AND l_is_full='N') OR l_is_gen='N' THEN #未足套，则此工单先不产生 or 备料已足
         LET l_cnt2 = l_cnt2 + 1                        
         DELETE FROM asfp310_sfba WHERE seq_1 = l_seq_1
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         DELETE FROM asfp310_inag WHERE seq_1 = l_seq_1
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         DELETE FROM asfp310_bmea WHERE seq_1 = l_seq_1
         IF SQLCA.sqlcode THEN
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         LET l_seq_1 = l_seq_1 - 10  #顺序
         CONTINUE FOREACH
      END IF
 
      #已发齐套数
      CALL s_asft340_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004,'')
           RETURNING r_success,l_has_sets_1
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      #                        锁定        顺序       工单单号      生产料号   预计开工日     
      INSERT INTO asfp310_sfaa(lock_1,    seq_1,     sfaadocno_1, sfaa010_1, sfaa019_1, 
      #                        预计完工日  部门厂商    生管员        作业编号    作业序
                               sfaa020_1, sfaa017_1, sfaa002_1,   sfba003_1, sfba004_1,
      #                        生产数量    已发套数    已发齐套数   
                               sfaa012_1, sfaa049_1, has_sets_1)
        VALUES('N',            l_seq_1,        l_sfaa.sfaadocno,l_sfaa.sfaa010, l_sfaa.sfaa019,  
               l_sfaa.sfaa020, l_sfaa.sfaa017, l_sfaa.sfaa002,   l_sfba003,      l_sfba004,
               l_sfaa.sfaa012, l_sfaa.sfaa049, l_has_sets_1)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins asfp310_sfaa"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

   END FOREACH
   IF NOT r_success THEN
      RETURN r_success
   END IF
   DISPLAY "第1个foreach ",l_cnt1,"笔" 
   DISPLAY "第1个foreach 备料足CONTINUE  foreach",l_cnt2,"笔"      
   LET l_cnt3 = 0         #xujing add
   SELECT COUNT(1) INTO l_cnt3 FROM asfp310_sfaa   
   DISPLAY "第1个foreach 结束,临时表有",l_cnt3,"笔"  
   #已发过料+不能足套的（剔除可足套后的）
   IF g_master.can_sets = 'Y' THEN
      LET g_can_sets = 'N'  #可足套数者优先满足
      IF g_master.no_sets = 'Y' THEN
         LET l_sql = l_sql1 CLIPPED," AND sfba016 <>0 AND sfaadocno NOT IN (select unique sfaadocno_1 FROM asfp310_sfaa)",
                                    " ORDER BY ",l_string
      ELSE
         LET l_sql = l_sql1 CLIPPED," AND sfaadocno NOT IN (select unique sfaadocno_1 FROM asfp310_sfaa)",
                                    " ORDER BY ",l_string
      END IF
      PREPARE asfp310_ins_table_p125 FROM l_sql
      DECLARE asfp310_ins_table_c125 CURSOR FOR asfp310_ins_table_p125
      LET l_cnt1 = 0
      LET l_cnt2 = 0 
      FOREACH asfp310_ins_table_c125 INTO l_sfaa.*,l_sfba003,l_sfba004
         LET l_cnt1 = l_cnt1 + 1  
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
                
         LET l_seq_1 = l_seq_1 + 10  #顺序
         
         IF cl_null(l_sfba003) THEN LET l_sfba003 = ' ' END IF #作业
         IF cl_null(l_sfba004) THEN LET l_sfba004 = ' ' END IF #作业序
         
         #先插入sfba，因需判断足套否
         #                                 顺序    工单单号          作业编号   作业序     主件料号        特征
         CALL asfp310_ins_table_sfba_new(l_seq_1,l_sfaa.sfaadocno,l_sfba003,l_sfba004,l_sfaa.sfaa010,l_sfaa.sfaa011)  #产生第二单身asfp310_sfba
            RETURNING r_success,l_is_full,l_is_gen
         IF NOT r_success THEN
            EXIT FOREACH
         END IF

         IF l_is_gen='N' THEN #备料已足
            LET l_cnt2 = l_cnt2 + 1                   
            DELETE FROM asfp310_sfba WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_inag WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_bmea WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            LET l_seq_1 = l_seq_1 - 10  #顺序
            CONTINUE FOREACH
         END IF
 
         #已发齐套数
         CALL s_asft340_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004,'')
              RETURNING r_success,l_has_sets_1
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         #                        锁定        顺序       工单单号  ,   生产料号   预计开工日  
         INSERT INTO asfp310_sfaa(lock_1,    seq_1,     sfaadocno_1, sfaa010_1, sfaa019_1, 
         #                        预计完工日  部门厂商    生管员        作业编号    作业序
                                  sfaa020_1, sfaa017_1, sfaa002_1,   sfba003_1, sfba004_1,
         #                        生产数量    已发套数    已发齐套数  
                                  sfaa012_1, sfaa049_1, has_sets_1 )
           VALUES('N',            l_seq_1,        l_sfaa.sfaadocno, l_sfaa.sfaa010, l_sfaa.sfaa019, 
                  l_sfaa.sfaa020, l_sfaa.sfaa017, l_sfaa.sfaa002,   l_sfba003,      l_sfba004,
                  l_sfaa.sfaa012, l_sfaa.sfaa049, l_has_sets_1)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins asfp310_sfaa"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH
      DISPLAY "第2个foreach ",l_cnt1,"笔"
      DISPLAY "第2个foreach 备料足CONTINUE  foreach",l_cnt2,"笔"  
      LET l_cnt3 = 0        
      SELECT COUNT(1) INTO l_cnt3 FROM asfp310_sfaa  
      DISPLAY "第2个foreach 结束,临时表有",l_cnt3,"笔" 
   END IF
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   #----未发过料的工单
   #未发过料（经过上面，都已剔除发过料，剩余未发过料的）+可足套的
   IF g_master.no_sets = 'Y' THEN
      IF g_master.can_sets = 'Y' THEN  #可足套数者优先满足
         LET g_can_sets = 'Y'
      END IF
      LET l_sql = l_sql1 CLIPPED," AND sfaadocno NOT IN (select unique sfaadocno_1 FROM asfp310_sfaa) ",
                                 " ORDER BY ",l_string
      PREPARE asfp310_ins_table_p23 FROM l_sql
      DECLARE asfp310_ins_table_c23 CURSOR FOR asfp310_ins_table_p23
      LET l_cnt1 = 0 
      LET l_cnt2 = 0
      FOREACH asfp310_ins_table_c23 INTO l_sfaa.*,l_sfba003,l_sfba004
         LET l_cnt1 = l_cnt1 + 1  
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         
         LET l_seq_1 = l_seq_1 + 10  #顺序
         
         IF cl_null(l_sfba003) THEN LET l_sfba003 = ' ' END IF #作业
         IF cl_null(l_sfba004) THEN LET l_sfba004 = ' ' END IF #作业序
         
         #先插入sfba，因需判断足套否
         #                           顺序    工单单号          作业编号   作业序     主件料号        特征
         CALL asfp310_ins_table_sfba_new(l_seq_1,l_sfaa.sfaadocno,l_sfba003,l_sfba004,l_sfaa.sfaa010,l_sfaa.sfaa011)  #产生第二单身asfp310_sfba
            RETURNING r_success,l_is_full,l_is_gen
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         
         #检查g_master.can_sets：可足套数者优先满足
         IF (g_master.can_sets = 'Y' AND l_is_full='N') OR l_is_gen='N' THEN #未足套，则此工单先不产生 or 备料已足
            LET l_cnt2 = l_cnt2 + 1                        
            DELETE FROM asfp310_sfba WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_inag WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_bmea WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            LET l_seq_1 = l_seq_1 - 10  #顺序
            CONTINUE FOREACH
         END IF
       
         #已发齐套数
         CALL s_asft340_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004,'')
              RETURNING r_success,l_has_sets_1
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
       
         #                        锁定        顺序       工单单号  ,  生产料号   预计开工日
         INSERT INTO asfp310_sfaa(lock_1,    seq_1,     sfaadocno_1,sfaa010_1, sfaa019_1,
         #                        预计完工日  部门厂商    生管员        作业编号    作业序
                                  sfaa020_1, sfaa017_1, sfaa002_1,   sfba003_1, sfba004_1,
         #                        生产数量    已发套数    已发齐套数    
                                  sfaa012_1, sfaa049_1, has_sets_1) 
           VALUES('N',            l_seq_1,        l_sfaa.sfaadocno, l_sfaa.sfaa010, l_sfaa.sfaa019, 
                  l_sfaa.sfaa020, l_sfaa.sfaa017, l_sfaa.sfaa002,   l_sfba003,      l_sfba004,
                  l_sfaa.sfaa012, l_sfaa.sfaa049, l_has_sets_1 ) 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins asfp310_sfaa"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF

      END FOREACH
      DISPLAY "第3个foreach ",l_cnt1,"笔"
      DISPLAY "第3个foreach 备料足CONTINUE  foreach",l_cnt2,"笔"    
      LET l_cnt3 = 0        
      SELECT COUNT(1) INTO l_cnt3 FROM asfp310_sfaa   
      DISPLAY "第3个foreach 结束,临时表有",l_cnt3,"笔"  
   END IF
   IF NOT r_success THEN
      RETURN r_success
   END IF
   
   #未发过料+不能足套的（剔除可足套后的）
   IF g_master.can_sets = 'Y' THEN
      LET g_can_sets = 'N'  #可足套数者优先满足
      LET l_sql = l_sql1 CLIPPED," AND sfaadocno NOT IN (SELECT UNIQUE sfaadocno_1 FROM asfp310_sfaa) ",
                                 " ORDER BY ",l_string
      PREPARE asfp310_ins_table_p222 FROM l_sql
      DECLARE asfp310_ins_table_c222 CURSOR FOR asfp310_ins_table_p222
      LET l_cnt1 = 0 
      LET l_cnt2 = 0 
      FOREACH asfp310_ins_table_c222 INTO l_sfaa.*,l_sfba003,l_sfba004
         LET l_cnt1 = l_cnt1 + 1  
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
         

         LET l_seq_1 = l_seq_1 + 10  #顺序
         
         IF cl_null(l_sfba003) THEN LET l_sfba003 = ' ' END IF #作业
         IF cl_null(l_sfba004) THEN LET l_sfba004 = ' ' END IF #作业序
         
         #先插入sfba，因需判断足套否
         #                           顺序    工单单号          作业编号   作业序     主件料号        特征
         CALL asfp310_ins_table_sfba_new(l_seq_1,l_sfaa.sfaadocno,l_sfba003,l_sfba004,l_sfaa.sfaa010,l_sfaa.sfaa011)  #产生第二单身asfp310_sfba
            RETURNING r_success,l_is_full,l_is_gen
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
       
         IF l_is_gen='N' THEN #备料已足
            LET l_cnt2 = l_cnt2 + 1                           
            DELETE FROM asfp310_sfba WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_inag WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            DELETE FROM asfp310_bmea WHERE seq_1 = l_seq_1
            IF SQLCA.sqlcode THEN
               LET r_success = FALSE
               EXIT FOREACH
            END IF
            LET l_seq_1 = l_seq_1 - 10  #顺序
            CONTINUE FOREACH
         END IF
 
         #已发齐套数
         CALL s_asft340_full_sets(l_sfaa.sfaadocno,l_sfba003,l_sfba004,'')
              RETURNING r_success,l_has_sets_1
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
         
         #                        锁定        顺序       工单单号  ,   生产料号   预计开工日 
         INSERT INTO asfp310_sfaa(lock_1,    seq_1,     sfaadocno_1, sfaa010_1, sfaa019_1, 
         #                        预计完工日  部门厂商    生管员        作业编号    作业序
                                  sfaa020_1, sfaa017_1, sfaa002_1,   sfba003_1, sfba004_1,
         #                        生产数量    已发套数    已发齐套数   
                                  sfaa012_1, sfaa049_1, has_sets_1)
           VALUES('N',            l_seq_1,        l_sfaa.sfaadocno, l_sfaa.sfaa010, l_sfaa.sfaa019,
                  l_sfaa.sfaa020, l_sfaa.sfaa017, l_sfaa.sfaa002,   l_sfba003,      l_sfba004,
                  l_sfaa.sfaa012, l_sfaa.sfaa049, l_has_sets_1)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "ins asfp310_sfaa"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END FOREACH
      DISPLAY "第4个foreach ",l_cnt1,"笔" 
      DISPLAY "第4个foreach 备料足CONTINUE  foreach",l_cnt2,"笔"       
      LET l_cnt3 = 0        
      SELECT COUNT(1) INTO l_cnt3 FROM asfp310_sfaa 
      DISPLAY "第4个foreach 结束,临时表有",l_cnt3,"笔" 
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: #170313-00003#1 add
################################################################################
PRIVATE FUNCTION asfp310_ins_table_sfba_new(p_seq,p_sfaadocno,p_sfba003,p_sfba004,p_sfaa010,p_sfaa011)
DEFINE p_seq          LIKE type_t.num5     #顺序
DEFINE p_sfaadocno    LIKE sfaa_t.sfaadocno   #工单单号
DEFINE p_sfba003      LIKE sfba_t.sfba003     #作业编号
DEFINE p_sfba004      LIKE sfba_t.sfba004     #作业序
DEFINE p_sfaa010      LIKE sfaa_t.sfaa010     #主件料号
DEFINE p_sfaa011      LIKE sfaa_t.sfaa011     #特征
DEFINE r_success      LIKE type_t.num5
DEFINE r_is_full      LIKE type_t.chr1    #检查结果：可足套否
DEFINE r_is_gen       LIKE type_t.chr1    #工单需产生否  计算包括未审核未过账发料单中的料，已足料的工单无需产生
DEFINE l_sql          STRING
DEFINE l_sfba         RECORD LIKE sfba_t.*
DEFINE l_imaf053      LIKE imaf_t.imaf053  #据点库存单位
DEFINE l_imaf054      LIKE imaf_t.imaf054  #库存多单位
DEFINE l_sfdc007      LIKE sfdc_t.sfdc007  #发料单中的未作废未过账的数量
DEFINE l_count        LIKE type_t.num5     #备料中有发料需求的笔数
DEFINE l_success      LIKE type_t.num5  

   LET r_success = TRUE
   LET r_is_full = 'N'
   LET r_is_gen  = 'Y'
   LET l_count   = 0
   
   IF g_can_sets='Y' AND g_need_issue='N' THEN  #需满足足套，又不需分配数量，两者不能同时，冲突，如果不分配数量怎么知道可足套否
      LET r_success = FALSE
      RETURN r_success,r_is_full,r_is_gen
   END IF
   
   LET l_sql = " SELECT sfba_t.*,imaf053,imaf054 FROM sfba_t,imaf_t ",
               "  WHERE sfbaent = imafent ",
               "    AND sfbasite= imafsite",
               "    AND sfba006 = imaf001 ",  #料件
               "    AND sfbaent  = ",g_enterprise,
               "    AND sfbasite ='",g_site,"' ",
               "    AND ",tm.wc3 CLIPPED,  #进阶查询QBE--元件料号sfba006
               "    AND sfba013 > sfba015 + sfba016 ",   #应发 > 代买+已发
               "    AND sfba009 = 'N' ",   #非倒扣料
               "    AND sfbadocno ='",p_sfaadocno,"' "
   IF NOT cl_null(p_sfba003) THEN
      LET l_sql = l_sql CLIPPED," AND sfba003='",p_sfba003,"' "  #作业编号
      IF NOT cl_null(p_sfba004) AND p_sfba004 != 0 THEN
         LET l_sql = l_sql CLIPPED," AND sfba004='",p_sfba004,"' "   #作业序
      END IF
   END IF
   PREPARE asfp310_ins_table_sfba_p2 FROM l_sql
   DECLARE asfp310_ins_table_sfba_c2 CURSOR FOR asfp310_ins_table_sfba_p2
   
   LET l_sql = " SELECT SUM(sfdc007)                              ",     
               "  FROM sfdc_t,sfda_t                              ",
               " WHERE sfdcent = sfdaent AND sfdcdocno = sfdadocno",
               "   AND sfdcent = ",g_enterprise,
               "   AND sfdc001 = ?            ",
               "   AND sfdc002 = ?                ",
               "   AND sfdc003 = ?              ",
               "   AND sfdastus NOT IN ('X','S')"  
   PREPARE sel_sum_sfdc007 FROM l_sql
   LET l_sql = "INSERT INTO asfp310_sfba(seq_1      , seq_2      , seq1_2     , sfba002_2  , sfba003_2  ,  ",
      #        "                作业序        发料料号      产品特征     单位         应发数量                ",
               "                sfba004_2  , sfba006_2  , sfba021_2  , sfba014_2  , sfba013_2  ,           ",
      #        "                已发数量      未发数量      发料量       库存可用量    在捡量                 ",
               "                sfba016_2  , no_issue_2 , issue_qty_2, inag008_2  , inan010_2  ,           ",
      #        "                上阶料                                                                      ",
               "                sfba001_2 )                                                                ",
               " VALUES(?        ,?,?, ?, ?,   ",
               "        ?, ?, ? , ?, ?,   ",
               "        ?, ?  , ?  , ?   , ?   ,   ",
               "        ?)                       "
   PREPARE ins_asfp310_sfba2 FROM l_sql
   
   LET  l_sql = "UPDATE asfp310_sfba SET issue_qty_2= ?,   ",#发料量
                "              inag008_2  = ?,         ",#库存可用量  
                "              inan010_2  = ?                ",#在捡量
                "  WHERE seq_1 =?                                      ",
                "    AND seq_2 = ?                             ",
                "    AND seq1_2= ?                         "
   PREPARE upd_asfp310_sfba2 FROM l_sql
   
   CALL s_aooi200_get_slip(p_sfaadocno) RETURNING l_success,g_ooba002
   IF NOT l_success THEN
      LET r_success = FALSE
      LET r_is_gen = 'N'
      RETURN r_success,r_is_full,r_is_gen
   END IF
   CALL cl_get_doc_para(g_enterprise,g_site,g_ooba002,'D-MFG-0050')
      RETURNING g_para  #工單指定發料庫儲，發料時允許修改
      
   FOREACH asfp310_ins_table_sfba_c2 INTO l_sfba.*,l_imaf053,l_imaf054
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      IF cl_null(l_imaf054) THEN
         LET l_imaf054 = 'N'
         IF cl_null(l_imaf053) THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00476'
            LET g_errparam.extend = l_sfba.sfba006
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            EXIT FOREACH
         END IF
      END IF
      
      IF cl_null(l_sfba.sfba014) THEN
         #工单备料缺少单位信息,请到[工单维护作业asft300]查核
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'asf-00403'
         LET g_errparam.extend = p_sfaadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF
      
      EXECUTE sel_sum_sfdc007 INTO l_sfdc007
        USING l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1
      IF cl_null(l_sfdc007) THEN LET l_sfdc007=0 END IF
      
      LET g_no_issue_2  =  l_sfba.sfba013 - l_sfba.sfba016 - l_sfba.sfba015 - l_sfdc007 #未发数量=应发-已发-代买-发料单中未作废未过账的数量
      IF g_no_issue_2 <=0 THEN
         CONTINUE FOREACH
      ELSE
         LET l_count = l_count + 1
      END IF
      LET l_count = l_count + 1 
      LET g_issue_qty_2 =  0 #发料量
      
      LET g_inag008_2   =  0 #库存可用量
      LET g_inan010_2   =  0 #在捡量
      
      IF cl_null(l_sfba.sfba021) THEN LET l_sfba.sfba021 = ' ' END IF #特征
      
      EXECUTE ins_asfp310_sfba2 USING p_seq         , l_sfba.sfbaseq, l_sfba.sfbaseq1, l_sfba.sfba002, l_sfba.sfba003,
               l_sfba.sfba004, l_sfba.sfba006, l_sfba.sfba021 , l_sfba.sfba014, l_sfba.sfba013,
               l_sfba.sfba016, g_no_issue_2  , g_issue_qty_2  , g_inag008_2   , g_inan010_2   ,
               l_sfba.sfba001
      #xujing add()e
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins asfp310_sfba"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #------产生主要用料库存单身（同时累加g_inag008_2，g_inan010_2）------
      #                           顺序   工单单号         项次            项序            元件料号        产品特征       单位
      CALL asfp310_ins_table_inag(p_seq,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,l_sfba.sfba006,l_sfba.sfba021,l_sfba.sfba014,l_imaf053,l_imaf054)
         RETURNING r_success 
      IF NOT r_success THEN
         EXIT FOREACH
      END IF

      IF l_sfba.sfbaseq1 = 0 THEN #项序为0，非0的为已经被取替代的料，不可能再有替代资料
         #------产生取替代料单身（同时累加g_inag008_2，g_inan010_2）------
         #                           顺序   工单单号         项次            项序
         CALL asfp310_ins_table_bmea(p_seq,l_sfba.sfbadocno,l_sfba.sfbaseq,l_sfba.sfbaseq1,
         #                           主件料号   特性      元件料号        部位           作业编号        作业序         产品特征        单位            应发量         上阶料号
                                     p_sfaa010,p_sfaa011,l_sfba.sfba006,l_sfba.sfba002,l_sfba.sfba003,l_sfba.sfba004,l_sfba.sfba021,l_sfba.sfba014,l_sfba.sfba013,l_sfba.sfba001)
            RETURNING r_success
         IF NOT r_success THEN
            EXIT FOREACH
         END IF
      END IF
      IF g_no_issue_2 > 0 THEN  #未发量还有未分配的
         LET r_is_full = 'N'  #足套否
      ELSE
         LET r_is_full = 'Y'  #足套否
      END IF
      #若需判断足套
      IF g_can_sets = 'Y' AND r_is_full='N' THEN
         EXIT FOREACH
      END IF
      EXECUTE upd_asfp310_sfba2 USING  g_issue_qty_2,g_inag008_2,g_inan010_2,
                                      p_seq,l_sfba.sfbaseq,l_sfba.sfbaseq1
      IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd asfp310_sfba err'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         EXIT FOREACH
      END IF

   END FOREACH
   IF l_count = 0 THEN
      LET r_is_gen = 'N'
   END IF

   RETURN r_success,r_is_full,r_is_gen
END FUNCTION

#end add-point
 
{</section>}
 
