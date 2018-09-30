#該程式未解開Section, 採用最新樣板產出!
{<section id="axmp580_02.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0011(2017-02-14 19:17:46), PR版次:0011(2017-08-02 11:18:49)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000065
#+ Filename...: axmp580_02
#+ Description: 引導式簽收維護作業-簽收調整
#+ Creator....: 04543(2014-10-08 11:52:44)
#+ Modifier...: 05384 -SD/PR- topstd
 
{</section>}
 
{<section id="axmp580_02.global" >}
#應用 p00 樣板自動產生(Version:5)
#add-point:填寫註解說明 name="main.memo"
#160727-00019#24   2016/08/15 By 08742     系统中定义的临时表名称超过15码在执行时会出错,所以需要将系统中定义的临时表长度超过15码的全部改掉	
#                                          Mod   axmp580_02_temp_d1--> axmp580_tmp01   ，    axmp580_02_temp_d2--> axmp580_tmp02
#                                          Mod   axmp580_02_temp_d3--> axmp580_tmp03
#160816-00001#11  2016/08/17  By 08734     抓取理由碼改CALL sub
#170104-00066#3   2017/01/06  By Rainy     筆數相關變數由num5放大至num10
#170123-00026#1   2017/01/23  By ouhz      调整产生出货签收后未自动带出库存特征码
#170209-00026#1   2017/02/09  By 02040     1.調整l_num型態LIKE xmdl018，以免簽收數量過大導致錯誤
#                                          2.170117-00044#2延續，簽收單 帶多庫儲批時，依原出貨單帶出儲位、庫存管理特微、只需替代掉成本庫即可
#                                          3.價格頁籤，含稅未稅金額計算錯誤
#170208-00025#1   2017/02/13  By 02040     多次簽收，總簽收量不等於簽收量時，需自動推算多庫儲批數量
#161230-00019#6   2017/02/02  By shiun     引導式作業一次性交易對象處理，顯示一次性交易對象名稱
#160929-00038#1   2017/03/28  By lixiang  签收时计价数量栏位处理，先预设带出剩余的计价数量，不用单位换算重新计算
#170328-00088#1   2017/03/30  By ywtsai    修改FUNCTION axmp580_02_update_xmdl()中呼叫s_tax_count()應傳入l_money出貨金額
#170503-00034#1   2017/05/05  By 07024     出貨簽收單的資料顯示、axmt580拋轉，儲位應該為一個空白
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
 
IMPORT os
#add-point:增加匯入項目 name="main.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="axmp580_02.free_style_variable" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
TYPE type_g_xmdk_d     RECORD
        keyno             LIKE type_t.num5,
        xmdk007           LIKE xmdk_t.xmdk007, 
        xmdk007_desc      LIKE type_t.chr500, 
        xmdk047           LIKE xmdk_t.xmdk047,   #161230-00019
        xmdk009           LIKE xmdk_t.xmdk009, 
        xmdk009_desc      LIKE type_t.chr500, 
        xmdk008           LIKE xmdk_t.xmdk008, 
        xmdk008_desc      LIKE type_t.chr500,
        xmdk202           LIKE xmdk_t.xmdk202,
        xmdk202_desc      LIKE type_t.chr500
                       END RECORD

TYPE type_g_xmdk2_d    RECORD
        keyno             LIKE type_t.num5,
        xmdlseq           LIKE xmdl_t.xmdlseq,
        xmdl001           LIKE xmdl_t.xmdl001,
        xmdl002           LIKE xmdl_t.xmdl002,
        xmdl003           LIKE xmdl_t.xmdl003,
        xmdl004           LIKE xmdl_t.xmdl004,
        xmdl005           LIKE xmdl_t.xmdl005,
        xmdl006           LIKE xmdl_t.xmdl006,
        xmda033           LIKE xmda_t.xmda033,    #150116新增"客戶訂購單號"
        xmdl007           LIKE xmdl_t.xmdl007,
        xmdl008           LIKE xmdl_t.xmdl008,
        xmdl008_desc      LIKE type_t.chr500,
        xmdl008_desc_desc LIKE type_t.chr500,
        xmdl009           LIKE xmdl_t.xmdl009,
        xmdl009_desc      LIKE type_t.chr500,
        xmdl011           LIKE xmdl_t.xmdl011,
        xmdl011_desc      LIKE type_t.chr500,
        xmdl012           LIKE xmdl_t.xmdl012,
        xmdl017           LIKE xmdl_t.xmdl017,
        xmdl017_desc      LIKE type_t.chr500,
        xmdl018           LIKE xmdl_t.xmdl018,
        xmdl081           LIKE xmdl_t.xmdl081,
        xmdl084           LIKE xmdl_t.xmdl084,
        xmdl084_desc      LIKE type_t.chr500,
        xmdl019           LIKE xmdl_t.xmdl019,
        xmdl019_desc      LIKE type_t.chr500,
        xmdl020           LIKE xmdl_t.xmdl020,
        xmdl082           LIKE xmdl_t.xmdl082,
        xmdl013           LIKE xmdl_t.xmdl013,
        xmdl014           LIKE xmdl_t.xmdl014,
        xmdl014_desc      LIKE type_t.chr500,
        xmdl015           LIKE xmdl_t.xmdl015,
        xmdl015_desc      LIKE type_t.chr500,
        xmdl016           LIKE xmdl_t.xmdl016,
        xmdl052           LIKE xmdl_t.xmdl052,
        xmdl021           LIKE xmdl_t.xmdl021,
        xmdl021_desc      LIKE type_t.chr500,
        xmdl022           LIKE xmdl_t.xmdl022,
        xmdl083           LIKE xmdl_t.xmdl083,
        xmdl050           LIKE xmdl_t.xmdl050,
        xmdl050_desc      LIKE type_t.chr500,
        xmdl051           LIKE xmdl_t.xmdl051
                       END RECORD
                       
TYPE type_g_xmdk3_d    RECORD
        keyno             LIKE type_t.num5,
        xmdmseq           LIKE xmdm_t.xmdmseq,
        xmdmseq1          LIKE xmdm_t.xmdmseq1,
        xmdm001           LIKE xmdm_t.xmdm001,
        xmdm001_desc      LIKE type_t.chr500,
        xmdm001_desc_desc LIKE type_t.chr500,
        xmdm002           LIKE xmdm_t.xmdm002,
        xmdm002_desc      LIKE type_t.chr500,
        xmdm003           LIKE xmdm_t.xmdm003,
        xmdm004           LIKE xmdm_t.xmdm004,
        xmdm005           LIKE xmdm_t.xmdm005,
        xmdm005_desc      LIKE type_t.chr500,
        xmdm006           LIKE xmdm_t.xmdm006,
        xmdm006_desc      LIKE type_t.chr500,
        xmdm007           LIKE xmdm_t.xmdm007,
        xmdm033           LIKE xmdm_t.xmdm033,
        xmdm008           LIKE xmdm_t.xmdm008,
        xmdm008_desc      LIKE type_t.chr500,
        xmdm009           LIKE xmdm_t.xmdm009,
        xmdm010           LIKE xmdm_t.xmdm010,
        xmdm010_desc      LIKE type_t.chr500,
        xmdm011           LIKE xmdm_t.xmdm011
                       END RECORD

 TYPE type_g_xmdk5_d   RECORD
        keyno             LIKE type_t.num5,
        xmdlseq           LIKE xmdl_t.xmdlseq,
        xmdl007           LIKE xmdl_t.xmdl007,
        xmdl008           LIKE xmdl_t.xmdl008,
        xmdl008_desc      LIKE type_t.chr500,
        xmdl008_desc_desc LIKE type_t.chr500,
        xmdl009           LIKE xmdl_t.xmdl009,
        xmdl009_desc      LIKE type_t.chr500,
        xmdl011           LIKE xmdl_t.xmdl011,
        xmdl011_desc      LIKE type_t.chr500,
        xmdl012           LIKE xmdl_t.xmdl012,        
        xmdl017           LIKE xmdl_t.xmdl017,
        xmdl017_desc      LIKE type_t.chr500,
        xmdl018           LIKE xmdl_t.xmdl018,        
        xmdl021           LIKE xmdl_t.xmdl021,
        xmdl021_desc      LIKE type_t.chr500,
        xmdl022           LIKE xmdl_t.xmdl022,        
        xmdl024           LIKE xmdl_t.xmdl024,
        xmdl025           LIKE xmdl_t.xmdl025,
        xmdl025_desc      LIKE type_t.chr500,
        xmdl026           LIKE xmdl_t.xmdl026,        
        xmdl027           LIKE xmdl_t.xmdl027,
        xmdl028           LIKE xmdl_t.xmdl028,
        xmdl029           LIKE xmdl_t.xmdl029,        
        xmdl042           LIKE xmdl_t.xmdl042,
        xmdl043           LIKE xmdl_t.xmdl043,
        xmdl044           LIKE xmdl_t.xmdl044,
        xmdl045           LIKE xmdl_t.xmdl045,
        xmdl046           LIKE xmdl_t.xmdl046
                       END RECORD
       
#於 gen_data 中使用
TYPE type_xmdk         RECORD
        xmdksite          LIKE xmdk_t.xmdksite,
        xmdkdocno         LIKE xmdk_t.xmdkdocno,
        xmdlseq           LIKE xmdl_t.xmdlseq,
        xmdk007           LIKE xmdk_t.xmdk007,
        xmdk047           LIKE xmdk_t.xmdk047,   #一次性交易對象識別碼   #161230-00019
        xmdk009           LIKE xmdk_t.xmdk009,
        xmdk008           LIKE xmdk_t.xmdk008,
        xmdk010           LIKE xmdk_t.xmdk010,
        xmdk011           LIKE xmdk_t.xmdk011,
        xmdk012           LIKE xmdk_t.xmdk012,
        xmdk015           LIKE xmdk_t.xmdk015,
        xmdk016           LIKE xmdk_t.xmdk016,
        xmdk017           LIKE xmdk_t.xmdk017,
        xmdk039           LIKE xmdk_t.xmdk039,
        xmdk040           LIKE xmdk_t.xmdk040,
        xmdk042           LIKE xmdk_t.xmdk042,
        xmdk202           LIKE xmdk_t.xmdk202,
        
        xmdl018           LIKE xmdl_t.xmdl018,
        xmdl081           LIKE xmdl_t.xmdl081,
        xmdl084           LIKE xmdl_t.xmdl084,
        xmdl020           LIKE xmdl_t.xmdl020,
        xmdl082           LIKE xmdl_t.xmdl082
                       END RECORD

TYPE type_xmdl         RECORD
        xmdl001           LIKE xmdl_t.xmdl001,
        xmdl002           LIKE xmdl_t.xmdl002,
        xmdl003           LIKE xmdl_t.xmdl003,
        xmdl004           LIKE xmdl_t.xmdl004,
        xmdl005           LIKE xmdl_t.xmdl005,
        xmdl006           LIKE xmdl_t.xmdl006,
        xmda033           LIKE xmda_t.xmda033,    #150116新增"客戶訂購單號"
        xmdl007           LIKE xmdl_t.xmdl007,
        xmdl008           LIKE xmdl_t.xmdl008,
        xmdl009           LIKE xmdl_t.xmdl009,
        xmdl010           LIKE xmdl_t.xmdl010,
        xmdl011           LIKE xmdl_t.xmdl011,
        xmdl012           LIKE xmdl_t.xmdl012,
        xmdl013           LIKE xmdl_t.xmdl013,
        xmdl014           LIKE xmdl_t.xmdl014,
        xmdl015           LIKE xmdl_t.xmdl015,
        xmdl016           LIKE xmdl_t.xmdl016,        
        xmdl017           LIKE xmdl_t.xmdl017,
        xmdl018           LIKE xmdl_t.xmdl018,
        xmdl019           LIKE xmdl_t.xmdl019,
        xmdl020           LIKE xmdl_t.xmdl020,
        xmdl021           LIKE xmdl_t.xmdl021,
        xmdl022           LIKE xmdl_t.xmdl022,

        xmdl024           LIKE xmdl_t.xmdl024,
        xmdl025           LIKE xmdl_t.xmdl025,
        xmdl026           LIKE xmdl_t.xmdl026,
        xmdl027           LIKE xmdl_t.xmdl027,
        xmdl028           LIKE xmdl_t.xmdl028,
        xmdl029           LIKE xmdl_t.xmdl029,
        
        xmdl030           LIKE xmdl_t.xmdl030,  #add by lixiang 2015/06/29
        xmdl031           LIKE xmdl_t.xmdl031,  #add by lixiang 2015/06/29
        xmdl032           LIKE xmdl_t.xmdl032,  #add by lixiang 2015/06/29

        xmdl033           LIKE xmdl_t.xmdl033,

        xmdl042           LIKE xmdl_t.xmdl042,
        xmdl043           LIKE xmdl_t.xmdl043,
        xmdl044           LIKE xmdl_t.xmdl044,
        xmdl045           LIKE xmdl_t.xmdl045,
        xmdl046           LIKE xmdl_t.xmdl046,

        xmdl050           LIKE xmdl_t.xmdl050,
        xmdl051           LIKE xmdl_t.xmdl051,
        xmdl052           LIKE xmdl_t.xmdl052,

        xmdl081           LIKE xmdl_t.xmdl081,
        xmdl082           LIKE xmdl_t.xmdl082,
        xmdl083           LIKE xmdl_t.xmdl083,
        xmdl084           LIKE xmdl_t.xmdl084
        
                       END RECORD

DEFINE g_xmdk_d          DYNAMIC ARRAY OF type_g_xmdk_d

DEFINE g_xmdk2_d         DYNAMIC ARRAY OF type_g_xmdk2_d
DEFINE g_xmdk2_d_o       type_g_xmdk2_d

DEFINE g_xmdk3_d         DYNAMIC ARRAY OF type_g_xmdk3_d

DEFINE g_xmdk5_d         DYNAMIC ARRAY OF type_g_xmdk5_d

DEFINE g_master_idx      LIKE type_t.num10  #170104-00066#3 num5->num10  17/01/06 mod by rainy 
DEFINE l_ac              LIKE type_t.num10  #170104-00066#3 num5->num10  17/01/06 mod by rainy 
DEFINE g_rec_b           LIKE type_t.num10  #170104-00066#3 num5->num10  17/01/06 mod by rainy 
DEFINE g_rec_b2          LIKE type_t.num10  #170104-00066#3 num5->num10  17/01/06 mod by rainy 
DEFINE g_rec_b3          LIKE type_t.num10  #170104-00066#3 num5->num10  17/01/06 mod by rainy 
DEFINE g_rec_b5          LIKE type_t.num10  #170104-00066#3 num5->num10  17/01/06 mod by rainy 
DEFINE g_qty             LIKE xmdl_t.xmdl018
DEFINE g_group           LIKE type_t.chr1
#end add-point
 
{</section>}
 
{<section id="axmp580_02.global_variable" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
 
#end add-point
 
{</section>}
 
{<section id="axmp580_02.other_dialog" >}

DIALOG axmp580_02_display()
   DISPLAY ARRAY g_xmdk_d TO s_detail1_axmp580_02.* ATTRIBUTE(COUNT = g_rec_b)
      BEFORE DISPLAY
         CALL FGL_SET_ARR_CURR(l_ac)

      BEFORE ROW
        LET l_ac = DIALOG.getCurrentRow("s_detail1_axmp580_02")
        LET g_master_idx = l_ac
        CALL axmp580_02_fetch('2')
        CALL axmp580_02_fetch('3')
        CALL axmp580_02_fetch('5')

   END DISPLAY
END DIALOG

DIALOG axmp580_02_input2()
   DEFINE l_gzcb004    LIKE gzcb_t.gzcb004
  #DEFINE l_num        LIKE type_t.num5      #170209-00026#1 mark
   DEFINE l_num        LIKE xmdl_t.xmdl018   #170209-00026#1 add
   DEFINE l_success    LIKE type_t.num5
   
   INPUT ARRAY g_xmdk2_d FROM s_detail2_axmp580_02.*
      ATTRIBUTE(COUNT = g_rec_b2,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                INSERT ROW = FALSE,DELETE ROW = FALSE,APPEND ROW = FALSE)

      BEFORE INPUT
         CALL axmp580_02_fetch('2')
         
      BEFORE ROW
         LET l_ac = DIALOG.getCurrentRow("s_detail2_axmp580_02")
         #LET l_ac = ARR_CURR()
                  
         SELECT keyno,xmdlseq,
                xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,
                xmdl006,
                xmda033,    #150116新增"客戶訂購單號"
                xmdl007,
                xmdl008,'','',
                xmdl009,'',
                xmdl011,'',
                xmdl012,
                xmdl017,'',
                xmdl018,xmdl081,
                xmdl084,'',
                xmdl019,'',
                xmdl020,xmdl082,xmdl013,
                xmdl014,'',
                xmdl015,'',
                xmdl016,xmdl052,
                xmdl021,'',
                xmdl022,xmdl083,
                xmdl050,'',
                xmdl051
           INTO g_xmdk2_d[l_ac].*
           FROM axmp580_tmp02    #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
          WHERE keyno = g_xmdk2_d[l_ac].keyno
            AND xmdlseq = g_xmdk2_d[l_ac].xmdlseq

         CALL axmp580_02_detail_show("'2'")
         
         LET g_xmdk2_d_o.* = g_xmdk2_d[l_ac].*
         
         CALL axmp580_02_set_entry_b()
         CALL axmp580_02_set_no_entry_b()

      AFTER FIELD xmdl018_d2_02   #簽收數量
         IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
            IF g_xmdk2_d[l_ac].xmdl018 <> g_xmdk2_d_o.xmdl018 OR cl_null(g_xmdk2_d_o.xmdl018) THEN
             
               IF NOT cl_ap_chk_Range(g_xmdk2_d[l_ac].xmdl018,"0.000","1","","","azz-00079",1) THEN
                  LET g_xmdk2_d[l_ac].xmdl018 = g_xmdk2_d_o.xmdl018
                
                  NEXT FIELD xmdl018_d2_02
               END IF
             
               LET g_qty = 0
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                  LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl018
               END IF

               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                  LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl081
               END IF

               #可簽收簽退數量
               CALL axmp580_01_default_quantity(g_xmdk2_d[l_ac].xmdl001,g_xmdk2_d[l_ac].xmdl002,g_xmdk2_d[l_ac].xmdl017)
               RETURNING l_num

               #簽收數量檢查
               IF g_qty > l_num THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00225'    #簽收簽退量不可大於可轉簽收簽退量("出貨量" - "已簽收量" - "已簽退量")
                  LET g_errparam.extend = g_qty
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_xmdk2_d[l_ac].xmdl018 = g_xmdk2_d_o.xmdl018
                
                  NEXT FIELD xmdl018_d2_02
               END IF
                
               #推算參考數量
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl008) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl017) AND
                  NOT cl_null(g_xmdk2_d[l_ac].xmdl019) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                         
                  CALL s_aooi250_convert_qty(g_xmdk2_d[l_ac].xmdl008,g_xmdk2_d[l_ac].xmdl017,g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl018)
                  RETURNING l_success,g_xmdk2_d[l_ac].xmdl020
               ELSE
                  LET g_xmdk2_d[l_ac].xmdl020 = ''
               END IF

            END IF                
         END IF
          
         LET g_xmdk2_d_o.xmdl018 = g_xmdk2_d[l_ac].xmdl018
         LET g_xmdk2_d_o.xmdl020 = g_xmdk2_d[l_ac].xmdl020
         
      AFTER FIELD xmdl081_d2_02   #簽退數量
         IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
            IF g_xmdk2_d[l_ac].xmdl081 <> g_xmdk2_d_o.xmdl081 OR cl_null(g_xmdk2_d_o.xmdl081) THEN
         
               IF NOT cl_ap_chk_Range(g_xmdk2_d[l_ac].xmdl081,"0.000","1","","","azz-00079",1) THEN
                  LET g_xmdk2_d[l_ac].xmdl081 = g_xmdk2_d_o.xmdl081
                  
                  NEXT FIELD xmdl081_d2_02
               END IF
               
               LET g_qty = 0
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                  LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl018
               END IF
        
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                  LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl081
               END IF
               
               #可簽收簽退數量
               CALL axmp580_01_default_quantity(g_xmdk2_d[l_ac].xmdl001,g_xmdk2_d[l_ac].xmdl002,g_xmdk2_d[l_ac].xmdl017)
               RETURNING l_num

               #簽收數量檢查
               IF g_qty > l_num THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00225'    #簽收簽退量不可大於可轉簽收簽退量("出貨量" - "已簽收量" - "已簽退量")
                  LET g_errparam.extend = g_qty
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
        
                  LET g_xmdk2_d[l_ac].xmdl081 = g_xmdk2_d_o.xmdl081
                  
                  NEXT FIELD xmdl081_d2_02
               END IF
               
               #推算參考數量
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl008) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl017) AND
                  NOT cl_null(g_xmdk2_d[l_ac].xmdl019) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                        
                  CALL s_aooi250_convert_qty(g_xmdk2_d[l_ac].xmdl008,g_xmdk2_d[l_ac].xmdl017,g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl081)
                  RETURNING l_success,g_xmdk2_d[l_ac].xmdl082
               ELSE
                  LET g_xmdk2_d[l_ac].xmdl082 = ''
               END IF    
               
            END IF                
         END IF
         
         LET g_xmdk2_d_o.xmdl081 = g_xmdk2_d[l_ac].xmdl081
         LET g_xmdk2_d_o.xmdl082 = g_xmdk2_d[l_ac].xmdl082      
      
      AFTER FIELD xmdl084_d2_02   #簽退理由碼
         CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl084,'axmt590') RETURNING g_xmdk2_d[l_ac].xmdl084_desc
        
         IF NOT cl_null(g_xmdk2_d[l_ac].xmdl084) THEN
            IF g_xmdk2_d[l_ac].xmdl084 <> g_xmdk2_d_o.xmdl084 OR cl_null(g_xmdk2_d_o.xmdl084) THEN
             
               IF NOT axmp580_01_reason_chk(g_xmdk2_d[l_ac].xmdl084,'axmt590') THEN
                  LET g_xmdk2_d[l_ac].xmdl084 = g_xmdk2_d_o.xmdl084
                  
                  CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl084,'axmt590') RETURNING g_xmdk2_d[l_ac].xmdl084_desc
                  
                  NEXT FIELD xmdl084_d2_02
               END IF
               
            END IF
         END IF
         
         LET g_xmdk2_d_o.xmdl084 = g_xmdk2_d[l_ac].xmdl084

      AFTER FIELD xmdl020_d2_02   #簽收參考數量
         IF NOT cl_null(g_xmdk2_d[l_ac].xmdl020) THEN
            #參考數量取位
            CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl020) RETURNING l_success,g_xmdk2_d[l_ac].xmdl020
         END IF

         LET g_xmdk2_d_o.xmdl020 = g_xmdk2_d[l_ac].xmdl020


      AFTER FIELD xmdl082_d2_02   #簽退參考數量
         IF NOT cl_null(g_xmdk2_d[l_ac].xmdl082) THEN
            #參考數量取位
            CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl082) RETURNING l_success,g_xmdk2_d[l_ac].xmdl082
         END IF

         LET g_xmdk2_d_o.xmdl082 = g_xmdk2_d[l_ac].xmdl082

      AFTER FIELD xmdl022_d2_02   #簽收計價數量
         IF NOT cl_null(g_xmdk2_d[l_ac].xmdl022) THEN
            #參考數量取位
            CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl021,g_xmdk2_d[l_ac].xmdl022) RETURNING l_success,g_xmdk2_d[l_ac].xmdl022
         END IF

         LET g_xmdk2_d_o.xmdl022 = g_xmdk2_d[l_ac].xmdl022

      AFTER FIELD xmdl083_d2_02   #簽退計價數量
         IF NOT cl_null(g_xmdk2_d[l_ac].xmdl083) THEN
            #參考數量取位
            CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl021,g_xmdk2_d[l_ac].xmdl083) RETURNING l_success,g_xmdk2_d[l_ac].xmdl083
         END IF

         LET g_xmdk2_d_o.xmdl083 = g_xmdk2_d[l_ac].xmdl083

      AFTER FIELD xmdl050_d2_02   #理由碼
         CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl050,'axmt580') RETURNING g_xmdk2_d[l_ac].xmdl050_desc
        
         IF NOT cl_null(g_xmdk2_d[l_ac].xmdl050) THEN
            IF g_xmdk2_d[l_ac].xmdl050 <> g_xmdk2_d_o.xmdl050 OR cl_null(g_xmdk2_d_o.xmdl050) THEN
             
               IF NOT axmp580_01_reason_chk(g_xmdk2_d[l_ac].xmdl050,'axmt580') THEN
                  LET g_xmdk2_d[l_ac].xmdl050 = g_xmdk2_d_o.xmdl050
                  
                  CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl050,'axmt580') RETURNING g_xmdk2_d[l_ac].xmdl050_desc
                  
                  NEXT FIELD xmdl050_d2_02
               END IF
               
            END IF
         END IF
         
         LET g_xmdk2_d_o.xmdl050 = g_xmdk2_d[l_ac].xmdl050


      ON ACTION controlp INFIELD xmdl084_d2_02
         #開窗i段
         LET l_gzcb004 = ''
         #160816-00001#11  2016/08/17  By 08734 Mark
        # SELECT gzcb004
        #   INTO l_gzcb004
        #   FROM gzcb_t
        #  WHERE gzcb001 = '24'
        #    AND gzcb002 = 'axmt590'
        LET l_gzcb004 = s_fin_get_scc_value('24','axmt590','2')  #160816-00001#11  2016/08/17  By 08734 add

         INITIALIZE g_qryparam.* TO NULL
         LET g_qryparam.state = 'i'
         LET g_qryparam.reqry = FALSE

         LET g_qryparam.default1 = g_xmdk2_d[l_ac].xmdl084             #給予default值

#         CALL s_control_get_doc_sql('oocq002',g_xmdk_m.xmdkdocno,'8') RETURNING l_success,l_where
#         IF l_success THEN
#            LET g_qryparam.where = l_where
#         END IF

         #給予arg
         LET g_qryparam.arg1 = l_gzcb004

         CALL q_oocq002()                                #呼叫開窗
         LET g_xmdk2_d[l_ac].xmdl084 = g_qryparam.return1              #將開窗取得的值回傳到變數

         DISPLAY g_xmdk2_d[l_ac].xmdl084 TO xmdl084_d2_02              #顯示到畫面上

         CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl084,'axmt590') RETURNING g_xmdk2_d[l_ac].xmdl084_desc
         NEXT FIELD xmdl084_d2_02

      ON ACTION controlp INFIELD xmdl050_d2_02
         #開窗i段
         LET l_gzcb004 = ''
         #160816-00001#11  2016/08/17  By 08734 Mark
        # SELECT gzcb004
        #   INTO l_gzcb004
        #   FROM gzcb_t
        #  WHERE gzcb001 = '24'
        #    AND gzcb002 = 'axmt580'
        LET l_gzcb004 = s_fin_get_scc_value('24','axmt580','2')  #160816-00001#11  2016/08/17  By 08734 add

         INITIALIZE g_qryparam.* TO NULL
         LET g_qryparam.state = 'i'
         LET g_qryparam.reqry = FALSE

         LET g_qryparam.default1 = g_xmdk2_d[l_ac].xmdl050             #給予default值

#         CALL s_control_get_doc_sql('oocq002',g_xmdk_m.xmdkdocno,'8') RETURNING l_success,l_where
#         IF l_success THEN
#            LET g_qryparam.where = l_where
#         END IF

         #給予arg
         LET g_qryparam.arg1 = l_gzcb004

         CALL q_oocq002()                                #呼叫開窗
         LET g_xmdk2_d[l_ac].xmdl050 = g_qryparam.return1              #將開窗取得的值回傳到變數

         DISPLAY g_xmdk2_d[l_ac].xmdl050 TO xmdl050_d2_02              #顯示到畫面上

         CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl050,'axmt580') RETURNING g_xmdk2_d[l_ac].xmdl050_desc
         NEXT FIELD xmdl050_d2_02

      ON ROW CHANGE      
         IF NOT axmp580_02_update_xmdl() THEN
            RETURN
         END IF
            
      AFTER INPUT         
         
   END INPUT
END DIALOG

DIALOG axmp580_02_display3()
   DISPLAY ARRAY g_xmdk3_d TO s_detail3_axmp580_02.* ATTRIBUTE(COUNT = g_rec_b3)
      BEFORE DISPLAY
         CALL FGL_SET_ARR_CURR(l_ac)
         CALL axmp580_02_fetch('3')

      BEFORE ROW
        LET l_ac = DIALOG.getCurrentRow("s_detail3_axmp580_02")

   END DISPLAY
END DIALOG

DIALOG axmp580_02_display5()
   DISPLAY ARRAY g_xmdk5_d TO s_detail5_axmp580_02.* ATTRIBUTE(COUNT = g_rec_b5)
      BEFORE DISPLAY
         CALL FGL_SET_ARR_CURR(l_ac)
         CALL axmp580_02_fetch('5')
         
      BEFORE ROW
         LET l_ac = DIALOG.getCurrentRow("s_detail5_axmp580_02")

   END DISPLAY
END DIALOG
#匯總方式
DIALOG axmp580_02_input()
   INPUT g_group FROM group_02 ATTRIBUTE(WITHOUT DEFAULTS)
   
      ON CHANGE group_02
         CALL axmp580_02_gen_data()
         CALL axmp580_02_b_fill()

   END INPUT
END DIALOG

################################################################################
# Descriptions...: 出貨明細頁籤的顯示段
# Memo...........:
# Usage..........: CALL axmp580_02_display2()
# Input parameter:
# Return code....: 
# Date & Author..: 2016/03/29 By dorislai(151118-00029#6)
# Modify.........:
################################################################################
DIALOG axmp580_02_display2()
   DISPLAY ARRAY g_xmdk2_d TO s_detail2_axmp580_02.* ATTRIBUTE(COUNT = g_rec_b2)
      BEFORE DISPLAY
         CALL FGL_SET_ARR_CURR(l_ac)
         CALL axmp580_02_fetch('2')
         
      BEFORE ROW
        LET l_ac = DIALOG.getCurrentRow("s_detail2_axmp580_02")

   END DISPLAY
END DIALOG

 
{</section>}
 
{<section id="axmp580_02.other_function" readonly="Y" >}

PUBLIC FUNCTION axmp580_02(--)
   #add-point:input段變數傳入

   #end add-point
   )
END FUNCTION

PUBLIC FUNCTION axmp580_02_init()
   CALL cl_set_combo_scc('xmdl007_d2_02','2055')
   CALL cl_set_combo_scc('xmdl007_d5_02','2055')
   CALL cl_set_combo_scc('xmdl042_d5_02','2067')

   #判斷據點參數若不使用產品特徵時，則產品特徵需隱藏不可以維護(據點參數:S-BAS-0036)
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0036') = 'N' THEN
      CALL cl_set_comp_visible("xmdl009_d2_02,xmdl009_d2_02_desc,
                                xmdm002_d3_02,xmdm002_d3_02_desc,
                                xmdl009_d5_02,xmdl009_d5_02_desc",FALSE)
   END IF

   #判斷據點參數若不使用參考單位時，則參考單位、數量需隱藏不可以維護(據點參數:S-BAS-0028)
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028') = 'N' THEN
      CALL cl_set_comp_visible("xmdl019_d2_02,xmdl019_d2_02_desc,xmdl020_d2_02,xmdl082_d2_02,
                                xmdm010_d3_02,xmdm010_d3_02_desc,xmdm011_d3_02",FALSE)
   END IF

   #整體參數未使用採購計價單位
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0007') = "N" THEN
      CALL cl_set_comp_visible("xmdl021_d2_02,xmdl021_d2_02_desc,xmdl022_d2_02,xmdl083_d2_02,
                                xmdl021_d5_02,xmdl021_d5_02_desc,xmdl022_d5_02",FALSE)
   END IF

END FUNCTION

PUBLIC FUNCTION axmp580_02_create_temp_table()
   DEFINE r_success         LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   IF NOT axmp580_02_drop_temp_table() THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   CREATE TEMP TABLE axmp580_tmp01(               #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01
       keyno        LIKE type_t.num5,
       xmdkdocno    LIKE xmdk_t.xmdkdocno,
       xmdk007      LIKE xmdk_t.xmdk007,
       xmdk047      LIKE xmdk_t.xmdk047,   #161230-00019#6
       xmdk009      LIKE xmdk_t.xmdk009,
       xmdk008      LIKE xmdk_t.xmdk008,
       xmdk202      LIKE xmdk_t.xmdk202,
       xmdk010      LIKE xmdk_t.xmdk010,
       xmdk011      LIKE xmdk_t.xmdk011,
       xmdk012      LIKE xmdk_t.xmdk012,
       xmdk015      LIKE xmdk_t.xmdk015,
       xmdk016      LIKE xmdk_t.xmdk016,
       xmdk042      LIKE xmdk_t.xmdk042,
       result_docno LIKE xmdk_t.xmdkdocno,
       result_str   LIKE type_t.chr1000
       )

   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create axmp580_tmp01'          #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   CREATE TEMP TABLE axmp580_tmp02(        #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
       keyno      LIKE type_t.num5,
       xmdlseq    LIKE xmdl_t.xmdlseq,
       xmdl001    LIKE xmdl_t.xmdl001,
       xmdl002    LIKE xmdl_t.xmdl002,
       xmdl003    LIKE xmdl_t.xmdl003,
       xmdl004    LIKE xmdl_t.xmdl004,
       xmdl005    LIKE xmdl_t.xmdl005,
       xmdl006    LIKE xmdl_t.xmdl006,
       xmda033    LIKE xmda_t.xmda033,
       xmdl007    LIKE xmdl_t.xmdl007,
       xmdl008    LIKE xmdl_t.xmdl008,
       xmdl009    LIKE xmdl_t.xmdl009,
       xmdl010    LIKE xmdl_t.xmdl010,
       xmdl011    LIKE xmdl_t.xmdl011,
       xmdl012    LIKE xmdl_t.xmdl012,
       xmdl013    LIKE xmdl_t.xmdl013,
       xmdl014    LIKE xmdl_t.xmdl014,
       xmdl015    LIKE xmdl_t.xmdl015,
       xmdl016    LIKE xmdl_t.xmdl016,       
       xmdl017    LIKE xmdl_t.xmdl017,
       xmdl018    LIKE xmdl_t.xmdl018,
       xmdl019    LIKE xmdl_t.xmdl019,
       xmdl020    LIKE xmdl_t.xmdl020,
       xmdl021    LIKE xmdl_t.xmdl021,
       xmdl022    LIKE xmdl_t.xmdl022,       
       xmdl024    LIKE xmdl_t.xmdl024,
       xmdl025    LIKE xmdl_t.xmdl025,
       xmdl026    LIKE xmdl_t.xmdl026,
       xmdl027    LIKE xmdl_t.xmdl027,
       xmdl028    LIKE xmdl_t.xmdl028,
       xmdl029    LIKE xmdl_t.xmdl029,
       xmdl030    LIKE xmdl_t.xmdl030,  #add by lixiang 2015/06/29
       xmdl031    LIKE xmdl_t.xmdl031,  #add by lixiang 2015/06/29
       xmdl032    LIKE xmdl_t.xmdl032,  #add by lixiang 2015/06/29
       xmdl033    LIKE xmdl_t.xmdl033,
       xmdl042    LIKE xmdl_t.xmdl042,
       xmdl043    LIKE xmdl_t.xmdl043,
       xmdl044    LIKE xmdl_t.xmdl044,
       xmdl045    LIKE xmdl_t.xmdl045,
       xmdl046    LIKE xmdl_t.xmdl046,
       xmdl050    LIKE xmdl_t.xmdl050,
       xmdl051    LIKE xmdl_t.xmdl051,       
       xmdl052    LIKE xmdl_t.xmdl052,       
       xmdl081    LIKE xmdl_t.xmdl081,
       xmdl082    LIKE xmdl_t.xmdl082,
       xmdl083    LIKE xmdl_t.xmdl083,
       xmdl084    LIKE xmdl_t.xmdl084       
       )

   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create axmp580_tmp02'             #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   CREATE TEMP TABLE axmp580_tmp03(              #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03
       keyno      LIKE type_t.num5,
       xmdmseq    LIKE xmdm_t.xmdmseq,
       xmdmseq1   LIKE xmdm_t.xmdmseq1,
       xmdm001    LIKE xmdm_t.xmdm001,
       xmdm002    LIKE xmdm_t.xmdm002,
       xmdm003    LIKE xmdm_t.xmdm003,
       xmdm004    LIKE xmdm_t.xmdm004,
       xmdm005    LIKE xmdm_t.xmdm005,
       xmdm006    LIKE xmdm_t.xmdm006,
       xmdm007    LIKE xmdm_t.xmdm007,       
       xmdm008    LIKE xmdm_t.xmdm008,
       xmdm009    LIKE xmdm_t.xmdm009,
       xmdm010    LIKE xmdm_t.xmdm010,
       xmdm011    LIKE xmdm_t.xmdm011,
       xmdm012    LIKE xmdm_t.xmdm012,
       xmdm013    LIKE xmdm_t.xmdm013,
       xmdm014    LIKE xmdm_t.xmdm014,
       xmdm031    LIKE xmdm_t.xmdm031,
       xmdm032    LIKE xmdm_t.xmdm032,
       xmdm033    LIKE xmdm_t.xmdm033
        )

   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'create axmp580_tmp03'   #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

PUBLIC FUNCTION axmp580_02_drop_temp_table()
   DEFINE r_success          LIKE type_t.num5

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   DROP TABLE axmp580_tmp01                           #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop axmp580_tmp01'    #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE axmp580_tmp02                             #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop axmp580_tmp02'      #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   DROP TABLE axmp580_tmp03        #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03

   IF NOT (SQLCA.sqlcode = 0 OR SQLCA.sqlcode = -206) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'drop axmp580_tmp03'      #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...:　將axmp580_01_temp　的資料　整理成axmp580_02　可使用的資料
# Memo...........:
# Usage..........: CALL axmp580_02_gen_data()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      執行結果
# Date & Author..: 2014/10/21 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION axmp580_02_gen_data()
   DEFINE r_success    LIKE type_t.num5
   
   DEFINE l_sql        STRING   
   DEFINE l_xmdk       type_xmdk
   DEFINE l_xmdl       type_xmdl
   
   DEFINE l_keyno      LIKE type_t.num5
   DEFINE l_xmdlseq    LIKE xmdl_t.xmdlseq

   DEFINE l_xrcd103    LIKE xrcd_t.xrcd103
   DEFINE l_xrcd104    LIKE xrcd_t.xrcd104
   DEFINE l_xrcd105    LIKE xrcd_t.xrcd105
   DEFINE l_xrcd113    LIKE xrcd_t.xrcd113
   DEFINE l_xrcd114    LIKE xrcd_t.xrcd114
   DEFINE l_xrcd115    LIKE xrcd_t.xrcd115
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_type       LIKE type_t.chr1      #紀錄是否為成本庫位
   DEFINE l_money      LIKE xmdl_t.xmdl027   #170209-00026#1
   DEFINE l_only       LIKE type_t.num5
   DEFINE l_xmdm005    LIKE xmdm_t.xmdm005
   DEFINE l_xmdm006    LIKE xmdm_t.xmdm006
   DEFINE l_xmdm007    LIKE xmdm_t.xmdm007
   DEFINE l_xmdm033    LIKE xmdm_t.xmdm033

   DELETE FROM axmp580_tmp01          #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01
   DELETE FROM axmp580_tmp02          #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
   DELETE FROM axmp580_tmp03          #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03

   IF cl_null(g_group) THEN
      LET g_group = '1'   #預設依客戶匯總
   END IF

   #161230-00019#6-s-mod
#   LET l_sql = "SELECT '',xmdkdocno,xmdlseq,xmdk007,'',",
   LET l_sql = "SELECT '',xmdkdocno,xmdlseq,xmdk007,xmdk047,'',",
   #161230-00019#6-e-mod
               "       '','','','','',",
               "       '','','','','','',",
               "       xmdl018,xmdl081,xmdl084,xmdl020,xmdl082",
               "  FROM axmp580_01_temp",
               " ORDER BY xmdk007,xmdkdocno,xmdlseq"
   PREPARE axmp580_02_pre1 FROM l_sql
   DECLARE axmp580_02_curs1 CURSOR WITH HOLD FOR axmp580_02_pre1

   LET l_sql = "SELECT xmdksite,xmdk009,xmdk008,",
               "       xmdk010,xmdk011,xmdk012,xmdk015,",
               "       xmdk016,xmdk017,",
               "       xmdk039,xmdk040,xmdk042,",
               "       xmdk202",
               "  FROM xmdk_t",
               " WHERE xmdkent = ",g_enterprise,
               "   AND xmdkdocno = ?",
               " ORDER BY xmdk009,xmdk008"
   PREPARE axmp580_02_pre2 FROM l_sql

   LET l_sql = "SELECT '','',xmdl003,xmdl004,xmdl005,",
               "       xmdl006,",
               "       xmda033,",   #150116新增"客戶訂購單號"
               "       xmdl007,xmdl008,xmdl009,xmdl010,",
               #"       xmdl011,xmdl012,xmdl013,xmdl014,xmdl015,", #170503-00034#1-mark
               "       xmdl011,xmdl012,xmdl013,xmdl014,' ',",      #170503-00034#1-add              
               "       xmdl016,xmdl017,'',xmdl019,'',",
               "       xmdl021,'',xmdl024,xmdl025,",
               "       xmdl026,'','','',",
               "       xmdl030,xmdl031,xmdl032, ",   #add by lixiang 2015/06/29
               "       xmdl033,",
               "       xmdl042,xmdl043,xmdl044,xmdl045,",
               "       xmdl046,'',",
               "       '',xmdl052,",
               "       '','','',''",
               "  FROM xmdl_t LEFT OUTER JOIN xmda_t ON xmdaent = xmdlent AND xmdadocno = xmdl003",   #150116新增"客戶訂購單號"
               " WHERE xmdlent = ",g_enterprise,
               "   AND xmdldocno = ?",
               "   AND xmdlseq = ?"
   PREPARE axmp580_02_pre3 FROM l_sql

   #161230-00019#6-s-mod
#   FOREACH axmp580_02_curs1 INTO l_xmdk.*
   FOREACH axmp580_02_curs1 INTO l_xmdk.xmdksite,l_xmdk.xmdkdocno,l_xmdk.xmdlseq,l_xmdk.xmdk007,l_xmdk.xmdk047,
                                 l_xmdk.xmdk009,l_xmdk.xmdk008,l_xmdk.xmdk010,l_xmdk.xmdk011,l_xmdk.xmdk012,
                                 l_xmdk.xmdk015,l_xmdk.xmdk016,l_xmdk.xmdk017,l_xmdk.xmdk039,l_xmdk.xmdk040,
                                 l_xmdk.xmdk042,l_xmdk.xmdk202,l_xmdk.xmdl018,l_xmdk.xmdl081,l_xmdk.xmdl084,
                                 l_xmdk.xmdl020,l_xmdk.xmdl082
   #161230-00019#6-e-mod
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'FOREACH:axmp580_02_curs1'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

      EXECUTE axmp580_02_pre2 USING l_xmdk.xmdkdocno INTO l_xmdk.xmdksite,l_xmdk.xmdk009,l_xmdk.xmdk008,
                                                          l_xmdk.xmdk010,l_xmdk.xmdk011,l_xmdk.xmdk012,l_xmdk.xmdk015,                                                          
                                                          l_xmdk.xmdk016,l_xmdk.xmdk017,
                                                          l_xmdk.xmdk039,l_xmdk.xmdk040,l_xmdk.xmdk042,
                                                          l_xmdk.xmdk202
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'EXECUTE:axmp580_02_pre2'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF      
      
      LET l_sql = "SELECT keyno",
                  "  FROM axmp580_tmp01",           #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01
                  " WHERE xmdk007 = '",l_xmdk.xmdk007,"'",   #訂單客戶
                  "   AND xmdk009 = '",l_xmdk.xmdk009,"'",   #收貨客戶
                  "   AND xmdk008 = '",l_xmdk.xmdk008,"'",   #收款客戶
                  "   AND xmdk202 = '",l_xmdk.xmdk202,"'",   #發票客戶
                  "   AND xmdk010 = '",l_xmdk.xmdk010,"'",   #收款條件
                  "   AND xmdk011 = '",l_xmdk.xmdk011,"'",   #交易條件
                  "   AND xmdk012 = '",l_xmdk.xmdk012,"'",   #稅別
                  "   AND xmdk015 = '",l_xmdk.xmdk015,"'",   #發票類型
                  "   AND xmdk016 = '",l_xmdk.xmdk016,"'",   #幣別
                  "   AND xmdk042 = '",l_xmdk.xmdk042,"'"    #內外銷
      #161230-00019#6-s-add
      IF cl_null(l_xmdk.xmdk047) THEN
         LET l_sql = l_sql," AND xmdk047 IS NULL "
      ELSE
         LET l_sql = l_sql," AND xmdk047 = '",l_xmdk.xmdk047,"' "
      END IF
      #161230-00019#6-e-add
      
      IF g_group = '2' THEN   #依出貨單匯總
         LET l_sql = l_sql," AND xmdkdocno = '",l_xmdk.xmdkdocno,"'"  #出貨單號
      END IF
   
      PREPARE axmp580_02_pre4 FROM l_sql

      #單頭分類
      LET l_keyno = ''
      EXECUTE axmp580_02_pre4 INTO l_keyno

      #Insert單頭
      IF cl_null(l_keyno) THEN
         SELECT MAX(keyno) + 1 INTO l_keyno
           FROM axmp580_tmp01           #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01

         IF cl_null(l_keyno) THEN
            LET l_keyno = 1
         END IF

         IF g_group = '2' THEN   #依出貨單匯總
            #161230-00019#6-s-mod
#            INSERT INTO axmp580_tmp01(keyno,xmdkdocno,xmdk007,xmdk009,xmdk008,         #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01
            INSERT INTO axmp580_tmp01(keyno,xmdkdocno,xmdk007,xmdk047,xmdk009,xmdk008,
            #161230-00019#6-e-mod
                                           xmdk010,xmdk011,xmdk012,xmdk015,
                                           xmdk016,xmdk042,xmdk202)
                 #161230-00019#6-s-mod
#                 VALUES(l_keyno,l_xmdk.xmdkdocno,l_xmdk.xmdk007,l_xmdk.xmdk009,l_xmdk.xmdk008,
                 VALUES(l_keyno,l_xmdk.xmdkdocno,l_xmdk.xmdk007,l_xmdk.xmdk047,l_xmdk.xmdk009,l_xmdk.xmdk008,
                 #161230-00019#6-e-mod
                        l_xmdk.xmdk010,l_xmdk.xmdk011,l_xmdk.xmdk012,l_xmdk.xmdk015,
                        l_xmdk.xmdk016,l_xmdk.xmdk042,l_xmdk.xmdk202)
         ELSE
            #161230-00019#6-s-mod
#            INSERT INTO axmp580_tmp01(keyno,xmdkdocno,xmdk007,xmdk009,xmdk008,          #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01
            INSERT INTO axmp580_tmp01(keyno,xmdkdocno,xmdk007,xmdk047,xmdk009,xmdk008,
            #161230-00019#6-e-mod
                                           xmdk010,xmdk011,xmdk012,xmdk015,
                                           xmdk016,xmdk042,xmdk202)
                 #161230-00019#6-s-mod
#                 VALUES(l_keyno,'',l_xmdk.xmdk007,l_xmdk.xmdk009,l_xmdk.xmdk008,
                 VALUES(l_keyno,'',l_xmdk.xmdk007,l_xmdk.xmdk047,l_xmdk.xmdk009,l_xmdk.xmdk008,
                 #161230-00019#6-e-mod
                        l_xmdk.xmdk010,l_xmdk.xmdk011,l_xmdk.xmdk012,l_xmdk.xmdk015,
                        l_xmdk.xmdk016,l_xmdk.xmdk042,l_xmdk.xmdk202)
         END IF

         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'ins axmp580_tmp01'                                #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
      END IF 

      #Insert單身
      EXECUTE axmp580_02_pre3 USING l_xmdk.xmdkdocno,l_xmdk.xmdlseq INTO l_xmdl.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'EXECUTE:axmp580_02_pre3'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF      
      
      LET l_xmdlseq = ''
      SELECT MAX(xmdlseq) + 1 INTO l_xmdlseq
        FROM axmp580_tmp02                   #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
       WHERE keyno = l_keyno
       
      IF cl_null(l_xmdlseq) THEN
         LET l_xmdlseq = 1
      END IF

      LET l_xmdl.xmdl001 = l_xmdk.xmdkdocno  #出貨單號
      LET l_xmdl.xmdl002 = l_xmdk.xmdlseq    #出貨項次
      LET l_xmdl.xmdl018 = l_xmdk.xmdl018    #簽收數量
      LET l_xmdl.xmdl081 = l_xmdk.xmdl081    #簽退數量
      LET l_xmdl.xmdl084 = l_xmdk.xmdl084    #簽退理由碼
      LET l_xmdl.xmdl020 = l_xmdk.xmdl020    #簽收參考數量
      LET l_xmdl.xmdl082 = l_xmdk.xmdl082    #簽退參考數量


      #推算簽收計價數量
      IF NOT cl_null(l_xmdl.xmdl008) AND NOT cl_null(l_xmdl.xmdl017) AND
         NOT cl_null(l_xmdl.xmdl021) AND NOT cl_null(l_xmdl.xmdl018) THEN

         CALL s_aooi250_convert_qty(l_xmdl.xmdl008,l_xmdl.xmdl017,l_xmdl.xmdl021,l_xmdl.xmdl018)
         RETURNING l_success,l_xmdl.xmdl022
         ##160929-00038#1--s
         #CALL s_axmt580_get_xmdl022(l_xmdl.xmdl001,l_xmdl.xmdl002,l_xmdl.xmdl008,l_xmdl.xmdl017,l_xmdl.xmdl018,l_xmdl.xmdl021) 
         #   RETURNING l_xmdl.xmdl022
         ##160929-00038#1--e
      ELSE
         LET l_xmdl.xmdl022 = ''
      END IF

      #推算簽退計價數量
      IF NOT cl_null(l_xmdl.xmdl008) AND NOT cl_null(l_xmdl.xmdl017) AND
         NOT cl_null(l_xmdl.xmdl021) AND NOT cl_null(l_xmdl.xmdl081) THEN

         CALL s_aooi250_convert_qty(l_xmdl.xmdl008,l_xmdl.xmdl017,l_xmdl.xmdl021,l_xmdl.xmdl081)
         RETURNING l_success,l_xmdl.xmdl083
      ELSE
         LET l_xmdl.xmdl083 = ''
      END IF
      
      LET l_money = l_xmdl.xmdl024 * l_xmdl.xmdl022     #170209-00026#1 add      
     #CALL s_tax_count(l_xmdk.xmdksite,l_xmdl.xmdl025,l_xmdl.xmdl024,l_xmdl.xmdl022,l_xmdk.xmdk016,l_xmdk.xmdk017) #170209-00026#1 mark
      CALL s_tax_count(l_xmdk.xmdksite,l_xmdl.xmdl025,l_money,l_xmdl.xmdl022,l_xmdk.xmdk016,l_xmdk.xmdk017)        #170209-00026#1 add
        RETURNING l_xrcd103,l_xrcd104,l_xrcd105,l_xrcd113,l_xrcd114,l_xrcd115
      
      LET l_xmdl.xmdl027 = l_xrcd103   #未稅金額
      LET l_xmdl.xmdl028 = l_xrcd105   #含稅金額
      LET l_xmdl.xmdl029 = l_xrcd104   #稅額
      
      IF l_xmdl.xmdl013 = 'N' THEN     #非多庫儲批替換再途倉
         #檢查是否為成本庫
         CALL s_axmt540_inag012_chk(l_xmdk.xmdksite,l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl052,l_xmdl.xmdl014,l_xmdl.xmdl015,l_xmdl.xmdl016,l_xmdl.xmdl017)
         RETURNING l_type

         IF l_type = 'Y' THEN   #在途成本庫位
            LET l_xmdl.xmdl014 = l_xmdk.xmdk039
           #LET l_xmdl.xmdl015 = ' '                #170209-00026#1 mark
           #LET l_xmdl.xmdl052 = ' '                #170209-00026#1 mark
         ELSE                   #在途非成本庫位
            LET l_xmdl.xmdl014 = l_xmdk.xmdk040
           #LET l_xmdl.xmdl015 = ' '                #170209-00026#1 mark
           #LET l_xmdl.xmdl052 = ' '                #170209-00026#1 mark
         END IF
      END IF
     #170208-00025#1-s-mark
     #CALL axmp580_02_auto_insert_xmdm(l_xmdl.xmdl001,l_xmdl.xmdl002,
     #                                 l_keyno,l_xmdlseq,l_xmdl.xmdl018,l_xmdl.xmdl081)
     #170208-00025#1-e-mark    
     #170208-00025#1-s-add
      CALL axmp580_02_gen_xmdm(l_xmdl.xmdl001,l_xmdl.xmdl002,
                               l_keyno,l_xmdlseq,l_xmdl.xmdl018,l_xmdl.xmdl081)
     #170208-00025#1-e-add      
      RETURNING l_success,l_only,l_xmdm005,l_xmdm006,l_xmdm007,l_xmdm033
      
      IF NOT l_success THEN
         EXIT FOREACH
      END IF

      IF l_only THEN  #代表已無多庫儲批
         LET l_xmdl.xmdl013 = 'N'
         LET l_xmdl.xmdl014 = l_xmdm005
         #LET l_xmdl.xmdl015 = l_xmdm006 #170503-00034#1-mark
         LET l_xmdl.xmdl016 = l_xmdm007
         LET l_xmdl.xmdl052 = l_xmdm033
      END IF

      INSERT INTO axmp580_tmp02(keyno,xmdlseq,             #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
                  xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,
                  xmdl006,
                  xmda033,   #150116新增"客戶訂購單號"
                  xmdl007,xmdl008,xmdl009,xmdl010,
                  xmdl011,xmdl012,
                  xmdl017,xmdl018,xmdl081,
                  xmdl084,
                  xmdl019,xmdl020,xmdl082,
                  xmdl013,xmdl014,xmdl015,
                  xmdl016,xmdl052,
                  xmdl021,xmdl022,xmdl083,
                  xmdl050,xmdl051,
                  xmdl024,xmdl025,
                  xmdl026,xmdl027,xmdl028,xmdl029,
                  xmdl030,xmdl031,xmdl032,   #add by lixiang 2015/06/29
                  xmdl033,
                  xmdl042,xmdl043,xmdl044,xmdl045,
                  xmdl046)
           VALUES(l_keyno,l_xmdlseq,
                  l_xmdl.xmdl001,l_xmdl.xmdl002,l_xmdl.xmdl003,l_xmdl.xmdl004,l_xmdl.xmdl005,
                  l_xmdl.xmdl006,
                  l_xmdl.xmda033,  #150116新增"客戶訂購單號"
                  l_xmdl.xmdl007,l_xmdl.xmdl008,l_xmdl.xmdl009,l_xmdl.xmdl010,
                  l_xmdl.xmdl011,l_xmdl.xmdl012,
                  l_xmdl.xmdl017,l_xmdl.xmdl018,l_xmdl.xmdl081,
                  l_xmdl.xmdl084,
                  l_xmdl.xmdl019,l_xmdl.xmdl020,l_xmdl.xmdl082,
                  l_xmdl.xmdl013,l_xmdl.xmdl014,l_xmdl.xmdl015,
                  l_xmdl.xmdl016,l_xmdl.xmdl052,
                  l_xmdl.xmdl021,l_xmdl.xmdl022,l_xmdl.xmdl083,
                  l_xmdl.xmdl050,l_xmdl.xmdl051,
                  l_xmdl.xmdl024,l_xmdl.xmdl025,
                  l_xmdl.xmdl026,l_xmdl.xmdl027,l_xmdl.xmdl028,l_xmdl.xmdl029,
                  l_xmdl.xmdl030,l_xmdl.xmdl031,l_xmdl.xmdl032,  #add by lixiang 2015/06/29
                  l_xmdl.xmdl033,
                  l_xmdl.xmdl042,l_xmdl.xmdl043,l_xmdl.xmdl044,l_xmdl.xmdl045,
                  l_xmdl.xmdl046)

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'ins axmp580_tmp02'           #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
END FUNCTION

PUBLIC FUNCTION axmp580_02_b_fill()
   DEFINE l_sql        STRING
   DEFINE l_ac_t       LIKE type_t.num10     #170104-00066#3 num5->num10  17/01/06 mod by rainy 
   DEFINE l_pmak003    LIKE pmak_t.pmak003   #161230-00019
   
   #161230-00019-s-mod
#   LET l_sql = "SELECT keyno,xmdk007,'',xmdk009,'',xmdk008,'',xmdk202,''",
   LET l_sql = "SELECT keyno,xmdk007,(SELECT pmaal004 FROM pmaal_t WHERE pmaalent = ",g_enterprise," AND pmaal001 = xmdk007 AND pmaal002 = '",g_dlang,"' ), ",
               "       xmdk047,xmdk009,(SELECT pmaal004 FROM pmaal_t WHERE pmaalent = ",g_enterprise," AND pmaal001 = xmdk008 AND pmaal002 = '",g_dlang,"' ), ",
               "       xmdk008,(SELECT pmaal004 FROM pmaal_t WHERE pmaalent = ",g_enterprise," AND pmaal001 = xmdk009 AND pmaal002 = '",g_dlang,"' ), ",
               "       xmdk202,(SELECT pmaal004 FROM pmaal_t WHERE pmaalent = ",g_enterprise," AND pmaal001 = xmdk202 AND pmaal002 = '",g_dlang,"' ) ",
   #161230-00019-e-mod
               "  FROM axmp580_tmp01"         #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01                
   PREPARE axmp580_02_temp_d1_sel FROM l_sql
   DECLARE axmp580_02_temp_d1_b_fill_curs CURSOR FOR axmp580_02_temp_d1_sel

   CALL g_xmdk_d.clear()
   LET g_master_idx = 1

   LET l_ac_t = g_master_idx
   LET l_ac = 1
   ERROR "Searching!"

   FOREACH axmp580_02_temp_d1_b_fill_curs INTO g_xmdk_d[l_ac].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:axmp580_02_temp_d1_b_fill_curs"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF

#      CALL axmp580_02_detail_show("'1'")   #161230-00019 mark
      IF NOT cl_null(g_xmdk_d[l_ac].xmdk047) THEN
         LET l_pmak003 = ''
         CALL s_desc_get_oneturn_guest_desc(g_xmdk_d[l_ac].xmdk047) 
           RETURNING l_pmak003
         
         IF NOT cl_null(l_pmak003) THEN
            LET g_xmdk_d[l_ac].xmdk007_desc = l_pmak003
         END IF
         IF g_xmdk_d[l_ac].xmdk007 = g_xmdk_d[l_ac].xmdk008 THEN
           IF NOT cl_null(l_pmak003) THEN
              LET g_xmdk_d[l_ac].xmdk008_desc = l_pmak003
           END IF
        END IF 
        IF g_xmdk_d[l_ac].xmdk007 = g_xmdk_d[l_ac].xmdk009 THEN
           IF NOT cl_null(l_pmak003) THEN
              LET g_xmdk_d[l_ac].xmdk009_desc = l_pmak003
           END IF
        END IF 
        IF g_xmdk_d[l_ac].xmdk007 = g_xmdk_d[l_ac].xmdk202 THEN
           IF NOT cl_null(l_pmak003) THEN
              LET g_xmdk_d[l_ac].xmdk202_desc = l_pmak003
           END IF
        END IF 
      END IF

      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ""
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
   END FOREACH
   
   LET g_rec_b = l_ac - 1
   CALL g_xmdk_d.deleteElement(l_ac)
   LET l_ac = l_ac_t
   CLOSE axmp580_02_temp_d1_b_fill_curs
   FREE axmp580_02_temp_d1_sel
   
   LET g_master_idx = l_ac

   CALL axmp580_02_fetch('2')
   CALL axmp580_02_fetch('3')
   CALL axmp580_02_fetch('5')
END FUNCTION

PRIVATE FUNCTION axmp580_02_detail_show(p_page)
   DEFINE p_page      STRING
   DEFINE l_success   LIKE type_t.num5
   
   IF p_page.getIndexOf("'1'",1) > 0 THEN
      #訂單客戶
      CALL s_desc_get_trading_partner_abbr_desc(g_xmdk_d[l_ac].xmdk007)
      RETURNING g_xmdk_d[l_ac].xmdk007_desc
      #收貨客戶
      CALL s_desc_get_trading_partner_abbr_desc(g_xmdk_d[l_ac].xmdk009)
      RETURNING g_xmdk_d[l_ac].xmdk009_desc
      #收款客戶
      CALL s_desc_get_trading_partner_abbr_desc(g_xmdk_d[l_ac].xmdk008)
      RETURNING g_xmdk_d[l_ac].xmdk008_desc
      #發票客戶
      CALL s_desc_get_trading_partner_abbr_desc(g_xmdk_d[l_ac].xmdk202)
      RETURNING g_xmdk_d[l_ac].xmdk202_desc
      
   END IF
   
   IF p_page.getIndexOf("'2'",1) > 0 THEN
      #料件編號
      CALL s_desc_get_item_desc(g_xmdk2_d[l_ac].xmdl008)
      RETURNING g_xmdk2_d[l_ac].xmdl008_desc,g_xmdk2_d[l_ac].xmdl008_desc_desc
      #產品特徵
      CALL s_feature_description(g_xmdk2_d[l_ac].xmdl008,g_xmdk2_d[l_ac].xmdl009)
      RETURNING l_success,g_xmdk2_d[l_ac].xmdl009_desc
      #作業編號
      CALL s_desc_get_acc_desc('221',g_xmdk2_d[l_ac].xmdl011)
      RETURNING g_xmdk2_d[l_ac].xmdl011_desc
      #出貨單位
      CALL s_desc_get_unit_desc(g_xmdk2_d[l_ac].xmdl017)
      RETURNING g_xmdk2_d[l_ac].xmdl017_desc
      #簽退理由碼
      CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl084,'axmt590')
      RETURNING g_xmdk2_d[l_ac].xmdl084_desc
      #參考單位
      CALL s_desc_get_unit_desc(g_xmdk2_d[l_ac].xmdl019)
      RETURNING g_xmdk2_d[l_ac].xmdl019_desc
      #庫位
      CALL s_desc_get_stock_desc(g_site,g_xmdk2_d[l_ac].xmdl014)
      RETURNING g_xmdk2_d[l_ac].xmdl014_desc
      #儲位
      CALL s_desc_get_locator_desc(g_site,g_xmdk2_d[l_ac].xmdl014,g_xmdk2_d[l_ac].xmdl015)
      RETURNING g_xmdk2_d[l_ac].xmdl015_desc
      #計價單位
      CALL s_desc_get_unit_desc(g_xmdk2_d[l_ac].xmdl021)
      RETURNING g_xmdk2_d[l_ac].xmdl021_desc
      #理由碼
      CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl050,'axmt580')
      RETURNING g_xmdk2_d[l_ac].xmdl050_desc
      
   END IF
   
   IF p_page.getIndexOf("'3'",1) > 0 THEN
      #料件編號
      CALL s_desc_get_item_desc(g_xmdk3_d[l_ac].xmdm001)
      RETURNING g_xmdk3_d[l_ac].xmdm001_desc,g_xmdk3_d[l_ac].xmdm001_desc_desc   
      #產品特徵
      CALL s_feature_description(g_xmdk3_d[l_ac].xmdm001,g_xmdk3_d[l_ac].xmdm002)
      RETURNING l_success,g_xmdk3_d[l_ac].xmdm002_desc
      #庫位
      CALL s_desc_get_stock_desc(g_site,g_xmdk3_d[l_ac].xmdm005)
      RETURNING g_xmdk3_d[l_ac].xmdm005_desc
      #儲位
      CALL s_desc_get_locator_desc(g_site,g_xmdk3_d[l_ac].xmdm005,g_xmdk3_d[l_ac].xmdm006)
      RETURNING g_xmdk3_d[l_ac].xmdm006_desc
      #出貨單位
      CALL s_desc_get_unit_desc(g_xmdk3_d[l_ac].xmdm008)
      RETURNING g_xmdk3_d[l_ac].xmdm008_desc
      #參考單位
      CALL s_desc_get_unit_desc(g_xmdk3_d[l_ac].xmdm010)
      RETURNING g_xmdk3_d[l_ac].xmdm010_desc
      
   END IF
   
   IF p_page.getIndexOf("'5'",1) > 0 THEN
      #料件編號
      CALL s_desc_get_item_desc(g_xmdk5_d[l_ac].xmdl008)
      RETURNING g_xmdk5_d[l_ac].xmdl008_desc,g_xmdk5_d[l_ac].xmdl008_desc_desc
      #產品特徵
      CALL s_feature_description(g_xmdk5_d[l_ac].xmdl008,g_xmdk5_d[l_ac].xmdl009)
      RETURNING l_success,g_xmdk5_d[l_ac].xmdl009_desc
      #作業編號
      CALL s_desc_get_acc_desc('221',g_xmdk5_d[l_ac].xmdl011)
      RETURNING g_xmdk5_d[l_ac].xmdl011_desc
      #出貨單位
      CALL s_desc_get_unit_desc(g_xmdk5_d[l_ac].xmdl017)
      RETURNING g_xmdk5_d[l_ac].xmdl017_desc
      #計價單位
      CALL s_desc_get_unit_desc(g_xmdk5_d[l_ac].xmdl021)
      RETURNING g_xmdk5_d[l_ac].xmdl021_desc
      #稅別
      CALL s_desc_get_tax_desc1(g_site,g_xmdk5_d[l_ac].xmdl025)
      RETURNING g_xmdk5_d[l_ac].xmdl025_desc
      
   END IF
   
END FUNCTION

PUBLIC FUNCTION axmp580_02_fetch(p_cmd)
   DEFINE p_cmd       LIKE type_t.chr1
   DEFINE l_ac_t      LIKE type_t.num10    #170104-00066#3 num5->num10  17/01/06 mod by rainy 
   DEFINE l_sql       STRING

   CASE p_cmd
      WHEN '2'
         CALL g_xmdk2_d.clear()
         
         LET l_sql = "SELECT keyno,xmdlseq,",
                     "       xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,",
                     "       xmdl006,",
                     "       xmda033,",   #150116新增"客戶訂購單號"
                     "       xmdl007,",
                     "       xmdl008,'','',",
                     "       xmdl009,'',",
                     "       xmdl011,'',",
                     "       xmdl012,",
                     "       xmdl017,'',",
                     "       xmdl018,xmdl081,",
                     "       xmdl084,'',",
                     "       xmdl019,'',",
                     "       xmdl020,xmdl082,xmdl013,",
                     "       xmdl014,'',",
                     "       xmdl015,'',",
                     "       xmdl016,xmdl052,",
                     "       xmdl021,'',",
                     "       xmdl022,xmdl083,",
                     "       xmdl050,'',",
                     "       xmdl051",
                     "  FROM axmp580_tmp02",             #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
                     " WHERE keyno = ",g_xmdk_d[g_master_idx].keyno CLIPPED,
                     " ORDER BY keyno,xmdlseq"
         
         PREPARE axmp580_02_temp_d2_sel FROM l_sql
         DECLARE axmp580_02_temp_d2_b_fill_curs CURSOR FOR axmp580_02_temp_d2_sel
         
         LET l_ac_t = l_ac
         LET l_ac = 1
         
         FOREACH axmp580_02_temp_d2_b_fill_curs INTO g_xmdk2_d[l_ac].*
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "FOREACH:axmp580_02_temp_d2_b_fill_curs"
               LET g_errparam.popup = TRUE
               CALL cl_err()
         
               EXIT FOREACH
            END IF
         
            CALL axmp580_02_detail_show("'2'")
            
            LET l_ac = l_ac + 1
            IF l_ac > g_max_rec THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  9035
               LET g_errparam.extend =  ""
               LET g_errparam.popup = TRUE
               CALL cl_err()
         
               EXIT FOREACH
            END IF
         END FOREACH
         
         LET g_rec_b2 = l_ac - 1
         CALL g_xmdk2_d.deleteElement(l_ac)
         LET l_ac = l_ac_t
         CLOSE axmp580_02_temp_d2_b_fill_curs
         FREE axmp580_02_temp_d2_sel
   
      WHEN '3'
         CALL g_xmdk3_d.clear()
        
         LET l_sql = "SELECT keyno,xmdmseq,xmdmseq1,",
                     "       xmdm001,'','',",
                     "       xmdm002,'',",
                     "       xmdm003,xmdm004,",
                     "       xmdm005,'',",
                     "       xmdm006,'',",
                     "       xmdm007,xmdm033,",
                     "       xmdm008,'',",
                     "       xmdm009,",
                     "       xmdm010,'',",
                     "       xmdm011",
                     "  FROM axmp580_tmp03",        #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03
                     " WHERE keyno = ",g_xmdk_d[g_master_idx].keyno CLIPPED,
                     " ORDER BY keyno,xmdmseq,xmdmseq1"
                     
         PREPARE axmp580_02_temp_d3_sel FROM l_sql
         DECLARE axmp580_02_temp_d3_b_fill_curs CURSOR FOR axmp580_02_temp_d3_sel
         
         LET l_ac_t = l_ac
         LET l_ac = 1
        
         FOREACH axmp580_02_temp_d3_b_fill_curs INTO g_xmdk3_d[l_ac].*
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "FOREACH:axmp580_02_temp_d3_b_fill_curs"
               LET g_errparam.popup = TRUE
               CALL cl_err()
        
               EXIT FOREACH
            END IF
            
            CALL axmp580_02_detail_show("'3'")
            
            LET l_ac = l_ac + 1
            IF l_ac > g_max_rec THEN
               INITIALIZE g_errparam TO NULL
                  LET g_errparam.code =  9035
                  LET g_errparam.extend =  ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
        
               EXIT FOREACH
            END IF
         END FOREACH
         
         LET g_rec_b3 = l_ac - 1
         CALL g_xmdk3_d.deleteElement(l_ac)
         LET l_ac = l_ac_t
         CLOSE axmp580_02_temp_d3_b_fill_curs
         FREE axmp580_02_temp_d3_sel
   
      WHEN '5'
         CALL g_xmdk5_d.clear()
         
         LET l_sql = "SELECT keyno,xmdlseq,",
                     "       xmdl007,",
                     "       xmdl008,'','',",
                     "       xmdl009,'',",
                     "       xmdl011,'',",
                     "       xmdl012,",
                     "       xmdl017,'',",
                     "       xmdl018,",
                     "       xmdl021,'',",
                     "       xmdl022,xmdl024,",
                     "       xmdl025,'',",
                     "       xmdl026,xmdl027,xmdl028,xmdl029,",
                     "       xmdl042,xmdl043,xmdl044,xmdl045,",
                     "       xmdl046",
                     "  FROM axmp580_tmp02",             #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
                     " WHERE keyno = ",g_xmdk_d[g_master_idx].keyno CLIPPED,
                     " ORDER BY keyno,xmdlseq"

         PREPARE axmp580_02_temp_d5_sel FROM l_sql
         DECLARE axmp580_02_temp_d5_b_fill_curs CURSOR FOR axmp580_02_temp_d5_sel
         
         LET l_ac_t = l_ac
         LET l_ac = 1
        
         FOREACH axmp580_02_temp_d5_b_fill_curs INTO g_xmdk5_d[l_ac].*
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "FOREACH:axmp580_02_temp_d5_b_fill_curs"
               LET g_errparam.popup = TRUE
               CALL cl_err()
        
               EXIT FOREACH
            END IF
        
            CALL axmp580_02_detail_show("'5'")
            
            LET l_ac = l_ac + 1
            IF l_ac > g_max_rec THEN
               INITIALIZE g_errparam TO NULL
                  LET g_errparam.code =  9035
                  LET g_errparam.extend =  ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
        
               EXIT FOREACH
            END IF
         END FOREACH
         
         LET g_rec_b5 = l_ac - 1
         CALL g_xmdk5_d.deleteElement(l_ac)
         LET l_ac = l_ac_t
         CLOSE axmp580_02_temp_d5_b_fill_curs
         FREE axmp580_02_temp_d5_sel
   
   END CASE
END FUNCTION

PUBLIC FUNCTION axmp580_02_delete_temp_table()
   DELETE FROM axmp580_tmp01          #160727-00019#24 Mod  axmp580_02_temp_d1--> axmp580_tmp01       
   DELETE FROM axmp580_tmp02          #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
   DELETE FROM axmp580_tmp03          #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03
END FUNCTION

PUBLIC FUNCTION axmp580_02_set_entry_b()
   CALL cl_set_comp_entry("xmdl022_d2_02,xmdl083_d2_02",TRUE)
END FUNCTION

PUBLIC FUNCTION axmp580_02_set_no_entry_b()
   IF cl_null(g_xmdk2_d[l_ac].xmdl021) THEN
      CALL cl_set_comp_entry("xmdl022_d2_02,xmdl083_d2_02",FALSE)
   END IF
   
END FUNCTION

################################################################################
# Descriptions...: 帶出出貨單多庫儲批
# Memo...........:
# Usage..........: CALL axmp580_02_auto_insert_xmdm(p_xmdl001,p_xmdl002,p_keyno,p_xmdlseq,p_xmdl018,p_xmdl081)
#                  RETURNING r_only,r_xmdm005,r_xmdm006,r_xmdm007,r_xmdm033
# Input parameter: p_xmdl001     (出貨單號)
#                : p_xmdl002     (出貨單項次)
#                : p_keyno       (序號)
#                : p_xmdlseq     (單身項次)
#                : p_xmdl018     (簽收數量)
#                : p_xmdl081     (簽退數量)
# Return code....: r_success     (執行結果)
#                : r_only        (符合的多庫儲批是否只有一筆)TRUE/FALSE
#                : r_xmdm005     (庫位)若只有一筆多庫儲批時回傳才有值
#                : r_xmdm006     (儲位)若只有一筆多庫儲批時回傳才有值
#                : r_xmdm007     (批號)若只有一筆多庫儲批時回傳才有值
#                : r_xmdm033     (庫存管理特徵)若只有一筆多庫儲批時回傳才有值
# Date & Author..: 141022 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION axmp580_02_auto_insert_xmdm(p_xmdl001,p_xmdl002,p_keyno,p_xmdlseq,p_xmdl018,p_xmdl081)
   DEFINE p_xmdl001    LIKE xmdl_t.xmdl001
   DEFINE p_xmdl002    LIKE xmdl_t.xmdl002
   DEFINE p_keyno      LIKE type_t.num5
   DEFINE p_xmdlseq    LIKE xmdl_t.xmdlseq
   DEFINE p_xmdl018    LIKE xmdl_t.xmdl018
   DEFINE p_xmdl081    LIKE xmdl_t.xmdl081
   DEFINE r_success    LIKE type_t.num5
   DEFINE r_only       LIKE type_t.num5
   DEFINE r_xmdm005    LIKE xmdm_t.xmdm005
   DEFINE r_xmdm006    LIKE xmdm_t.xmdm006
   DEFINE r_xmdm007    LIKE xmdm_t.xmdm007
   DEFINE r_xmdm033    LIKE xmdm_t.xmdm033

   DEFINE l_sql        STRING
   DEFINE l_xmdm     RECORD
      xmdmsite         LIKE xmdm_t.xmdmsite,
      xmdm001          LIKE xmdm_t.xmdm001,
      xmdm002          LIKE xmdm_t.xmdm002,
      xmdm003          LIKE xmdm_t.xmdm003,
      xmdm004          LIKE xmdm_t.xmdm004,
      xmdm005          LIKE xmdm_t.xmdm005,
      xmdm006          LIKE xmdm_t.xmdm006,
      xmdm007          LIKE xmdm_t.xmdm007,
      xmdm008          LIKE xmdm_t.xmdm008,
      xmdm010          LIKE xmdm_t.xmdm010,
      xmdm033          LIKE xmdm_t.xmdm033
                     END RECORD
                     
   DEFINE l_xmdk039    LIKE xmdk_t.xmdk039   #在途成本庫位
   DEFINE l_xmdk040    LIKE xmdk_t.xmdk040   #在途非成本庫位
   DEFINE l_xmdmseq1   LIKE xmdm_t.xmdmseq1  #項序
   DEFINE l_xmdm005    LIKE xmdm_t.xmdm005   #庫位
   DEFINE l_xmdm007    LIKE xmdm_t.xmdm007   #批號
   DEFINE l_xmdm009    LIKE xmdm_t.xmdm009   #簽收數量
   DEFINE l_xmdm011    LIKE xmdm_t.xmdm011   #參考數量
   DEFINE l_xmdm031    LIKE xmdm_t.xmdm031   #簽退數量
   DEFINE l_xmdm032    LIKE xmdm_t.xmdm032   #簽退參考數量
   DEFINE l_type       LIKE type_t.chr1
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_num        LIKE xmdm_t.xmdm009

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_only = FALSE
   LET r_xmdm005 = ''
   LET r_xmdm006 = ''
   LET r_xmdm007 = ''
   LET r_xmdm033 = ''

   LET l_sql = "SELECT xmdk039,xmdk040,",
               "       xmdmsite,",
               "       xmdm001,xmdm002,xmdm003,xmdm004,xmdm005,",
               #"       xmdm006,xmdm007,xmdm008,xmdm010,",  #170503-00034#1-mark
               "       ' ',xmdm007,xmdm008,xmdm010,",       #170503-00034#1-add
               "       xmdmseq1,xmdm009,xmdm011,xmdm031,xmdm032,",  #170123-00026#1 add               
               "       xmdm033",
               "  FROM xmdk_t,xmdm_t",
               " WHERE xmdkent = xmdment AND xmdment = ",g_enterprise,
               "   AND xmdkdocno = xmdmdocno AND xmdmdocno = '",p_xmdl001,"'",
               "   AND xmdmseq = '",p_xmdl002,"'",
               " ORDER BY xmdmseq1"
   PREPARE axmp580_02_import_pre FROM l_sql
  #DECLARE axmp580_02_import_cs SCROLL CURSOR FOR axmp580_02_import_pre    #170123-00026#1 mark
   DECLARE axmp580_02_import_cs CURSOR  FOR axmp580_02_import_pre          #170123-00026#1 add

   LET l_xmdk039 = ''
   LET l_xmdk040 = ''
   INITIALIZE l_xmdm.* TO NULL

   OPEN axmp580_02_import_cs
  #FETCH FIRST axmp580_02_import_cs INTO l_xmdk039,l_xmdk040,    #170123-00026#1 mark
   FOREACH axmp580_02_import_cs INTO l_xmdk039,l_xmdk040,        #170123-00026#1 add
                                         l_xmdm.xmdmsite,
                                         l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm003,l_xmdm.xmdm004,l_xmdm.xmdm005,
                                         l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm008,l_xmdm.xmdm010,
                                         l_xmdmseq1,l_xmdm009,l_xmdm011,l_xmdm031,l_xmdm032,    #170123-00026#1 add
                                         l_xmdm.xmdm033
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'FETCH'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_only,r_xmdm005,r_xmdm006,r_xmdm007,r_xmdm033      
   END IF
   
   #檢查是否為成本庫
   CALL s_axmt540_inag012_chk(l_xmdm.xmdmsite,l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm033,l_xmdm.xmdm005,l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm008)
   RETURNING l_type

   LET l_xmdm005 = ''
   IF l_type = 'Y' THEN   #在途成本庫位
      LET l_xmdm005 = l_xmdk039
   ELSE                   #在途非成本庫位
      LET l_xmdm005 = l_xmdk040
   END IF
##170123-00026#1 mark---begin---
#   LET l_sql = "SELECT DISTINCT xmdm007",
#               "  FROM xmdm_t",
#               " WHERE xmdment = ",g_enterprise,
#               "   AND xmdmdocno = '",p_xmdl001,"'",
#               "   AND xmdmseq = '",p_xmdl002,"'"
#   PREPARE axmp580_02_import_pre01 FROM l_sql
#   DECLARE axmp580_02_import_cs01 CURSOR FOR axmp580_02_import_pre01
#
#   LET l_sql = "SELECT MAX(xmdmseq1) + 1",
#               "  FROM axmp580_tmp03",       #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03
#               " WHERE keyno = '",p_keyno,"'",
#               "   AND xmdmseq = '",p_xmdlseq,"'"
#   PREPARE axmp580_02_import_pre02 FROM l_sql
#
#   LET l_xmdm007 = ''
#   
#   FOREACH axmp580_02_import_cs01 INTO l_xmdm007
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = SQLCA.sqlcode
#         LET g_errparam.extend = 'FOREACH'
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#    
#         LET r_success = FALSE
#         EXIT FOREACH
#      END IF     
#
#      #項序
#      EXECUTE axmp580_02_import_pre02 INTO l_xmdmseq1
#      IF cl_null(l_xmdmseq1) THEN
#         LET l_xmdmseq1 = 1
#      END IF
#
#      #計算可轉簽收簽退量
#      CALL s_axmt580_get_max_sign_qty1(l_xmdm007,p_xmdl001,p_xmdl002) RETURNING l_num
#      IF cl_null(l_num) OR l_num = 0 THEN
#         CONTINUE FOREACH
#      END IF
#
#      IF l_num <= p_xmdl018 THEN   #可簽收簽退量 <= 簽收量
#         LET l_xmdm009 = l_num     #簽收數量 = 可簽收簽退量         
#         LET l_xmdm031 = 0         #簽退數量 = 0
#         
#         #計算尚未寫入的簽收量
#         LET p_xmdl018 = p_xmdl018 - l_xmdm009         
#      ELSE                         #可簽收簽退量 > 簽收量      
#         LET l_xmdm009 = p_xmdl018 #簽收數量 = 尚未寫入的簽收量
#         
#         IF l_num <= p_xmdl018 + p_xmdl081 THEN  #可簽收簽退量 <= 簽收量 + 簽退量            
#            LET l_xmdm031 = l_num - l_xmdm009    #簽退數量 = 可簽收簽退量 - 簽收量
#         
#            #計算尚未寫入的簽退量
#            LET p_xmdl081 = p_xmdl081 - l_xmdm031
#         ELSE            
#            LET l_xmdm031 = p_xmdl081            #簽退數量 = 尚未寫入的簽退量
#            
#            LET p_xmdl081 = 0
#         END IF
#         
#         LET p_xmdl018 = 0
#      END IF
#
#      #簽收數量取位
#      CALL s_aooi250_take_decimals(l_xmdm.xmdm008,l_xmdm009) RETURNING l_success,l_xmdm009
#
#      #推算簽收參考數量
#      IF NOT cl_null(l_xmdm.xmdm001) AND NOT cl_null(l_xmdm.xmdm008) AND
#         NOT cl_null(l_xmdm.xmdm010) AND NOT cl_null(l_xmdm009) THEN
#         CALL s_aooi250_convert_qty(l_xmdm.xmdm001,l_xmdm.xmdm008,l_xmdm.xmdm010,l_xmdm009)
#         RETURNING l_success,l_xmdm011
#      ELSE
#         LET l_xmdm011 = ''
#      END IF
#
#      #簽退數量取位
#      CALL s_aooi250_take_decimals(l_xmdm.xmdm008,l_xmdm031) RETURNING l_success,l_xmdm031
#
#      #推算簽退參考數量
#      IF NOT cl_null(l_xmdm.xmdm001) AND NOT cl_null(l_xmdm.xmdm008) AND
#         NOT cl_null(l_xmdm.xmdm010) AND NOT cl_null(l_xmdm031) THEN
#         CALL s_aooi250_convert_qty(l_xmdm.xmdm001,l_xmdm.xmdm008,l_xmdm.xmdm010,l_xmdm031)
#         RETURNING l_success,l_xmdm032
#      ELSE
#         LET l_xmdm032 = ''
#      END IF
#                      
#      INSERT INTO axmp580_tmp03 (keyno,xmdmseq,xmdmseq1,            #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03
#                                      xmdm001,xmdm002,xmdm003,xmdm004,xmdm005,
#                                      xmdm006,xmdm007,xmdm033,
#                                      xmdm008,xmdm009,xmdm010,xmdm011,
#                                      xmdm031,xmdm032)   
#           VALUES (p_keyno,p_xmdlseq,l_xmdmseq1,
#                   l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm003,l_xmdm.xmdm004,l_xmdm005,
#                   ' ',l_xmdm007,' ' ,                      
#                   l_xmdm.xmdm008,l_xmdm009,l_xmdm.xmdm010,l_xmdm011,
#                   l_xmdm031,l_xmdm032) 
#170123-00026#1 mark--end   
#170123-00026#1 add--begin---
           INSERT INTO axmp580_tmp03 (keyno,xmdmseq,xmdmseq1,           
                                      xmdm001,xmdm002,xmdm003,xmdm004,xmdm005,
                                      xmdm006,xmdm007,xmdm033,
                                      xmdm008,xmdm009,xmdm010,xmdm011,
                                      xmdm031,xmdm032)   
           VALUES (p_keyno,p_xmdlseq,l_xmdmseq1,
                   l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm003,l_xmdm.xmdm004,l_xmdm005,
                   l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm033,                      
                   l_xmdm.xmdm008,l_xmdm009,l_xmdm.xmdm010,l_xmdm011,
                   l_xmdm031,l_xmdm032)    
#170123-00026#1 add--end   

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'FOREACH'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #已無待簽收簽退量
      IF p_xmdl018 + p_xmdl081 = 0 THEN
         EXIT FOREACH
      END IF
   END FOREACH

   #僅有一個項序符合，代表已無多庫儲批
   IF l_xmdmseq1 = 1 THEN
      LET r_only = TRUE
      LET r_xmdm005 = l_xmdm005    #庫位
     #170209-00026#1-s-mark
     #LET r_xmdm006 = ' '          #儲位
     #LET r_xmdm007 = l_xmdm007    #批號
     #LET r_xmdm033 = ' '          #庫存管理特徵
     #170209-00026#1-e-mark
     #170209-00026#1-s-add
      LET r_xmdm006 = l_xmdm.xmdm006      #儲位       
      LET r_xmdm007 = l_xmdm.xmdm007      #批號
      LET r_xmdm033 = l_xmdm.xmdm033      #庫存管理特徵   
     #170209-00026#1-e-add     
   END IF

   RETURN r_success,r_only,r_xmdm005,r_xmdm006,r_xmdm007,r_xmdm033
END FUNCTION

################################################################################
# Descriptions...: 檢查多庫儲批的數量是否正確
# Memo...........:
# Usage..........: CALL axmp580_02_num_chk()
#                  RETURNING r_success
# Input parameter: 
#                : 
# Return code....: r_success   執行結果
#                : 
# Date & Author..: 141029 By earl
# Modify.........:
################################################################################
PUBLIC FUNCTION axmp580_02_num_chk()
   DEFINE r_success  LIKE type_t.num5
   
   DEFINE l_sql      STRING
   DEFINE l_xmdl   RECORD
             keyno      LIKE type_t.num5,
             xmdlseq    LIKE xmdl_t.xmdlseq,
             xmdl018    LIKE xmdl_t.xmdl018,
             xmdl081    LIKE xmdl_t.xmdl081,
             xmdl020    LIKE xmdl_t.xmdl020,
             xmdl082    LIKE xmdl_t.xmdl082
                   END RECORD

   DEFINE l_xmdm   RECORD
             xmdm009    LIKE xmdm_t.xmdm009,
             xmdm031    LIKE xmdm_t.xmdm031,
             xmdm011    LIKE xmdm_t.xmdm011,
             xmdm032    LIKE xmdm_t.xmdm032
                   END RECORD
   
   WHENEVER ERROR CONTINUE
      
   LET r_success = TRUE
   
   LET l_sql = "SELECT keyno,xmdlseq,xmdl018,xmdl081,xmdl020,xmdl082",
               "  FROM axmp580_tmp02"          #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02

   PREPARE axmp580_02_check_pre01 FROM l_sql
   DECLARE axmp580_02_check_cs01 CURSOR FOR axmp580_02_check_pre01

   LET l_sql = "SELECT SUM(xmdm009),SUM(xmdm031),",
               "       SUM(xmdm011),SUM(xmdm032)",
               "  FROM axmp580_tmp03",           #160727-00019#24 Mod  axmp580_02_temp_d3--> axmp580_tmp03
               " WHERE keyno = ?",
               "   AND xmdmseq = ?"

   PREPARE axmp580_02_check_pre02 FROM l_sql

   #先做Update，因直接按Action不會跑ON ROW CHANGE
   IF NOT axmp580_02_update_xmdl() THEN
      LET r_success = FALSE
      RETURN r_success
   END IF

   FOREACH axmp580_02_check_cs01 INTO l_xmdl.keyno,l_xmdl.xmdlseq,
                                      l_xmdl.xmdl018,l_xmdl.xmdl081,
                                      l_xmdl.xmdl020,l_xmdl.xmdl082
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'FOREACH'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         LET r_success = FALSE
         EXIT FOREACH
      END IF

      IF cl_null(l_xmdl.xmdl018) THEN LET l_xmdl.xmdl018 = 0 END IF #簽收數量
      IF cl_null(l_xmdl.xmdl081) THEN LET l_xmdl.xmdl081 = 0 END IF #簽退數量
      IF cl_null(l_xmdl.xmdl020) THEN LET l_xmdl.xmdl020 = 0 END IF #簽收參考數量
      IF cl_null(l_xmdl.xmdl082) THEN LET l_xmdl.xmdl082 = 0 END IF #簽退參考數量

      INITIALIZE l_xmdm.* TO NULL
      EXECUTE axmp580_02_check_pre02 USING l_xmdl.keyno,l_xmdl.xmdlseq
         INTO l_xmdm.xmdm009,l_xmdm.xmdm031,
              l_xmdm.xmdm011,l_xmdm.xmdm032

      IF cl_null(l_xmdm.xmdm009) THEN LET l_xmdm.xmdm009 = 0 END IF #簽收數量
      IF cl_null(l_xmdm.xmdm031) THEN LET l_xmdm.xmdm031 = 0 END IF #簽退數量
      IF cl_null(l_xmdm.xmdm011) THEN LET l_xmdm.xmdm011 = 0 END IF #簽收參考數量
      IF cl_null(l_xmdm.xmdm032) THEN LET l_xmdm.xmdm032 = 0 END IF #簽退參考數量

      #簽收數量
      IF l_xmdl.xmdl018 <> l_xmdm.xmdm009 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00241'   #多庫儲批總"簽收數量%1"不可與項次%2"簽收數量%3"不相等！
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_xmdm.xmdm009
         LET g_errparam.replace[2] =  l_xmdl.xmdlseq
         LET g_errparam.replace[3] =  l_xmdl.xmdl018
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #簽退數量
      IF l_xmdl.xmdl081 <> l_xmdm.xmdm031 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00243'   #多庫儲批總"簽退數量%1"不可與項次%2"簽退數量%3"不相等！
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_xmdm.xmdm031
         LET g_errparam.replace[2] =  l_xmdl.xmdlseq
         LET g_errparam.replace[3] =  l_xmdl.xmdl081
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #簽收參考數量
      IF l_xmdl.xmdl020 <> l_xmdm.xmdm011 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00242'   #多庫儲批總"簽收參考數量%1"不可與項次%2"簽收參考數量%3"不相等！
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_xmdm.xmdm011
         LET g_errparam.replace[2] =  l_xmdl.xmdlseq
         LET g_errparam.replace[3] =  l_xmdl.xmdl020
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF

      #簽退參考數量
      IF l_xmdl.xmdl082 <> l_xmdm.xmdm032 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axm-00243'   #多庫儲批總"簽退數量%1"不可與項次%2"簽退數量%3"不相等！
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = l_xmdm.xmdm032
         LET g_errparam.replace[2] =  l_xmdl.xmdlseq
         LET g_errparam.replace[3] =  l_xmdl.xmdl082
         CALL cl_err()
         
         LET r_success = FALSE
         EXIT FOREACH
      END IF

   END FOREACH

   RETURN r_success
END FUNCTION

PUBLIC FUNCTION axmp580_02_update_xmdl()
   DEFINE l_xrcd103    LIKE xrcd_t.xrcd103
   DEFINE l_xrcd104    LIKE xrcd_t.xrcd104
   DEFINE l_xrcd105    LIKE xrcd_t.xrcd105
   DEFINE l_xrcd113    LIKE xrcd_t.xrcd113
   DEFINE l_xrcd114    LIKE xrcd_t.xrcd114
   DEFINE l_xrcd115    LIKE xrcd_t.xrcd115  
   DEFINE r_success    LIKE type_t.num5
   DEFINE l_money      LIKE xmdl_t.xmdl027   #170209-00026#1 add
   DEFINE l_xmdk    RECORD
      xmdksite         LIKE xmdk_t.xmdksite,
      xmdk016          LIKE xmdk_t.xmdk016,
      xmdk017          LIKE xmdk_t.xmdk017,
      xmdl022          LIKE xmdl_t.xmdl022,
      xmdl024          LIKE xmdl_t.xmdl024,
      xmdl025          LIKE xmdl_t.xmdl025     
                    END RECORD
   
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE

   INITIALIZE l_xmdk.* TO NULL
   
   SELECT xmdksite,xmdk016,xmdk017,
          xmdl022,xmdl024,xmdl025
     INTO l_xmdk.xmdksite,l_xmdk.xmdk016,l_xmdk.xmdk017,
          l_xmdk.xmdl022,l_xmdk.xmdl024,l_xmdk.xmdl025
     FROM xmdk_t,xmdl_t
    WHERE xmdkent = xmdlent AND xmdlent = g_enterprise
      AND xmdkdocno = xmdldocno
      AND xmdldocno = g_xmdk2_d[l_ac].xmdl001
      AND xmdlseq = g_xmdk2_d[l_ac].xmdl002
   
   LET l_money = l_xmdk.xmdl024 * g_xmdk2_d[l_ac].xmdl022     #170209-00026#1 add
  #CALL s_tax_count(l_xmdk.xmdksite,l_xmdk.xmdl025,l_xmdk.xmdl024,l_xmdk.xmdl022,l_xmdk.xmdk016,l_xmdk.xmdk017)  #170209-00026#1 mark
   #CALL s_tax_count(l_xmdk.xmdksite,l_xmdk.xmdl025,l_xmdk.xmdl024,l_xmdk.xmdl022,l_xmdk.xmdk016,l_xmdk.xmdk017)  #170209-00026#1 add    #170328-00088#1 mark
   CALL s_tax_count(l_xmdk.xmdksite,l_xmdk.xmdl025,l_money,l_xmdk.xmdl022,l_xmdk.xmdk016,l_xmdk.xmdk017)  #170328-00088#1 add
   RETURNING l_xrcd103,l_xrcd104,l_xrcd105,l_xrcd113,l_xrcd114,l_xrcd115      
   
   UPDATE axmp580_tmp02 SET xmdl018 = g_xmdk2_d[l_ac].xmdl018,           #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
                                 xmdl081 = g_xmdk2_d[l_ac].xmdl081,
                                 xmdl084 = g_xmdk2_d[l_ac].xmdl084,
                                 xmdl020 = g_xmdk2_d[l_ac].xmdl020,
                                 xmdl082 = g_xmdk2_d[l_ac].xmdl082,
                                 xmdl013 = g_xmdk2_d[l_ac].xmdl013,
                                 xmdl014 = g_xmdk2_d[l_ac].xmdl014,
                                 xmdl015 = g_xmdk2_d[l_ac].xmdl015,
                                 xmdl016 = g_xmdk2_d[l_ac].xmdl016,
                                 xmdl052 = g_xmdk2_d[l_ac].xmdl052,
                                 xmdl022 = g_xmdk2_d[l_ac].xmdl022,
                                 xmdl083 = g_xmdk2_d[l_ac].xmdl083,
                                 xmdl050 = g_xmdk2_d[l_ac].xmdl050,
                                 xmdl051 = g_xmdk2_d[l_ac].xmdl051,
                                 
                                 xmdl027 = l_xrcd103,   #未稅金額
                                 xmdl028 = l_xrcd105,   #含稅金額
                                 xmdl029 = l_xrcd104    #稅額         
    WHERE keyno = g_xmdk2_d[l_ac].keyno 
      AND xmdlseq = g_xmdk2_d[l_ac].xmdlseq
      
   IF SQLCA.sqlcode != 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'update axmp580_tmp02'           #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

#多庫儲批修改
PUBLIC FUNCTION axmp580_02_xmdm_act()
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_rollback LIKE type_t.num5 
   DEFINE l_xmdl014  LIKE xmdl_t.xmdl014
   DEFINE l_xmdl015  LIKE xmdl_t.xmdl015
   DEFINE l_xmdl016  LIKE xmdl_t.xmdl016
   DEFINE l_xmdl052  LIKE xmdl_t.xmdl052

   CALL s_transaction_begin()
   
   #開啟多庫儲批
   CALL axmp540_03('4',g_site,'',g_xmdk2_d[l_ac].keyno,'',
                   g_xmdk2_d[l_ac].xmdlseq,g_xmdk2_d[l_ac].xmdl008,g_xmdk2_d[l_ac].xmdl009,
                   g_xmdk2_d[l_ac].xmdl011,g_xmdk2_d[l_ac].xmdl012,
                   g_xmdk2_d[l_ac].xmdl017,g_xmdk2_d[l_ac].xmdl018,g_xmdk2_d[l_ac].xmdl081,                               
                   g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl020,g_xmdk2_d[l_ac].xmdl082,
                   g_xmdk2_d[l_ac].xmdl001,g_xmdk2_d[l_ac].xmdl002,g_xmdk2_d[l_ac].xmdl003,g_xmdk2_d[l_ac].xmdl004)
                   RETURNING l_success,l_rollback,l_xmdl014,l_xmdl015,l_xmdl016,l_xmdl052
                   
   IF l_rollback OR NOT l_success THEN
      CALL s_transaction_end('N','0')
      RETURN
      
   ELSE

      IF NOT cl_null(l_xmdl016) THEN  #只有一筆         
         UPDATE axmp580_tmp02          #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
            SET xmdl013 = 'N',
                xmdl014 = l_xmdl014,
                xmdl015 = l_xmdl015,
                xmdl016 = l_xmdl016,
                xmdl052 = l_xmdl052
          WHERE keyno = g_xmdk2_d[l_ac].keyno
            AND xmdlseq = g_xmdk2_d[l_ac].xmdlseq
            
      ELSE
      
         UPDATE axmp580_tmp02          #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
            SET xmdl013 = 'Y',
                xmdl014 = ' ',
                xmdl015 = ' ',
                xmdl016 = ' ',
                xmdl052 = ' '
          WHERE keyno = g_xmdk2_d[l_ac].keyno
            AND xmdlseq = g_xmdk2_d[l_ac].xmdlseq
            
      END IF
      
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  SQLCA.sqlcode
         LET g_errparam.extend = "UPDATE:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
     
         CALL s_transaction_end('N','0')
         RETURN
      END IF

   END IF

   CALL s_transaction_end('Y','0')
   
   CALL axmp580_02_fetch('2')
END FUNCTION

################################################################################
# Descriptions...: 出貨明細頁籤的輸入段
# Memo...........:
# Usage..........: CALL axmp580_02_b()
# Input parameter: 
# Return code....: 
# Date & Author..: 2016/03/29 By dorislai (151118-00029#6)
# Modify.........:
################################################################################
PUBLIC FUNCTION axmp580_02_b()
   DEFINE l_gzcb004    LIKE gzcb_t.gzcb004
  #DEFINE l_num        LIKE type_t.num5        #170209-00026#1  mark
   DEFINE l_num        LIKE xmdl_t.xmdl018     #170209-00026#1  add
   DEFINE l_success    LIKE type_t.num5
   
   WHENEVER ERROR CONTINUE

   DIALOG ATTRIBUTES(UNBUFFERED)
      INPUT ARRAY g_xmdk2_d FROM s_detail2_axmp580_02.*
         ATTRIBUTE(COUNT = g_rec_b2,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                   INSERT ROW = FALSE,DELETE ROW = FALSE,APPEND ROW = FALSE)
      
         BEFORE INPUT
            CALL axmp580_02_fetch('2')
            
         BEFORE ROW
            LET l_ac = DIALOG.getCurrentRow("s_detail2_axmp580_02")
            #LET l_ac = ARR_CURR()
                     
            SELECT keyno,xmdlseq,
                   xmdl001,xmdl002,xmdl003,xmdl004,xmdl005,
                   xmdl006,
                   xmda033,    #150116新增"客戶訂購單號"
                   xmdl007,
                   xmdl008,'','',
                   xmdl009,'',
                   xmdl011,'',
                   xmdl012,
                   xmdl017,'',
                   xmdl018,xmdl081,
                   xmdl084,'',
                   xmdl019,'',
                   xmdl020,xmdl082,xmdl013,
                   xmdl014,'',
                   xmdl015,'',
                   xmdl016,xmdl052,
                   xmdl021,'',
                   xmdl022,xmdl083,
                   xmdl050,'',
                   xmdl051
              INTO g_xmdk2_d[l_ac].*
              FROM axmp580_tmp02          #160727-00019#24 Mod  axmp580_02_temp_d2--> axmp580_tmp02
             WHERE keyno = g_xmdk2_d[l_ac].keyno
               AND xmdlseq = g_xmdk2_d[l_ac].xmdlseq
      
            CALL axmp580_02_detail_show("'2'")
            
            LET g_xmdk2_d_o.* = g_xmdk2_d[l_ac].*
            
            CALL axmp580_02_set_entry_b()
            CALL axmp580_02_set_no_entry_b()

         AFTER FIELD xmdl018_d2_02   #簽收數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
               IF g_xmdk2_d[l_ac].xmdl018 <> g_xmdk2_d_o.xmdl018 OR cl_null(g_xmdk2_d_o.xmdl018) THEN
                
                  IF NOT cl_ap_chk_Range(g_xmdk2_d[l_ac].xmdl018,"0.000","1","","","azz-00079",1) THEN
                     LET g_xmdk2_d[l_ac].xmdl018 = g_xmdk2_d_o.xmdl018
                   
                     NEXT FIELD xmdl018_d2_02
                  END IF
                
                  LET g_qty = 0
                  IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                     LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl018
                  END IF
      
                  IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                     LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl081
                  END IF
      
                  #可簽收簽退數量
                  CALL axmp580_01_default_quantity(g_xmdk2_d[l_ac].xmdl001,g_xmdk2_d[l_ac].xmdl002,g_xmdk2_d[l_ac].xmdl017)
                  RETURNING l_num
      
                  #簽收數量檢查
                  IF g_qty > l_num THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axm-00225'    #簽收簽退量不可大於可轉簽收簽退量("出貨量" - "已簽收量" - "已簽退量")
                     LET g_errparam.extend = g_qty
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
      
                     LET g_xmdk2_d[l_ac].xmdl018 = g_xmdk2_d_o.xmdl018
                   
                     NEXT FIELD xmdl018_d2_02
                  END IF
                   
                  #推算參考數量
                  IF NOT cl_null(g_xmdk2_d[l_ac].xmdl008) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl017) AND
                     NOT cl_null(g_xmdk2_d[l_ac].xmdl019) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                            
                     CALL s_aooi250_convert_qty(g_xmdk2_d[l_ac].xmdl008,g_xmdk2_d[l_ac].xmdl017,g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl018)
                     RETURNING l_success,g_xmdk2_d[l_ac].xmdl020
                  ELSE
                     LET g_xmdk2_d[l_ac].xmdl020 = ''
                  END IF
      
               END IF                
            END IF
            
#            LET g_xmdk2_d_o.xmdl018 = g_xmdk2_d[l_ac].xmdl018
#            LET g_xmdk2_d_o.xmdl020 = g_xmdk2_d[l_ac].xmdl020
            
         AFTER FIELD xmdl081_d2_02   #簽退數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
               IF g_xmdk2_d[l_ac].xmdl081 <> g_xmdk2_d_o.xmdl081 OR cl_null(g_xmdk2_d_o.xmdl081) THEN
            
                  IF NOT cl_ap_chk_Range(g_xmdk2_d[l_ac].xmdl081,"0.000","1","","","azz-00079",1) THEN
                     LET g_xmdk2_d[l_ac].xmdl081 = g_xmdk2_d_o.xmdl081
                     
                     NEXT FIELD xmdl081_d2_02
                  END IF
                  
                  LET g_qty = 0
                  IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                     LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl018
                  END IF
           
                  IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                     LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl081
                  END IF
                  
                  #可簽收簽退數量
                  CALL axmp580_01_default_quantity(g_xmdk2_d[l_ac].xmdl001,g_xmdk2_d[l_ac].xmdl002,g_xmdk2_d[l_ac].xmdl017)
                  RETURNING l_num
      
                  #簽收數量檢查
                  IF g_qty > l_num THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'axm-00225'    #簽收簽退量不可大於可轉簽收簽退量("出貨量" - "已簽收量" - "已簽退量")
                     LET g_errparam.extend = g_qty
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
           
                     LET g_xmdk2_d[l_ac].xmdl081 = g_xmdk2_d_o.xmdl081
                     
                     NEXT FIELD xmdl081_d2_02
                  END IF
                  
                  #推算參考數量
                  IF NOT cl_null(g_xmdk2_d[l_ac].xmdl008) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl017) AND
                     NOT cl_null(g_xmdk2_d[l_ac].xmdl019) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                           
                     CALL s_aooi250_convert_qty(g_xmdk2_d[l_ac].xmdl008,g_xmdk2_d[l_ac].xmdl017,g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl081)
                     RETURNING l_success,g_xmdk2_d[l_ac].xmdl082
                  ELSE
                     LET g_xmdk2_d[l_ac].xmdl082 = ''
                  END IF    
                  
               END IF                
            END IF

#            LET g_xmdk2_d_o.xmdl081 = g_xmdk2_d[l_ac].xmdl081
#            LET g_xmdk2_d_o.xmdl082 = g_xmdk2_d[l_ac].xmdl082      
            
         AFTER FIELD xmdl084_d2_02   #簽退理由碼
            CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl084,'axmt590') RETURNING g_xmdk2_d[l_ac].xmdl084_desc
           
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl084) THEN
               IF g_xmdk2_d[l_ac].xmdl084 <> g_xmdk2_d_o.xmdl084 OR cl_null(g_xmdk2_d_o.xmdl084) THEN
                
                  IF NOT axmp580_01_reason_chk(g_xmdk2_d[l_ac].xmdl084,'axmt590') THEN
                     LET g_xmdk2_d[l_ac].xmdl084 = g_xmdk2_d_o.xmdl084
                     
                     CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl084,'axmt590') RETURNING g_xmdk2_d[l_ac].xmdl084_desc
                     
                     NEXT FIELD xmdl084_d2_02
                  END IF
                  
               END IF
            END IF
            
#            LET g_xmdk2_d_o.xmdl084 = g_xmdk2_d[l_ac].xmdl084
      
         AFTER FIELD xmdl020_d2_02   #簽收參考數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl020) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl019) THEN
               #參考數量取位
               CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl020) RETURNING l_success,g_xmdk2_d[l_ac].xmdl020
            END IF
      
#            LET g_xmdk2_d_o.xmdl020 = g_xmdk2_d[l_ac].xmdl020 
      
      
         AFTER FIELD xmdl082_d2_02   #簽退參考數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl082) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl019) THEN
               #參考數量取位
               CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl082) RETURNING l_success,g_xmdk2_d[l_ac].xmdl082
            END IF
      
#            LET g_xmdk2_d_o.xmdl082 = g_xmdk2_d[l_ac].xmdl082 
      
         AFTER FIELD xmdl022_d2_02   #簽收計價數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl022) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl021) THEN
               #參考數量取位
               CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl021,g_xmdk2_d[l_ac].xmdl022) RETURNING l_success,g_xmdk2_d[l_ac].xmdl022
            END IF
      
#            LET g_xmdk2_d_o.xmdl022 = g_xmdk2_d[l_ac].xmdl022  
      
         AFTER FIELD xmdl083_d2_02   #簽退計價數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl083) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl021) THEN
               #參考數量取位
               CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl021,g_xmdk2_d[l_ac].xmdl083) RETURNING l_success,g_xmdk2_d[l_ac].xmdl083
            END IF
      
#            LET g_xmdk2_d_o.xmdl083 = g_xmdk2_d[l_ac].xmdl083  
      
         AFTER FIELD xmdl050_d2_02   #理由碼
            CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl050,'axmt580') RETURNING g_xmdk2_d[l_ac].xmdl050_desc
           
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl050) THEN
               IF g_xmdk2_d[l_ac].xmdl050 <> g_xmdk2_d_o.xmdl050 OR cl_null(g_xmdk2_d_o.xmdl050) THEN
                
                  IF NOT axmp580_01_reason_chk(g_xmdk2_d[l_ac].xmdl050,'axmt580') THEN
                     LET g_xmdk2_d[l_ac].xmdl050 = g_xmdk2_d_o.xmdl050
                     
                     CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl050,'axmt580') RETURNING g_xmdk2_d[l_ac].xmdl050_desc
                     
                     NEXT FIELD xmdl050_d2_02
                  END IF
                  
               END IF
            END IF
            
#            LET g_xmdk2_d_o.xmdl050 = g_xmdk2_d[l_ac].xmdl050  
        
      
         ON ACTION controlp INFIELD xmdl084_d2_02
            #開窗i段
            LET l_gzcb004 = ''
            #160816-00001#11  2016/08/17  By 08734 Mark
           # SELECT gzcb004
           #   INTO l_gzcb004
           #   FROM gzcb_t
           #  WHERE gzcb001 = '24'
           #    AND gzcb002 = 'axmt590'
            LET l_gzcb004 = s_fin_get_scc_value('24','axmt590','2')  #160816-00001#11  2016/08/17  By 08734 add
      
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
      
            LET g_qryparam.default1 = g_xmdk2_d[l_ac].xmdl084             #給予default值
      
#            CALL s_control_get_doc_sql('oocq002',g_xmdk_m.xmdkdocno,'8') RETURNING l_success,l_where
#            IF l_success THEN
#               LET g_qryparam.where = l_where
#            END IF
      
            #給予arg
            LET g_qryparam.arg1 = l_gzcb004
      
            CALL q_oocq002()                                #呼叫開窗
            LET g_xmdk2_d[l_ac].xmdl084 = g_qryparam.return1              #將開窗取得的值回傳到變數
      
            DISPLAY g_xmdk2_d[l_ac].xmdl084 TO xmdl084_d2_02              #顯示到畫面上
      
            CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl084,'axmt590') RETURNING g_xmdk2_d[l_ac].xmdl084_desc
            NEXT FIELD xmdl084_d2_02
      
         ON ACTION controlp INFIELD xmdl050_d2_02
            #開窗i段
            LET l_gzcb004 = ''
            #160816-00001#11  2016/08/17  By 08734 Mark
          #  SELECT gzcb004
          #    INTO l_gzcb004
          #    FROM gzcb_t
          #   WHERE gzcb001 = '24'
          #     AND gzcb002 = 'axmt580'
            LET l_gzcb004 = s_fin_get_scc_value('24','axmt580','2')  #160816-00001#11  2016/08/17  By 08734 add
      
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
      
            LET g_qryparam.default1 = g_xmdk2_d[l_ac].xmdl050             #給予default值
      
#            CALL s_control_get_doc_sql('oocq002',g_xmdk_m.xmdkdocno,'8') RETURNING l_success,l_where
#            IF l_success THEN
#               LET g_qryparam.where = l_where
#            END IF
      
            #給予arg
            LET g_qryparam.arg1 = l_gzcb004
      
            CALL q_oocq002()                                #呼叫開窗
            LET g_xmdk2_d[l_ac].xmdl050 = g_qryparam.return1              #將開窗取得的值回傳到變數
      
            DISPLAY g_xmdk2_d[l_ac].xmdl050 TO xmdl050_d2_02              #顯示到畫面上
      
            CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl050,'axmt580') RETURNING g_xmdk2_d[l_ac].xmdl050_desc
            NEXT FIELD xmdl050_d2_02
      
         ON ROW CHANGE      
            IF NOT axmp580_02_update_xmdl() THEN
               RETURN
            END IF
               
         AFTER INPUT         
         

         ON ACTION accept
            #===簽收數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
               IF NOT cl_ap_chk_Range(g_xmdk2_d[l_ac].xmdl018,"0.000","1","","","azz-00079",1) THEN
                  LET g_xmdk2_d[l_ac].xmdl018 = g_xmdk2_d_o.xmdl018
                  NEXT FIELD xmdl018_d2_02
               END IF
               LET g_qty = 0
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                  LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl018
               END IF
              
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                  LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl081
               END IF
              
               #可簽收簽退數量
               CALL axmp580_01_default_quantity(g_xmdk2_d[l_ac].xmdl001,g_xmdk2_d[l_ac].xmdl002,g_xmdk2_d[l_ac].xmdl017)
               RETURNING l_num
              
               #簽收數量檢查
               IF g_qty > l_num THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00225'    #簽收簽退量不可大於可轉簽收簽退量("出貨量" - "已簽收量" - "已簽退量")
                  LET g_errparam.extend = g_qty
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
              
                  LET g_xmdk2_d[l_ac].xmdl018 = g_xmdk2_d_o.xmdl018
                  LET g_xmdk2_d[l_ac].xmdl081 = g_xmdk2_d_o.xmdl081
                
                  NEXT FIELD xmdl018_d2_02
               END IF
               #推算參考數量
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl008) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl017) AND
                  NOT cl_null(g_xmdk2_d[l_ac].xmdl019) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                         
                  CALL s_aooi250_convert_qty(g_xmdk2_d[l_ac].xmdl008,g_xmdk2_d[l_ac].xmdl017,g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl018)
                  RETURNING l_success,g_xmdk2_d[l_ac].xmdl020
               ELSE
                  LET g_xmdk2_d[l_ac].xmdl020 = ''
               END IF
            END IF
            
            #===簽退數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
               IF NOT cl_ap_chk_Range(g_xmdk2_d[l_ac].xmdl081,"0.000","1","","","azz-00079",1) THEN
                  LET g_xmdk2_d[l_ac].xmdl081 = g_xmdk2_d_o.xmdl081
                  NEXT FIELD xmdl081_d2_02
               END IF
               
               LET g_qty = 0
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl018) THEN
                  LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl018
               END IF
           
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                  LET g_qty = g_qty + g_xmdk2_d[l_ac].xmdl081
               END IF
               
               #可簽收簽退數量
               CALL axmp580_01_default_quantity(g_xmdk2_d[l_ac].xmdl001,g_xmdk2_d[l_ac].xmdl002,g_xmdk2_d[l_ac].xmdl017)
               RETURNING l_num
           
               #簽收數量檢查
               IF g_qty > l_num THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'axm-00225'    #簽收簽退量不可大於可轉簽收簽退量("出貨量" - "已簽收量" - "已簽退量")
                  LET g_errparam.extend = g_qty
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  
                  LET g_xmdk2_d[l_ac].xmdl018 = g_xmdk2_d_o.xmdl018
                  LET g_xmdk2_d[l_ac].xmdl081 = g_xmdk2_d_o.xmdl081
                  
                  NEXT FIELD xmdl081_d2_02
               END IF
               
               #推算參考數量
               IF NOT cl_null(g_xmdk2_d[l_ac].xmdl008) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl017) AND
                  NOT cl_null(g_xmdk2_d[l_ac].xmdl019) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl081) THEN
                        
                  CALL s_aooi250_convert_qty(g_xmdk2_d[l_ac].xmdl008,g_xmdk2_d[l_ac].xmdl017,g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl081)
                  RETURNING l_success,g_xmdk2_d[l_ac].xmdl082
               ELSE
                  LET g_xmdk2_d[l_ac].xmdl082 = ''
               END IF    
            END IF
            #===簽退理由碼
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl084) THEN
               IF NOT axmp580_01_reason_chk(g_xmdk2_d[l_ac].xmdl084,'axmt590') THEN
                  LET g_xmdk2_d[l_ac].xmdl084 = g_xmdk2_d_o.xmdl084
                  CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl084,'axmt590') RETURNING g_xmdk2_d[l_ac].xmdl084_desc
                  NEXT FIELD xmdl084_d2_02
               END IF
            END IF
      
            #===簽收參考數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl020) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl019) THEN
               #參考數量取位
               CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl020) RETURNING l_success,g_xmdk2_d[l_ac].xmdl020
            END IF
      
            #===簽退參考數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl082) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl019) THEN
               #參考數量取位
               CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl019,g_xmdk2_d[l_ac].xmdl082) RETURNING l_success,g_xmdk2_d[l_ac].xmdl082
            END IF
      
            #===簽收計價數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl022) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl021) THEN
               #參考數量取位
               CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl021,g_xmdk2_d[l_ac].xmdl022) RETURNING l_success,g_xmdk2_d[l_ac].xmdl022
            END IF
      
            #===簽退計價數量
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl083) AND NOT cl_null(g_xmdk2_d[l_ac].xmdl021) THEN
               #參考數量取位
               CALL s_aooi250_take_decimals(g_xmdk2_d[l_ac].xmdl021,g_xmdk2_d[l_ac].xmdl083) RETURNING l_success,g_xmdk2_d[l_ac].xmdl083
            END IF
      
            #===理由碼
            IF NOT cl_null(g_xmdk2_d[l_ac].xmdl050) THEN
               IF NOT axmp580_01_reason_chk(g_xmdk2_d[l_ac].xmdl050,'axmt580') THEN
                  LET g_xmdk2_d[l_ac].xmdl050 = g_xmdk2_d_o.xmdl050
                  CALL axmp580_01_reason_ref(g_xmdk2_d[l_ac].xmdl050,'axmt580') RETURNING g_xmdk2_d[l_ac].xmdl050_desc
                  NEXT FIELD xmdl050_d2_02
               END IF
            END IF
            IF NOT axmp580_02_update_xmdl() THEN
               RETURN
            END IF
            
            EXIT DIALOG             
         ON ACTION cancel 
            LET g_xmdk2_d[l_ac].*  = g_xmdk2_d_o.* 
            EXIT DIALOG
      END INPUT
   END DIALOG
   
   
   
END FUNCTION
################################################################################
# Descriptions...: 帶出多庫儲批
# Memo...........:
# Usage..........: CALL axmp580_02_gen_xmdm(p_xmdl001,p_xmdl002,p_keyno,p_xmdlseq,p_xmdl018,p_xmdl081)
#                  RETURNING r_only,r_xmdm005,r_xmdm006,r_xmdm007,r_xmdm033
# Input parameter: p_xmdl001     (出貨單號)
#                : p_xmdl002     (出貨單項次)
#                : p_keyno       (序號)
#                : p_xmdlseq     (單身項次)
#                : p_xmdl018     (簽收數量)
#                : p_xmdl081     (簽退數量)
# Return code....: r_success     (執行結果)
#                : r_only        (符合的多庫儲批是否只有一筆)TRUE/FALSE
#                : r_xmdm005     (庫位)若只有一筆多庫儲批時回傳才有值
#                : r_xmdm006     (儲位)若只有一筆多庫儲批時回傳才有值
#                : r_xmdm007     (批號)若只有一筆多庫儲批時回傳才有值
#                : r_xmdm033     (庫存管理特徵)若只有一筆多庫儲批時回傳才有值
# Date & Author..: #170208-00025#1 By 02040
# Modify.........:
################################################################################
PUBLIC FUNCTION axmp580_02_gen_xmdm(p_xmdl001,p_xmdl002,p_keyno,p_xmdlseq,p_xmdl018,p_xmdl081)
   DEFINE p_xmdl001    LIKE xmdl_t.xmdl001
   DEFINE p_xmdl002    LIKE xmdl_t.xmdl002
   DEFINE p_keyno      LIKE type_t.num5
   DEFINE p_xmdlseq    LIKE xmdl_t.xmdlseq
   DEFINE p_xmdl018    LIKE xmdl_t.xmdl018
   DEFINE p_xmdl081    LIKE xmdl_t.xmdl081
   DEFINE r_success    LIKE type_t.num5
   DEFINE r_only       LIKE type_t.num5
   DEFINE r_xmdm005    LIKE xmdm_t.xmdm005
   DEFINE r_xmdm006    LIKE xmdm_t.xmdm006
   DEFINE r_xmdm007    LIKE xmdm_t.xmdm007
   DEFINE r_xmdm033    LIKE xmdm_t.xmdm033

   DEFINE l_sql        STRING
   DEFINE l_xmdm     RECORD
      xmdmsite         LIKE xmdm_t.xmdmsite,
      xmdm001          LIKE xmdm_t.xmdm001,
      xmdm002          LIKE xmdm_t.xmdm002,
      xmdm003          LIKE xmdm_t.xmdm003,
      xmdm004          LIKE xmdm_t.xmdm004,
      xmdm005          LIKE xmdm_t.xmdm005,
      xmdm006          LIKE xmdm_t.xmdm006,
      xmdm007          LIKE xmdm_t.xmdm007,
      xmdm008          LIKE xmdm_t.xmdm008,   #簽收單位
      xmdm009          LIKE xmdm_t.xmdm009,   #簽收數量
      xmdm010          LIKE xmdm_t.xmdm010,   #參考單位
      xmdm011          LIKE xmdm_t.xmdm011,   #簽收參考數量
      xmdm012          LIKE xmdm_t.xmdm012,   #已簽收數量
      xmdm013          LIKE xmdm_t.xmdm013,   #已簽退數量
      xmdm031          LIKE xmdm_t.xmdm031,   #簽退數量
      xmdm032          LIKE xmdm_t.xmdm032,   #簽退參考數量
      xmdm033          LIKE xmdm_t.xmdm033
                     END RECORD

   DEFINE l_xmdk039    LIKE xmdk_t.xmdk039   #在途成本庫位
   DEFINE l_xmdk040    LIKE xmdk_t.xmdk040   #在途非成本庫位
   DEFINE l_xmdmseq1   LIKE xmdm_t.xmdmseq1  #項序
   DEFINE l_xmdm009    LIKE xmdm_t.xmdm009   #簽收數量
   DEFINE l_xmdm031    LIKE xmdm_t.xmdm031   #簽退數量
   DEFINE l_type       LIKE type_t.chr1
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_num        LIKE xmdm_t.xmdm009

   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET r_only = FALSE
   LET r_xmdm005 = ''
   LET r_xmdm006 = ''
   LET r_xmdm007 = ''
   LET r_xmdm033 = ''

   LET l_sql = "SELECT xmdk039,xmdk040,",
               "       xmdmsite,xmdmseq1,",
               "       xmdm001,xmdm002,xmdm003,xmdm004,xmdm005,",
               #"       xmdm006,xmdm007,xmdm008,nvl(xmdm009,0),xmdm010,",  #170503-00034#1-mark
               "       ' ',xmdm007,xmdm008,nvl(xmdm009,0),xmdm010,",       #170503-00034#1-add
               "       nvl(xmdm012,0),nvl(xmdm013,0), ",
               "       xmdm033",
               "  FROM xmdk_t,xmdm_t",
               " WHERE xmdkent = xmdment AND xmdment = ",g_enterprise,
               "   AND xmdkdocno = xmdmdocno AND xmdmdocno = '",p_xmdl001,"'",
               "   AND xmdmseq = '",p_xmdl002,"'",
               "   AND (nvl(xmdm009,0) - (nvl(xmdm012,0) + nvl(xmdm013,0))) > 0 ",
               " ORDER BY xmdmseq1"
   PREPARE axmp580_02_gen_pre FROM l_sql
   DECLARE axmp580_02_gen_cs CURSOR  FOR axmp580_02_gen_pre

   LET l_xmdk039 = ''
   LET l_xmdk040 = ''
   INITIALIZE l_xmdm.* TO NULL

   FOREACH axmp580_02_gen_cs INTO l_xmdk039,l_xmdk040,
                                  l_xmdm.xmdmsite,l_xmdmseq1,
                                  l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm003,l_xmdm.xmdm004,l_xmdm.xmdm005,
                                  l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm008,l_xmdm.xmdm009,l_xmdm.xmdm010,
                                  l_xmdm.xmdm012,l_xmdm.xmdm013,
                                  l_xmdm.xmdm033
        IF SQLCA.sqlcode THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.sqlcode
           LET g_errparam.extend = 'FETCH：axmp580_02_gen_cs'
           LET g_errparam.popup = TRUE
           CALL cl_err()
           LET r_success = FALSE
           RETURN r_success,r_only,r_xmdm005,r_xmdm006,r_xmdm007,r_xmdm033
        END IF

        #檢查是否為成本庫
        CALL s_axmt540_inag012_chk(l_xmdm.xmdmsite,l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm033,l_xmdm.xmdm005,l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm008)
          RETURNING l_type

        IF l_type = 'Y' THEN   #在途成本庫位
           LET l_xmdm.xmdm005 = l_xmdk039
        ELSE                   #在途非成本庫位
           LET l_xmdm.xmdm005 = l_xmdk040
        END IF
        #簽收量：出貨數量-已簽收量+已簽退量
        IF l_xmdm.xmdm009 - (l_xmdm.xmdm012 + l_xmdm.xmdm013) > p_xmdl018 THEN
           LET l_xmdm009 = p_xmdl018
        ELSE
           LET l_xmdm009 = l_xmdm.xmdm009 - (l_xmdm.xmdm012 + l_xmdm.xmdm013)
        END IF
        #推算簽收參考數量
        IF NOT cl_null(l_xmdm.xmdm001) AND NOT cl_null(l_xmdm.xmdm008) AND
           NOT cl_null(l_xmdm.xmdm010) AND NOT cl_null(l_xmdm009) THEN

           CALL s_aooi250_convert_qty(l_xmdm.xmdm001,l_xmdm.xmdm008,l_xmdm.xmdm010,l_xmdm009)
            RETURNING l_success,l_xmdm.xmdm011
        ELSE
           LET l_xmdm.xmdm011 = ''
        END IF


        #簽退數量
        IF l_xmdm.xmdm009 - (l_xmdm.xmdm012 + l_xmdm.xmdm013) - l_xmdm009 > p_xmdl081 THEN
           LET l_xmdm031 = p_xmdl081
        ELSE
           LET l_xmdm031 = l_xmdm.xmdm009 - (l_xmdm.xmdm012 + l_xmdm.xmdm013) - l_xmdm009
        END IF
        #推算簽退參考數量
        IF NOT cl_null(l_xmdm.xmdm001) AND NOT cl_null(l_xmdm.xmdm008) AND
           NOT cl_null(l_xmdm.xmdm010) AND NOT cl_null(l_xmdm031) THEN

           CALL s_aooi250_convert_qty(l_xmdm.xmdm001,l_xmdm.xmdm008,l_xmdm.xmdm010,l_xmdm031)
            RETURNING l_success,l_xmdm.xmdm032
        ELSE
           LET l_xmdm.xmdm032 = ''
        END IF

        LET p_xmdl018 = p_xmdl018 - l_xmdm009
        LET p_xmdl081 = p_xmdl081 - l_xmdm031

        INSERT INTO axmp580_tmp03 (keyno,xmdmseq,xmdmseq1,
                                   xmdm001,xmdm002,xmdm003,xmdm004,xmdm005,
                                   xmdm006,xmdm007,xmdm033,
                                   xmdm008,xmdm009,xmdm010,xmdm011,xmdm012,xmdm013,
                                   xmdm031,xmdm032)
          VALUES (p_keyno,p_xmdlseq,l_xmdmseq1,
                  l_xmdm.xmdm001,l_xmdm.xmdm002,l_xmdm.xmdm003,l_xmdm.xmdm004,l_xmdm.xmdm005,
                  l_xmdm.xmdm006,l_xmdm.xmdm007,l_xmdm.xmdm033,
                  l_xmdm.xmdm008,l_xmdm009,l_xmdm.xmdm010,l_xmdm.xmdm011,l_xmdm.xmdm012,l_xmdm.xmdm013,
                  l_xmdm031,l_xmdm.xmdm032)

        IF SQLCA.sqlcode THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = SQLCA.sqlcode
           LET g_errparam.extend = 'FOREACH'
           LET g_errparam.popup = TRUE
           CALL cl_err()
           LET r_success = FALSE
           EXIT FOREACH
        END IF

   END FOREACH

   #僅有一個項序符合，代表已無多庫儲批
   IF l_xmdmseq1 = 1 THEN
      LET r_only = TRUE
      LET r_xmdm005 = l_xmdm.xmdm005      #庫位
      LET r_xmdm006 = l_xmdm.xmdm006      #儲位       
      LET r_xmdm007 = l_xmdm.xmdm007      #批號
      LET r_xmdm033 = l_xmdm.xmdm033      #庫存管理特徵
   END IF

   RETURN r_success,r_only,r_xmdm005,r_xmdm006,r_xmdm007,r_xmdm033
   
END FUNCTION

 
{</section>}
 
