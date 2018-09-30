# Prog. Version..: '5.25.02-11.03.23(00010)'     #
#
# Pattern name...: agtr761.4gl 
# Desc/riptions..: 费用成本预算报表 
# Date & Author..: 12/05/31 By Yougs
 
DATABASE ds
 
GLOBALS "../../../tiptop/config/top.global"
 
DEFINE tm  RECORD		  
         uhc06  LIKE uhc_file.uhc06,   
         uab02  LIKE uab_file.uab02, 
         uhc07  LIKE uhc_file.uhc07,   
         uhc05  LIKE uhc_file.uhc05,  
         uhc02  LIKE uhc_file.uhc02, 
         uhc03  LIKE type_file.num5, 
         mm     LIKE type_file.num5   
           END RECORD
DEFINE sr           RECORD    
          num1        LIKE type_file.num5    ,
          uhc01       LIKE uhc_file.uhc01    , 
          uhc12_d     LIKE uhc_file.uhc12    ,
          uhc12f_d    LIKE uhc_file.uhc12f   ,
          uhc12g_d    LIKE uhc_file.uhc12g   ,
          uhc12h_d    LIKE uhc_file.uhc12h   ,
          uhc12ha_d   LIKE uhc_file.uhc12ha  ,
          uhc12hb_d   LIKE uhc_file.uhc12hb  ,
          uhc12a_d    LIKE uhc_file.uhc12a   ,
          uhc12b_d    LIKE uhc_file.uhc12b   ,
          uhc12c_d    LIKE uhc_file.uhc12c   ,
          uhc12ca_d   LIKE uhc_file.uhc12ca  ,
          uhc12cb_d   LIKE uhc_file.uhc12cb  ,
          uhc11       LIKE uhc_file.uhc11    ,
          uhc12       LIKE uhc_file.uhc12    ,
          uhc12f      LIKE uhc_file.uhc12f   ,
          uhc12g      LIKE uhc_file.uhc12g   ,
          uhc12h      LIKE uhc_file.uhc12h   ,
          uhc12ha     LIKE uhc_file.uhc12ha  ,
          uhc12hb     LIKE uhc_file.uhc12hb  ,
          uhc12a      LIKE uhc_file.uhc12a   ,
          uhc12b      LIKE uhc_file.uhc12b   ,
          uhc12c      LIKE uhc_file.uhc12c   ,
          uhc12ca     LIKE uhc_file.uhc12ca  ,
          uhc12cb     LIKE uhc_file.uhc12cb  ,
          uhc21       LIKE uhc_file.uhc21    ,
          uhc22       LIKE uhc_file.uhc22    ,
          uhc22f      LIKE uhc_file.uhc22f   ,
          uhc22g      LIKE uhc_file.uhc22g   ,
          uhc22h      LIKE uhc_file.uhc22h   ,
          uhc22ha     LIKE uhc_file.uhc22ha  ,
          uhc22hb     LIKE uhc_file.uhc22hb  ,
          uhc22a      LIKE uhc_file.uhc22a   ,
          uhc22b      LIKE uhc_file.uhc22b   ,
          uhc22c      LIKE uhc_file.uhc22c   ,
          uhc22ca     LIKE uhc_file.uhc22ca  ,
          uhc22cb     LIKE uhc_file.uhc22cb  ,
          uhc61       LIKE uhc_file.uhc61    ,
          uhc62       LIKE uhc_file.uhc62    ,
          uhc62f      LIKE uhc_file.uhc62f   ,
          uhc62g      LIKE uhc_file.uhc62g   ,
          uhc62h      LIKE uhc_file.uhc62h   ,
          uhc62ha     LIKE uhc_file.uhc62ha  ,
          uhc62hb     LIKE uhc_file.uhc62hb  ,
          uhc62a      LIKE uhc_file.uhc62a   ,
          uhc62b      LIKE uhc_file.uhc62b   ,
          uhc62c      LIKE uhc_file.uhc62c   ,
          uhc62ca     LIKE uhc_file.uhc62ca  ,
          uhc62cb     LIKE uhc_file.uhc62cb  ,
          uhc91       LIKE uhc_file.uhc91    ,
          uhc92       LIKE uhc_file.uhc92    ,
          uhc92f      LIKE uhc_file.uhc92f   ,
          uhc92g      LIKE uhc_file.uhc92g   ,
          uhc92h      LIKE uhc_file.uhc92h   ,
          uhc92ha     LIKE uhc_file.uhc92ha  ,
          uhc92hb     LIKE uhc_file.uhc92hb  ,
          uhc92a      LIKE uhc_file.uhc92a   ,
          uhc92b      LIKE uhc_file.uhc92b   ,
          uhc92c      LIKE uhc_file.uhc92c   ,
          uhc92ca     LIKE uhc_file.uhc92ca  ,
          uhc92cb     LIKE uhc_file.uhc92cb   
                  END RECORD
DEFINE g_sql          STRING
DEFINE g_str          STRING
DEFINE g_wc           STRING
DEFINE l_table        STRING
DEFINE g_uhc05_desc   LIKE uah_file.uah05
DEFINE g_sql_2    STRING
MAIN
   OPTIONS
      INPUT NO WRAP
   DEFER INTERRUPT			    
   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF
   WHENEVER ERROR CALL cl_err_msg_log
 
   IF (NOT cl_setup("AGT")) THEN
      EXIT PROGRAM
   END IF
   CALL cl_used(g_prog,g_time,1) RETURNING g_time 
   LET g_sql = "num1.type_file.num5,",
               "uhc01.uhc_file.uhc01,", 
               "uhc12_d.uhc_file.uhc12,",
               "uhc12f_d.uhc_file.uhc12f,",
               "uhc12g_d.uhc_file.uhc12g,",
               "uhc12h_d.uhc_file.uhc12h,",
               "uhc12ha_d.uhc_file.uhc12ha,",
               "uhc12hb_d.uhc_file.uhc12hb,",
               "uhc12a_d.uhc_file.uhc12a,",
               "uhc12b_d.uhc_file.uhc12b,",
               "uhc12c_d.uhc_file.uhc12c,",
               "uhc12ca_d.uhc_file.uhc12ca,",
               "uhc12cb_d.uhc_file.uhc12cb,",
               "uhc11.uhc_file.uhc11,",
               "uhc12.uhc_file.uhc12,",
               "uhc12f.uhc_file.uhc12f,",
               "uhc12g.uhc_file.uhc12g,",
               "uhc12h.uhc_file.uhc12h,",
               "uhc12ha.uhc_file.uhc12ha,",
               "uhc12hb.uhc_file.uhc12hb,",
               "uhc12a.uhc_file.uhc12a,",
               "uhc12b.uhc_file.uhc12b,",
               "uhc12c.uhc_file.uhc12c,",
               "uhc12ca.uhc_file.uhc12ca,",
               "uhc12cb.uhc_file.uhc12cb,",
               "uhc21.uhc_file.uhc21,",
               "uhc22.uhc_file.uhc22,",
               "uhc22f.uhc_file.uhc22f,",
               "uhc22g.uhc_file.uhc22g,",
               "uhc22h.uhc_file.uhc22h,",
               "uhc22ha.uhc_file.uhc22ha,",
               "uhc22hb.uhc_file.uhc22hb,",
               "uhc22a.uhc_file.uhc22a,",
               "uhc22b.uhc_file.uhc22b,",
               "uhc22c.uhc_file.uhc22c,",
               "uhc22ca.uhc_file.uhc22ca,",
               "uhc22cb.uhc_file.uhc22cb,",
               "uhc61.uhc_file.uhc61,",
               "uhc62.uhc_file.uhc62,",
               "uhc62f.uhc_file.uhc62f,",
               "uhc62g.uhc_file.uhc62g,",
               "uhc62h.uhc_file.uhc62h,",
               "uhc62ha.uhc_file.uhc62ha,",
               "uhc62hb.uhc_file.uhc62hb,",
               "uhc62a.uhc_file.uhc62a,",
               "uhc62b.uhc_file.uhc62b,",
               "uhc62c.uhc_file.uhc62c,",
               "uhc62ca.uhc_file.uhc62ca,",
               "uhc62cb.uhc_file.uhc62cb,",
               "uhc91.uhc_file.uhc91,",
               "uhc92.uhc_file.uhc92,",
               "uhc92f.uhc_file.uhc92f,",
               "uhc92g.uhc_file.uhc92g,",
               "uhc92h.uhc_file.uhc92h,",
               "uhc92ha.uhc_file.uhc92ha,",
               "uhc92hb.uhc_file.uhc92hb,",
               "uhc92a.uhc_file.uhc92a,",
               "uhc92b.uhc_file.uhc92b,",
               "uhc92c.uhc_file.uhc92c,",
               "uhc92ca.uhc_file.uhc92ca,",
               "uhc92cb.uhc_file.uhc92cb"
   LET l_table = cl_prt_temptable('agtr761',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF
   LET g_sql ="INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
                " VALUES(?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ", 
                "        ?)"
     PREPARE insert_prep FROM g_sql
     IF STATUS THEN
        CALL cl_err('insert_prep:',status,1) 
        EXIT PROGRAM
     END IF
   CALL r761_tm(0,0)		       
   CALL cl_used(g_prog,g_time,2) RETURNING g_time 
END MAIN
 
FUNCTION r761_tm(p_row,p_col) 
DEFINE l_n             LIKE type_file.num5
DEFINE l_yy            LIKE type_file.num5
DEFINE l_mm            LIKE type_file.num5
DEFINE l_uab02         LIKE uab_file.uab02
DEFINE l_uah02         LIKE uah_file.uah02
DEFINE l_occ02         LIKE occ_file.occ02
DEFINE lc_qbe_sn       LIKE gbm_file.gbm01   
DEFINE l_uhc05         LIKE uhc_file.uhc05
DEFINE p_row,p_col     LIKE type_file.num5,        
       l_cmd           LIKE type_file.chr1000    
   LET p_row = 4 LET p_col = 17
   OPEN WINDOW r761_w AT p_row,p_col WITH FORM "agt/42f/agtr761"
     ATTRIBUTE (STYLE = g_win_style CLIPPED)  
   CALL cl_ui_init()
   CALL cl_opmsg('r')
   #画面栏位的初始化
   INITIALIZE tm.* TO NULL		 
   LET g_pdate = g_today
   LET g_rlang = g_lang
   LET g_bgjob = 'N'
   LET g_copies = '1'   
   
   WHILE TRUE
   	  CONSTRUCT g_wc ON uhc05,uhc01 FROM uhc05,uhc01
         BEFORE CONSTRUCT
            CALL cl_qbe_init()
              
         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE CONSTRUCT
         ON ACTION CONTROLG
            CALL cl_cmdask()	
         ON ACTION CONTROLP
            CASE
               WHEN INFIELD(uhc05)
                  CALL cl_init_qry_var()
                  LET g_qryparam.form = "q_uah01"
                  LET g_qryparam.state ="c"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO uhc05
                  NEXT FIELD uhc05
               WHEN INFIELD(uhc01)
                  CALL cl_init_qry_var()
                  LET g_qryparam.form = "q_uda"
                  LET g_qryparam.state ="c"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO uhc01
                  NEXT FIELD uhc01
                    
               OTHERWISE EXIT CASE
            END CASE
         ON ACTION exit
            LET INT_FLAG = 1
            EXIT CONSTRUCT
         ON ACTION qbe_save
            CALL cl_qbe_save()
      END CONSTRUCT
      IF INT_FLAG THEN
         LET INT_FLAG = 0 CLOSE WINDOW r761_w 
         CALL cl_used(g_prog,g_time,2) RETURNING g_time 
         EXIT PROGRAM
      END IF
      
      SELECT uah01 INTO l_uhc05 FROM uah_file WHERE uah07 = 'Y' AND rownum = 1
      INPUT tm.uhc06,tm.uhc07,tm.uhc02,tm.uhc03 WITHOUT DEFAULTS 
           FROM uhc06,uhc07,uhc02,uhc03  
         BEFORE INPUT
            CALL cl_qbe_display_condition(lc_qbe_sn)  
            SELECT YEAR(g_today) INTO tm.uhc02 FROM DUAL
            LET tm.uhc03 = 1
            SELECT uab01 INTO tm.uhc06 FROM uab_file WHERE uab03 = 'Y' AND uabacti = 'Y' AND uab01 IN(SELECT uac01 FROM uac_file WHERE uac07 = 'N' ) AND rownum = 1
            DISPLAY BY NAME tm.uhc06,tm.uhc07,tm.uhc02,tm.uhc03 
         AFTER FIELD uhc06 
            IF NOT cl_null(tm.uhc06) THEN
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM uab_file WHERE uab01 = tm.uhc06 AND uab03 = 'Y' AND uabacti = 'Y'
               IF cl_null(l_n) THEN LET l_n = 0 END IF
               IF l_n = 0 THEN
                  CALL cl_err('录入的预算编号不存在,请检查相关的基础档!','!',0)
                  NEXT FIELD uhc06
               END IF
               SELECT uac02 INTO tm.uhc07 FROM uac_file WHERE uac01 = tm.uhc06 AND uac07 = 'N'
               DISPLAY tm.uhc07 TO uhc07
               SELECT uab02 INTO l_uab02 FROM uab_file WHERE uab01 = tm.uhc06 AND uab03 = 'Y' AND uabacti = 'Y'
               DISPLAY l_uab02 TO uab02
            END IF
            IF NOT cl_null(tm.uhc06) AND NOT cl_null(l_uhc05) AND NOT cl_null(tm.uhc02) AND NOT cl_null(tm.uhc03) THEN
               CALL s_get_year_month(tm.uhc06,l_uhc05,tm.uhc02,tm.uhc03) RETURNING l_yy,tm.mm
               DISPLAY tm.mm TO mm
               DISPLAY l_yy TO yy
            END IF 
         #AFTER FIELD uhc07 
         #   IF NOT cl_null(tm.uhc07) THEN
         #      LET l_n = 0
         #      SELECT COUNT(*) INTO l_n FROM uac_file WHERE uac02 = tm.uhc07 AND uac07 = 'N' 
         #      IF cl_null(l_n) THEN LET l_n = 0 END IF
         #      IF l_n = 0 THEN
         #         CALL cl_err('录入的预算版本不存在,请检查相关的基础档!','!',0)
         #         NEXT FIELD uhc07
         #      END IF
         #   END IF 
         AFTER FIELD uhc02 
            IF NOT cl_null(tm.uhc02) THEN
               IF tm.uhc02 <=0 OR LENGTH(tm.uhc02) != 4 THEN
                  CALL cl_err('预算年度不能笑于0并且不能大于4位','!',0)
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(tm.uhc06) AND NOT cl_null(l_uhc05) AND NOT cl_null(tm.uhc02) AND NOT cl_null(tm.uhc03) THEN
               CALL s_get_year_month(tm.uhc06,l_uhc05,tm.uhc02,tm.uhc03)   RETURNING l_yy,tm.mm
               DISPLAY tm.mm TO mm
               DISPLAY l_yy TO yy
            END IF 
         AFTER FIELD uhc03    
            IF NOT cl_null(tm.uhc03) THEN
               IF g_aza.aza02 = '1' THEN
                  IF tm.uhc03<1 OR tm.uhc03>12 THEN
                     CALL cl_err('','atm-503',0)
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  IF tm.uhc03<1 OR tm.uhc03>13 THEN
                     CALL cl_err('','agl-013',0)
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF 
            IF NOT cl_null(tm.uhc06) AND NOT cl_null(l_uhc05) AND NOT cl_null(tm.uhc02) AND NOT cl_null(tm.uhc03) THEN
               CALL s_get_year_month(tm.uhc06,l_uhc05,tm.uhc02,tm.uhc03)   RETURNING l_yy,tm.mm
               DISPLAY tm.mm TO mm
               DISPLAY l_yy TO yy
            END IF
         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE INPUT
         ON ACTION CONTROLG
            CALL cl_cmdask()	
         ON ACTION CONTROLP
            CASE
               WHEN INFIELD(uhc06)
                  CALL cl_init_qry_var()
                  LET g_qryparam.form = "q_uab01"
                  LET g_qryparam.default1 = tm.uhc06
                  CALL cl_create_qry() RETURNING tm.uhc06
                  DISPLAY tm.uhc06 TO uhc06
                  NEXT FIELD uhc06  
               OTHERWISE EXIT CASE
            END CASE
         ON ACTION exit
            LET INT_FLAG = 1
            EXIT INPUT
         ON ACTION qbe_save
            CALL cl_qbe_save()
      END INPUT
      IF INT_FLAG THEN
         LET INT_FLAG = 0 CLOSE WINDOW r761_w 
         CALL cl_used(g_prog,g_time,2) RETURNING g_time 
         EXIT PROGRAM
      END IF   
      CALL cl_wait()
      CALL agtr761()
      ERROR ""
   END WHILE
   CLOSE WINDOW r761_w
END FUNCTION
 
FUNCTION agtr761()
DEFINE l_name	LIKE type_file.chr20, 		       
       l_sql 	STRING,		 
       l_za05	LIKE type_file.chr1000 
DEFINE l_uhc03     LIKE uhc_file.uhc03  
DEFINE l_uab04      LIKE uab_file.uab04  
DEFINE l_ual05      LIKE ual_file.ual05
DEFINE l_tm_uhc03   LIKE uhc_file.uhc03

   CALL cl_del_data(l_table)
   INITIALIZE sr.* TO NULL  
   SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01='agtr761'
   SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang    
   #汇总出销售预算中出现的所有机种     
   LET l_sql = "SELECT 1,uhc01,0,0,0,0,0,0,0,0,0,0,0,sum(uhc11),sum(uhc12),sum(uhc12f+uhc12i+uhc12j),sum(uhc12g),sum(uhc12h),sum(uhc12ha),sum(uhc12hb),sum(uhc12a+uhc12d+uhc12e),sum(uhc12b),sum(uhc12c),sum(uhc12ca),sum(uhc12cb),sum(uhc21),sum(uhc22),sum(uhc22f+uhc22i+uhc22j),sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),sum(uhc22a+uhc22d+uhc22e),sum(uhc22b),sum(uhc22c),sum(uhc22ca),sum(uhc22cb),sum(uhc61+uhc71),sum(uhc62+uhc72),sum(uhc62f+uhc62i+uhc62j+uhc72f+uhc72i+uhc72j),sum(uhc62g+uhc72g),sum(uhc62h+uhc72h),sum(uhc62ha+uhc72ha),sum(uhc62hb+uhc72hb),sum(uhc62a+uhc62d+uhc62e+uhc72a+uhc72d+uhc72e),sum(uhc62b+uhc72b),sum(uhc62c+uhc72c),sum(uhc62ca+uhc72ca),sum(uhc62cb+uhc72cb),sum(uhc91),sum(uhc92),sum(uhc92f+uhc92i+uhc92j),sum(uhc92g),sum(uhc92h),sum(uhc92ha),sum(uhc92hb),sum(uhc92a+uhc92d+uhc92e),sum(uhc92b),sum(uhc92c),sum(uhc92ca),sum(uhc92cb)",
               "  FROM uhc_file ",
               " WHERE uhc06 = '",tm.uhc06,"'",
               "   AND uhc07 = '",tm.uhc07,"'",   
               "   AND uhc02 = ",tm.uhc02,          
               "   AND uhc03 = ",tm.uhc03,
               "   AND uhc10 = 'M' ",  
               "   AND ",g_wc CLIPPED,
               " GROUP BY uhc01",
               " ORDER BY uhc01"
   PREPARE r761_prepare1 FROM l_sql 
   DECLARE r761_cs1 CURSOR FOR r761_prepare1 
   FOREACH r761_cs1 INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF  
      CALL r761_sum()
      EXECUTE insert_prep USING sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('EXECUTE:',SQLCA.sqlcode,1) 
         EXIT FOREACH
      END IF          
      INITIALIZE sr.* TO NULL 
   END FOREACH      
   LET l_sql = "SELECT 2,udb03,0,0,0,0,0,0,0,0,0,0,0,sum(uhc11),sum(uhc12),sum(uhc12f+uhc12i+uhc12j),sum(uhc12g),sum(uhc12h),sum(uhc12ha),sum(uhc12hb),sum(uhc12a+uhc12d+uhc12e),sum(uhc12b),sum(uhc12c),sum(uhc12ca),sum(uhc12cb),sum(uhc21),sum(uhc22),sum(uhc22f+uhc22i+uhc22j),sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),sum(uhc22a+uhc22d+uhc22e),sum(uhc22b),sum(uhc22c),sum(uhc22ca),sum(uhc22cb),sum(uhc61+uhc71),sum(uhc62+uhc72),sum(uhc62f+uhc62i+uhc62j+uhc72f+uhc72i+uhc72j),sum(uhc62g+uhc72g),sum(uhc62h+uhc72h),sum(uhc62ha+uhc72ha),sum(uhc62hb+uhc72hb),sum(uhc62a+uhc62d+uhc62e+uhc72a+uhc72d+uhc72e),sum(uhc62b+uhc72b),sum(uhc62c+uhc72c),sum(uhc62ca+uhc72ca),sum(uhc62cb+uhc72cb),sum(uhc91),sum(uhc92),sum(uhc92f+uhc92i+uhc92j),sum(uhc92g),sum(uhc92h),sum(uhc92ha),sum(uhc92hb),sum(uhc92a+uhc92d+uhc92e),sum(uhc92b),sum(uhc92c),sum(uhc92ca),sum(uhc92cb)",
               "  FROM uhc_file,udb_file ",
               " WHERE uhc06 = '",tm.uhc06,"'",
               "   AND uhc07 = '",tm.uhc07,"'",   
               "   AND uhc02 = ",tm.uhc02,          
               "   AND uhc03 = ",tm.uhc03,
               "   AND uhc10 = 'M' ",  
               "   AND uhc00 = udb01 ",
               "   AND ",g_wc CLIPPED,
               " GROUP BY udb03",
               " ORDER BY udb03"
   PREPARE r761_prepare11 FROM l_sql 
   DECLARE r761_cs11 CURSOR FOR r761_prepare11 
   FOREACH r761_cs11 INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF  
      CALL r761_sum()
      SELECT udc02 INTO sr.uhc01 FROM udc_file WHERE udc01 = sr.uhc01 AND udcacti ='Y'
      EXECUTE insert_prep USING sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('EXECUTE:',SQLCA.sqlcode,1) 
         EXIT FOREACH
      END IF          
      INITIALIZE sr.* TO NULL 
   END FOREACH     
   LET g_sql = "SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED
   LET g_str = ''  
   LET g_str = g_str,';',tm.mm
   CALL cl_prt_cs3('agtr761','agtr761',g_sql,g_str)
END FUNCTION 

#对金额和数量栏位合计
FUNCTION r761_sum()
DEFINE l_uhc11 LIKE uhc_file.uhc11
   LET l_uhc11 = sr.uhc11 + sr.uhc21 
   LET sr.uhc12f_d  = (sr.uhc12f + sr.uhc22f)/l_uhc11
   LET sr.uhc12g_d  = (sr.uhc12g + sr.uhc22g)/l_uhc11
   LET sr.uhc12h_d  = (sr.uhc12h + sr.uhc22h)/l_uhc11
   LET sr.uhc12ha_d = (sr.uhc12ha + sr.uhc22ha)/l_uhc11
   LET sr.uhc12hb_d = (sr.uhc12hb + sr.uhc22hb)/l_uhc11
   LET sr.uhc12a_d  = (sr.uhc12a + sr.uhc22a)/l_uhc11
   LET sr.uhc12b_d  = (sr.uhc12b + sr.uhc22b)/l_uhc11
   LET sr.uhc12c_d  = (sr.uhc12c + sr.uhc22c)/l_uhc11
   LET sr.uhc12ca_d = (sr.uhc12ca + sr.uhc22ca)/l_uhc11
   LET sr.uhc12cb_d = (sr.uhc12cb + sr.uhc22cb)/l_uhc11
   LET sr.uhc12_d = sr.uhc12f_d + sr.uhc12g_d + sr.uhc12h_d + sr.uhc12a_d + sr.uhc12b_d + sr.uhc12c_d
END FUNCTION
 
