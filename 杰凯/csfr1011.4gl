# Prog. Version..: '5.25.07-12.03.03(00010)'     #
#
# Pattern name...: csfr101.4gl
# Descriptions...: 生产通知单列印
# Date&Auther....: 130327 by xufeng 130327
 
DATABASE ds
 
GLOBALS "../../../tiptop/config/top.global"
 
DEFINE tm  RECORD                # Print condition RECORD
	   wc         STRING,
           sfb82      LIKE sfb_file.sfb82          # Where condition    TQC-630166
              END RECORD
 
DEFINE   g_i             LIKE type_file.num5     #count/index for any purpose        #No.FUN-680121 SMALLINT
#No.FUN-710082--begin
DEFINE  g_sql      STRING                                                       
DEFINE  l_table,l_table1,l_table2    STRING                                                       
DEFINE  l_str      STRING   
DEFINE  i          LIKE type_file.num5 
DEFINE  j          LIKE type_file.num5 
#define g_sfbud04   LIKE sfb_file.sfbud04    # mark by xufeng 130701
define g_sfbud04   string
DEFINE g_ima06     LIKE ima_file.ima06
DEFINE g_only      LIKE sfb_file.sfb13  #add huxy130830
DEFINE p_flag      LIKE type_file.num5 
DEFINE p_sfb01     STRING               #add huxy130930 
#No.FUN-710082--end  
MAIN
   OPTIONS
       INPUT NO WRAP
   DEFER INTERRUPT                # Supress DEL key function
 
   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF
 
   WHENEVER ERROR CALL cl_err_msg_log
 
   IF (NOT cl_setup("csf")) THEN
      EXIT PROGRAM
   END IF
   CALL cl_used(g_prog,g_time,1) RETURNING g_time #No.FUN-690123
 
 
   LET g_pdate = ARG_VAL(1)        # Get arguments from command line
   LET g_towhom = ARG_VAL(2)
   LET g_rlang = ARG_VAL(3)
   LET g_bgjob = ARG_VAL(4)
   LET g_prtway = ARG_VAL(5)
   LET g_copies = ARG_VAL(6)
  #LET tm.wc = ARG_VAL(7)
   LET g_sfbud04= ARG_VAL(7)
   LET g_sfbud04=cl_replace_str(g_sfbud04,'\\\"',"'")
   LET g_ima06= ARG_VAL(8)
   LET g_only = ARG_VAL(9)      #add huxy130830
   LET p_flag = ARG_VAL(10)     #add huxy130911
   LET p_sfb01 = ARG_VAL(11)     #add huxy130930
   LET p_sfb01=cl_replace_str(p_sfb01,'\\\"',"'")
   #LET g_argv1 = ARG_VAL(8)  #TQC-610080 
   #LET g_argv2 = ARG_VAL(9)  #TQC-610080
   #No.FUN-570264 --start--
 # LET g_rep_user = ARG_VAL(8)
   LET g_rep_clas = ARG_VAL(12)                   #mod huxy130830 (9)--->(10)
   LET g_template = ARG_VAL(13)                   #mod huxy130830 (10)--->(11)
   LET g_rpt_name = ARG_VAL(14)  #No.FUN-7C0078   #mod huxy130830 (11)--->(12)
   #No.FUN-570264 ---end---

   #No.FUN-710082--begin
   LET g_sql ="oea01.oea_file.oea01,",
	      "muima01.ima_file.ima01,",
	      "muima021.ima_file.ima021,",
	      "lt1ima01.ima_file.ima01,",
	      "lt1ima021.ima_file.ima021,",
	      "lt2ima01.ima_file.ima01,",
	      "lt2ima021.ima_file.ima021,",
	      "sum1.oeb_file.oeb12,",
	      "sum2.oeb_file.oeb12,",
	      "yanse.type_file.chr50,",
	      "mashu.oeb_file.oeb12,",
	      "oeb11.oeb_file.oeb11,",
	      "oea03.oea_file.oea03,",
	      "oea032.oea_file.oea032,",
	    # "sfb82.sfb_file.sfb82,",
	      "sfb82.type_file.chr20,",
	    # "sfb01.sfb_file.sfb01,",
	      "sfb01.type_file.chr200,",    # add by xufeng 130704
	      "sfb13.sfb_file.sfb13,",
	      "sfu02_1.sfu_file.sfu02,",
	      "sfu02_2.sfu_file.sfu02,",
	      "azf03.type_file.chr1000,",
	      "oao06.oao_file.oao06,",       # 25
              "sfbud07.sfb_file.sfbud07,",    #add huxy130819 
              "sfbud06.sfb_file.sfbud06,",    #add huxy130829 
              "oea14.oea_file.oea14,",        #add huxy130823
              "sfb01_a.sfb_file.sfb01,",        #add huxy130830
              "l_numbe.type_file.chr50,",       #add huxy130912 
              "l_num.type_file.chr50,",         #add huxy130916 
	      "yanse2.type_file.chr50,",        #add huxy140227
	      "yanse3.type_file.chr50,",          #add huxy140227
	      "oea1015.oea_file.oea1015,",     #add by pulf 150122
        "lt3ima021.ima_file.ima021"      #add by pulf 150122

   LET l_table = cl_prt_temptable('csfr101',g_sql) CLIPPED
   IF l_table = -1 THEN EXIT PROGRAM END IF
   #No.FUN-710082--end  
 
 
   LET g_sql ="oea01.oea_file.oea01,",
	      "muima01.ima_file.ima01,",
              "lt1ima01.ima_file.ima01,",
              "lt2ima01.ima_file.ima01,",
              "yanse.type_file.chr50,",
              "cd.type_file.chr20,",
              "cddw.type_file.chr20,",
            # "oeb12.oeb_file.oeb12,",
              "oeb12.type_file.chr20,",
              "other.type_file.chr20,",
            # "sfb08.sfb_file.sfb08,",    
              "sfb08.type_file.chr20,",    
	      "buf1.type_file.chr20,",   # add by xufeng 130523  # 入库数量
	      "rownum1.type_file.num5,",  
	    # "rownum.type_file.num10"    # 9
              "dbcd.type_file.chr20,",   #add huxy130801
              "sfbud07.sfb_file.sfbud07,", #add huxy130820
              "sfbud06.sfb_file.sfbud06" #add huxy130829
	      ,",oeb11.oeb_file.oeb11,",  # add by xufeng 130906
	      "yanse2.type_file.chr50,",        #add huxy140227
	      "yanse3.type_file.chr50"          #add huxy140227

   LET l_table1 = cl_prt_temptable('csfr101',g_sql) CLIPPED
   IF l_table1 = -1 THEN EXIT PROGRAM END IF
 
   LET g_sql ="oea01.oea_file.oea01,",
              "muima01.ima_file.ima01,",
	      "lt1ima01.ima_file.ima01,",
	      "lt2ima01.ima_file.ima01,",
              "yanse.type_file.chr50,",
	      "ima01.ima_file.ima01,",
	      "ima02.ima_file.ima02,",
	      "ima021.ima_file.ima021,",
	      "yanse1.type_file.chr50,",
	      "yanse2.type_file.chr50,",
	      "yanse3.type_file.chr50,",
	      "sum3.oeb_file.oeb12,",
	      "oebud02.oeb_file.oebud02,",
              "sfa12.sfa_file.sfa12,",        #huxy1130630
              "sfbud06.sfb_file.sfbud06,",    #add huxy131018
              "sfa161.sfa_file.sfa161,",      #add huxy131018
              "sfa12_1.sfa_file.sfa12"        #add huxy131018
   LET l_table2 = cl_prt_temptable('csfr101',g_sql) CLIPPED
   IF l_table2 = -1 THEN EXIT PROGRAM END IF

   IF cl_null(g_bgjob) OR g_bgjob = 'N'        # If background job sw is off
      THEN CALL csfr101_tm(0,0)        # Input print condition
      ELSE CALL csfr101()            # Read data and create out-file
   END IF
   CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
END MAIN
 
FUNCTION csfr101_tm(p_row,p_col)
DEFINE lc_qbe_sn      LIKE gbm_file.gbm01   #No.FUN-580031
   DEFINE p_row,p_col,l_cn LIKE type_file.num5,          #No.FUN-680121 SMALLINT
          l_dir        LIKE type_file.chr1,         #No.FUN-680121 VARCHAR(1)#Direction Flag
          l_cmd        LIKE type_file.chr1000       #No.FUN-680121 VARCHAR(400)

   LET p_row = 5 LET p_col =20
   OPEN WINDOW csfr101_w AT p_row,p_col
        WITH FORM "csf/42f/csfr300"
         ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN 

   CALL cl_ui_init()
 
   CALL cl_set_comp_visible("sfb82",FALSE)

   CALL cl_opmsg('p')
   INITIALIZE tm.* TO NULL            # Default condition
   LET tm.sfb82 = g_grup
   LET g_bgjob = 'N'
   LET g_rlang = g_lang
  
 
   WHILE TRUE
     CONSTRUCT BY NAME tm.wc ON oea01,oea02,oea72,oea03,oeaoriu,sfb01,sfb81
         #No.FUN-580031 --start--
         BEFORE CONSTRUCT
             CALL cl_qbe_init()
         #No.FUN-580031 ---end---
 
       ON ACTION locale
          LET g_action_choice = "locale"
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
          EXIT CONSTRUCT
 
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT
 
       ON ACTION exit
          LET INT_FLAG = 1
          EXIT CONSTRUCT
 
       ON ACTION CONTROLG CALL cl_cmdask()    #No.TQC-740008 add
 
 
        #FUN-7A0077---add---str---
         ON ACTION controlp
            CASE
               WHEN INFIELD(oeaoriu)                                              
                    CALL cl_init_qry_var()                                      
                    LET g_qryparam.form     = "q_gen"                           
                    LET g_qryparam.state    = "c"                               
                    CALL cl_create_qry() RETURNING g_qryparam.multiret          
                    DISPLAY g_qryparam.multiret TO oeaoriu                      
                    NEXT FIELD oeaoriu

               WHEN INFIELD(sfb01)                                              
                    CALL cl_init_qry_var()                                      
                    LET g_qryparam.form     = "q_sfb1103"                           
                    LET g_qryparam.state    = "c"                               
                    CALL cl_create_qry() RETURNING g_qryparam.multiret          
                    DISPLAY g_qryparam.multiret TO sfb01                        
                    NEXT FIELD sfb01                              
                                                                                                                        
               WHEN INFIELD(oea01)
                    CALL cl_init_qry_var()
                    LET g_qryparam.state = "c"
          #         LET g_qryparam.where = " sfb82 = '",g_grup,"' "
                    LET g_qryparam.form     = "cq_sfbud04"
                    CALL cl_create_qry() RETURNING g_qryparam.multiret
                    DISPLAY g_qryparam.multiret TO oea01
                    NEXT FIELD oea01

               WHEN INFIELD(oea03)
                    CALL cl_init_qry_var()
                    LET g_qryparam.state = "c"
                    LET g_qryparam.form     = "q_occ"
                    CALL cl_create_qry() RETURNING g_qryparam.multiret
                    DISPLAY g_qryparam.multiret TO oea03
                    NEXT FIELD oea03
            END CASE
        #FUN-7A0077---add---end---
 
     END CONSTRUCT
 
     IF g_action_choice = "locale" THEN
        LET g_action_choice = ""
        CALL cl_dynamic_locale()
        CONTINUE WHILE
     END IF
 
     IF INT_FLAG THEN
        LET INT_FLAG = 0
        EXIT WHILE
     END IF
 
     IF tm.wc=" 1=1 " THEN
        CALL cl_err(' ','9046',0)
        CONTINUE WHILE
     END IF
     DISPLAY BY NAME tm.sfb82         # Condition
     INPUT BY NAME tm.sfb82 WITHOUT DEFAULTS
         #No.FUN-580031 --start--
         BEFORE INPUT
             CALL cl_qbe_display_condition(lc_qbe_sn)
         #No.FUN-580031 ---end---
 

                  AFTER FIELD sfb82
                     IF NOT cl_null(tm.sfb82) THEN
                        SELECT count(*) INTO l_cn
                                FROM gem_file
                         WHERE gem01=tm.sfb82
                            IF l_cn = 0 THEN 
                               CALL cl_err(tm.sfb82,'abg-011',0)
                               NEXT FIELD sfb82
                            END IF
                     END IF
			  
        ON ACTION CONTROLZ
           CALL cl_show_req_fields()
        ON ACTION CONTROLG CALL cl_cmdask()    # Command execution
 
        ON ACTION CONTROLP
     	   CASE
               WHEN INFIELD(sfb82)
                    CALL cl_init_qry_var()
                    LET g_qryparam.form     = "q_gem"
                    CALL cl_create_qry() RETURNING tm.sfb82
                    DISPLAY tm.sfb82 TO sfb82
                    NEXT FIELD sfb82
	   END CASE
 
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT
 
        ON ACTION exit
            LET INT_FLAG = 1
            EXIT INPUT
         #No.FUN-580031 --start--
         ON ACTION qbe_save
            CALL cl_qbe_save()
         #No.FUN-580031 ---end---
 
     END INPUT
 
     IF INT_FLAG THEN
        LET INT_FLAG = 0
        EXIT WHILE
     END IF
     IF g_bgjob = 'Y' THEN
        SELECT zz08 INTO l_cmd FROM zz_file    #get exec cmd (fglgo xxxx)
               WHERE zz01='csfr101'
        IF SQLCA.sqlcode OR l_cmd IS NULL THEN
           CALL cl_err('csfr101','9031',1)  
        ELSE
           LET tm.wc=cl_replace_str(tm.wc, "'", "\"")
           LET l_cmd = l_cmd CLIPPED,        #(at time fglgo xxxx p1 p2 p3)
                           " '",g_pdate CLIPPED,"'",
                           " '",g_towhom CLIPPED,"'",
                           #" '",g_lang CLIPPED,"'", #No.FUN-7C0078
                         " '",g_rlang CLIPPED,"'", #No.FUN-7C0078
                           " '",g_bgjob CLIPPED,"'",
                           " '",g_prtway CLIPPED,"'",
                           " '",g_copies CLIPPED,"'",
                           " '",tm.wc CLIPPED,"'",
                          #TQC-610080-begin
                          # " '",tm.more CLIPPED,"'",
                          # " '",g_argv1 CLIPPED,"'",
                          # " '",g_argv2 CLIPPED,"'",
                          #TQC-610080-end
                           " '",g_rep_user CLIPPED,"'",           #No.FUN-570264
                           " '",g_rep_clas CLIPPED,"'",           #No.FUN-570264
                           " '",g_template CLIPPED,"'",           #No.FUN-570264
                         " '",g_rpt_name CLIPPED,"'"            #No.FUN-7C0078
           CALL cl_cmdat('csfr101',g_time,l_cmd)    # Execute cmd at later time
        END IF
        CLOSE WINDOW csfr101_w
        CALL cl_used(g_prog,g_time,2) RETURNING g_time #No.FUN-690123
        EXIT PROGRAM
     END IF
     CALL cl_wait()
     CALL csfr101()
     ERROR ""
   END WHILE
   CLOSE WINDOW csfr101_w
 
END FUNCTION
 
 
FUNCTION csfr101()
   DEFINE l_name    LIKE type_file.chr20,         #No.FUN-680121 VARCHAR(20)# External(Disk) file name
#       l_time          LIKE type_file.chr8        #No.FUN-6A0090
#         l_sql     LIKE type_file.chr1000,       # RDSQL STATEMENT  TQC-630166          #No.FUN-680121 VARCHAR(1000)
          l_sql,ll_sql     STRING,                       # RDSQL STATEMENT  TQC-630166
          l_chr     LIKE type_file.chr1,          #No.FUN-680121 VARCHAR(1)
          l_za05    LIKE type_file.chr1000,       #No.FUN-680121 VARCHAR(40)
#         l_order    ARRAY[5] OF LIKE apm_file.apm08,#No.FUN-680121 VARCHAR(10) # TQC-6A0079
          sr            RECORD
		  oea01       LIKE oea_file.oea01,
		  muima01     LIKE ima_file.ima01, 
		  muima021    LIKE ima_file.ima021, 
		  lt1ima01     LIKE ima_file.ima01,
		  lt1ima021    LIKE ima_file.ima021,
		  lt2ima01     LIKE ima_file.ima01,
		  lt2ima021    LIKE ima_file.ima021,
		  sum1        LIKE oeb_file.oeb12,
		  sum2        LIKE oeb_file.oeb12,
	          yanse       LIKE type_file.chr50,
		  mashu       LIKE oeb_file.oeb12,
		  oeb11       LIKE oeb_file.oeb11,
		  oea03       LIKE oea_file.oea03,
		  oea032      LIKE oea_file.oea032,
		# sfb82       LIKE sfb_file.sfb82,
		  sfb82       LIKE type_file.chr20,
		# sfb01       LIKE sfb_file.sfb01,
		  sfb01       LIKE type_file.chr200,  # add by xufeng 130704
		  sfb13       LIKE sfb_file.sfb13,
		  sfu02_1     LIKE sfu_file.sfu02,
		  sfu02_2     LIKE sfu_file.sfu02,
		  azf03       LIKE type_file.chr1000,
		  oao06       LIKE oao_file.oao06,
      sfbud07     LIKE sfb_file.sfbud07,   #add huxy130819
      sfbud06     LIKE sfb_file.sfbud06,   #add huxy130829
      oea14       LIKE oea_file.oea14,     #add huxy130823
      sfb01_a     LIKE sfb_file.sfb01,     #add huxy130830
	    yanse2       LIKE type_file.chr50,   #add huxy140227
	    yanse3       LIKE type_file.chr50    #add huxy140227
                        END RECORD,
	    sr1  RECORD
		  oea01       LIKE oea_file.oea01,
		  muima01     LIKE ima_file.ima01,
		  lt1ima01      LIKE ima_file.ima01,
		  lt2ima01      LIKE ima_file.ima01,
		  yanse             LIKE type_file.chr50,
		  cd	                 LIKE type_file.chr20,
		  cddw	            LIKE type_file.chr20,
		# oeb12	       LIKE oeb_file.oeb12,
		  oeb12	            LIKE type_file.chr20,
	 	  other               LIKE type_file.chr20,
		# sfb08	            LIKE sfb_file.sfb08,
		  sfb08	             LIKE type_file.chr20,
		  buf1	             LIKE type_file.chr20,
		  rownum1      LIKE type_file.num5
             ,dbcd               LIKE type_file.chr20        #add huxy130801
             ,sfbud07        LIKE sfb_file.sfbud07    #add huxy130820 
             ,sfbud06        LIKE sfb_file.sfbud06    #add huxy130829 
	     ,oeb11          LIKE oeb_file.oeb11,     # add by xufeng 130906
	          yanse2       LIKE type_file.chr50,   #add huxy140227
	          yanse3       LIKE type_file.chr50    #add huxy140227
		 END RECORD,
	    sr2  RECORD 
		  oea01       LIKE oea_file.oea01,
		  muima01     LIKE ima_file.ima01,
		  lt1ima01     LIKE ima_file.ima01,
		  lt2ima01     LIKE ima_file.ima01,
		  yanse       LIKE type_file.chr50,
		  ima01	      LIKE ima_file.ima01,
		  ima02	      LIKE ima_file.ima02,
		  ima021      LIKE ima_file.ima021,
		  yanse1      LIKE type_file.chr50,
		  yanse2      LIKE type_file.chr50,
		  yanse3      LIKE type_file.chr50,
		  sum3        LIKE oeb_file.oeb12,
		  oebud02     LIKE oeb_file.oebud02,
                  sfa12       LIKE sfa_file.sfa12,   #add huxy1130630	
                  sfbud06     LIKE sfb_file.sfbud06, #add huxy131018
                  sfa161      LIKE sfa_file.sfa161,  #add huxy131018
                  sfa12_1     LIKE sfa_file.sfa12    #add huxy131018              
		 END RECORD
DEFINE   l_str_tok    base.StringTokenizer 
DEFINE l_sfa          RECORD LIKE sfa_file.*
DEFINE l_sfb          RECORD LIKE sfb_file.*
#DEFINE l_memo         LIKE type_file.chr200
DEFINE l_memo         LIKE oao_file.oao06    #add by wangww150917
DEFINE l_tc_bom12,l_tc_bom12_01     LIKE tc_bom_file.tc_bom12
DEFINE l_cn,l_n       LIKE type_file.num5
DEFINE l_aga01        LIKE aga_file.aga01
DEFINE l_char         LIKE type_file.chr50
DEFINE l_factor       LIKE type_file.num20_6
DEFINE l_buf          LIKE type_file.chr200
DEFINE p_param_list   STRING
DEFINE ls_sql,l_sql3        STRING
DEFINE l_agb03	      LIKE agb_file.agb03
DEFINE l_sfa03        LIKE sfa_file.sfa03
DEFINE l_imx01_t      LIKE imx_file.imx01
DEFINE l_imx02_t      LIKE imx_file.imx02
DEFINE l_imx03_t      LIKE imx_file.imx02   #add huxy131021
DEFINE l_imx04_t      LIKE imx_file.imx04
DEFINE t_imx01        LIKE imx_file.imx01
DEFINE l_bdys         LIKE type_file.chr50
DEFINE t_sfb01        LIKE sfb_file.sfb01
DEFINE l_bzyq         LIKE type_file.chr1000
DEFINE l_ys           LIKE type_file.chr50
DEFINE l_kwc,l_lyc    LIKE type_file.chr20
DEFINE l_sum_oeb12,l_sum_sfb08  LIKE oeb_file.oeb12
DEFINE l_sum_dbcd     LIKE oeb_file.oebud09            #add huxy130801
DEFINE l_oeb11        LIKE oeb_file.oeb11
DEFINE l_tc_imx2      RECORD LIKE tc_imx_file.*
DEFINE l_bmcl         LIKE imx_file.imx01
DEFINE l_sfb01	      LIKE sfb_file.sfb01 
DEFINE l_string	      LIKE type_file.chr200
DEFINE l_mashu        LIKE oeb_file.oeb12
DEFINE l_sfb01_1      LIKE sfb_file.sfb01    #add huxy130911
DEFINE l_yaxin        LIKE type_file.chr200  #add huxy130911
DEFINE l_oebud01      LIKE oeb_file.oebud01  #add huxy130911
DEFINE l_tc_agb03     LIKE tc_agb_file.tc_agb03 #add huxy130911
DEFINE l_numbe,l_numbe1,l_num        LIKE type_file.chr50   #add huxy130912
DEFINE numbe          LIKE type_file.num5    #add huxy130912
DEFINE ll_today VARCHAR(40)
DEFINE l_sfbud10      LIKE sfb_file.sfbud10 
DEFINE g_msg,l_oeb12_a          STRING 
DEFINE l_nn           LIKE type_file.num5
DEFINE l_nn1,ii,kk           LIKE type_file.num5    #add huxy131010
DEFINE l_yanse2,l_yanse3     LIKE type_file.chr50   #add huxy131021
DEFINE l_add,l_add1,l_add2   LIKE type_file.chr200  #add huxy131129
DEFINE l_oea1015    LIKE oea_file.oea1015    #add by pulf 150122
DEFINE l_ima021     LIKE ima_file.ima021     #add by pulf 150122

 #  DROP TABLE csfr101_tmp;
 #  CREATE TEMP TABLE csfr101_tmp
 #                (oea01       LIKE oea_file.oea01,
 #                 muima01     LIKE ima_file.ima01,
 #                 lt1ima01    LIKE ima_file.ima01,
 #                 lt2ima01    LIKE ima_file.ima01,
 #                 yanse       LIKE type_file.chr50,
 #                 cd          LIKE type_file.chr20,
 #                 cddw        LIKE type_file.chr20,
 #                 oeb12       LIKE type_file.chr20,
 #                 other       LIKE type_file.chr20,
 #                 sfb08       LIKE type_file.chr20,
 #                 buf1        LIKE type_file.chr20,
 #                 rownum1     LIKE type_file.num5,
 #                 dbcd        LIKE type_file.chr20,   #add huxy130801
 #                 sfbud07  LIKE sfb_file.sfbud07,     #add huxy130820 
 #                 sfbud06  LIKE sfb_file.sfbud06)#add huxy130829 

		   DROP TABLE csfr101_tmp;
		   CREATE TABLE csfr101_tmp
		                 (oea01        VARCHAR(20),
		                  muima01      VARCHAR(40),
		                  lt1ima01     VARCHAR(40),
		                  lt2ima01     VARCHAR(40),
		                  yanse        VARCHAR(50),
		                  cd           VARCHAR(20),
		                  cddw         VARCHAR(20),
		                  oeb12        VARCHAR(20),
		                  other        VARCHAR(20),
		                  sfb08        VARCHAR(20),
		                  buf1         VARCHAR(20),
		                  rownum1      SMALLINT,
		                  dbcd         VARCHAR(20),        #add huxy130801
		                  sfbud07   INTEGER,          #add huxy130820 
		                  sfbud06   VARCHAR(40)
			          ,oeb11    VARCHAR(40)     #add huxy130829   # add by xufeng 130906
                                  ,sfb01    VARCHAR(40), #add huxy130911
                                   yanse2   VARCHAR(50),  #add huxy140227 
                                   yanse3   VARCHAR(50) ) #add huxy140227
                 
  CALL cl_del_data(l_table)
  CALL cl_del_data(l_table1)
  CALL cl_del_data(l_table2)

     SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_rlang
      SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01 = 'csfr101'  
 
   LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,   #FUN-940008 add
               " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ",
               "        ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ? )"       #21   #huxy130819 add ?  #huxy120823 add ?  #huxy130829 add ?   #add huxy130830 ? #huxy130912 add ? #add ? huxy130916
                                                               # huxy140227huxy add 2?  #add 2? by pulf 150121
   PREPARE insert_prep FROM g_sql
   IF STATUS THEN
      CALL cl_err("insert_prep:",STATUS,1) EXIT PROGRAM
   END IF
 
   LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table1 CLIPPED,   #FUN-940008 add
               " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?) "      #12   #add ? huxy13081  #huxy130820 add ?    #add ? huxy130829
                                                               # huxy140227huxy add 2?  
   PREPARE insert_prep1 FROM g_sql
   IF STATUS THEN
      CALL cl_err("insert_prep1:",STATUS,1) EXIT PROGRAM
   END IF
	
   LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table2 CLIPPED,   #FUN-940008 add
               " VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?,?,?) "      #11   #huxy1130630   #huxy131018 3 add ?   #huxy131021 add 2?  
   PREPARE insert_prep2 FROM g_sql
   IF STATUS THEN
      CALL cl_err("insert_prep2:",STATUS,1) EXIT PROGRAM
   END IF

	 LET sr1.rownum1 = 0
	 LET l_sum_oeb12 = 0
	 LET l_sum_dbcd  = 0
	 LET l_sum_sfb08 = 0

     #   LET l_sql = " SELECT * ",
     #               "   FROM sfb_file ",
     #              #"  WHERE sfb87='Y' AND sfb04 IN ('2','3','4','5','6','7') AND ",tm.wc,
     #               "  WHERE sfb87='Y' AND sfb04 IN ('2','3','4','5','6','7') AND  sfbud04 = '",g_sfbud04,"'",
     #               "    AND (sfb86 IS NULL OR sfb86 = ' ')  "
     IF g_bgjob = 'Y' THEN     #add by pulf 150207
         LET l_sql = " SELECT sfb_file. * ",
                     "   FROM sfb_file,ima_file ",
                    #"  WHERE sfb87='Y' AND sfb04 IN ('2','3','4','5','6','7') AND ",tm.wc,
                    #"  WHERE sfb87='Y' AND sfb04 IN ('2','3','4','5','6','7') AND  sfbud04 = '",g_sfbud04,"'",   # mark by xufeng 130701
                     "  WHERE sfb87='Y' AND sfb04 IN ('2','3','4','5','6','7') AND  sfbud04 IN ",g_sfbud04," ", 
                     "    AND (sfb86 IS NULL OR sfb86 = ' ') AND sfb05=ima01(+) AND ima06 = '",g_ima06,"' ",
                     "    AND sfb13='",g_only,"' ",   #add huxy130830
                     "    AND sfb01 IN ",p_sfb01," ",  
		     "  ORDER BY sfbud04 "
		#add by pulf 150207------begin---------      
		  ELSE
		     LET l_sql = " SELECT sfb_file. * ",
                     "   FROM sfb_file,ima_file,oea_file ",
                     "  WHERE sfb87='Y' AND sfb04 IN ('2','3','4','5','6','7')  ", 
                     "    AND (sfb86 IS NULL OR sfb86 = ' ') AND sfb05=ima01(+) AND oea01=sfbud04(+) ",
                  #   "    AND sfb13='",g_only,"' ",   #add huxy130830
                  #   "    AND sfb01 IN ",p_sfb01," ", 
                     "  AND ",tm.wc clipped
		  END IF 
         #add by pulf 150207------end---------
         PREPARE r103_p2 FROM l_sql
         IF STATUS THEN CALL cl_err('p2:',STATUS,1) 
            CALL cl_used(g_prog,g_time,2) RETURNING g_time 
            EXIT PROGRAM 
         END IF

         CALL s_showmsg_init()   #add huxy130922

         DECLARE r103_c2 CURSOR FOR r103_p2
         FOREACH r103_c2 INTO l_sfb.*

         #add huxy130911--------------------------begin
        # tc_imx_file  #牙型
          LET l_str = ''
          SELECT tc_imx_file.* INTO l_tc_imx2.* FROM tc_imx_file LEFT join imx_file ON tc_imx01=imx00 WHERE imx000=l_sfb.sfb05
            LET l_str = l_tc_imx2.tc_imx001,'-',l_tc_imx2.tc_imx002,'-',l_tc_imx2.tc_imx003,'-',l_tc_imx2.tc_imx004,'-',
                        l_tc_imx2.tc_imx005,'-',l_tc_imx2.tc_imx006,'-',l_tc_imx2.tc_imx007,'-',l_tc_imx2.tc_imx008,'-',
                        l_tc_imx2.tc_imx009,'-',l_tc_imx2.tc_imx010,'-',l_tc_imx2.tc_imx011,'-',l_tc_imx2.tc_imx012,'-',
                        l_tc_imx2.tc_imx013,'-',l_tc_imx2.tc_imx014,'-',l_tc_imx2.tc_imx015,'-',l_tc_imx2.tc_imx016,'-',
                        l_tc_imx2.tc_imx017,'-',l_tc_imx2.tc_imx018,'-',l_tc_imx2.tc_imx019,'-',l_tc_imx2.tc_imx020,'-',
                        l_tc_imx2.tc_imx021,'-',l_tc_imx2.tc_imx022,'-',l_tc_imx2.tc_imx023,'-',l_tc_imx2.tc_imx024,'-',
                        l_tc_imx2.tc_imx025,'-',l_tc_imx2.tc_imx026,'-',l_tc_imx2.tc_imx027,'-',l_tc_imx2.tc_imx028,'-',
                        l_tc_imx2.tc_imx029,'-',l_tc_imx2.tc_imx030
                      LET l_str_tok = base.StringTokenizer.create(l_str,'-')
                    
                      SELECT DISTINCT oebud01 INTO l_oebud01 FROM oeb_file WHERE oeb04 = l_sfb.sfb05

                      LET ls_sql = "SELECT tc_agb03 FROM tc_agb_file WHERE ",
                                   " tc_agb01 = '",l_oebud01,"' ",
                                   "ORDER BY tc_agb02"
                          DECLARE param_cursa CURSOR FROM ls_sql
                          FOREACH param_cursa INTO l_tc_agb03
                          LET l_char = l_str_tok.nextToken()
                          IF l_tc_agb03='YX' THEN  
                             CALL i001_get_agd03(l_tc_agb03,l_char,'tc_agc_file') RETURNING l_yaxin
                             EXIT FOREACH
                          END IF
                          END FOREACH
                   IF p_flag <> 0 THEN     #add huxy130924
                      IF p_flag = 1 THEN
                         IF l_yaxin <> '普通牙' THEN
                    #        CONTINUE FOREACH
                         END IF
                      ELSE
                         IF l_yaxin = '普通牙' THEN
                    #        CONTINUE FOREACH
                         END IF
                      END IF
                   END IF
         #add huxy130911--------------------------end

            IF STATUS THEN CALL cl_err('foreach:',STATUS,1) EXIT FOREACH END IF

           #add huxy130922---------------------------------begin
            SELECT sfbud10 INTO l_sfbud10 FROM sfb_file WHERE sfb01 = l_sfb.sfb01  
            IF NOT cl_null(l_sfbud10) AND l_sfbud10 <> 0 THEN
               LET g_msg = l_sfb.sfb01,"已打印",l_sfbud10,"次"
               LET g_msg = cl_replace_str(g_msg," ","")
               CALL s_errmsg('sfa01',g_msg,'','sfa-001',1)
            END IF  
            IF NOT cl_null(l_sfbud10) THEN
               UPDATE sfb_file  SET sfbud10 = sfbud10 + 1  WHERE sfb01 = l_sfb.sfb01
            ELSE
               UPDATE sfb_file  SET sfbud10 = 1  WHERE sfb01 = l_sfb.sfb01
            END IF 
           #add huxy130922-----------------------------------end
	    
	    INITIALIZE sr.* TO NULL	    
	    INITIALIZE sr1.* TO NULL	    
	    INITIALIZE sr2.* TO NULL	    
	    LET l_aga01 = ''
	    LET l_tc_bom12 = ''
	    LET l_bdys=''
	    LET l_buf=''
	    LET l_tc_bom12_01 = ''
            LET l_yanse2=''    #huxy131021
            LET l_yanse3=''    #huxy131021

	   #SELECT oea01,oea03,oea032,sum(oeb12)  #mark huxy130823
	    SELECT oea01,oea03,oea032,sum(oeb12),oea14  #mod huxy130823
	      INTO sr.oea01,sr.oea03,sr.oea032,sr.sum1,sr.oea14 #mod huxy130823
	      FROM oea_file,oeb_file
	     WHERE oea01=l_sfb.sfbud04  AND oea01=oeb01
	     GROUP BY oea01,oea03,oea032,oea14

           #add huxy130823---------B
            SELECT gen02 INTO sr.oea14 FROM gen_file WHERE gen01=sr.oea14
           #add huxy130823---------E

          LET l_sql = " SELECT DISTINCT oeb11 FROM oeb_file  ",  
		     #"  WHERE oeb01='",sr.oea01,"'	 " 
		      "  WHERE oeb01='",sr.oea01,"' AND oeb03='",l_sfb.sfbud05,"' "   # add by xufeng 130906
         	PREPARE csfr101_001 FROM l_sql
         	DECLARE csfr101_100 CURSOR FOR csfr101_001
                FOREACH csfr101_100 INTO l_oeb11
		  IF cl_null(sr.oeb11) THEN 
		     LET sr.oeb11 = l_oeb11
		  ELSE
		     LET sr.oeb11 = sr.oeb11 CLIPPED,'|',l_oeb11 CLIPPED	  
		  END IF
		END FOREACH

	     # add by xufeng 130906--begin
	     LET sr1.oeb11 = sr.oeb11	      
	     # add by xufeng 130906----end

	     # sum1  重新取值 by xufeng 130906
	   # SELECT SUM(oeb12) INTO sr.sum1 FROM oeb_file WHERE oeb01=l_sfb.sfbud04 AND oeb11=sr.oeb11   #mark huxy131011
	     SELECT SUM(oeb12) INTO sr.sum1 FROM oeb_file WHERE oeb01=l_sfb.sfbud04   

# oao06--sr.azf03  品质要求  ta_oao07--sr.oao06 包装要求   #by xufeng 130704

          LET l_memo = ''
          DECLARE s_memo1_c CURSOR FOR
             SELECT oao06 FROM oao_file
              WHERE oao01 = l_sfb.sfbud04
         FOREACH s_memo1_c INTO l_memo
          IF cl_null(l_memo) THEN
#             LET sr.oao06=l_memo   #mark by chentao 140925
              CONTINUE FOREACH      #add by chentao 140925
          ELSE
             LET sr.oao06=sr.oao06 CLIPPED,' ',l_memo
          END IF
         END FOREACH

          LET l_memo = ''
          DECLARE s_memo1_d CURSOR FOR
             SELECT ta_oao07 FROM oao_file
              WHERE oao01 = l_sfb.sfbud04
         FOREACH s_memo1_d INTO l_memo
          IF cl_null(l_memo) THEN
             LET sr.azf03=l_memo
          ELSE
             LET sr.azf03=sr.azf03 CLIPPED,' ',l_memo
          END IF
         END FOREACH


	    LET sr.sfb01=l_sfb.sfb01 
	    LET sr.sfb13=l_sfb.sfb13 

	 #   IF l_sfb.sfb05[1,2] = 'TM' THEN LET sr.sfb82='金属车间' END IF
	 #   IF l_sfb.sfb05[1,2] = 'TN' THEN LET sr.sfb82='尼龙车间' END IF
	 #   IF l_sfb.sfb05[1,2] = 'TD' THEN LET sr.sfb82='注塑车间' END IF

	   CASE l_sfb.sfb05[1,2] 
		WHEN 'TM'
		    LET sr.sfb82='金属车间'
		    LET sr.lt1ima021='金属后道生产流程卡'
                WHEN 'TF'
                    LET sr.sfb82='精品车间'
                    LET sr.lt1ima021='精品后道生产流程卡'
                WHEN 'TN'
                    LET sr.sfb82='尼龙车间'
                    LET sr.lt1ima021='尼龙后道生产流程卡'
                WHEN 'TD'
                    LET sr.sfb82='塑钢车间'
                    LET sr.lt1ima021='塑钢后道生产流程卡'
                WHEN 'TY'
                    LET sr.sfb82='隐形车间'
                    LET sr.lt1ima021='隐形后道生产流程卡'
		OTHERWISE 
		    CONTINUE FOREACH
	   END CASE
          #SELECT gem03 INTO l_ima021 FROM gem_file WHERE gem01=l_sfb.sfb1001
           LET l_ima021 = l_sfb.sfb1001   
          	   

           SELECT imx00,ta_imx18,ta_imx19,ta_imx03 INTO sr.muima01,sr.lt1ima01,sr.lt2ima01,l_aga01
  	     FROM imx_file 
            WHERE imx000=l_sfb.sfb05
		
	    IF cl_null(sr.lt1ima01) THEN LET sr.lt1ima01 = ' ' END IF
	    IF cl_null(sr.lt2ima01) THEN LET sr.lt2ima01 = ' ' END IF

	    SELECT ima021 INTO sr.muima021 FROM ima_file WHERE ima01=sr.muima01
	  # SELECT ima021 INTO sr.lt1ima021 FROM ima_file WHERE ima01=sr.lt1ima01
	  # SELECT ima021 INTO sr.lt2ima021 FROM ima_file WHERE ima01=sr.lt2ima01
	    LET sr.lt2ima021 = l_sfb.sfbud02  # add by xufeng 130702

	    IF cl_null(l_aga01) THEN  CONTINUE FOREACH END IF
		
	       LET l_buf = ''
               SELECT NVL(imx01,' ')||'~'||NVL(imx02,' ')||'~'||NVL(imx03,' ')||'~'||NVL(imx04,' ')||'~'||NVL(imx05,' ')||'~'||NVL(imx06,' ')||'~'||NVL(imx07,' ')||'~'||NVL(imx08,' ')||'~'||NVL(imx09,' ')||'~'||NVL(imx10,' ')
                 INTO l_buf
                 FROM imx_file WHERE imx000=l_sfb.sfb05
	           
		 IF cl_null(l_buf) AND NOT cl_null(l_bdys) THEN
		    LET l_buf=l_bdys
		 END IF    		

                      LET l_str_tok = base.StringTokenizer.create(l_buf,'~')
                      LET p_param_list = ''
                      LET l_add = ''   #add huxy131129		          
                      LET ls_sql = "SELECT agb03 FROM agb_file WHERE ",
                                   " agb01 = '",l_aga01,"' ",
                                   "ORDER BY agb02"
                          DECLARE param_curs2 CURSOR FROM ls_sql
                          FOREACH param_curs2 INTO l_agb03
                   #l_str_tok中的Tokens數量應該和param_curs中的記錄數量完全一致
                        # 由于CDDW和CD顺序不一致 对CD特殊处理 by xufeng 130220
                          LET l_char = l_str_tok.nextToken()
		
		          CASE l_agb03
			     # 布带颜色
			       WHEN 'BDS'
				  SELECT agd03 INTO sr.yanse FROM agd_file WHERE agd01='BDS' AND agd02=l_char
                              #add huxy131129---------B---------
                               WHEN 'FCYS'
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='FCYS' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='FCYS'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                               WHEN 'JPYS'
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='JPYS' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='JPYS'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                               WHEN 'QDTCD'
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='QDTCD' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='QDTCD'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                               WHEN 'HDTCD'
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='HDTCD' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='HDTCD'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                                  

                               WHEN 'LYS'
                                  SELECT agd03 INTO l_yanse2 FROM agd_file WHERE agd01='LYS' AND agd02=l_char
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='LYS' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='LYS'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                               WHEN 'LYSL'
                                  IF cl_null(l_yanse2) THEN
                                     LET l_imx02_t = l_char
                                     SELECT agd03 INTO l_yanse2 FROM agd_file WHERE agd01='LYSL' AND agd02=l_char
                                  ELSE
                                     SELECT a.agd03||'/'||b.agd03 INTO l_yanse2
                                       FROM agd_file a,agd_file b
                                      WHERE a.agd01 = 'LYSL' AND a.agd02=l_imx02_t
                                        AND b.agd01 = 'LYSL' AND b.agd02=l_char
                                  END IF
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='LYSL' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='LYSL'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                              
                               WHEN 'LYSR'
                                  IF cl_null(l_yanse2) THEN
                                     LET l_imx02_t = l_char
                                     SELECT agd03 INTO l_yanse2 FROM agd_file WHERE agd01='LYSR' AND agd02=l_char
                                  ELSE
                                     SELECT a.agd03||'/'||b.agd03 INTO l_yanse2
                                       FROM agd_file a,agd_file b
                                      WHERE a.agd01 = 'LYSL' AND a.agd02=l_imx02_t
                                        AND b.agd01 = 'LYSR' AND b.agd02=l_char
                                  END IF    
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='LYSR' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='LYSR'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 

                               WHEN 'FXS'
                                  SELECT agd03 INTO l_yanse3 FROM agd_file WHERE agd01='FXS' AND agd02=l_char
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='FXS' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='FXS'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                               WHEN 'LFXS'
                                  IF cl_null(l_yanse3) THEN
                                     LET l_imx03_t = l_char
                                     SELECT agd03 INTO l_yanse3 FROM agd_file WHERE agd01='LFXS' AND agd02=l_char
                                  ELSE
                                     SELECT a.agd03||'/'||b.agd03 INTO l_yanse3
                                       FROM agd_file a,agd_file b
                                      WHERE a.agd01 = 'LFXS' AND a.agd02=l_imx03_t
                                        AND b.agd01 = 'RFXS' AND b.agd02=l_char
                                  END IF
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='LFXS' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='LFXS'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                               WHEN 'RFXS'
                                  IF cl_null(l_yanse3) THEN
                                     LET l_imx03_t = l_char
                                     SELECT agd03 INTO l_yanse3 FROM agd_file WHERE agd01='RFXS' AND agd02=l_char
                                  ELSE
                                     SELECT a.agd03||'/'||b.agd03 INTO l_yanse3
                                       FROM agd_file a,agd_file b
                                      WHERE a.agd01 = 'LFXS' AND a.agd02=l_imx03_t
                                        AND b.agd01 = 'LFXS' AND b.agd02=l_char
                                  END IF   
                                  LET l_add1=''
                                  LET l_add2=''
                                  SELECT agd03 INTO l_add1 FROM agd_file WHERE agd01='RFXS' AND agd02=l_char
                                  SELECT agc02 INTO l_add2 FROM agc_file WHERE agc01='RFXS'
                                  LET l_add1 = l_add2||l_add1
                                  IF NOT cl_null(l_add1) THEN
                                     IF cl_null(l_add) THEN
                                        LET l_add = l_add1
                                     ELSE
                                        LET l_add = l_add CLIPPED,'-',l_add1
                                     END IF 
                                  END IF 
                              
                              #add huxy131129---------E-------- 
                              
			       WHEN 'BDSL'
			          IF cl_null(sr.yanse) THEN
			             LET l_imx01_t = l_char
				     SELECT agd03 INTO sr.yanse FROM agd_file WHERE agd01='BDSL' AND agd02=l_char	
				  ELSE
			             SELECT a.agd03||'/'||b.agd3 INTO sr.yanse
				       FROM agd_file a,agd_file b 
				      WHERE a.agd01 = 'BDSL' AND a.agd02=l_imx01_t
					AND b.agd01 = 'BDSL' AND b.agd02=l_char
				  END IF
			       WHEN 'BDSR'
                                  IF cl_null(sr.yanse) THEN
                                     LET l_imx01_t = l_char
                                     SELECT agd03 INTO sr.yanse FROM agd_file_file WHERE agd01='BDSR' AND agd02=l_char
                                  ELSE
                                     SELECT a.agd03||'/'||b.agd03 INTO sr.yanse
                                       FROM agd_file a,agd_file b 
                                      WHERE a.agd01 = 'BDSL' AND a.agd02=l_imx01_t
                                        AND b.agd01 = 'BDSR' AND b.agd02=l_char
                                  END IF
                             {#add huxy131021-----------------B
                               WHEN 'LYS'
                               WHEN 'LYSL'
                               WHEN 'LYSR'


                               WHEN 'FXS'
                               WHEN 'LFXS'
                               WHEN 'RFXS'
                               LET l_yanse2=' '
                               LET l_yanse3=' '   
                              #add huxy131021-----------------E   }
			     # 长度
			       WHEN 'CD'
				  LET sr1.cd = l_char	
			     # 长度单位
			       WHEN 'CDDW'
				  LET sr1.cddw = l_char	
			          SELECT agd03 INTO sr1.cddw FROM agd_file WHERE agd01='CDDW' AND agd02=sr1.cddw
		          END CASE

			  END FOREACH
		 SELECT sfbud07 INTO sr.sfbud07 FROM sfb_file WHERE sfb01=sr.sfb01   #add huxy130819
		 SELECT sfbud06 INTO sr.sfbud06 FROM sfb_file WHERE sfb01=sr.sfb01   #add huxy130829
                 IF sr.sfbud07 IS NULL THEN    #add huxy130820
                    LET sr.sfbud07 = 0
                 END IF
                 IF sr.sfbud06 IS NULL THEN    #add huxy130829
                    LET sr.sfbud06 = 0
                 END IF
	         IF cl_null(sr.yanse) THEN LET sr.yanse= ' '  END IF 	
	         IF cl_null(l_yanse2) THEN LET l_yanse2= ' '  END IF #add huxy140227	
	         IF cl_null(l_yanse3) THEN LET l_yanse3= ' '  END IF #add huxy140227 	  
		 LET sr1.yanse = sr.yanse

                 #add huxy140227------B----- 
                 LET sr.yanse2 = l_yanse2
                 LET sr.yanse3 = l_yanse3
                 LET sr1.yanse2 = l_yanse2
                 LET sr1.yanse3 = l_yanse3
                 LET sr2.yanse2 = l_yanse2
                 LET sr2.yanse3 = l_yanse3
                 #add huxy140227------E----- 

		 LET sr1.oea01 = sr.oea01
		 LET sr1.muima01 = sr.muima01
		 LET sr1.sfbud07 = sr.sfbud07   #add huxy130820
		 LET sr1.sfbud06 = sr.sfbud06   #add huxy130829
		 LET sr1.lt1ima01 = sr.lt1ima01
		 LET sr1.lt2ima01 = sr.lt2ima01
		# LET sr1.other = 0
		# add by xufeng 130701----begin
	         SELECT oebud05 INTO sr1.other FROM oeb_file WHERE oeb01=l_sfb.sfbud04 AND oeb03=l_sfb.sfbud05
		# add by xufeng 130701------end
                 LET sr2.yanse = sr.yanse
                 LET sr2.oea01 = sr.oea01
                 LET sr2.muima01 = sr.muima01
                 LET sr2.lt1ima01 = sr.lt1ima01
                 LET sr2.lt2ima01 = sr.lt2ima01

		# add by huxy 130801----begin
	         SELECT oebud09 INTO sr1.dbcd FROM oeb_file WHERE oeb01=l_sfb.sfbud04 AND oeb03=l_sfb.sfbud05
                #IF cl_null(sr1.dbcd) THEN
                #   LET sr1.dbcd=0
                #END IF     
		# add by huxy 130801------end
              
                #add huxy131010---------------B 
                 LET l_nn1 = length(sr1.dbcd)
                 IF NOT cl_null(sr1.dbcd) AND sr1.dbcd <> '0' THEN
                    LET kk = 1
                    FOR ii = l_nn1 TO 1 STEP -1
                        IF sr1.dbcd[l_nn1-kk+1,l_nn1-kk+1] ='0' THEN
                           LET sr1.dbcd = sr1.dbcd[1,l_nn1-kk]
                           LET kk=kk + 1
                        ELSE
                           EXIT FOR
                        END IF
                    END FOR
                    LET l_nn1 = length(sr1.dbcd)
                    IF sr1.dbcd[l_nn1,l_nn1] = '.' THEN
                       LET sr1.dbcd = sr1.dbcd[1,l_nn1-1]
                    END IF
                 END IF                   
                #add huxy131010---------------E

		# SELECT oeb12 INTO sr1.oeb12 FROM oeb_file WHERE oeb01=l_sfb.sfbud04 AND oeb03=l_sfb.sfbud05   #mark huxy130820
		 SELECT sfb08 INTO sr1.oeb12 FROM sfb_file WHERE sfbud04=l_sfb.sfbud04 AND sfbud05=l_sfb.sfbud05 AND sfb01=l_sfb.sfb01 #mod huxy130820
		 LET sr1.sfb08 = l_sfb.sfb08

		#LET l_mashu = (sr1.cd + 5)*91.44

#	    LET sr1.rownum1 = sr1.rownum1 + 1
#		 IF sr1.rownum1 <> '1' THEN 
#    	       EXECUTE insert_prep1 USING sr1.*
#	 ELSE
#	    EXECUTE insert_prep1 USING sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,
#				       '产品尺寸','单位','订单数量','色样及其他','生产数量',sr1.rownum1
#	    LET sr1.rownum1 = sr1.rownum1 + 1
#	    EXECUTE insert_prep1 USING sr1.*
#	 END IF
#	 LET l_sum_oeb12 = l_sum_oeb12 + sr1.oeb12
#	 LET l_sum_sfb08 = l_sum_sfb08 + sr1.sfb08
	
     	       # INSERT INTO csfr101_tmp VALUES(sr1.*)  #mark huxy130911
     	       # INSERT INTO csfr101_tmp VALUES(sr1.*,sr.sfb01) #mod huxy130911
     	         INSERT INTO csfr101_tmp VALUES(sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,sr1.cd,sr1.cddw,sr1.oeb12,sr1.other,sr1.sfb08,
                                         sr1.buf1,sr1.rownum1,sr1.dbcd,sr1.sfbud07,sr1.sfbud06,sr1.oeb11,sr.sfb01,sr1.yanse2,sr1.yanse3) #mod huxy130911

		 LET l_mashu = 0   # mark by xufeng 130704
                #add huxy131018--------------------B 
                 SELECT sfbud06 INTO sr2.sfbud06 FROM sfb_file WHERE sfb01=l_sfb.sfb01
                 IF cl_null(sr2.sfbud06) THEN
                    LET sr2.sfbud06 = 0
                 END IF
                #add huxy131018--------------------E

                 DECLARE csfr101_sr2 SCROLL CURSOR FOR 
              #  SELECT sfa03,ima021,sfa05 
	      #	   FROM sfa_file,sfb_file,ima_file 
	      #	  WHERE sfb86=l_sfb.sfb01 AND sfb01=sfa01 AND sfa03=ima01 AND substr(sfb05,1,2) IN ('MM','MD','MN','MY') 
	      #   SELECT sfa03,ima021,sfa05  #huxy1130630

	         SELECT sfa03,ima021,sfa05,sfa12,ima02 #huxy130630add by shenran 2015-03-24 16:11:34 ima02 
		   FROM sfa_file,ima_file
		  WHERE sfa01=l_sfb.sfb01 AND sfa03=ima01
	         FOREACH csfr101_sr2 INTO sr2.ima01,sr2.ima021,sr2.sum3,sr2.sfa12,sr2.ima02
                  #add huxy131018----------------------B 
                   IF sr2.ima01[1,2]='MN' OR sr2.ima01[1,2]='MY' THEN
                      SELECT sfa161,sfa12 INTO sr2.sfa161,sr2.sfa12_1 FROM sfa_file 
                       WHERE sfa01 IN (SELECT tc_sfe01 FROM tc_sfe_file,sfb_file WHERE tc_sfe04=l_sfb.sfb01 AND (sfb05 LIKE 'MN%' OR sfb05 LIKE 'MY%') AND sfb01=tc_sfe01) 
                         AND (sfa03 LIKE 'PN%' OR sfa03 LIKE 'PY%')
                      LET sr2.sfa161=sr2.sum3*sr2.sfa161
                   ELSE
                      LET sr2.sfa161 = 0
                   END IF
                  #add huxy131018----------------------E 
		   LET sr2.yanse1 = ''
		   SELECT imx01 INTO sr2.yanse1 FROM imx_file WHERE imx000 = sr2.ima01

                   #add huxy131026-----------------begin
                   IF sr2.ima01[1,2] = 'FC' OR sr2.ima01[1,2] = 'CX' THEN
                     SELECT agd03 INTO sr2.yanse1 FROM agd_file WHERE agd01='FCYS' AND agd02=sr2.yanse1
                   END IF
                   #add huxy131026-----------------end
		   IF sr2.ima01[1,1] = 'M' THEN 
                     #add huxy131021------------------------B
                     #SELECT ta_imx04 INTO l_aga01_1
                     #  FROM imx_file
                     # WHERE imx000=sr2.ima01
                     #IF cl_null(l_aga01) THEN
                     #   SELECT DISTINCT ta_imx04 INTO l_aga01_1
                     #     FROM imx_file
                     #    WHERE ta_imx17 = sr2.ima01
                     #END IF
                     #IF cl_null(l_aga01) THEN
                     #   SELECT DISTINCT ta_imx04 INTO l_aga01
                     #     FROM imx_file
                     #    WHERE imx000 IN (SELECT bmb01 FROM bmb_file WHERE bmb03 = sr2.ima01 AND ROWNUM=1)
                     #END IF
                     #add huxy131021------------------------E 
		      SELECT agd03 INTO sr2.yanse1 FROM agd_file WHERE agd01='BDS' AND agd02=sr2.yanse1
		   END IF
		   IF sr2.ima01[1,1] = 'L' THEN     # add  by xufeng 130702
		      LET l_aga01 = sr2.ima01[1,4] 

          LET l_buf = ''
          SELECT tc_imx_file.* INTO l_tc_imx2.* FROM tc_imx_file LEFT join imx_file ON tc_imx01=imx00 WHERE imx000=sr2.ima01
            LET l_buf = l_tc_imx2.tc_imx001,'-',l_tc_imx2.tc_imx002,'-',l_tc_imx2.tc_imx003,'-',l_tc_imx2.tc_imx004,'-',
                        l_tc_imx2.tc_imx005,'-',l_tc_imx2.tc_imx006,'-',l_tc_imx2.tc_imx007,'-',l_tc_imx2.tc_imx008,'-',
                        l_tc_imx2.tc_imx009,'-',l_tc_imx2.tc_imx010,'-',l_tc_imx2.tc_imx011,'-',l_tc_imx2.tc_imx012,'-',
                        l_tc_imx2.tc_imx013,'-',l_tc_imx2.tc_imx014,'-',l_tc_imx2.tc_imx015,'-',l_tc_imx2.tc_imx016,'-',
                        l_tc_imx2.tc_imx017,'-',l_tc_imx2.tc_imx018,'-',l_tc_imx2.tc_imx019,'-',l_tc_imx2.tc_imx020,'-',
                        l_tc_imx2.tc_imx021,'-',l_tc_imx2.tc_imx022,'-',l_tc_imx2.tc_imx023,'-',l_tc_imx2.tc_imx024,'-',
                        l_tc_imx2.tc_imx025,'-',l_tc_imx2.tc_imx026,'-',l_tc_imx2.tc_imx027,'-',l_tc_imx2.tc_imx028,'-',
                        l_tc_imx2.tc_imx029,'-',l_tc_imx2.tc_imx030
                      LET l_str_tok = base.StringTokenizer.create(l_buf,'-')
                      LET ls_sql = "SELECT tc_agb03 FROM tc_agb_file WHERE ",
                                   " tc_agb01 = '",l_aga01,"' ",
                                   "ORDER BY tc_agb02"
                          DECLARE param_curs CURSOR FROM ls_sql
                          FOREACH param_curs INTO l_agb03
                          LET l_char = l_str_tok.nextToken()
                          IF l_agb03='BMCL' THEN
                             LET l_bmcl = l_char
                             EXIT FOREACH 
                          END IF
                          END FOREACH
		
	            IF l_bmcl = '5' THEN
		        SELECT agd03 INTO sr2.yanse1 FROM agd_file WHERE agd01='GNYS' AND agd02=sr2.yanse1
                    END IF
                    IF l_bmcl = '6' THEN
		        SELECT agd03 INTO sr2.yanse1 FROM agd_file WHERE agd01='GAYS' AND agd02=sr2.yanse1
          	    END IF
                    IF l_bmcl MATCHES '[1234]' THEN
		        SELECT agd03 INTO sr2.yanse1 FROM agd_file WHERE agd01='PQYS' AND agd02=sr2.yanse1
                    END IF

		   END IF

		   # add by xufeng 130701--begin
		   IF sr2.sfa12 = 'KG' THEN 
		      LET sr2.sum3=cl_digcut(sr2.sum3,2)
		   END IF
		   IF sr2.sfa12 = 'Y' OR sr2.sfa12 = 'PCS' THEN 
		      LET sr2.sum3=cl_digcut(sr2.sum3,0)
		   END IF   
		   # add by xufeng 130701----end

                   # add by xufeng 130704----begin  #mashu
                   IF sr2.ima01[1,1]='M' THEN
                      LET l_mashu = l_mashu + sr2.sum3
                   END IF
                   # add by xufeng 130704------end

                 { IF sr2.ima01[1,1]='M' THEN 
                      LET sr2.yanse2=l_yanse2 
                      LET sr2.yanse3=l_yanse3 
                   ELSE
                      LET sr2.yanse2='' 
                      LET sr2.yanse3=''
                   END IF  #mark huxy140227}
		   EXECUTE insert_prep2 USING sr2.*  
		
		 END FOREACH

		 LET sr.mashu = l_mashu
#         EXECUTE insert_prep1 USING sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,
#                                          '合计',' ',l_sum_oeb12,' ',l_sum_sfb08,'99'
			
         
         SELECT tc_sfe01 INTO sr.sfb01_a FROM tc_sfe_file,sfb_file WHERE sfb01=tc_sfe01 AND tc_sfe04=sr.sfb01 AND sfb05 LIKE 'M%' #add huxy130830  
 
        #EXECUTE insert_prep USING sr.*   #mark huxy130912

         #add huxy131129------BB------ 
           IF NOT cl_null(l_add) THEN 
              LET sr.muima021 = sr.muima021 CLIPPED,'-',l_add
           END IF
         #add huxy131129------EE------ 
        # EXECUTE insert_prep USING sr.*,l_numbe,l_num
        
        SELECT oea1015 INTO l_oea1015 FROM oea_file WHERE oea01=sr.oea01   #add by pulf 150122
       #SELECT ima021 INTO l_ima021 FROM ima_file WHERE ima01=sr2.ima01  #add by pulf 150122

        EXECUTE insert_prep USING  sr.oea01,sr.muima01,sr.muima021,sr.lt1ima01,sr.lt1ima021,sr.lt2ima01,sr.lt2ima021,sr.sum1,sr.sum2,sr.yanse,sr.mashu,
                                   sr.oeb11,sr.oea03,sr.oea032,sr.sfb82,sr.sfb01,sr.sfb13,sr.sfu02_1,sr.sfu02_2,sr.azf03,sr.oao06,sr.sfbud07,
                                   sr.sfbud06,sr.oea14,sr.sfb01_a,l_numbe,l_num,sr.yanse2,sr.yanse3
                                   ,l_oea1015,l_ima021   #add by pulf 150122

 
         END FOREACH


   # 对数据进行处理
     LET l_sql = " UPDATE ",g_cr_db_str CLIPPED,l_table CLIPPED,
                 "    SET sum2 = ? ",
                 "  WHERE oea01=? AND muima01=? AND lt1ima01=? AND lt2ima01=? AND yanse=? AND oeb11 = ? AND yanse2=? AND yanse3=?"  # add oeb11 by xufeng 130906  #huxy140226 add yanse2 yanse3
         PREPARE imx_099 FROM l_sql

   # add by xufeng 130704
     LET l_sql = " UPDATE ",g_cr_db_str CLIPPED,l_table CLIPPED,
               # "    SET sfb01 = ? ",  #mark huxy130912
                 "    SET sfb01 = ? ,l_numbe = ? ,l_num = ? ",
                #"  WHERE oea01=? AND muima01=? AND lt1ima01=? AND lt2ima01=? AND yanse=? "                  #mark huxy130820
                #"  WHERE oea01=? AND muima01=? AND lt1ima01=? AND lt2ima01=? AND yanse=? AND sfbud07=? "    #mod  huxy130820
                 "  WHERE oea01=? AND muima01=? AND lt1ima01=? AND lt2ima01=? AND yanse=? AND sfbud07=? AND sfbud06=? AND oeb11=? AND yanse2=? AND yanse3=? "    #mod  huxy130829  #huxy140226 add yanse2 yanse3
         PREPARE imx_098 FROM l_sql

     INITIALIZE sr1.* TO NULL	    
     DECLARE csfr101_sr1 SCROLL CURSOR FOR
	#SELECT DISTINCT oea01,muima01,lt1ima01,lt2ima01,yanse,sfbud07    #huxy130820 add sfbud07
	SELECT DISTINCT oea01,muima01,lt1ima01,lt2ima01,yanse,sfbud07,sfbud06,oeb11,yanse2,yanse3    #huxy130820 add sfbud07  #huxy130829 add sfbud06  # add oeb11 by xufeng130906 #huxy140227 add yanse2 yanse3
	  FROM csfr101_tmp
     #FOREACH csfr101_sr1 INTO sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse     #mark huxy130820
    #FOREACH csfr101_sr1 INTO sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,sr1.sfbud07  #mod huxy130820
     FOREACH csfr101_sr1 INTO sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,sr1.sfbud07,sr1.sfbud06,sr1.oeb11,sr1.yanse2,sr1.yanse3  #mod huxy130829 #huxy140227 add yanse2 yanse3

	  
	  LET sr1.rownum1 = 1      # 新的一页
	  LET l_sum_oeb12 = 0
	  LET l_sum_dbcd  = 0
	  LET l_sum_sfb08 = 0
	  LET l_mashu = 0
          EXECUTE insert_prep1 USING sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,
                                   # '产品尺寸','单位','订单数量','色样其他','生产数量','入库数量',sr1.rownum1             #mark huxy130801
                                   # '产品尺寸','单位','订单数量','色样其他','生产数量','入库数量',sr1.rownum1,'短边长度',sr1.sfbud07  #mod  huxy130801 #huxy130820 mod sfbud07
                                   # '产品尺寸','单位','订单数量','色样其他','生产数量','入库数量',sr1.rownum1,'短边长度',sr1.sfbud07,sr1.sfbud06  #mod  huxy130801 #huxy130820 mod sfbud07   #huxy130829 mod sfbud06
                                     '产品尺寸','单位','订单数量','色样其他','生产数量','入库数量',sr1.rownum1,'短边长度',sr1.sfbud07,sr1.sfbud06,sr1.oeb11,sr1.yanse2,sr1.yanse3  #mod  huxy130801 #huxy130820 mod sfbud07   #huxy130829 mod sfbud06  # add oeb11 by xufeng 130906    #huxy140227 add yanse2 yanse3

	 # DECLARE csfr101_sr1_01 SCROLL CURSOR FOR
        # SELECT cd,cddw,sum(oeb12),sum(other),sum(sfb08)
        #  SELECT cd,cddw,sum(oeb12),other,sum(sfb08)      #mark huxy130801
        # SELECT cd,cddw,sum(oeb12),other,sum(sfb08),dbcd  #mod  huxy130801   #mark huxy130820
        
        LET ll_sql=" SELECT cd,cddw,sum(oeb12),other,sum(sfb08),dbcd,sfbud07,sfbud06,oeb11,sfb01,yanse2,yanse3 ", #mod  huxy130801     #mod huxy130820 #mod huxy130829 # add oeb11 #huxy140227 add yanse2 yanse3
            " FROM csfr101_tmp",
	      " WHERE muima01='",sr1.muima01,"'",
	      " AND lt1ima01='",sr1.lt1ima01,"'", 
	      " AND lt2ima01='",sr1.lt2ima01,"'",
	      " AND  yanse='",sr1.yanse,"'", 
	      " AND  yanse2='",sr1.yanse2,"'",   #add huxy140227
	      " AND  yanse3='",sr1.yanse3,"'",   #add huxy140227
	      " AND oea01='",sr1.oea01,"'"
	      ," AND oeb11='",sr1.oeb11,"'" # add by xufeng 130906
	      # GROUP BY cd,cddw
	      
	  #IF sr1.sfbud07 IS NULL THEN
	  #        LET ll_sql=ll_sql CLIPPED," AND sfbud07 IS NULL "," GROUP BY cd,cddw,other,dbcd,sfbud07"   #mod huxy130801 add--dbcd   #mod huxy130820
	  #ELSE
	  #        LET ll_sql=ll_sql CLIPPED," AND sfbud07='",sr1.sfbud07,"'"," GROUP BY cd,cddw,other,dbcd,sfbud07"   #mod huxy130801 add--dbcd   #mod huxy130820
	  #END IF

	   IF sr1.sfbud06 IS NULL THEN
              IF sr1.sfbud07 IS NULL THEN
                 LET ll_sql=ll_sql CLIPPED," AND sfbud06 IS NULL AND sfbud07 IS NULL "," GROUP BY cd,cddw,other,dbcd,sfbud07,sfbud06,oeb11,sfb01a,yanse2,yanse3" 
              ELSE 
                 LET ll_sql=ll_sql CLIPPED," AND sfbud06 IS NULL AND sfbud07= '",sr1.sfbud07,"'"," GROUP BY cd,cddw,other,dbcd,sfbud07,sfbud06,oeb11,sfb01,yanse2,yanse3"
              END IF
	   ELSE
              IF sr1.sfbud07 IS NULL THEN
	           LET ll_sql=ll_sql CLIPPED," AND sfbud06='",sr1.sfbud06,"' AND sfbud07 IS NULL "," GROUP BY cd,cddw,other,dbcd,sfbud07,sfbud06,oeb11,sfb01,yanse2,yanse3" #mod huxy130801 add--dbcd  #mod huxy130820 
              ELSE
                   LET ll_sql=ll_sql CLIPPED," AND sfbud06='",sr1.sfbud06,"' AND sfbud07='",sr1.sfbud07,"' "," GROUP BY cd,cddw,other,dbcd,sfbud07,sfbud06,oeb11,sfb01,yanse2,yanse3" 
              END IF
	   END IF

         LET ll_sql=ll_sql CLIPPED," ORDER BY cd DESC "  #add huxy130904

         PREPARE r101_cs FROM ll_sql
         DECLARE csfr101_sr1_01 CURSOR FOR r101_cs
	   
	 #FOREACH csfr101_sr1_01 INTO sr1.cd,sr1.cddw,sr1.oeb12,sr1.other,sr1.sfb08,sr1.dbcd,sr1.sfbud07  #huxy130801 add---sr1.dbcd
	  FOREACH csfr101_sr1_01 INTO sr1.cd,sr1.cddw,sr1.oeb12,sr1.other,sr1.sfb08,sr1.dbcd,sr1.sfbud07,sr1.sfbud06,sr1.oeb11,l_sfb01_1,sr1.yanse2,sr1.yanse3  #huxy130801 add---sr1.dbcd #huxy130829
	      LET sr1.sfb08 = ' '  # add by xufeng 130702  # 生产数量改为手输，不必抓出
	      LET sr1.rownum1 = sr1.rownum1 + 1
              #add huxy130930-----------------------------begin
               LET l_oeb12_a = sr1.oeb12
               LET l_nn = l_oeb12_a.getIndexOf('.',1)
               LET l_oeb12_a = sr1.oeb12[1,l_nn-1]
               LET sr1.oeb12 = l_oeb12_a  
              #add huxy130930-----------------------------end
	     #EXECUTE insert_prep1 USING sr1.*

              EXECUTE insert_prep1 USING sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,sr1.cd,sr1.cddw,sr1.oeb12,sr1.other,sr1.sfb08,
                                         sr1.buf1,sr1.rownum1,sr1.dbcd,sr1.sfbud07,sr1.sfbud06,sr1.oeb11,sr1.yanse2,sr1.yanse3

              LET l_sum_oeb12 = l_sum_oeb12 + sr1.oeb12
              LET l_sum_dbcd = l_sum_dbcd + sr1.dbcd      #add huxy130801
              LET l_sum_sfb08 = l_sum_sfb08 + sr1.sfb08
	  END FOREACH    

          EXECUTE insert_prep1 USING sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,
                                         # '合计',' ',l_sum_oeb12,' ',l_sum_sfb08,' ','99'    #mark huxy130801
                                         # '合计',' ',l_sum_oeb12,' ',l_sum_sfb08,' ','99',l_sum_dbcd,sr1.sfbud07  #mod  huxy130801  #huxy130820 add sr1.sfbud07
                                           '合计',' ',l_sum_oeb12,' ',l_sum_sfb08,' ','99',l_sum_dbcd,sr1.sfbud07,sr1.sfbud06,sr1.oeb11,sr1.yanse2,sr1.yanse3  #mod  huxy130801  #huxy130820 add sr1.sfbud07  # #huxy130829  
	  EXECUTE imx_099 USING l_sum_oeb12,sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,sr1.oeb11,sr1.yanse2,sr1.yanse3  # mark by xufeng 130704

	 # add by xufeng 130704---begin
	  LET l_sfb01=''
	  LET l_char=''
	  LET l_string=''
	  LET l_sql = " SELECT distinct sfb01,substr(sfb01,length(sfb01)-3,length(sfb01)) FROM ",g_cr_db_str CLIPPED,l_table CLIPPED,
	              " WHERE oea01='",sr1.oea01,"' AND muima01='",sr1.muima01,"' AND lt1ima01='",sr1.lt1ima01,"'  ",
		     #" AND lt2ima01='",sr1.lt2ima01,"' AND yanse='",sr1.yanse,"' ",                               #mark huxy130820
		     #" AND lt2ima01='",sr1.lt2ima01,"' AND yanse='",sr1.yanse,"' AND sfbud07='",sr1.sfbud07,"'",  #mod  huxy130820
		     #" AND lt2ima01='",sr1.lt2ima01,"' AND yanse='",sr1.yanse,"' AND sfbud07='",sr1.sfbud07,"' AND sfbud06='",sr1.sfbud06,"'",  #mod  huxy130820   #mod  huxy130829
		      " AND lt2ima01='",sr1.lt2ima01,"' AND yanse='",sr1.yanse,"' AND sfbud07='",sr1.sfbud07,"' AND sfbud06='",sr1.sfbud06,"' AND oeb11='",sr1.oeb11,"' ",  #mod  huxy130820   #mod  huxy130829  # add oeb11 by xufeng 130906
                      " AND yanse2='",sr1.yanse2,"' AND yanse3='",sr1.yanse3,"' ",  
		      " ORDER BY sfb01 "
      		PREPARE r101_pb FROM l_sql
     	        DECLARE r101_sr_curs CURSOR FOR r101_pb

               #add huxy130912------------------begin
                  LET ll_today = g_today
                  LET ll_today = cl_replace_str(ll_today, "/", "")
                  SELECT (MAX(substr(sfbud12,8,12))+1) INTO numbe FROM sfb_file WHERE substr(sfbud12,1,6)= ll_today AND substr(sfbud12,7,1)='H'
                  IF cl_null(numbe) THEN LET numbe = '00001' END IF
                  LET l_numbe = ll_today CLIPPED,'H',(numbe USING '&&&&&')
                  LET l_numbe = cl_replace_str(l_numbe, " ", "")
               #add huxy130912------------------end

      		FOREACH r101_sr_curs INTO l_sfb01,l_char
                 #add huxy130916----------------------------------B
                  SELECT sfbud12 INTO l_num FROM sfb_file WHERE sfb01 IN(SELECT tc_sfe01 FROM tc_sfe_file WHERE tc_sfe04 = l_sfb01) AND (sfb05 LIKE 'M%')
                  IF cl_null(l_num) THEN LET l_num = ' ' END IF
                 #add huxy130916----------------------------------E
           
                      #add huxy130912------------------begin
                      SELECT sfbud12 INTO l_numbe1 FROM sfb_file WHERE sfb01 = l_sfb01
                      IF cl_null(l_numbe1) THEN
                         UPDATE sfb_file SET sfbud12 = l_numbe WHERE sfb01 = l_sfb01
                      ELSE
                         LET l_numbe = l_numbe1
                      END IF
                     #add huxy130912------------------end
		    IF cl_null(l_string) THEN
			LET l_string = l_sfb01
                        IF sr1.sfbud07<>0 THEN LET l_string=l_string CLIPPED,'-',sr1.sfbud07 END IF  #add huxy130820
                        CALL cl_replace_str(l_string, " ", "") RETURNING l_string                         #add huxy130820
		    ELSE
		        LET l_string = l_string CLIPPED,'/',l_char
		    END IF
	        END FOREACH
	  EXECUTE imx_098 USING l_string,l_numbe,l_num,sr1.oea01,sr1.muima01,sr1.lt1ima01,sr1.lt2ima01,sr1.yanse,sr1.sfbud07,sr1.sfbud06,sr1.oeb11,sr1.yanse2,sr1.yanse3  #huxy130820 add sfbud07	#huxy130829 add sfbud06
	 # add by xufeng 130704-----end
     END FOREACH      

    CALL s_showmsg()  #add huxy130922
	
#    LET l_sql = "SELECT * FROM ",g_cr_db_str CLIPPED,l_table CLIPPED ,"|",  # mark by xufeng 130704
     LET l_sql = " SELECT oea01,muima01,muima021,lt1ima01,lt1ima021,lt2ima01,lt2ima021,sum1,sum2,yanse,sum(mashu) mashu,   ",
		#" oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06 FROM ",g_cr_db_str CLIPPED,l_table CLIPPED ,          #mark huxy130819
		#" oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06,sfbud07 FROM ",g_cr_db_str CLIPPED,l_table CLIPPED ,  #mod  huxy130819  #mark huxy130823
		#" oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06,sfbud07,oea14 FROM ",g_cr_db_str CLIPPED,l_table CLIPPED ,  #mod  huxy130819  #mod huxy130823
		#" oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06,sfbud07,sfbud06,oea14 FROM ",g_cr_db_str CLIPPED,l_table CLIPPED ,  #mod  huxy130819  #mod huxy130823 #mod  huxy130829
		# " oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06,sfbud07,sfbud06,oea14,sfb01_a,l_numbe,l_num,yanse2,yanse3, FROM ",g_cr_db_str CLIPPED,l_table CLIPPED ,  #mod  huxy130819  #mod huxy130823 #mod  huxy130829 #mod huxy130830 sfb01_a  #mark by pulf150207
      " oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06,sfbud07,sfbud06,oea14,sfb01_a,l_numbe,l_num,yanse2,yanse3,oea1015,lt3ima021 FROM ",g_cr_db_str CLIPPED,l_table CLIPPED ,   #add by pulf 150207
                 " group by oea01,muima01,muima021,lt1ima01,lt1ima021,lt2ima01,lt2ima021,sum1,sum2, ", 
		#" yanse,oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06,sfbud07,oea14 ","|",  #huxy130819 add sfbud07  #huxy130823 add oea14
		# " yanse,oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06,sfbud07,sfbud06,oea14,sfb01_a,l_numbe,l_num,yanse2,yanse3 ","|",  #huxy130819 add sfbud07  #huxy130823 add oea14  #huxy130829 add sfbud06  #huxy130830 add---sfb01_a  #mark by pulf150207
		 " yanse,oeb11,oea03,oea032,sfb82,sfb01,sfb13,sfu02_1,sfu02_2,azf03,oao06,sfbud07,sfbud06,oea14,sfb01_a,l_numbe,l_num,yanse2,yanse3,oea1015,lt3ima021 ","|",  #huxy130819 add sfbud07  #huxy130823 add oea14  #huxy130829 add sfbud06  #huxy130830 add---sfb01_a  #add by pulf150207
		 " SELECT * FROM ",g_cr_db_str CLIPPED,l_table1 CLIPPED,"|",
		 " SELECT * FROM ",g_cr_db_str CLIPPED,l_table1 CLIPPED,"|",
		 " SELECT oea01,muima01,lt1ima01,lt2ima01,yanse,ima01,ima02,ima021,yanse1,sum(sum3) sum3,oebud02,sfa12,sfbud06,sum(sfa161) sfa161,sfa12_1,yanse2,yanse3 FROM ",g_cr_db_str CLIPPED,l_table2 CLIPPED,
	       # " GROUP BY oea01,muima01,lt1ima01,lt2ima01,yanse,ima01,ima02,ima021,yanse1,oebud02,sfa12 "	     	#mark huxy131018	
		 " GROUP BY oea01,muima01,lt1ima01,lt2ima01,yanse,ima01,ima02,ima021,yanse1,oebud02,sfa12,sfbud06,sfa12_1,yanse2,yanse3 "	#mod  huxy131018
		 


     SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01 = g_prog
     IF g_zz05 = 'Y' THEN                                                         
        CALL cl_wcchp(tm.wc,'sfb01,sfb05,sfb82')  
        RETURNING tm.wc                                                           
     END IF                      
     LET l_str = tm.wc CLIPPED,";",g_zz05 CLIPPED

 
      CALL cl_prt_cs3('csfr101','csfr101',l_sql,l_str)
END FUNCTION

#add huxy130911----------------b
FUNCTION i001_get_agd03(l_tc_agb03,l_char,l_flag)
DEFINE l_tc_agb03    LIKE tc_agb_file.tc_agb03
DEFINE l_char,l_flag LIKE type_file.chr100
DEFINE l_tc_agc04    LIKE tc_agc_file.tc_agc04

   IF l_flag = 'tc_agc_file' THEN
    SELECT tc_agc04 INTO l_tc_agc04 FROM tc_agc_file WHERE tc_agc01=l_tc_agb03
   END IF
   IF l_flag = 'agc_file' THEN
    SELECT agc04 INTO l_tc_agc04 FROM agc_file WHERE agc01=l_tc_agb03
   END IF

   IF l_tc_agc04 <> '2' OR cl_null(l_tc_agc04) THEN RETURN l_char END IF

   IF l_flag = 'tc_agc_file' THEN
    # SELECT tc_agd02||':'||tc_agd03 INTO l_char FROM tc_agd_file WHERE tc_agd01=l_tc_agb03 AND tc_agd02=l_char  #mark by xufeng 130403
      SELECT tc_agd03 INTO l_char FROM tc_agd_file WHERE tc_agd01=l_tc_agb03 AND tc_agd02=l_char
   END IF
   IF l_flag = 'agc_file' THEN
    # SELECT agd02||':'||agd03 INTO l_char FROM agd_file WHERE agd01=l_tc_agb03 AND agd02=l_char   # mark by xufeng 130403
      SELECT agd03 INTO l_char FROM agd_file WHERE agd01=l_tc_agb03 AND agd02=l_char
   END IF

   RETURN l_char

END FUNCTION
#add huxy130911----------------e
