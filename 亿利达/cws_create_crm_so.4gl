# Prog. Version..: '5.25.02-11.03.23(00000)'     #
#{
# Program name...: cws_create_crm_so.4gl
# Descriptions...: 提供创建ERP订单資料服務
# Date & Author..: 2017/05/26 By mj
# Memo...........:
#
#}
 
 
DATABASE ds
 
#FUN-840004
 
GLOBALS "../../../tiptop/config/top.global"
GLOBALS "../4gl/aws_wms_global.4gl" 
 
GLOBALS "../4gl/aws_ttsrv2_global.4gl"   #TIPTOP Service Gateway 使用的全域變數檔
 
 
#[
# Description....: 传入订单函数接口
# Date & Author..: 2014/11/09 By yangjian
# Parameter......: none
# Return.........: none
# Memo...........:
# Modify.........:
#
#]
FUNCTION cws_create_crm_so()

 WHENEVER ERROR CONTINUE
 
   CALL aws_ttsrv_preprocess()    #呼叫服務前置處理程序
 
   #--------------------------------------------------------------------------#
   # 新增出貨單資料                                                       #
   #--------------------------------------------------------------------------#
   IF g_status.code = "0" THEN
      CALL aws_crm_create_SO_Data_process()
   END IF
 
   CALL aws_ttsrv_postprocess()   #呼叫服務後置處理程序
   CALL aws_log('crm','xmlServer')
END FUNCTION

#[
# Description....: 传入订单值
# Date & Author..: No.FUN-840012 08/05/12 By Nicola
# Parameter......: 
# Return.........: 订单单号
# Memo...........:
# Modify.........:
#
#]
FUNCTION aws_crm_create_SO_Data_process()
    DEFINE l_i        LIKE type_file.num10,
           l_j        LIKE type_file.num10
    DEFINE l_sql      STRING
    DEFINE l_cnt1     LIKE type_file.num10,
           l_cnt2     LIKE type_file.num10
    DEFINE l_node1    om.DomNode,
           l_node2    om.DomNode
    DEFINE l_flag     LIKE type_file.num10
    DEFINE l_return   RECORD                           #回傳值必須宣告為一個 RECORD 變數, 且此 RECORD 需包含所有要回傳的欄位名稱與定義
                         oea01   LIKE oea_file.oea01   #回傳的欄位名稱
                      END RECORD
    DEFINE l_oea      RECORD LIKE oea_file.*
    DEFINE l_oeb      RECORD LIKE oeb_file.*
    DEFINE l_cmd      STRING
    DEFINE l_prog     STRING
    DEFINE l_oaytype  LIKE oay_file.oaytype       #FUN-930101 add    #抓取單據性質 
    DEFINE l_crmitem  LIKE  ima_file.imaud01
    DEFINE l_n        LIKE type_file.num5
    DEFINE l_gec04    LIKE gec_file.gec04
 
    #--------------------------------------------------------------------------#
    # 處理呼叫方傳遞給 ERP 的订单资料                                          #
    #--------------------------------------------------------------------------#
    LET l_cnt1 = aws_ttsrv_getMasterRecordLength("oea_file")            #取得共有幾筆單檔資料 *** 原則上應該僅一次一筆！ ***
    IF l_cnt1 = 0 THEN
       LET g_status.code = "-1"
       LET g_status.description = "No recordset processed!"
       RETURN
    END IF
 
    LET g_success = 'Y'
    BEGIN WORK
 
    SELECT * INTO g_sma.*
      FROM sma_file
     WHERE sma00='0'
     
     SELECT * INTO g_tc_slip.*
      FROM tc_slip_file
     WHERE tc_slip00 = 'crm'
 
    FOR l_i = 1 TO l_cnt1
        INITIALIZE l_oea.* TO NULL
        LET l_node1 = aws_ttsrv_getMasterRecord(l_i, "oea_file")        #目前處理單檔的 XML 節點
        LET l_oea.oea00 = aws_ttsrv_getRecordField(l_node1, "oea00")    #取得此筆單檔資料的欄位值
        LET l_oea.oea01 = aws_ttsrv_getRecordField(l_node1, "oea01")    #取得此筆單檔資料的欄位值
        LET l_oea.oea02 = aws_ttsrv_getRecordField(l_node1, "oea02")    #單據日期
        LET l_oea.oea03 = aws_ttsrv_getRecordField(l_node1, "oea03")  
        LET l_oea.oea08 = aws_ttsrv_getRecordField(l_node1, "oea08")
        LET l_oea.oea11 = aws_ttsrv_getRecordField(l_node1,"oea11")    
        LET l_oea.oea14 = aws_ttsrv_getRecordField(l_node1,"oea14")    
        LET l_oea.oea15 = aws_ttsrv_getRecordField(l_node1,"oea15")    
        LET l_oea.oea161 = aws_ttsrv_getRecordField(l_node1,"oea161")    
        LET l_oea.oea162 = aws_ttsrv_getRecordField(l_node1,"oea162")    
        LET l_oea.oea163 = aws_ttsrv_getRecordField(l_node1,"oea163")    
        LET l_oea.oea261 = aws_ttsrv_getRecordField(l_node1,"oea261")    
        LET l_oea.oea262 = aws_ttsrv_getRecordField(l_node1,"oea262")    
        LET l_oea.oea263 = aws_ttsrv_getRecordField(l_node1,"oea263") 
        LET l_oea.oea10 = aws_ttsrv_getRecordField(l_node1,"oea10")
        LET l_oea.oea21 = aws_ttsrv_getRecordField(l_node1, "oea21")  
        LET l_oea.oea23 = aws_ttsrv_getRecordField(l_node1, "oea23") 
        LET l_oea.oea24 = aws_ttsrv_getRecordField(l_node1, "oea24") 
        LET l_oea.oea31 = aws_ttsrv_getRecordField(l_node1, "oea31") 
        LET l_oea.oea32 = aws_ttsrv_getRecordField(l_node1, "oea32") 
        LET l_oea.oea41 = aws_ttsrv_getRecordField(l_node1, "oea41") 
        LET l_oea.oea42 = aws_ttsrv_getRecordField(l_node1, "oea42") 
        LET l_oea.oea43 = aws_ttsrv_getRecordField(l_node1, "oea43") 
        LET l_oea.oea61 = aws_ttsrv_getRecordField(l_node1, "oea61") 
        LET l_oea.oea1008 = aws_ttsrv_getRecordField(l_node1, "oea1008") 
        LET l_oea.oeaconf = aws_ttsrv_getRecordField(l_node1,"oeaconf")   
        LET l_oea.oeacont = aws_ttsrv_getRecordField(l_node1,"oeacont")   
        LET l_oea.oeaconu = aws_ttsrv_getRecordField(l_node1,"oeaconu")
        LET l_oea.oeaplant = aws_ttsrv_getRecordField(l_node1,"oeaplant")   
        LET l_oea.oeaoriu = aws_ttsrv_getRecordField(l_node1,"oeaoriu")   
        LET l_oea.oeaorig = aws_ttsrv_getRecordField(l_node1,"oeaorig")
        LET l_oea.oeaud01 = aws_ttsrv_getRecordField(l_node1, "oeaud01")
        LET l_oea.oeaud03 = aws_ttsrv_getRecordField(l_node1, "oeaud03")  
        LET l_oea.oeaud04 = aws_ttsrv_getRecordField(l_node1, "oeaud04")  
        LET l_oea.oeaud05 = aws_ttsrv_getRecordField(l_node1, "oeaud05")
             
        
        LET l_oea.oeaslk02 = 'N'  
        LET l_oea.oea917 = 'N'
        LET l_oea.oea213 = 'Y' 
        
        SELECT gec04 INTO l_gec04 FROM gec_file WHERE gec01=l_oea.oea21
        
        
        IF l_oea.oea24 IS NULL THEN LET l_oea.oea24=1 END IF

        IF cl_null(l_oea.oea85) THEN
           LET l_oea.oea85 = '1'
        END IF
      
        #FUN-930101---add---start---
     #抓取單據性質
      LET g_tc_slip.tc_slip11 = l_oea.oea01
      SELECT oaytype INTO l_oaytype FROM oay_file WHERE oayslip = g_tc_slip.tc_slip11
     #FUN-930101---add---end---
        
        #----------------------------------------------------------------------#
        # 檢查單據日期                                                         #
        #----------------------------------------------------------------------#
        CALL aws_crm_create_SO_Data_check_oea02(l_oea.*)
        IF NOT cl_null(g_errno) THEN
           LET g_status.code = g_errno
           LET g_success = 'N'
           EXIT FOR
        END IF
 
        #----------------------------------------------------------------------#
        # 订单自动取号                                                       #
        #----------------------------------------------------------------------#
         CALL s_check_no("axm",g_tc_slip.tc_slip11,"",l_oaytype,"oea_file","oea01","")  #FUN-930101 add 依單據性質不同判斷為何種出貨類別
              RETURNING l_flag,l_oea.oea01
        IF NOT l_flag THEN
           LET g_status.code = "mfg0014"   #无此单别
           LET g_success = 'N'
           EXIT FOR
        END IF
 
        CALL s_auto_assign_no("axm",g_tc_slip.tc_slip11,l_oea.oea02,"","oea_file","oea01","","","")
             RETURNING l_flag,l_oea.oea01
        IF NOT l_flag THEN
           LET g_status.code = "sub-145"   #自动编号错误
           LET g_success = 'N'
           EXIT FOR
        END IF
 
        #------------------------------------------------------------------#
        # 设定订单单头预设值                                               #
        #------------------------------------------------------------------#
        CALL aws_crm_create_SO_order_set_oea(l_oea.*) RETURNING l_oea.*
        IF NOT cl_null(g_errno) THEN
           LET g_status.code = g_errno
           LET g_success = 'N'
           EXIT FOR
        END IF
        
        IF l_oea.oea11='1' THEN LET l_oea.oea12=l_oea.oea01 END IF
        IF l_oea.oea08 = '1' THEN 
        	SELECT occ41 INTO l_oea.oea21 FROM occ_file WHERE occ01=l_oea.oea03
        	SELECT gec04 INTO l_oea.oea211 FROM gec_file WHERE gec01 = l_oea.oea21
        ELSE
          LET l_oea.oea21 = 'S000'
          LET l_oea.oea211= 0
        END IF	

        #------------------------------------------------------------------#
        # RECORD資料傳到NODE                                               #
        #------------------------------------------------------------------#
        CALL aws_ttsrv_setRecordField_record(l_node1,base.Typeinfo.create(l_oea))
 
        LET l_sql = aws_ttsrv_getRecordSql(l_node1, "oea_file", "I", NULL)   #I 表示取得 INSERT SQL
 
        #----------------------------------------------------------------------#
        # 執行單頭 INSERT SQL                                                  #
        #----------------------------------------------------------------------#
        EXECUTE IMMEDIATE l_sql
        IF SQLCA.SQLCODE THEN
           LET g_status.code = SQLCA.SQLCODE
           LET g_status.sqlcode = SQLCA.SQLCODE
           LET g_success = 'N'
           EXIT FOR
        END IF
 
        #----------------------------------------------------------------------#
        # 處理單身資料                                                         #
        #----------------------------------------------------------------------#
        LET l_cnt2 = aws_ttsrv_getDetailRecordLength(l_node1, "oeb_file")       #取得目前單頭共有幾筆單身資料
        IF l_cnt2 = 0 THEN 
           LET g_status.code = "mfg-009"   #必須有單身資料
           LET g_success = 'N'
           EXIT FOR
        END IF
 
 
        FOR l_j = 1 TO l_cnt2
            INITIALIZE l_oeb.* TO NULL
            LET l_node2 = aws_ttsrv_getDetailRecord(l_node1,l_j,"oeb_file")   #目前單身的 XML 節點
 
            #------------------------------------------------------------------#
            # NODE資料傳到RECORD                                               #
            #------------------------------------------------------------------#
            LET l_oeb.oeb01=l_oea.oea01
 
            LET l_oeb.oeb03 = aws_ttsrv_getRecordField(l_node2, "oeb03")
            LET l_oeb.oeb04 = aws_ttsrv_getRecordField(l_node2, "oeb04")
            LET l_oeb.oeb05 = aws_ttsrv_getRecordField(l_node2, "oeb05")
            LET l_oeb.oeb11 = aws_ttsrv_getRecordField(l_node2, "oeb11")
            LET l_oeb.oeb12 = aws_ttsrv_getRecordField(l_node2, "oeb12")
            LET l_oeb.oeb13 = aws_ttsrv_getRecordField(l_node2, "oeb13")
            LET l_oeb.oeb14 = aws_ttsrv_getRecordField(l_node2, "oeb14")
            LET l_oeb.oeb14t = aws_ttsrv_getRecordField(l_node2,"oeb14t")
            LET l_oeb.oeb15 = aws_ttsrv_getRecordField(l_node2,"oeb15")
            LET l_oeb.oeb16 = aws_ttsrv_getRecordField(l_node2,"oeb16")
            LET l_oeb.oeb71 = aws_ttsrv_getRecordField(l_node2,"oeb71")
            LET l_oeb.oebud01 = aws_ttsrv_getRecordField(l_node2,"oebud01")
            LET l_oeb.oebud03 = aws_ttsrv_getRecordField(l_node2,"oebud03")
            
            
            #------------------------------------------------------------------#
            # 单身栏位预设值                                                   #
            #------------------------------------------------------------------#
            CALL aws_crm_create_SO_order_check_oeb(l_oea.*,l_oeb.*)
                 RETURNING l_oeb.*
            IF NOT cl_null(g_errno) THEN
               LET g_status.code=g_errno
               LET g_success = 'N'
               EXIT FOR
            END IF
            LET l_oeb.oeb14t = l_oeb.oeb14*(1+ l_oea.oea211/100)
            #------------------------------------------------------------------#
            # RECORD資料傳到NODE2                                              #
            #------------------------------------------------------------------#
            CALL aws_ttsrv_setRecordField_record(l_node2,base.Typeinfo.create(l_oeb))

            LET l_sql = aws_ttsrv_getRecordSql(l_node2, "oeb_file", "I", NULL) #I 表示取得 INSERT SQL 
          
            #------------------------------------------------------------------#
            # 執行單身 INSERT SQL                                              #
            #------------------------------------------------------------------#
            EXECUTE IMMEDIATE l_sql
            IF SQLCA.SQLCODE THEN
               LET g_status.code = SQLCA.SQLCODE
               LET g_status.sqlcode = SQLCA.SQLCODE
               EXIT FOR
            END IF
            
        END FOR
        IF g_status.code != "0" THEN   #如果單身處理有任何錯誤, 則離開
           EXIT FOR
        END IF
         
         CALL crm_so_t400_bu(l_oea.*)
    END FOR
 
   # CALL aws_create_shipping_order_gen_sheet(l_oea.*)
    
    #全部處理都成功才 COMMIT WORK
    IF g_success = 'Y' THEN
       LET l_return.oea01 = l_oea.oea01
       COMMIT WORK
    ELSE
       ROLLBACK WORK
       INITIALIZE l_return.* TO NULL
    END IF
 
   #IF g_status.code ='0' THEN
   #    LET l_cmd=NULL
   #    LET l_prog="axmt410"
   #    LET l_cmd=l_prog," '",l_oea.oea01 CLIPPED,"' 'M'" #FUN-A60034 add
   #    CALL cl_cmdrun_wait(l_cmd)
   #    CALL aws_ttsrv_cmdrun_checkStatus(l_prog)
   #    
   #    SELECT COUNT(*) INTO l_n FROM oea_file WHERE oea01=l_oea.oea01
   #       AND oeaconf = 'Y'
   #    IF l_n = 0 THEN
   #    	  DELETE FROM oea_file WHERE oea01 = l_oea.oea01
   #    	  DELETE FROM oeb_file WHERE oeb01 = l_oea.oea01
   #    	  LET g_success = 'N'
   #    	  INITIALIZE l_return.* TO NULL
   #    END IF 
   # END IF

    CALL aws_ttsrv_addParameterRecord(base.TypeInfo.create(l_return))   #回傳自動取號結果
 
END FUNCTION


FUNCTION aws_crm_create_SO_Data_check_oea02(l_oea)
   DEFINE l_oea RECORD LIKE oea_file.*
   DEFINE l_yy LIKE sma_file.sma51
   DEFINE l_mm LIKE sma_file.sma52
 
   LET g_errno=NULL
   IF NOT cl_null(l_oea.oea02) THEN
      IF l_oea.oea02 <= g_oaz.oaz09 THEN #銷售系統關帳日
         LET g_errno='axm-164' 
         RETURN
      END IF
 
      IF g_oaz.oaz03 = 'Y' AND
         g_sma.sma53 IS NOT NULL AND l_oea.oea02 <= g_sma.sma53 THEN #製造系統關帳日
         LET g_errno='mfg9999'
         RETURN 
      END IF
 
      CALL s_yp(l_oea.oea02) RETURNING l_yy,l_mm
      IF ((l_yy*12+l_mm) > (g_sma.sma51*12+g_sma.sma52)) THEN
         LET g_errno='mfg6090' 
         RETURN
      END IF
   END IF
 
END FUNCTION

FUNCTION aws_crm_create_SO_order_set_oea(l_oea)
   DEFINE l_oea   RECORD LIKE oea_file.*
   DEFINE l_occ        RECORD LIKE occ_file.*
   
   LET g_errno=NULL
   
   SELECT * INTO l_occ.* FROM occ_file
          WHERE occ01=l_oea.oea03
          
   #LET l_oea.oea02 = g_today
   LET l_oea.oea06 = g_oaz.oaz41

   IF g_oaz.oaz64 = 'O' THEN
      LET l_oea.oea07  ='N' #MOD-B30131
   ELSE
      LET l_oea.oea07  =g_oaz.oaz64
   END IF

#  LET l_oea.oea08 = '1'

   LET l_oea.oea09  =g_oaz.oaz201
   LET l_oea.oea11  ='1'
   
   #LET l_oea.oea161 =0
   #LET l_oea.oea162 =100
   #IF g_azw.azw04='2' THEN
   #   LET l_oea.oea161=''
   #   LET l_oea.oea162=''
   #END IF
   #LET l_oea.oea163 =0
   #LET l_oea.oea261 =0    #No:FUN-A50103
   #LET l_oea.oea262 =0    #No:FUN-A50103
   #LET l_oea.oea263 =0    #No:FUN-A50103
   LET l_oea.oea18  ='N'          #No.3192 add
   LET l_oea.oea61  =0
   LET l_oea.oea62  =0
   LET l_oea.oea63  =0
   LET l_oea.oea65  ='N'  #No.FUN-610056
   LET l_oea.oea50  ='N'
   LET l_oea.oea37 = 'N'   #No.FUN-640025
   LET l_oea.oea1005='N'   #FUN-610055
   LET l_oea.oea1012='N'   #FUN-610055
   LET l_oea.oea905 ='N'   #FUN-610055

   LET l_oea.oea901 = 'N'    #非多角貿易
   LET l_oea.oea902=''
   LET l_oea.oea905='N'
   LET l_oea.oea906=''

   LET l_oea.oeaconf='Y'
   LET l_oea.oeacont=''  #No.FUN-870007
   LET l_oea.oeaprsw=0
   LET l_oea.oeauser=g_user
   #LET l_oea.oeaoriu = g_user #FUN-980030
   #LET l_oea.oeaorig = g_grup #FUN-980030
   #LET g_data_plant = g_plant #FUN-980030
   LET l_oea.oeagrup=g_grup
   LET l_oea.oeadate=g_today
   LET l_oea.oea49   = '1'         #0.開立/送簽中 1.已核淮
   LET l_oea.oeamksg = 'N'         #是否簽核 y/n
   LET l_oea.oeasign = ''          #簽核等級
   LET l_oea.oeasmax = 0           #己簽順序
   LET l_oea.oeasseq = 0           #應簽順序
   LET l_oea.oeadays = 0           #簽核完成天數
   LET l_oea.oeaplant = g_plant
   LET l_oea.oealegal = g_legal
   IF g_azw.azw04='2' THEN
      LET l_oea.oea83 =g_plant
      LET l_oea.oea84 =g_plant
   END IF
   
   IF l_oea.oea03[1,4] != 'MISC' THEN
      LET l_oea.oea032 = l_occ.occ02
   END IF
   
   #LET l_oea.oea23 = l_occ.occ42
   LET l_oea.oea25 = l_occ.occ43 
   #LET l_oea.oea31 = l_occ.occ44 
   LET l_oea.oea80 = l_occ.occ68 
   LET l_oea.oea81 = l_occ.occ69 
   LET l_oea.oea32 = l_occ.occ45
   LET l_oea.oea33 = l_occ.occ46
   LET l_oea.oea34 = l_occ.occ53
   #LET l_oea.oea41 = l_occ.occ48
   #LET l_oea.oea42 = l_occ.occ49
   #LET l_oea.oea43 = l_occ.occ47  
   LET l_oea.oea04 = l_occ.occ09
   LET l_oea.oea17 = l_occ.occ07
   LET l_oea.oea31 = l_occ.occ44 

   RETURN l_oea.*
END FUNCTION

FUNCTION aws_crm_create_SO_order_check_oeb(l_oea,l_oeb)
   DEFINE l_oea      RECORD LIKE oea_file.*
   DEFINE l_oeb      RECORD LIKE oeb_file.*

   LET l_oeb.oeb01=l_oea.oea01
   SELECT ima02 INTO l_oeb.oeb06 FROM ima_file WHERE ima01 = l_oeb.oeb04 AND imaacti = 'Y'
   LET l_oeb.oeb47=0
   LET l_oeb.oeb48=1
   LET l_oeb.oeb44='1'
   LET l_oeb.oeb16=l_oeb.oeb15 
   LET l_oeb.oeb917=l_oeb.oeb12     #add by mj 171024 
   LET l_oeb.oeb37 = 0     #FUN-AB0061 
   LET l_oeb.oeb24=0
   LET l_oeb.oeb28=0              #NO.FUN-670007
   LET l_oeb.oeb19='N'
   LET l_oeb.oeb906 = 'N'         #No.FUN-5C0076
   LET l_oeb.oeb72 = l_oeb.oeb15  #Add FUN-B20060
   LET l_oeb.oeb1003 = '1'
   LET l_oeb.oeb1012 = 'N'   #No.FUN-650108
   LET l_oeb.oeb1006 = 100
   IF NOT cl_null(l_oea.oea46) THEN
     LET l_oeb.oeb41 = l_oea.oea46
     LET l_oeb.oeb41 = l_oea.oea46
   END IF
   SELECT ima25 INTO l_oeb.oeb05 FROM ima_file WHERE ima01 = l_oeb.oeb04
   LET l_oeb.oeb05_fac=1
   LET l_oeb.oeb23=0
   LET l_oeb.oeb24=0
   LET l_oeb.oeb25=0
   LET l_oeb.oeb29=0   #No.FUN-740016
   LET l_oeb.oeb26=0
   LET l_oeb.oeb901=0   #No:8754
   LET l_oeb.oeb920=0   #No.FUN-630006
   LET l_oeb.oeb32 = g_today     #No.FUN-A80024
   LET l_oeb.oeb70='N'
   LET l_oeb.oebplant=g_plant
   LET l_oeb.oeblegal=g_legal #No.FUN-87007
   
   RETURN l_oeb.*
END FUNCTION

FUNCTION crm_so_t400_bu(l_oea)
DEFINE l_oea      RECORD LIKE oea_file.*

   LET l_oea.oea61 = NULL
   LET l_oea.oea1008 = NULL    #FUN-A50103

   SELECT SUM(oeb14),SUM(oeb14t) INTO l_oea.oea61,l_oea.oea1008    #FUN-A50103
     FROM oeb_file WHERE oeb01 = l_oea.oea01

SELECT azi03,azi04 INTO t_azi03,t_azi04 FROM azi_file     #No.CHI-6A0004
    WHERE azi01=g_oea.oea23
    
   IF cl_null(l_oea.oea61) THEN LET l_oea.oea61 = 0 END IF
   IF cl_null(l_oea.oea1008) THEN LET l_oea.oea1008 = 0 END IF    #FUN-A50103

   CALL cl_digcut(l_oea.oea61,t_azi04) RETURNING l_oea.oea61              #No.CHI-6A0004
   CALL cl_digcut(l_oea.oea1008,t_azi04) RETURNING l_oea.oea1008    #FUN-A50103

   #MOD-B30297------add-----str----------------------------
   LET l_oea.oea261 = l_oea.oea1008 * l_oea.oea161/100
   LET l_oea.oea262 = l_oea.oea1008 * l_oea.oea162/100
   LET l_oea.oea263 = l_oea.oea1008 - l_oea.oea261 - l_oea.oea262
   #MOD-B30297------add--------end----------------------------

   UPDATE oea_file SET oea61 = l_oea.oea61,
                       oea1008=l_oea.oea1008,    #FUN-A50103
                       oea261 = l_oea.oea261,   #MOD-B30297    
                       oea262 = l_oea.oea262,   #MOD-B30297 
                       oea263 = l_oea.oea263    #MOD-B30297 
                 WHERE oea01 = l_oea.oea01
      

END FUNCTION
