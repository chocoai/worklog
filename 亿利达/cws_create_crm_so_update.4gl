# Prog. Version..: '5.25.02-11.03.23(00000)'     #
#{
# Program name...: cws_create_crm_so_update.4gl
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
FUNCTION cws_create_crm_so_update()

 WHENEVER ERROR CONTINUE
 
   CALL aws_ttsrv_preprocess()    #呼叫服務前置處理程序
 
   #--------------------------------------------------------------------------#
   # 新增出貨單資料                                                       #
   #--------------------------------------------------------------------------#
   IF g_status.code = "0" THEN
      CALL aws_crm_create_so_update_process()
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
FUNCTION aws_crm_create_so_update_process()
    DEFINE l_i        LIKE type_file.num10,
           l_j        LIKE type_file.num10
    DEFINE l_sql      STRING
    DEFINE l_cnt1     LIKE type_file.num10,
           l_cnt2     LIKE type_file.num10
    DEFINE l_node1    om.DomNode,
           l_node2    om.DomNode
    DEFINE l_flag     LIKE type_file.num10
    DEFINE l_return   RECORD                           #回傳值必須宣告為一個 RECORD 變數, 且此 RECORD 需包含所有要回傳的欄位名稱與定義
                         oep01   LIKE oep_file.oep01   #回傳的欄位名稱
                      END RECORD
    DEFINE l_oep      RECORD LIKE oep_file.*
    DEFINE l_oeq      RECORD LIKE oeq_file.*
    DEFINE l_cmd      STRING
    DEFINE l_prog     STRING
    DEFINE l_oaytype  LIKE oay_file.oaytype       #FUN-930101 add    #抓取單據性質 
    DEFINE l_crmitem  LIKE  ima_file.imaud01
    DEFINE l_n        LIKE type_file.num5
    DEFINE l_gec04    LIKE gec_file.gec04
    DEFINE g_cnt      LIKE type_file.num10
    DEFINE l_oeb03    LIKE oeb_file.oeb03  #add by wuqqz 20171102
    DEFINE l_oeq03    LIKE oeq_file.oeq03  #add by wuqqz 20171102
 
    #--------------------------------------------------------------------------#
    # 處理呼叫方傳遞給 ERP 的订单资料                                          #
    #--------------------------------------------------------------------------#
    LET l_cnt1 = aws_ttsrv_getMasterRecordLength("oep_file")            #取得共有幾筆單檔資料 *** 原則上應該僅一次一筆！ ***
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
        INITIALIZE l_oep.* TO NULL
        LET l_node1 = aws_ttsrv_getMasterRecord(l_i, "oep_file")        #目前處理單檔的 XML 節點
        LET l_oep.oep01 = aws_ttsrv_getRecordField(l_node1, "oep01")    #取得此筆單檔資料的欄位值
        LET l_oep.oep04 = aws_ttsrv_getRecordField(l_node1, "oep04")    #單據日期
        LET l_oep.oep12 = aws_ttsrv_getRecordField(l_node1, "oep12")  
        LET l_oep.oep13 = aws_ttsrv_getRecordField(l_node1, "oep13")    
        LET l_oep.oep06b = aws_ttsrv_getRecordField(l_node1,"oep06b")    
        LET l_oep.oep07b = aws_ttsrv_getRecordField(l_node1,"oep07b")    
        LET l_oep.oep08b = aws_ttsrv_getRecordField(l_node1,"oep08b")    
        LET l_oep.oep14b = aws_ttsrv_getRecordField(l_node1,"oep14b")    
        LET l_oep.oep10b = aws_ttsrv_getRecordField(l_node1,"oep10b")    
        LET l_oep.oep11b = aws_ttsrv_getRecordField(l_node1,"oep11b")    
        LET l_oep.oep15b = aws_ttsrv_getRecordField(l_node1,"oep15b")    
        LET l_oep.oep161b = aws_ttsrv_getRecordField(l_node1,"oep161b") 
        LET l_oep.oep162b = aws_ttsrv_getRecordField(l_node1,"oep162b")
        LET l_oep.oep163b = aws_ttsrv_getRecordField(l_node1, "oep163b")  
        LET l_oep.oep261b = aws_ttsrv_getRecordField(l_node1, "oep261b") 
        LET l_oep.oep262b = aws_ttsrv_getRecordField(l_node1, "oep262b") 
        LET l_oep.oep263b = aws_ttsrv_getRecordField(l_node1, "oep263b")
        LET l_oep.oep09   = aws_ttsrv_getRecordField(l_node1, "oep09")     

       SELECT COUNT(*) INTO l_n FROM ogb_file WHERE ogb31 = l_oep.oep01  
       IF cl_null(l_n) THEN LET l_n = 0 END IF
       IF l_n >0 THEN
       LET g_status.code = "-1"
       LET g_status.description = "订单已经存在出货通知单!"
       RETURN         
       END IF         
        #------------------------------------------------------------------#
        # 设定订单单头预设值                                               #
        #------------------------------------------------------------------#
        CALL aws_crm_create_SO_order_set_oep(l_oep.*) RETURNING l_oep.*
        IF NOT cl_null(g_errno) THEN
           LET g_status.code = g_errno
           LET g_success = 'N'
           EXIT FOR
        END IF
         
       
        #------------------------------------------------------------------#
        # RECORD資料傳到NODE                                               #
        #------------------------------------------------------------------#
        CALL aws_ttsrv_setRecordField_record(l_node1,base.Typeinfo.create(l_oep))
 
        LET l_sql = aws_ttsrv_getRecordSql(l_node1, "oep_file", "I", NULL)   #I 表示取得 INSERT SQL
 
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
        LET l_cnt2 = aws_ttsrv_getDetailRecordLength(l_node1, "oeq_file")       #取得目前單頭共有幾筆單身資料
        IF l_cnt2 = 0 THEN 
           LET g_status.code = "mfg-009"   #必須有單身資料
           LET g_success = 'N'
           EXIT FOR
        END IF
 
 
        FOR l_j = 1 TO l_cnt2
            INITIALIZE l_oeq.* TO NULL
            LET l_node2 = aws_ttsrv_getDetailRecord(l_node1,l_j,"oeq_file")   #目前單身的 XML 節點
 
            #------------------------------------------------------------------#
            # NODE資料傳到RECORD                                               #
            #------------------------------------------------------------------#
            LET l_oeq.oeq01=l_oep.oep01
 
            LET l_oeq.oeq03 = aws_ttsrv_getRecordField(l_node2, "oeq03")
            LET l_oeq.oeq04a = aws_ttsrv_getRecordField(l_node2, "oeq04a")
            LET l_oeq.oeq05a = aws_ttsrv_getRecordField(l_node2, "oeq05a")
            LET l_oeq.oeq041a = aws_ttsrv_getRecordField(l_node2, "oeq041a")
            LET l_oeq.oeq30a = aws_ttsrv_getRecordField(l_node2, "oeq30a")
            LET l_oeq.oeq12a = aws_ttsrv_getRecordField(l_node2, "oeq12a")
            LET l_oeq.oeq13a = aws_ttsrv_getRecordField(l_node2, "oeq13a")
            LET l_oeq.oeq14a = aws_ttsrv_getRecordField(l_node2, "oeq14a")
            LET l_oeq.oeq14ta = aws_ttsrv_getRecordField(l_node2,"oeq14ta")
            LET l_oeq.oeq31a = aws_ttsrv_getRecordField(l_node2,"oeq31a")
            LET l_oeq.oeq32a = aws_ttsrv_getRecordField(l_node2,"oeq32a")
            LET l_oeq.oeq15a = aws_ttsrv_getRecordField(l_node2,"oeq15a")
            LET l_oeq.oeq50 = aws_ttsrv_getRecordField(l_node2,"oeq50")
            
            #------------------------------------------------------------------#
            # 单身栏位预设值                                                   #
            #------------------------------------------------------------------#
            CALL aws_crm_create_SO_order_check_oeq(l_oep.*,l_oeq.*)
                 RETURNING l_oeq.*
            IF NOT cl_null(g_errno) THEN
               LET g_status.code=g_errno
               LET g_success = 'N'
               EXIT FOR
            END IF
            #add by chentao 170827---------begin
            LET l_oeq.oeq03 = aws_ttsrv_getRecordField(l_node2, "oeq03") 
            LET g_cnt=0
            SELECT COUNT(*) INTO g_cnt
              FROM oeb_file
             WHERE oeb01=l_oep.oep01 AND oeb03=l_oeq.oeq03 
            IF g_cnt = 0 THEN
                 LET l_oeq.oeq04a = aws_ttsrv_getRecordField(l_node2, "oeq04a")
                 LET l_oeq.oeq041a = aws_ttsrv_getRecordField(l_node2, "oeq041a")
                 LET l_oeq.oeq05a = aws_ttsrv_getRecordField(l_node2, "oeq05a")
                 LET l_oeq.oeq30a = aws_ttsrv_getRecordField(l_node2, "oeq30a")
                 LET l_oeq.oeq12a = aws_ttsrv_getRecordField(l_node2, "oeq12a")
                 LET l_oeq.oeq13a = aws_ttsrv_getRecordField(l_node2, "oeq13a")
                 LET l_oeq.oeq14a = aws_ttsrv_getRecordField(l_node2, "oeq14a")
                 LET l_oeq.oeq14ta = aws_ttsrv_getRecordField(l_node2,"oeq14ta")
                 LET l_oeq.oeq31a = aws_ttsrv_getRecordField(l_node2,"oeq31a")
                 LET l_oeq.oeq32a = aws_ttsrv_getRecordField(l_node2,"oeq32a")
                 LET l_oeq.oeq15a = aws_ttsrv_getRecordField(l_node2,"oeq15a")
                 LET l_oeq.oeq50 = aws_ttsrv_getRecordField(l_node2,"oeq50")
                 LET l_oeq.oeq37a = l_oeq.oeq13a
            END IF
            #add by chentao 170827-----------end
            #add by wuqqz 20171102---str---
            IF cl_null(l_oeq.oeq03) THEN
               SELECT MAX(oeb03) INTO l_oeb03 FROM oeb_file,oep_file,oeq_file 
                WHERE oeb01 = oeq01
                  AND oeq01 = oep01
                  AND oeb01 = oep01
                  AND oeb01 = l_oep.oep01
               SELECT MAX(oeq03) INTO l_oeq03 FROM oeq_file
                WHERE oep01 = oeq01
                  AND oep01 = l_oep.oep01
               IF l_oeb03 >= l_oeq03 THEN
                  LET l_oeq.oeq03 = l_oeb03 + 1
               ELSE
                  LET l_oeq.oeq03 = l_oeq03 + 1
               END IF
            END IF
            #add by wuqqz 20171102---end---
            #------------------------------------------------------------------#
            # RECORD資料傳到NODE2                                              #
            #------------------------------------------------------------------#
            CALL aws_ttsrv_setRecordField_record(l_node2,base.Typeinfo.create(l_oeq))

            LET l_sql = aws_ttsrv_getRecordSql(l_node2, "oeq_file", "I", NULL) #I 表示取得 INSERT SQL
 
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
         
    END FOR
 
   # CALL aws_create_shipping_order_gen_sheet(l_oep.*)
    #CALL t800crm_g(l_oep.oep01,l_oep.oep02) #add by wuqqz 20171102  #mark by wuqqz 20171102
    #全部處理都成功才 COMMIT WORK
    IF g_success = 'Y' THEN
       LET l_return.oep01 = l_oep.oep01
       COMMIT WORK     
    ELSE
       ROLLBACK WORK
       INITIALIZE l_return.* TO NULL
    END IF
 
   #IF g_status.code ='0' THEN
   #    LET l_cmd=NULL
   #    LET l_prog="axmt410"
   #    LET l_cmd=l_prog," '",l_oep.oep01 CLIPPED,"' 'M'" #FUN-A60034 add
   #    CALL cl_cmdrun_wait(l_cmd)
   #    CALL aws_ttsrv_cmdrun_checkStatus(l_prog)
   #    
   #    SELECT COUNT(*) INTO l_n FROM oep_file WHERE oep01=l_oep.oep01
   #       AND oepconf = 'Y'
   #    IF l_n = 0 THEN
   #    	  DELETE FROM oep_file WHERE oep01 = l_oep.oep01
   #    	  DELETE FROM oeq_file WHERE oeq01 = l_oep.oep01
   #    	  LET g_success = 'N'
   #    	  INITIALIZE l_return.* TO NULL
   #    END IF 
   # END IF

    CALL aws_ttsrv_addParameterRecord(base.TypeInfo.create(l_return))   #回傳自動取號結果
    #CALL t800crm_g(l_oep.oep01,l_oep.oep02) #mark by wuqqz 20171102
    CALL t800crm_g(l_oep.oep01,l_oep.oep02) #add by wuqqz 20171103
END FUNCTION

FUNCTION aws_crm_create_SO_order_set_oep(l_oep)
   DEFINE l_oep        RECORD LIKE oep_file.*
   DEFINE l_oea        RECORD LIKE oea_file.*
   DEFINE g_cnt        LIKE type_file.num5
   
   LET g_errno=NULL
   
   SELECT * INTO l_oea.* FROM oea_file
          WHERE oea01=l_oep.oep01     
   #---->變更序號
   SELECT max(oep02) INTO l_oep.oep02 FROM  oep_file
    WHERE oep01 = l_oep.oep01
   IF cl_null(l_oep.oep02) THEN
      LET l_oep.oep02 = 1
   ELSE
      LET l_oep.oep02 = l_oep.oep02 + 1
   END IF
   #---->判斷此訂單,是否尚有未確認的變更單
   SELECT count(*) INTO g_cnt FROM oep_file
    WHERE oep01 = l_oep.oep01
      AND oepconf IN ('N','n')     #MOD-750095 add 
   IF g_cnt > 0 THEN    # 代表尚有未確認的訂單變更單
      LET g_errno = 'axm-289'
   END IF

   #---->判斷此訂單,是否尚有己確認未發出的訂單變更單
   SELECT count(*) INTO g_cnt FROM oep_file
    WHERE oep01 = l_oep.oep01
      AND oepconf IN ('Y','y') AND oep09 != '2'
   IF g_cnt > 0 THEN
      LET g_errno = 'axm-404'
   END IF

   #---->判斷此訂單,是否存在於訂單單頭
   SELECT count(*) INTO g_cnt FROM oea_file
    WHERE oea01 = l_oep.oep01 AND oeaconf IN ('Y','y')
#      AND oea49 = '1'
   IF g_cnt = 0 THEN        # 於訂單單頭檔無此訂單單號或無已確認未簽核
      LET g_errno = 'axm-290'
   ELSE
      SELECT oea044,oea32,oea23,oea31,oea43, #FUN-560263 add oea31,oea43
             oea161,oea162,oea163,oea261,oea262,oea263    #No:FUN-A50103
             ,oea21,oea10                                 #FUN-A80118 Add
        INTO l_oep.oep06,l_oep.oep07,l_oep.oep08,
             l_oep.oep10,l_oep.oep11, #FUN-560263 add l_oep.oep10,l_oep.oep11
             l_oep.oep161,l_oep.oep162,l_oep.oep163,    #No:FUN-A50103
             l_oep.oep261,l_oep.oep262,l_oep.oep263     #No:FUN-A50103
             ,l_oep.oep14,l_oep.oep15                   #FUN-A80118 Add 
        FROM oea_file
       WHERE oea01 = l_oep.oep01               
   END IF
   LET l_oep.oepconf = 'Y'
   LET l_oep.oepplant = g_plant
   LET l_oep.oeplegal = g_legal
  # LET l_oep.oep13 = '11'
   LET l_oep.oep09='1'
   
   RETURN l_oep.*
END FUNCTION

FUNCTION aws_crm_create_SO_order_check_oeq(l_oep,l_oeq)
   DEFINE l_oep      RECORD LIKE oep_file.*
   DEFINE l_oeq      RECORD LIKE oeq_file.*
   DEFINE l_oeb      RECORD LIKE oeb_file.*
   DEFINE g_cnt      LIKE type_file.num5
   DEFINE l_oeb12    LIKE oeb_file.oeb12
   DEFINE l_gec04b   LIKE gec_file.gec04
   DEFINE l_gec07b   LIKE gec_file.gec07
   DEFINE l_gecacti  LIKE gec_file.gecacti

   SELECT * INTO l_oeb.* FROM oeb_file WHERE oeb01 = l_oeq.oeq01 AND oeb03 = l_oeq.oeq03
   
   LET l_oeq.oeq02 = l_oep.oep02
   
   LET g_cnt=0
   SELECT COUNT(*) INTO g_cnt 
     FROM oeb_file 
    WHERE oeb01=g_oep.oep01 
      AND oeb03=l_oeq.oeq03
      AND oeb70='Y'

   IF g_cnt>0 THEN       #已結案
      LET g_errno = 'axm-202' 
   END IF

    LET g_cnt = 0 
    SELECT COUNT(*) INTO g_cnt
      FROM oea_file,oeb_file
     WHERE oeb01=g_oep.oep01
       AND oeb03=l_oeq.oeq03
       AND oeb12-oeb25-oeb29 <= 0
       AND oea01=oeb01
       AND (oea00='8' OR oea00='9')   #MOD-940354
    IF g_cnt > 0 THEN
       LET g_errno = 'axm1003' 
    END IF

    #---->當已交量>0時,不可變更單位
     LET l_oeb12 = 0  #MOD-810195 add
     SELECT oeb24-oeb25 INTO l_oeb12  FROM oeb_file   #已交量
      WHERE oeb01 = g_oep.oep01 
        AND oeb03 = l_oeq.oeq03
     IF l_oeb12 > 0 THEN
        LET g_errno = 'axm-276'          # 此訂單料號已有交貨  #MOD-810092 modify axm-292->axm-276
        CALL cl_set_comp_entry("oeq04a,oeq041a,oeq05a,oeq26a,oeq20a,oeq23a",FALSE)
     ELSE 
        CALL cl_set_comp_entry("oeq04a,oeq041a,oeq05a,oeq26a,oeq20a,oeq23a",TRUE)
     END IF
       #------>判斷此訂單有無此項次(若無代表為新增line)
       LET g_cnt=0
       SELECT COUNT(*) INTO g_cnt
           FROM oeb_file
           WHERE oeb01=l_oep.oep01 AND oeb03=l_oeq.oeq03
 
       IF g_cnt = 0 THEN
          LET l_oeq.oeq04b=''
          LET l_oeq.oeq041b=''
          LET l_oeq.oeq30b=''
          LET l_oeq.oeq05b=''
          LET l_oeq.oeq12b=0
          LET l_oeq.oeq13b=0
          LET l_oeq.oeq37b=0    #FUN-AB0082
          LET l_oeq.oeq15b=''
          LET l_oeq.oeq14b=0
          #LET t_oeq14tb=0   #MOD-A70005
          LET l_oeq.oeq14tb=0   #MOD-A70005
          LET l_oeq.oeq04a=''
          LET l_oeq.oeq041a=''
          LET l_oeq.oeq30a=''      #No.FUN-990030
          LET l_oeq.oeq05a=''
          LET l_oeq.oeq12a=''      #MOD-970109 
          LET l_oeq.oeq13a=0
          LET l_oeq.oeq37a=l_oeq.oeq13a       #FUN-AB0082
          LET l_oeq.oeq15a=''
          LET l_oeq.oeq23b=''
          LET l_oeq.oeq24b=0
          LET l_oeq.oeq25b=0
          LET l_oeq.oeq20b=''
          LET l_oeq.oeq21b=0
          LET l_oeq.oeq22b=0
          LET l_oeq.oeq26b=''
          LET l_oeq.oeq27b=0
        
          LET l_oeq.oeq23a=''
          LET l_oeq.oeq24a=0
          LET l_oeq.oeq25a=0
          LET l_oeq.oeq20a=''
          LET l_oeq.oeq21a=0
          LET l_oeq.oeq22a=0
          LET l_oeq.oeq26a=''
          LET l_oeq.oeq27a=0
    ELSE
        SELECT oeb04, oeb05, oeb12, oeb13, oeb14, oeb14t,
               oeb15, oeb06, oeb913,oeb914,oeb915,oeb910,
               oeb911,oeb912,oeb916,oeb917,oeb30,oeb31,   #No:FUN-630006   #No:FUN-740016
               oeb1001,                                          #No.FUN-990030 add oeb1001
               oeb41,oeb42,oeb43                                 #FUN-A80118 Add         
              ,oeb37                                             #FUN-AB0082
           INTO l_oeq.oeq04b, l_oeq.oeq05b,
               l_oeq.oeq12b, l_oeq.oeq13b,
               #l_oeq.oeq14b, t_oeq14tb,   #MOD-A70005
               l_oeq.oeq14b, l_oeq.oeq14tb,   #MOD-A70005
               l_oeq.oeq15b, l_oeq.oeq041b,
               l_oeq.oeq23b, l_oeq.oeq24b,
               l_oeq.oeq25b, l_oeq.oeq20b,
               l_oeq.oeq21b, l_oeq.oeq22b,
               l_oeq.oeq26b, l_oeq.oeq27b,  #No:FUN-630006
               l_oeq.oeq28b, l_oeq.oeq29b,   #No:FUN-740016
               l_oeq.oeq30b,                       #No.FUN-990030
               l_oeq.oeq31b, l_oeq.oeq32b,l_oeq.oeq33b  #FUN-A80118 Add
              ,l_oeq.oeq37b                        #FUN-AB0082
          FROM oeb_file
         WHERE oeb01 = l_oep.oep01 AND oeb03 = l_oeq.oeq03 
         LET l_oeq.oeq37b=l_oeq.oeq13b
         LET l_oeq.oeq37a=l_oeq.oeq13a              
   END IF
   IF cl_null(l_oeq.oeq041a) THEN
      LET l_oeq.oeq04a = l_oeb.oeb04
      LET l_oeq.oeq041a = l_oeb.oeb06
   END IF
   LET l_oeq.oeq14ta = l_oeq.oeq12a*l_oeq.oeq13a
   SELECT gec04,gec07,gecacti INTO l_gec04b,l_gec07b,l_gecacti
    FROM gec_file
   WHERE gec01 = l_oep.oep14b
    AND gec011 = '2'
   LET l_oeq.oeq14a = l_oeq.oeq14ta/ (1+l_gec04b/100)
   LET l_oeq.oeqplant=g_plant
   LET l_oeq.oeqlegal=g_legal #No.FUN-87007
   LET l_oeq.oeq37b=l_oeq.oeq13b
   LET l_oeq.oeq37a=l_oeq.oeq13a     
   RETURN l_oeq.*
END FUNCTION

FUNCTION t800crm_g(p_oep01,p_oep02)
   DEFINE p_oep01 LIKE oep_file.oep01
   DEFINE p_oep02 LIKE oep_file.oep02
   DEFINE g_oep   RECORD LIKE oep_file.*
   DEFINE x_oep   RECORD LIKE oep_file.*
   DEFINE g_oea   RECORD LIKE oea_file.*
   DEFINE l_cmd   LIKE type_file.chr1000 #No.FUN-680137 VARCHAR(60)
   DEFINE g_cnt   LIKE type_file.num5
   DEFINE g_sta   LIKE cre_file.cre08
   DEFINE g_oea901 LIKE oea_file.oea901
   DEFINE g_oea905 LIKE oea_file.oea905
   
   SELECT *  INTO g_oep.* FROM oep_file
       WHERE oep01 = p_oep01
         AND oep02 = p_oep02 
   IF s_shut(0) THEN RETURN END IF
   IF g_oep.oep01 IS NULL THEN CALL cl_err('',-400,0) RETURN END IF
   IF g_oep.oep09 != '1' THEN CALL cl_err('oep09 != 1','apm-299',0) RETURN END IF #MOD-540061
   IF g_oep.oepconf != 'Y' THEN CALL cl_err('','mfg3550',0) RETURN END IF  #MOD-550031
   IF g_oep.oepconf = 'X' THEN CALL cl_err(g_oep.oep01,'9024',0) RETURN END IF

   SELECT * INTO x_oep.* FROM oep_file
    WHERE oep01 = p_oep01
      AND oep02 = p_oep02
   IF NOT (x_oep.oepmksg IS NULL OR x_oep.oepmksg='N') AND
      x_oep.oepsseq < x_oep.oepsmax AND x_oep.oep09 = '0' THEN  #送簽中
      CALL cl_err (g_oep.oep01,'axm-175',0)
      RETURN
   END IF

   #No.B061 010417 by linda mod 應check變更之項次是否結案
   LET g_cnt=0

   SELECT COUNT(*) INTO g_cnt
     FROM oeb_file,oeq_file
    WHERE oeb01=g_oep.oep01
      AND oeb70='Y'
      AND oeb01=oeq01
      AND oeb03=oeq03
      AND oeq02=g_oep.oep02 #BugNo:4348
   IF g_cnt>0 THEN       #已結案
      CALL cl_err('','aap-730',0)
      RETURN
   END IF

#   IF NOT cl_confirm('axm-181') THEN RETURN END IF

   BEGIN WORK

   LET g_success = 'Y'

   CALL s_showmsg_init()                        #No.FUN-710046 

   CALL t800_g1(g_oep.*)

   CALL s_showmsg()                            #No.FUN-710046               

   IF g_success = 'Y' THEN
      LET g_oep.oep09 = '2'  #MOD-790051 add
      COMMIT WORK
      DISPLAY BY NAME g_oep.oep09
      CALL s_axmsta('oep',g_oep.oep09,g_oep.oepconf,g_oep.oepmksg) #顯示目前狀態
          RETURNING g_sta
      DISPLAY g_sta TO FORMONLY.desc
   ELSE
      ROLLBACK WORK
   END IF

   SELECT oea901,oea99 INTO g_oea901,g_oea.oea99 FROM oea_file  #MOD-740444 add oea99
    WHERE oea01=g_oep.oep01
   IF STATUS THEN
      CALL cl_err('sel oea901:',SQLCA.SQLCODE,0)
      LET g_oea901 = ''
   END IF

   IF g_success = 'Y' THEN                              #MOD-A50049
      #若為三角貿易訂單則重新拋轉
      IF NOT cl_null(g_oea901) AND g_oea901='Y' THEN
         #拋轉至各廠
         LET l_cmd="axmp800 '",g_oep.oep01,"' '",g_oea905,"' "
         CALL cl_cmdrun_wait(l_cmd)   #No:MOD-570401
#        CALL t800_chk_oea06()                         #MOD-A50049
      END IF
   END IF                                              #MOD-A50049

   #CKP
   SELECT oepconf,oep09 INTO g_oep.oepconf,g_oep.oep09 FROM oep_file  
    WHERE oep01 = g_oep.oep01 AND oep02 = g_oep.oep02

   DISPLAY BY NAME g_oep.oepconf,g_oep.oep09  

END FUNCTION

FUNCTION t800_g1(g_oep)
   DEFINE l_oeb04        LIKE oeb_file.oeb04,   # 料件編號
          l_sql          LIKE type_file.chr1000 #No.FUN-680137 VARCHAR(900)
   DEFINE l_oeb12        LIKE oeb_file.oeb12,
          l_oeb23        LIKE oeb_file.oeb23,
          l_oeb03        LIKE oeb_file.oeb03,
          l_oea01        LIKE oea_file.oea01,
          l_oeq03        LIKE oeq_file.oeq03,
          l_oeq12a       LIKE oeq_file.oeq12a
   DEFINE l_dbs_new      LIKE type_file.chr21  #New DataBase Name
   DEFINE g_up_flag      LIKE type_file.chr1
   DEFINE l_azp03        LIKE azp_file.azp03
   DEFINE l_last         LIKE type_file.num5   #流程之最後家數
   DEFINE l_last_plant   LIKE cre_file.cre08
   DEFINE l_oea904       LIKE oea_file.oea904
   DEFINE l_poz011       LIKE poz_file.poz011
   DEFINE l_cnt          LIKE type_file.num10   
   DEFINE l_ogb12        LIKE ogb_file.ogb12   #MOD-880178  
   DEFINE l_dbs_tra      LIKE azw_file.azw05        #FUN-980093 add
   DEFINE l_plant_new    LIKE azp_file.azp01        #FUN-980093 add
   DEFINE g_oep   RECORD LIKE oep_file.*
   DEFINE g_oea   RECORD LIKE oea_file.*
   DEFINE g_oeq05a       LIKE oeq_file.oeq05a
   DEFINE g_oeq05b       LIKE oeq_file.oeq05b   
   DEFINE g_oeq04a       LIKE oeq_file.oeq04a   
   DEFINE g_oeq04b       LIKE oeq_file.oeq04b   
   DEFINE g_oeq041a      LIKE oeq_file.oeq041a  
   DEFINE g_oeq041b      LIKE oeq_file.oeq041b  
   DEFINE g_oeq03        LIKE oeq_file.oeq03    
   DEFINE g_oeq12a       LIKE oeq_file.oeq12a   
   DEFINE g_oeq12b       LIKE oeq_file.oeq12b   
   DEFINE g_oeq13a       LIKE oeq_file.oeq13a   
   DEFINE g_oeq13b       LIKE oeq_file.oeq13b   
   DEFINE g_oeq14a       LIKE oeq_file.oeq14a   
   DEFINE g_oeq14b       LIKE oeq_file.oeq14b   
   DEFINE g_oeq14ta      LIKE oeq_file.oeq14ta  
   DEFINE g_oeq14tb      LIKE oeq_file.oeq14tb  
   DEFINE g_oeq15a       LIKE oeq_file.oeq15a   
   DEFINE g_oeq15b       LIKE oeq_file.oeq15b   
   DEFINE g_oeq20a       LIKE oeq_file.oeq20a   
   DEFINE g_oeq20b       LIKE oeq_file.oeq20b   
   DEFINE g_oeq21a       LIKE oeq_file.oeq21a   
   DEFINE g_oeq21b       LIKE oeq_file.oeq21b   
   DEFINE g_oeq22a       LIKE oeq_file.oeq22a   
   DEFINE g_oeq22b       LIKE oeq_file.oeq22b   
   DEFINE g_oeq23a       LIKE oeq_file.oeq23a   
   DEFINE g_oeq23b       LIKE oeq_file.oeq23b   
   DEFINE g_oeq24a       LIKE oeq_file.oeq24a   
   DEFINE g_oeq24b       LIKE oeq_file.oeq24b   
   DEFINE g_oeq25a       LIKE oeq_file.oeq25a   
   DEFINE g_oeq25b       LIKE oeq_file.oeq25b   
   DEFINE g_oeq26a       LIKE oeq_file.oeq26a   
   DEFINE g_oeq26b       LIKE oeq_file.oeq26b   
   DEFINE g_oeq27a       LIKE oeq_file.oeq27a   
   DEFINE g_oeq27b       LIKE oeq_file.oeq27b   
   DEFINE g_oeq28a       LIKE oeq_file.oeq28a   
   DEFINE g_oeq28b       LIKE oeq_file.oeq28b   
   DEFINE g_oeq29a       LIKE oeq_file.oeq29a   
   DEFINE g_oeq29b       LIKE oeq_file.oeq29b   
   DEFINE g_oeq30a       LIKE oeq_file.oeq30a   
   DEFINE g_oeq30b       LIKE oeq_file.oeq30b   
   DEFINE g_oeq31a       LIKE oeq_file.oeq31a   
   DEFINE g_oeq31b       LIKE oeq_file.oeq31b   
   DEFINE g_oeq32a       LIKE oeq_file.oeq32a   
   DEFINE g_oeq32b       LIKE oeq_file.oeq32b   
   DEFINE g_oeq33a       LIKE oeq_file.oeq33a   
   DEFINE g_oeq33b       LIKE oeq_file.oeq33b   
   DEFINE g_oeq37a       LIKE oeq_file.oeq37a   
   DEFINE g_oeq37b       LIKE oeq_file.oeq37b                               

   IF g_oep.oepconf='N' THEN RETURN   END IF

   LET l_sql = "SELECT oeq12a,oeq03 FROM oeq_file ",
               " WHERE oeq01 ='", g_oep.oep01,"' ",
               "   AND oeq02 ='", g_oep.oep02,"' " 
   PREPARE oeq_p7 FROM l_sql
   DECLARE oeq_c7 CURSOR FOR oeq_p7

   FOREACH oeq_c7 INTO l_oeq12a,l_oeq03
      IF NOT cl_null(l_oeq12a) THEN 
         SELECT oea904 INTO l_oea904 FROM oea_file WHERE oea01=g_oep.oep01

         SELECT poz011 INTo l_poz011 FROM poz_file WHERE poz01=l_oea904 AND poz00='1' 

         SELECT MAX(poy02) INTO l_last FROM poy_file WHERE poy01=l_oea904

         SELECT poy04 INTO l_last_plant FROM poy_file
          WHERE poy01 = l_oea904  AND poy02 = l_last

         SELECT azp03 INTO l_azp03 FROM azp_file WHERE azp01=l_last_plant

         IF l_poz011='2' THEN
            LET l_dbs_new = l_azp03 CLIPPED,"."
           # FUN-980093 add----GP5.2 Modify #改抓Transaction DB
            LET g_plant_new = l_last_plant
            LET l_plant_new = g_plant_new
            CALL s_getdbs()
            LET l_dbs_new = g_dbs_new
            CALL s_gettrandbs()
            LET l_dbs_tra = g_dbs_tra
         
            SELECT oea99 INTO g_oea.oea99 FROM oea_file 
             WHERE oea01=g_oep.oep01
            
            LET l_sql  = "SELECT oea01 ",
                         #"  FROM ",l_dbs_new CLIPPED,"oea_file ",
                         "  FROM ",cl_get_target_table(l_plant_new,'oea_file'), #FUN-A50102
                         " WHERE oea99='",g_oea.oea99,"' "
            CALL cl_replace_sqldb(l_sql) RETURNING l_sql        #FUN-920032  #FUN-950007 add
            CALL cl_parse_qry_sql(l_sql,l_plant_new) RETURNING l_sql #FUN-A50102
            PREPARE oea_p8 FROM l_sql
            DECLARE oea_c8 CURSOR FOR oea_p8
            OPEN oea_c8
            FETCH oea_c8 INTO l_oea01
            CLOSE oea_c8
         ELSE 
            LET l_dbs_new =null
           # FUN-980093 add----GP5.2 Modify #改抓Transaction DB
            LET g_plant_new = g_plant
            LET l_plant_new = g_plant_new
            CALL s_getdbs()
            LET l_dbs_new = g_dbs_new
            CALL s_gettrandbs()
            LET l_dbs_tra = g_dbs_tra
            LET l_oea01 =g_oep.oep01
         END IF 

         LET l_sql  = "SELECT oeb24-oeb25,oeb23,oeb03 ",
                      #"  FROM ",l_dbs_tra CLIPPED,"oeb_file ", #FUN-980093 add
                      "  FROM ",cl_get_target_table(l_plant_new,'oeb_file'), #FUN-A50102
                      " WHERE oeb01= '",l_oea01,"' ",
                      "   AND oeb03= '",l_oeq03,"' "
         
         CALL cl_replace_sqldb(l_sql) RETURNING l_sql        #FUN-920032  #FUN-950007 add
         CALL cl_parse_qry_sql(l_sql,l_plant_new) RETURNING l_sql #FUN-980093
         PREPARE oea_p9 FROM l_sql
         DECLARE oea_c9 CURSOR FOR oea_p9
         OPEN oea_c9
         LET l_oeb12 = 0   #MOD-8A0245
         LET l_oeb23 = 0   #MOD-8A0245
         LET l_oeb03 = NULL   #MOD-8A0245

         FETCH oea_c9 INTO l_oeb12,l_oeb23,l_oeb03
         CLOSE oea_c9
         IF l_oeb12 + l_oeb23 > l_oeq12a THEN
            CALL cl_err(l_dbs_tra,'axm0007',1)
            LET g_success = 'N'
            RETURN
         END IF 
         #-----END MOD-B60008-----
      END IF
   END FOREACH

   LET g_up_flag='N'

   #...更改訂單單頭檔 99.01.13 by linda add
   CALL t800_upd_oea1(g_oep.*)
   IF g_success='N' THEN RETURN END IF

   #訂單變更發出修改 oea_file後才CALL t800_hu1()

   UPDATE oep_file SET oep09 = '2'    #發出
    WHERE oep01 = g_oep.oep01 AND oep02 = g_oep.oep02
   IF STATUS OR SQLCA.sqlerrd[3] = 0 THEN
      CALL cl_err('g1_upd_oep',SQLCA.SQLCODE,1)
      LET g_success = 'N'
      RETURN
   END IF

   DECLARE t800_cur2 CURSOR FOR                 #bugno:5600 add.......
           SELECT oeq05a,oeq05b,oeq04a,oeq04b,oeq041a,oeq041b,oeq03,oeq12b,oeq12a,
                  oeq13a,oeq13b,oeq14a,oeq14b,oeq15a,oeq15b,oeq14ta,oeq14tb,   #MOD-A70005 add oeq14tb
                  oeq23a,oeq23b,oeq24a,oeq24b,oeq25a,oeq25b,oeq20a,oeq20b,
                  oeq21a,oeq21b,oeq22a,oeq22b,oeq26a,oeq26b,oeq27a,oeq27b,
                  oeq28a,oeq28b,oeq29a,oeq29b   #No:FUN-740016
                 ,oeq30a,oeq30b                 #No.FUN-990030
                 ,oeq31a,oeq32a,oeq33a          #FUN-A80118 Add
                 ,oeq37a,oeq37b,oeq50                 #FUN-AB0082
             FROM oeq_file
            WHERE oeq01 = g_oep.oep01 AND oeq02 = g_oep.oep02

   FOREACH t800_cur2 INTO g_oeq05a,g_oeq05b,g_oeq04a,g_oeq04b,g_oeq041a,
                          g_oeq041b,  #bugno:5644 add.............
                          g_oeq03,g_oeq12b,g_oeq12a,g_oeq13a,g_oeq13b,
                          g_oeq14a,g_oeq14b,g_oeq15a,g_oeq15b,g_oeq14ta,g_oeq14tb,   #MOD-A70005 add g_oeq14tb
                          g_oeq23a,g_oeq23b,g_oeq24a,g_oeq24b,
                          g_oeq25a,g_oeq25b,g_oeq20a,g_oeq20b,
                          g_oeq21a,g_oeq21b,g_oeq22a,g_oeq22b,
                          g_oeq26a,g_oeq26b,g_oeq27a,g_oeq27b,
                          g_oeq28a,g_oeq28b,g_oeq29a,g_oeq29b   #No:FUN-740016
                         ,g_oeq30a,g_oeq30b                     #No.FUN-990030
                         ,g_oeq31a,g_oeq32a,g_oeq33a            #FUN-A80118 Add
                         ,g_oeq37a,g_oeq37b                     #FUN-AB0082
      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         CALL s_errmsg('','',"Foreach t800_cur2:",SQLCA.sqlcode,1)   #No.FUN-710046
         EXIT FOREACH
      END IF

      IF g_success = "N" THEN                                                                                                        
         LET g_totsuccess = "N"                                                                                                      
         LET g_success = "Y"                                                                                                         
      END IF                                                                                                                         

      SELECT oeb04 INTO l_oeb04 FROM oeb_file
       WHERE oeb01=g_oep.oep01 AND oeb03 =g_oeq03

      #.....判斷若為新增的項次,則變更前的值為NULL
      IF status=100 THEN
         IF cl_null(g_oeq12b) THEN LET g_oeq12b=0 END IF
         IF cl_null(g_oeq13b) THEN LET g_oeq13b=0 END IF
         IF cl_null(g_oeq37b) THEN LET g_oeq37b=0 END IF     #FUN-AB0082
         IF cl_null(g_oeq14b) THEN LET g_oeq14b=0 END IF
         IF cl_null(g_oeq14tb) THEN LET g_oeq14tb=0 END IF   #MOD-A70005
         IF cl_null(g_oeq23b) THEN LET g_oeq23b=0 END IF
         IF cl_null(g_oeq24b) THEN LET g_oeq24b=0 END IF
         IF cl_null(g_oeq25b) THEN LET g_oeq25b=0 END IF
         IF cl_null(g_oeq20b) THEN LET g_oeq20b=0 END IF
         IF cl_null(g_oeq21b) THEN LET g_oeq21b=0 END IF
         IF cl_null(g_oeq22b) THEN LET g_oeq22b=0 END IF
         IF cl_null(g_oeq26b) THEN LET g_oeq26b=0 END IF
         IF cl_null(g_oeq27b) THEN LET g_oeq27b=0 END IF
         LET l_oeb04 = g_oeq04a
      END IF

      CALL up_price(l_oeb04,g_oep.oep01,g_oep.oep02,g_oeq03)
      #若有更改訂購量oeq12a 或 單價oeq13a 才須要更新產品客戶檔obk_file
      IF NOT cl_null(g_oeq27a) OR NOT cl_null(g_oeq13a) THEN
          #若oeq12a 為NULL 代表訂購量不變
          IF cl_null(g_oeq27a) THEN LET g_oeq27a = g_oeq27b END IF
          #若oeq13a 為NULL 代表單價  不變
          IF cl_null(g_oeq13a) THEN LET g_oeq13a = g_oeq13b END IF

 #         CALL t800_bu3() IF g_success = 'N' THEN RETURN END IF  #更新產品客戶
      END IF
      IF g_success = 'N' THEN EXIT FOREACH END IF
   END FOREACH

   #-----No:FUN-A50103-----
   IF g_success = 'N' THEN 
      RETURN
   END IF

   CALL t800_upd_oeaacrm(g_oep.*)

   IF g_success = 'N' THEN 
      RETURN
   END IF
   #-----No:FUN-A50103 END-----

   IF g_totsuccess="N" THEN                                                                                                       
      LET g_success="N"                                                                                                           
   END IF                                                                                                                         

   #稅率不同時要重算單身之含稅金額, 未稅金額
   IF g_up_flag='Y' THEN
      CALL t800_upd_oebcrm(g_oep.*)
   END IF

#   CALL t800_hu1()  #客戶信用查核   #MOD-9B0010
   IF g_success = 'N' THEN 
      RETURN
   END IF

   CALL t800_upd_oea61crm(g_oep.*)

END FUNCTION

FUNCTION t800_upd_oea1(g_oep)
   DEFINE l_oea211   LIKE oea_file.oea211
   DEFINE l_oea212   LIKE oea_file.oea212
   DEFINE l_oea213   LIKE oea_file.oea213
   DEFINE l_oap      RECORD LIKE oap_file.*
   DEFINE g_oep      RECORD LIKE oep_file.*
   DEFINE g_oea      RECORD LIKE oea_file.*
   DEFINE exT        LIKE  oaz_file.oaz52
   DEFINE g_up_flag  LIKE type_file.chr1
   DEFINE g_cnt      LIKE type_file.num5 
   
   SELECT * INTO g_oea.* FROM oea_file
    WHERE oea01=g_oep.oep01

   IF SQLCA.SQLCODE <>0 THEN
      CALL cl_err('sel oea:',SQLCA.SQLCODE,0)
      LET g_success='N'
      RETURN
   END IF

   IF NOT cl_null(g_oep.oep06b) THEN
      LET g_oea.oea044 = g_oep.oep06b
      IF g_oea.oea044[1,4]='MISC' THEN
         SELECT * INTO l_oap.* FROM oap_file
          WHERE oap01=g_oep.oep01
         IF STATUS = 100 THEN
            CALL cl_err('sel oap:',STATUS,1) LET g_success ='N'
         END IF
         SELECT ocd221,ocd222,ocd223
           INTO l_oap.oap041,l_oap.oap042,l_oap.oap043
           FROM ocd_file
          WHERE ocd01=g_oea.oea04 AND ocd02=g_oea.oea044
         #更新單據出貨地址檔
         UPDATE oap_file SET oap041 = l_oap.oap041,
                             oap042 = l_oap.oap042,
                             oap043 = l_oap.oap043
         WHERE oap01 = g_oep.oep01
         IF STATUS THEN
            CALL cl_err('upd oap:',STATUS,1) LET g_success = 'N'
         END IF
      END IF
   END IF

   IF NOT cl_null(g_oep.oep07b) THEN
      LET g_oea.oea32 = g_oep.oep07b    #收款條件
   END IF

   IF NOT cl_null(g_oep.oep08b) THEN
      LET g_oea.oea23 = g_oep.oep08b    #幣別
      IF g_oea.oea08='1' THEN
         LET exT=g_oaz.oaz52
      ELSE
         LET exT=g_oaz.oaz70
      END IF
      CALL s_curr3(g_oea.oea23,g_oea.oea02,exT) RETURNING g_oea.oea24
   END IF

   IF NOT cl_null(g_oep.oep10b) THEN  
      LET g_oea.oea31 = g_oep.oep10b
   END IF

   IF NOT cl_null(g_oep.oep11b) THEN  
      LET g_oea.oea43 = g_oep.oep11b
   END IF

   #-----No:FUN-A50103-----
   IF NOT cl_null(g_oep.oep161b) THEN
      LET g_oea.oea161 = g_oep.oep161b
   END IF

   IF NOT cl_null(g_oep.oep162b) THEN
      LET g_oea.oea162 = g_oep.oep162b
   END IF

   IF NOT cl_null(g_oep.oep163b) THEN
      LET g_oea.oea163 = g_oep.oep163b
   END IF

   IF NOT cl_null(g_oep.oep261b) THEN
      LET g_oea.oea261 = g_oep.oep261b
   END IF

   IF NOT cl_null(g_oep.oep262b) THEN
      LET g_oea.oea262 = g_oep.oep262b
   END IF

   IF NOT cl_null(g_oep.oep263b) THEN
      LET g_oea.oea263 = g_oep.oep263b
   END IF
   #-----No:FUN-A50103 END-----

   #FUN-A80118--Add--Begin
   IF NOT cl_null(g_oep.oep14b) THEN 
      LET g_oea.oea21 = g_oep.oep14b
      SELECT gec04,gec05,gec07
        INTO g_oea.oea211,g_oea.oea212,g_oea.oea213
        FROM gec_file
       WHERE gec01 = g_oea.oea21
         AND gec011 = '2'
      LET g_up_flag='Y'
   END IF

   IF NOT cl_null(g_oep.oep15b) THEN 
      LET g_oea.oea10 = g_oep.oep15b
   END IF
   #FUN-A80118--Add--End
   #更新單頭檔
   UPDATE oea_file
      SET oea21  = g_oea.oea21,
          oea211 = g_oea.oea211,
          oea212 = g_oea.oea212,
          oea213 = g_oea.oea213,
          oea32  = g_oea.oea32,
          oea23  = g_oea.oea23,
          oea24  = g_oea.oea24,
          oea31  = g_oea.oea31, #FUN-560263
          oea43  = g_oea.oea43, #FUN-560263
          oea044 = g_oea.oea044, #no.7214
          oea161 = g_oea.oea161,    #No:FUN-A50103
          oea162 = g_oea.oea162,    #No:FUN-A50103
          oea163 = g_oea.oea163,    #No:FUN-A50103
          oea261 = g_oea.oea261,    #No:FUN-A50103
          oea262 = g_oea.oea262,    #No:FUN-A50103
          oea263 = g_oea.oea263,    #No:FUN-A50103
          #FUN-A80118--Add--Begin
#         oea21 = g_oea.oea21,
#         oea211= g_oea.oea211,
#         oea212= g_oea.oea212,
#         oea213= g_oea.oea213,
          oea10 = g_oea.oea10
          #FUN-A80118--Add--End
     WHERE oea01 = g_oep.oep01
   IF SQLCA.SQLCODE <>0 THEN
      LET g_success = 'N'
   END IF

   #FUN-B30063 add begin-----------
   IF g_oea.oea10='NULL' OR g_oea.oea10='null' THEN 
      UPDATE oea_file
         SET oea10  = ''
       WHERE oea01 = g_oep.oep01 
   END IF
   IF SQLCA.SQLCODE <>0 THEN
      LET g_success = 'N'
   END IF
   #FUN-B30063 add end-------------

END FUNCTION

FUNCTION up_price(p_part,p_oep01,p_oep02,p_oeq03)
  DEFINE
      p_part       LIKE oeb_file.oeb04,   # 料件編號
      l_ima25      LIKE ima_file.ima25,
      l_oeb11      LIKE oeb_file.oeb11,
      l_oeb05_fac  LIKE oeb_file.oeb05_fac,
      l_oeb930     LIKE oeb_file.oeb930, #FUN-680006
      l_oea15      LIKE oea_file.oea15   #MOD-920057
   DEFINE 
      l_oea12      LIKE oea_file.oea12,
      l_oeb71      LIKE oeb_file.oeb71,
      l_qty        LIKE oeb_file.oeb12
  DEFINE l_oeb906 LIKE oeb_file.oeb906 #TQC-6C0109
  DEFINE l_oeb05_1 LIKE oeb_file.oeb05  
  DEFINE l_oeb04 LIKE oeb_file.oeb04    
  DEFINE l_oeb05 LIKE oeb_file.oeb05    
  DEFINE l_oeb12 LIKE oeb_file.oeb12    
  DEFINE l_oeq04 LIKE oeq_file.oeq04a   #MOD-890137
  DEFINE l_oeq05  LIKE oeq_file.oeq05a #MOD-920299 
  DEFINE l_ima906 LIKE ima_file.ima906   #MOD-A40018
  DEFINE l_oeq50  LIKE oeq_file.oeq50
  DEFINE g_cnt      LIKE type_file.num5 
  DEFINE l_flag     LIKE type_file.chr1
  DEFINE g_oeb11    LIKE oeb_file.oeb11
  DEFINE p_oep01    LIKE oep_file.oep01
  DEFINE p_oeq03    LIKE oeq_file.oeq03
  DEFINE p_oep02    LIKE oep_file.oep02
   DEFINE g_oeq05a       LIKE oeq_file.oeq05a
   DEFINE g_oeq05b       LIKE oeq_file.oeq05b   
   DEFINE g_oeq04a       LIKE oeq_file.oeq04a   
   DEFINE g_oeq04b       LIKE oeq_file.oeq04b   
   DEFINE g_oeq041a      LIKE oeq_file.oeq041a  
   DEFINE g_oeq041b      LIKE oeq_file.oeq041b  
   DEFINE g_oeq03        LIKE oeq_file.oeq03    
   DEFINE g_oeq12a       LIKE oeq_file.oeq12a   
   DEFINE g_oeq12b       LIKE oeq_file.oeq12b   
   DEFINE g_oeq13a       LIKE oeq_file.oeq13a   
   DEFINE g_oeq13b       LIKE oeq_file.oeq13b   
   DEFINE g_oeq14a       LIKE oeq_file.oeq14a   
   DEFINE g_oeq14b       LIKE oeq_file.oeq14b   
   DEFINE g_oeq14ta      LIKE oeq_file.oeq14ta  
   DEFINE g_oeq14tb      LIKE oeq_file.oeq14tb  
   DEFINE g_oeq15a       LIKE oeq_file.oeq15a   
   DEFINE g_oeq15b       LIKE oeq_file.oeq15b   
   DEFINE g_oeq20a       LIKE oeq_file.oeq20a   
   DEFINE g_oeq20b       LIKE oeq_file.oeq20b   
   DEFINE g_oeq21a       LIKE oeq_file.oeq21a   
   DEFINE g_oeq21b       LIKE oeq_file.oeq21b   
   DEFINE g_oeq22a       LIKE oeq_file.oeq22a   
   DEFINE g_oeq22b       LIKE oeq_file.oeq22b   
   DEFINE g_oeq23a       LIKE oeq_file.oeq23a   
   DEFINE g_oeq23b       LIKE oeq_file.oeq23b   
   DEFINE g_oeq24a       LIKE oeq_file.oeq24a   
   DEFINE g_oeq24b       LIKE oeq_file.oeq24b   
   DEFINE g_oeq25a       LIKE oeq_file.oeq25a   
   DEFINE g_oeq25b       LIKE oeq_file.oeq25b   
   DEFINE g_oeq26a       LIKE oeq_file.oeq26a   
   DEFINE g_oeq26b       LIKE oeq_file.oeq26b   
   DEFINE g_oeq27a       LIKE oeq_file.oeq27a   
   DEFINE g_oeq27b       LIKE oeq_file.oeq27b   
   DEFINE g_oeq28a       LIKE oeq_file.oeq28a   
   DEFINE g_oeq28b       LIKE oeq_file.oeq28b   
   DEFINE g_oeq29a       LIKE oeq_file.oeq29a   
   DEFINE g_oeq29b       LIKE oeq_file.oeq29b   
   DEFINE g_oeq30a       LIKE oeq_file.oeq30a   
   DEFINE g_oeq30b       LIKE oeq_file.oeq30b   
   DEFINE g_oeq31a       LIKE oeq_file.oeq31a   
   DEFINE g_oeq31b       LIKE oeq_file.oeq31b   
   DEFINE g_oeq32a       LIKE oeq_file.oeq32a   
   DEFINE g_oeq32b       LIKE oeq_file.oeq32b   
   DEFINE g_oeq33a       LIKE oeq_file.oeq33a   
   DEFINE g_oeq33b       LIKE oeq_file.oeq33b   
   DEFINE g_oeq37a       LIKE oeq_file.oeq37a   
   DEFINE g_oeq37b       LIKE oeq_file.oeq37b  
   DEFINE g_msg          LIKE type_file.chr1000
   DEFINE g_oep  RECORD LIKE oep_file.*
   
   SELECT *  INTO g_oep.* FROM oep_file
       WHERE oep01 = p_oep01
         AND oep02 = p_oep02  
   LET g_oeq03=p_oeq03      

           SELECT oeq05a,oeq05b,oeq04a,oeq04b,oeq041a,oeq041b,oeq03,oeq12b,oeq12a,
                  oeq13a,oeq13b,oeq14a,oeq14b,oeq15a,oeq15b,oeq14ta,oeq14tb,   #MOD-A70005 add oeq14tb
                  oeq23a,oeq23b,oeq24a,oeq24b,oeq25a,oeq25b,oeq20a,oeq20b,
                  oeq21a,oeq21b,oeq22a,oeq22b,oeq26a,oeq26b,oeq27a,oeq27b,
                  oeq28a,oeq28b,oeq29a,oeq29b   #No:FUN-740016
                 ,oeq30a,oeq30b                 #No.FUN-990030
                 ,oeq31a,oeq32a,oeq33a          #FUN-A80118 Add
                 ,oeq37a,oeq37b,oeq50                 #FUN-AB0082
           INTO g_oeq05a,g_oeq05b,g_oeq04a,g_oeq04b,g_oeq041a,
                          g_oeq041b,  #bugno:5644 add.............
                          g_oeq03,g_oeq12b,g_oeq12a,g_oeq13a,g_oeq13b,
                          g_oeq14a,g_oeq14b,g_oeq15a,g_oeq15b,g_oeq14ta,g_oeq14tb,   #MOD-A70005 add g_oeq14tb
                          g_oeq23a,g_oeq23b,g_oeq24a,g_oeq24b,
                          g_oeq25a,g_oeq25b,g_oeq20a,g_oeq20b,
                          g_oeq21a,g_oeq21b,g_oeq22a,g_oeq22b,
                          g_oeq26a,g_oeq26b,g_oeq27a,g_oeq27b,
                          g_oeq28a,g_oeq28b,g_oeq29a,g_oeq29b   #No:FUN-740016
                         ,g_oeq30a,g_oeq30b                     #No.FUN-990030
                         ,g_oeq31a,g_oeq32a,g_oeq33a            #FUN-A80118 Add
                         ,g_oeq37a,g_oeq37b                   
             FROM oeq_file
            WHERE oeq01 = p_oep01 AND oeq02 = p_oep02 and oeq03=p_oeq03

                   #FUN-AB0082



#-判斷是否為新增的序號,若是則insert,否則update -----
  LET g_cnt=0
  SELECT COUNT(*) INTO g_cnt FROM oeb_file
   WHERE oeb01=p_oep01 AND oeb03=p_oeq03

  IF g_cnt=0 THEN
    #---取庫存單位
    SELECT ima25 INTO l_ima25 FROM ima_file WHERE ima01=g_oeq04a
    #---取換算率
    CALL s_umfchk(g_oeq04a,g_oeq05a,l_ima25) RETURNING l_flag,l_oeb05_fac
    IF l_flag=1 THEN LET l_oeb05_fac=1 END IF

    #抓產品客戶檔obk11
    SELECT obk11 INTO l_oeb906
      FROM obk_file
     WHERE obk01 = g_oeq04a
       AND obk02 = (SELECT oea03 FROM oea_file 
                    WHERE oea01 = g_oep.oep01 )

    IF cl_null(l_oeb906) THEN
       LET l_oeb906='N'
    END IF

    IF g_aaz.aaz90='Y' THEN
       SELECT oeb930 INTO l_oeb930 FROM oeb_file
                                  WHERE oeb01=g_oep.oep01
                                    AND oeb03=g_oeq03
       IF SQLCA.sqlcode THEN
          SELECT oea15 INTO l_oea15 FROM oea_file
            WHERE oea01 = g_oep.oep01
          LET l_oeb930=s_costcenter(l_oea15) 
          IF cl_null(l_oeb930) THEN
             CALL cl_err(l_oea15,'axm1010',0)
             LET g_success = 'N'
             RETURN
          END IF
       END IF
    END IF

         LET l_oeb11 = ''
         SELECT MIN(obk03) INTO l_oeb11 FROM obk_file
             WHERE obk01=g_oeq04a
               AND obk02= (SELECT oea03 FROM oea_file
                           WHERE oea01 = g_oep.oep01 )
         LET g_oeb11 = l_oeb11   #MOD-880003
         IF cl_null(g_oeq37a) OR g_oeq37a = 0 THEN LET g_oeq37a = g_oeq13a END IF #FUN-AB0082
    INSERT INTO oeb_file(oeb01,oeb03,oeb04,oeb05,oeb05_fac,
                         oeb06,oeb12,oeb13,oeb17,oeb14,oeb14t,oeb15,oeb72,oeb16,oeb19, #no.7150(add oeb17)    #NO.FUN-920031--addoeb16  #FUN-B20060 add oeb72
                         oeb23,oeb24,oeb25,oeb26,oeb70,oeb905,
                         oeb913,oeb914,oeb915,oeb910,oeb911,oeb912,oeb916,oeb917,oeb930,oeb30,oeb31,oeb906, #no.7182 #FUN-680006   #No:FUN-740016 #TQC-6C0109 add oeb906
                         oeb1003,oeb11,oeb28,oeb920,oeb1012,oeb1001,oeb1006,   #MOD-760026 add  #MOD-760079 modify    #MOD-920324 add oeb28/oeb920 #MOD-960263 add oeb1012#No.FUN-990030 add oeb1001   #MOD-A10123 add oeb1006
                         oebplant,oeblegal   #FUN-980010 add plant & legal
                         ,oeb41,oeb42,oeb43,oeb37) #FUN-A80118 Add      #FUN-AB0082 add oeb37
      VALUES (g_oep.oep01,g_oeq03,g_oeq04a,g_oeq05a,l_oeb05_fac,
              g_oeq041a,g_oeq12a,g_oeq13a,g_oeq13a,g_oeq14a,g_oeq14ta,g_oeq15a,g_oeq15a,g_oeq15a,'N',    #NO.FUN-920031--add #FUN-B20060 add g_oeq15a
              0,0,0,0,'N',0,g_oeq23a,g_oeq24a,g_oeq25a,g_oeq20a,g_oeq21a,
              g_oeq22a,g_oeq26a,g_oeq27a,l_oeb930,g_oeq28a,g_oeq29a,l_oeb906,'1',l_oeb11,0,0,'',g_oeq30a,100,     #g_oeb1012 ->'' by chetnao 171104
              g_plant,g_legal,g_oeq31a,g_oeq32a,g_oeq33a,g_oeq37a)  #FUN-A80118 Add g_oeq31a,g_oeq32a,g_oeq33a       #FUN-AB0082 add l_oeb37
     IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3]=0 THEN
        LET g_success = 'N'
        CALL s_errmsg('','',"(axmt800:ins)",SQLCA.sqlcode,1)  #No.FUN-710046
        RETURN
     END IF
#     CALL t800_upd_ima33('a',g_oeq03,g_oeq04a,g_oeq05a)   #MOD-870273 add
  ELSE
  {ckp#3}
  #--->更新oeb_file
   # bygao161224
  IF g_plant='YLD009' THEN
  	 LET l_oeq50=''
  	 SELECT oeq50 INTO l_oeq50 FROM oeq_file WHERE oeq01 = g_oep.oep01 AND oeq03 = g_oeq03
  	   AND oeq02= ( select max(oeq02) from oeq_file where oeq01=g_oep.oep01 AND oeq03=g_oeq03 )
      
      	IF NOT cl_null(l_oeq50) OR l_oeq50<>'' THEN
             UPDATE oeb_file SET oebud01  = l_oeq50               # 更新备注
             WHERE oeb01 = g_oep.oep01 AND oeb03 = g_oeq03   
         END IF 
  END IF   # end 
     
  #--->有變更料號的情況下,新料號須再做更新
  IF ( NOT cl_null(g_oeq04a) AND p_part != g_oeq04a )   #bugno:5644
  THEN
      #抓產品客戶檔obk11
      SELECT obk11 INTO l_oeb906
        FROM obk_file
       WHERE obk01 = g_oeq04a
         AND obk02 = (SELECT oea03 FROM oea_file 
                      WHERE oea01 = g_oep.oep01 )

      IF cl_null(l_oeb906) THEN
         LET l_oeb906='N'
      END IF
      UPDATE oeb_file
         SET oeb04  = g_oeq04a                #料件編號
            ,oeb06  = g_oeq041a               #品名   #MOD-9B0044
            ,oeb19  = 'N'                     #備置否   #MOD-670129 add
            ,oeb905 = 0                       #已備置量 #MOD-670129 add
            ,oeb906 = l_oeb906                #TQC-6C0109
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03                  #訂單單項次
      IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] =0 THEN
         LET g_success = 'N'
         CALL s_errmsg('','',"axmt800:ckp#3",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF
#      CALL t800_upd_ima33('u',g_oeq03,'','')   #MOD-870273 add
   END IF
         LET l_oeb11 = ''
         LET g_msg=NULL
         IF cl_null(g_oeq04a) THEN
            LET l_oeq04 = g_oeq04b
         ELSE
            LET l_oeq04 = g_oeq04a
         END IF 
         SELECT MIN(obk03) INTO g_msg FROM obk_file
             WHERE obk01=l_oeq04    #MOD-890137
               AND obk02= (SELECT oea03 FROM oea_file
                           WHERE oea01 = g_oep.oep01 )
         LET g_oeb11 = g_msg   #MOD-880003
            UPDATE oeb_file
               SET oeb11 = g_msg                    #客戶料件編號
             WHERE oeb01 = g_oep.oep01
               AND oeb03 = g_oeq03                  #訂單單項次
            IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] =0 THEN
               LET g_success = 'N'       
               CALL s_errmsg("oeb01",g_oep.oep01,"UPD oeb_file",SQLCA.sqlcode,1)  #No.FUN-710046
               RETURN
            END IF

  #--->有變更品名的情況下須做更新
  IF ( NOT cl_null(g_oeq041a) AND g_oeq041a !=g_oeq041b )  #bugno:5644 add...
  THEN
      UPDATE oeb_file SET oeb06  = g_oeq041a  # 品名規格
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03       # 訂單單項次

      IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3] =0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#3.1)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF
   END IF
   #---> 變更銷售單位
   IF NOT cl_null(g_oeq05a) AND g_oeq05b != g_oeq05a THEN
      UPDATE oeb_file SET oeb05 = g_oeq05a    # 銷售單位
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#3.2)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF
      IF NOT cl_null(g_oeq04a) THEN
         LET l_oeq04 = g_oeq04a
      ELSE
         LET l_oeq04 = g_oeq04b
      END IF 
      IF NOT cl_null(g_oeq05a) THEN
         LET l_oeq05 = g_oeq05a
      ELSE
         LET l_oeq05 = g_oeq05b
      END IF 
      SELECT ima25 INTO l_ima25 FROM ima_file
        WHERE ima01 = l_oeq04
      CALL s_umfchk(l_oeq04,l_oeq05,l_ima25) RETURNING l_flag,l_oeb05_fac
      IF l_flag=1 THEN LET l_oeb05_fac=1 END IF
      UPDATE oeb_file SET oeb05_fac = l_oeb05_fac
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#3.2)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF
   END IF
{ckp#4}
   IF NOT cl_null(g_oeq12a) AND g_oeq12a != g_oeq12b THEN  # 變更訂購量
      UPDATE oeb_file SET oeb12 = g_oeq12a # 變更後訂購量
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#3.4)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF
      #----------------------------------------------------
      #判斷變更訂單是否由合約訂單轉入，若是的話須去update
      #合約訂單的"已訂數量"欄位
      #----------------------------------------------------
      SELECT oea12,oeb71 INTO l_oea12,l_oeb71 FROM oea_file,oeb_file
          WHERE oeb01 = g_oep.oep01
            AND oeb03 = g_oeq03
            AND oea11 = '3' 
            AND oea01 = oeb01
      IF NOT cl_null(l_oea12) AND NOT cl_null (l_oeb71) THEN
         LET l_qty = 0
         DECLARE oeb12_cs CURSOR FOR
           SELECT oeb04,oeb05,oeb12 FROM oea_file,oeb_file
            WHERE oea12 = l_oea12 AND oea00 IN ('1','3','4','6','7') 
              AND oeaconf = 'Y' 
              AND oea01 = oeb01
              AND oeb71 = l_oeb71
         LET l_oeb05_1 = ''
         SELECT oeb05 INTO l_oeb05_1 FROM oeb_file
           WHERE oeb01 = l_oea12
             AND oeb03 = l_oeb71
         LET l_oeb12 = 0                               #MOD-940401 add
         FOREACH oeb12_cs INTO l_oeb04,l_oeb05,l_oeb12
           CALL s_umfchk(l_oeb04,l_oeb05,l_oeb05_1) RETURNING l_flag,l_oeb05_fac 
           IF l_flag = 1 THEN LET l_oeb05_fac = 1 END IF
           LET l_qty = l_qty + (l_oeb12 * l_oeb05_fac)
         END FOREACH
         IF SQLCA.SQLCODE THEN
            LET g_success = 'N'
            LET g_showmsg=l_oea12,"/",l_oeb71       #No.FUN-710046
            CALL s_errmsg("oea12,oeb71",g_showmsg,"oeb:ckp",SQLCA.sqlcode,1)   #No.FUN-710046
            RETURN
         ELSE
            UPDATE oeb_file SET oeb24 = l_qty
                            WHERE oeb01 = l_oea12
                              AND oeb03 = l_oeb71
             IF SQLCA.SQLERRD[3] = 0 THEN
                LET g_success = 'N'
                LET g_showmsg=l_oea12,"/",l_oeb71          #No.FUN-710046
                CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#3.4)",SQLCA.sqlcode,1)  #No.FUN-710046
                RETURN
             END IF
         END IF
      END IF   
   END IF
{ckp#5}
   IF NOT cl_null(g_oeq13a) AND g_oeq13a != g_oeq13b THEN  # 變更單價
      UPDATE oeb_file SET oeb13 = g_oeq13a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#5)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#5.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
 #     CALL t800_upd_ima33('u',g_oeq03,'','')   #MOD-870273 add
   END IF
  #FUN-AB0082 Begin---
   IF NOT cl_null(g_oeq37a) AND g_oeq37a != g_oeq37b THEN  # 變更單價
      UPDATE oeb_file SET oeb37 = g_oeq37a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#5)",SQLCA.sqlcode,1)
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#5.1)","mfg9328",1)
         RETURN
      END IF
   END IF
  #FUN-AB0082 End-----
{ckp#6}
   IF NOT cl_null(g_oeq14a) AND g_oeq14a != g_oeq14b THEN  # 變更金額
      #UPDATE oeb_file SET oeb14 = g_oeq14a, oeb14t = g_oeq14ta   #MOD-A70005
      UPDATE oeb_file SET oeb14 = g_oeq14a   #MOD-A70005
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#6)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#6.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
#-----MOD-A70005---------
{ckp#6-1}
   IF NOT cl_null(g_oeq14ta) AND g_oeq14ta != g_oeq14tb THEN  # 變更金額
      UPDATE oeb_file SET oeb14t = g_oeq14ta   
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03        
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#6-1)",SQLCA.sqlcode,1) 
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03        
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#6-1.1)","mfg9328",1)  
         RETURN
      END IF
   END IF
#-----END MOD-A70005-----
{ckp#7}
   IF NOT cl_null(g_oeq15a) AND (g_oeq15a != g_oeq15b OR
          g_oeq15b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb15 = g_oeq15a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#7)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#7.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
{ckp#8}
   IF NOT cl_null(g_oeq23a) AND (g_oeq23a != g_oeq23b OR
          g_oeq23b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb913 = g_oeq23a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#8)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#8.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
{ckp#9}
   IF NOT cl_null(g_oeq24a) AND (g_oeq24a != g_oeq24b OR
          g_oeq24b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb914 = g_oeq24a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#9)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#9.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
{ckp#10}
   IF NOT cl_null(g_oeq25a) AND (g_oeq25a != g_oeq25b OR
          g_oeq25b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb915 = g_oeq25a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#10)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#10.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
   #-----MOD-A40018---------
{ckp#16}
   LET l_ima906 = ''
   SELECT ima906 INTO l_ima906 FROM ima_file
     WHERE ima01=g_oeq04a
   IF l_ima906 = '1' THEN   
      UPDATE oeb_file SET oeb913=NULL,oeb914=NULL,oeb915=NULL
         WHERE oeb01 = g_oep.oep01
           AND oeb03 = g_oeq03
      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03           
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#16)",SQLCA.sqlcode,1) 
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#16.1)","mfg9328",1)  
         RETURN
      END IF
                          
   END IF  
   #-----END MOD-A40018-----
{ckp#11}
   IF NOT cl_null(g_oeq20a) AND (g_oeq20a != g_oeq20b OR
          g_oeq20b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb910 = g_oeq20a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046 
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#11)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#11.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
{ckp#12}
   IF NOT cl_null(g_oeq21a) AND (g_oeq21a != g_oeq21b OR
          g_oeq21b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb911 = g_oeq21a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#12)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#12.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
{ckp#13}
   IF NOT cl_null(g_oeq22a) AND (g_oeq22a != g_oeq22b OR
          g_oeq22b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb912 = g_oeq22a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#13)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#13.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
{ckp#14}
   IF NOT cl_null(g_oeq26a) AND (g_oeq26a != g_oeq26b OR
          g_oeq26b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb916 = g_oeq26a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#14)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#14.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
{ckp#15}
   IF NOT cl_null(g_oeq27a) AND (g_oeq27a != g_oeq27b OR
          g_oeq27b IS NULL)  THEN   # 變更原始交貨日期
      UPDATE oeb_file SET oeb917 = g_oeq27a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#15)",SQLCA.sqlcode,1)  #No.FUN-710046
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03          #No.FUN-710046
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#15.1)","mfg9328",1)  #No.FUN-710046
         RETURN
      END IF
   END IF
   IF NOT cl_null(g_oeq28a) AND (g_oeq28a != g_oeq28b OR
          g_oeq28b IS NULL)  THEN
      UPDATE oeb_file SET oeb30 = g_oeq28a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#16)",SQLCA.sqlcode,1)
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03 
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#16.1)","mfg9328",1) 
         RETURN
      END IF
   END IF

   IF NOT cl_null(g_oeq29a) AND (g_oeq29a != g_oeq29b OR
          g_oeq29b IS NULL)  THEN
      UPDATE oeb_file SET oeb31 = g_oeq29a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03

      IF SQLCA.SQLCODE THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#17)",SQLCA.sqlcode,1)
         RETURN
      END IF

      IF SQLCA.SQLERRD[3] = 0 THEN
         LET g_success = 'N'
         LET g_showmsg=g_oep.oep01,"/",g_oeq03 
         CALL s_errmsg("oeb01,oeb03",g_showmsg,"(axmt800:ckp#17.1)","mfg9328",1) 
         RETURN
      END IF
   END IF
   IF NOT cl_null(g_oeq30a) AND (g_oeq30a != g_oeq30b OR g_oeq30b IS NULL)  THEN
      UPDATE oeb_file
         SET oeb1001=g_oeq30a 
       WHERE oeb01=g_oep.oep01 and oeb03=g_oeq03
   END IF

   #FUN-A80118--Add--Begin
   IF NOT cl_null(g_oeq31a) OR NOT cl_null(g_oeq32a) OR NOT cl_null(g_oeq33a) THEN
      UPDATE oeb_file SET oeb41=g_oeq31a,oeb42=g_oeq32a,oeb43=g_oeq33a
       WHERE oeb01 = g_oep.oep01
         AND oeb03 = g_oeq03
   END IF
   #FUN-A80118--Add--End

 END IF

END FUNCTION
{
FUNCTION t800_bu3()                             #更新產品客戶
 DEFINE l_oea03    LIKE oea_file.oea03
 DEFINE l_obk01    LIKE obk_file.obk01
 DEFINE l_obk05    LIKE obk_file.obk05
 DEFINE l_obk07    LIKE obk_file.obk07
 DEFINE l_obk08    LIKE obk_file.obk08
 DEFINE l_obk09    LIKE obk_file.obk09
 DEFINE l_obk11    LIKE obk_file.obk11,
        l_obk12    LIKE obk_file.obk12,
        l_obk13    LIKE obk_file.obk13,
        l_obk14    LIKE obk_file.obk14 

      CALL cl_msg("bu3!")                              #FUN-640184

      IF g_oaz.oaz44 = 'Y' THEN
      
          IF cl_null(g_oeq04a)  THEN
             LET l_obk01=g_oeq04b 
          ELSE 
             LET l_obk01=g_oeq04a 
          END IF 

          SELECT oea03 INTO l_oea03 FROM oea_file
           WHERE oea01 = g_oep.oep01

          IF cl_null(g_oep.oep08b) THEN
             LET l_obk05=g_oep.oep08 
          ELSE 
             LET l_obk05=g_oep.oep08b 
          END IF 

          IF cl_null(g_oeq26a)  THEN
             LET l_obk07 = g_oeq26b
          ELSE 
             LET l_obk07 = g_oeq26a
          END IF 

          IF cl_null(g_oeq13a)  THEN
             LET l_obk08 = g_oeq13b
          ELSE
             LET l_obk08 = g_oeq13a
          END IF 

          IF cl_null(g_oeq27a)  THEN
             LET l_obk09 = g_oeq27b
          ELSE 
             LET l_obk09 = g_oeq27a
          END IF 

          LET l_obk11 = 'N'

          INSERT INTO obk_file (obk01,obk02,
                                obk03,obk04,obk05,obk06,obk07,obk08,obk09,
                                obk11,obkacti)   #CHI-9C0060
          VALUES (l_obk01,l_oea03,
                  g_oeb11,g_oea.oea02,l_obk05,g_oea.oea21,
                  l_obk07 , l_obk08, l_obk09,
                  l_obk11,'Y')    #CHI-9C0060
          IF cl_sql_dup_value(SQLCA.SQLCODE) THEN 
             UPDATE obk_file SET obk03 = g_oeb11,
                                 obk04 = g_oea.oea02,
                                 obk05 = l_obk05,
                                 obk06 = g_oea.oea21,
                                 obk07 = l_obk07,
                                 obk08 = l_obk08,
                                 obk09 = l_obk09 
               WHERE obk01 = l_obk01 
                 AND obk02 = l_oea03 
                 AND obk05 = l_obk05 
          END IF
      END IF

      CALL cl_msg("")                              #FUN-640184


END FUNCTION
}

FUNCTION t800_upd_oeaacrm(g_oep)
   DEFINE l_oepa   RECORD LIKE oepa_file.*
   DEFINE l_oeaa   RECORD LIKE oeaa_file.*
   DEFINE g_oep    RECORD LIKE oep_file.*
   DECLARE t800_oepa CURSOR FOR SELECT * FROM oepa_file
                                 WHERE oepa01 = g_oep.oep01
                                   AND oepa011= g_oep.oep02

   FOREACH t800_oepa INTO l_oepa.*

      SELECT * INTO l_oeaa.* FROM oeaa_file
       WHERE oeaa01 = g_oep.oep01
         AND oeaa02 = l_oepa.oepa02
         AND oeaa03 = l_oepa.oepa03
      IF STATUS THEN    #找不到oeaa的資料，表示為新增
         INSERT INTO oeaa_file(oeaa01,oeaa02,oeaa03,oeaa04,oeaa05,oeaa06,oeaa07,
                               oeaa08,oeaaplant,oeaalegal)
                        VALUES(g_oep.oep01,l_oepa.oepa02,l_oepa.oepa03,
                               l_oepa.oepa04a,l_oepa.oepa05a,l_oepa.oepa06a,
                               l_oepa.oepa07a,l_oepa.oepa08a,g_plant,g_legal)
         IF STATUS THEN
            CALL cl_err3("ins","oeaa_file",g_oep.oep01,l_oepa.oepa03,SQLCA.sqlcode,"","",1)  
            LET g_success = "N"
         END IF
      ELSE    #修改
         IF NOT cl_null(l_oepa.oepa04a) THEN
            LET l_oeaa.oeaa04 = l_oepa.oepa04a
         END IF

         IF NOT cl_null(l_oepa.oepa05a) THEN
            LET l_oeaa.oeaa05 = l_oepa.oepa05a
         END IF

         IF NOT cl_null(l_oepa.oepa06a) THEN
            LET l_oeaa.oeaa06 = l_oepa.oepa06a
         END IF

         IF NOT cl_null(l_oepa.oepa07a) THEN
            LET l_oeaa.oeaa07 = l_oepa.oepa07a
         END IF

         IF NOT cl_null(l_oepa.oepa08a) THEN
            LET l_oeaa.oeaa08 = l_oepa.oepa08a
         END IF

         UPDATE oeaa_file SET oeaa04 = l_oeaa.oeaa04,
                              oeaa05 = l_oeaa.oeaa05,
                              oeaa06 = l_oeaa.oeaa06,
                              oeaa07 = l_oeaa.oeaa07,
                              oeaa08 = l_oeaa.oeaa08 
          WHERE oeaa01 = g_oep.oep01
            AND oeaa02 = l_oepa.oepa02
            AND oeaa03 = l_oepa.oepa03

         IF STATUS THEN
            LET g_success = 'N'
         END IF
      END IF
   END FOREACH
END FUNCTION

FUNCTION t800_upd_oebcrm(g_oep)
   DEFINE l_oeb   RECORD LIKE oeb_file.*,
          l_oea23 LIKE oea_file.oea23   #MOD-A70077
   DEFINE g_oep   RECORD LIKE oep_file.*
   DEFINE g_oea   RECORD LIKE oea_file.*
   
      SELECT * INTO g_oea.* FROM oea_file
    WHERE oea01=g_oep.oep01
     #-----MOD-A70077---------
     LET l_oea23 = g_oep.oep08
     IF NOT cl_null(g_oep.oep08b) THEN
        LET l_oea23 = g_oep.oep08b
     END IF
     #-----END MOD-A70077-----
    SELECT azi03,azi04 INTO t_azi03,t_azi04           #No.CHI-6A0004  g_azi-->t_azi
      FROM azi_file
     #WHERE azi01=g_oea.oea23   #MOD-A70077
     WHERE azi01=l_oea23   #MOD-A70077
   IF STATUS THEN
      CALL s_errmsg('','',"SEL azi_file",SQLCA.sqlcode,0)   #No.FUN-710046
   END IF
   DECLARE upd_oeb CURSOR FOR
      SELECT *
        FROM oeb_file
       WHERE oeb01 = g_oep.oep01
   FOREACH upd_oeb INTO l_oeb.*
     IF SQLCA.SQLCODE <> 0 THEN EXIT FOREACH END IF
     IF g_oea.oea213 = 'N'
        THEN LET l_oeb.oeb14=l_oeb.oeb917*l_oeb.oeb13
             LET l_oeb.oeb14t=l_oeb.oeb14*(1+g_oea.oea211/100)
        ELSE LET l_oeb.oeb14t=l_oeb.oeb917*l_oeb.oeb13
             LET l_oeb.oeb14=l_oeb.oeb14t/(1+g_oea.oea211/100)
     END IF
     CALL cl_digcut(l_oeb.oeb14,t_azi04) RETURNING l_oeb.oeb14          #No.CHI-6A0004  g_azi-->t_azi
     CALL cl_digcut(l_oeb.oeb14t,t_azi04) RETURNING l_oeb.oeb14t        #No.CHI-6A0004  g_azi-->t_azi
     UPDATE oeb_file
        SET oeb14 = l_oeb.oeb14,
            oeb14t = l_oeb.oeb14t
      WHERE oeb01 = l_oeb.oeb01
        AND oeb03 = l_oeb.oeb03
     IF SQLCA.SQLCODE <>0 THEN
        LET g_success = 'N'
        EXIT FOREACH
     END IF
   END FOREACH
END FUNCTION
FUNCTION t800_upd_oea61crm(g_oep)
  DEFINE l_oea61 LIKE oea_file.oea61
  DEFINE l_oea1008 LIKE oea_file.oea1008    #No:FUN-A50103
  DEFINE g_oep   RECORD LIKE oep_file.*
  DEFINE g_oea   RECORD LIKE oea_file.*

   SELECT * INTO g_oea.* FROM oea_file
    WHERE oea01=g_oep.oep01
  #SELECT SUM(oeb14) INTO l_oea61 FROM oeb_file WHERE oeb01=g_oep.oep01
   SELECT SUM(oeb14),SUM(oeb14t) INTO l_oea61,l_oea1008    #No:FUN-A50103
     FROM oeb_file
    WHERE oeb01=g_oep.oep01

   UPDATE oea_file SET oea61 = l_oea61,
                       oea1008 = l_oea1008,    #No:FUN-A50103
                       oea06 = g_oep.oep02
    WHERE oea01 = g_oep.oep01
   IF SQLCA.SQLCODE THEN
      LET g_success = 'N'
      CALL s_errmsg("oea01",g_oep.oep01,"UPD oea61",SQLCA.sqlcode,1)   #No.FUN-710046
      RETURN
   END IF

END FUNCTION
