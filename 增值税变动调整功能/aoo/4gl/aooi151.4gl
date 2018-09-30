# Prog. Version..: '5.30.28-18.04.20(00002)'     #
#
# Pattern name...: aooi151.4gl
# Descriptions...: 新舊稅別對照表 
# Date & Author..: 180409 By shijl
# Modify.........: No:FUN-I40012 18/04/14 By doris 功能回追
# Modify.........: No:TQC-I40002 18/04/19 By yihsuan 1.hsc01開窗調整為 DISPLAY g_qryparam.multiret TO hsc01
#                                                    2.調整進單身會有-6372之問題
DATABASE ds
 
GLOBALS "../../config/top.global"
 
DEFINE 
   g_hsc          DYNAMIC ARRAY OF RECORD     #程式變數(Program Variables)
     hsc01        LIKE hsc_file.hsc01,        #老税种编号
     hsc011       LIKE hsc_file.hsc011,       #
     hsc01_desc   LIKE gec_file.gec02,        
     gec04        LIKE gec_file.gec04,           
     hsc02        LIKE hsc_file.hsc02,        #新税种编号
     hsc021       LIKE hsc_file.hsc021,       
     hsc02_desc   LIKE gec_file.gec02,        
     gec04_1      LIKE gec_file.gec04,             
     hsc03        LIKE hsc_file.hsc03,        #启用日期
     hscacti      LIKE hsc_file.hscacti       #有效否
                  END RECORD,
   g_hsc_t        RECORD                      #程式變數 (舊值)
     hsc01        LIKE hsc_file.hsc01,        #老税种编号
     hsc011       LIKE hsc_file.hsc011,   
     hsc01_desc   LIKE gec_file.gec02,
     gec04        LIKE gec_file.gec04,       
     hsc02        LIKE hsc_file.hsc02,        #新税种编号
     hsc021       LIKE hsc_file.hsc021,
     hsc02_desc   LIKE gec_file.gec02,
     gec04_1      LIKE gec_file.gec04,         
     hsc03        LIKE hsc_file.hsc03,        #启用日期
     hscacti      LIKE hsc_file.hscacti       #有效否 
                  END RECORD,
   g_wc2,g_sql    STRING,                          
   g_rec_b        LIKE type_file.num5,              #單身筆數  
   l_ac           LIKE type_file.num5,              #目前處理的ARRAY CNT 
   g_account      LIKE type_file.num5               #SMALLINT               # 會計維護
DEFINE g_forupd_sql         STRING                  #SELECT ... FOR UPDATE SQL
DEFINE g_forupd_gbo_sql     STRING                  #FOR UPDATE SQL   
DEFINE g_cnt                LIKE type_file.num10    #INTEGER
DEFINE g_before_input_done  LIKE type_file.num5     #SMALLINT
DEFINE g_i                  LIKE type_file.num5     #count/index for any purpose  # SMALLINT
DEFINE l_table              STRING                 
DEFINE g_str                STRING                  
DEFINE g_u_flag             LIKE type_file.chr1     
 
MAIN
    OPTIONS                                #改變一些系統預設值
        INPUT NO WRAP
    DEFER INTERRUPT                        #擷取中斷鍵, 由程式處理
 
   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF
  
   WHENEVER ERROR CALL cl_err_msg_log
  
   IF (NOT cl_setup("AOO")) THEN
      EXIT PROGRAM
   END IF
 
    LET g_sql="hsc01.hsc_file.hsc01,",
              "hsc011.hsc_file.hsc011,",
              "hsc02.hsc_file.hsc02,",
              "hsc021.hsc_file.hsc021,",
              "hsc03.hsc_file.hsc03,",             
              "hscacti.hsc_file.hscacti,",
              "hscuser.hsc_file.hscuser,",
              "hscgrup.hsc_file.hscgrup,",
              "hscmodu.hsc_file.hscmodu,",
              "hscdate.hsc_file.hscdate"   
                        
   LET l_table=cl_prt_temptable("aooi151",g_sql) CLIPPED
   IF l_table=-1 THEN EXIT PROGRAM END IF
   LET g_sql="INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
             " VALUES(?,?,?,?,?,  ?,?,?,?,?)"
   PREPARE insert_prep FROM g_sql
   IF STATUS THEN
       CALL cl_err("insert_prep:",status,1)  
   END IF

   CALL  cl_used(g_prog,g_time,1) RETURNING g_time   
 
    OPEN WINDOW i001_w WITH FORM "aoo/42f/aooi151"
       ATTRIBUTE (STYLE = g_win_style CLIPPED)
   CALL cl_ui_init()
 
   LET g_wc2 = '1=1' CLIPPED,cl_get_extra_cond('hscuser', 'hscgrup') 
   CALL i001_b_fill(g_wc2)    
 
  CALL i001_menu()
  CLOSE WINDOW i001_w                 #結束畫面

  CALL  cl_used(g_prog,g_time,2) RETURNING g_time 
END MAIN
 
FUNCTION i001_menu()
 
   WHILE TRUE
      CALL i001_bp("G")
      CASE g_action_choice
         WHEN "query" 
            IF cl_chk_act_auth() THEN
               CALL i001_q()
            END IF
         WHEN "detail"
            IF cl_chk_act_auth() THEN              
               CALL i001_b()
            ELSE
               LET g_action_choice = NULL
            END IF

        ##回追產品，暫不提供列印功能
        #WHEN "output" 
        #   IF cl_chk_act_auth() THEN
        #      CALL i001_out()
        #   END IF         
         WHEN "help"
            CALL cl_show_help()

         WHEN "exit"
            EXIT WHILE
         WHEN "controlg"
            CALL cl_cmdask()
          WHEN "related_document" 
            IF cl_chk_act_auth() AND l_ac != 0 THEN
               IF g_hsc[l_ac].hsc01 IS NOT NULL AND g_hsc[l_ac].hsc011 IS NOT NULL THEN
                  LET g_doc.column1 = "hsc01"
                  LET g_doc.value1 = g_hsc[l_ac].hsc01
                  LET g_doc.column2 = "hsc011"
                  LET g_doc.value2 = g_hsc[l_ac].hsc011                  
                  CALL cl_doc()
               END IF
            END IF
         WHEN "exporttoexcel"   
            IF cl_chk_act_auth() THEN
              CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_hsc),'','')
            END IF       
 
      END CASE
   END WHILE
END FUNCTION
 
FUNCTION i001_q()
   CALL i001_b_askkey()
END FUNCTION
 
FUNCTION i001_b()
DEFINE
    l_ac_t          LIKE type_file.num5,                #未取消的ARRAY CNT  #No.FUN-680102 SMALLINT
    l_n             LIKE type_file.num5,                #檢查重複用  #No.FUN-680102 SMALLINT
    l_lock_sw       LIKE type_file.chr1,                #單身鎖住否  #No.FUN-680102 VARCHAR(1)
    p_cmd           LIKE type_file.chr1,                #處理狀態  #No.FUN-680102 VARCHAR(1)
    l_allow_insert  LIKE type_file.chr1,                #No.FUN-680102 VARCHAR(01),              #可新增否
    l_allow_delete  LIKE type_file.chr1,                #No.FUN-680102 VARCHAR(01),              #可刪除否
    l_cnt           LIKE type_file.num10                #No.FUN-680102 INTEGER #FUN-670032
DEFINE l_no             LIKE type_file.num5
   
    LET g_action_choice = ""   
    IF s_shut(0) THEN RETURN END IF
    CALL cl_opmsg('b')  
 
    LET l_allow_insert = cl_detail_input_auth('insert')
    LET l_allow_delete = cl_detail_input_auth('delete')   
 
   #LET g_forupd_sql = "SELECT hsc01,hsc011,a.gec02,a.gec04,hsc02,hsc021,b.gec02,b.gec04,hsc03,hscacti ",   #TQC-I40002 mark 
    LET g_forupd_sql = "SELECT hsc01,hsc011,'','',hsc02,hsc021,'','',hsc03,hscacti ",                       #TQC-I40002 add
                       "  FROM hsc_file ",
                      #"  LEFT JOIN gec_file a ON a.gec01 = hsc01  AND a.gec011 = hsc011 ",                 #TQC-I40002 mark
                      #"  LEFT JOIN gec_file b ON b.gec01 = hsc02  AND b.gec011 = hsc021 ",                 #TQC-I40002 mark
                       " WHERE hsc01=? AND hsc011=? FOR UPDATE"
    LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)

    DECLARE i001_bcl CURSOR FROM g_forupd_sql      # LOCK CURSOR            

    INPUT ARRAY g_hsc WITHOUT DEFAULTS FROM s_hsc.*
          ATTRIBUTE (COUNT=g_rec_b,MAXCOUNT=g_max_rec,UNBUFFERED,
                     INSERT ROW = l_allow_insert,DELETE ROW=l_allow_delete,APPEND ROW=l_allow_insert) 
 
    BEFORE INPUT
       IF g_rec_b != 0 THEN
          CALL fgl_set_arr_curr(l_ac)
       END IF
 
    BEFORE ROW
        LET p_cmd=''
        LET l_ac = ARR_CURR()
        LET l_lock_sw = 'N'            #DEFAULT
        LET l_n  = ARR_COUNT()
        LET g_success = 'Y'           
        
        IF g_rec_b>=l_ac THEN       
           BEGIN WORK
           LET p_cmd='u'
           LET g_hsc_t.* = g_hsc[l_ac].*  #BACKUP  
           
           LET g_before_input_done = FALSE                                      
           CALL i001_set_entry(p_cmd)                                           
           CALL i001_set_no_entry(p_cmd)                                        
           LET g_before_input_done = TRUE                                       
 
           OPEN i001_bcl USING g_hsc_t.hsc01,g_hsc_t.hsc011
           IF STATUS THEN
              CALL cl_err("OPEN i001_bcl:", STATUS, 1)
              LET l_lock_sw = "Y"
           ELSE            
             FETCH i001_bcl INTO g_hsc[l_ac].* 
             IF SQLCA.sqlcode THEN
                 CALL cl_err(g_hsc_t.hsc01,SQLCA.sqlcode,1)
                 LET l_lock_sw = "Y"
             END IF

             #--TQC-I40002 add start--
             LET g_sql = "SELECT a.gec02,a.gec04,b.gec02,b.gec04",
                         " FROM hsc_file ",
                         "  LEFT JOIN gec_file a ON a.gec01 = hsc01  AND a.gec011 = hsc011 ",
                         "  LEFT JOIN gec_file b ON b.gec01 = hsc02  AND b.gec011 = hsc021 ",
                         " WHERE hsc01=? AND hsc011=? "
             PREPARE i001_pb2 FROM g_sql
             DECLARE hsc_curs2 CURSOR FOR i001_pb2
             EXECUTE hsc_curs2 USING g_hsc_t.hsc01,g_hsc_t.hsc011
                                INTO g_hsc[l_ac].hsc01_desc,g_hsc[l_ac].gec04,g_hsc[l_ac].hsc02_desc,g_hsc[l_ac].gec04_1
             #--TQC-I40002 add end-- 
           END IF                                                 
           CALL cl_show_fld_cont()  
        END IF
 
     BEFORE INSERT
         LET l_n = ARR_COUNT()
         LET p_cmd='a'     
         LET g_before_input_done = FALSE                                      
         CALL i001_set_entry(p_cmd)                                           
         CALL i001_set_no_entry(p_cmd)                                        
         LET g_before_input_done = TRUE                                       
         INITIALIZE g_hsc[l_ac].* TO NULL  
         LET g_hsc[l_ac].hscacti = 'Y'       #Body default                 
         LET g_hsc_t.* = g_hsc[l_ac].*         #新輸入資料         
         CALL cl_show_fld_cont()     
         NEXT FIELD hsc01
         
     AFTER INSERT
        IF INT_FLAG THEN
           CALL cl_err('',9001,0)
           LET INT_FLAG = 0
           CLOSE i001_bcl           
           CANCEL INSERT
        END IF
  
        BEGIN WORK                    
 
        INSERT INTO hsc_file(hsc01,hsc011,hsc02,hsc021,hsc03,
                             hscacti,hscuser,hscdate,hscoriu,hscorig)       
        VALUES(g_hsc[l_ac].hsc01,g_hsc[l_ac].hsc011,g_hsc[l_ac].hsc02,g_hsc[l_ac].hsc021,
               g_hsc[l_ac].hsc03,                              
               g_hsc[l_ac].hscacti,
               g_user,g_today, g_user, g_grup)      #insert columns oriu, orig
        IF SQLCA.sqlcode THEN 
           CALL cl_err3("ins","hsc_file",g_hsc[l_ac].hsc01,g_hsc[l_ac].hsc011,SQLCA.sqlcode,"","",1)  
           CANCEL INSERT
        ELSE
           LET g_success = 'Y'                                             
                      
              IF g_success = 'N' THEN     
                 ROLLBACK WORK                                     
                 CANCEL INSERT                                     
              ELSE 
                 LET g_rec_b=g_rec_b+1                             
                 DISPLAY g_rec_b TO FORMONLY.cn2                   
                 COMMIT WORK 
              END IF           
        END IF       
         
    AFTER FIELD hsc01   
         #check 是否重複 
         IF NOT cl_null(g_hsc[l_ac].hsc01) AND NOT cl_null(g_hsc[l_ac].hsc011) THEN
           IF g_hsc[l_ac].hsc01 != g_hsc_t.hsc01 OR g_hsc_t.hsc01 IS NULL THEN                          
              SELECT count(*) INTO g_cnt FROM hsc_file
               WHERE hsc01 = g_hsc[l_ac].hsc01
                 AND hsc011 = g_hsc[l_ac].hsc011
              IF g_cnt > 0 THEN
                 CALL cl_err('',-239,0)
                 LET g_hsc[l_ac].hsc01 = g_hsc_t.hsc01
                 NEXT FIELD hsc01
              END IF             
           END IF
           LET g_hsc[l_ac].hsc01_desc = ''
           LET g_hsc[l_ac].gec04 = ''
           SELECT gec02,gec04 INTO g_hsc[l_ac].hsc01_desc,g_hsc[l_ac].gec04
             FROM gec_file WHERE gec01 = g_hsc[l_ac].hsc01 AND gec011=g_hsc[l_ac].hsc011  
           IF STATUS THEN
              CALL cl_err3("sel","gec_file",g_hsc[l_ac].hsc01,g_hsc[l_ac].hsc011,"mfg3044","","",1)  #No.FUN-660071
              NEXT FIELD hsc01
           END IF           
        END IF
         
    AFTER FIELD hsc011                        #check 編號是否重複
         IF NOT cl_null(g_hsc[l_ac].hsc01) AND NOT cl_null(g_hsc[l_ac].hsc011) THEN
           IF g_hsc[l_ac].hsc011 != g_hsc_t.hsc011 OR g_hsc_t.hsc011 IS NULL THEN                          
              SELECT count(*) INTO g_cnt FROM hsc_file
               WHERE hsc01 = g_hsc[l_ac].hsc01
                 AND hsc011 = g_hsc[l_ac].hsc011
              IF g_cnt > 0 THEN
                 CALL cl_err('',-239,0)
                 LET g_hsc[l_ac].hsc011 = g_hsc_t.hsc011
                 NEXT FIELD hsc011
              END IF             
           END IF
           LET g_hsc[l_ac].hsc01_desc = ''
           LET g_hsc[l_ac].gec04 = ''
           SELECT gec02,gec04 INTO g_hsc[l_ac].hsc01_desc,g_hsc[l_ac].gec04
             FROM gec_file WHERE gec01 = g_hsc[l_ac].hsc01 AND gec011=g_hsc[l_ac].hsc011  
           IF STATUS THEN
              CALL cl_err3("sel","gec_file",g_hsc[l_ac].hsc011,"","mfg3044","","",1)  
              LET g_hsc[l_ac].hsc011  = ''
              NEXT FIELD hsc011
           END IF           
        END IF
        LET g_hsc[l_ac].hsc021 = g_hsc[l_ac].hsc011  

    BEFORE FIELD hsc02 
         IF cl_null(g_hsc[l_ac].hsc011) THEN 
              NEXT FIELD hsc011
         END IF  
         
    AFTER FIELD hsc02  
         IF NOT cl_null(g_hsc[l_ac].hsc02) AND NOT cl_null(g_hsc[l_ac].hsc021) THEN
           IF g_hsc[l_ac].hsc02 != g_hsc_t.hsc02 OR g_hsc_t.hsc02 IS NULL THEN
              LET g_hsc[l_ac].hsc02_desc = ''
              LET g_hsc[l_ac].gec04_1 = ''
              SELECT gec02,gec04 INTO g_hsc[l_ac].hsc02_desc,g_hsc[l_ac].gec04_1
                FROM gec_file WHERE gec01 = g_hsc[l_ac].hsc02 AND gec011=g_hsc[l_ac].hsc021  
              IF STATUS THEN
                 CALL cl_err3("sel","gec_file",g_hsc[l_ac].hsc02,"","mfg3044","","",1)  
                 NEXT FIELD hsc02
              END IF  
           END IF         
         END IF       

    AFTER FIELD hsc021      
         IF NOT cl_null(g_hsc[l_ac].hsc02) AND NOT cl_null(g_hsc[l_ac].hsc021) THEN
           IF g_hsc[l_ac].hsc021 != g_hsc_t.hsc021 OR g_hsc_t.hsc021 IS NULL THEN
              LET g_hsc[l_ac].hsc02_desc = ''
              LET g_hsc[l_ac].gec04_1 = ''
              SELECT gec02,gec04 INTO g_hsc[l_ac].hsc02_desc,g_hsc[l_ac].gec04_1
                FROM gec_file WHERE gec01 = g_hsc[l_ac].hsc02 AND gec011=g_hsc[l_ac].hsc021  
              IF STATUS THEN
                 CALL cl_err3("sel","gec_file",g_hsc[l_ac].hsc021,"","mfg3044","","",1) 
                 LET g_hsc[l_ac].hsc021  = ''
                 NEXT FIELD hsc021
              END IF  
           END IF         
         END IF                  
 
    BEFORE DELETE                            #是否取消單身

        LET g_success = 'Y'                
        
        IF g_hsc_t.hsc01 IS NOT NULL AND g_hsc_t.hsc011 IS NOT NULL THEN  
           IF g_cnt = 0 THEN 
              IF NOT cl_delete() THEN
                 CANCEL DELETE
              END IF
              INITIALIZE g_doc.* TO NULL                
              LET g_doc.column1 = "hsc01"            
              LET g_doc.value1 = g_hsc[l_ac].hsc01      
              LET g_doc.column2 = "hsc011"              
              LET g_doc.value2 = g_hsc[l_ac].hsc011                   
              CALL cl_del_doc()                       
              IF l_lock_sw = "Y" THEN 
                 CALL cl_err("", -263, 1) 
                 CANCEL DELETE 
              END IF 
              DELETE FROM hsc_file WHERE hsc01 = g_hsc_t.hsc01 AND hsc011 = g_hsc_t.hsc011
              IF SQLCA.sqlcode THEN 
                 CALL cl_err3("del","hsc_file",g_hsc_t.hsc01,g_hsc_t.hsc011,SQLCA.sqlcode,"","",1)  
                 EXIT INPUT
              END IF
            
              IF g_success = 'N' THEN
                ROLLBACK WORK
                CANCEL DELETE
              ELSE
                COMMIT WORK
              END IF
              
              LET g_rec_b=g_rec_b-1                      
              DISPLAY g_rec_b TO FORMONLY.cn2                   
            ELSE
              ROLLBACK WORK
              EXIT INPUT 
            END IF 
 
         END IF
 
     ON ROW CHANGE
        IF INT_FLAG THEN                 #新增程式段
           CALL cl_err('',9001,0)
           LET INT_FLAG = 0
           LET g_hsc[l_ac].* = g_hsc_t.*
           CLOSE i001_bcl          
           ROLLBACK WORK
           EXIT INPUT
        END IF
        IF l_lock_sw="Y" THEN
           CALL cl_err(g_hsc[l_ac].hsc01,-263,0)
           LET g_hsc[l_ac].* = g_hsc_t.*
        ELSE
           LET g_success = 'Y'   #FUN-9A0056 add
           UPDATE hsc_file 
               SET hsc01=g_hsc[l_ac].hsc01,
                   hsc011=g_hsc[l_ac].hsc011,
                   hsc02=g_hsc[l_ac].hsc02,
                   hsc021=g_hsc[l_ac].hsc021,
                   hsc03=g_hsc[l_ac].hsc03,
                   hscacti=g_hsc[l_ac].hscacti,
                   hscmodu=g_user,hscdate=g_today
            WHERE hsc01 = g_hsc_t.hsc01 AND hsc011 = g_hsc_t.hsc011
           IF SQLCA.sqlcode THEN
              CALL cl_err3("upd","hsc_file",g_hsc[l_ac].hsc01,g_hsc[l_ac].hsc011,SQLCA.sqlcode,"","",1) 
              LET g_hsc[l_ac].* = g_hsc_t.*
           ELSE                                                                                        
              IF g_success = 'N' THEN                 
                 ROLLBACK WORK                                     
                 LET g_hsc[l_ac].* = g_hsc_t.*
              ELSE 
                 COMMIT WORK 
              END IF
           END IF
        END IF
 
     AFTER ROW
        LET l_ac = ARR_CURR()         # 新增      
 
        IF INT_FLAG THEN
           CALL cl_err('',9001,0)
           LET INT_FLAG = 0
           IF p_cmd='u' THEN
              LET g_hsc[l_ac].* = g_hsc_t.*
           ELSE
              CALL g_hsc.deleteElement(l_ac)
              IF g_rec_b != 0 THEN
                 LET g_action_choice = "detail"
                 LET l_ac = l_ac_t
              END IF
           END IF
           CLOSE i001_bcl         # 新增
           ROLLBACK WORK          # 新增
           EXIT INPUT
        END IF
        LET l_ac_t = l_ac        
        CLOSE i001_bcl            # 新增
        COMMIT WORK 
 
     ON ACTION CONTROLO                        #沿用所有欄位
         IF INFIELD(hsc01) AND l_ac > 1 THEN
             LET g_hsc[l_ac].* = g_hsc[l_ac-1].*
             NEXT FIELD hsc01
         END IF
 
     ON ACTION CONTROLR
         CALL cl_show_req_fields()
 
     ON ACTION CONTROLG
         CALL cl_cmdask()
 
      ON ACTION CONTROLP
         CASE
            WHEN INFIELD(hsc01)
               CALL cl_init_qry_var()
               LET g_qryparam.form  = "q_gec002"
               LET g_qryparam.default1 = g_hsc[l_ac].hsc01
               LET g_qryparam.default2 = g_hsc[l_ac].hsc011
               CALL cl_create_qry() RETURNING g_hsc[l_ac].hsc01,g_hsc[l_ac].hsc011
               LET g_hsc[l_ac].hsc021 = g_hsc[l_ac].hsc011
               NEXT FIELD hsc01         
            WHEN INFIELD(hsc02)
               CALL cl_init_qry_var()
               LET g_qryparam.form  = "q_gec002"
               LET g_qryparam.default1 = g_hsc[l_ac].hsc02
               LET g_qryparam.default2 = g_hsc[l_ac].hsc021
               LET g_qryparam.where = " gec011 = '",g_hsc[l_ac].hsc011,"' "
               CALL cl_create_qry() RETURNING g_hsc[l_ac].hsc02,g_hsc[l_ac].hsc021
               NEXT FIELD hsc02

         END CASE  
         
     ON ACTION CONTROLF
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) 
          
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT
 
      ON ACTION about         
         CALL cl_about()      
 
      ON ACTION help          
         CALL cl_show_help()  
 
     
     END INPUT
 
 
    CLOSE i001_bcl
    COMMIT WORK
END FUNCTION
 
FUNCTION i001_b_askkey()
 
   CLEAR FORM
   CALL g_hsc.clear()
 
    CONSTRUCT g_wc2 ON hsc01,hsc011,hsc02,hsc021,hsc03,hscacti 
         FROM s_hsc[1].hsc01,s_hsc[1].hsc011,
              s_hsc[1].hsc02,s_hsc[1].hsc021,
              s_hsc[1].hsc03,s_hsc[1].hscacti
 
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
 
      ON ACTION CONTROLP
         CASE
            WHEN INFIELD(hsc01)
               CALL cl_init_qry_var()
               LET g_qryparam.form  = "q_gec001"
               LET g_qryparam.state = "c"   #多選
               CALL cl_create_qry() RETURNING g_qryparam.multiret
              #DISPLAY g_qryparam.multiret TO hsc02   #TQC-I40002 mark
               DISPLAY g_qryparam.multiret TO hsc01   #TQC-I40002 add
              #NEXT FIELD hsc02                       #TQC-I40002 mark
               NEXT FIELD hsc01                       #TQC-I40002 add 
            WHEN INFIELD(hsc02)
               CALL cl_init_qry_var()
               LET g_qryparam.form  = "q_gec001"
               LET g_qryparam.state = "c"   #多選
               CALL cl_create_qry() RETURNING g_qryparam.multiret
               DISPLAY g_qryparam.multiret TO hsc02
               NEXT FIELD hsc02

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
    LET g_wc2 = g_wc2 CLIPPED,cl_get_extra_cond('hscuser', 'hscgrup')
 
    IF INT_FLAG THEN
       LET INT_FLAG = 0
       LET g_wc2 = NULL
       LET g_rec_b = 0   
       RETURN
    END IF
 
    CALL i001_b_fill(g_wc2)
 
END FUNCTION
 
FUNCTION i001_b_fill(p_wc2)              #BODY FILL UP
DEFINE
    p_wc2           LIKE type_file.chr1000 #No.FUN-680102 VARCHAR(200)
 
    LET g_sql =
        "SELECT hsc01,hsc011,a.gec02,a.gec04,hsc02,hsc021,b.gec02,b.gec04,hsc03,hscacti",
        " FROM hsc_file ",
        "  LEFT JOIN gec_file a ON a.gec01 = hsc01  AND a.gec011 = hsc011 ",
        "  LEFT JOIN gec_file b ON b.gec01 = hsc02  AND b.gec011 = hsc021 ",        
        " WHERE ", p_wc2 CLIPPED,                     #單身
        " ORDER BY 1"
    PREPARE i001_pb FROM g_sql
    DECLARE hsc_curs CURSOR FOR i001_pb
 
    CALL g_hsc.clear()
    LET g_cnt = 1
    MESSAGE "Searching!" 
    FOREACH hsc_curs INTO g_hsc[g_cnt].*   #單身 ARRAY 填充
        IF STATUS THEN CALL cl_err('foreach:',STATUS,1) EXIT FOREACH END IF
        
        SELECT gec02,gec04 INTO g_hsc[g_cnt].hsc01_desc,g_hsc[g_cnt].gec04
             FROM gec_file WHERE gec01 = g_hsc[g_cnt].hsc01 AND gec011=g_hsc[g_cnt].hsc011
        SELECT gec02,gec04 INTO g_hsc[g_cnt].hsc02_desc,g_hsc[g_cnt].gec04_1
             FROM gec_file WHERE gec01 = g_hsc[g_cnt].hsc02 AND gec011=g_hsc[g_cnt].hsc021 
                                 
        LET g_cnt = g_cnt + 1
        IF g_cnt > g_max_rec THEN
           CALL cl_err( '', 9035, 0 )
           EXIT FOREACH
        END IF
    END FOREACH
    CALL g_hsc.deleteElement(g_cnt)
    MESSAGE ""
    LET g_rec_b = g_cnt-1
    DISPLAY g_rec_b TO FORMONLY.cn2  
    LET g_cnt = 0
 
END FUNCTION
 
FUNCTION i001_bp(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1    
 
 
   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF
 
   LET g_action_choice = " "
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_hsc TO s_hsc.* ATTRIBUTE(COUNT=g_rec_b)
 
      BEFORE ROW
         LET l_ac = ARR_CURR()
      CALL cl_show_fld_cont()        
 
      ##########################################################################
      # Standard 4ad ACTION
      ##########################################################################
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY
      ON ACTION detail
         LET g_action_choice="detail"
         LET l_ac = 1
         EXIT DISPLAY
      ON ACTION output
         LET g_action_choice="output"
         EXIT DISPLAY      
      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY
 
      ON ACTION locale
         CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()  
 
      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY
 
      ##########################################################################
      # Special 4ad ACTION
      ##########################################################################
      ON ACTION controlg 
         LET g_action_choice="controlg"
         EXIT DISPLAY
 
      ON ACTION accept
         LET g_action_choice="detail"
         LET l_ac = ARR_CURR()
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
 
      ON ACTION related_document 
         LET g_action_choice="related_document"
         EXIT DISPLAY
 
      ON ACTION exporttoexcel 
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY      
 
      AFTER DISPLAY
         CONTINUE DISPLAY
 
   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION
 
#回追產品，暫不提供列印功能
#FUNCTION i001_out()
#   DEFINE
#       l_hsc           RECORD LIKE hsc_file.*,
#       l_i             LIKE type_file.num5,    
#       l_name          LIKE type_file.chr20,   
#       l_za05          LIKE type_file.chr1000  
#
#   IF g_wc2 IS NULL THEN 
#      CALL cl_err('','9057',0)
#      RETURN 
#   END IF
#   
#   CALL cl_del_data(l_table)                                    
#   LET g_str=' '                                                
#   SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01=g_prog       
#   CALL cl_wait()
#   SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_lang
#   LET g_sql="SELECT * FROM hsc_file ",      # 組合出 SQL 指令
#             " WHERE ",g_wc2 CLIPPED
#   PREPARE i001_p1 FROM g_sql                # RUNTIME 編譯
#   DECLARE i001_co                           # SCROLL CURSOR
#        CURSOR FOR i001_p1 
#        
#   LET l_name="aooi151"    
#   
#   FOREACH i001_co INTO l_hsc.*
#      IF SQLCA.sqlcode THEN
#         CALL cl_err('foreach:',SQLCA.sqlcode,1)    
#         EXIT FOREACH
#      END IF
#      EXECUTE insert_prep USING                                                             
#                          l_hsc.hsc01,l_hsc.hsc011,l_hsc.hsc02,l_hsc.hsc021,l_hsc.hsc03,
#                          l_hsc.hscacti,l_hsc.hscuser,   
#                          l_hsc.hscgrup,l_hsc.hscmodu,l_hsc.hscdate
#   END FOREACH    
#
#   CLOSE i001_co
#   ERROR ""
#   LET g_sql="SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED  
#   IF g_zz05 ='Y' THEN
#      CALL cl_wcchp(g_wc2,'hsc01,hsc011,hsc02,hsc021,hsc03,hscacti')
#      RETURNING g_wc2
#   END IF
#   LET g_str=g_wc2
#   CALL cl_prt_cs3("aooi151",l_name,g_sql,g_str)                
#
#END FUNCTION                                                                                                                                          

FUNCTION i001_set_entry(p_cmd)                                                  
  DEFINE p_cmd   LIKE type_file.chr1      
                                                                                
   IF p_cmd = 'a' AND ( NOT g_before_input_done ) THEN                          
     CALL cl_set_comp_entry("hsc01,hsc011",TRUE)                                       
   END IF                                                                       
                                                                                
END FUNCTION                                                                    
                                                                                
FUNCTION i001_set_no_entry(p_cmd)                                               
  DEFINE p_cmd   LIKE type_file.chr1     
                                                                                
   IF p_cmd = 'u' AND ( NOT g_before_input_done ) AND g_chkey='N' THEN          
     CALL cl_set_comp_entry("hsc01,hsc011",FALSE)                                      
   END IF                                                                       
                                                                                
END FUNCTION
#FUN-I40012
