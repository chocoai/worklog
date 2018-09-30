# Prog. Version..: '5.30.06-1.0'     #
# ID CORD:panxq
# Pattern name...: cooi727.4gl
# Descriptions...: 员工刷卡信息查询
# Date & Author..: 18/02/01 By panxq
# Modify.........: 18/02/01 建立程序

DATABASE ds
GLOBALS "../../config/top.global"
GLOBALS "../../../tiptop/config/top.global"

#定义所有单头、单身和系统需要的变量


DEFINE g_pxq   		   RECORD LIKE tc_pxq_file.*,
       g_pxq_t       RECORD LIKE tc_pxq_file.*,
       g_pxq_o       RECORD LIKE tc_pxq_file.*,
       g_pxq01_t     LIKE tc_pxq_file.tc_pxq01,


	      g_sql					STRING,
	      g_wc          STRING,                     		  #单头CONSTRUCT结果
	      g_wc2         STRING,                       		#单身CONSTRUCT结果
	      g_rec_b       LIKE type_file.num5,         		  #单身笔数
	      l_ac          LIKE type_file.num5           		#目前处理的ARRAY CNT


DEFINE g_forupd_sql        STRING                  #SELECT ... FOR UPDATE  SQL
DEFINE g_curs_index        LIKE type_file.num10  	 #当前笔数
DEFINE g_row_count         LIKE type_file.num10    #总笔数
DEFINE g_before_input_done LIKE type_file.num5
DEFINE g_msg               LIKE ze_file.ze03
DEFINE g_jump              LIKE type_file.num10    #查詢指定的筆數
DEFINE g_no_ask            LIKE type_file.num5     #是否開啟指定筆視窗
DEFINE g_cnt               LIKE type_file.num10
DEFINE g_chr               LIKE type_file.chr1

MAIN
  OPTIONS
         INPUT NO WRAP
      DEFER INTERRUPT
   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("COO")) THEN
      EXIT PROGRAM
   END IF
   CALL cl_used(g_prog,g_time,1) RETURNING g_time

  CALL cl_set_act_visible("first,previous",TRUE)

   LET g_forupd_sql = "SELECT * FROM tc_pxq_file WHERE tc_pxq01 = ? FOR UPDATE"
   LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
   DECLARE i727_cl CURSOR FROM g_forupd_sql

   OPEN WINDOW i727_w WITH FORM "coo/42f/cooi727"
         ATTRIBUTE (STYLE = g_win_style CLIPPED)
   CALL cl_set_locale_frm_name("cooi727")

   CALL cl_ui_init()

   CALL i727_menu()

   CLOSE WINDOW i727

   CALL cl_used(g_prog,g_time,2) RETURNING g_time     #计算使用时间


END MAIN

FUNCTION i727_menu()
DEFINE l_cmd string
    MENU ""
        BEFORE MENU
           CALL cl_navigator_setting(g_curs_index, g_row_count)

        ON ACTION insert                         #"A.輸入" HELP 32001
            LET g_action_choice="insert"
            CALL i727_a()

        ON ACTION query                          #"Q.查詢" HELP 32002
            LET g_action_choice="query"
            CALL i727_q()

        ON ACTION first                          #KEY(F)
            CALL i727_fetch('F')

        ON ACTION previous                       #"P.上筆" HELP 32004
            CALL i727_fetch('P')

        ON ACTION jump                           #KEY('/')
            CALL i727_fetch('/')

        ON ACTION next                           #"N.下筆" HELP 32003
            CALL i727_fetch('N')

        ON ACTION last                           #KEY(L)
            CALL i727_fetch('L')

        ON ACTION modify                         #"U.更改" HELP 32005
            LET g_action_choice="modify"
            CALL i727_u()

        ON ACTION delete                         #"R.取消" HELP 32006
            LET g_action_choice="delete"
            CALL i727_r()

        ON ACTION help                           #"H.說明" HELP 10102
            CALL cl_show_help()

        ON ACTION locale
           CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf

        ON ACTION exit                           #"Esc.結束"
           LET g_action_choice="exit"
           EXIT MENU

        ON ACTION close
  #COMMAND KEY(INTERRUPT) #FUN-9B0145
            LET INT_FLAG=FALSE    #MOD-570244 mars
            LET g_action_choice = "exit"
            EXIT MENU

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE MENU

        ON ACTION about         #MOD-4C0121
           CALL cl_about()      #MOD-4C0121

        ON ACTION controlg                       #KEY(CONTROL-G)
           CALL cl_cmdask()

        ON ACTION download_lnk  #FUN-B80190 --start--


                                 #FUN-B80190 --end--
    END MENU

END FUNCTION

FUNCTION i727_a()	#录入

	CLEAR FORM
	LET g_wc = NULL
	LET g_wc2 = NULL

	IF s_shut(0) THEN
      RETURN
  END IF

  INITIALIZE g_pxq.* LIKE tc_pxq_file.*	#***初始化

  LET g_pxq01_t = NULL

  LET g_pxq_t.* = g_pxq.*
  CALL cl_opmsg('a')

   WHILE TRUE
    	LET g_pxq.tc_pxquser=g_user
    	LET g_pxq.tc_pxqgrup=g_grup
    	LET g_pxq.tc_pxqdate=g_today
    	LET g_pxq.tc_pxqacti='Y'

	    CALL i727_i("a")

	    IF INT_FLAG THEN
	       INITIALIZE g_pxq.* TO NULL
	       LET INT_FLAG = 0
	       CALL cl_err('',9001,0)
	       EXIT WHILE
	    END IF

	   { IF cl_null(g_pxq.tc_pxq01) THEN
	       CONTINUE WHILE
	    END IF ***}

			INSERT INTO tc_pxq_file VALUES (g_pxq.*)
			IF SQLCA.sqlcode THEN
				CALL cl_err3("ins","tc_pxq_file",g_pxq.tc_pxq01,"",SQLCA.sqlcode,"","",0)
				CONTINUE WHILE
			ELSE
				SELECT tc_pxq01 INTO g_pxq.tc_pxq01 FROM tc_pxq_file WHERE tc_pxq01 = g_pxq.tc_pxq01
			END IF

	    LET g_rec_b = 0
	                                   #单身
      EXIT WHILE
   END WHILE
END FUNCTION

FUNCTION i727_i(p_cmd)	#单头
 	 DEFINE l_n         LIKE type_file.num5
   DEFINE p_cmd       LIKE type_file.chr1     #a是输入，u是更改
    DEFINE g_gen02     LIKE gen_file.gen02

   IF s_shut(0) THEN
      RETURN
   END IF

   DISPLAY BY NAME
   g_pxq.tc_pxqacti,
   g_pxq.tc_pxquser,
   g_pxq.tc_pxqgrup,
   g_pxq.tc_pxqmodu,
   g_pxq.tc_pxqdate

   CALL cl_set_head_visible("","YES")

   INPUT BY NAME
    g_pxq.tc_pxq01,
   	g_pxq.tc_pxq02,
   	g_pxq.tc_pxq03,
		g_pxq.tc_pxq04,
		g_pxq.tc_pxq05,
		g_pxq.tc_pxq06
       WITHOUT DEFAULTS

     BEFORE INPUT
         LET g_before_input_done = FALSE
         LET g_before_input_done = TRUE

     AFTER FIELD tc_pxq01  #带出姓名
     SELECT gen02 INTO g_gen02 FROM gen_file where gen01=g_pxq.tc_pxq01
     DISPLAY g_gen02 TO gen02

     IF NOT cl_null(g_pxq.tc_pxq01) THEN
     	IF p_cmd = "a" OR (p_cmd = "u" AND g_pxq.tc_pxq01 != g_pxq01_t) THEN   #新增或者修改的时候
						SELECT count(*) INTO l_n FROM tc_pxq_file WHERE tc_pxq01 = g_pxq.tc_pxq01 AND tc_pxq03<200 AND tc_pxq01 IN (SELECT gen02 FROM gen_file)
						IF  l_n > 0 THEN
							CALL cl_err(g_pxq.tc_pxq01,-239,1)
							NEXT FIELD tc_pxq01
     	                  END IF
     	                  NEXT FIELD tc_pxq02
       END IF
      END IF

     AFTER FIELD tc_pxq03	 #大于0

     IF g_pxq.tc_pxq03<=0 THEN
     	CALL cl_err(g_pxq.tc_pxq03,19876,1)
     	NEXT FIELD tc_pxq03
     END IF

     AFTER FIELD tc_pxq05	 #卡号不为空
				IF NOT cl_null(g_pxq.tc_pxq04) THEN
					IF cl_null(g_pxq.tc_pxq05) THEN
						CALL cl_err(g_pxq.tc_pxq05,-100,1)
						NEXT FIELD tc_pxq05
					END IF
				END IF

     AFTER INPUT
      ON ACTION CONTROLR
         CALL cl_show_req_fields()

      ON ACTION CONTROLG
         CALL cl_cmdask()

    {  ON ACTION CONTROLF
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) }

      ON ACTION controlp		#开窗
         CASE
					WHEN INFIELD(tc_pxq01)
						CALL cl_init_qry_var()
						LET g_qryparam.form = "cq_gen2"
						LET g_qryparam.default1 = g_pxq.tc_pxq01
						CALL cl_create_qry() RETURNING g_pxq.tc_pxq01
						DISPLAY BY NAME g_pxq.tc_pxq01
						NEXT FIELD tc_pxq01
            OTHERWISE EXIT CASE
          END CASE

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

   END INPUT
END FUNCTION


FUNCTION i727_cs()  #抓取查询条件
   DEFINE lc_qbe_sn   LIKE gbm_file.gbm01

   CLEAR FORM
   #CALL g_spc.clear()

       INITIALIZE g_pxq.* TO NULL

      CONSTRUCT BY NAME g_wc 		#*** 将查询条件（单头输入的内容）放到g_wc中
      	ON tc_pxq01,tc_pxq02,tc_pxq03,tc_pxq04,tc_pxq05,tc_pxq06			# 单头查询条件
         BEFORE CONSTRUCT
            CALL cl_qbe_init()

         ON ACTION controlp
            CASE
               WHEN INFIELD(tc_pxq01) #员工编号   开窗
                  CALL cl_init_qry_var()
                  LET g_qryparam.form ="cq_gen2"
                  CALL cl_create_qry() RETURNING g_qryparam.multiret
                  DISPLAY g_qryparam.multiret TO tc_pxq01
                  NEXT FIELD tc_pxq01

               OTHERWISE EXIT CASE
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
            CALL cl_qbe_list() RETURNING lc_qbe_sn
            CALL cl_qbe_display_condition(lc_qbe_sn)

      END CONSTRUCT

      IF cl_null(g_wc2) THEN
        LET g_wc2=' 1=1'
      END IF

      #IF NOT cl_null(g_wc) THEN
     #   LET g_wc=' 1=1'
      #END IF


      IF INT_FLAG THEN
         RETURN
      END IF



      IF INT_FLAG THEN
         RETURN
      END IF


   IF g_wc2 = " 1=1" THEN                  # 未输入查询条件
      LET g_sql = "SELECT  tc_pxq01 FROM tc_pxq_file ",
                  " WHERE ", g_wc CLIPPED,
                  " ORDER BY tc_pxq01"
   ELSE                                   #输入查询条件
      LET g_sql = "SELECT UNIQUE tc_pxq_file. tc_pxq01 ",
                  "  FROM tc_pxq_file",
                  " WHERE ",g_wc CLIPPED, " AND ",g_wc2 CLIPPED,
                  " ORDER BY tc_pxq01"

   END IF

   PREPARE i727_prepare FROM g_sql
   DECLARE i727_cs                         #SCROLL CURSOR
       SCROLL CURSOR WITH HOLD FOR i727_prepare

   IF g_wc2 = " 1=1" THEN                  # 查询资料笔数
      LET g_sql="SELECT COUNT(*) FROM tc_pxq_file WHERE ",g_wc CLIPPED
   ELSE
      LET g_sql="SELECT COUNT(DISTINCT tc_pxq01) FROM tc_pxq_file WHERE ",
                g_wc CLIPPED," AND ",g_wc2 CLIPPED
   END IF

   PREPARE i727_precount FROM g_sql
   DECLARE i727_count CURSOR FOR i727_precount
END FUNCTION

FUNCTION i727_q() #查询

   LET g_row_count = 0
   LET g_curs_index = 0
   CALL cl_navigator_setting( g_curs_index, g_row_count )
   MESSAGE ""
   CALL cl_opmsg('q')
   CLEAR FORM
   #CALL g_spc.clear()
   DISPLAY ' ' TO FORMONLY.cnt        #清空总笔数

   CALL i727_cs()

   IF INT_FLAG THEN
      LET INT_FLAG = 0
      INITIALIZE g_pxq.* TO NULL
      RETURN
   END IF

   OPEN i727_cs                            #
   IF SQLCA.sqlcode THEN
      CALL cl_err('',SQLCA.sqlcode,0)
      INITIALIZE g_pxq.* TO NULL
   ELSE
      OPEN i727_count
      FETCH i727_count INTO g_row_count
      DISPLAY g_row_count TO FORMONLY.cnt

      CALL i727_fetch('F')                  # 回到第一笔
   END IF

END FUNCTION


FUNCTION i727_fetch(p_flag)  #调到指定笔数
DEFINE p_flag          LIKE type_file.chr1

   CASE p_flag
      WHEN 'N' FETCH NEXT     i727_cs INTO g_pxq.tc_pxq01
      WHEN 'P' FETCH PREVIOUS i727_cs INTO g_pxq.tc_pxq01
      WHEN 'F' FETCH FIRST    i727_cs INTO g_pxq.tc_pxq01
      WHEN 'L' FETCH LAST     i727_cs INTO g_pxq.tc_pxq01
      WHEN '/'
            IF (NOT g_no_ask) THEN      #No.FUN-6A0067
                CALL cl_getmsg('fetch',g_lang) RETURNING g_msg
                LET INT_FLAG = 0
                PROMPT g_msg CLIPPED,': ' FOR g_jump
                   ON IDLE g_idle_seconds
                      CALL cl_on_idle()

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121

                END PROMPT
                IF INT_FLAG THEN
                   LET INT_FLAG = 0
                   EXIT CASE
                END IF
            END IF
            FETCH ABSOLUTE g_jump i727_cs INTO g_pxq.tc_pxq01
            LET g_no_ask = FALSE     #No.FUN-6A0067
   END CASE

   IF SQLCA.sqlcode THEN
      CALL cl_err(g_pxq.tc_pxq01,SQLCA.sqlcode,0)
      INITIALIZE g_pxq.* TO NULL               #No.FUN-6A0162
      RETURN
   ELSE
      CASE p_flag
         WHEN 'F' LET g_curs_index = 1
         WHEN 'P' LET g_curs_index = g_curs_index - 1
         WHEN 'N' LET g_curs_index = g_curs_index + 1
         WHEN 'L' LET g_curs_index = g_row_count
         WHEN '/' LET g_curs_index = g_jump
      END CASE
      #CALL cl_navigator_setting( g_curs_index, g_row_count )
      DISPLAY g_curs_index TO FORMONLY.idx                    #No.FUN-4A0089
   END IF

   SELECT * INTO g_pxq.* FROM tc_pxq_file WHERE tc_pxq01 = g_pxq.tc_pxq01
   IF SQLCA.sqlcode THEN
      CALL cl_err3("sel","tc_pxq_file","","",SQLCA.sqlcode,"","",1)  #No.FUN-660129
      INITIALIZE g_pxq.* TO NULL
      RETURN
   END IF

   LET g_data_owner = g_pxq.tc_pxquser      #FUN-4C0056 add
   LET g_data_group = g_pxq.tc_pxqgrup      #FUN-4C0056 add

   CALL i727_show()
END FUNCTION


FUNCTION i727_show()  #显示查询的数据

LET g_pxq_t.* = g_pxq.*                #保存單頭舊值
 #DISPLAY BY NAME g_pxq.*			# 显示该record的所有值显示到画面，用*代替了
					# 显示该record的所有值显示到画面
DISPLAY g_pxq.tc_pxq01 TO tc_pxq01
DISPLAY g_pxq.tc_pxq02 TO tc_pxq02
DISPLAY g_pxq.tc_pxq03 TO tc_pxq03
DISPLAY g_pxq.tc_pxq04 TO tc_pxq04
DISPLAY g_pxq.tc_pxq05 TO tc_pxq05
DISPLAY g_pxq.tc_pxq06 TO tc_pxq06

   CALL i727_tc_pxq012gen02('d')		# 显示出tc_pxq01 带出来的gen02的值
   #CALL i727_b_fill(g_wc2)                 #單身
   CALL cl_show_fld_cont()
END FUNCTION


FUNCTION i727_tc_pxq012gen02(p_cmd)  #带出员工姓名
DEFINE l_gen02   LIKE gen_file.gen02,
               p_cmd     LIKE type_file.chr1

    SELECT gen02 INTO l_gen02 FROM gen_file
        WHERE gen01=g_pxq.tc_pxq01

    IF p_cmd ='d' THEN
    	    DISPLAY l_gen02 TO FORMONLY.gen02
    END IF

END FUNCTION


FUNCTION i727_r()	#删除
   IF s_shut(0) THEN
      RETURN
   END IF
   IF g_pxq.tc_pxq01 IS NULL THEN
      CALL cl_err("",-400,0)
      RETURN
   END IF

   SELECT * INTO g_pxq.* FROM tc_pxq_file
   WHERE pxq01=g_pxq.tc_pxq01

 BEGIN WORK
      OPEN i727_cl USING g_pxq.tc_pxq01

    IF STATUS THEN
        CALL cl_err("OPEN i252_cl:", STATUS, 1)
        CLOSE i727_cl
        ROLLBACK WORK
        RETURN
   END IF

   FETCH i727_cl INTO g_pxq.* #锁住将被更改或取消的数据

   IF SQLCA.sqlcode THEN
      CALL cl_err(g_pxq.tc_pxq01,SQLCA.sqlcode,0)#资料被他人LOCK
      ROLLBACK WORK
      RETURN
   END IF

   CALL i727_show()

  IF cl_delh(0,0) THEN          #询问是否删除此笔资料
      INITIALIZE g_doc.* TO NULL
      LET g_doc.column1 = " tc_pxq01"
      LET g_doc.value1 = g_pxq.tc_pxq01

       CALL cl_del_doc()

      DELETE FROM tc_pxq_file WHERE tc_pxq01 =g_pxq.tc_pxq01  #单头单身数据一并删除
      DELETE FROM tc_spc_file  WHERE tc_spc01 = g_pxq.tc_pxq01

      CLEAR FORM   #删除后将画面清空
      #CALL g_spc.clear()

      OPEN i727_count  #重新计算总笔数

       IF STATUS THEN
         CLOSE i727_cs
         CLOSE i727_count
         COMMIT WORK
         RETURN
      END IF

      FETCH i727_count INTO g_row_count

      IF STATUS OR (cl_null(g_row_count) OR  g_row_count = 0 ) THEN
         CLOSE i727_cs
         CLOSE i727_count
         COMMIT WORK
         RETURN
      END IF

      DISPLAY g_row_count TO FORMONLY.cnt

      OPEN i727_cs

      IF g_curs_index = g_row_count + 1 THEN
         LET g_jump = g_row_count
         CALL i727_fetch('L')
      ELSE
         LET g_jump = g_curs_index
         LET g_no_ask = TRUE
         CALL i727_fetch('/')
      END IF
   END IF

   CLOSE i727_cl
   COMMIT WORK
   CALL cl_flow_notify(g_pxq.tc_pxq01,'D')     # 透过JavaMail 传送工作流程通知

END FUNCTION


FUNCTION i727_u()	#修改
  IF s_shut(0) THEN
       RETURN
   END IF

   IF cl_null(g_pxq.tc_pxq01) THEN
       CALL cl_err('',-400,0)
       RETURN
   END IF

   SELECT * INTO g_pxq.* FROM tc_pxq_file
   WHERE tc_pxq01=g_pxq.tc_pxq01

   IF g_pxq.tc_pxqacti ='N' THEN                     #检查资料是否为无效
       CALL cl_err(g_pxq.tc_pxq01,'mfg1000',0)
       RETURN
   END IF

   MESSAGE " "
   CALL cl_opmsg('u')
   LET g_pxq01_t = g_pxq.tc_pxq01

   BEGIN WORK

   OPEN i727_cl USING g_pxq.tc_pxq01
   IF STATUS THEN
      CALL cl_err("OPEN i727cl:", STATUS, 1)
      CLOSE i727_cl
      ROLLBACK WORK
      RETURN
   END IF

   FETCH i727_cl INTO g_pxq.*                # 锁住将被更改或取消的数据
   IF SQLCA.sqlcode THEN
       CALL cl_err(g_pxq.tc_pxq01,SQLCA.sqlcode,0)# 资料被他人LOCK
       CLOSE i727_cl
       ROLLBACK WORK
       RETURN
   END IF

   CALL i727_show()

   WHILE TRUE
      LET g_pxq01_t = g_pxq.tc_pxq01
      LET g_pxq_o.* = g_pxq.*
     LET g_pxq.tc_pxquser=g_user
    	LET g_pxq.tc_pxqgrup=g_grup
    	LET g_pxq.tc_pxqdate=g_today
    	LET g_pxq.tc_pxqacti='Y'
      #LET g)pmw.pmw07 = g_pmw07


      CALL i727_i("u")                      #字段更改

      IF INT_FLAG THEN
          LET INT_FLAG = 0
          LET g_pxq.*=g_pxq_t.*
          CALL i727_show()
          CALL cl_err('','9001',0)
          EXIT WHILE
      END IF

      IF g_pxq.tc_pxq01 != g_pxq01_t THEN            # 更改单号
         UPDATE tc_spc_file SET tc_spc01 = g_pxq.tc_pxq01
          WHERE tc_spc01 = g_pxq01_t
         IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
            CALL cl_err3("upd","tc_spc_file",g_pxq01_t,"",SQLCA.sqlcode,"","tc_spc",1)  #No.FUN-660129
            CONTINUE WHILE
         END IF
      END IF

      UPDATE tc_pxq_file SET tc_pxq_file.* = g_pxq.*
       WHERE tc_pxq01 = g_pxq01_t

    IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
       CALL cl_err3("upd","tc_pxq_file","","",SQLCA.sqlcode,"","",1)
       CONTINUE WHILE
    END IF
    EXIT WHILE
     {WHERE ROWID = g_pmw_rowid         #***?
    IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
       CALL cl_err3("upd","tc_pxq_file","","",SQLCA.sqlcode,"","",1)
       CONTINUE WHILE
    END IF
    EXIT WHILE}
 END WHILE

 CLOSE i727_cl
 COMMIT WORK
 CALL cl_flow_notify(g_pxq.tc_pxq01,'U')
 #CALL i727_b_fill("1=1")

END FUNCTION