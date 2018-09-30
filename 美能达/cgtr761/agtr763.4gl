# Prog. Version..: '5.25.02-11.03.23(00010)'     #
# Pattern name...: agtr763.4gl 
# Desc/riptions..: 销售成本比对报表 
# Date & Author..: 13/06/25 By Exia
 
DATABASE ds
 
GLOBALS "../../../tiptop/config/top.global"
 
DEFINE tm  RECORD    
         uhc06_f  LIKE uhc_file.uhc06,   
         uhc07_f  LIKE uhc_file.uhc07,   
         uhc06_t  LIKE uhc_file.uhc06,
         uhc07_t  LIKE uhc_file.uhc07,
         uhc02    LIKE uhc_file.uhc02, 
         uhc03    LIKE type_file.num5, 
         mm       LIKE type_file.num5,
         wc       STRING
           END RECORD
DEFINE sr           RECORD    
          typenum     LIKE type_file.num5, 
          typeflg     LIKE type_file.chr100, 
          num1        LIKE type_file.num5    ,
          uhc01       LIKE uhc_file.uhc01    , 
          uhc06       LIKE uhc_file.uhc06,
          uhc07       LIKE uhc_file.uhc07,
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
DEFINE l_table        STRING
DEFINE l_table2       STRING
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

   LET g_sql = "typenum.type_file.num5,",
               "typeflg.type_file.chr100,",
               "num1.type_file.num5,",
               "uhc01.uhc_file.uhc01,", 
               "uhc06.uhc_file.uhc06,", 
               "uhc07.uhc_file.uhc07,", 
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
   LET l_table = cl_prt_temptable('agtr763',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF

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
   LET l_table2 = cl_prt_temptable('agtr7631',g_sql) CLIPPED
   IF l_table2 = -1 THEN EXIT PROGRAM END IF

   LET g_sql ="INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
                " VALUES(?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ",
                "        ?,?,?,?,?, ?,?,?,?,?, ", 
                "        ?,?,?,?,? )"
   PREPARE insert_prep FROM g_sql
   IF STATUS THEN
      CALL cl_err('insert_prep:',status,1) 
      EXIT PROGRAM
   END IF
   
   CALL r763_tm()         
   CALL cl_used(g_prog,g_time,2) RETURNING g_time 
END MAIN
 
FUNCTION r763_tm() 
DEFINE l_n             LIKE type_file.num5
DEFINE l_yy            LIKE type_file.num5
DEFINE l_mm            LIKE type_file.num5
DEFINE l_uab02         LIKE uab_file.uab02
DEFINE l_uhc05         LIKE uhc_file.uhc05

   OPEN WINDOW r763_w AT 0,0 WITH FORM "agt/42f/agtr763"
     ATTRIBUTE (STYLE = g_win_style CLIPPED)  

   CALL cl_ui_init()

   INITIALIZE tm.* TO NULL   
   
   WHILE TRUE
      CONSTRUCT tm.wc ON uhc05,uhc01 FROM uhc05,uhc01
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
         LET INT_FLAG = 0 CLOSE WINDOW r763_w 
         CALL cl_used(g_prog,g_time,2) RETURNING g_time 
         EXIT PROGRAM
      END IF
      
      SELECT uah01 INTO l_uhc05 FROM uah_file WHERE uah07 = 'Y' AND rownum = 1
      INPUT BY NAME tm.uhc06_f,tm.uhc07_f,tm.uhc06_t,tm.uhc07_t,tm.uhc02,tm.uhc03 WITHOUT DEFAULTS 

         AFTER FIELD uhc06_f 
            IF NOT cl_null(tm.uhc06_f) THEN
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM uab_file WHERE uab01 = tm.uhc06_f 
               IF cl_null(l_n) THEN LET l_n = 0 END IF
               IF l_n = 0 THEN
                  CALL cl_err('录入的预算编号不存在,请检查相关的基础档!','!',0)
                  NEXT FIELD uhc06_f
               END IF
               SELECT uac02 INTO tm.uhc07_f FROM uac_file WHERE uac01 = tm.uhc06_f AND uac07 = 'N'
               DISPLAY BY NAME tm.uhc07_f
               SELECT uab02 INTO l_uab02 FROM uab_file WHERE uab01 = tm.uhc06_f 
               DISPLAY l_uab02 TO uab02_f
            END IF
            IF NOT cl_null(tm.uhc06_f) AND NOT cl_null(l_uhc05) AND NOT cl_null(tm.uhc02) AND NOT cl_null(tm.uhc03) THEN
               CALL s_get_year_month(tm.uhc06_f,l_uhc05,tm.uhc02,tm.uhc03) RETURNING l_yy,l_mm
               DISPLAY l_yy,l_mm TO yy,mm
               LET tm.mm = l_mm
            END IF 

         AFTER FIELD uhc06_t
            IF NOT cl_null(tm.uhc06_t) THEN
               LET l_n = 0
               SELECT COUNT(*) INTO l_n FROM uab_file WHERE uab01 = tm.uhc06_t
               IF cl_null(l_n) THEN LET l_n = 0 END IF
               IF l_n = 0 THEN
                  CALL cl_err('录入的预算编号不存在,请检查相关的基础档!','!',0)
                  NEXT FIELD uhc06_t
               END IF
               SELECT uac02 INTO tm.uhc07_t FROM uac_file WHERE uac01 = tm.uhc06_t AND uac07 = 'N'
               DISPLAY BY NAME tm.uhc07_t
               SELECT uab02 INTO l_uab02 FROM uab_file WHERE uab01 = tm.uhc06_t
               DISPLAY l_uab02 TO uab02_t
            END IF
            IF NOT cl_null(tm.uhc06_f) AND NOT cl_null(l_uhc05) AND NOT cl_null(tm.uhc02) AND NOT cl_null(tm.uhc03) THEN
               CALL s_get_year_month(tm.uhc06_f,l_uhc05,tm.uhc02,tm.uhc03) RETURNING l_yy,l_mm
               DISPLAY l_yy,l_mm TO yy,mm
               LET tm.mm = l_mm
            END IF

         AFTER FIELD uhc02 
            IF NOT cl_null(tm.uhc02) THEN
               IF tm.uhc02 <=0 OR LENGTH(tm.uhc02) != 4 THEN
                  CALL cl_err('预算年度不能笑于0并且不能大于4位','!',0)
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(tm.uhc06_f) AND NOT cl_null(l_uhc05) AND NOT cl_null(tm.uhc02) AND NOT cl_null(tm.uhc03) THEN
               CALL s_get_year_month(tm.uhc06_f,l_uhc05,tm.uhc02,tm.uhc03)   RETURNING l_yy,l_mm
               DISPLAY l_yy,l_mm TO yy,mm
               LET tm.mm = l_mm
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
            IF NOT cl_null(tm.uhc06_f) AND NOT cl_null(l_uhc05) AND NOT cl_null(tm.uhc02) AND NOT cl_null(tm.uhc03) THEN
               CALL s_get_year_month(tm.uhc06_f,l_uhc05,tm.uhc02,tm.uhc03)   RETURNING l_yy,l_mm
               DISPLAY l_yy,l_mm TO yy,mm
               LET tm.mm = l_mm
            END IF
         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE INPUT
         ON ACTION CONTROLG
            CALL cl_cmdask() 
         ON ACTION CONTROLP
            CASE
               WHEN INFIELD(uhc06_f)
                  CALL cl_init_qry_var()
                  LET g_qryparam.form = "q_uab01"
                  LET g_qryparam.default1 = tm.uhc06_f
                  CALL cl_create_qry() RETURNING tm.uhc06_f
                  DISPLAY BY NAME tm.uhc06_f 
                  NEXT FIELD uhc06_f
               WHEN INFIELD(uhc06_t)
                  CALL cl_init_qry_var()
                  LET g_qryparam.form = "q_uab01"
                  LET g_qryparam.default1 = tm.uhc06_t
                  CALL cl_create_qry() RETURNING tm.uhc06_t
                  DISPLAY BY NAME tm.uhc06_t
                  NEXT FIELD uhc06_t  
               OTHERWISE EXIT CASE
            END CASE
         ON ACTION exit
            LET INT_FLAG = 1
            EXIT INPUT
         ON ACTION qbe_save
            CALL cl_qbe_save()
      END INPUT
      IF INT_FLAG THEN
         LET INT_FLAG = 0 CLOSE WINDOW r763_w 
         CALL cl_used(g_prog,g_time,2) RETURNING g_time 
         EXIT PROGRAM
      END IF   
      CALL cl_wait()
      CALL agtr763()
      ERROR ""
   END WHILE
   CLOSE WINDOW r763_w
END FUNCTION
 
FUNCTION agtr763()
DEFINE l_sql      STRING
DEFINE l_uab02    LIKE uab_file.uab02
  
   CALL cl_del_data(l_table)
   CALL cl_del_data(l_table2)

   INITIALIZE sr.* TO NULL  

   SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01='agtr763'
   SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang    

   #预算版本一的资料     
   LET l_sql = "SELECT 1,'',1,uhc01,uhc06,uhc07,0,0,0,0,0,0,0,0,0,0,0,sum(uhc11),sum(uhc12),sum(uhc12f+uhc12i+uhc12j),",
               "       sum(uhc12g),sum(uhc12h),sum(uhc12ha),sum(uhc12hb),sum(uhc12a+uhc12d+uhc12e),sum(uhc12b),",
               "       sum(uhc12c),sum(uhc12ca),sum(uhc12cb),sum(uhc21),sum(uhc22),sum(uhc22f+uhc22i+uhc22j),",
               "       sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),sum(uhc22a+uhc22d+uhc22e),sum(uhc22b),",
               "       sum(uhc22c),sum(uhc22ca),sum(uhc22cb),sum(uhc61+uhc71),sum(uhc62+uhc72),sum(uhc62f+uhc62i+uhc62j+uhc72f+uhc72i+uhc72j),",
               "       sum(uhc62g+uhc72g),sum(uhc62h+uhc72h),sum(uhc62ha+uhc72ha),sum(uhc62hb+uhc72hb),sum(uhc62a+uhc62d+uhc62e+uhc72a+uhc72d+uhc72e),",
               "       sum(uhc62b+uhc72b),sum(uhc62c+uhc72c),sum(uhc62ca+uhc72ca),sum(uhc62cb+uhc72cb),sum(uhc91),sum(uhc92),sum(uhc92f+uhc92i+uhc92j),",
               "       sum(uhc92g),sum(uhc92h),sum(uhc92ha),sum(uhc92hb),sum(uhc92a+uhc92d+uhc92e),sum(uhc92b),sum(uhc92c),sum(uhc92ca),sum(uhc92cb)",
               "  FROM uhc_file ",
               " WHERE uhc06 = '",tm.uhc06_f,"' AND uhc07 = '",tm.uhc07_f,"' AND uhc02 = ",tm.uhc02,
               "   AND uhc03 = ",tm.uhc03,"  AND uhc10 = 'M' AND ",tm.wc CLIPPED,
               " GROUP BY uhc01,uhc06,uhc07 ORDER BY uhc01" 
   PREPARE r763_prepare1 FROM l_sql 
   DECLARE r763_cs1 CURSOR FOR r763_prepare1 
   FOREACH r763_cs1 INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF  
      SELECT uab02 INTO l_uab02 FROM uab_file WHERE uab01 = tm.uhc06_f
      LET sr.typeflg = tm.mm,"月(",l_uab02," ",tm.uhc07_f," 版 )"
      CALL r763_sum()
      EXECUTE insert_prep USING sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('EXECUTE:',SQLCA.sqlcode,1) 
         EXIT FOREACH
      END IF          
      INITIALIZE sr.* TO NULL 
   END FOREACH      

   LET l_sql = "SELECT 1,'',2,udb03,uhc06,uhc07,0,0,0,0,0,0,0,0,0,0,0,sum(uhc11),sum(uhc12),sum(uhc12f+uhc12i+uhc12j),sum(uhc12g),",
               "       sum(uhc12h),sum(uhc12ha),sum(uhc12hb),sum(uhc12a+uhc12d+uhc12e),sum(uhc12b),sum(uhc12c),sum(uhc12ca),",
               "       sum(uhc12cb),sum(uhc21),sum(uhc22),sum(uhc22f+uhc22i+uhc22j),sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),",
               "       sum(uhc22a+uhc22d+uhc22e),sum(uhc22b),sum(uhc22c),sum(uhc22ca),sum(uhc22cb),sum(uhc61+uhc71),sum(uhc62+uhc72),",
               "       sum(uhc62f+uhc62i+uhc62j+uhc72f+uhc72i+uhc72j),sum(uhc62g+uhc72g),sum(uhc62h+uhc72h),sum(uhc62ha+uhc72ha),sum(uhc62hb+uhc72hb),",
               "       sum(uhc62a+uhc62d+uhc62e+uhc72a+uhc72d+uhc72e),sum(uhc62b+uhc72b),sum(uhc62c+uhc72c),sum(uhc62ca+uhc72ca),sum(uhc62cb+uhc72cb),",
               "       sum(uhc91),sum(uhc92),sum(uhc92f+uhc92i+uhc92j),sum(uhc92g),sum(uhc92h),sum(uhc92ha),sum(uhc92hb),sum(uhc92a+uhc92d+uhc92e),",
               "       sum(uhc92b),sum(uhc92c),sum(uhc92ca),sum(uhc92cb)",
               "  FROM uhc_file,udb_file ",
               " WHERE uhc06 = '",tm.uhc06_f,"' AND uhc07 = '",tm.uhc07_f,"' AND uhc02 = ",tm.uhc02,
               "   AND uhc03 = ",tm.uhc03," AND uhc10 = 'M' AND uhc00 = udb01 AND ",tm.wc CLIPPED,
               " GROUP BY udb03,uhc06,uhc07 ORDER BY udb03 "
   PREPARE r763_prepare11 FROM l_sql 
   DECLARE r763_cs11 CURSOR FOR r763_prepare11 
   FOREACH r763_cs11 INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF  
      SELECT uab02 INTO l_uab02 FROM uab_file WHERE uab01 = tm.uhc06_f
      LET sr.typeflg = tm.mm,"月(",l_uab02," ",tm.uhc07_f," 版 )"
      CALL r763_sum()
      SELECT udc02 INTO sr.uhc01 FROM udc_file WHERE udc01 = sr.uhc01 AND udcacti ='Y'
      EXECUTE insert_prep USING sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('EXECUTE:',SQLCA.sqlcode,1) 
         EXIT FOREACH
      END IF          
      INITIALIZE sr.* TO NULL 
   END FOREACH     

   #预算版本二的资料
   LET l_sql = "SELECT 2,'',1,uhc01,uhc06,uhc07,0,0,0,0,0,0,0,0,0,0,0,sum(uhc11),sum(uhc12),sum(uhc12f+uhc12i+uhc12j),",
               "       sum(uhc12g),sum(uhc12h),sum(uhc12ha),sum(uhc12hb),sum(uhc12a+uhc12d+uhc12e),sum(uhc12b),",
               "       sum(uhc12c),sum(uhc12ca),sum(uhc12cb),sum(uhc21),sum(uhc22),sum(uhc22f+uhc22i+uhc22j),",
               "       sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),sum(uhc22a+uhc22d+uhc22e),sum(uhc22b),",
               "       sum(uhc22c),sum(uhc22ca),sum(uhc22cb),sum(uhc61+uhc71),sum(uhc62+uhc72),sum(uhc62f+uhc62i+uhc62j+uhc72f+uhc72i+uhc72j),",
               "       sum(uhc62g+uhc72g),sum(uhc62h+uhc72h),sum(uhc62ha+uhc72ha),sum(uhc62hb+uhc72hb),sum(uhc62a+uhc62d+uhc62e+uhc72a+uhc72d+uhc72e),",
               "       sum(uhc62b+uhc72b),sum(uhc62c+uhc72c),sum(uhc62ca+uhc72ca),sum(uhc62cb+uhc72cb),sum(uhc91),sum(uhc92),sum(uhc92f+uhc92i+uhc92j),",
               "       sum(uhc92g),sum(uhc92h),sum(uhc92ha),sum(uhc92hb),sum(uhc92a+uhc92d+uhc92e),sum(uhc92b),sum(uhc92c),sum(uhc92ca),sum(uhc92cb)",
               "  FROM uhc_file ",
               " WHERE uhc06 = '",tm.uhc06_t,"' AND uhc07 = '",tm.uhc07_t,"' AND uhc02 = ",tm.uhc02,
               "   AND uhc03 = ",tm.uhc03,"  AND uhc10 = 'M' AND ",tm.wc CLIPPED,
               " GROUP BY uhc01,uhc06,uhc07 ORDER BY uhc01"
   PREPARE r763_prepare2 FROM l_sql
   DECLARE r763_cs2 CURSOR FOR r763_prepare2
   FOREACH r763_cs2 INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF  
      SELECT uab02 INTO l_uab02 FROM uab_file WHERE uab01 = tm.uhc06_t
      LET sr.typeflg = tm.mm,"月(",l_uab02," ",tm.uhc07_t," 版 )"
      CALL r763_sum()
      EXECUTE insert_prep USING sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('EXECUTE:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF  
      INITIALIZE sr.* TO NULL
   END FOREACH

   LET l_sql = "SELECT 2,'',2,udb03,uhc06,uhc07,0,0,0,0,0,0,0,0,0,0,0,sum(uhc11),sum(uhc12),sum(uhc12f+uhc12i+uhc12j),sum(uhc12g),",
               "       sum(uhc12h),sum(uhc12ha),sum(uhc12hb),sum(uhc12a+uhc12d+uhc12e),sum(uhc12b),sum(uhc12c),sum(uhc12ca),",
               "       sum(uhc12cb),sum(uhc21),sum(uhc22),sum(uhc22f+uhc22i+uhc22j),sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),",
               "       sum(uhc22a+uhc22d+uhc22e),sum(uhc22b),sum(uhc22c),sum(uhc22ca),sum(uhc22cb),sum(uhc61+uhc71),sum(uhc62+uhc72),",
               "       sum(uhc62f+uhc62i+uhc62j+uhc72f+uhc72i+uhc72j),sum(uhc62g+uhc72g),sum(uhc62h+uhc72h),sum(uhc62ha+uhc72ha),sum(uhc62hb+uhc72hb),",
               "       sum(uhc62a+uhc62d+uhc62e+uhc72a+uhc72d+uhc72e),sum(uhc62b+uhc72b),sum(uhc62c+uhc72c),sum(uhc62ca+uhc72ca),sum(uhc62cb+uhc72cb),",
               "       sum(uhc91),sum(uhc92),sum(uhc92f+uhc92i+uhc92j),sum(uhc92g),sum(uhc92h),sum(uhc92ha),sum(uhc92hb),sum(uhc92a+uhc92d+uhc92e),",
               "       sum(uhc92b),sum(uhc92c),sum(uhc92ca),sum(uhc92cb)",
               "  FROM uhc_file,udb_file ",
               " WHERE uhc06 = '",tm.uhc06_t,"' AND uhc07 = '",tm.uhc07_t,"' AND uhc02 = ",tm.uhc02,
               "   AND uhc03 = ",tm.uhc03," AND uhc10 = 'M' AND uhc00 = udb01 AND ",tm.wc CLIPPED,
               " GROUP BY udb03,uhc06,uhc07 ORDER BY udb03 "
   PREPARE r763_prepare21 FROM l_sql
   DECLARE r763_cs21 CURSOR FOR r763_prepare21
   FOREACH r763_cs21 INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF 
      SELECT uab02 INTO l_uab02 FROM uab_file WHERE uab01 = tm.uhc06_t
      LET sr.typeflg = tm.mm,"月(",l_uab02," ",tm.uhc07_t," 版 )"
      CALL r763_sum()
      SELECT udc02 INTO sr.uhc01 FROM udc_file WHERE udc01 = sr.uhc01 AND udcacti ='Y'
      EXECUTE insert_prep USING sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('EXECUTE:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      INITIALIZE sr.* TO NULL
   END FOREACH 

   #差异
   LET l_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table2 CLIPPED,
               "   SELECT num1,uhc01,sum(uhc12_d),sum(uhc12f_d),sum(uhc12g_d),sum(uhc12h_d),sum(uhc12ha_d),sum(uhc12hb_d),",
               "          sum(uhc12a_d),sum(uhc12b_d),sum(uhc12c_d),sum(uhc12ca_d),sum(uhc12cb_d),sum(uhc11),sum(uhc12),sum(uhc12f),",
               "          sum(uhc12g),sum(uhc12h),sum(uhc12ha),sum(uhc12hb),sum(uhc12a),sum(uhc12b),sum(uhc12c),sum(uhc12ca),sum(uhc12cb),",
               "          sum(uhc21),sum(uhc22),sum(uhc22f),sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),sum(uhc22a),sum(uhc22b),",
               "          sum(uhc22c),sum(uhc22ca),sum(uhc22cb),sum(uhc61),sum(uhc62),sum(uhc62f),sum(uhc62g),sum(uhc62h),sum(uhc62ha),",
               "          sum(uhc62hb),sum(uhc62a),sum(uhc62b),sum(uhc62c),sum(uhc62ca),sum(uhc62cb),sum(uhc91),sum(uhc92),sum(uhc92f),",
               "          sum(uhc92g),sum(uhc92h),sum(uhc92ha),sum(uhc92hb),sum(uhc92a),sum(uhc92b),sum(uhc92c),sum(uhc92ca),sum(uhc92cb)",
               "  FROM ",g_cr_db_str CLIPPED,l_table CLIPPED,
               " WHERE uhc06 = '",tm.uhc06_f,"' AND uhc07 = '",tm.uhc07_f,"' AND typenum = 1 ",
               " GROUP BY num1,uhc01 ORDER BY uhc01"
   PREPARE instmp_pre1 FROM l_sql
   EXECUTE instmp_pre1

   LET l_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table2 CLIPPED,
               "   SELECT num1,uhc01,0-sum(uhc12_d),0-sum(uhc12f_d),0-sum(uhc12g_d),0-sum(uhc12h_d),0-sum(uhc12ha_d),0-sum(uhc12hb_d),",
               "          0-sum(uhc12a_d),0-sum(uhc12b_d),0-sum(uhc12c_d),0-sum(uhc12ca_d),0-sum(uhc12cb_d),0-sum(uhc11),0-sum(uhc12),0-sum(uhc12f),",
               "          0-sum(uhc12g),0-sum(uhc12h),0-sum(uhc12ha),0-sum(uhc12hb),0-sum(uhc12a),0-sum(uhc12b),0-sum(uhc12c),0-sum(uhc12ca),0-sum(uhc12cb),",
               "          0- sum(uhc21),0-sum(uhc22),0-sum(uhc22f),0-sum(uhc22g),0-sum(uhc22h),0-sum(uhc22ha),0-sum(uhc22hb),0-sum(uhc22a),0-sum(uhc22b),",
               "          0-sum(uhc22c),0-sum(uhc22ca),0-sum(uhc22cb),0-sum(uhc61),0-sum(uhc62),0-sum(uhc62f),0-sum(uhc62g),0-sum(uhc62h),0-sum(uhc62ha),",
               "          0-sum(uhc62hb),0-sum(uhc62a),0-sum(uhc62b),0-sum(uhc62c),0-sum(uhc62ca),0-sum(uhc62cb),0-sum(uhc91),0-sum(uhc92),0-sum(uhc92f),",
               "          0-sum(uhc92g),0-sum(uhc92h),0-sum(uhc92ha),0-sum(uhc92hb),0-sum(uhc92a),0-sum(uhc92b),0-sum(uhc92c),0-sum(uhc92ca),0-sum(uhc92cb)",
               "  FROM ",g_cr_db_str CLIPPED,l_table CLIPPED,
               " WHERE uhc06 = '",tm.uhc06_t,"' AND uhc07 = '",tm.uhc07_t,"' AND typenum = 2 ",
               " GROUP BY num1,uhc01 ORDER BY uhc01"
   PREPARE instmp_pre2 FROM l_sql
   EXECUTE instmp_pre2

   #预算差异资料
   LET l_sql = "SELECT 3,'',num1,uhc01,'','',sum(uhc12_d),sum(uhc12f_d),sum(uhc12g_d),sum(uhc12h_d),sum(uhc12ha_d),sum(uhc12hb_d),",
               "          sum(uhc12a_d),sum(uhc12b_d),sum(uhc12c_d),sum(uhc12ca_d),sum(uhc12cb_d),sum(uhc11),sum(uhc12),sum(uhc12f),sum(uhc12g),",
               "       sum(uhc12h),sum(uhc12ha),sum(uhc12hb),sum(uhc12a),sum(uhc12b),sum(uhc12c),sum(uhc12ca),",
               "       sum(uhc12cb),sum(uhc21),sum(uhc22),sum(uhc22f),sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),",
               "       sum(uhc22a),sum(uhc22b),sum(uhc22c),sum(uhc22ca),sum(uhc22cb),sum(uhc61),sum(uhc62),",
               "       sum(uhc62f),sum(uhc62g),sum(uhc62h),sum(uhc62ha),sum(uhc62hb),",
               "       sum(uhc62a),sum(uhc62b),sum(uhc62c),sum(uhc62ca),sum(uhc62cb),",
               "       sum(uhc91),sum(uhc92),sum(uhc92f),sum(uhc92g),sum(uhc92h),sum(uhc92ha),sum(uhc92hb),sum(uhc92a),",
               "       sum(uhc92b),sum(uhc92c),sum(uhc92ca),sum(uhc92cb)",
               "  FROM ",g_cr_db_str CLIPPED,l_table2 CLIPPED,
               " GROUP BY num1,uhc01 ORDER BY num1,uhc01"
   PREPARE r763_prepare3 FROM l_sql
   DECLARE r763_cs3 CURSOR FOR r763_prepare3
   FOREACH r763_cs3 INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF 
      LET sr.typeflg = tm.mm,"月(差异)"
      IF sr.num1 = '2' THEN
         SELECT udc02 INTO sr.uhc01 FROM udc_file WHERE udc01 = sr.uhc01 AND udcacti ='Y'
      END IF 
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
   CALL cl_prt_cs3('agtr763','agtr763',g_sql,g_str)
END FUNCTION 

#对金额和数量栏位合计
FUNCTION r763_sum()
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
 
