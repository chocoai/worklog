# Prog. Version..: '5.30.03-12.09.18(00000)'     #
#
# Pattern name...: ghri044.4gl
# Descriptions...: 请假作业
# Date & Author..: 13/05/09 By yangjian
# Modify.........: 130729_1 By Exia 调整结束日期的必输和默认值的设置,同时在结束日期存在的情况下不能小于开始日期
# Modify.........: 130730_1 BY Exia 增加结束时间的控制
# Modify.........: 130911 1309/09/11 By wangxh 	用户在录入请假时长时须要控制
# Modify.........: 130912 13/09/12 By wangxh 开始不显示“选择”列审核或者取消审核完成后也要隐藏“选择”列
# Modify.........: 109311 14/08/25 By hujingjue  增加显示是否撤销假


DATABASE ds
 
GLOBALS "../../config/top.global"
 
DEFINE 
     g_hrcd           DYNAMIC ARRAY OF RECORD    #程式變數(Program Variables)
        chk          LIKE type_file.chr1,     #选择
        hrcd01       LIKE hrcd_file.hrcd01,   #请假项目编号
        hrcd01_name  LIKE hrbm_file.hrbm04,   #项目名称
        hrcd11       LIKE hrcd_file.hrcd11,   #假勤类别
        hrcd09       LIKE hrcd_file.hrcd09,   #员工ID
        hrcd09_name  LIKE hrat_file.hrat02,   #员工姓名
        hrcd02       LIKE hrcd_file.hrcd02,   #开始日期
        hrcd03       LIKE hrcd_file.hrcd03,   #开始时间
        hrcd04       LIKE hrcd_file.hrcd04,   #结束日期
        hrcd05       LIKE hrcd_file.hrcd05,   #结束时间  
        hrcd06       LIKE hrcd_file.hrcd06,   #请假时长
        hrcd07       LIKE hrcd_file.hrcd07,   #单位
        hrcd08       LIKE hrcd_file.hrcd08,   #规律时段假
        hrcdconf     LIKE hrcd_file.hrcdconf, #审核码
        hrcd10       LIKE hrcd_file.hrcd10,   #请假单号
        hrcd12       LIKE hrcd_file.hrcd12,   #备注
        hrcdud01     LIKE hrcd_file.hrcdud01, #
        hrcdud02     LIKE hrcd_file.hrcdud02, #
        hrcdud03     LIKE hrcd_file.hrcdud03, #
        hrcdud04     LIKE hrcd_file.hrcdud04, #
        hrcdud05     LIKE hrcd_file.hrcdud05, #
        hrcdud06     LIKE hrcd_file.hrcdud06, #
        hrcdud07     LIKE hrcd_file.hrcdud07, #
        hrcdud08     LIKE hrcd_file.hrcdud08, #
        hrcdud09     LIKE hrcd_file.hrcdud09, #
        hrcdud10     LIKE hrcd_file.hrcdud10, #
        hrcdud11     LIKE hrcd_file.hrcdud11, #
        hrcdud12     LIKE hrcd_file.hrcdud12, #
        hrcdud13     LIKE hrcd_file.hrcdud13, #
        hrcdud14     LIKE hrcd_file.hrcdud14, #
        hrcdud15     LIKE hrcd_file.hrcdud15  #
                    END RECORD,
    g_hrcd_t         RECORD                 #程式變數 (舊值)
        chk          LIKE type_file.chr1,     #选择
        hrcd01       LIKE hrcd_file.hrcd01,   #请假项目编号
        hrcd01_name  LIKE hrbm_file.hrbm04,   #项目名称
        hrcd11       LIKE hrcd_file.hrcd11,   #假勤类别
        hrcd09       LIKE hrcd_file.hrcd09,   #员工ID
        hrcd09_name  LIKE hrat_file.hrat02,   #员工姓名
        hrcd02       LIKE hrcd_file.hrcd02,   #开始日期
        hrcd03       LIKE hrcd_file.hrcd03,   #开始时间
        hrcd04       LIKE hrcd_file.hrcd04,   #结束日期
        hrcd05       LIKE hrcd_file.hrcd05,   #结束时间  
        hrcd06       LIKE hrcd_file.hrcd06,   #请假时长
        hrcd07       LIKE hrcd_file.hrcd07,   #单位
        hrcd08       LIKE hrcd_file.hrcd08,   #规律时段假
        hrcdconf     LIKE hrcd_file.hrcdconf, #审核码        
        hrcd10       LIKE hrcd_file.hrcd10,   #请假单号
        hrcd12       LIKE hrcd_file.hrcd12,   #备注
        hrcdud01     LIKE hrcd_file.hrcdud01, #
        hrcdud02     LIKE hrcd_file.hrcdud02, #
        hrcdud03     LIKE hrcd_file.hrcdud03, #
        hrcdud04     LIKE hrcd_file.hrcdud04, #
        hrcdud05     LIKE hrcd_file.hrcdud05, #
        hrcdud06     LIKE hrcd_file.hrcdud06, #
        hrcdud07     LIKE hrcd_file.hrcdud07, #
        hrcdud08     LIKE hrcd_file.hrcdud08, #
        hrcdud09     LIKE hrcd_file.hrcdud09, #
        hrcdud10     LIKE hrcd_file.hrcdud10, #
        hrcdud11     LIKE hrcd_file.hrcdud11, #
        hrcdud12     LIKE hrcd_file.hrcdud12, #
        hrcdud13     LIKE hrcd_file.hrcdud13, #
        hrcdud14     LIKE hrcd_file.hrcdud14, #
        hrcdud15     LIKE hrcd_file.hrcdud15#

                    END RECORD,
     g_dhrcda   DYNAMIC ARRAY OF RECORD
        hrcda05      LIKE hrcda_file.hrcda05,
        hrcda06      LIKE hrcda_file.hrcda06,
        hrcda07      LIKE hrcda_file.hrcda07,
        hrcda08      LIKE hrcda_file.hrcda08,
        hrcda09      LIKE hrcda_file.hrcda09,
        hrcda10      LIKE hrcda_file.hrcda10,
        hrcda15      LIKE hrcda_file.hrcda15,
        hrcda16     LIKE hrcda_file.hrcda16       #增加日撤销选项
                    END RECORD,                    
     g_mhrcda   DYNAMIC ARRAY OF RECORD
        hrcda05      LIKE hrcda_file.hrcda05,
        hrcda06      LIKE hrcda_file.hrcda06,
        hrcda07      LIKE hrcda_file.hrcda07,
        hrcda08      LIKE hrcda_file.hrcda08,
        hrcda09      LIKE hrcda_file.hrcda09,
        hrcda10      LIKE hrcda_file.hrcda10,
        hrcda15      LIKE hrcda_file.hrcda15,
        hrcda16      LIKE hrcda_file.hrcda16       #增加月撤销选项
                    END RECORD,
     g_shrcda   DYNAMIC ARRAY OF RECORD
        hrcda05      LIKE hrcda_file.hrcda05,
        hrcda06      LIKE hrcda_file.hrcda06,
        hrcda07      LIKE hrcda_file.hrcda07,
        hrcda08      LIKE hrcda_file.hrcda08,
        hrcda09      LIKE hrcda_file.hrcda09,
        hrcda10      LIKE hrcda_file.hrcda10,
        hrcda15      LIKE hrcda_file.hrcda15,
        hrcda16      LIKE hrcda_file.hrcda16        #增加季度撤销选项
                    END RECORD,
     g_yhrcda   DYNAMIC ARRAY OF RECORD
        hrcda05      LIKE hrcda_file.hrcda05,
        hrcda06      LIKE hrcda_file.hrcda06,
        hrcda07      LIKE hrcda_file.hrcda07,
        hrcda08      LIKE hrcda_file.hrcda08,
        hrcda09      LIKE hrcda_file.hrcda09,
        hrcda10      LIKE hrcda_file.hrcda10,
        hrcda15      LIKE hrcda_file.hrcda15,
        hrcda16      LIKE hrcda_file.hrcda16        #增加年撤销选项
                    END RECORD, 
     g_hrcda   DYNAMIC ARRAY OF RECORD
        hrcda01      LIKE hrcda_file.hrcda01,
        hrcda02      LIKE hrcda_file.hrcda02,
        hrcda03      LIKE hrcda_file.hrcda03,
        hrcda03_name LIKE hrbm_file.hrbm04,  
        hrcda04      LIKE hrcda_file.hrcda04,
        hrcda04_name LIKE hrat_file.hrat02,  
        hrcda05      LIKE hrcda_file.hrcda05,
        hrcda06      LIKE hrcda_file.hrcda06,
        hrcda07      LIKE hrcda_file.hrcda07,
        hrcda08      LIKE hrcda_file.hrcda08,
        hrcda09      LIKE hrcda_file.hrcda09,
        hrcda10      LIKE hrcda_file.hrcda10,
        hrcda11      LIKE hrcda_file.hrcda11,
        hrcda12      LIKE hrcda_file.hrcda12,
        hrcda13      LIKE hrcda_file.hrcda13,
        hrcda14      LIKE hrcda_file.hrcda14,
        hrcda15      LIKE hrcda_file.hrcda15,
        hrcda16      LIKE hrcda_file.hrcda16
                    END RECORD,                                                            
     g_wc2,g_sql    string,  #No.FUN-580092 HCN
     g_rec_b         LIKE type_file.num5,      #單身筆數
     l_ac,l_ac1            LIKE type_file.num5       #目前處理的ARRAY CNT
DEFINE g_h,g_m   LIKE  type_file.num5
DEFINE g_forupd_sql STRING   #SELECT ... FOR UPDATE SQL
DEFINE g_cnt           LIKE type_file.num10    
DEFINE g_before_input_done   LIKE type_file.num5     
DEFINE g_i             LIKE type_file.num5    
DEFINE l_table           STRING                 
DEFINE g_str             STRING 
DEFINE g_hratid          LIKE hrat_file.hratid

MAIN
DEFINE p_row,p_col   LIKE type_file.num5      
    OPTIONS                                #改變一些系統預設值
        INPUT NO WRAP
    DEFER INTERRUPT                        #擷取中斷鍵, 由程式處理

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF
  
   WHENEVER ERROR CALL cl_err_msg_log
  
   IF (NOT cl_setup("GHR")) THEN
      EXIT PROGRAM
   END IF
 
      CALL  cl_used(g_prog,g_time,1)       #計算使用時間 (進入時間) #No.MOD-580088  HCN 20050818  #No.FUN-6A0081
         RETURNING g_time    #No.FUN-6A0081
    LET p_row = 5 LET p_col = 22
    OPEN WINDOW i044_w AT p_row,p_col WITH FORM "ghr/42f/ghri044"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
    
    CALL cl_ui_init()
    CALL cl_set_comp_visible("chk",FALSE) #130912 add by wangxh
    CALL cl_set_label_justify("i044_w","right")
 
    LET g_wc2 = '1=1' 
#    CALL i044_b_fill(g_wc2)
#    CALL i044_b_fill2()
    CALL i044_menu()
    CLOSE WINDOW i044_w                 #結束畫面
      CALL  cl_used(g_prog,g_time,2)       #計算使用時間 (退出使間) #No.MOD-580088  HCN 20050818  #No.FUN-6A0081
         RETURNING g_time    #No.FUN-6A0081
END MAIN
 
FUNCTION i044_menu()
 
   WHILE TRUE
      CALL i044_bp("G")
      CASE g_action_choice
         WHEN "query" 
            IF cl_chk_act_auth() THEN
               CALL i044_q()
            END IF
         WHEN "detail"
            IF cl_chk_act_auth() THEN
               CALL i044_b()
            ELSE
               LET g_action_choice = NULL
            END IF
         WHEN "help" 
            CALL cl_show_help()
         WHEN "exit" 
            EXIT WHILE
         WHEN "close"
            EXIT PROGRAM
         WHEN "controlg" 
            CALL cl_cmdask()
         WHEN "exporttoexcel"   #No.FUN-4B0020
            IF cl_chk_act_auth() THEN
              CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_hrcd),'','')
            END IF
         WHEN "ghr_confirm"
            IF cl_chk_act_auth() THEN
              CALL i044_y()
            END IF 
         WHEN "ghr_undo_confirm"
            IF cl_chk_act_auth() THEN
              CALL i044_z()
            END IF 
         WHEN "ghri044_e"
            IF cl_chk_act_auth() THEN
              CALL i044_revoke()
              CALL i044_b_fill2()
            END IF 
         WHEN "ghri044_a"
            IF cl_chk_act_auth() THEN
             CALL i044_p1()
            END IF 
         WHEN "ghri044_b"
            IF cl_chk_act_auth() THEN
             CALL i044_p2()
            END IF 
         WHEN "ghri044_c"
            IF cl_chk_act_auth() THEN
             CALL i044_p3()
            END IF 
         WHEN "ghri044_d"
            IF cl_chk_act_auth() THEN
             CALL i044_p4()
            END IF                                     
         WHEN "txjl"
            IF cl_chk_act_auth() THEN
              CALL i044_tx_fill()
            END IF 
      END CASE
   END WHILE
END FUNCTION
 
FUNCTION i044_q()
   CALL i044_b_askkey()
END FUNCTION
 
FUNCTION i044_b()
DEFINE
    l_ac_t          LIKE type_file.num5,     
    l_n             LIKE type_file.num5,     
    l_lock_sw       LIKE type_file.chr1,     
    p_cmd           LIKE type_file.chr1,     
    l_allow_insert  LIKE type_file.chr1,     
    l_allow_delete  LIKE type_file.chr1      

DEFINE l_hrcd05     LIKE hrcd_file.hrcd05
DEFINE l_count      LIKE type_file.num5
DEFINE l_hrcd03     LIKE hrcd_file.hrcd03
DEFINE l_hrcd04     LIKE hrcd_file.hrcd04
DEFINE l_old_hrcd03 LIKE hrcd_file.hrcd03
DEFINE l_old_hrcd04 LIKE hrcd_file.hrcd04
DEFINE l_new_hrcd05 LIKE hrcd_file.hrcd05
DEFINE l_m          LIKE type_file.num5
DEFINE l_h          LIKE type_file.num5
DEFINE l_nw         LIKE hrcd_file.hrcd01
DEFINE l_wy         LIKE hrcd_file.hrcd01
DEFINE l_sum_hrcd03 LIKE type_file.num5
DEFINE l_sum_hrcd05 LIKE type_file.num5
DEFINE l_hrbm05     LIKE hrbm_file.hrbm05
DEFINE l_sql        LIKE type_file.chr1000
DEFINE l_msg        LIKE type_file.chr1000
DEFINE l_check      LIKE type_file.chr1000
DEFINE l_r          LIKE type_file.chr2
DEFINE l_hrcp04     LIKE hrcp_file.hrcp04
DEFINE l_str        LIKE type_file.chr1000
DEFINE l_hrby06     LIKE hrby_file.hrby06
DEFINE l_sql_1      LIKE type_file.chr1000
DEFINE l_hrbo03     LIKE hrbo_file.hrbo03
DEFINE l_id         LIKE hrat_file.hratid
    IF s_shut(0) THEN RETURN END IF
    CALL cl_opmsg('b')
    LET g_action_choice = ""
 
    LET l_allow_insert = cl_detail_input_auth('insert')
    LET l_allow_delete = cl_detail_input_auth('delete')
 
    LET g_forupd_sql = "SELECT hrcd10  ",
                       " FROM hrcd_file",
                       " WHERE hrcd10=?  FOR UPDATE"
    LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
    DECLARE i044_bcl CURSOR FROM g_forupd_sql      # LOCK CURSOR
 
    INPUT ARRAY g_hrcd WITHOUT DEFAULTS FROM s_hrcd.*
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
            IF g_rec_b>=l_ac THEN
               BEGIN WORK
               LET p_cmd='u'
               LET g_before_input_done = FALSE                                  
               CALL i044_set_entry(p_cmd)                                       
               CALL i044_set_no_entry(p_cmd)                                    
               LET g_before_input_done = TRUE                                   
               LET g_hrcd_t.* = g_hrcd[l_ac].*  #BACKUP
 
               OPEN i044_bcl USING g_hrcd_t.hrcd10
               IF STATUS THEN
                  CALL cl_err("OPEN i044_bcl:", STATUS, 1)
                  LET l_lock_sw = "Y"
               ELSE 
                  FETCH i044_bcl INTO g_hrcd[l_ac].hrcd10 
                  IF SQLCA.sqlcode THEN
                     CALL cl_err(g_hrcd_t.hrcd01,SQLCA.sqlcode,1)
                     LET l_lock_sw = "Y"
                  END IF
               END IF
               CALL cl_show_fld_cont()     #FUN-550037(smin)
            END IF
 
        BEFORE INSERT
           LET g_success = 'Y'
           LET l_n = ARR_COUNT()
           LET p_cmd='a'
           LET g_before_input_done = FALSE                                      
           CALL i044_set_entry(p_cmd)                                           
           CALL i044_set_no_entry(p_cmd)                                        
           LET g_before_input_done = TRUE                                       
           INITIALIZE g_hrcd[l_ac].* TO NULL      #900423
           LET g_hrcd_t.* = g_hrcd[l_ac].*         #新輸入資料
           LET g_hrcd[l_ac].hrcd02 = g_today
           LET g_hrcd[l_ac].hrcd03 = '00:00'
#           LET g_hrcd[l_ac].hrcd04 = g_today     #130729_1 mark
#           LET g_hrcd[l_ac].hrcd05 = '00:00'     #130729_1 mark
           #LET g_hrcd[l_ac].hrcd08 = 'Y'         #add by yinbq 20141110
           LET g_hrcd[l_ac].hrcd08 = 'N'         #add by yinbq 20141110
           LET g_hrcd[l_ac].hrcdconf = 'N'
           LET g_hrcd[l_ac].hrcd10 = g_today USING 'yyyymmdd'
           CALL cl_show_fld_cont()  
           NEXT FIELD hrcd01
 
        AFTER INSERT
           IF INT_FLAG THEN
              CALL cl_err('',9001,0)
              LET INT_FLAG = 0
              CLOSE i044_bcl
              CANCEL INSERT
           END IF
           LET g_hratid = NULL
           LET g_hratid = i044_hrat012hratid(g_hrcd[l_ac].hrcd09)
           IF cl_null(g_hratid) THEN 
              CALL cl_err('','ghr-131',1)
              CANCEL INSERT
           END IF 
           #添加校验员工同一天是否存在请假
           LET l_sql="SELECT hrat01||' '||hrat02||' '||to_char(hrcda05,'yyyy-mm-dd')||' '||hrcda06||' '||to_char(hrcda07,'yyyy-mm-dd')||' '||hrcda08||' '||hrcda09||hrag07||' '||hrbm04 ",
                     " FROM hrcda_file",
                     " LEFT JOIN hrbm_file ON hrbm_file.hrbm03=hrcda_file.hrcda03",
                     " LEFT JOIN hrat_file ON hrat_file.hratid=hrcda_file.hrcda04",
                     " LEFT JOIN hrag_file ON hrag01='504' AND hrag06=hrcda10",
                     " WHERE hrcda_file.hrcda04='",g_hratid,"' AND (hrcda_file.hrcda05='",g_hrcd[l_ac].hrcd02,"' OR hrcda_file.hrcda07='",g_hrcd[l_ac].hrcd02,"')"
           PREPARE i044_check FROM l_sql
           DECLARE i044_check_c CURSOR FOR i044_check
           LET l_check='-\n'
           FOREACH i044_check_c INTO l_msg
              LET l_check=l_check||l_msg||'\n'
           END FOREACH 
           IF NOT cl_null(l_msg) THEN 
              LET l_check='员工当天已经正在请假\n'||l_check||l_msg||'\n确定继续吗？'
              IF NOT cl_confirm(l_check) THEN
                 INITIALIZE g_hrcd[l_ac].* TO NULL
                 LET g_hrcd_t.* = g_hrcd[l_ac].*         #新輸入資料
                 LET g_hrcd[l_ac].hrcd02 = g_today
                 LET g_hrcd[l_ac].hrcd03 = '00:00'
                 LET g_hrcd[l_ac].hrcd04 = g_today     #130729_1 mark
                 LET g_hrcd[l_ac].hrcd05 = '00:00'     #130729_1 mark
                 LET g_hrcd[l_ac].hrcd08 = 'Y'
                 LET g_hrcd[l_ac].hrcdconf = 'N'
                 LET g_hrcd[l_ac].hrcd10 = g_today USING 'yyyymmdd'
                 CALL cl_show_fld_cont()  
                 NEXT FIELD hrcd01
                 RETURN
              END IF
           END IF 
           #添加校验员工同一天是否存在请假
           BEGIN WORK
           SELECT to_char(MAX(hrcd10)+1,'fm0000000000000') INTO g_hrcd[l_ac].hrcd10 FROM hrcd_file
             # WHERE to_date(substr(hrcd10,1,8),'yyyyMMdd') = g_today
             WHERE substr(hrcd10,1,8) = to_char(g_today,'yyyymmdd')
           IF cl_null(g_hrcd[l_ac].hrcd10) THEN
              LET g_hrcd[l_ac].hrcd10 = g_today USING 'yyyymmdd'||'00001'
           END IF 

           INSERT INTO hrcd_file(hrcd01,hrcd02,hrcd03,hrcd04,hrcd05,hrcd06,hrcd07,hrcd08,
                                 hrcd09,hrcd10,hrcd11,hrcd12,
                                 hrcduser,hrcdgrup,hrcdmodu,hrcddate,hrcdacti,hrcdoriu,hrcdorig,hrcdconf,
                                 hrcdud01,hrcdud02,hrcdud03,hrcdud04,hrcdud05,
                                 hrcdud06,hrcdud07,hrcdud08,hrcdud09,hrcdud10,
                                 hrcdud11,hrcdud12,hrcdud13,hrcdud14,hrcdud15)
                         VALUES(g_hrcd[l_ac].hrcd01,g_hrcd[l_ac].hrcd02,g_hrcd[l_ac].hrcd03,g_hrcd[l_ac].hrcd04,
                                g_hrcd[l_ac].hrcd05,g_hrcd[l_ac].hrcd06,g_hrcd[l_ac].hrcd07,g_hrcd[l_ac].hrcd08,
                                g_hratid,g_hrcd[l_ac].hrcd10,g_hrcd[l_ac].hrcd11,g_hrcd[l_ac].hrcd12,
                                g_user,g_grup,g_user,g_today,'Y',g_user,g_grup,g_hrcd[l_ac].hrcdconf,
                                g_hrcd[l_ac].hrcdud01,g_hrcd[l_ac].hrcdud02,g_hrcd[l_ac].hrcdud03,g_hrcd[l_ac].hrcdud04,
                                g_hrcd[l_ac].hrcdud05,g_hrcd[l_ac].hrcdud06,g_hrcd[l_ac].hrcdud07,g_hrcd[l_ac].hrcdud08,
                                g_hrcd[l_ac].hrcdud09,g_hrcd[l_ac].hrcdud10,g_hrcd[l_ac].hrcdud11,g_hrcd[l_ac].hrcdud12,
                                g_hrcd[l_ac].hrcdud13,g_hrcd[l_ac].hrcdud14,g_hrcd[l_ac].hrcdud15)   
           IF SQLCA.sqlcode THEN
               ROLLBACK WORK            
               CALL cl_err3("ins","hrcd_file",g_hrcd[l_ac].hrcd10,"",SQLCA.sqlcode,"","",1)  #No.FUN-660131
               CANCEL INSERT
           ELSE
              CALL sghri044__splitWithExpand(g_hrcd[l_ac].hrcd10)
              IF g_success = 'Y' THEN
                COMMIT WORK 
                 MESSAGE 'INSERT O.K'
                 LET g_rec_b=g_rec_b+1
                 DISPLAY g_rec_b TO FORMONLY.cn2  
              ELSE 
                 ROLLBACK WORK
                 CANCEL INSERT
              END IF 
           END IF
 
        AFTER FIELD hrcd01
            IF NOT cl_null(g_hrcd[l_ac].hrcd01) THEN
               IF g_hrcd[l_ac].hrcd01 != g_hrcd_t.hrcd01 OR
                  g_hrcd_t.hrcd01 IS NULL THEN
                  CALL i044_hrcd01('a') RETURNING g_hrcd[l_ac].hrcd11,g_hrcd[l_ac].hrcd01_name,g_hrcd[l_ac].hrcd07
                  IF NOT cl_null(g_errno) THEN
                  #  SELECT hrbm03 INTO g_hrcd[l_ac].hrcd01 FROM hrbm_file WHERE hrbm04 = 'N',g_hrcd[l_ac].hrcd01   #add by wangwy 2015-08-24
                  LET l_wy = g_hrcd[l_ac].hrcd01
                  LET l_sql = "select hrbm03 from hrbm_file where hrbm04 = N","'",g_hrcd[l_ac].hrcd01,"'"
                  PREPARE i044_q_bm FROM l_sql
                  EXECUTE i044_q_bm INTO l_nw
                    IF cl_null(l_nw) THEN   #add by wangwy 2015-08-24
                      CALL cl_err(g_hrcd[l_ac].hrcd01,g_errno,0)
                      NEXT FIELD hrcd01
                    ELSE 
                    	LET g_hrcd[l_ac].hrcd01 = l_nw
#                      IF cl_null(g_hrcd[l_ac].hrcd02) THEN 
#                       LET g_hrcd[l_ac].hrcd01_name = l_wy
#                      END IF 
                      CALL i044_hrcd01('a') RETURNING g_hrcd[l_ac].hrcd11,g_hrcd[l_ac].hrcd01_name,g_hrcd[l_ac].hrcd07
                    END IF #add by wangwy 2015-08-24
                    
                  END IF 
               END IF
            END IF
            
       AFTER FIELD hrcd03
           IF NOT cl_null(g_hrcd[l_ac].hrcd03) THEN
               LET g_h=''
               LET g_m=''
               LET g_h=g_hrcd[l_ac].hrcd03[1,2]
               LET g_m=g_hrcd[l_ac].hrcd03[4,5]
               IF cl_null(g_h) OR cl_null(g_m) OR g_h>23 OR g_m>59 THEN
                  CALL cl_err('','aec-053',0)
                  NEXT FIELD hrcd03
               END IF
               #130730_1 add
               IF cl_null(g_hrcd[l_ac].hrcd03[5,5])OR cl_null(g_hrcd[l_ac].hrcd03[1,1]) OR cl_null(g_hrcd[l_ac].hrcd03[2,2]) OR cl_null(g_hrcd[l_ac].hrcd03[4,4]) THEN 
                  CALL cl_err('','aec-053',0) 
                  NEXT FIELD hrcd03 
               END IF 
               #add by zhuzw 20150119 start
               SELECT substr(g_hrcd[l_ac].hrcd03,2,2) INTO l_r FROM dual
               IF l_r = '::' THEN 
                  CALL cl_err('','aec-053',0) 
                  NEXT FIELD hrcd03 
               END IF 
               #add by zhuzw 20150119 end  
               #比较时间
               IF NOT cl_null(g_hrcd[l_ac].hrcd04) AND NOT cl_null(g_hrcd[l_ac].hrcd05) THEN 
                  IF g_hrcd[l_ac].hrcd02 = g_hrcd[l_ac].hrcd04 THEN
                     LET l_h=g_hrcd[l_ac].hrcd03[1,2]
                     LET l_m=g_hrcd[l_ac].hrcd03[4,5]
                     LET l_sum_hrcd03 = l_h*24 + l_m
                     LET l_h=g_hrcd[l_ac].hrcd05[1,2]
                     LET l_m=g_hrcd[l_ac].hrcd05[4,5]
                     LET l_sum_hrcd05 = l_h*24 + l_m
                     IF l_sum_hrcd03 > l_sum_hrcd05 THEN
                        CALL cl_err("开始时间不能大于结束时间","!",0)
                        NEXT FIELD hrcd03
                     END IF 
                  END IF 
               END IF 
               #130730_1 end 
            END IF

       AFTER FIELD hrcd05
           IF NOT cl_null(g_hrcd[l_ac].hrcd05) THEN
               #130730_1 add   
               #如果结束日期为空,则将时间清空
               IF cl_null(g_hrcd[l_ac].hrcd04) THEN
                  LET g_hrcd[l_ac].hrcd05 = ''
                  NEXT FIELD hrcd04
               END IF 
               #130730_1 end    
               LET g_h=''
               LET g_m=''
               LET g_h=g_hrcd[l_ac].hrcd05[1,2]
               LET g_m=g_hrcd[l_ac].hrcd05[4,5]
               IF cl_null(g_h) OR cl_null(g_m) OR g_h>23 OR g_m>59 THEN
                  CALL cl_err('','aec-053',0)
                  NEXT FIELD hrcd05
               END IF
               #130730_1 add
               IF cl_null(g_hrcd[l_ac].hrcd05[5,5])OR cl_null(g_hrcd[l_ac].hrcd05[1,1]) OR cl_null(g_hrcd[l_ac].hrcd05[2,2]) OR cl_null(g_hrcd[l_ac].hrcd05[4,4]) THEN 
                  CALL cl_err('','aec-053',0) 
                  NEXT FIELD hrcd05
               END IF
               #add by zhuzw 20150119 start
               SELECT substr(g_hrcd[l_ac].hrcd03,2,2) INTO l_r FROM dual
               IF l_r = '::' THEN 
                  CALL cl_err('','aec-053',0) 
                  NEXT FIELD hrcd03 
               END IF 
               #add by zhuzw 20150119 end 
               #比较时间
               IF NOT cl_null(g_hrcd[l_ac].hrcd04) AND NOT cl_null(g_hrcd[l_ac].hrcd05) THEN
                  IF g_hrcd[l_ac].hrcd02 = g_hrcd[l_ac].hrcd04 THEN
                     LET l_h=g_hrcd[l_ac].hrcd03[1,2]
                     LET l_m=g_hrcd[l_ac].hrcd03[4,5]
                     LET l_sum_hrcd03 = l_h*60 + l_m
                     LET l_h=g_hrcd[l_ac].hrcd05[1,2]
                     LET l_m=g_hrcd[l_ac].hrcd05[4,5]
                     LET l_sum_hrcd05 = l_h*60 + l_m
                     IF l_sum_hrcd03 > l_sum_hrcd05 THEN
                        CALL cl_err("开始时间不能大于结束时间","!",0)
                        NEXT FIELD hrcd03
                     END IF
                  END IF
               END IF
               #130730_1 end
            END IF
 #130911 add by wangxh --str--  
         AFTER FIELD hrcd06
             IF NOT cl_null(g_hrcd[l_ac].hrcd06) THEN
                SELECT hrbm05 INTO l_hrbm05 FROM hrbm_file WHERE hrbm03=g_hrcd[l_ac].hrcd01
                IF g_hrcd[l_ac].hrcd06 MOD l_hrbm05<>0 THEN
                   CALL cl_err('','ghr-199',0)
                   NEXT FIELD hrcd06
                END IF                
             END IF
 
 #130911 add by wangxh --str--   
       AFTER FIELD hrcd09
            IF NOT cl_null(g_hrcd[l_ac].hrcd09) THEN
               IF g_hrcd[l_ac].hrcd09 != g_hrcd_t.hrcd09 OR
                  g_hrcd_t.hrcd09 IS NULL THEN
                  CALL i044_hrcd09('a') RETURNING g_hrcd[l_ac].hrcd09_name
                  IF NOT cl_null(g_errno) THEN
                    CALL cl_err(g_hrcd[l_ac].hrcd09,g_errno,0)
                    NEXT FIELD hrcd09
                  END IF 
               END IF
            END IF

       AFTER FIELD hrcd02
          IF NOT cl_null(g_hrcd[l_ac].hrcd02) THEN
             #130729_1 调整
             #IF g_hrcd[l_ac].hrcd04 IS NULL OR g_hrcd[l_ac].hrcd04 < g_hrcd[l_ac].hrcd02 THEN 
             IF NOT cl_null(g_hrcd[l_ac].hrcd04) AND g_hrcd[l_ac].hrcd04 < g_hrcd[l_ac].hrcd02 THEN 
             #130729_1 end 
                LET g_hrcd[l_ac].hrcd04 = g_hrcd[l_ac].hrcd02
             END IF
         # add by wangwy 20151211 start
             IF NOT cl_null(g_hrcd[l_ac].hrcd09) THEN 
             SELECT hratid INTO l_id FROM hrat_file WHERE hrat01=g_hrcd[l_ac].hrcd09
             SELECT NVL(d.hrdq06,NVL(e.hrdq06,NVL(f.hrdq06,g.hrdq06)))
                 INTO l_hrcp04
                 FROM hrat_file a
                 LEFT JOIN hrcp_file b ON b.hrcp02 = a.hratid AND b.hrcp03 = g_hrcd[l_ac].hrcd02
                 LEFT JOIN hrcb_file c ON c.hrcb05 = a.hratid AND g_hrcd[l_ac].hrcd02 BETWEEN c.hrcb06 AND c.hrcb07
                 LEFT JOIN hrdq_file d ON d.hrdq03 = a.hratid AND d.hrdq05 = g_hrcd[l_ac].hrcd02 AND d.hrdq02=1
                 LEFT JOIN hrdq_file e ON e.hrdq03 = c.hrcb01 AND e.hrdq05 = g_hrcd[l_ac].hrcd02 AND e.hrdq02=4
                 LEFT JOIN hrdq_file f ON f.hrdq03 = a.hrat03 AND f.hrdq05 = g_hrcd[l_ac].hrcd02 AND f.hrdq02=3
                 LEFT JOIN hrdq_file g ON g.hrdq03 = a.hrat04 AND g.hrdq05 = g_hrcd[l_ac].hrcd02 AND g.hrdq02=2
                 WHERE a.hratid = l_id
             SELECT hrbo03 INTO l_hrbo03 FROM hrbo_file WHERE hrbo02=l_hrcp04 AND hrbo01='0000'
             LET l_str = l_hrbo03
             LET l_sql_1="SELECT distinct hrby06 FROM hrby_file WHERE hrby05=to_date('",g_hrcd[l_ac].hrcd02,"','yy/mm/dd') AND hrby09='",l_id,"' AND hrby12='1' AND hrby10='1' order by hrby06"
             PREPARE i044_qk FROM l_sql_1
             DECLARE i044_js1 CURSOR FOR i044_qk
             FOREACH i044_js1 INTO l_hrby06
             LET l_str = l_str,",",l_hrby06
             END FOREACH 
             LET g_hrcd[l_ac].hrcd12 = l_str
             DISPLAY g_hrcd[l_ac].hrcd12 TO hrcd12
             END IF 
         # add by wangwy 20151211 end
         
          END IF
          
       AFTER FIELD hrcd04
          IF NOT cl_null(g_hrcd[l_ac].hrcd04) THEN
             IF g_hrcd[l_ac].hrcd04 < g_hrcd[l_ac].hrcd02 THEN
                CALL cl_err('','ghr-107',0)
                NEXT FIELD hrcd04
             END IF
          END IF
      
        BEFORE DELETE                            #是否取消單身
            IF g_hrcd_t.hrcd10 IS NOT NULL THEN
              IF g_hrcd[l_ac].hrcdconf = 'Y' THEN 
                 CALL cl_err('',9003,0)
                 LET g_hrcd[l_ac].* = g_hrcd_t.*
                 EXIT INPUT
               END IF 
               IF g_hrcd[l_ac].hrcdconf = 'X' THEN 
                  CALL cl_err('',9004,0)
                  LET g_hrcd[l_ac].* = g_hrcd_t.*
                 EXIT INPUT
               END IF 
                IF NOT cl_delete() THEN
                     CANCEL DELETE
                END IF
                INITIALIZE g_doc.* TO NULL                #No.FUN-9B0098 10/02/24
                LET g_doc.column1 = "hrcd10"               #No.FUN-9B0098 10/02/24
                LET g_doc.value1 = g_hrcd[l_ac].hrcd10      #No.FUN-9B0098 10/02/24
                CALL cl_del_doc()                                              #No.FUN-9B0098 10/02/24
                IF l_lock_sw = "Y" THEN 
                   CALL cl_err("", -263, 1) 
                   ROLLBACK WORK
                   CANCEL DELETE 
                END IF 
                CALL i044_del(g_hrcd_t.hrcd10) #add by zhuzw 20150922 
                DELETE FROM hrcd_file WHERE hrcd10 = g_hrcd_t.hrcd10
                IF SQLCA.sqlcode THEN
                    ROLLBACK WORK
                     CALL cl_err3("del","hrcd_file",g_hrcd_t.hrcd10,"",SQLCA.sqlcode,"","",1)   #No.FUN-660131
                    EXIT INPUT
                END IF               
                DELETE FROM hrcda_file WHERE hrcda02 = g_hrcd_t.hrcd10
                IF SQLCA.sqlcode THEN
                    ROLLBACK WORK
                     CALL cl_err3("del","hrcda_file",g_hrcd_t.hrcd10,"",SQLCA.sqlcode,"","",1)   #No.FUN-660131
                    EXIT INPUT
                END IF 
                 DELETE FROM hrcdb_file WHERE hrcdb01 = g_hrcd_t.hrcd10
                CALL g_mhrcda.clear()
                CALL g_shrcda.clear()
                CALL g_yhrcda.clear()
                LET g_rec_b=g_rec_b-1
                DISPLAY g_rec_b TO FORMONLY.cnt  
                COMMIT WORK
            END IF
 
        ON ROW CHANGE
           IF INT_FLAG THEN                 #新增程式段
              CALL cl_err('',9001,0)
              LET INT_FLAG = 0
              LET g_hrcd[l_ac].* = g_hrcd_t.*
              CLOSE i044_bcl
              ROLLBACK WORK
              EXIT INPUT
           END IF
           IF g_hrcd[l_ac].hrcd11 MATCHES '[234]' THEN 
              CALL cl_err('','ghr-146',1)
              LET g_hrcd[l_ac].* = g_hrcd_t.*
              EXIT INPUT
           END IF 
           IF g_hrcd[l_ac].hrcdconf = 'Y' THEN 
              CALL cl_err('',9003,0)
              LET g_hrcd[l_ac].* = g_hrcd_t.*
              EXIT INPUT
           END IF 
           IF g_hrcd[l_ac].hrcdconf = 'X' THEN 
               CALL cl_err('',9004,0)
               LET g_hrcd[l_ac].* = g_hrcd_t.*
              EXIT INPUT
           END IF 
           IF l_lock_sw="Y" THEN
               CALL cl_err(g_hrcd[l_ac].hrcd10,-263,0)
               LET g_hrcd[l_ac].* = g_hrcd_t.*
           ELSE
               LET g_hratid = NULL
               LET g_hratid = i044_hrat012hratid(g_hrcd[l_ac].hrcd09)
               IF cl_null(g_hratid) THEN 
                  CALL cl_err('','ghr-131',1)
                  ROLLBACK WORK
                  EXIT INPUT 
               END IF 
               UPDATE hrcd_file SET hrcd01=g_hrcd[l_ac].hrcd01,
                                    hrcd02=g_hrcd[l_ac].hrcd02,
                                    hrcd03=g_hrcd[l_ac].hrcd03,
                                    hrcd04=g_hrcd[l_ac].hrcd04,
                                    hrcd05=g_hrcd[l_ac].hrcd05,
                                    hrcd06=g_hrcd[l_ac].hrcd06,
                                    hrcd07=g_hrcd[l_ac].hrcd07,
                                    hrcd08=g_hrcd[l_ac].hrcd08,
                                    hrcd09=g_hratid,
                                    hrcd10=g_hrcd[l_ac].hrcd10,
                                    hrcd11=g_hrcd[l_ac].hrcd11,
                                    hrcd12=g_hrcd[l_ac].hrcd12,
                                    hrcdud01=g_hrcd[l_ac].hrcdud01,
                                    hrcdud02=g_hrcd[l_ac].hrcdud02,
                                    hrcdud03=g_hrcd[l_ac].hrcdud03,
                                    hrcdud04=g_hrcd[l_ac].hrcdud04,
                                    hrcdud05=g_hrcd[l_ac].hrcdud05,
                                    hrcdud06=g_hrcd[l_ac].hrcdud06,
                                    hrcdud07=g_hrcd[l_ac].hrcdud07,
                                    hrcdud08=g_hrcd[l_ac].hrcdud08,
                                    hrcdud09=g_hrcd[l_ac].hrcdud09,
                                    hrcdud10=g_hrcd[l_ac].hrcdud10,
                                    hrcdud11=g_hrcd[l_ac].hrcdud11,
                                    hrcdud12=g_hrcd[l_ac].hrcdud12,
                                    hrcdud13=g_hrcd[l_ac].hrcdud13,
                                    hrcdud14=g_hrcd[l_ac].hrcdud14,
                                    hrcdud15=g_hrcd[l_ac].hrcdud15,
                                    hrcdmodu=g_user,
                                    hrcddate=g_today
                  WHERE hrcd10 = g_hrcd[l_ac].hrcd10
               IF SQLCA.sqlcode THEN
                   CALL cl_err3("upd","hrcd_file",g_hrcd_t.hrcd10,"",SQLCA.sqlcode,"","",1)   #NO.FUN-660131
                  LET g_hrcd[l_ac].* = g_hrcd_t.*
               ELSE
                  CALL sghri044__splitWithExpand(g_hrcd[l_ac].hrcd10)
                  IF g_success = 'Y' THEN
                    COMMIT WORK 
                     MESSAGE 'UPDATE O.K'
                  ELSE 
                    ROLLBACK WORK
                    EXIT INPUT
                  END IF 
               END IF
           END IF
 
        AFTER ROW
           LET l_ac = ARR_CURR()         # 新增
           LET l_ac_t = l_ac             # 新增
 
           IF INT_FLAG THEN
              CALL cl_err('',9001,0)
              LET INT_FLAG = 0
              IF p_cmd='u' THEN
                 LET g_hrcd[l_ac].* = g_hrcd_t.*
              END IF
              CLOSE i044_bcl
              ROLLBACK WORK
              EXIT INPUT
           END IF
           CLOSE i044_bcl
           COMMIT WORK
 
       ON ACTION controlp
           CASE WHEN INFIELD(hrcd01)
                   CALL cl_init_qry_var()
                   LET g_qryparam.form = "q_hrbm033"
                   LET g_qryparam.default1 = g_hrcd[l_ac].hrcd01
                   #LET g_qryparam.arg1 = "('004','006','010','011')"
                   LET g_qryparam.arg1 = "('004')"
                   CALL cl_create_qry() RETURNING g_hrcd[l_ac].hrcd01
                   DISPLAY g_hrcd[l_ac].hrcd01 TO hrcd01
                WHEN INFIELD(hrcd09)
                   CALL cl_init_qry_var()
                   LET g_qryparam.form = "q_hrat"
                   LET g_qryparam.default1 = g_hrcd[l_ac].hrcd09
                   CALL cl_create_qry() RETURNING g_hrcd[l_ac].hrcd09
                   DISPLAY g_hrcd[l_ac].hrcd09 TO hrcd09
                OTHERWISE
                   EXIT CASE
            END CASE
 
        ON ACTION CONTROLO                        #沿用所有欄位
            IF INFIELD(hrcd01) AND l_ac > 1 THEN
                LET g_hrcd[l_ac].* = g_hrcd[l_ac-1].*
                NEXT FIELD hrcd01
            END IF
 
        ON ACTION CONTROLR
           CALL cl_show_req_fields()
 
        ON ACTION CONTROLG
            CALL cl_cmdask()
 
        ON ACTION CONTROLF
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913
          
           ON IDLE g_idle_seconds
              CALL cl_on_idle()
              CONTINUE INPUT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
        
    END INPUT
    CLOSE i044_bcl
    COMMIT WORK
    CALL i044_b_fill2()
END FUNCTION
 
FUNCTION i044_b_askkey()
 DEFINE p_row,p_col  LIKE type_file.num5
 
   LET p_row = 5 LET p_col = 22
   OPEN WINDOW i044_w_q AT p_row,p_col WITH FORM "ghr/42f/ghri044_q"  ATTRIBUTE (STYLE = g_win_style CLIPPED) 
   CLEAR FORM
   CALL cl_ui_init() 
   CALL cl_set_label_justify("i044_w_q","right")
 
    CONSTrUCT g_wc2 ON hrcd01,hrcd09,hrcd02,hrcd03,hrcd04,hrcd05,hrcd06,hrcd07,hrcd08,hrcdconf,hrcd10,hrcd11,hrcd12,
                       hrcdud01,hrcdud02,hrcdud03,hrcdud04,hrcdud05,hrcdud06,hrcdud07,hrcdud08,
                       hrcdud09,hrcdud10,hrcdud11,hrcdud12,hrcdud13,hrcdud14,hrcdud15
         FROM s_hrcd[1].hrcd01,  s_hrcd[1].hrcd09,  s_hrcd[1].hrcd02,  s_hrcd[1].hrcd03,  s_hrcd[1].hrcd04,
              s_hrcd[1].hrcd05,  s_hrcd[1].hrcd06,  s_hrcd[1].hrcd07,  s_hrcd[1].hrcd08,  s_hrcd[1].hrcdconf,s_hrcd[1].hrcd10,
              s_hrcd[1].hrcd11,
              s_hrcd[1].hrcd12,  s_hrcd[1].hrcdud01,s_hrcd[1].hrcdud02,s_hrcd[1].hrcdud03,s_hrcd[1].hrcdud04,
              s_hrcd[1].hrcdud05,s_hrcd[1].hrcdud06,s_hrcd[1].hrcdud07,s_hrcd[1].hrcdud08,
              s_hrcd[1].hrcdud09,s_hrcd[1].hrcdud10,s_hrcd[1].hrcdud11,s_hrcd[1].hrcdud12,s_hrcd[1].hrcdud13,
              s_hrcd[1].hrcdud14,s_hrcd[1].hrcdud15
 
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
              ON ACTION controlp
                CASE WHEN INFIELD(hrcd01)
                        CALL cl_init_qry_var()
                        LET g_qryparam.form = "q_hrbm03"
                        LET g_qryparam.state = "c"
                        CALL cl_create_qry() RETURNING g_qryparam.multiret
                        DISPLAY g_qryparam.multiret TO s_hrcd[1].hrcd01            
                     WHEN INFIELD(hrcd09)
                        CALL cl_init_qry_var()
                        LET g_qryparam.form = "q_hrat"
                        LET g_qryparam.state = "c"
                        CALL cl_create_qry() RETURNING g_qryparam.multiret
                        DISPLAY g_qryparam.multiret TO s_hrcd[1].hrcd09 
                     OTHERWISE
                        EXIT CASE
                 END CASE
 
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
      ON ACTION qbe_select
         CALL cl_qbe_select() 
      ON ACTION qbe_save
       CALL cl_qbe_save()
    END CONSTRUCT
    LET g_wc2 = g_wc2 CLIPPED,cl_get_extra_cond('hrcduser', 'hrcdgrup') #FUN-980030
 
   CLOSE WINDOW i044_w_q 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      LET g_wc2 = NULL
      RETURN
   END IF

   CALL g_hrcd.clear()
   CALL cl_replace_str(g_wc2,"hrcd09","hrat01") RETURNING g_wc2
   CALL i044_b_fill(g_wc2)
   CALL i044_b_fill2()
END FUNCTION
 
FUNCTION i044_b_fill(p_wc2)              #BODY FILL UP
DEFINE
    p_wc2           LIKE type_file.chr1000   #No.FUN-680102 VARCHAR(200)
    

 
    LET g_sql =
        "SELECT 'N',hrcd01,hrbm04,hrcd11,hrat01,hrat02,hrcd02,hrcd03,hrcd04,hrcd05,hrcd06,hrcd07,",
        "       hrcd08,hrcdconf,hrcd10,hrcd12,",
        "       hrcdud01,hrcdud02,hrcdud03,hrcdud04,hrcdud05,",
        "       hrcdud06,hrcdud07,hrcdud08,hrcdud09,hrcdud10,",
        "       hrcdud11,hrcdud12,hrcdud13,hrcdud14,hrcdud15 ",
        "  FROM hrcd_file,hrbm_file,hrat_file ",
        " WHERE ", p_wc2 CLIPPED,                     #單身
        "   AND hrcd01 = hrbm03(+) ",
        "   AND hrcd09 = hratid(+) ",
        " ORDER BY hrcd01,hrat01,hrcd02"
    PREPARE i044_pb FROM g_sql
    DECLARE hrcd_curs CURSOR FOR i044_pb
 
    CALL g_hrcd.clear()
    CALL cl_set_comp_visible("chk",FALSE)    #130912 add by wangxh
    LET g_cnt = 1
    MESSAGE "Searching!" 
    FOREACH hrcd_curs INTO g_hrcd[g_cnt].*   #單身 ARRAY 填充
        IF STATUS THEN CALL cl_err('foreach:',STATUS,1) EXIT FOREACH END IF
        
        LET g_cnt = g_cnt + 1
        IF g_cnt > g_max_rec THEN
           CALL cl_err( '', 9035, 0 )
           EXIT FOREACH
        END IF
    END FOREACH
    CALL g_hrcd.deleteElement(g_cnt)
    MESSAGE ""
    LET g_rec_b = g_cnt-1
    DISPLAY g_rec_b TO FORMONLY.cn2  
    LET g_cnt = 0
END FUNCTION
 
FUNCTION i044_bp(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1      #No.FUN-680102 VARCHAR(1)
 
 
   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF
 
   LET g_action_choice = " "
   CALL cl_set_act_visible("accept,cancel", FALSE)
   DIALOG ATTRIBUTES(UNBUFFERED)
      DISPLAY ARRAY g_hrcd TO s_hrcd.* ATTRIBUTE(COUNT=g_rec_b)
 
         BEFORE ROW
            LET l_ac = ARR_CURR()
            IF l_ac > 0 THEN 
              CALL i044_msy_fill(g_hrcd[l_ac].hrcd09,g_hrcd[l_ac].hrcd10)
            END IF 
            CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
         
      END DISPLAY
      
      DISPLAY ARRAY g_hrcda TO s_hrcda.* ATTRIBUTE(COUNT=g_rec_b)
 
         BEFORE ROW
#            LET l_ac = ARR_CURR()
            CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
      END DISPLAY 
      
      DISPLAY ARRAY g_dhrcda TO s_dhrcda.* ATTRIBUTE(COUNT=g_rec_b)
 
         BEFORE ROW
            LET l_ac1 = ARR_CURR()
            CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
      ON ACTION txjl
         LET g_action_choice="txjl"
         EXIT DIALOG            
      END DISPLAY      
 
      DISPLAY ARRAY g_mhrcda TO s_mhrcda.* ATTRIBUTE(COUNT=g_rec_b)
 
         BEFORE ROW
#            LET l_ac = ARR_CURR()
            CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
      END DISPLAY
      
      DISPLAY ARRAY g_shrcda TO s_shrcda.* ATTRIBUTE(COUNT=g_rec_b)
 
         BEFORE ROW
#            LET l_ac = ARR_CURR()
            CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
      END DISPLAY   
      
      DISPLAY ARRAY g_yhrcda TO s_yhrcda.* ATTRIBUTE(COUNT=g_rec_b)
 
         BEFORE ROW
#            LET l_ac = ARR_CURR()
            CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
      END DISPLAY   
            
      ##########################################################################
      # Standard 4ad ACTION
      ##########################################################################
      ON ACTION query
         LET g_action_choice="query"
         EXIT DIALOG
      ON ACTION detail
         LET g_action_choice="detail"
         EXIT DIALOG
      ON ACTION accept
         LET g_action_choice="detail"
         EXIT DIALOG
      ON ACTION help
         LET g_action_choice="help"
         EXIT DIALOG
      ON ACTION ghr_confirm
         LET g_action_choice="ghr_confirm"
         EXIT DIALOG
      ON ACTION ghr_undo_confirm
         LET g_action_choice="ghr_undo_confirm"
         EXIT DIALOG        
      ON ACTION ghri044_a
         LET g_action_choice="ghri044_a"
         EXIT DIALOG
      ON ACTION ghri044_b
         LET g_action_choice="ghri044_b"
         EXIT DIALOG
      ON ACTION ghri044_c
         LET g_action_choice="ghri044_c"
         EXIT DIALOG
      ON ACTION ghri044_d
         LET g_action_choice="ghri044_d"
         EXIT DIALOG                       
      ON ACTION ghri044_e
         LET g_action_choice="ghri044_e"
         EXIT DIALOG
 
      ON ACTION locale
         CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
 
      ON ACTION close 
         LET g_action_choice="close"
         EXIT DIALOG
      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DIALOG
 
      ##########################################################################
      # Special 4ad ACTION
      ##########################################################################
      ON ACTION controlg 
         LET g_action_choice="controlg"
         EXIT DIALOG
 
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DIALOG  
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION exporttoexcel   #No.FUN-4B0020
         LET g_action_choice = 'exporttoexcel'
         EXIT DIALOG 
      
      ON ACTION cancel
         LET INT_FLAG=FALSE 		
         LET g_action_choice="exit"
         EXIT DIALOG 
 
   END DIALOG
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION


                                                         
FUNCTION i044_set_entry(p_cmd)                                                  
  DEFINE p_cmd   LIKE type_file.chr1      #No.FUN-680102 VARCHAR(01)                                                       
                                                                                
   IF p_cmd = 'a' AND ( NOT g_before_input_done ) THEN                          
     CALL cl_set_comp_entry("hrcd01,hrcd03,hrcd05",TRUE)                                       
   END IF                                                                       
                                                                                
END FUNCTION                                                                    
                                                                                
FUNCTION i044_set_no_entry(p_cmd)                                               
  DEFINE p_cmd   LIKE type_file.chr1      #No.FUN-680102 VARCHAR(01)                                                       
            
   CALL cl_set_comp_entry("hrcd11,chk",FALSE)                                                                    
   IF p_cmd = 'u' AND ( NOT g_before_input_done ) AND g_chkey='N' THEN          
     CALL cl_set_comp_entry("hrcd01",FALSE)                                      
   END IF                                                                       
                                                                                
END FUNCTION                                                                    
   
FUNCTION i044_hrcd01(p_cmd)
 DEFINE p_cmd         LIKE type_file.chr1
   DEFINE l_hrbm02    LIKE hrbm_file.hrbm02
   DEFINE l_hrbm04    LIKE hrbm_file.hrbm04 
   DEFINE l_hrbm06    LIKE hrbm_file.hrbm06
   DEFINE l_hrbm07    LIKE hrbm_file.hrbm07
   DEFINE l_n         LIKE type_file.num5

   LET g_errno = NULL
   SELECT hrbm02,hrbm04,hrbm06,hrbm07 INTO l_hrbm02,l_hrbm04,l_hrbm06,l_hrbm07 FROM hrbm_file
    WHERE hrbm03=g_hrcd[l_ac].hrcd01
      #AND hrbm02 IN('004','006','010','011')
      AND hrbm02 IN('004')
    CASE
        WHEN SQLCA.sqlcode=100   LET g_errno='ghr-072'
                                 LET l_hrbm02=NULL LET l_hrbm04=NULL  LET l_hrbm06=NULL
   
        WHEN l_hrbm07='N'      LET g_errno='9028'
                                 LET l_hrbm02=NULL LET l_hrbm04=NULL  LET l_hrbm06=NULL
        OTHERWISE
             LET g_errno=SQLCA.sqlcode USING '------'
    END CASE
    CASE l_hrbm02 
      WHEN '004'  LET l_hrbm02 = '4'
#      WHEN '006'  LET l_hrbm02 = '2'
#      WHEN '010'  LET l_hrbm02 = '1'
#      WHEN '011'  LET l_hrbm02 = '3'
      OTHERWISE     LET l_hrbm02 = NULL
    END CASE 
    RETURN l_hrbm02,l_hrbm04,l_hrbm06
END FUNCTION 

FUNCTION i044_hrcd09(p_cmd)
 DEFINE p_cmd         LIKE type_file.chr1
   DEFINE l_hrat02    LIKE hrat_file.hrat02
   DEFINE l_hratconf  LIKE hrat_file.hratconf
   DEFINE l_n         LIKE type_file.num5

   LET g_errno = NULL
   SELECT hrat02,hratconf INTO l_hrat02,l_hratconf FROM hrat_file
    WHERE hrat01=g_hrcd[l_ac].hrcd09
    CASE
        WHEN SQLCA.sqlcode=100   LET g_errno='ghr-047'
                                 LET l_hrat02=NULL
        WHEN l_hratconf='N'      LET g_errno='9029'
                                 LET l_hrat02=NULL
        OTHERWISE
             LET g_errno=SQLCA.sqlcode USING '------'
    END CASE
    RETURN l_hrat02
END FUNCTION 

FUNCTION i044_msy_fill(p_hrcda04,p_hrcda02)
 DEFINE p_hrcda04  LIKE  hrcda_file.hrcda04
 DEFINE p_hrcda02  LIKE  hrcda_file.hrcda02
 DEFINE l_hrcd01   LIKE  hrcd_file.hrcd01

   CALL g_mhrcda.clear()
   CALL g_shrcda.clear()
   CALL g_yhrcda.clear()
   CALL g_dhrcda.clear()
   LET p_hrcda04 = i044_hrat012hratid(p_hrcda04)
   IF cl_null(p_hrcda04) THEN RETURN END IF 
   LET g_sql = "SELECT hrcda05,hrcda06,hrcda07,hrcda08,hrcda09,hrcda10,hrcda15,hrcda16 FROM hrcda_file ",  #增加是否撤销假
               " WHERE hrcda04 = '",p_hrcda04,"' ",
               "   AND hrcda16 = 'N' "
     
   PREPARE i044_d_prep FROM g_sql||" AND hrcda02 = '"||p_hrcda02||"'  ORDER BY 1,2,3,4 "            
   PREPARE i044_m_prep FROM g_sql||" AND (TO_CHAR(hrcda05,'yyyy') = TO_CHAR(SYSDATE,'yyyy') OR TO_CHAR(hrcda07,'yyyy') = TO_CHAR(SYSDATE,'yyyy')) "||
                            " AND (TO_CHAR(hrcda05,'MM') = TO_CHAR(SYSDATE,'MM') OR TO_CHAR(hrcda07,'MM') = TO_CHAR(SYSDATE,'MM'))  "||
                            " ORDER BY 1,2,3,4"
   PREPARE i044_s_prep FROM g_sql||" AND (TO_CHAR(hrcda05,'yyyy') = TO_CHAR(SYSDATE,'yyyy') OR TO_CHAR(hrcda07,'yyyy') = TO_CHAR(SYSDATE,'yyyy')) "||
                            " AND (TO_CHAR(hrcda05,'Q') = TO_CHAR(SYSDATE,'Q') OR TO_CHAR(hrcda07,'Q') = TO_CHAR(SYSDATE,'Q'))  "||
                            " AND NOT (TO_CHAR(hrcda05,'MM') = TO_CHAR(SYSDATE,'MM') OR TO_CHAR(hrcda07,'MM') = TO_CHAR(SYSDATE,'MM')) "||
                            " ORDER BY 1,2,3,4"
   PREPARE i044_y_prep FROM g_sql||" AND (TO_CHAR(hrcda05,'yyyy') = TO_CHAR(SYSDATE,'yyyy') OR TO_CHAR(hrcda07,'yyyy') = TO_CHAR(SYSDATE,'yyyy')) "||
                            " AND NOT (TO_CHAR(hrcda05,'Q') = TO_CHAR(SYSDATE,'Q') OR TO_CHAR(hrcda07,'Q') = TO_CHAR(SYSDATE,'Q'))  "||
                            " ORDER BY 1,2,3,4"
   DECLARE i044_d_cs CURSOR FOR i044_d_prep
   DECLARE i044_m_cs CURSOR FOR i044_m_prep
   DECLARE i044_s_cs CURSOR FOR i044_s_prep
   DECLARE i044_y_cs CURSOR FOR i044_y_prep

   LET g_cnt = 1 
   FOREACH i044_d_cs INTO g_dhrcda[g_cnt].*
      IF SQLCA.sqlcode THEN EXIT FOREACH END IF
#130912 add by wangxh --str--
      IF NOT cl_null(g_dhrcda[g_cnt].hrcda10) THEN 
        CASE g_dhrcda[g_cnt].hrcda10
             WHEN '001'  LET g_dhrcda[g_cnt].hrcda10='天'
             WHEN '002'  LET g_dhrcda[g_cnt].hrcda10='半天'
             WHEN '003'  LET g_dhrcda[g_cnt].hrcda10='小时'
             WHEN '004'  LET g_dhrcda[g_cnt].hrcda10='分钟'
             WHEN '005'  LET g_dhrcda[g_cnt].hrcda10='次'
         END CASE
       END IF
#130912 add by wangxh --end--
      LET g_cnt = g_cnt + 1 
   END FOREACH
   CALL g_dhrcda.deleteElement(g_cnt)
      
   LET g_cnt = 1 
   FOREACH i044_m_cs INTO g_mhrcda[g_cnt].*
      IF SQLCA.sqlcode THEN EXIT FOREACH END IF 
#130912 add by wangxh --str--
       IF NOT cl_null(g_mhrcda[g_cnt].hrcda10) THEN 
        CASE g_mhrcda[g_cnt].hrcda10
             WHEN '001'  LET g_mhrcda[g_cnt].hrcda10='天'
             WHEN '002'  LET g_mhrcda[g_cnt].hrcda10='半天'
             WHEN '003'  LET g_mhrcda[g_cnt].hrcda10='小时'
             WHEN '004'  LET g_mhrcda[g_cnt].hrcda10='分钟'
             WHEN '005'  LET g_mhrcda[g_cnt].hrcda10='次'
         END CASE
       END IF
 #130912 add by wangxh --end--
      LET g_cnt = g_cnt + 1 
   END FOREACH
   CALL g_mhrcda.deleteElement(g_cnt)
   
   LET g_cnt = 1 
   FOREACH i044_s_cs INTO g_shrcda[g_cnt].*
      IF SQLCA.sqlcode THEN EXIT FOREACH END IF 
#130912 add by wangxh --str--
        IF NOT cl_null(g_shrcda[g_cnt].hrcda10) THEN 
        CASE g_shrcda[g_cnt].hrcda10
             WHEN '001'  LET g_shrcda[g_cnt].hrcda10='天'
             WHEN '002'  LET g_shrcda[g_cnt].hrcda10='半天'
             WHEN '003'  LET g_shrcda[g_cnt].hrcda10='小时'
             WHEN '004'  LET g_shrcda[g_cnt].hrcda10='分钟'
             WHEN '005'  LET g_shrcda[g_cnt].hrcda10='次'
         END CASE
       END IF
#130912 add by wangxh --end--
      LET g_cnt = g_cnt + 1 
   END FOREACH
   CALL g_shrcda.deleteElement(g_cnt)
   
   LET g_cnt = 1 
   FOREACH i044_y_cs INTO g_yhrcda[g_cnt].*
      IF SQLCA.sqlcode THEN EXIT FOREACH END IF 
#130912 add by wangxh --str--
        IF NOT cl_null(g_yhrcda[g_cnt].hrcda10) THEN 
        CASE g_yhrcda[g_cnt].hrcda10
             WHEN '001'  LET g_yhrcda[g_cnt].hrcda10='天'
             WHEN '002'  LET g_yhrcda[g_cnt].hrcda10='半天'
             WHEN '003'  LET g_yhrcda[g_cnt].hrcda10='小时'
             WHEN '004'  LET g_yhrcda[g_cnt].hrcda10='分钟'
             WHEN '005'  LET g_yhrcda[g_cnt].hrcda10='次'
         END CASE
       END IF
 #130912 add by wangxh --end--
      LET g_cnt = g_cnt + 1 
   END FOREACH
   CALL g_yhrcda.deleteElement(g_cnt)   
END FUNCTION

FUNCTION i044_b_fill2()

   CALL g_hrcda.clear()
   LET g_cnt = 1 
   LET g_sql = "SELECT hrcda01,hrcda02,hrcda03,hrbm04,hrat01,hrat02,hrcda05,hrcda06,hrcda07,hrcda08,",
               "       hrcda09,hrcda10,hrcda11,hrcda12,hrcda13,hrcda14,hrcda15,hrcda16 ",
               "  FROM hrcda_file,hrbm_file,hrat_file",
               " WHERE 1=1 ",
               "   AND hrcda03 = hrbm03(+) ",
               "   AND hrcda04 = hratid(+) ",
               "   AND hrcda16 = 'N' ",
               " ORDER BY hrcda02 DESC,hrcda01 DESC"
   PREPARE i044_fill2_prep FROM g_sql
   DECLARE i044_fill2_cs CURSOR FOR i044_fill2_prep
   FOREACH i044_fill2_cs INTO g_hrcda[g_cnt].*
      IF SQLCA.sqlcode THEN EXIT FOREACH END IF 
#130912 add by wangxh --str--
        IF NOT cl_null(g_hrcda[g_cnt].hrcda10) THEN 
        CASE g_hrcda[g_cnt].hrcda10
             WHEN '001'  LET g_hrcda[g_cnt].hrcda10='天'
             WHEN '002'  LET g_hrcda[g_cnt].hrcda10='半天'
             WHEN '003'  LET g_hrcda[g_cnt].hrcda10='小时'
             WHEN '004'  LET g_hrcda[g_cnt].hrcda10='分钟'
             WHEN '005'  LET g_hrcda[g_cnt].hrcda10='次'
         END CASE
       END IF
#130912 add by wangxh --end--    
      LET g_cnt = g_cnt + 1 
   END FOREACH
   CALL g_hrcda.deleteElement(g_cnt)
END FUNCTION

FUNCTION i044_revoke()
   CALL s_showmsg_init()
   CALL sghri044_revoke(FALSE,FALSE)
END FUNCTION

FUNCTION i044_y()
 DEFINE l_hrcd    RECORD  LIKE  hrcd_file.*
 DEFINE l_forupd_sql  STRING
 DEFINE i,l_i,l_n         LIKE type_file.num5
 DEFINE l_ww   LIKE  type_file.chr1000
 DEFINE l_sql,l_msg STRING
 DEFINE l_hrcda   RECORD  LIKE  hrcda_file.*
  DEFINE l_hrat01 LIKE hrat_file.hrat01

  #IF l_ac = 0 OR l_ac IS NULL THEN RETURN END IF 
   INPUT ARRAY g_hrcd WITHOUT DEFAULTS FROM s_hrcd.*
       ATTRIBUTE (COUNT=g_rec_b,MAXCOUNT=g_max_rec,UNBUFFERED,
                 INSERT ROW = FALSE,DELETE ROW=FALSE,APPEND ROW=FALSE) 
 
        BEFORE ROW
            LET l_ac = ARR_CURR()
            CALL cl_set_comp_visible("chk",TRUE) #130912 add by wangxh
            CALL cl_set_comp_entry("chk",TRUE)
            CALL cl_set_comp_entry("hrcd01,hrcd11,hrcd09,hrcd02,hrcd03,hrcd04,hrcd05,hrcd06,hrcd07,hrcd08,hrcd12",FALSE)
            
        AFTER ROW
           LET l_ac = ARR_CURR()         # 新增
           
           IF INT_FLAG THEN
              EXIT INPUT
           END IF
 
        ON ACTION CONTROLG
            CALL cl_cmdask()
        ON ACTION sel_all
           LET g_action_choice="sel_all" 
           LET l_i = 0        	
           FOR l_i = 1 TO g_rec_b
               LET g_hrcd[l_i].chk = 'Y'
           END FOR  
        ON ACTION sel_none
           LET g_action_choice="sel_none"   
           LET l_i = 0     	
           FOR l_i = 1 TO g_rec_b
               LET g_hrcd[l_i].chk = 'N'
              # DISPLAY BY NAME g_hrcn[l_i].sel
           END FOR 
        ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE INPUT
   END INPUT
   CALL cl_set_comp_visible("chk",FALSE)    #130912 add by wangxh
   CALL cl_set_comp_entry("hrcd01,hrcd11,hrcd09,hrcd02,hrcd03,hrcd04,hrcd05,hrcd06,hrcd07,hrcd08,hrcd12",TRUE)
   
   IF INT_FLAG THEN 
   	  LET INT_FLAG = FALSE
   	  RETURN
   END IF 
   
   IF NOT cl_confirm('axm-108') THEN RETURN END IF 
   
   LET g_success = 'Y'
   CALL s_showmsg_init()
   LET l_forupd_sql = "SELECT * FROM hrcd_file WHERE hrcd10 = ? FOR UPDATE "
   LET l_forupd_sql = cl_forupd_sql(l_forupd_sql)
   DECLARE i044_forupd_cl CURSOR FROM l_forupd_sql
   
   BEGIN WORK
   FOR i=1 TO g_rec_b 
      IF g_hrcd[i].chk = 'Y' THEN 
      	 INITIALIZE l_hrcd.* TO NULL
         SELECT * INTO l_hrcd.* FROM hrcd_file WHERE hrcd10 = g_hrcd[i].hrcd10
#-------add by wangwy 2015-08-12 start------------------
         LET l_sql = "select * from hrcda_file where hrcda02 = '",g_hrcd[i].hrcd10,"'"
         PREPARE i044_jq FROM l_sql
         DECLARE i044_js CURSOR FOR i044_jq
         FOREACH i044_js INTO l_hrcda.*
           SELECT COUNT(*) INTO l_n FROM hrcda_file LEFT JOIN hrcd_file ON hrcda02=hrcd10
            WHERE hrcda02 != g_hrcd[i].hrcd10
             AND hrcda05 = l_hrcda.hrcda05
             AND hrcda04 = l_hrcda.hrcda04
             AND hrcda06 = l_hrcda.hrcda06 
             AND hrcda08 = l_hrcda.hrcda08
             AND hrcdconf = 'Y'
             AND hrcda16 = 'N'
           IF l_n > 0 THEN           
              LET g_success = 'N' 
              CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'','ghr-268',1)
              CONTINUE FOR   
           END IF   
           SELECT COUNT(*) INTO l_n FROM hrcec_file
            WHERE hrcec04 = l_hrcda.hrcda04
             AND hrcec05 = l_hrcda.hrcda05
             AND ((substr(hrcec06,1,2)*60+substr(hrcec06,4,2) <= substr(l_hrcda.hrcda06,1,2)*60+substr(l_hrcda.hrcda06,4,2) AND substr(hrcec08,1,2)*60+substr(hrcec08,4,2) > substr(l_hrcda.hrcda06,1,2)*60+substr(l_hrcda.hrcda06,4,2) )OR(substr(hrcec06,1,2)*60+substr(hrcec06,4,2) >= substr(l_hrcda.hrcda06,1,2)*60+substr(l_hrcda.hrcda06,4,2) AND substr(hrcec06,1,2)*60+substr(hrcec06,4,2) < substr(l_hrcda.hrcda08,1,2)*60+substr(l_hrcda.hrcda08,4,2)))
             AND hrcec16 = 'N'
           IF l_n > 0 THEN           
              LET g_success = 'N' 
              CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'','ghr-269',1)
              CONTINUE FOR   
           END IF   
         END FOREACH 
#-------add by wangwy 2015-08-12 end--------------------
         IF cl_null(l_hrcd.hrcd10) THEN 
      	    CALL s_errmsg("hrcd10",l_hrcd.hrcd10,'',-400,1)
      	    LET g_success = 'N'
            CONTINUE FOR 
         END IF
         IF l_hrcd.hrcdconf = 'X' THEN 
            LET g_success = 'N' 
            CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'','9024',1)
            CONTINUE FOR 
         END IF 
         IF l_hrcd.hrcdconf = 'Y' THEN 
            LET g_success = 'N' 
            CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'','9023',1)
            CONTINUE FOR 
         END IF 
         IF l_hrcd.hrcdacti = 'N' THEN 
            LET g_success = 'N' 
            CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'','mfg0301',1)
            CONTINUE FOR 
         END IF  
        OPEN i044_forupd_cl USING l_hrcd.hrcd10
        IF SQLCA.sqlcode THEN 
           LET g_success = 'N'
           CALL s_errmsg('hrcd10',g_hrcd[i].hrcd10,'',SQLCA.sqlcode,1)
           CONTINUE FOR
        END IF 
        UPDATE hrcd_file SET hrcdconf = 'Y',
                             hrcdmodu = g_user,
                             hrcddate = g_today
         WHERE hrcd10 = l_hrcd.hrcd10
#130912_2 add by wangxh --str--
        UPDATE hrcp_file SET hrcp35='N',
                             hrcpmodu=g_user,
                             hrcpdate=g_today
          WHERE hrcp02=l_hrcd.hrcd09 AND hrcp03 BETWEEN l_hrcd.hrcd02 AND l_hrcd.hrcd04
          #add by zhuzw 20160907 start #增加时时调用考勤处理逻辑
        #   LET l_msg="ghrp056 Y ",l_hrcd.hrcd02," ",l_hrcd.hrcd04," 1 ",l_hrcd.hrcd09," "
         #  CALL cl_cmdrun(l_msg) 
          #add by zhuzw 20160907 end 
#130912_2 add by wangxh --end--
        IF SQLCA.sqlcode THEN                                          
           CALL s_errmsg('hrcd10',g_hrcd[i].hrcd10,'upd hrcd_file','abm-984',1)
           LET g_success = 'N'
        END IF       
      END IF 
   END FOR
   IF g_success = 'Y' THEN 
       COMMIT WORK
       CALL cl_err('','abm-983',0)
   ELSE 
       ROLLBACK WORK
       CALL s_showmsg()
   END IF 
 #   #add by zhuzw 20160907 start#增加时时调用考勤处理逻辑
   FOR i=1 TO g_rec_b 
      IF g_hrcd[i].chk = 'Y' THEN 
      	 INITIALIZE l_hrcd.* TO NULL
         SELECT * INTO l_hrcd.* FROM hrcd_file WHERE hrcd10 = g_hrcd[i].hrcd10
        UPDATE hrcp_file SET hrcp35='N',
                             hrcpmodu=g_user,
                             hrcpdate=g_today
          WHERE hrcp02=l_hrcd.hrcd09 AND hrcp03 BETWEEN l_hrcd.hrcd02 AND l_hrcd.hrcd04
          SELECT hrat01 INTO l_hrat01 FROM hrat_file WHERE hratid = l_hrcd.hrcd09
          SLEEP 1
           LET l_msg="ghrp056 Y ",l_hrcd.hrcd02," ",l_hrcd.hrcd04," 1 ",l_hrat01," "
           CALL cl_cmdrun(l_msg) 
       END IF      
    END FOR                    
#   #add by zhuzw 20160907 end 
   LET l_ww = 'hrcd09 = ',l_hrcd.hrcd09
   CALL i044_b_fill(l_ww) 
  
END FUNCTION

FUNCTION i044_z()
 DEFINE l_hrcd    RECORD  LIKE  hrcd_file.*
 DEFINE l_forupd_sql,l_msg  STRING
 DEFINE l_ww2   LIKE  type_file.chr1000
 DEFINE i         LIKE type_file.num5
 DEFINE l_hrat01 LIKE hrat_file.hrat01
  #IF l_ac = 0 OR l_ac IS NULL THEN RETURN END IF 
   INPUT ARRAY g_hrcd WITHOUT DEFAULTS FROM s_hrcd.*
       ATTRIBUTE (COUNT=g_rec_b,MAXCOUNT=g_max_rec,UNBUFFERED,
                 INSERT ROW = FALSE,DELETE ROW=FALSE,APPEND ROW=FALSE) 
 
        BEFORE ROW
            LET l_ac = ARR_CURR()
            CALL cl_set_comp_visible("chk",TRUE) #130612 add by wangxh130912
            CALL cl_set_comp_entry("chk",TRUE)
            CALL cl_set_comp_entry("hrcd01,hrcd11,hrcd09,hrcd02,hrcd03,hrcd04,hrcd05,hrcd06,hrcd07,hrcd08,hrcd12",FALSE)
            
        AFTER ROW
           LET l_ac = ARR_CURR()         # 新增
 
           IF INT_FLAG THEN
              EXIT INPUT
           END IF
 
        ON ACTION CONTROLG
            CALL cl_cmdask()
 
        ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE INPUT
   END INPUT
   CALL cl_set_comp_visible("chk",FALSE)    #130912 add by wangxh
   CALL cl_set_comp_entry("hrcd01,hrcd11,hrcd09,hrcd02,hrcd03,hrcd04,hrcd05,hrcd06,hrcd07,hrcd08,hrcd12",TRUE)
   
   IF INT_FLAG THEN 
      LET INT_FLAG = FALSE
      RETURN
   END IF 
      
   IF NOT cl_confirm('axm-108') THEN RETURN END IF 
   
   CALL s_showmsg_init()
   LET g_success = 'Y'
   LET l_forupd_sql = "SELECT * FROM hrcd_file WHERE hrcd10 = ? FOR UPDATE "
   LET l_forupd_sql = cl_forupd_sql(l_forupd_sql)
   DECLARE i044_forupd_cl2 CURSOR FROM l_forupd_sql
   
   BEGIN WORK
   FOR i=1 TO g_rec_b 
      IF g_hrcd[i].chk = 'Y' THEN 
      	 INITIALIZE l_hrcd.* TO NULL
         SELECT * INTO l_hrcd.* FROM hrcd_file WHERE hrcd10 = g_hrcd[i].hrcd10
         IF cl_null(l_hrcd.hrcd10) THEN 
      	    CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'',-400,1)
      	    LET g_success = 'N'
            CONTINUE FOR
         END IF
         IF l_hrcd.hrcdconf = 'X' THEN 
         	  LET g_success = 'N' 
         	  CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'','9024',1)
            CONTINUE FOR
         END IF 
         IF l_hrcd.hrcdconf = 'N' THEN 
            CONTINUE FOR 
         END IF 
         IF l_hrcd.hrcdacti = 'N' THEN 
         	  LET g_success = 'N' 
         	  CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'','mfg0301',1)
            CONTINUE FOR
         END IF  
        OPEN i044_forupd_cl2 USING l_hrcd.hrcd10
        IF SQLCA.sqlcode THEN 
           LET g_success = 'N'
           CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'',SQLCA.sqlcode,1)
           CONTINUE FOR
        END IF 
        UPDATE hrcd_file SET hrcdconf = 'N',
                             hrcdmodu = g_user,
                             hrcddate = g_today
         WHERE hrcd10 = l_hrcd.hrcd10
 #130912_2 add by wangxh --str--
        UPDATE hrcp_file SET hrcp35='N',
                             hrcpmodu=g_user,
                             hrcpdate=g_today
          WHERE hrcp02=l_hrcd.hrcd09 AND hrcp03 BETWEEN l_hrcd.hrcd02 AND l_hrcd.hrcd04
#130912_2 add by wangxh --end-- 
        IF SQLCA.sqlcode THEN                                          
           CALL s_errmsg('hrcd10',l_hrcd.hrcd10,'upd hrcd_file','ghr-115',1)
           LET g_success = 'N'
        END IF       
      END IF 
   END FOR
   IF g_success = 'Y' THEN 
       COMMIT WORK
       CALL cl_err('','abm-983',0)
   ELSE 
       ROLLBACK WORK
       CALL s_showmsg()
   END IF 
#   #add by zhuzw 20160907 start#增加时时调用考勤处理逻辑
   FOR i=1 TO g_rec_b 
      IF g_hrcd[i].chk = 'Y' THEN 
      	 INITIALIZE l_hrcd.* TO NULL
         SELECT * INTO l_hrcd.* FROM hrcd_file WHERE hrcd10 = g_hrcd[i].hrcd10
        UPDATE hrcp_file SET hrcp35='N',
                             hrcpmodu=g_user,
                             hrcpdate=g_today
          WHERE hrcp02=l_hrcd.hrcd09 AND hrcp03 BETWEEN l_hrcd.hrcd02 AND l_hrcd.hrcd04
          SELECT hrat01 INTO l_hrat01 FROM hrat_file WHERE hratid = l_hrcd.hrcd09
          SLEEP 1
           LET l_msg="ghrp056 Y ",l_hrcd.hrcd02," ",l_hrcd.hrcd04," 1 ",l_hrat01," "
           CALL cl_cmdrun(l_msg) 
      END IF       
    END FOR                    
#   #add by zhuzw 20160907 end      
   LET l_ww2 = 'hrcd09 = ',l_hrcd.hrcd09
   CALL i044_b_fill(l_ww2) 
END FUNCTION


FUNCTION i044_hrat012hratid(p_hrat01)
   DEFINE p_hrat01  LIKE  hrat_file.hrat01
   DEFINE l_hratid  LIKE  hrat_file.hratid
   
   SELECT hratid INTO l_hratid FROM hrat_file
    WHERE hrat01  = p_hrat01
   IF SQLCA.sqlcode THEN 
      LET l_hratid = NULL
   END IF 
   RETURN l_hratid
END FUNCTION 

FUNCTION i044_p1()
   CALL sghri044_p1()
   CALL i044_b_fill(g_wc2)
   CALL i044_b_fill2()
END FUNCTION

FUNCTION i044_p2()
   CALL sghri044_p2()
   CALL i044_b_fill(g_wc2)
   CALL i044_b_fill2()
END FUNCTION

FUNCTION i044_p3()
   CALL sghri044_p3()
   CALL i044_b_fill(g_wc2)
   CALL i044_b_fill2()
END FUNCTION

FUNCTION i044_p4()
   CALL sghri044_p4()
   CALL i044_b_fill(g_wc2)
   CALL i044_b_fill2()
END FUNCTION
FUNCTION i044_tx_fill()
DEFINE l_sql STRING
DEFINE l_i,l_rec_b   LIKE type_file.num5
DEFINE l_hrci    DYNAMIC ARRAY OF RECORD
                  sure   LIKE type_file.chr1,  
                  hrci01 LIKE hrci_file.hrci01, 
                  hrat01 LIKE hrat_file.hrat01, 
                  hrat02 LIKE hrat_file.hrat02, 
                  hrat04 LIKE hrat_file.hrat04, 
                  hrao02 LIKE hrao_file.hrao02, 
                  hrat05 LIKE hrat_file.hrat05, 
                  hras04 LIKE hras_file.hras04, 
                  hrci03 LIKE hrci_file.hrci03, 
                  hrci04 LIKE hrci_file.hrci04, 
                  hrci05 LIKE hrci_file.hrci05, 
                  hrci06 LIKE hrci_file.hrci06, 
                  hrci07 LIKE hrci_file.hrci07, 
                  hrci08 LIKE hrci_file.hrci08, 
                  hrci09 LIKE hrci_file.hrci09, 
                  hrci10 LIKE hrci_file.hrci10, 
                  hrci11 LIKE hrci_file.hrci11, 
                  hrciconf LIKE hrci_file.hrciconf               
               END RECORD
DEFINE    l_hrcdb02 LIKE hrcdb_file.hrcdb02            
     IF l_ac = 0 OR l_ac1 = 0 THEN 
        RETURN 
     END IF 
     IF g_hrcd[l_ac].hrcd01 !='025' THEN 
        CALL cl_err("非调休假无明细", '!', 1) 
        RETURN 
     END IF 
     OPEN WINDOW i0441_w 
     WITH FORM "ghr/42f/ghri049"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN   
    CALL cl_ui_init()
    CALL cl_set_act_visible("accept,cancel", FALSE)
    CALL cl_set_comp_visible("sure",FALSE)
    SELECT hrcda01 INTO l_hrcdb02 FROM hrcda_file 
     WHERE hrcda02= g_hrcd[l_ac].hrcd10 AND hrcda05 = g_dhrcda[l_ac1].hrcda05 
       AND hrcda06 = g_dhrcda[l_ac1].hrcda06
    LET l_sql = "  SELECT 'N',hrci01,hrat01,hrat02,hrat04,hrao02,hrat05,hras04,hrci03,hrci04,hrci05,hrci06,hrci07,hrci08,hrci09,hrci10,hrci11,hrciconf ",
                "    FROM hrci_file left join hrat_file on hrci02 = hratid   ",
                "         left join hrao_file on hrat04 = hrao02   ",
                "         left join hras_file on hras01 = hrao05   ",
                "   WHERE  hrci01 in (SELECT hrcdb03 FROM hrcdb_file WHERE hrcdb01 = '",g_hrcd[l_ac].hrcd10,"' and hrcdb02  = '",l_hrcdb02,"'  and hrcdb06 = ' ') ", 
                "   ORDER BY hrat01,hrci03" 

    PREPARE i044_1_q FROM l_sql
    DECLARE i044_1_s CURSOR FOR i044_1_q
    LET l_i=1
    FOREACH i044_1_s INTO l_hrci[l_i].*
       LET l_i=l_i+1
       IF l_i > g_max_rec THEN
           CALL cl_err( '', 9035, 0 )                            
           EXIT FOREACH
       END IF       
    END FOREACH                  
    CALL l_hrci.deleteElement(l_i)
    LET l_rec_b = l_i - 1
    DISPLAY l_rec_b TO cn2
    DISPLAY ARRAY l_hrci TO s_hrci.* ATTRIBUTE(COUNT=l_rec_b,UNBUFFERED)
#         ON ACTION xx 
#            LET w = ui.Window.getCurrent()
#            LET f = w.getForm()  
#            LET page = f.FindNode("Page","page1")
#            CALL cl_export_to_excel(page,base.TypeInfo.create(g_hrat),'','')
    END DISPLAY 
    CLOSE WINDOW i0441_w
END FUNCTION
#add by zhuzw 20150922 str
FUNCTION i044_del(p_hrcd10)
DEFINE p_hrcd10 LIKE hrcd_file.hrcd10
DEFINE l_hrcd   RECORD LIKE hrcd_file.*
DEFINE l_hrci   RECORD LIKE hrci_file.*
DEFINE l_hrch17,l_hrch20 LIKE hrch_file.hrch17
DEFINE l_sql STRING
DEFINE l_hrcda09 LIKE hrcda_file.hrcda09 #add by liufang161226
   SELECT * INTO l_hrcd.* FROM hrcd_file
    WHERE hrcd10 = p_hrcd10
    SELECT SUM(hrcda09) INTO l_hrcda09 FROM hrcda_file WHERE hrcda02 = p_hrcd10 #add by liufang161226
    LET l_hrcd.hrcd06 = l_hrcda09    #add by liufang161226 删除的时候，原来l_hrcd06请假时长是每天的时长，这里需要用总时长
   #删除年假回滚
   IF l_hrcd.hrcd11 = '2' THEN 
      # add by wangwy 2015-12-14 start
      IF l_hrcd.hrcd06=11 THEN 
         LET l_hrcd.hrcd06=8
      END IF 
      IF l_hrcd.hrcd06=5.5 THEN 
         LET l_hrcd.hrcd06=4
      END IF 
      # add by wangwy 2015-12-14 end
      LET l_hrcd.hrcd06 = l_hrcd.hrcd06/8
      SELECT hrch17,hrch20 INTO l_hrch17,l_hrch20 FROM hrch_file 
       WHERE hrch03 = l_hrcd.hrcd09
         AND l_hrcd.hrcd02 BETWEEN hrch13 AND hrch14  
      LET l_hrch17 = l_hrch17 +  l_hrcd.hrcd06  
      LET l_hrch20 = l_hrch20 +  l_hrcd.hrcd06  
      SELECT round(l_hrch17,2),round(l_hrch20,2) INTO l_hrch17,l_hrch20 FROM dual 
      UPDATE hrch_file SET hrch17 = l_hrch17,hrch20 = l_hrch20
       WHERE hrch03 = l_hrcd.hrcd09
         AND l_hrcd.hrcd02 BETWEEN hrch13 AND hrch14   
   END IF 
   #删除调休假回滚
   IF l_hrcd.hrcd11 = '3' THEN 
      LET l_sql = " select * from hrci_file where hrci08 >0 and '",l_hrcd.hrcd02,"' between hrciud13 and hrci10 and hrci02 = '",l_hrcd.hrcd09,"' ",
                   " order by hrciud13 desc"
      PREPARE i044_del1 FROM l_sql
      DECLARE i044_del1s CURSOR FOR i044_del1
      FOREACH i044_del1s INTO l_hrci.*
         IF l_hrci.hrci08 >= l_hrcd.hrcd06 THEN 
            UPDATE hrci_file SET hrci08 = l_hrci.hrci08 -  l_hrcd.hrcd06,hrci09 = l_hrci.hrci09 +  l_hrcd.hrcd06  
             WHERE hrci01 = l_hrci.hrci01
               AND hrci02 = l_hrci.hrci02
               AND hrci03 = l_hrci.hrci03
            EXIT FOREACH    
         ELSE 
            UPDATE hrci_file SET hrci08 = 0,hrci09 = l_hrci.hrci09 +  l_hrci.hrci08 
             WHERE hrci01 = l_hrci.hrci01
               AND hrci02 = l_hrci.hrci02
               AND hrci03 = l_hrci.hrci03  
            LET l_hrcd.hrcd06 = l_hrcd.hrcd06 - l_hrci.hrci08         	  
         END IF 
      END FOREACH 
   END IF  
END FUNCTION 
#add by zhuzw 20150922 end 
