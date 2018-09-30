# Prog. Version..: '5.30.18-18.04.16(00001)'     #
#
# Pattern name...: aoop151.4gl
# Descriptions...: 供应商/客户税种批量修改
# Date & Author..: 180412 By shijl
# Modify.........: No:FUN-I40012 18/04/16 By yihsuan 功能回追

DATABASE ds
 
GLOBALS "../../config/top.global"
 
DEFINE g_hsc		       RECORD LIKE hsc_file.*
DEFINE g_hsc01                 LIKE hsc_file.hsc01  
DEFINE g_hsc01_1               LIKE hsc_file.hsc01  
DEFINE g_cond                  LIKE type_file.chr1
DEFINE g_wc,g_wc2,g_sql,g_str  STRING   
DEFINE g_argv1		       LIKE hsc_file.hsc01 
DEFINE g_argv2		       LIKE hsc_file.hsc01 
DEFINE g_argv3                 LIKE type_file.chr1
DEFINE g_forupd_sql            STRING                  #SELECT ... FOR UPDATE SQL 
DEFINE g_cnt                   LIKE type_file.num10    
 
MAIN
   OPTIONS                                #改變一些系統預設值
        INPUT NO WRAP,
        FIELD ORDER FORM
    DEFER INTERRUPT                       #擷取中斷鍵, 由程式處理
 
   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF
  
   WHENEVER ERROR CALL cl_err_msg_log
  
   IF (NOT cl_setup("AOO")) THEN
      EXIT PROGRAM
   END IF
 
    LET g_argv1    =ARG_VAL(1)
    LET g_argv2    =ARG_VAL(2) 
    LET g_argv3    =ARG_VAL(3) 
    LET g_hsc01    = g_argv1
    LET g_hsc01_1  = g_argv2
    LET g_cond     = g_argv3
 
    CALL  cl_used(g_prog,g_time,1) RETURNING g_time
 
    OPEN WINDOW p151_w WITH FORM "aoo/42f/aoop151" 
       ATTRIBUTE (STYLE = g_win_style CLIPPED)
    
    CALL cl_ui_init()
 
    CALL p151_p1()
    
    CLOSE WINDOW p151_w
    
    CALL  cl_used(g_prog,g_time,2) RETURNING g_time 
END MAIN
 
FUNCTION p151_p1()
   DEFINE l_cnt   LIKE type_file.num5      
   DEFINE l_flag  LIKE type_file.num5  
   DEFINE l_gec02 LIKE gec_file.gec02
   DEFINE l_gec04 LIKE gec_file.gec04
   DEFINE l_success LIKE type_file.chr1
   
   LET g_cond  ='3'
   
   WHILE TRUE
     LET g_action_choice = ''
     CALL cl_opmsg('z')     
     
      
     INPUT g_hsc01,g_hsc01_1,g_cond WITHOUT DEFAULTS FROM hsc01,hsc01_1,cond               
       
       AFTER FIELD hsc01_1 # 销项  客户
          IF NOT cl_null(g_hsc01_1)  THEN
             CALL p151_get_hsc(g_hsc01_1,'2') RETURNING l_success
             IF l_success='N' THEN
                CALL cl_err3("sel","aooi151",g_hsc01_1,'',STATUS,"","sel hsc:",0)
                NEXT FIELD hsc01_1
             END IF
             
             CALL p151_get_gec(g_hsc.hsc01,g_hsc.hsc011) RETURNING l_success,l_gec02,l_gec04  
             IF l_success='N' THEN
                CALL cl_err3("sel","aooi150",g_hsc.hsc01,"",STATUS,"","sel hsc:",0)
                NEXT FIELD hsc01_1
             END IF               
             LET g_str = g_hsc.hsc01,' ',l_gec02,' ',l_gec04
             DISPLAY g_str TO old_tax1 
             
             CALL p151_get_gec(g_hsc.hsc02,g_hsc.hsc021) RETURNING l_success,l_gec02,l_gec04  
             IF l_success='N' THEN
                CALL cl_err3("sel","aooi150",g_hsc.hsc02,"",STATUS,"","sel hsc:",0)
                NEXT FIELD hsc01_1
             END IF                
             LET g_str = g_hsc.hsc02,' ',l_gec02,' ',l_gec04
             DISPLAY g_str TO new_tax1 
          END IF 
                                      
       AFTER FIELD hsc01 # 进项 供应商
          IF NOT cl_null(g_hsc01)  THEN
             CALL p151_get_hsc(g_hsc01,'1') RETURNING l_success
             IF l_success='N' THEN
                CALL cl_err3("sel","aooi151",g_hsc01,'',STATUS,"","sel hsc:",0)
                NEXT FIELD hsc01
             END IF
             
             CALL p151_get_gec(g_hsc.hsc01,g_hsc.hsc011) RETURNING l_success,l_gec02,l_gec04  
             IF l_success='N' THEN
                CALL cl_err3("sel","aooi150",g_hsc.hsc01,"",STATUS,"","sel hsc:",0)
                NEXT FIELD hsc01
             END IF               
             LET g_str = g_hsc.hsc01,' ',l_gec02,' ',l_gec04
             DISPLAY g_str TO old_tax
             
             CALL p151_get_gec(g_hsc.hsc02,g_hsc.hsc021) RETURNING l_success,l_gec02,l_gec04  
             IF l_success='N' THEN
                CALL cl_err3("sel","aooi150",g_hsc.hsc02,"",STATUS,"","sel hsc:",0)
                NEXT FIELD hsc01
             END IF                
             LET g_str = g_hsc.hsc02,' ',l_gec02,' ',l_gec04
             DISPLAY g_str TO new_tax
          END IF 
                
       ON CHANGE cond
             CASE g_cond
                WHEN '1' #客户
                   CALL cl_set_comp_entry("hsc01",FALSE) 
                   CALL cl_set_comp_entry("hsc01_1",TRUE)
                   LET g_hsc01 =''
                   DISPLAY g_hsc01 TO hsc01
                   DISPLAY '' TO old_tax
                   DISPLAY '' TO new_tax
                    
               WHEN '2'   #供应商    
                   CALL cl_set_comp_entry("hsc01",TRUE) 
                   CALL cl_set_comp_entry("hsc01_1",FALSE)
                   LET g_hsc01_1 =''
                   DISPLAY g_hsc01_1 TO hsc01_1
                   DISPLAY '' TO old_tax1
                   DISPLAY '' TO new_tax1
                                  
               OTHERWISE 
                   CALL cl_set_comp_entry("hsc01,hsc01_1",TRUE) 
             END CASE       

       ON ACTION CONTROLP
           CASE
             WHEN INFIELD(hsc01)
               CALL cl_init_qry_var()
               LET g_qryparam.form ="q_hsc02"
               LET g_qryparam.default1 = g_hsc01
               LET g_qryparam.where = " hsc011='1' "
               CALL cl_create_qry() RETURNING g_hsc01
               DISPLAY BY NAME g_hsc01
               NEXT FIELD hsc01
             WHEN INFIELD(hsc01_1)
               CALL cl_init_qry_var()
               LET g_qryparam.form ="q_hsc02"
               LET g_qryparam.default1 = g_hsc01_1
               LET g_qryparam.where = " hsc011='2' "
               CALL cl_create_qry() RETURNING g_hsc01_1
               DISPLAY BY NAME g_hsc01_1
               NEXT FIELD hsc01_1               
           END CASE

   
       ON ACTION CONTROLR
          CALL cl_show_req_fields()
       ON ACTION CONTROLG
          CALL cl_cmdask()
       ON ACTION locale
          LET g_action_choice='locale'
           CALL cl_show_fld_cont() 
          EXIT INPUT
       ON ACTION exit
          LET INT_FLAG = 1
          EXIT INPUT
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE INPUT
  
       ON ACTION about         
          CALL cl_about()      
  
       ON ACTION help          
          CALL cl_show_help()  

  
        BEFORE INPUT
            CALL cl_qbe_init()            
            DISPLAY  g_cond TO cond
            
        ON ACTION qbe_select
           CALL cl_qbe_select()

        ON ACTION qbe_save
           CALL cl_qbe_save()
 
   END INPUT
   
   IF g_action_choice = 'locale' THEN
      CALL cl_dynamic_locale()
      CONTINUE WHILE
   END IF
   IF INT_FLAG THEN LET INT_FLAG=0 RETURN END IF
   IF cl_sure(0,0) THEN 
 
      LET g_success = 'Y'
      BEGIN WORK
       
      IF NOT cl_null(g_hsc01) THEN #进项 供应商
             SELECT * INTO g_hsc.* FROM hsc_file WHERE hsc01=g_hsc01 AND hsc011='1'
             IF STATUS THEN
                CALL cl_err3("sel","aooi151",g_hsc01_1,"",STATUS,"","sel hsc:",0) 
                LET g_success  = 'N'  
             ELSE	
              	UPDATE pmc_file SET pmc47 = g_hsc.hsc02 
       	          WHERE pmc47 = g_hsc.hsc01 
                 IF SQLCA.sqlcode THEN
                    CALL cl_err3("upd","pmc_file",g_hsc.hsc01,"",SQLCA.sqlcode,"","",1)
                    LET g_success = 'N'
                 END IF       	          
             END IF 
      END IF      	  
      IF NOT cl_null(g_hsc01_1) THEN #销项 客户
             SELECT * INTO g_hsc.* FROM hsc_file WHERE hsc01=g_hsc01_1 AND hsc011='2'
             IF STATUS THEN
                CALL cl_err3("sel","aooi151",g_hsc01,"",STATUS,"","sel hsc:",0) 
                LET g_success  = 'N' 
             ELSE 
          	 UPDATE occ_file SET occ41 = g_hsc.hsc02 
          	        WHERE occ41 = g_hsc.hsc01              	
                 IF SQLCA.sqlcode THEN
                    CALL cl_err3("upd","occ_file",g_hsc.hsc01,"",SQLCA.sqlcode,"","",1)
                    LET g_success = 'N'
                 END IF           	         
             END IF       
      END IF
      

      CALL s_showmsg()            
      IF g_success = 'Y' THEN
         COMMIT WORK
         
      ELSE
         ROLLBACK WORK
         
      END IF
      
   END IF 
   
 END WHILE
END FUNCTION

FUNCTION p151_get_hsc(p_gec01,p_gec011)
DEFINE p_gec01  LIKE gec_file.gec01
DEFINE p_gec011 LIKE gec_file.gec011
DEFINE l_success LIKE type_file.chr1
     
     LET l_success = 'Y'
     
     SELECT * INTO g_hsc.* FROM hsc_file WHERE hsc01=p_gec01 AND hsc011=p_gec011
     IF STATUS THEN
        LET l_success = 'N'
     END IF 
    
     RETURN l_success
END FUNCTION  

FUNCTION p151_get_gec(p_gec01,p_gec011)
DEFINE p_gec01  LIKE gec_file.gec01
DEFINE p_gec011 LIKE gec_file.gec011
DEFINE l_success LIKE type_file.chr1
DEFINE l_gec02 LIKE gec_file.gec02
DEFINE l_gec04 LIKE gec_file.gec04
        
     LET l_success = 'Y'
     
     SELECT gec02,gec04 INTO l_gec02,l_gec04
         FROM gec_file WHERE gec01 = p_gec01 AND gec011=p_gec011
     IF STATUS THEN             
        LET l_success = 'N'
     END IF  
     
     RETURN l_success,l_gec02,l_gec04     
END FUNCTION

#FUN-I40012 add 
