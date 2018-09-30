# Prog. Version..: '5.25.02-11.03.23(00010)'     #
#
# Pattern name...: cgtr762.4gl
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
          uhc22cb     LIKE uhc_file.uhc22cb
                  END RECORD
DEFINE sr1 DYNAMIC ARRAY  OF RECORD
                    tc_gem   LIKE gem_file.gem02,
                    tc_uhc   LIKE uhc_file.uhc21
                 END RECORD
DEFINE g_ufj17 DYNAMIC ARRAY OF LIKE ufj_file.ufj17
DEFINE g_ufj09 DYNAMIC ARRAY OF LIKE ufj_file.ufj09
DEFINE g_tc_uao04 DYNAMIC ARRAY OF LIKE tc_uao_file.tc_uao04
DEFINE g_sql          STRING
DEFINE g_str          STRING
DEFINE g_wc           STRING
DEFINE l_table        STRING
DEFINE g_uhc05_desc   LIKE uah_file.uah05
DEFINE g_sql_2        STRING
DEFINE g_cnt 		  LIKE type_file.num5
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
               "tc_gem01.gem_file.gem02,",
               "tc_uhc01.uhc_file.uhc21,",
               "tc_gem02.gem_file.gem02,",
               "tc_uhc02.uhc_file.uhc21,",
               "tc_gem03.gem_file.gem02,",
               "tc_uhc03.uhc_file.uhc21,",
               "tc_gem04.gem_file.gem02,",
               "tc_uhc04.uhc_file.uhc21,",
               "tc_gem05.gem_file.gem02,",
               "tc_uhc05.uhc_file.uhc21,",
               "tc_gem06.gem_file.gem02,",
               "tc_uhc06.uhc_file.uhc21,",
               "tc_gem07.gem_file.gem02,",
               "tc_uhc07.uhc_file.uhc21,",
               "tc_gem08.gem_file.gem02,",
               "tc_uhc08.uhc_file.uhc21,",
               "tc_gem09.gem_file.gem02,",
               "tc_uhc09.uhc_file.uhc21,",
               "tc_gem10.gem_file.gem02,",
               "tc_uhc10.uhc_file.uhc21,",
               "tc_gem11.gem_file.gem02,",
               "tc_uhc11.uhc_file.uhc21,",
               "tc_gem12.gem_file.gem02,",
               "tc_uhc12.uhc_file.uhc21,",
               "tc_gem13.gem_file.gem02,",
               "tc_uhc13.uhc_file.uhc21,",
               "tc_gem14.gem_file.gem02,",
               "tc_uhc14.uhc_file.uhc21,",
               "tc_gem15.gem_file.gem02,",
               "tc_uhc15.uhc_file.uhc21,",
               "tc_gem16.gem_file.gem02,",
               "tc_uhc16.uhc_file.uhc21,",
               "tc_gem17.gem_file.gem02,",
               "tc_uhc17.uhc_file.uhc21,",
               "tc_gem18.gem_file.gem02,",
               "tc_uhc18.uhc_file.uhc21,",
               "tc_gem19.gem_file.gem02,",
               "tc_uhc19.uhc_file.uhc21,",
               "tc_gem20.gem_file.gem02,",
               "tc_uhc20.uhc_file.uhc21,",
               "tc_gem21.gem_file.gem02,",
               "tc_uhc21.uhc_file.uhc21,",
               "tc_gem22.gem_file.gem02,",
               "tc_uhc22.uhc_file.uhc21,",
               "tc_gem23.gem_file.gem02,",
               "tc_uhc23.uhc_file.uhc21,",
               "tc_gem24.gem_file.gem02,",
               "tc_uhc24.uhc_file.uhc21,",
               "tc_gem25.gem_file.gem02,",
               "tc_uhc25.uhc_file.uhc21,",
               "tc_gem26.gem_file.gem02,",
               "tc_uhc26.uhc_file.uhc21,",
               "tc_gem27.gem_file.gem02,",
               "tc_uhc27.uhc_file.uhc21,",
               "tc_gem28.gem_file.gem02,",
               "tc_uhc28.uhc_file.uhc21,",
               "tc_gem29.gem_file.gem02,",
               "tc_uhc29.uhc_file.uhc21,",
               "tc_gem30.gem_file.gem02,",
               "tc_uhc30.uhc_file.uhc21,",
               "tc_gem31.gem_file.gem02,",
               "tc_uhc31.uhc_file.uhc21,",
               "tc_gem32.gem_file.gem02,",
               "tc_uhc32.uhc_file.uhc21,",
               "tc_gem33.gem_file.gem02,",
               "tc_uhc33.uhc_file.uhc21,",
               "tc_gem34.gem_file.gem02,",
               "tc_uhc34.uhc_file.uhc21,",
               "tc_gem35.gem_file.gem02,",
               "tc_uhc35.uhc_file.uhc21,",
               "tc_gem36.gem_file.gem02,",
               "tc_uhc36.uhc_file.uhc21,",
               "tc_gem37.gem_file.gem02,",
               "tc_uhc37.uhc_file.uhc21,",
               "tc_gem38.gem_file.gem02,",
               "tc_uhc38.uhc_file.uhc21,",
               "tc_gem39.gem_file.gem02,",
               "tc_uhc39.uhc_file.uhc21,",
               "tc_gem40.gem_file.gem02,",
               "tc_uhc40.uhc_file.uhc21,",
               "tc_gem41.gem_file.gem02,",
               "tc_uhc41.uhc_file.uhc21,",
               "tc_gem42.gem_file.gem02,",
               "tc_uhc42.uhc_file.uhc21,",
               "tc_gem43.gem_file.gem02,",
               "tc_uhc43.uhc_file.uhc21,",
               "tc_gem44.gem_file.gem02,",
               "tc_uhc44.uhc_file.uhc21,",
               "tc_gem45.gem_file.gem02,",
               "tc_uhc45.uhc_file.uhc21"


   LET l_table = cl_prt_temptable('cgtr762',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF
   LET g_sql ="INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
                " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,",
                "        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,",
                "        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,",
                "        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,",
                "        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,",
                "        ?,?,?,?)"
     PREPARE insert_prep FROM g_sql
     IF STATUS THEN
        CALL cl_err('insert_prep:',status,1)
        EXIT PROGRAM
     END IF
   CALL r762_tm(0,0)
   CALL cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION r762_tm(p_row,p_col)
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
   OPEN WINDOW r762_w AT p_row,p_col WITH FORM "cgt/42f/cgtr762"
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
         LET INT_FLAG = 0 CLOSE WINDOW r762_w
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
         LET INT_FLAG = 0 CLOSE WINDOW r762_w
         CALL cl_used(g_prog,g_time,2) RETURNING g_time
         EXIT PROGRAM
      END IF
      CALL cl_wait()
      CALL cgtr762()
      ERROR ""
   END WHILE
   CLOSE WINDOW r762_w
END FUNCTION

FUNCTION cgtr762()
DEFINE l_name	LIKE type_file.chr20,
       l_sql 	STRING,
       l_za05	LIKE type_file.chr1000
DEFINE l_uhc03     LIKE uhc_file.uhc03
DEFINE l_uab04      LIKE uab_file.uab04
DEFINE l_ual05      LIKE ual_file.ual05
DEFINE l_tm_uhc03   LIKE uhc_file.uhc03
DEFINE l_wc    STRING
DEFINE l_wc2    STRING
DEFINE l_cnt        LIKE type_file.num5
DEFINE l_cnt2       LIKE type_file.num5

   CALL cl_del_data(l_table)
   INITIALIZE sr.* TO NULL
   SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01='cgtr762'
   SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
   #汇总出销售预算中出现的所有机种
   LET l_sql = "SELECT 1,uhc01,sum(uhc21),sum(uhc22),sum(uhc22f+uhc22i+uhc22j),sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),sum(uhc22a+uhc22d+uhc22e),sum(uhc22b),sum(uhc22c),sum(uhc22ca),sum(uhc22cb)",
               "  FROM uhc_file ",
               " WHERE uhc06 = '",tm.uhc06,"'",
               "   AND uhc07 = '",tm.uhc07,"'",
               "   AND uhc02 = ",tm.uhc02,
               "   AND uhc03 = ",tm.uhc03,
               "   AND uhc10 = 'M' ",
               "   AND ",g_wc CLIPPED,
               " GROUP BY uhc01",
               " ORDER BY uhc01"
   PREPARE r762_prepare1 FROM l_sql
   DECLARE r762_cs1 CURSOR FOR r762_prepare1


   # 全部部门赋值
   LET l_wc = cl_replace_str(g_wc,"uhc05","ufj01")
   LET l_wc = cl_replace_str(l_wc,"uhc01","ufj18")
   LET l_sql = "select unique ufj17",
			         "  from ufj_file",
			         " where ufj02 = '",tm.uhc06,"'",
			         "   AND ufj03 = '",tm.uhc07,"'",
			         "   AND ufj04 = ",tm.uhc02,
			         "   AND ufj05 = ",tm.uhc03,
			         "   AND ufj07 = '20102'",
			         "   AND ufj08 in ('E', 'B')",
			         "   AND ",l_wc CLIPPED,
			         "   ORDER BY ufj17"
   PREPARE r762_prepare2 FROM l_sql
   DECLARE r762_cs2 CURSOR FOR r762_prepare2

   LET g_cnt=1
   LET l_cnt=1
   FOREACH r762_cs2 INTO g_ufj17[l_cnt]
   		IF SQLCA.sqlcode THEN
         	CALL cl_err('FOREACH:r762_cs2',SQLCA.sqlcode,1)
         	EXIT FOREACH
      	END IF
      	IF g_cnt>45 THEN
      		CALL cl_err('部门数大于最大数量45，目前只显示45，请尝试查询单个预算编码！',0,1)
      		EXIT FOREACH
      	END IF
      	LET l_cnt = l_cnt + 1
      	LET g_cnt = g_cnt + 1
   END FOREACH
   CALL g_ufj17.deleteElement(l_cnt)
   LET g_cnt = g_cnt -1


   # 分摊到部门折旧
   LET l_sql =" select gem02  ufj17,sum(ufj24)",
              "  from ufj_file LEFT JOIN gem_file ON gem01 = ufj17 ",
              " where  ufj02 = '",tm.uhc06,"'",
			        "   AND ufj03 = '",tm.uhc07,"'",
			        "   AND ufj04 = ",tm.uhc02,
			        "   AND ufj05 = ",tm.uhc03,
			        "   AND ufj07 = '20102'",
			        "   AND ufj08 in ('E','B')",
			        "   AND ",l_wc CLIPPED,
              "   and ufj17 = ? and ufj18 =? ",
              "   GROUP BY ufj17,gem02"
   PREPARE r762_prepare3 FROM l_sql
   DECLARE r762_cs3 CURSOR FOR r762_prepare3

   # 人工制费项目
   LET l_sql = "select unique ufj09",
			         "  from ufj_file",
			         " where ufj02 = '",tm.uhc06,"'",
			         "   AND ufj03 = '",tm.uhc07,"'",
			         "   AND ufj04 = ",tm.uhc02,
			         "   AND ufj05 = ",tm.uhc03,
			         "   AND ufj07 = '20102'",
			         "   AND ufj08 in ('F')",
			         "   AND ",l_wc CLIPPED,
			         "   ORDER BY ufj09"
   PREPARE r762_prepare4 FROM l_sql
   DECLARE r762_cs4 CURSOR FOR r762_prepare4

   LET l_cnt = 1
   FOREACH r762_cs4 INTO g_ufj09[l_cnt]
   		IF SQLCA.sqlcode THEN
         	CALL cl_err('FOREACH:r762_cs4',SQLCA.sqlcode,1)
         	EXIT FOREACH
      	END IF
      	IF g_cnt>45 THEN
      		CALL cl_err('项目数大于最大数量45，目前只显示45，请尝试查询单个预算编码！',0,1)
      		EXIT FOREACH
      	END IF
      	LET l_cnt = l_cnt + 1
      	LET g_cnt = g_cnt + 1
   END FOREACH
   CALL g_ufj09.deleteElement(l_cnt)
   LET g_cnt = g_cnt -1


   # 分摊到项目
   LET l_sql = " select uad02 ufj09, sum(ufj24)",
               "  from ufj_file LEFT JOIN uad_file ON ufj09 = uad01",
               " where  ufj02 = '",tm.uhc06,"'",
			         "   AND ufj03 = '",tm.uhc07,"'",
			         "   AND ufj04 = ",tm.uhc02,
			         "   AND ufj05 = ",tm.uhc03,
			         "   AND ufj07 = '20102'",
			         "   AND ufj08 in ('F')",
			         "   AND ",l_wc CLIPPED,
               "   and ufj09 = ? and ufj18 =? ",
               "   GROUP BY ufj09,uad02"
   PREPARE r762_prepare5 FROM l_sql
   DECLARE r762_cs5 CURSOR FOR r762_prepare5

   # 管理项目
   LET l_wc2 = cl_replace_str(l_wc,'ufj01','tc_uao03')
   LET l_wc2 = cl_replace_str(l_wc2,'ufj18','tc_uao19')
   LET l_sql =" select unique tc_uao04 ",
              " from tc_uao_file",
              " where  tc_uao01 = '",tm.uhc06,"'",
              "    AND tc_uao02 = '",tm.uhc07,"'",
              "    AND tc_uao05 = ",tm.uhc02,
              "    AND tc_uao06 = ",tm.uhc03,
              "   AND ",l_wc2 CLIPPED,
              "    and tc_uao19 in (",
              "    select unique ufj18",
              "   from ufj_file",
              " where ufj02 = '",tm.uhc06,"'",
			        "   AND ufj03 = '",tm.uhc07,"'",
			        "   AND ufj04 = ",tm.uhc02,
			        "   AND ufj05 = ",tm.uhc03,
			        "   AND ufj07 = '20102'",
              "   AND ",l_wc CLIPPED,")"

   PREPARE r762_prepare6 FROM l_sql
   DECLARE r762_cs6 CURSOR FOR r762_prepare6

   LET l_cnt = 1
   FOREACH r762_cs6 INTO g_tc_uao04[l_cnt]
   		IF SQLCA.sqlcode THEN
         	CALL cl_err('FOREACH:r762_cs6',SQLCA.sqlcode,1)
         	EXIT FOREACH
      	END IF
      	IF g_cnt>45 THEN
      		CALL cl_err('项目数大于最大数量45，目前只显示45，请尝试查询单个预算编码！',0,1)
      		EXIT FOREACH
      	END IF
      	LET l_cnt = l_cnt + 1
      	LET g_cnt = g_cnt + 1
   END FOREACH
   	CALL g_tc_uao04.deleteElement(l_cnt)
   	LET g_cnt = g_cnt -1

   # 管理费用分摊到项目
   LET l_sql =" select sum(tc_uao01)",
              " from tc_uao_file",
              " where  tc_uao01 = '",tm.uhc06,"'",
              "    AND tc_uao02 = '",tm.uhc07,"'",
              "    AND tc_uao05 = ",tm.uhc02,
              "    AND tc_uao06 = ",tm.uhc03,
              "    AND ",l_wc2 CLIPPED,
              "    AND tc_uao19 =? AND tc_uao04 =?"
   PREPARE r762_prepare7 FROM l_sql
   DECLARE r762_cs7 CURSOR FOR r762_prepare7

   #单位时数和总时数
   LET l_sql = " select unique '单位时数', NVL(ufj14,0),'总时数',NVL(ufj22,0)",
               "  from ufj_file",
               " where  ufj02 = '",tm.uhc06,"'",
			         "   AND ufj03 = '",tm.uhc07,"'",
			         "   AND ufj04 = ",tm.uhc02,
			         "   AND ufj05 = ",tm.uhc03,
			         "   AND ufj07 = '20102'",
			         "   AND ",l_wc CLIPPED,
               "   and ufj18 =? "
   PREPARE r762_prepare8 FROM l_sql
   DECLARE r762_cs8 CURSOR FOR r762_prepare8

   # 管理费用
   LET l_sql =" select sum(tc_uao01)",
              " from tc_uao_file",
              " where  tc_uao01 = '",tm.uhc06,"'",
              "    AND tc_uao02 = '",tm.uhc07,"'",
              "    AND tc_uao05 = ",tm.uhc02,
              "    AND tc_uao06 = ",tm.uhc03,
              "    AND ",l_wc2 CLIPPED,
              "    AND tc_uao19 =? "
   PREPARE r762_prepare9 FROM l_sql
   DECLARE r762_cs9 CURSOR FOR r762_prepare9

   FOREACH r762_cs1 INTO sr.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      #CALL r762_sum()
      LET l_cnt2=1

      # 折旧分摊
      FOR l_cnt=1 TO g_ufj17.getLength()-1
      		EXECUTE r762_cs3 INTO sr1[l_cnt2].tc_gem,sr1[l_cnt2].tc_uhc USING g_ufj17[l_cnt],sr.uhc01
      		IF SQLCA.sqlcode THEN
             IF  SQLCA.sqlcode = 100 THEN
                 LET sr1[l_cnt2].tc_gem=g_ufj17[l_cnt]
                 LET sr1[l_cnt2].tc_uhc =0
             ELSE
    		         CALL cl_err('EXECUTE:r762_cs3',SQLCA.sqlcode,1)
    		         EXIT FOR
                 EXIT FOREACH
             END IF
      		END IF
      		#LET sr1[l_cnt2].tc_gem = g_ufj17[l_cnt]
      		LET l_cnt2 = l_cnt2 + 1
      END FOR
      CALL sr1.deleteElement(l_cnt2)

      # 制费分摊

      FOR l_cnt=1 TO g_ufj09.getLength()-1
     		EXECUTE r762_cs5 INTO sr1[l_cnt2].tc_gem,sr1[l_cnt2].tc_uhc USING g_ufj09[l_cnt],sr.uhc01
     		   IF SQLCA.sqlcode THEN
             IF  SQLCA.sqlcode = 100 THEN
                 LET sr1[l_cnt2].tc_gem=g_ufj09[l_cnt]
                 LET sr1[l_cnt2].tc_uhc =0
             ELSE

    		         CALL cl_err('EXECUTE:r762_cs5',SQLCA.sqlcode,1)
    		         EXIT FOR
                 EXIT FOREACH
             END iF
      		END IF
      		#LET sr1[l_cnt2].tc_gem = g_ufj09[l_cnt]
      		LET l_cnt2 = l_cnt2 + 1
      END FOR
      CALL sr1.deleteElement(l_cnt2)

      # 管理金额和分摊金额

      EXECUTE r762_cs9 INTO sr1[l_cnt2].tc_uhc USING sr.uhc01
      LET sr1[l_cnt2].tc_gem = '管理费用'

      FOR l_cnt=1 TO g_tc_uao04.getLength()-1
      		EXECUTE r762_cs7 INTO sr1[l_cnt2].tc_uhc USING sr.uhc01,g_tc_uao04[l_cnt]
      		IF SQLCA.sqlcode THEN
		         CALL cl_err('EXECUTE:r762_cs7',SQLCA.sqlcode,1)
		         EXIT FOR
             EXIT FOREACH
      		END IF
      		LET sr1[l_cnt2].tc_gem = g_tc_uao04[l_cnt]
      		LET l_cnt2 = l_cnt2 + 1
      END FOR
      CALL sr1.deleteElement(l_cnt2)

      # 单位时数和总时数

      EXECUTE r762_cs8 INTO sr1[l_cnt2].tc_gem,sr1[l_cnt2].tc_uhc,sr1[l_cnt2+1].tc_gem,sr1[l_cnt2+1].tc_uhc
                       USING sr.uhc01
      IF SQLCA.sqlcode THEN
        IF SQLCA.sqlcode =100 THEN
            LET sr1[l_cnt2].tc_gem = "单位时数 "
            LET sr1[l_cnt2].tc_uhc = 0
            LET sr1[l_cnt2+1].tc_gem = "总时数"
            LET sr1[l_cnt2+1].tc_uhc = 0
        ELSE
	  		    CALL cl_err('EXECUTE:r762_cs8',SQLCA.sqlcode,1)
        END IF
      END IF
      LET l_cnt2 = l_cnt2 + 2


      # 其他的赋值为null
      IF l_cnt2 <45 THEN
      	FOR l_cnt2 = l_cnt2 TO 45
      			LET sr1[l_cnt2].tc_gem = 0
      			LET sr1[l_cnt2].tc_uhc = 0
      	END FOR
      END IF

      EXECUTE insert_prep USING sr.num1,sr.uhc01,sr.uhc21,sr.uhc22,sr.uhc22f,sr.uhc22g,sr.uhc22h,sr.uhc22ha,sr.uhc22hb,sr.uhc22a,sr.uhc22b,sr.uhc22c,sr.uhc22ca,sr.uhc22cb,sr1[01].tc_gem,sr1[01].tc_uhc,sr1[02].tc_gem,sr1[02].tc_uhc,sr1[03].tc_gem,sr1[03].tc_uhc,sr1[04].tc_gem,sr1[04].tc_uhc,sr1[05].tc_gem,sr1[05].tc_uhc,sr1[06].tc_gem,sr1[06].tc_uhc,sr1[07].tc_gem,sr1[07].tc_uhc,sr1[08].tc_gem,sr1[08].tc_uhc,sr1[09].tc_gem,sr1[09].tc_uhc,sr1[10].tc_gem,sr1[10].tc_uhc,sr1[11].tc_gem,sr1[11].tc_uhc,sr1[12].tc_gem,sr1[12].tc_uhc,sr1[13].tc_gem,sr1[13].tc_uhc,sr1[14].tc_gem,sr1[14].tc_uhc,sr1[15].tc_gem,sr1[15].tc_uhc,sr1[16].tc_gem,sr1[16].tc_uhc,sr1[17].tc_gem,sr1[17].tc_uhc,sr1[18].tc_gem,sr1[18].tc_uhc,sr1[19].tc_gem,sr1[19].tc_uhc,sr1[20].tc_gem,sr1[20].tc_uhc,sr1[21].tc_gem,sr1[21].tc_uhc,sr1[22].tc_gem,sr1[22].tc_uhc,sr1[23].tc_gem,sr1[23].tc_uhc,sr1[24].tc_gem,sr1[24].tc_uhc,sr1[25].tc_gem,sr1[25].tc_uhc,sr1[26].tc_gem,sr1[26].tc_uhc,sr1[27].tc_gem,sr1[27].tc_uhc,sr1[28].tc_gem,sr1[28].tc_uhc,sr1[29].tc_gem,sr1[29].tc_uhc,sr1[30].tc_gem,sr1[30].tc_uhc,sr1[31].tc_gem,sr1[31].tc_uhc,sr1[32].tc_gem,sr1[32].tc_uhc,sr1[33].tc_gem,sr1[33].tc_uhc,sr1[34].tc_gem,sr1[34].tc_uhc,sr1[35].tc_gem,sr1[35].tc_uhc,sr1[36].tc_gem,sr1[36].tc_uhc,sr1[37].tc_gem,sr1[37].tc_uhc,sr1[38].tc_gem,sr1[38].tc_uhc,sr1[39].tc_gem,sr1[39].tc_uhc,sr1[40].tc_gem,sr1[40].tc_uhc,sr1[41].tc_gem,sr1[41].tc_uhc,sr1[42].tc_gem,sr1[42].tc_uhc,sr1[43].tc_gem,sr1[43].tc_uhc,sr1[44].tc_gem,sr1[44].tc_uhc,sr1[45].tc_gem,sr1[45].tc_uhc
      IF SQLCA.sqlcode THEN
         CALL cl_err('EXECUTE:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      INITIALIZE sr.* TO NULL
   END FOREACH

   LET l_sql = "SELECT 2,udb03,sum(uhc21),sum(uhc22),sum(uhc22f+uhc22i+uhc22j),sum(uhc22g),sum(uhc22h),sum(uhc22ha),sum(uhc22hb),sum(uhc22a+uhc22d+uhc22e),sum(uhc22b),sum(uhc22c),sum(uhc22ca),sum(uhc22cb)",
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
   LET l_wc = cl_replace_str(g_wc,"uhc05","a.uhc05")
   LET l_wc = cl_replace_str(l_wc,"uhc01","a.uhc01")
   LET l_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,
               " SELECT unique 2,b.udb03,sum(c.uhc21),sum(c.uhc22),sum(c.uhc22f),sum(c.uhc22g),sum(c.uhc22h),sum(c.uhc22ha),sum(c.uhc22hb),sum(c.uhc22a),sum(c.uhc22b),sum(c.uhc22c),sum(c.uhc22ca),sum(c.uhc22cb),tc_gem01,sum(tc_uhc01),tc_gem02,sum(tc_uhc02),tc_gem03,sum(tc_uhc03),tc_gem04,sum(tc_uhc04),tc_gem05,sum(tc_uhc05),tc_gem06,sum(tc_uhc06),tc_gem07,sum(tc_uhc07),tc_gem08,sum(tc_uhc08),tc_gem09,sum(tc_uhc09),tc_gem10,sum(tc_uhc10),tc_gem11,sum(tc_uhc11),tc_gem12,sum(tc_uhc12),tc_gem13,sum(tc_uhc13),tc_gem14,sum(tc_uhc14),tc_gem15,sum(tc_uhc15),tc_gem16,sum(tc_uhc16),tc_gem17,sum(tc_uhc17),tc_gem18,sum(tc_uhc18),tc_gem19,sum(tc_uhc19),tc_gem20,sum(tc_uhc20),tc_gem21,sum(tc_uhc21),tc_gem22,sum(tc_uhc22),tc_gem23,sum(tc_uhc23),tc_gem24,sum(tc_uhc24),tc_gem25,sum(tc_uhc25),tc_gem26,sum(tc_uhc26),tc_gem27,sum(tc_uhc27),tc_gem28,sum(tc_uhc28),tc_gem29,sum(tc_uhc29),tc_gem30,sum(tc_uhc30),tc_gem31,sum(tc_uhc31),tc_gem32,sum(tc_uhc32),tc_gem33,sum(tc_uhc33),tc_gem34,sum(tc_uhc34),tc_gem35,sum(tc_uhc35),tc_gem36,sum(tc_uhc36),tc_gem37,sum(tc_uhc37),tc_gem38,sum(tc_uhc38),tc_gem39,sum(tc_uhc39),tc_gem40,sum(tc_uhc40),tc_gem41,sum(tc_uhc41),tc_gem42,sum(tc_uhc42),tc_gem43,sum(tc_uhc43),tc_gem44,sum(tc_uhc44),tc_gem45,sum(tc_uhc45)",
               "   FROM uhc_file a,udb_file b,",g_cr_db_str CLIPPED,l_table CLIPPED," c",
               "  WHERE a.uhc06 = '",tm.uhc06,"'",
               "    AND a.uhc07 = '",tm.uhc07,"'",
               "    AND a.uhc02 = ",tm.uhc02,
               "    AND a.uhc03 = ",tm.uhc03,
               "    AND a.uhc10 = 'M' ",
               "    AND c.uhc01 = a.uhc01",
               "    AND a.uhc00 = b.udb01 ",
               "    AND ",l_wc CLIPPED,
               "GROUP BY b.udb03,tc_gem01,tc_gem02,tc_gem03,tc_gem04,tc_gem05,tc_gem06,tc_gem07,tc_gem08,tc_gem09,tc_gem10,tc_gem11,tc_gem12,tc_gem13,tc_gem14,tc_gem15,tc_gem16,tc_gem17,tc_gem18,tc_gem19,tc_gem20,tc_gem21,tc_gem22,tc_gem23,tc_gem24,tc_gem25,tc_gem26,tc_gem27,tc_gem28,tc_gem29,tc_gem30,tc_gem31,tc_gem32,tc_gem33,tc_gem34,tc_gem35,tc_gem36,tc_gem37,tc_gem38,tc_gem39,tc_gem40,tc_gem41,tc_gem42,tc_gem43,tc_gem44,tc_gem45",
               " ORDER BY b.udb03"
               PREPARE r762_prepare11 FROM l_sql
               EXECUTE r762_prepare11
               #DECLARE r762_cs11 CURSOR FOR r762_prepare11

   #FOREACH r762_cs11 INTO sr.*
   #   IF SQLCA.sqlcode THEN
   #      CALL cl_err('foreach:',SQLCA.sqlcode,1)
   #      EXIT FOREACH
   #   END IF
   #   CALL r762_sum()
   #   SELECT udc02 INTO sr.uhc01 FROM udc_file WHERE udc01 = sr.uhc01 AND udcacti ='Y'
   #   EXECUTE insert_prep USING sr.num1,sr.uhc01,sr.uhc21,sr.uhc22,sr.uhc22f,sr.uhc22g,sr.uhc22h,sr.uhc22ha,sr.uhc22hb,sr.uhc22a,sr.uhc22b,sr.uhc22c,sr.uhc22ca,sr.uhc22cb,sr1[01].tc_gem,sr1[01].tc_uhc,sr1[02].tc_gem,sr1[02].tc_uhc,sr1[03].tc_gem,sr1[03].tc_uhc,sr1[04].tc_gem,sr1[04].tc_uhc,sr1[05].tc_gem,sr1[05].tc_uhc,sr1[06].tc_gem,sr1[06].tc_uhc,sr1[07].tc_gem,sr1[07].tc_uhc,sr1[08].tc_gem,sr1[08].tc_uhc,sr1[09].tc_gem,sr1[09].tc_uhc,sr1[10].tc_gem,sr1[10].tc_uhc,sr1[11].tc_gem,sr1[11].tc_uhc,sr1[12].tc_gem,sr1[12].tc_uhc,sr1[13].tc_gem,sr1[13].tc_uhc,sr1[14].tc_gem,sr1[14].tc_uhc,sr1[15].tc_gem,sr1[15].tc_uhc,sr1[16].tc_gem,sr1[16].tc_uhc,sr1[17].tc_gem,sr1[17].tc_uhc,sr1[18].tc_gem,sr1[18].tc_uhc,sr1[19].tc_gem,sr1[19].tc_uhc,sr1[20].tc_gem,sr1[20].tc_uhc,sr1[21].tc_gem,sr1[21].tc_uhc,sr1[22].tc_gem,sr1[22].tc_uhc,sr1[23].tc_gem,sr1[23].tc_uhc,sr1[24].tc_gem,sr1[24].tc_uhc,sr1[25].tc_gem,sr1[25].tc_uhc,sr1[26].tc_gem,sr1[26].tc_uhc,sr1[27].tc_gem,sr1[27].tc_uhc,sr1[28].tc_gem,sr1[28].tc_uhc,sr1[29].tc_gem,sr1[29].tc_uhc,sr1[30].tc_gem,sr1[30].tc_uhc,sr1[31].tc_gem,sr1[31].tc_uhc,sr1[32].tc_gem,sr1[32].tc_uhc,sr1[33].tc_gem,sr1[33].tc_uhc,sr1[34].tc_gem,sr1[34].tc_uhc,sr1[35].tc_gem,sr1[35].tc_uhc,sr1[36].tc_gem,sr1[36].tc_uhc,sr1[37].tc_gem,sr1[37].tc_uhc,sr1[38].tc_gem,sr1[38].tc_uhc,sr1[39].tc_gem,sr1[39].tc_uhc,sr1[40].tc_gem,sr1[40].tc_uhc,sr1[41].tc_gem,sr1[41].tc_uhc,sr1[42].tc_gem,sr1[42].tc_uhc,sr1[43].tc_gem,sr1[43].tc_uhc,sr1[44].tc_gem,sr1[44].tc_uhc,sr1[45].tc_gem,sr1[45].tc_uhc
   #   IF SQLCA.sqlcode THEN
   #      CALL cl_err('EXECUTE:',SQLCA.sqlcode,1)
   #      EXIT FOREACH
   #   END IF
   #   INITIALIZE sr.* TO NULL
   #END FOREACH

   LET g_sql = "SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED
   LET g_str = ''
   LET g_str = g_str,';',tm.mm
   CALL cl_prt_cs3('cgtr762','cgtr762',g_sql,g_str)
END FUNCTION

#对金额和数量栏位合计
#FUNCTION r762_sum()
#DEFINE l_uhc11 LIKE uhc_file.uhc11
#   LET l_uhc11 = sr.uhc11 + sr.uhc21
#   LET sr.uhc12f_d  = (sr.uhc12f + sr.uhc22f)/l_uhc11
#   LET sr.uhc12g_d  = (sr.uhc12g + sr.uhc22g)/l_uhc11
#   LET sr.uhc12h_d  = (sr.uhc12h + sr.uhc22h)/l_uhc11
#   LET sr.uhc12ha_d = (sr.uhc12ha + sr.uhc22ha)/l_uhc11
#   LET sr.uhc12hb_d = (sr.uhc12hb + sr.uhc22hb)/l_uhc11
#   LET sr.uhc12a_d  = (sr.uhc12a + sr.uhc22a)/l_uhc11
#   LET sr.uhc12b_d  = (sr.uhc12b + sr.uhc22b)/l_uhc11
#   LET sr.uhc12c_d  = (sr.uhc12c + sr.uhc22c)/l_uhc11
#   LET sr.uhc12ca_d = (sr.uhc12ca + sr.uhc22ca)/l_uhc11
#   LET sr.uhc12cb_d = (sr.uhc12cb + sr.uhc22cb)/l_uhc11
#   LET sr.uhc12_d = sr.uhc12f_d + sr.uhc12g_d + sr.uhc12h_d + sr.uhc12a_d + sr.uhc12b_d + sr.uhc12c_d
#END FUNCTION

FUNCTION r762_get_ele(p_num,p_ele_name,p_ele_value)
DEFINE p_num       LIKE type_file.num5
DEFINE p_ele_name  LIKE gem_file.gem02
DEFINE p_ele_value LIKE uhc_file.uhc21
	CASE p_num
		WHEN 1
	END CASE
END FUNCTION