#該程式未解開Section, 採用最新樣板產出!
{<section id="asfr310_g01.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:11(2017-09-12 10:20:10), PR版次:0011(2017-09-12 10:27:50)
#+ Customerized Version.: SD版次:(), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000247
#+ Filename...: asfr310_g01
#+ Description: ...
#+ Creator....: 05231(2014-05-26 12:00:27)
#+ Modifier...: 10042 -SD/PR- 10042
 
{</section>}
 
{<section id="asfr310_g01.global" readonly="Y" >}
#報表 g01 樣板自動產生(Version:14)
#add-point:填寫註解說明 name="global.memo"
#161107-00012#1  2016/11/17 By shiun      增加倉庫(sfdc012)條件搜尋
#161129-00049#1  1026/12/06 By liuym    第一个子报表查询SQL语句预留一个位置给自定义栏位l_sfdc009_show
#170908-00042#35 2017/09/12 By 10042      T作業憑證列印增加QR code
#end add-point
#add-point:填寫註解說明 name="global.memo_customerization"

#end add-point
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
 
 
IMPORT os
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_report.inc"                  #報表使用的global
 
#報表 type 宣告
PRIVATE TYPE sr1_r RECORD
   sfda001 LIKE sfda_t.sfda001, 
   sfda002 LIKE sfda_t.sfda002, 
   sfda003 LIKE sfda_t.sfda003, 
   sfda004 LIKE sfda_t.sfda004, 
   sfda005 LIKE sfda_t.sfda005, 
   sfdadocdt LIKE sfda_t.sfdadocdt, 
   sfdadocno LIKE sfda_t.sfdadocno, 
   sfdaent LIKE sfda_t.sfdaent, 
   sfdasite LIKE sfda_t.sfdasite, 
   sfdastus LIKE sfda_t.sfdastus, 
   sfdb001 LIKE sfdb_t.sfdb001, 
   sfdb002 LIKE sfdb_t.sfdb002, 
   sfdb003 LIKE sfdb_t.sfdb003, 
   sfdb004 LIKE sfdb_t.sfdb004, 
   sfdb005 LIKE sfdb_t.sfdb005, 
   sfdb006 LIKE sfdb_t.sfdb006, 
   sfdb007 LIKE sfdb_t.sfdb007, 
   sfdb008 LIKE sfdb_t.sfdb008, 
   ooefl_t_ooefl003 LIKE ooefl_t.ooefl003, 
   ooag_t_ooag011 LIKE ooag_t.ooag011, 
   x_oocql_t_oocql004 LIKE oocql_t.oocql004, 
   x_t1_oocql004 LIKE oocql_t.oocql004, 
   l_sfda004_ooag011 LIKE type_t.chr300, 
   l_sfda003_ooefl003 LIKE type_t.chr1000, 
   l_sfda002_desc LIKE type_t.chr37, 
   l_sfaa010 LIKE type_t.chr37, 
   l_imaal003 LIKE type_t.chr30, 
   l_imaal004 LIKE type_t.chr30, 
   l_sfaa012 LIKE type_t.num20_6, 
   l_sfaa013 LIKE type_t.chr30, 
   l_sfaa011 LIKE type_t.chr30, 
   l_sfaa058 LIKE type_t.num20_6, 
   l_sfaa060 LIKE type_t.chr30, 
   l_sfaa058_show LIKE type_t.chr1
END RECORD
 
PRIVATE TYPE sr2_r RECORD
   ooff013 LIKE ooff_t.ooff013
END RECORD
 
 
DEFINE tm RECORD
       wc STRING,                  #where condition 
       store STRING                   #倉庫
       END RECORD
DEFINE sr DYNAMIC ARRAY OF sr1_r                   #宣告sr為sr1_t資料結構的動態陣列
DEFINE g_select        STRING
DEFINE g_from          STRING
DEFINE g_where         STRING
DEFINE g_order         STRING
DEFINE g_sql           STRING                         #report_select_prep,REPORT段使用
 
#add-point:自定義環境變數(Global Variable)(客製用) name="global.variable_customerization"

#end add-point
#add-point:自定義環境變數(Global Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
TYPE sr3_r RECORD  #子報表01
   sfdcseq    LIKE sfdc_t.sfdcseq,
   sfdc001    LIKE sfdc_t.sfdc001,
   sfdc002    LIKE sfdc_t.sfdc002,
   sfdc003    LIKE sfdc_t.sfdc003,
   sfdc004    LIKE sfdc_t.sfdc004,
   sfdc005    LIKE sfdc_t.sfdc005,
   imaal003   LIKE imaal_t.imaal003,
   imaal004   LIKE imaal_t.imaal004,
   sfba028    LIKE sfba_t.sfba028,
   imae092    LIKE imae_t.imae092,
   sfdc007    LIKE sfdc_t.sfdc007,
   sfdc006    LIKE sfdc_t.sfdc006,
   sfdc010    LIKE sfdc_t.sfdc010,
   sfdc009    LIKE sfdc_t.sfdc009,
   l_sfdc012_inayl003 LIKE type_t.chr1000,
   l_sfdc013_inab003 LIKE type_t.chr1000,
   sfdc014    LIKE sfdc_t.sfdc014,
   sfdc016    LIKE sfdc_t.sfdc016,
   sfba001    LIKE sfba_t.sfba001,
   sfaa011    LIKE sfaa_t.sfaa011,
   sfba002    LIKE sfba_t.sfba002,
   sfba003    LIKE sfba_t.sfba003,
   sfba004    LIKE sfba_t.sfba004,
   l_sfdc009_show LIKE type_t.chr1
END RECORD
#end add-point
 
{</section>}
 
{<section id="asfr310_g01.main" readonly="Y" >}
PUBLIC FUNCTION asfr310_g01(p_arg1,p_arg2)
DEFINE  p_arg1 STRING                  #tm.wc  where condition 
DEFINE  p_arg2 STRING                  #tm.store  倉庫
#add-point:init段define (客製用) name="component_name.define_customerization"

#end add-point
#add-point:init段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="component_name.define"

#end add-point
 
   LET tm.wc = p_arg1
   LET tm.store = p_arg2
 
   #add-point:報表元件參數準備 name="component.arg.prep"
   #161107-00012#1-add-s
   IF cl_null(tm.store) THEN
     LET tm.store = " 1=1 "   
   END IF
   #161107-00012#1-add-e
   #end add-point
   #報表元件代號
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   ##報表元件執行期間是否有錯誤代碼
   LET g_rep_success = 'Y'   
   
   LET g_rep_code = "asfr310_g01"
   IF cl_null(tm.wc) THEN LET tm.wc = " 1=1" END IF
 
   #主報表select子句準備
   CALL asfr310_g01_sel_prep()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料存入array
   CALL asfr310_g01_ins_data()
   
   IF g_rep_success = 'N' THEN
      RETURN
   END IF   
 
   #將資料印出
   CALL asfr310_g01_rep_data()
 
END FUNCTION
 
{</section>}
 
{<section id="asfr310_g01.sel_prep" readonly="Y" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION asfr310_g01_sel_prep()
   #add-point:sel_prep段define (客製用) name="sel_prep.define_customerization"
   
   #end add-point
   #add-point:sel_prep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sel_prep.define"
   
   #end add-point
 
   #add-point:sel_prep before name="sel_prep.before"
   
   #end add-point
   
   #add-point:sel_prep g_select name="sel_prep.g_select"
   
   #end add-point
   LET g_select = " SELECT sfda001,sfda002,sfda003,sfda004,sfda005,sfdadocdt,sfdadocno,sfdaent,sfdasite, 
       sfdastus,sfdb001,sfdb002,sfdb003,sfdb004,sfdb005,sfdb006,sfdb007,sfdb008,( SELECT ooefl003 FROM ooefl_t WHERE ooefl_t.ooefl001 = sfda_t.sfda003 AND ooefl_t.ooeflent = sfda_t.sfdaent AND ooefl_t.ooefl002 = '" , 
       g_dlang,"'" ,"),( SELECT ooag011 FROM ooag_t WHERE ooag_t.ooag001 = sfda_t.sfda004 AND ooag_t.ooagent = sfda_t.sfdaent), 
       x.oocql_t_oocql004,x.t1_oocql004,trim(sfda004)||'.'||trim((SELECT ooag011 FROM ooag_t WHERE ooag_t.ooag001 = sfda_t.sfda004 AND ooag_t.ooagent = sfda_t.sfdaent)), 
       trim(sfda003)||'.'||trim((SELECT ooefl003 FROM ooefl_t WHERE ooefl_t.ooefl001 = sfda_t.sfda003 AND ooefl_t.ooeflent = sfda_t.sfdaent AND ooefl_t.ooefl002 = '" , 
       g_dlang,"'" ,")),'','','','',NULL,'','',NULL,'',''"
 
   #add-point:sel_prep g_from name="sel_prep.g_from"
   
   #end add-point
    LET g_from = " FROM sfda_t LEFT OUTER JOIN ( SELECT sfdb_t.*,( SELECT oocql004 FROM oocql_t WHERE oocql_t.oocqlent = sfdb_t.sfdbent AND oocql_t.oocql001 = '215' AND oocql_t.oocql002 = sfdb_t.sfdb003 AND oocql_t.oocql003 = '" , 
        g_dlang,"'" ,") oocql_t_oocql004,( SELECT oocql004 FROM oocql_t WHERE oocql_t.oocqlent = sfdb_t.sfdbent AND oocql_t.oocql001 = '221' AND oocql_t.oocql002 = sfdb_t.sfdb004 AND oocql_t.oocql003 = '" , 
        g_dlang,"'" ,") t1_oocql004 FROM sfdb_t ) x  ON sfda_t.sfdaent = x.sfdbent AND sfda_t.sfdasite  
        = x.sfdbsite AND sfda_t.sfdadocno = x.sfdbdocno"
 
   #add-point:sel_prep g_where name="sel_prep.g_where"
   
   #end add-point
    LET g_where = " WHERE " ,tm.wc CLIPPED 
 
   #add-point:sel_prep g_order name="sel_prep.g_order"
   
   #end add-point
    LET g_order = " ORDER BY sfdadocno"
 
   #add-point:sel_prep.sql.before name="sel_prep.sql.before"
   
   #end add-point:sel_prep.sql.before
   LET g_where = g_where ,cl_sql_add_filter("sfda_t")   #資料過濾功能
   LET g_sql = g_select CLIPPED ," ",g_from CLIPPED ," ",g_where CLIPPED ," ",g_order CLIPPED
   LET g_sql = cl_sql_add_mask(g_sql)    #遮蔽特定資料, 若寫至add-point也需複製此段 
 
   #add-point:sel_prep.sql.after name="sel_prep.sql.after"
   
   #end add-point
   PREPARE asfr310_g01_prepare FROM g_sql
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = 'prepare:'
      LET g_errparam.code   = STATUS
      LET g_errparam.popup  = TRUE
      CALL cl_err()   
      LET g_rep_success = 'N'    
   END IF
   DECLARE asfr310_g01_curs CURSOR FOR asfr310_g01_prepare
 
END FUNCTION
 
{</section>}
 
{<section id="asfr310_g01.ins_data" readonly="Y" >}
PRIVATE FUNCTION asfr310_g01_ins_data()
#主報表record(用於select子句)
   DEFINE sr_s RECORD 
   sfda001 LIKE sfda_t.sfda001, 
   sfda002 LIKE sfda_t.sfda002, 
   sfda003 LIKE sfda_t.sfda003, 
   sfda004 LIKE sfda_t.sfda004, 
   sfda005 LIKE sfda_t.sfda005, 
   sfdadocdt LIKE sfda_t.sfdadocdt, 
   sfdadocno LIKE sfda_t.sfdadocno, 
   sfdaent LIKE sfda_t.sfdaent, 
   sfdasite LIKE sfda_t.sfdasite, 
   sfdastus LIKE sfda_t.sfdastus, 
   sfdb001 LIKE sfdb_t.sfdb001, 
   sfdb002 LIKE sfdb_t.sfdb002, 
   sfdb003 LIKE sfdb_t.sfdb003, 
   sfdb004 LIKE sfdb_t.sfdb004, 
   sfdb005 LIKE sfdb_t.sfdb005, 
   sfdb006 LIKE sfdb_t.sfdb006, 
   sfdb007 LIKE sfdb_t.sfdb007, 
   sfdb008 LIKE sfdb_t.sfdb008, 
   ooefl_t_ooefl003 LIKE ooefl_t.ooefl003, 
   ooag_t_ooag011 LIKE ooag_t.ooag011, 
   x_oocql_t_oocql004 LIKE oocql_t.oocql004, 
   x_t1_oocql004 LIKE oocql_t.oocql004, 
   l_sfda004_ooag011 LIKE type_t.chr300, 
   l_sfda003_ooefl003 LIKE type_t.chr1000, 
   l_sfda002_desc LIKE type_t.chr37, 
   l_sfaa010 LIKE type_t.chr37, 
   l_imaal003 LIKE type_t.chr30, 
   l_imaal004 LIKE type_t.chr30, 
   l_sfaa012 LIKE type_t.num20_6, 
   l_sfaa013 LIKE type_t.chr30, 
   l_sfaa011 LIKE type_t.chr30, 
   l_sfaa058 LIKE type_t.num20_6, 
   l_sfaa060 LIKE type_t.chr30, 
   l_sfaa058_show LIKE type_t.chr1
 END RECORD
   DEFINE l_cnt           LIKE type_t.num10
#add-point:ins_data段define (客製用) name="ins_data.define_customerization"

#end add-point   
#add-point:ins_data段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ins_data.define"
DEFINE l_count LIKE type_t.num5   #161107-00012#1-add
DEFINE l_sql   STRING   #161107-00012#1-add
#end add-point
 
    #add-point:ins_data段before name="ins_data.before"
    #161107-00012#1-add-s
    LET l_sql = " SELECT COUNT(*) ",
                "   FROM sfdc_t ",
                "  WHERE sfdcdocno = ? ",
                "    AND sfdcent   = ? ",
                "    AND sfdcsite  = ? ",
                "    AND ",tm.store
    PREPARE asfr310_g01_sfdc_cnt_pre FROM l_sql
    LET tm.store = cl_replace_str(tm.store,'sfdc012','a.sfdc012')
    #161107-00012#1-add-e
    #end add-point
 
    CALL sr.clear()                                  #rep sr
    LET l_cnt = 1
    FOREACH asfr310_g01_curs INTO sr_s.*
       IF STATUS THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.extend = 'foreach:'
          LET g_errparam.code   = STATUS
          LET g_errparam.popup  = TRUE
          CALL cl_err()       
          LET g_rep_success = 'N'    
          EXIT FOREACH
       END IF
 
       #add-point:ins_data段foreach name="ins_data.foreach"
       CALL cl_get_para(g_enterprise,g_site,'S-BAS-0028') RETURNING sr_s.l_sfaa058_show
       #發退料類別scc
       SELECT gzcbl004 INTO sr_s.l_sfda002_desc
         FROM gzcbl_t
        WHERE gzcbl001 = '4013'
          AND gzcbl002 = sr_s.sfda002
          AND gzcbl003 = g_dlang
       #生產料號、特性、生產數量、生產單位,參考數量、參考單位       
       SELECT sfaa010,sfaa011,sfaa012,sfaa013,sfaa058,sfaa060 
         INTO sr_s.l_sfaa010,sr_s.l_sfaa011,sr_s.l_sfaa012,sr_s.l_sfaa013,sr_s.l_sfaa058,sr_s.l_sfaa060
         FROM sfaa_t
        WHERE sfaaent  = sr_s.sfdaent
          AND sfaasite = sr_s.sfdasite
          AND sfaadocno= sr_s.sfdb001       
       #品名、規格
       SELECT imaal003,imaal004 INTO sr_s.l_imaal003,sr_s.l_imaal004
         FROM imaal_t
        WHERE imaalent = sr_s.sfdaent
          AND imaal002 = g_dlang
          AND imaal001 = sr_s.l_sfaa010
          
       #161107-00012#1-add-s
       LET l_count = 0
       EXECUTE asfr310_g01_sfdc_cnt_pre USING sr_s.sfdadocno,sr_s.sfdaent,sr_s.sfdasite INTO l_count       
       IF cl_null(l_count) OR l_count = 0 THEN
          CONTINUE FOREACH
       END IF
       #161107-00012#1-add-e
       #end add-point
 
       #add-point:ins_data段before_arr name="ins_data.before.save"
       
       #end add-point
 
       #set rep array value
       LET sr[l_cnt].sfda001 = sr_s.sfda001
       LET sr[l_cnt].sfda002 = sr_s.sfda002
       LET sr[l_cnt].sfda003 = sr_s.sfda003
       LET sr[l_cnt].sfda004 = sr_s.sfda004
       LET sr[l_cnt].sfda005 = sr_s.sfda005
       LET sr[l_cnt].sfdadocdt = sr_s.sfdadocdt
       LET sr[l_cnt].sfdadocno = sr_s.sfdadocno
       LET sr[l_cnt].sfdaent = sr_s.sfdaent
       LET sr[l_cnt].sfdasite = sr_s.sfdasite
       LET sr[l_cnt].sfdastus = sr_s.sfdastus
       LET sr[l_cnt].sfdb001 = sr_s.sfdb001
       LET sr[l_cnt].sfdb002 = sr_s.sfdb002
       LET sr[l_cnt].sfdb003 = sr_s.sfdb003
       LET sr[l_cnt].sfdb004 = sr_s.sfdb004
       LET sr[l_cnt].sfdb005 = sr_s.sfdb005
       LET sr[l_cnt].sfdb006 = sr_s.sfdb006
       LET sr[l_cnt].sfdb007 = sr_s.sfdb007
       LET sr[l_cnt].sfdb008 = sr_s.sfdb008
       LET sr[l_cnt].ooefl_t_ooefl003 = sr_s.ooefl_t_ooefl003
       LET sr[l_cnt].ooag_t_ooag011 = sr_s.ooag_t_ooag011
       LET sr[l_cnt].x_oocql_t_oocql004 = sr_s.x_oocql_t_oocql004
       LET sr[l_cnt].x_t1_oocql004 = sr_s.x_t1_oocql004
       LET sr[l_cnt].l_sfda004_ooag011 = sr_s.l_sfda004_ooag011
       LET sr[l_cnt].l_sfda003_ooefl003 = sr_s.l_sfda003_ooefl003
       LET sr[l_cnt].l_sfda002_desc = sr_s.l_sfda002_desc
       LET sr[l_cnt].l_sfaa010 = sr_s.l_sfaa010
       LET sr[l_cnt].l_imaal003 = sr_s.l_imaal003
       LET sr[l_cnt].l_imaal004 = sr_s.l_imaal004
       LET sr[l_cnt].l_sfaa012 = sr_s.l_sfaa012
       LET sr[l_cnt].l_sfaa013 = sr_s.l_sfaa013
       LET sr[l_cnt].l_sfaa011 = sr_s.l_sfaa011
       LET sr[l_cnt].l_sfaa058 = sr_s.l_sfaa058
       LET sr[l_cnt].l_sfaa060 = sr_s.l_sfaa060
       LET sr[l_cnt].l_sfaa058_show = sr_s.l_sfaa058_show
 
 
       #add-point:ins_data段after_arr name="ins_data.after.save"
       
       #end add-point
       LET l_cnt = l_cnt + 1
    END FOREACH
    CALL sr.deleteElement(l_cnt)
 
    #add-point:ins_data段after name="ins_data.after"
    
    #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asfr310_g01.rep_data" readonly="Y" >}
PRIVATE FUNCTION asfr310_g01_rep_data()
   DEFINE HANDLER         om.SaxDocumentHandler
   DEFINE l_i             INTEGER
 
    #判斷是否有報表資料，若回彈出訊息視窗
    IF sr.getLength() = 0 THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = "adz-00285"
       LET g_errparam.extend = NULL
       LET g_errparam.popup  = FALSE
       LET g_errparam.replace[1] = ''
       CALL cl_err()  
       RETURN 
    END IF
    WHILE TRUE   
       #add-point:rep_data段印前 name="rep_data.before"
       
       #end add-point     
       LET handler = cl_gr_handler()
       IF handler IS NOT NULL THEN
          START REPORT asfr310_g01_rep TO XML HANDLER handler
          FOR l_i = 1 TO sr.getLength()
             OUTPUT TO REPORT asfr310_g01_rep(sr[l_i].*)
             #報表中斷列印時，顯示錯誤訊息
             IF fgl_report_getErrorStatus() THEN
                DISPLAY "FGL: STOPPING REPORT msg=\"",fgl_report_getErrorString(),"\""
                EXIT FOR
             END IF                  
          END FOR
          FINISH REPORT asfr310_g01_rep
       END IF
       #add-point:rep_data段印完 name="rep_data.after"
       
       #end add-point       
       IF g_rep_flag = TRUE THEN
          LET g_rep_flag = FALSE
          EXIT WHILE
       END IF
    END WHILE
    #add-point:rep_data段離開while印完前 name="rep_data.end.before"
    
    #end add-point
    CALL cl_gr_close_report()
    #add-point:rep_data段離開while印完後 name="rep_data.end.after"
    
    #end add-point    
END FUNCTION
 
{</section>}
 
{<section id="asfr310_g01.rep" readonly="Y" >}
PRIVATE REPORT asfr310_g01_rep(sr1)
DEFINE sr1 sr1_r
DEFINE sr2 sr2_r
DEFINE l_subrep01_show  LIKE type_t.chr1,
       l_subrep02_show  LIKE type_t.chr1,
       l_subrep03_show  LIKE type_t.chr1,
       l_subrep04_show  LIKE type_t.chr1
DEFINE l_cnt           LIKE type_t.num10
DEFINE l_sub_sql       STRING
#add-point:rep段define  (客製用) name="rep.define_customerization"

#end add-point
#add-point:rep段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="rep.define"
DEFINE l_sql     STRING
DEFINE sr3       sr3_r
DEFINE l_replace        LIKE type_t.chr50
DEFINE l_subrep05_show  LIKE type_t.chr5
DEFINE l_details_show   LIKE type_t.chr5
DEFINE l_gzcb003        LIKE gzcb_t.gzcb003
#end add-point
 
    #add-point:rep段ORDER_before name="rep.order.before"
    
    #end add-point
    ORDER  BY sr1.sfdadocno
    #add-point:rep段ORDER_after name="rep.order.after"
    
    #end add-point
    
    FORMAT
       FIRST PAGE HEADER          
          PRINTX g_user,g_pdate,g_rep_code,g_company,g_ptime,g_user_name,g_date_fmt
          PRINTX tm.*
          PRINTX g_grNumFmt.*
          PRINTX g_rep_wcchp
 
          #讀取beforeGrup子樣板+子報表樣板
        #報表 d01 樣板自動產生(Version:2)
        BEFORE GROUP OF sr1.sfdadocno
            #報表 d05 樣板自動產生(Version:6)
            CALL cl_gr_title_clear()  #清除title變數值 
            #add-point:rep.header  #公司資訊(不在公用變數內) name="rep.header"
            SELECT gzcb003 INTO l_gzcb003 FROM gzcb_t
             WHERE gzcb001 = '4013'
               AND gzcb002 = sr1.sfda002
            IF l_gzcb003 = '1' THEN
               CALL cl_getmsg('asf-00450',g_dlang) RETURNING g_rep_code_desc
            ELSE
               CALL cl_getmsg('asf-00451',g_dlang) RETURNING g_rep_code_desc
            END IF
            LET g_code_value = sr1.sfdadocno  #170908-00042#35  add
            #end add-point:rep.header 
            LET g_rep_docno = sr1.sfdadocno
            CALL cl_gr_init_pageheader() #表頭資訊
            PRINTX g_grPageHeader.*
            PRINTX g_grPageFooter.*
            #add-point:rep.apr.signstr.before name="rep.apr.signstr.before"
                          
            #end add-point:rep.apr.signstr.before   
            LET g_doc_key = 'sfdaent=' ,sr1.sfdaent,'{+}sfdadocno=' ,sr1.sfdadocno         
            CALL cl_gr_init_apr(sr1.sfdadocno)
            #add-point:rep.apr.signstr name="rep.apr.signstr"
                          
            #end add-point:rep.apr.signstr
            PRINTX g_grSign.*
 
 
 
           #add-point:rep.b_group.sfdadocno.before name="rep.b_group.sfdadocno.before"
           
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub01.before name="rep.sub01.before"
           
           #end add-point:rep.sub01.before
 
           #add-point:rep.sub01.sql name="rep.sub01.sql"
           
           #end add-point:rep.sub01.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='2' AND ooff004=0 AND ooffent = '", 
                sr1.sfdaent CLIPPED ,"'", " AND  ooff003 = '", sr1.sfdadocno CLIPPED ,"'"
 
           #add-point:rep.sub01.afsql name="rep.sub01.afsql"
           
           #end add-point:rep.sub01.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep01_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE asfr310_g01_repcur01_cnt_pre FROM l_sub_sql
           EXECUTE asfr310_g01_repcur01_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep01_show ="Y"
           END IF
           PRINTX l_subrep01_show
           START REPORT asfr310_g01_subrep01
           DECLARE asfr310_g01_repcur01 CURSOR FROM g_sql
           FOREACH asfr310_g01_repcur01 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "asfr310_g01_repcur01:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub01.foreach name="rep.sub01.foreach"
              
              #end add-point:rep.sub01.foreach
              OUTPUT TO REPORT asfr310_g01_subrep01(sr2.*)
           END FOREACH
           FINISH REPORT asfr310_g01_subrep01
           #add-point:rep.sub01.after name="rep.sub01.after"
           
           #end add-point:rep.sub01.after
 
 
 
           #add-point:rep.b_group.sfdadocno.after name="rep.b_group.sfdadocno.after"
           
           #end add-point:
 
 
 
 
       ON EVERY ROW
          #add-point:rep.everyrow.before name="rep.everyrow.before"
          
          #end add-point:rep.everyrow.before
 
          #單身前備註
             #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub02.before name="rep.sub02.before"
           
           #end add-point:rep.sub02.before
 
           #add-point:rep.sub02.sql name="rep.sub02.sql"
           
           #end add-point:rep.sub02.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='7' AND ooff012='2' AND ooffent = '", 
                sr1.sfdaent CLIPPED ,"'", " AND  ooff003 = '", sr1.sfdadocno CLIPPED ,"'"
 
           #add-point:rep.sub02.afsql name="rep.sub02.afsql"
           
           #end add-point:rep.sub02.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep02_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE asfr310_g01_repcur02_cnt_pre FROM l_sub_sql
           EXECUTE asfr310_g01_repcur02_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep02_show ="Y"
           END IF
           PRINTX l_subrep02_show
           START REPORT asfr310_g01_subrep02
           DECLARE asfr310_g01_repcur02 CURSOR FROM g_sql
           FOREACH asfr310_g01_repcur02 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "asfr310_g01_repcur02:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub02.foreach name="rep.sub02.foreach"
              
              #end add-point:rep.sub02.foreach
              OUTPUT TO REPORT asfr310_g01_subrep02(sr2.*)
           END FOREACH
           FINISH REPORT asfr310_g01_subrep02
           #add-point:rep.sub02.after name="rep.sub02.after"
           
           #end add-point:rep.sub02.after
 
 
 
          #add-point:rep.everyrow.beforerow name="rep.everyrow.beforerow"
          
          #end add-point:rep.everyrow.beforerow
            
          PRINTX sr1.*
 
          #add-point:rep.everyrow.afterrow name="rep.everyrow.afterrow"
            IF sr1.sfda002 ='11' OR  sr1.sfda002 = '21'  THEN
               LET l_details_show = "Y"
            ELSE
               LET l_details_show = "N"
            END IF
            PRINTX l_details_show
          #end add-point:rep.everyrow.afterrow
 
          #單身後備註
             #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub03.before name="rep.sub03.before"
           
           #end add-point:rep.sub03.before
 
           #add-point:rep.sub03.sql name="rep.sub03.sql"
           
           #end add-point:rep.sub03.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='7' AND ooff012='1' AND ooff003 = '", 
                sr1.sfdaent CLIPPED ,"'"
 
           #add-point:rep.sub03.afsql name="rep.sub03.afsql"
           
           #end add-point:rep.sub03.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep03_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE asfr310_g01_repcur03_cnt_pre FROM l_sub_sql
           EXECUTE asfr310_g01_repcur03_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep03_show ="Y"
           END IF
           PRINTX l_subrep03_show
           START REPORT asfr310_g01_subrep03
           DECLARE asfr310_g01_repcur03 CURSOR FROM g_sql
           FOREACH asfr310_g01_repcur03 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "asfr310_g01_repcur03:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub03.foreach name="rep.sub03.foreach"
              
              #end add-point:rep.sub03.foreach
              OUTPUT TO REPORT asfr310_g01_subrep03(sr2.*)
           END FOREACH
           FINISH REPORT asfr310_g01_subrep03
           #add-point:rep.sub03.after name="rep.sub03.after"
           
           #end add-point:rep.sub03.after
 
 
 
          #add-point:rep.everyrow.after name="rep.everyrow.after"
          
          #end add-point:rep.everyrow.after        
 
          #讀取afterGrup子樣板+子報表樣板
        #報表 d01 樣板自動產生(Version:2)
        AFTER GROUP OF sr1.sfdadocno
 
           #add-point:rep.a_group.sfdadocno.before name="rep.a_group.sfdadocno.before"
           
           #end add-point:
 
           #報表 d03 樣板自動產生(Version:3)
           #add-point:rep.sub04.before name="rep.sub04.before"
           
           #end add-point:rep.sub04.before
 
           #add-point:rep.sub04.sql name="rep.sub04.sql"
           
           #end add-point:rep.sub04.sql
 
           LET g_sql = " SELECT ooff013 FROM ooff_t WHERE ooffstus='Y' and ooff001='6' AND ooff012='1' AND ooff004=0 AND ooffent = '", 
                sr1.sfdaent CLIPPED ,"'", " AND  ooff003 = '", sr1.sfdadocno CLIPPED ,"'"
 
           #add-point:rep.sub04.afsql name="rep.sub04.afsql"
           
           #end add-point:rep.sub04.afsql           
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep04_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",g_sql,")"
           PREPARE asfr310_g01_repcur04_cnt_pre FROM l_sub_sql
           EXECUTE asfr310_g01_repcur04_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep04_show ="Y"
           END IF
           PRINTX l_subrep04_show
           START REPORT asfr310_g01_subrep04
           DECLARE asfr310_g01_repcur04 CURSOR FROM g_sql
           FOREACH asfr310_g01_repcur04 INTO sr2.*
              IF STATUS THEN 
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.extend = "asfr310_g01_repcur04:"
                 LET g_errparam.code   = SQLCA.sqlcode
                 LET g_errparam.popup  = FALSE
                 CALL cl_err()                  
                 EXIT FOREACH 
              END IF
              #add-point:rep.sub04.foreach name="rep.sub04.foreach"
              
              #end add-point:rep.sub04.foreach
              OUTPUT TO REPORT asfr310_g01_subrep04(sr2.*)
           END FOREACH
           FINISH REPORT asfr310_g01_subrep04
           #add-point:rep.sub04.after name="rep.sub04.after"
           
           #end add-point:rep.sub04.after
 
 
 
           #add-point:rep.a_group.sfdadocno.after name="rep.a_group.sfdadocno.after"
           --LET l_subrep05_show = "Y"                             
          LET l_sql =
                   "SELECT a.sfdcseq,a.sfdc001,a.sfdc002,a.sfdc003,a.sfdc004,a.sfdc005,b.imaal003,",
                   "       b.imaal004,c.sfba028,d.imae092,a.sfdc007,a.sfdc006,a.sfdc010,a.sfdc009,",
                   "       a.sfdc012||'.'||e.inayl003,a.sfdc013||'.'||f.inab003,a.sfdc014,a.sfdc016,",
                   "       c.sfba001,g.sfaa011,c.sfba002,c.sfba003,c.sfba004,NULL",    #161129-00049#1 add NULL
                   "  FROM sfdc_t a LEFT JOIN imaal_t b ON a.sfdc004 = b.imaal001  AND b.imaal002='",g_dlang,"' AND a.sfdcent =b.imaalent",
                   "                LEFT JOIN sfba_t  c ON a.sfdcent = c.sfbaent   AND a.sfdcsite=c.sfbasite AND ",
                   "                                       a.sfdc001 = c.sfbadocno AND a.sfdc002 =c.sfbaseq  AND ",
                   "                                       a.sfdc003 = c.sfbaseq1",
                   "                LEFT JOIN imae_t  d ON a.sfdcent = d.imaeent   AND a.sfdcsite=d.imaesite AND a.sfdc004 =d.imae001",
                   "                LEFT JOIN inayl_t e ON a.sfdcent = e.inaylent  AND a.sfdc012 =e.inayl001 AND e.inayl002 = '",g_dlang,"'",
                   "                LEFT JOIN inab_t  f ON a.sfdcent = f.inabent   AND a.sfdcsite=f.inabsite AND ",
                   "                                       a.sfdc012 = f.inab001   AND a.sfdc013 =f.inab002",
                   "                LEFT JOIN sfaa_t  g ON a.sfdcent = g.sfaaent   AND a.sfdcsite=g.sfaasite AND a.sfdc001=g.sfaadocno",
                   " WHERE a.sfdcdocno    = '",sr1.sfdadocno  CLIPPED,"'",
                   "   AND a.sfdcent      = '",sr1.sfdaent    CLIPPED,"'",
                   "   AND a.sfdcsite     = '",sr1.sfdasite   CLIPPED,"'  ",
                   "    AND ",tm.store,   #161107-00012#1-add
                   " ORDER BY a.sfdcseq "                  
           START REPORT asfr310_g01_subrep05                
              DECLARE asfr310_g01_subrep05 CURSOR FROM l_sql
              FOREACH asfr310_g01_subrep05 INTO sr3.*
                 LET sr3.l_sfdc009_show = sr1.l_sfaa058_show
                 #161107-00012#1-add-s
                 IF sr3.l_sfdc012_inayl003 = '.' OR sr3.l_sfdc012_inayl003 = ' .' THEN 
                    LET sr3.l_sfdc012_inayl003 = '' 
                 END IF
                 IF sr3.l_sfdc013_inab003 = '.' OR sr3.l_sfdc013_inab003 = ' .' THEN 
                    LET sr3.l_sfdc013_inab003 = '' 
                 END IF                 
                 #161107-00012#1-add-e
                 CALL s_abmm201_get_proposal(g_site,sr3.sfba001,sr3.sfaa011,sr3.sfdc004,sr3.sfba002,sr3.sfba003,sr3.sfba004) RETURNING l_replace
                 OUTPUT TO REPORT asfr310_g01_subrep05(sr3.*,l_replace)
              END FOREACH           
           FINISH REPORT asfr310_g01_subrep05
           LET l_cnt = 0
           LET l_sub_sql = ""
           LET l_subrep05_show ="N"
           LET l_sub_sql = "SELECT COUNT(1) FROM (",l_sql,")"
           PREPARE asfr310_g01_repcur05_cnt_pre FROM l_sub_sql
           EXECUTE asfr310_g01_repcur05_cnt_pre INTO l_cnt
           IF l_cnt > 0 THEN 
              LET l_subrep05_show ="Y"
           END IF        
           PRINTX l_subrep05_show 
           
           
             -- LET l_subrep05_show ="N"
           
           #end add-point:
 
 
 
       ON LAST ROW
            #add-point:rep.lastrow.before name="rep.lastrow.before"  
                    
            #end add-point :rep.lastrow.before
 
            #add-point:rep.lastrow.after name="rep.lastrow.after"
            
            #end add-point :rep.lastrow.after
END REPORT
 
{</section>}
 
{<section id="asfr310_g01.subrep_str" readonly="Y" >}
#讀取子報表樣板
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT asfr310_g01_subrep01(sr2)
DEFINE  sr2  sr2_r
#add-point:query段define(客製用) name="sub01.define_customerization" 

#end add-point
#add-point:sub01.define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sub01.define" 

#end add-point:sub01.define
 
    #add-point:sub01.order.before name="sub01.order.before" 
    
    #end add-point:sub01.order.before
 
 
 
    FORMAT
 
 
 
       ON EVERY ROW
            #add-point:sub01.everyrow.before name="sub01.everyrow.before" 
                          
            #end add-point:sub01.everyrow.before
 
            PRINTX sr2.*
 
            #add-point:sub01.everyrow.after name="sub01.everyrow.after" 
            
            #end add-point:sub01.everyrow.after
 
 
END REPORT
 
 
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT asfr310_g01_subrep02(sr2)
DEFINE  sr2  sr2_r
#add-point:query段define(客製用) name="sub02.define_customerization" 

#end add-point
#add-point:sub02.define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sub02.define" 

#end add-point:sub02.define
 
    #add-point:sub02.order.before name="sub02.order.before" 
    
    #end add-point:sub02.order.before
 
 
 
    FORMAT
 
 
 
       ON EVERY ROW
            #add-point:sub02.everyrow.before name="sub02.everyrow.before" 
                          
            #end add-point:sub02.everyrow.before
 
            PRINTX sr2.*
 
            #add-point:sub02.everyrow.after name="sub02.everyrow.after" 
            
            #end add-point:sub02.everyrow.after
 
 
END REPORT
 
 
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT asfr310_g01_subrep03(sr2)
DEFINE  sr2  sr2_r
#add-point:query段define(客製用) name="sub03.define_customerization" 

#end add-point
#add-point:sub03.define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sub03.define" 

#end add-point:sub03.define
 
    #add-point:sub03.order.before name="sub03.order.before" 
    
    #end add-point:sub03.order.before
 
 
 
    FORMAT
 
 
 
       ON EVERY ROW
            #add-point:sub03.everyrow.before name="sub03.everyrow.before" 
                          
            #end add-point:sub03.everyrow.before
 
            PRINTX sr2.*
 
            #add-point:sub03.everyrow.after name="sub03.everyrow.after" 
            
            #end add-point:sub03.everyrow.after
 
 
END REPORT
 
 
#報表 d02 樣板自動產生(Version:3)
PRIVATE REPORT asfr310_g01_subrep04(sr2)
DEFINE  sr2  sr2_r
#add-point:query段define(客製用) name="sub04.define_customerization" 

#end add-point
#add-point:sub04.define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="sub04.define" 

#end add-point:sub04.define
 
    #add-point:sub04.order.before name="sub04.order.before" 
    
    #end add-point:sub04.order.before
 
 
 
    FORMAT
 
 
 
       ON EVERY ROW
            #add-point:sub04.everyrow.before name="sub04.everyrow.before" 
                          
            #end add-point:sub04.everyrow.before
 
            PRINTX sr2.*
 
            #add-point:sub04.everyrow.after name="sub04.everyrow.after" 
            
            #end add-point:sub04.everyrow.after
 
 
END REPORT
 
 
 
 
{</section>}
 
{<section id="asfr310_g01.other_function" readonly="Y" >}

 
{</section>}
 
{<section id="asfr310_g01.other_report" readonly="Y" >}

PRIVATE REPORT asfr310_g01_subrep05(sr3,l_replace)
   DEFINE sr3 sr3_r
   DEFINE l_sfdc002_sfdc003   LIKE type_t.chr200
   DEFINE l_sfba028_desc_show LIKE type_t.chr5
   DEFINE l_imae092_desc_show LIKE type_t.chr5
   DEFINE l_sfdc014_show      LIKE type_t.chr5
   DEFINE l_sfdc016_show      LIKE type_t.chr5
   DEFINE l_replace           LIKE type_t.chr50
   DEFINE l_replace_show      LIKE type_t.chr5
   DEFINE l_sfdc005_show      LIKE type_t.chr5
   DEFINE l_detail04_show     LIKE type_t.chr5
   FORMAT         
        ON EVERY ROW
           PRINTX g_grNumFmt.*
           PRINTX sr3.*,l_replace
           CALL cl_getmsg('asf-00664',g_dlang) RETURNING l_sfdc002_sfdc003
           LET l_sfdc002_sfdc003 = l_sfdc002_sfdc003||sr3.sfdc002||"."||sr3.sfdc003
           #供客料隱藏
           IF sr3.sfba028 = "Y" THEN
              LET l_sfba028_desc_show = "Y"
           ELSE
              LET l_sfba028_desc_show = "N"
           END IF
           #發料前調撥隱藏
           IF sr3.imae092 = "Y" THEN
              LET l_imae092_desc_show = "Y"
           ELSE
              LET l_imae092_desc_show = "N"
           END IF
           #指定料號隱藏
           IF cl_null(sr3.sfdc014) THEN
              LET l_sfdc014_show = "N"
           ELSE
              LET l_sfdc014_show = "Y"
           END IF
           #庫存管理特徵隱藏
           IF cl_null(sr3.sfdc016) THEN
              LET l_sfdc016_show = "N"
           ELSE
              LET l_sfdc016_show = "Y"
           END IF
           #舊料號有庫存可取代隱藏
           IF l_replace = "2" OR l_replace = "3" THEN
              LET l_replace_show = "Y"
           ELSE
              LET l_replace_show = "N"
           END IF
           #料件特徵隱藏
           IF cl_null(sr3.sfdc005) THEN
              LET l_sfdc005_show = "N"
           ELSE
              LET l_sfdc005_show = "Y"
           END IF
           #detail04隱藏(料件特徵、庫存管理特徵)
           IF cl_null(sr3.sfdc005) AND cl_null(sr3.sfdc005) THEN
              LET l_detail04_show = "N"
           ELSE
              LET l_detail04_show = "Y"
           END IF                       
           PRINTX l_sfdc002_sfdc003,l_sfba028_desc_show,l_imae092_desc_show,l_sfdc014_show,l_sfdc016_show,l_replace_show,
                  l_sfdc005_show,l_detail04_show
END REPORT

 
{</section>}
 
