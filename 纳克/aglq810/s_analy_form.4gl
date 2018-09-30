#該程式未解開Section, 採用最新樣板產出!
{<section id="s_analy_form.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0023(1900-01-01 00:00:00), PR版次:0023(2017-10-25 14:02:12)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000276
#+ Filename...: s_analy_form
#+ Description: 解析公式獲取金額
#+ Creator....: 02114(2014-05-12 13:56:42)
#+ Modifier...: 00000 -SD/PR- 10043
 
{</section>}
 
{<section id="s_analy_form.global" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150812-00010#3   15/08/28  By 03538   當設定公式為變量*數值的時候,增加辨認數值邏輯
#151013-00016#4   15/12/02  By Hans    新增合併報表公式
#160506-00012#1   16/05/10  By 02599   当表内项目没有设置公式时，赋值0
#160526-00035#1   16/05/27  By 02599   設定金額來源為：期初余額借貸(2,3)/期未餘額借貸(8,9)者，修改公式計算, 先依核算項GROUP SUM,依期余額判斷借貸余, 再作二次合計
#161128-00061#7   16/12/09  by 02481   标准程式定义采用宣告模式,弃用.*写法
#161215-00022#1   16/12/16  By 02114   抓取glfb005的公式时,要去掉前后空格
#170104-00043#1   17/01/06  By 01531   所有的据点一起查看，有部分据点的值都为0，单看该据点，则数据正常
#170304-00002#1   17/03/07  By 02114   解析变量公式有误
#170222-00003#1   17/03/10  By 01531   要排除年結和月結的數字
#170327-00047#1   17/03/29  By 02599   s_analy_from在抓取agli201变量时，按照项次排序
#170331-00072#1   170405    By albireo 排除CE傳票時要同時排除XC傳票
#170406-00082#1   170410    By albireo 排除CE+XC傳票時,應限制9類(xcea002=9)
#170418-00002#1   17/04/18  By Sabrina 當程式為aglq938時需將結轉金額扣除
#170419-00037#1   17/04/21  By 02114   抓总账变量笔数时,可能会抓到2笔,导致后续解析公式有误
#170510-00043#2   17/05/15  By 02599   程式优化
#170602-00004#1   17/06/02  By albireo #170419-00037#1 調整有誤,造成只有一筆的變量無法分辨為表內公式還是變量
#170623-00034#6   17/07/10  By Sabrina (1)調整aglq938操作畫面。比照aglp700增加年度、期別判斷
#                                      (2)取期末資料須為當期
#                                      (3)aglq938查詢時，若設定agli201設定[取述方式(glfc008)]="1:期初余额"，則直接取去年年末資料
#                                      (4)增加處理agli070時，錯誤訊息提示
#170816-00007#159 17/10/25 By 10043    調整公用元件錯誤訊息,顯示更明確的資訊內容
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_analy_form.free_style_variable" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
DEFINE tok base.StringTokenizer
DEFINE tok1 base.StringTokenizer
DEFINE tok3 base.StringTokenizer
DEFINE tok4 base.StringTokenizer
DEFINE tok5 base.StringTokenizer
DEFINE tok6 base.StringTokenizer
DEFINE g_str  STRING
DEFINE g_glfa002    LIKE glfa_t.glfa002
DEFINE g_bdate      LIKE type_t.dat     #170510-00043#2 add
DEFINE g_edate      LIKE type_t.dat     #170510-00043#2 add
DEFINE g_glaa003    LIKE glaa_t.glaa003 #170510-00043#2 add
#170623-00034#6---add--start
DEFINE g_fun_argv   RECORD
          glfa001       STRING,         #報表模板
          glfbl004      STRING,         #項目
          glfb003       STRING          #報表行序
                    END RECORD
#170623-00034#6---add--end
#end add-point
 
{</section>}
 
{<section id="s_analy_form.global_variable" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
#170816-00007#159 add by 10043 ---- (s)
DEFINE g_colname_1   STRING
DEFINE g_comment_1   STRING 
DEFINE g_msg         STRING   #錯誤訊息
#170816-00007#159 add by 10043 ---- (e)   
#end add-point
 
{</section>}
 
{<section id="s_analy_form.other_dialog" >}

 
{</section>}
 
{<section id="s_analy_form.other_function" readonly="Y" >}
################################################################################
# Descriptions...: 解析公式或者解析座標
# Memo...........:
# Usage..........: CALL s_analy_form(p_ld,p_year,p_bmonth,p_emonth,p_glfa009,p_glfa008,p_glfa001,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfa009   小數位數
#                : p_glfa008   金額單位
#                : p_glfa001   報表模板編號
#                : p_glfb004   取數公式來源  1.表內項目(傳座標) 2.總帳變量(傳公式)
#                : p_str       公式、座標
#                : p_wc        筛选条件#2015/1/23 mod
#                : p_show_ad   含審計調整傳票否 #150827-00036#1 add
#                : p_stus      傳票狀態 #150827-00036#1 add 
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........: 02481
#                : by 02559 mod 将p_comp改成p_wc用于传入条件
#                : by 02599 1.增加是否含審計調整傳票和傳票狀態兩個抓取條件；
#                ：         2.公式變量agli201的抓取增加‘數據來源’選項
################################################################################
PUBLIC FUNCTION s_analy_form(p_ld,p_year,p_bmonth,p_emonth,p_glfa009,p_glfa008,p_glfa001,p_glfb004,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
 # DEFINE p_ld            LIKE glaa_t.glaald
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE p_glfb004       LIKE glfb_t.glfb004
   DEFINE p_str           STRING
   DEFINE p_wc            STRING    #查询条件
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_success       LIKE type_t.num5  
   DEFINE l_left          LIKE type_t.chr1
   DEFINE l_right         LIKE type_t.chr1
   #150827-00036#1--add--str--
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   #150827-00036#1--add--end
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_amount = 0
   #170816-00007#159 mark by 10043 --(s)
   #IF cl_null(p_ld) AND cl_null(p_year) AND cl_null(p_bmonth) AND cl_null(p_emonth) AND cl_null(p_glfa001) AND cl_null(p_glfb004) AND cl_null(p_str) THEN 
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-268'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()  
#      CALL cl_errmsg('','','','sub-268',1)
   #   LET r_success = FALSE
   #   RETURN r_success,r_amount
   #END IF
   #170816-00007#159 mark by 10043 --(e)  
   #170816-00007#159 add by 10043 --(s)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_ld) THEN
      LET g_colname_1 = cl_getmsg("axc-00585",g_dlang)  #帳別
      LET g_msg = g_colname_1   
   END IF      
   IF cl_null(p_year) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("agl-00274",g_dlang)  #年
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_bmonth) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-00794",g_dlang)  #起始期別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_emonth) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-00795",g_dlang)  #截止期別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_glfa001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("abgq050","lbl_glfa001") RETURNING g_colname_1,g_comment_1  #報表模版編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_glfb004) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("abgi070_01","lbl_glfb004") RETURNING g_colname_1,g_comment_1  #公式來源
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF    
   IF cl_null(p_str) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("lib-00362",g_dlang)   #公式
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF     
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF   
   #170816-00007#159 add by 10043 --(e) 
   #去掉公式左右兩邊的空格
   LET p_str = p_str.trim()
   LET g_str = p_str
   
   #报表模板类型
   SELECT glfa002 INTO g_glfa002 FROM glfa_t
   WHERE glfaent=g_enterprise AND glfa001=p_glfa001
   
   IF p_glfb004 = '1' THEN  #表內項目
      CALL s_analy_form_get_coordinate(p_glfa001,p_str)
      RETURNING l_success,p_str  
 
      CALL s_analy_form_formula(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus' #170222-00003#1 add ,p_show_ce,p_show_ye
      RETURNING l_success,r_amount  
   ELSE   #總帳變量
      CALL s_analy_form_formula(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus' #170222-00003#1 add ,p_show_ce,p_show_ye
      RETURNING l_success,r_amount  
   END IF
   
   IF l_success = FALSE THEN
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: SQL语句定义
# Memo...........: #170510-00043#2 add
# Usage..........: CALL s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce)
# Input parameter: p_ld           账套组成的字符串
#                : p_year         年度
#                : p_bmonth       起始期别
#                : p_emonth       截止期别
#                : p_show_ce      是否显示CE凭证
# Return code....: 
# Date & Author..: 2017/05/15 By 02599
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce)
   DEFINE p_ld            STRING                               
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE l_sql           STRING

   IF p_show_ce = 'N' THEN 
      #抓取起始期别的起始日期，截止期别的截止日期
      LET l_sql ="  SELECT DISTINCT glaa003  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
                 "  AND glaald IN ('",p_ld,"') "
      PREPARE glaa003_pre FROM l_sql
      EXECUTE glaa003_pre INTO g_glaa003
      
      SELECT MIN(glav004),MAX(glav004) INTO g_bdate,g_edate
        FROM glav_t
       WHERE glavent=g_enterprise AND glav001=g_glaa003
         AND glav002=p_year 
         AND glav006 BETWEEN p_bmonth AND p_emonth
   END IF   
   
   #定义抓取借贷别SQL语句
   LET l_sql ="SELECT glac008 FROM glac_t",
              " WHERE glacent = ",g_enterprise,
              "   AND glac001 = (SELECT DISTINCT glaa004  FROM glaa_t ",
              "                   WHERE glaaent = ",g_enterprise,
              "                     AND glaald IN ('",p_ld,"') )",
              "   AND glac002 = ? "
   PREPARE glac008_pre FROM l_sql
   
   #定义抓取agli201变量相关资料
   LET l_sql = "SELECT glfc001,glfcseq,glfc002,glfc003,glfc004,glfc005,glfc006,glfc007,glfc008,",
               "       glfc009,glfc010,glfc011,glfc012,glfc013 ",
               "  FROM glfc_t ",
               " WHERE glfcent = '",g_enterprise,"'",
               "   AND glfc001 = ? ",
               " ORDER BY glfcseq "  
   PREPARE glfc_pre FROM l_sql
   DECLARE glfc_cur CURSOR FOR glfc_pre  
   
END FUNCTION

################################################################################
# Descriptions...: 抓取總賬變量設置作業agli201設置的公式
# Memo...........:
# Usage..........: s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_wcp_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_wc        筛选条件#2015/1/23 mod
#                : p_show_ad   含審計調整傳票否 #150827-00036#1 add
#                : p_stus      傳票狀態 #150827-00036#1 add 
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........: by 02559 mod 将p_comp改成p_wc用于传入条件
#                : by 02599 1.增加是否含審計調整傳票和傳票狀態兩個抓取條件；
#                ：         2.公式變量agli201的抓取增加‘數據來源’選項
#                : by Hans  1.數據來源增加 合併財報合併後統計檔   
################################################################################
PUBLIC FUNCTION s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
 # DEFINE p_ld            LIKE glaa_t.glaald
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add   
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfc001       STRING
   DEFINE p_wc            STRING    #筛选条件
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_sql           STRING
   #161128-00061#7----add----begin-------------------
   #DEFINE l_glfc          RECORD  LIKE glfc_t.*  
   DEFINE l_glfc RECORD  #公式設定檔
       glfcent LIKE glfc_t.glfcent, #企業編號
       glfcownid LIKE glfc_t.glfcownid, #資料所有者
       glfcowndp LIKE glfc_t.glfcowndp, #資料所屬部門
       glfccrtid LIKE glfc_t.glfccrtid, #資料建立者
       glfccrtdp LIKE glfc_t.glfccrtdp, #資料建立部門
       glfccrtdt LIKE glfc_t.glfccrtdt, #資料創建日
       glfcmodid LIKE glfc_t.glfcmodid, #資料修改者
       glfcmoddt LIKE glfc_t.glfcmoddt, #最近修改日
       glfc001 LIKE glfc_t.glfc001, #公式編號
       glfcseq LIKE glfc_t.glfcseq, #項次
       glfc002 LIKE glfc_t.glfc002, #科目參照表
       glfc003 LIKE glfc_t.glfc003, #起始科目
       glfc004 LIKE glfc_t.glfc004, #截止科目
       glfc005 LIKE glfc_t.glfc005, #選用核算項
       glfc006 LIKE glfc_t.glfc006, #起始核算項值
       glfc007 LIKE glfc_t.glfc007, #截止核算項值
       glfc008 LIKE glfc_t.glfc008, #取值方式
       glfc009 LIKE glfc_t.glfc009, #運算方式
       glfc010 LIKE glfc_t.glfc010, #額外條件
       glfc011 LIKE glfc_t.glfc011, #左括號
       glfc012 LIKE glfc_t.glfc012, #右括號
       glfcud001 LIKE glfc_t.glfcud001, #自定義欄位(文字)001
       glfcud002 LIKE glfc_t.glfcud002, #自定義欄位(文字)002
       glfcud003 LIKE glfc_t.glfcud003, #自定義欄位(文字)003
       glfcud004 LIKE glfc_t.glfcud004, #自定義欄位(文字)004
       glfcud005 LIKE glfc_t.glfcud005, #自定義欄位(文字)005
       glfcud006 LIKE glfc_t.glfcud006, #自定義欄位(文字)006
       glfcud007 LIKE glfc_t.glfcud007, #自定義欄位(文字)007
       glfcud008 LIKE glfc_t.glfcud008, #自定義欄位(文字)008
       glfcud009 LIKE glfc_t.glfcud009, #自定義欄位(文字)009
       glfcud010 LIKE glfc_t.glfcud010, #自定義欄位(文字)010
       glfcud011 LIKE glfc_t.glfcud011, #自定義欄位(數字)011
       glfcud012 LIKE glfc_t.glfcud012, #自定義欄位(數字)012
       glfcud013 LIKE glfc_t.glfcud013, #自定義欄位(數字)013
       glfcud014 LIKE glfc_t.glfcud014, #自定義欄位(數字)014
       glfcud015 LIKE glfc_t.glfcud015, #自定義欄位(數字)015
       glfcud016 LIKE glfc_t.glfcud016, #自定義欄位(數字)016
       glfcud017 LIKE glfc_t.glfcud017, #自定義欄位(數字)017
       glfcud018 LIKE glfc_t.glfcud018, #自定義欄位(數字)018
       glfcud019 LIKE glfc_t.glfcud019, #自定義欄位(數字)019
       glfcud020 LIKE glfc_t.glfcud020, #自定義欄位(數字)020
       glfcud021 LIKE glfc_t.glfcud021, #自定義欄位(日期時間)021
       glfcud022 LIKE glfc_t.glfcud022, #自定義欄位(日期時間)022
       glfcud023 LIKE glfc_t.glfcud023, #自定義欄位(日期時間)023
       glfcud024 LIKE glfc_t.glfcud024, #自定義欄位(日期時間)024
       glfcud025 LIKE glfc_t.glfcud025, #自定義欄位(日期時間)025
       glfcud026 LIKE glfc_t.glfcud026, #自定義欄位(日期時間)026
       glfcud027 LIKE glfc_t.glfcud027, #自定義欄位(日期時間)027
       glfcud028 LIKE glfc_t.glfcud028, #自定義欄位(日期時間)028
       glfcud029 LIKE glfc_t.glfcud029, #自定義欄位(日期時間)029
       glfcud030 LIKE glfc_t.glfcud030, #自定義欄位(日期時間)030
       glfc013 LIKE glfc_t.glfc013      #數據來源
       END RECORD
   #161128-00061#7----add----end-------------------   
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_str           STRING
   DEFINE l_glfc009       LIKE type_t.chr10
   DEFINE l_success       LIKE type_t.num5
   #150827-00036#1--add--str--
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   #150827-00036#1--add--end
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---   
   DEFINE l_glfc001       LIKE glfc_t.glfc001 #170510-00043#2 add
   
   LET r_success = TRUE
   LET l_str = ''
   LET r_amount = 0
   
   LET p_glfc001 = p_glfc001.trim() 
   #抓取變量設置(agli201)
   
   #161128-00061#7----add----begin-------------------
   #LET l_sql = "SELECT * FROM glfc_t ",
#170510-00043#2--mark--str--
#   LET l_sql = "SELECT glfcent,glfcownid,glfcowndp,glfccrtid,glfccrtdp,glfccrtdt,glfcmodid,glfcmoddt,",
#               "glfc001,glfcseq,glfc002,glfc003,glfc004,glfc005,glfc006,glfc007,glfc008,glfc009,glfc010,",
#               "glfc011,glfc012,glfcud001,glfcud002,glfcud003,glfcud004,glfcud005,glfcud006,glfcud007,",
#               "glfcud008,glfcud009,glfcud010,glfcud011,glfcud012,glfcud013,glfcud014,glfcud015,glfcud016,",
#               "glfcud017,glfcud018,glfcud019,glfcud020,glfcud021,glfcud022,glfcud023,glfcud024,glfcud025,",
#               "glfcud026,glfcud027,glfcud028,glfcud029,glfcud030,glfc013 FROM glfc_t ",
#   #161128-00061#7----add----end-------------------
#               " WHERE glfcent = '",g_enterprise,"'",
#               "   AND glfc001 = '",p_glfc001,"'"
#              ," ORDER BY glfcseq "   #170327-00047#1 add
#   PREPARE glfc_pre FROM l_sql
#   DECLARE glfc_cur CURSOR FOR glfc_pre  
#170510-00043#2--mark--end

   #170510-00043#2--mod--str--
#   FOREACH glfc_cur INTO l_glfc.*
   LET l_glfc001= p_glfc001
   FOREACH glfc_cur USING l_glfc001 
                    INTO l_glfc.glfc001,l_glfc.glfcseq,l_glfc.glfc002,l_glfc.glfc003,l_glfc.glfc004,
                         l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,l_glfc.glfc009,
                         l_glfc.glfc010,l_glfc.glfc011,l_glfc.glfc012,l_glfc.glfc013
   #170510-00043#2--mod--end
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
#         CALL cl_errmsg('','FOREACH:','',SQLCA.sqlcode,1)

         EXIT FOREACH
      END IF
      
      #左括號
      IF l_glfc.glfc011 = 'Y' THEN 
         IF cl_null(l_str) THEN 
            LET l_str = "(" CLIPPED
         ELSE
            LET l_str = l_str CLIPPED ," ( " CLIPPED
         END IF
      END IF
      
      #計算金額
      LET l_amt = 0
      #151013-00016#4 ---s---
#      IF l_glfc.glfc013='1' THEN #150827-00036#1 add
#         #數據來源：總帳憑證統計檔glar_t
#         CALL s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
#                                   l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                   l_glfc.glfc010,p_wc,p_show_ad,p_stus) #150827-00036#1 add 'p_show_ad,p_stus'
#         RETURNING l_success,l_amt   
#      #150827-00036#1--add--str--
#      ELSE
#         #數據來源：分錄底稿統計檔glat_t
#         CALL s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
#                                    l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
#                                    l_glfc.glfc010,p_wc) 
#         RETURNING l_success,l_amt
#      END IF
      #150827-00036#1--add--end
      CASE l_glfc.glfc013 
         WHEN '1'
            #數據來源：總帳憑證統計檔glar_t
            CALL s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
                                      l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                      l_glfc.glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus'  #170222-00003#1 add ,p_show_ce,p_show_ye
            RETURNING l_success,l_amt   
         WHEN '2'
            CALL s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
                                       l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,       
                                       l_glfc.glfc010,p_wc) 
            RETURNING l_success,l_amt
         WHEN '3'
            CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,l_glfc.glfc001,l_glfc.glfc002,l_glfc.glfc003,
                                       l_glfc.glfc004,l_glfc.glfc005,l_glfc.glfc006,l_glfc.glfc007,l_glfc.glfc008,
                                       l_glfc.glfc010,p_wc,p_stus)
            RETURNING l_success,l_amt         
         
      END CASE
      
      IF l_success = FALSE THEN
         LET r_success = FALSE
         RETURN r_success,r_amount
      END IF

      LET l_str = l_str CLIPPED,l_amt CLIPPED

      #右括號
      IF l_glfc.glfc012 = 'Y' THEN 
         LET l_str = l_str CLIPPED ," ) " CLIPPED
      END IF
      
      #運算符
      CASE l_glfc.glfc009
         WHEN 1   LET l_glfc009 = ' + '
         WHEN 2   LET l_glfc009 = ' - '
         WHEN 3   LET l_glfc009 = ' * '
         WHEN 4   LET l_glfc009 = ' / '
           
      END CASE
      
      IF NOT cl_null(l_glfc.glfc009) THEN 
         LET l_str = l_str CLIPPED,l_glfc009 CLIPPED
      END IF
   
   END FOREACH 
   
   IF cl_null(l_str) THEN 
      RETURN r_success,r_amount
   END IF
   
   LET l_sql = "SELECT ",l_str CLIPPED," FROM DUAL"
   PREPARE l_sql_pre1 FROM l_sql
   EXECUTE l_sql_pre1 INTO r_amount
   
   #除數不可為0
   IF SQLCA.sqlerrd[2] = -1476 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00237'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,l_str,'','agl-00237',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = l_str
      #170623-00034#6---add--start
      IF NOT cl_null(g_fun_argv.glfbl004) THEN
         LET g_errparam.extend = s_get_field_name('agli070','glfbl004'),":",g_fun_argv.glfbl004,
                                 " & ",
                                 s_get_field_name('agli070','glfb003'), ":",g_fun_argv.glfb003,
                                 " >> ",
                                 l_str
      END IF
      #170623-00034#6---add--end
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,l_str,'','sub-00559',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 通過座標獲取公式
# Memo...........:
# Usage..........: CALL s_analy_form_get_glfb005(p_glfa001,p_coordinate)
#                  RETURNING r_glfb005
# Input parameter: p_glfa001      報表模板編號
#                : p_coordinate   座標
# Return code....: r_glfb005      公式
# Date & Author..: 2014/05/12 By lujh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_formula(p_glfa001,p_glfb005)
   DEFINE p_glfa001          LIKE glfa_t.glfa001
   DEFINE p_coordinate       STRING
   DEFINE l_glfbseq          LIKE type_t.chr1000  #行次
   DEFINE l_glfbseq1         LIKE type_t.chr1000  #列次
   DEFINE r_glfb004          LIKE glfb_t.glfb004
   #DEFINE r_glfb005          LIKE glfb_t.glfb005 #161215-00022#1 mark lujh
   #161215-00022#1--add--str--lujh
   DEFINE l_glfb005          LIKE glfb_t.glfb005
   DEFINE r_glfb005          STRING
   #161215-00022#1--add--end--lujh
   DEFINE l_n                LIKE type_t.num5
   DEFINE p_glfb005          LIKE glfb_t.glfb005
   DEFINE l_sql              STRING
   
   LET p_coordinate = p_glfb005   
    
   LET p_coordinate = p_coordinate.trim() 
   #將座標解析成行、列
   LET l_glfbseq  = p_coordinate.substring(2,p_coordinate.getLength())  #行次
   LET l_glfbseq1 = p_coordinate.substring(1,1)  #列次   
   
   LET r_glfb004 = ''
   LET r_glfb005 = ''
   
   #先根据坐标抓取數公式來源和公式
   SELECT glfb004,glfb005 INTO r_glfb004,l_glfb005   #161215-00022#1 change r_glfb005 to l_glfb005
     FROM glfb_t
    WHERE glfbent = g_enterprise
      AND glfb001 = p_glfa001
      AND glfbseq = l_glfbseq
      AND glfbseq1 = l_glfbseq1
   

   #如果抓不到,可能是传过来的公式是“总账变量”,不需要再往下解析  或者就没有设置公式
   IF cl_null(r_glfb004) THEN 
      LET l_sql = "SELECT COUNT(DISTINCT glfb004) ",
                  "  FROM glfb_t ",
                  " WHERE glfbent = '",g_enterprise,"'",
                  "   AND glfb005 LIKE '%",p_glfb005,"%'"
      PREPARE s_analy_form_glfb004 FROM l_sql
      EXECUTE s_analy_form_glfb004 INTO l_n

      #IF l_n = 1 THEN   #170419-00037#1 mark lujh
      #IF l_n > 1 THEN    #170419-00037#1 add lujh   #170602-00004#1 mark
      IF l_n >= 1 THEN    #170602-00004#1
         SELECT DISTINCT glfb004 INTO r_glfb004
           FROM glfb_t
          WHERE glfbent = g_enterprise
            AND glfb005 = p_glfb005
         LET l_glfb005 = p_glfb005      #170304-00002#1 change r_glfb005 to l_glfb005           
      END IF
   END IF
      
   #161215-00022#1--add--str--lujh   
   LET r_glfb005 = l_glfb005
   LET r_glfb005 = r_glfb005.trim()
   #161215-00022#1--add--end--lujh
     
   RETURN r_glfb004,r_glfb005
END FUNCTION

################################################################################
# Descriptions...: 解析公式
# Memo...........:
# Usage..........: CALL s_analy_form(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfa001   報表模板編號
#                : p_glfa009   小數位數
#                : p_glfa008   金額單位
#                : p_str       公式
#                : p_wc        筛选条件#2015/1/23 mod
#                : p_show_ad   含審計調整傳票否 #150827-00036#1 add
#                : p_stus      傳票狀態 #150827-00036#1 add 
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........: by 02559 mod 将p_comp改成p_wc用于传入条件
#                : by 02599 1.增加是否含審計調整傳票和傳票狀態兩個抓取條件；
#                ：         2.公式變量agli201的抓取增加‘數據來源’選項
################################################################################
PUBLIC FUNCTION s_analy_form_formula(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#  DEFINE p_ld            LIKE glaa_t.glaald
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_str           STRING
   DEFINE p_wc            STRING    #筛选条件
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_str           STRING
   DEFINE l_str1          LIKE type_t.chr100
   DEFINE l_str2          LIKE type_t.chr1
   DEFINE l_str3          STRING
   DEFINE l_str4          STRING    #150812-00010#3
   DEFINE l_sql           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_j             LIKE type_t.num5
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_delimiter1    STRING   #分隔符
   DEFINE l_delimiter2    STRING   #分隔符
   DEFINE l_operator      DYNAMIC ARRAY OF RECORD  #存儲運算符
                    symbol  LIKE type_t.chr80
                          END RECORD  
   #150827-00036#1--add--str--
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   #150827-00036#1--add--end       
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---   
   
   LET r_success = TRUE
   LET r_amount = 0
   
   #去掉公式左右兩邊的空格
   LET p_str = p_str.trim()
   
   LET l_str  = ''
   LET l_str1 = ''
   LET l_str2 = ''
   CALL l_operator.clear()
   
   #抓取第一位字符是變量還是"("
   LET l_str2 = p_str.substring(1,1) 
    
   LET l_delimiter1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #字母數字當做分隔符
   LET l_delimiter2 = "+-*/()"                                                 #運算符、括號作為分隔符
   LET tok3 = base.StringTokenizer.create(p_str,l_delimiter2)   #運算符、括號作為分隔符,取出字母數字   
   LET tok4 = base.StringTokenizer.create(p_str,l_delimiter1)  #字母數字當做分隔符,取出運算符、括號
   
   #將公式里的運算符存放到數組里
   LET l_i = 1
   WHILE tok4.hasMoreTokens()
     LET l_str3 = tok4.nextToken()
     LET l_str3 = l_str3.trim()
     LET l_operator[l_i].symbol = l_str3
     IF cl_null(l_operator[l_i].symbol) THEN  #去除掉空格
        CALL l_operator.deleteElement(l_i)
     ELSE
        LET l_i = l_i + 1
     END IF
   END WHILE
   CALL l_operator.deleteElement(l_i)
   LET l_i = l_i - 1
   
   #定义SQL申请
   CALL s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce) #170510-00043#2 add
   
   #取出每個變量到變量設置作業(agli201)抓取金額,然後再重組公式算出最後金額
   LET l_j = 1
   WHILE tok3.hasMoreTokens()
     LET l_str1 = tok3.nextToken()
     
     #去除掉空格
     IF cl_null(l_str1) THEN 
        CONTINUE WHILE
     END IF

     LET l_str4 = l_str1   #150812-00010#3
     LET l_amt = 0  
     CALL s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,l_str1,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye) #150827-00036#1 add 'p_show_ad,p_stus'  #170222-00003#1 add ,p_show_ce,p_show_ye 
     RETURNING l_success,l_amt
     IF l_success = FALSE THEN
        LET r_success = FALSE
        RETURN r_success,r_amount
     END IF

     #150812-00010#3--s
     IF l_str4.substring(1,1)  MATCHES '[0123456789]' THEN
        LET l_amt = l_str1
     END IF
     #150812-00010#3--e     
     IF l_str2 = '(' THEN     
        IF cl_null(l_str) THEN
           LET l_str = l_operator[l_j].symbol CLIPPED,l_amt CLIPPED
        ELSE
           LET l_str = l_str CLIPPED,l_operator[l_j].symbol CLIPPED,l_amt CLIPPED
        END IF
     ELSE
        IF cl_null(l_str) THEN
           LET l_str = l_amt CLIPPED,l_operator[l_j].symbol CLIPPED
        ELSE
           LET l_str = l_str CLIPPED, l_amt CLIPPED,l_operator[l_j].symbol CLIPPED
        END IF
     END IF
     LET l_j = l_j + 1
   END WHILE
   
   #如果運算符比變量多一位，遍歷變量時會少加最後一位運算符
   IF l_i = l_j THEN 
      LET l_str = l_str CLIPPED, l_operator[l_j].symbol CLIPPED
   END IF
   
   IF cl_null(l_str) THEN 
      RETURN r_success,r_amount
   END IF
   
   LET l_sql = "SELECT ",l_str CLIPPED," FROM DUAL"
   PREPARE l_sql_pre FROM l_sql
   EXECUTE l_sql_pre INTO r_amount
   
   #除數不可為0
   IF SQLCA.sqlerrd[2] = -1476 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00237'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,l_str,'','agl-00237',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = l_str
      #170623-00034#6---add--start
      IF NOT cl_null(g_fun_argv.glfbl004) THEN
         LET g_errparam.extend = s_get_field_name('agli070','glfbl004'),":",g_fun_argv.glfbl004,
                                 " & ",
                                 s_get_field_name('agli070','glfb003'), ":",g_fun_argv.glfb003,
                                 " >> ",
                                 l_str
      END IF
      #170623-00034#6---add--end
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,l_str,'','sub-00559',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   #小數取位
   CALL s_num_round('1',r_amount,p_glfa009) RETURNING r_amount
   
   #根據金額單位對金額進行處理
   CASE p_glfa008
      WHEN '1'  #元
         LET r_amount = r_amount
      WHEN '2'  #千
         LET r_amount = r_amount / 1000
      WHEN '3'  #萬
         LET r_amount = r_amount / 10000
      OTHERWISE
         LET r_amount = r_amount
   END CASE
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 獲取座標
# Memo...........:
# Usage..........: CALL s_analy_form_get_coordinate(p_glfa001,p_str)
#                  RETURNING r_success,r_amount
# Input parameter: p_glfa001   報表模板編號
#                : p_str       公式、座標
# Return code....: r_success   檢核狀態
#                : r_str       金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_coordinate(p_glfa001,p_str)
   DEFINE p_ld            LIKE glaa_t.glaald
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_str           STRING
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE l_delimiter1    STRING   #分隔符
   DEFINE l_delimiter2    STRING   #分隔符
   DEFINE l_operator      DYNAMIC ARRAY OF RECORD  #存儲運算符
                    symbol  LIKE type_t.chr80
                          END RECORD  
   DEFINE l_str           STRING
   DEFINE l_str1          LIKE type_t.chr100
   DEFINE l_str2          LIKE type_t.chr1
   DEFINE l_str3          STRING
   DEFINE l_sql           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_j             LIKE type_t.num5
   DEFINE l_glfb004       LIKE glfb_t.glfb004
   #DEFINE l_glfb005       LIKE glfb_t.glfb005   #161215-00022#1 mark lujh
   DEFINE l_glfb005       STRING                 #161215-00022#1 add lujh
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_flag          LIKE type_t.num5
   DEFINE l_success       LIKE type_t.num5
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE r_str           STRING
            
   LET r_success = TRUE
   LET r_amount = 0
   
   #將公式一直解析到全部是變量再算金額
   LET l_flag = TRUE
   WHILE l_flag 
      LET l_flag = FALSE
      LET l_str = ''
      LET l_str1 = ''
      LET l_str2 = ''
      CALL l_operator.clear()
      #抓取第一位字符是變量還是"("
      LET l_str2 = p_str.substring(1,1)
      
      LET l_delimiter1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #字母數字當做分隔符
      LET l_delimiter2 = "+-*/()"                                                 #運算符、括號作為分隔符
      LET tok5 = base.StringTokenizer.create(p_str,l_delimiter2)   #運算符、括號作為分隔符,取出字母數字   
      LET tok6 = base.StringTokenizer.create(p_str,l_delimiter1)  #字母數字當做分隔符,取出運算符、括號
      
      #將公式里的運算符存放到數組里
      LET l_i = 1
      WHILE tok6.hasMoreTokens()
        LET l_str3 = tok6.nextToken()
        LET l_str3 = l_str3.trim()
        LET l_operator[l_i].symbol = l_str3
        IF cl_null(l_operator[l_i].symbol) THEN   #去除掉空格
           CALL l_operator.deleteElement(l_i)
        ELSE
           LET l_i = l_i + 1
        END IF
      END WHILE
      CALL l_operator.deleteElement(l_i)
      LET l_i = l_i - 1
      
   
      #取出每個座標到財務報表結構設置作業(agli070)抓取公式
      LET l_j = 1
      WHILE tok5.hasMoreTokens() 
        LET l_str1 = tok5.nextToken()
        #去除掉空格
        IF cl_null(l_str1) THEN 
           CONTINUE WHILE
        END IF
        
        #根據座標抓取公式
        CALL s_analy_form_get_formula(p_glfa001,l_str1) RETURNING l_glfb004,l_glfb005 
        IF cl_null(l_glfb005) AND l_glfb004 = '2' THEN
           LET l_glfb005 = l_str1
        END IF
        IF cl_null(l_glfb005) AND (l_glfb004 = '1' OR cl_null(l_glfb004)) THEN
           LET l_glfb005 = 0
        END IF
        #150812-00010#3--s
        IF l_str1[1,1]  MATCHES '[0123456789]' THEN
           LET l_glfb005 = l_str1
        END IF
        #150812-00010#3--e   
        
        #防止有乘除的運算，先把公式用括號括起來
        IF l_operator[l_j].symbol = '*' OR l_operator[l_j].symbol = '/' THEN 
           LET l_glfb005 = "(" CLIPPED,l_glfb005 CLIPPED,")" CLIPPED
        END IF
        
        #前一个运算符是乘、除、减,把后面的公式用括号括起来
        IF l_j > 1 THEN 
           IF l_operator[l_j-1].symbol = '*' OR l_operator[l_j-1].symbol = '/' OR l_operator[l_j-1].symbol = '-' THEN 
              LET l_glfb005 = "(" CLIPPED,l_glfb005 CLIPPED,")" CLIPPED
           END IF
        END IF

        IF l_str2 = '(' THEN 
           IF cl_null(l_str) THEN
              LET l_str = l_operator[l_j].symbol CLIPPED,l_glfb005 CLIPPED
           ELSE
              LET l_str = l_str CLIPPED,l_operator[l_j].symbol CLIPPED,l_glfb005 CLIPPED
           END IF
        ELSE
           IF cl_null(l_str) THEN
              LET l_str = l_glfb005 CLIPPED,l_operator[l_j].symbol CLIPPED
           ELSE
              LET l_str = l_str CLIPPED, l_glfb005 CLIPPED,l_operator[l_j].symbol CLIPPED
           END IF
        END IF
        LET l_j = l_j + 1
        
        IF l_glfb004 = '1' THEN 
           LET l_flag = TRUE
        END IF
      END WHILE 
      
      #如果運算符比變量多一位，遍歷變量時會少加最後一位運算符
      IF l_i = l_j THEN 
         LET l_str = l_str CLIPPED, l_operator[l_j].symbol CLIPPED
      END IF
      
      LET p_str = l_str    
   END WHILE      
   
   LET r_str = l_str
   RETURN r_success,r_str
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件#2015/1/23 mod
#                : p_show_ad   含審計調整傳票否 #150827-00036#1 add
#                : p_stus      傳票狀態 #150827-00036#1 add
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By lujh
# Modify.........: by 02559 mod 将p_comp改成p_wc用于传入条件
#                : by 02599 1.增加是否含審計調整傳票和傳票狀態兩個抓取條件；
#                ：         2.公式變量agli201的抓取增加‘數據來源’選項
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#  DEFINE p_ld            LIKE glaa_t.glaald
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfc001       LIKE glfc_t.glfc001
   DEFINE p_glfc002       LIKE glfc_t.glfc002
   DEFINE p_glfc003       LIKE glfc_t.glfc003
   DEFINE p_glfc004       LIKE glfc_t.glfc004
   DEFINE p_glfc005       LIKE glfc_t.glfc005
   DEFINE p_glfc006       LIKE glfc_t.glfc006
   DEFINE p_glfc007       LIKE glfc_t.glfc007
   DEFINE p_glfc008       LIKE glfc_t.glfc008
   DEFINE p_glfc010       LIKE glfc_t.glfc010
   DEFINE p_wc            STRING
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_sql           STRING
   DEFINE l_field         LIKE type_t.chr100
   DEFINE l_glaa004       LIKE glaa_t.glaa004
   DEFINE l_glac008       LIKE glac_t.glac008
   DEFINE l_sql_ce        STRING
   DEFINE l_wc_ce         STRING
   DEFINE l_field1        LIKE type_t.chr100
   DEFINE l_amt_ce        LIKE glar_t.glar005
   #150827-00036#1--add--str--
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   DEFINE l_amt_st        LIKE glar_t.glar005
   DEFINE l_amt_ad        LIKE glar_t.glar005
   DEFINE l_sql_st        STRING
   DEFINE l_sql_ad        STRING
   DEFINE l_sql_stus      STRING
   DEFINE l_sql_stus_1    STRING
   #150827-00036#1--add--end
   DEFINE l_sum_str       STRING #160526-00035#1 add
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   DEFINE l_amt_ye        LIKE glar_t.glar005
   DEFINE l_sql_ye        STRING
   #170222-00003#1 add e---   
   #170406-00082#1-----s
   DEFINE l_bdate    LIKE type_t.dat
   DEFINE l_edate    LIKE type_t.dat
   DEFINE l_glaa003  LIKE glaa_t.glaa003
   DEFINE l_ddate    LIKE type_t.dat
   #170406-00082#1-----e
   
   LET r_success = TRUE
   LET l_field = ''
   LET l_field1 = ''
   LET r_amount = 0
   LET l_amt_ce = 0
   LET l_amt_ye = 0 #170222-00003#1 add
   LET l_glac008 = ''
   LET l_amt_st = 0
   LET l_amt_ad = 0
#2015/1/23--mod--str--   
   #抓取科目參照表
#   IF cl_null(p_comp) THEN
#      SELECT glaa004 INTO l_glaa004
#        FROM glaa_t
#        WHERE glaaent = g_enterprise
#          AND glaald = p_ld
#   ELSE
#170510-00043#2--mark--str--
#      LET l_sql ="  SELECT DISTINCT glaa004  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
#                 "  AND glaald IN ('",p_ld,"') "
#      PREPARE glaa004_pre FROM l_sql
#      EXECUTE glaa004_pre INTO l_glaa004 
#170510-00043#2--mark--end
   
#170510-00043#2--mark--str--
#      #170406-00082#1-----s
#      LET l_sql ="  SELECT DISTINCT glaa003  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
#                 "  AND glaald IN ('",p_ld,"') "
#      PREPARE glaa003_pre FROM l_sql
#      EXECUTE glaa003_pre INTO l_glaa003
#      #170406-00082#1-----e
#170510-00043#2--mark--end
#   END IF   
#2015/1/23--mod--end     

   #170406-00082#1-----s
#   CALL s_fin_date_get_period_range(l_glaa003,p_year,p_bmonth)RETURNING l_bdate,l_ddate #170510-00043#2 mark
#   CALL s_fin_date_get_period_range(l_glaa003,p_year,p_emonth)RETURNING l_ddate,l_edate  #170510-00043#2 mark
   #170510-00043#2--add--str--
   IF p_show_ce = 'N' THEN
      LET l_bdate = g_bdate
      LET l_edate = g_edate
   #170510-00043#2--add--end
   LET l_edate = l_edate + 1
   END IF #170510-00043#2 add
   #170406-00082#1-----e
      
   
   #抓取起始科目的正常餘額形態
#170510-00043#2--mod--str--
#   SELECT glac008 INTO l_glac008
#     FROM glac_t
#    WHERE glacent = g_enterprise
#      AND glac001 = l_glaa004
#      AND glac002 = p_glfc003   
   
   EXECUTE glac008_pre USING p_glfc003 INTO l_glac008 
#170510-00043#2--mod--end   
   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF
   
   #150827-00036#1--add--str--
   IF cl_null(p_stus) THEN
      LET p_stus='1'  
   END IF 
   CASE p_stus
      WHEN '1' 
         LET l_sql_stus=" AND glapstus='S'"
      WHEN '2'
         LET l_sql_stus=" AND glapstus IN ('S','Y') "
         LET l_sql_stus_1=" AND glapstus='Y' "
      WHEN '3'
         LET l_sql_stus=" AND glapstus IN ('S','Y','N') "
         LET l_sql_stus_1=" AND glapstus IN ('Y','N') "
   END CASE    
   #150827-00036#1--add--end
   
   #取值方式
   CASE p_glfc008 
      WHEN '1'   #期初餘額
         LET l_sql = "SELECT SUM(glar005 - glar006) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glar003 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glar003 < ",p_bmonth
         END IF
             
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark 
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            #"   AND glap007 = 'CE'",     #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",   
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",    #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL", 
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",       
                            #170406-00082#1-----e
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add
            #170222-00003#1 add s---
            END IF
            #排除YE憑證
            IF p_show_ye = 'N' THEN        
               LET l_sql_ye="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add  
            END IF                
            #170222-00003#1 add e---                         
         #END IF #170222-00003#1 mark 
         
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
      WHEN '2'  #期初餘額在借方
#         LET l_sql = "SELECT SUM(glar005) ",      #160526-00035#1 mark
#                     "  FROM glar_t ",            #160526-00035#1 mark
         LET l_sum_str = " SUM(glar005-glar006) "  #160526-00035#1 add
         LET l_sql = "  FROM glar_t ",             #160526-00035#1 add
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glar003 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glar003 < ",p_bmonth
         END IF
         
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark 
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq003) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            #"   AND glap007 = 'CE'",     #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",    #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",
                            #170406-00082#1-----e
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add
                            
            #170222-00003#1 add s---
            END IF
            #排除YE憑證    
            IF p_show_ye = 'N' THEN            
               LET l_sql_ye="SELECT SUM(glaq003) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add 
            END IF                              
            #170222-00003#1 add e---                           
         #END IF #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
      WHEN '3'  #期初餘額在貸方
#          LET l_sql = "SELECT SUM(glar006) ",    #160526-00035#1 mark
#                     "  FROM glar_t ",           #160526-00035#1 mark
         LET l_sum_str = " SUM(glar006-glar005) " #160526-00035#1 add
         LET l_sql = "  FROM glar_t ",            #160526-00035#1 add
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glar003 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glar003 < ",p_bmonth
         END IF
               
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark 
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            #"   AND glap007 = 'CE'",     #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",
                            #170406-00082#1-----e
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add   
            #170222-00003#1 add s---
            END IF
            #排除YE憑
            IF p_show_ye = 'N' THEN
               LET l_sql_ye="SELECT SUM(glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap004 < ",p_bmonth, #150827-00036#1 mod '<='改成'<'
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "     #150827-00036#1 mark
                            l_sql_stus                    #150827-00036#1 add    
            END IF                            
            #170222-00003#1 add e---
         #END IF #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < ",p_bmonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
      WHEN '4'  #本期借方
          LET l_sql = "SELECT SUM(glar005) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq003) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",    #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
            #170222-00003#1 add s---
            END IF
            #排除YE憑證
            IF p_show_ye = 'N' THEN            
               LET l_sql_ye="SELECT SUM(glaq003) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add  
            END IF                            
            #170222-00003#1 add e---                         
         #END IF #170222-00003#1 mark
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '5'  #本期貸方
          LET l_sql = "SELECT SUM(glar006) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1'  #170222-00003#1 mark 
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
            #170222-00003#1 add s---        
            END IF
            #排除YE憑證
            IF p_show_ye = 'N' THEN
               LET l_sql_ye="SELECT SUM(glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add 
            END IF                            
            #170222-00003#1 add e---                           
         #END IF  #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '6'  #本期發生額
          LET l_sql = "SELECT SUM(glar005 - glar006) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1'  #170222-00003#1 mark 
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",    #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e                            
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
            #170222-00003#1 add s---
            END IF
            #排除YE憑
            IF p_show_ye = 'N' THEN
               LET l_sql_ye="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add   
            END IF                            
            #170222-00003#1 add e---                         
         #END IF  #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 BETWEEN ",p_bmonth," AND ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '7'  #期末餘額
          LET l_sql = "SELECT SUM(glar005 - glar006) ",
                     "  FROM glar_t ",
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 < =  ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark 
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 < =  ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e                          
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
            #170222-00003#1 add s---
            END IF
            IF p_show_ye = 'N' THEN
               #排除YE憑證
               LET l_sql_ye="SELECT SUM(glaq003 - glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 < =  ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add   
            END IF                            
            #170222-00003#1 add e---                         
         #END IF  #170222-00003#1 mark 
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < =  ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003 - glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < =  ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '8'  #期末餘額在借方
#          LET l_sql = "SELECT SUM(glar005) ",    #160526-00035#1 mark
#                     "  FROM glar_t ",           #160526-00035#1 mark
         LET l_sum_str = " SUM(glar005-glar006) " #160526-00035#1 add
         LET l_sql = "  FROM glar_t ",            #160526-00035#1 add
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 < =  ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq003) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 < =  ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",   #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add
                            
            #170222-00003#1 add s---
            END IF
            #排除YE憑证
            IF p_show_ye = 'N' THEN
               LET l_sql_ye="SELECT SUM(glaq003) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 < =  ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add  
            END IF                            
            #170222-00003#1 add e---                         
         #END IF #170222-00003#1 mark
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq003) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < =  ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq003) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < =  ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
         
      WHEN '9'  #期末餘額在貸方
#          LET l_sql = "SELECT SUM(glar006) ",    #160526-00035#1 mark
#                     "  FROM glar_t ",           #160526-00035#1 mark
         LET l_sum_str = " SUM(glar006-glar005) " #160526-00035#1 add
         LET l_sql = "  FROM glar_t ",            #160526-00035#1 add
                     " WHERE glarent = '",g_enterprise,"'",
               #     "   AND glarld = '",p_ld,"'",
                     "   AND glarld IN ('",p_ld,"') ",
                     "   AND glar002 = ",p_year,
                     "   AND glar003 < =  ",p_emonth,
                     "   AND glar001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                    
         #当报表为损益类报表时，排除CE凭证
         #IF g_glfa002='2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
            IF p_show_ce = 'N' THEN  #170222-00003#1 add
               LET l_sql_ce="SELECT SUM(glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 < =  ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            #"   AND glap007 = 'CE'",  #170331-00077#1 mark
                            #170331-00077#1-----s
                            "   AND (",
                            "        (glap007='CE' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac007='6' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'))",
                            "         OR ",
                            "        (glap007='XC' AND glaq002 IN (SELECT glac002 FROM glac_t ",
                            "                                       WHERE glacent=",g_enterprise," AND glac001='",p_glfc002,"'",
                            "                                         AND glac010 <> 'N' ",
                            "                                         AND glac007='5' AND glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' ",
                            #"                                     )))",    #170406-00082#1 mark
                            #170406-00082#1-----s
                            "                                     )",
                         "                      AND glapdocno IN (SELECT xcea101 FROM xcea_t ",
                     "                                             WHERE xceaent=",g_enterprise," AND xceald IN ('",p_ld,"') ",
                     "                                               AND xcea002 = '9' AND xcea101 IS NOT NULL",
                     "                                               AND xcea001>='",l_bdate,"' AND xcea001<'",l_edate,"')",
                                  "))",
                            #170406-00082#1-----e                            
                            #170331-00077#1-----e
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add              
            #170222-00003#1 add s---
            END IF
            #排除YE憑证
            IF p_show_ye = 'N' THEN
               LET l_sql_ye="SELECT SUM(glaq004) ",
                            "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                            " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                            "   AND glap002 = ",p_year,
                            "   AND glap004 < =  ",p_emonth,
                            "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                            "   AND glap007 = 'YE'",
#                            "   AND glapstus = 'S' "  #150827-00036#1 mark
                            l_sql_stus                 #150827-00036#1 add   
            END IF                         
            #170222-00003#1 add e---                         
         #END IF #170222-00003#1  mark
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_sql_st="SELECT SUM(glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < =  ",p_emonth,
                         l_sql_stus_1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_sql_ad="SELECT SUM(glaq004) ",
                         "  FROM glaq_t INNER JOIN glap_t ON glapent=glaqent AND glapld = glaqld AND glapdocno = glaqdocno ",
                         " WHERE glaqent=",g_enterprise," AND glaqld IN ('",p_ld,"') ",
                         "   AND glap002 = ",p_year,
                         "   AND glaq002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                         "   AND glap004 < =  ",p_emonth,
                         "   AND glap007 = 'AD' ",
                         l_sql_stus
         END IF
         #150827-00036#1--add--end
   END CASE 


   #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field = 'glar012'
         LET l_field1= 'glaq017'
      WHEN '2'   #部門
         LET l_field = 'glar013'
         LET l_field1= 'glaq018'
      WHEN '3'   #利潤/成本中心
         LET l_field = 'glar014'
         LET l_field1= 'glaq019'
      WHEN '4'   #區域
         LET l_field = 'glar015'
         LET l_field1= 'glaq020'
      WHEN '5'   #交易客商
         LET l_field = 'glar016'
         LET l_field1= 'glaq021'
      WHEN '6'   #帳款客商
         LET l_field = 'glar017'
         LET l_field1= 'glaq022'
      WHEN '7'   #客群
         LET l_field = 'glar018'
         LET l_field1= 'glaq023'
      WHEN '8'   #產品類別
         LET l_field = 'glar019'
         LET l_field1= 'glaq024'
      WHEN '9'   #經營方式
         LET l_field = 'glar051'
         LET l_field1= 'glaq051'
      WHEN '10'   #渠道
         LET l_field = 'glar052'
         LET l_field1= 'glaq052'
      WHEN '11'   #品牌
         LET l_field = 'glar053'
         LET l_field1= 'glaq053'
      WHEN '12'   #人員
         LET l_field = 'glar020'
         LET l_field1= 'glaq025'
#      WHEN '10'  #預算編號
#         LET l_field = 'glar021'
      
      WHEN '13'  #專案編號
         LET l_field = 'glar022'
         LET l_field1= 'glaq027'
      WHEN '14'  #WBS
         LET l_field = 'glar023'
         LET l_field1= 'glaq028'
      WHEN '15'  #自由核算項一
         LET l_field = 'glar024'
         LET l_field1= 'glaq029'
      WHEN '16'  #自由核算項二
         LET l_field = 'glar025'
         LET l_field1= 'glaq030'
      WHEN '17'  #自由核算項三
         LET l_field = 'glar026'
         LET l_field1= 'glaq031'
      WHEN '18'  #自由核算項四
         LET l_field = 'glar027'
         LET l_field1= 'glaq032'
      WHEN '19'  #自由核算項五
         LET l_field = 'glar028'
         LET l_field1= 'glaq033'
      WHEN '20'  #自由核算項六
         LET l_field = 'glar029'
         LET l_field1= 'glaq034'
      WHEN '21'  #自由核算項七
         LET l_field = 'glar030'
         LET l_field1= 'glaq035'
      WHEN '22'  #自由核算項八
         LET l_field = 'glar031'
         LET l_field1= 'glaq036'
      WHEN '23'  #自由核算項九
         LET l_field = 'glar032'
         LET l_field1= 'glaq037'
      WHEN '24'  #自由核算項十
         LET l_field = 'glar033'
         LET l_field1= 'glaq038'
      OTHERWISE
         LET l_field = ''
         LET l_field1= ''
   END CASE

#2015/1/23--mod--str--
#   #過濾統治科目
#   IF cl_null(p_comp) THEN
#      LET l_sql = l_sql," AND glar001 IN (SELECT glac002 FROM glac_t ",
#                        "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
#                        "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
#   ELSE
#     LET l_sql = l_sql," AND glar001 IN (SELECT glac002 FROM glac_t ",
#                        "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
#                        "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')",
#                        " AND glar012 = '",p_comp,"'"
#   END IF   
   LET l_sql = l_sql," AND glar001 IN (SELECT glac002 FROM glac_t ",
                     "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                     "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                     "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
   IF NOT cl_null(p_wc) THEN
      LET l_sql = l_sql," AND ",p_wc
   END IF
#2015/1/23--mod--end
   #核算项范围条件
   IF NOT cl_null(l_field) THEN       
      IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
      END IF
      
      IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
      END IF
      IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
      END IF
   END IF
   
   
   #額外條件
   IF NOT cl_null(p_glfc010) THEN 
      LET l_sql = l_sql," AND ",p_glfc010
   END IF
   
   #150827-00036#1--add--str--
   #损益类报表 OR 單據狀態=2 or 3 OR 不含審計調整傳票
   IF g_glfa002 = '2' OR p_stus='2' OR p_stus='3' OR p_show_ad='N' OR p_show_ye='N' OR p_show_ce='N' OR g_glfa002 = '1' THEN  #170222-00003#1 add p_show_ye='N' OR p_show_ce='N' OR g_glfa002 = '1'
      IF NOT cl_null(p_wc) THEN
         LET l_wc_ce=cl_replace_str(p_wc,"glar001","glaq002")
         LET l_wc_ce=cl_replace_str(l_wc_ce,"glar012","glaq017")
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar013','glaq018')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar014','glaq019')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar015','glaq020')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar016','glaq021')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar017','glaq022')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar018','glaq023')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar019','glaq024')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar051','glaq051')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar052','glaq052')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar053','glaq053')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar020','glaq025')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar022','glaq027')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar023','glaq028')
         #自由核算項
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar024','glaq029')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar025','glaq030')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar026','glaq031')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar027','glaq032')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar028','glaq033')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar029','glaq034')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar030','glaq035')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar031','glaq036')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar032','glaq037')
         LET l_wc_ce=cl_replace_str(l_wc_ce,'glar033','glaq038')
      END IF
   END IF
   #150827-00036#1--add--end
   
   #损益类报表
   #IF g_glfa002 = '2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
      IF p_show_ce = 'N' THEN #170222-00003#1 add
         LET l_sql_ce = l_sql_ce," AND glaq002 IN (SELECT glac002 FROM glac_t ",
                                 "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                                 "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                                 "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
         IF NOT cl_null(l_wc_ce) THEN
            LET l_sql_ce = l_sql_ce," AND ",l_wc_ce
         END IF
         #核算项范围条件
         IF NOT cl_null(l_field1) THEN  #150827-00036#1 add
            IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
               LET l_sql_ce = l_sql_ce," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
            END IF
            
            IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
               LET l_sql_ce = l_sql_ce," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
            END IF
            IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
               LET l_sql_ce = l_sql_ce," AND ",l_field1," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
            END IF
         END IF #150827-00036#1 add
         #CE类凭证金额
         PREPARE glaq_ce_pre FROM l_sql_ce
         EXECUTE glaq_ce_pre INTO l_amt_ce
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00559'
            LET g_errparam.extend = p_glfc001
            LET g_errparam.popup = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            RETURN r_success,r_amount
         END IF
         IF cl_null(l_amt_ce) THEN LET l_amt_ce=0 END IF
      END IF #170222-00003#1 add
      #170222-00003#1 add s---  
      IF p_show_ye = 'N' THEN
         LET l_sql_ye = l_sql_ye," AND glaq002 IN (SELECT glac002 FROM glac_t ",
                                 "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                                 "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                                 "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
         IF NOT cl_null(l_wc_ce) THEN
            LET l_sql_ye = l_sql_ye," AND ",l_wc_ce
         END IF
         #核算项范围条件
         IF NOT cl_null(l_field1) THEN  #150827-00036#1 add
            IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
               LET l_sql_ye = l_sql_ye," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
            END IF
            
            IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
               LET l_sql_ye = l_sql_ye," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
            END IF
            IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
               LET l_sql_ye = l_sql_ye," AND ",l_field1," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
            END IF
         END IF #150827-00036#1 add
         #YE类凭证金额
         PREPARE glaq_ye_pre FROM l_sql_ye
         EXECUTE glaq_ye_pre INTO l_amt_ye
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'sub-00559'
            LET g_errparam.extend = p_glfc001
            LET g_errparam.popup = TRUE
            CALL cl_err()
         
            LET r_success = FALSE
            RETURN r_success,r_amount
         END IF
         IF cl_null(l_amt_ye) THEN LET l_amt_ye=0 END IF
      END IF         
      #170222-00003#1 add e---      
   #END IF #170222-00003#1  mark
   
   #150827-00036#1--add--str--
   #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
   IF p_stus='2' OR p_stus='3' THEN
      LET l_sql_st = l_sql_st," AND glaq002 IN (SELECT glac002 FROM glac_t ",
                              "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                              "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                              "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
      IF NOT cl_null(l_wc_ce) THEN
         LET l_sql_st = l_sql_st," AND ",l_wc_ce
      END IF
      #核算项范围条件
      IF NOT cl_null(l_field1) THEN
         IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql_st = l_sql_st," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
         END IF
         
         IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
            LET l_sql_st = l_sql_st," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
         END IF
         IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql_st = l_sql_st," AND ",l_field1," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
         END IF
      END IF
      #CE类凭证金额
      PREPARE glaq_st_pre FROM l_sql_st
      EXECUTE glaq_st_pre INTO l_amt_st
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00559'
         LET g_errparam.extend = p_glfc001
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success,r_amount
      END IF
      IF cl_null(l_amt_st) THEN LET l_amt_st=0 END IF
   END IF
   #金額減少：排除AD審計調整憑證金額（-）
   IF p_show_ad = 'N' THEN
      LET l_sql_ad = l_sql_ad," AND glaq002 IN (SELECT glac002 FROM glac_t ",
                              "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                              "                    AND glacent = ",g_enterprise,    #160509-00004#100 add lujh
                              "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
      IF NOT cl_null(l_wc_ce) THEN
         LET l_sql_ad = l_sql_ad," AND ",l_wc_ce
      END IF
      #核算项范围条件
      IF NOT cl_null(l_field1) THEN
         IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql_ad = l_sql_ad," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
         END IF
         
         IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
            LET l_sql_ad = l_sql_ad," AND ",l_field1," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
         END IF
         IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
            LET l_sql_ad = l_sql_ad," AND ",l_field1," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
         END IF
      END IF
      #CE类凭证金额
      PREPARE glaq_ad_pre FROM l_sql_ad
      EXECUTE glaq_ad_pre INTO l_amt_ad
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00559'
         LET g_errparam.extend = p_glfc001
         LET g_errparam.popup = TRUE
         CALL cl_err()
      
         LET r_success = FALSE
         RETURN r_success,r_amount
      END IF
      IF cl_null(l_amt_ad) THEN LET l_amt_ad=0 END IF
   END IF
   #150827-00036#1--add--end
   
   #160526-00035#1--add--str--
   IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
      IF cl_null(l_field) THEN
         LET l_field="''"
      END IF
      LET l_sql="SELECT sum(amt) ",
                "  FROM (",
                "        SELECT glar001,",l_field,",",l_sum_str," amt ",l_sql,
                "         GROUP BY glar001,",l_field,
                "         HAVING ",l_sum_str,">0 ",
                "       )"
   END IF
   #160526-00035#1--add--end
   
   PREPARE glar_pre FROM l_sql
   EXECUTE glar_pre INTO r_amount
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()
#      CALL cl_errmsg(g_str,p_glfc001,'','sub-00559',1)

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' THEN   #1:期初餘額 6:本期發生額 7:期末餘額
      IF l_glac008 = '2' THEN   #貸余
         LET r_amount = r_amount * -1
         #损益类报表
         #IF g_glfa002 = '2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1  mark
            #LET l_amt_ce = l_amt_ce * -1 #170222-00003#1 mark
            #170222-00003#1 add s---
            IF p_show_ce = 'N' THEN  
               LET l_amt_ce = l_amt_ce * -1
            END IF
            IF p_show_ye = 'N' THEN            
               LET l_amt_ye = l_amt_ye * -1 
            END IF 
            #170222-00003#1 add e---            
         #END IF #170222-00003#1 mark
         
         #150827-00036#1--add--str--
         #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
         IF p_stus='2' OR p_stus='3' THEN
            LET l_amt_st = l_amt_st * -1
         END IF
         #金額減少：排除AD審計調整憑證金額（-）
         IF p_show_ad = 'N' THEN
            LET l_amt_ad = l_amt_ad * -1
         END IF
         #150827-00036#1--add--end
      END IF
   END IF
   
   #损益类报表时去除CE类凭证金额
   #IF g_glfa002 = '2' OR g_glfa002='1' THEN #170222-00003#1 add g_glfa002='1' #170222-00003#1 mark
      #LET r_amount = r_amount - l_amt_ce #170222-00003#1 mark
      #170222-00003#1 add s---
      IF p_show_ce = 'N' THEN  
         LET r_amount = r_amount - l_amt_ce
      END IF
      IF p_show_ye = 'N' THEN            
         LET r_amount = r_amount - l_amt_ye 
      END IF       
      #170222-00003#1 add e---
   #END IF mark
   
   #150827-00036#1--add--str--
   #金額增加：抓取未審核或已審核未過賬的憑證金額（+）
   IF p_stus='2' OR p_stus='3' THEN
      LET r_amount = r_amount + l_amt_st
   END IF
   #金額減少：排除AD審計調整憑證金額（-）
   IF p_show_ad = 'N' THEN
      LET r_amount = r_amount - l_amt_ad
   END IF
   #150827-00036#1--add--end
         
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 數據來源：總帳憑證統計檔glar_t
# Memo...........:
# Usage..........: CALL s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/05/12 By 02599 #150827-00036#1
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt_1(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc)
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark 
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfc001       LIKE glfc_t.glfc001
   DEFINE p_glfc002       LIKE glfc_t.glfc002
   DEFINE p_glfc003       LIKE glfc_t.glfc003
   DEFINE p_glfc004       LIKE glfc_t.glfc004
   DEFINE p_glfc005       LIKE glfc_t.glfc005
   DEFINE p_glfc006       LIKE glfc_t.glfc006
   DEFINE p_glfc007       LIKE glfc_t.glfc007
   DEFINE p_glfc008       LIKE glfc_t.glfc008
   DEFINE p_glfc010       LIKE glfc_t.glfc010
   DEFINE p_wc            STRING
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_sql           STRING
   DEFINE l_field         LIKE type_t.chr100
   DEFINE l_glaa004       LIKE glaa_t.glaa004
   DEFINE l_glac008       LIKE glac_t.glac008
   DEFINE l_wc            STRING
   DEFINE l_sum_str       STRING #160526-00035#1 add
   
   LET r_success = TRUE
   LET l_field = ''
   LET r_amount = 0
   LET l_glac008 = ''
#170510-00043#2--mark--str--
#   LET l_sql ="  SELECT DISTINCT glaa004  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
#              "  AND glaald IN ('",p_ld,"') "
#   PREPARE glaa004_1_pre FROM l_sql
#   EXECUTE glaa004_1_pre INTO l_glaa004   
#170510-00043#2--mark--end
   
   #抓取起始科目的正常餘額形態
#170510-00043#2--mod--str--
#   SELECT glac008 INTO l_glac008
#     FROM glac_t
#    WHERE glacent = g_enterprise
#      AND glac001 = l_glaa004
#      AND glac002 = p_glfc003
   EXECUTE glac008_pre USING p_glfc003 INTO l_glac008 
#170510-00043#2--mod--end   
   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF
   
   #取值方式
   CASE p_glfc008 
      WHEN '1'   #期初餘額
         LET l_sql = "SELECT SUM(glat113 - glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glat002 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glat002 < ",p_bmonth
         END IF
         
      WHEN '2'  #期初餘額在借方
#         LET l_sql = "SELECT SUM(glat113) ",      #160526-00035#1 mark
         LET l_sum_str = " SUM(glat113-glat114) "  #160526-00035#1 add
         LET l_sql =                               #160526-00035#1 add
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glat002 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glat002 < ",p_bmonth
         END IF
         
      WHEN '3'  #期初餘額在貸方
#          LET l_sql = "SELECT SUM(glat114) ",      #160526-00035#1 mark
          LET l_sum_str = " SUM(glat114-glat113) "  #160526-00035#1 add
          LET l_sql =                               #160526-00035#1 add
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         IF p_bmonth=0 THEN
            LET l_sql=l_sql,"   AND glat002 = ",p_bmonth
         ELSE
            LET l_sql=l_sql,"   AND glat002 < ",p_bmonth
         END IF
               
      WHEN '4'  #本期借方
          LET l_sql = "SELECT SUM(glat113) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
      WHEN '5'  #本期貸方
          LET l_sql = "SELECT SUM(glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '6'  #本期發生額
          LET l_sql = "SELECT SUM(glat113 - glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                     
      WHEN '7'  #期末餘額
          LET l_sql = "SELECT SUM(glat113 - glat114) ",
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 < =  ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
         
      WHEN '8'  #期末餘額在借方
#          LET l_sql = "SELECT SUM(glat113) ",     #160526-00035#1 mark
          LET l_sum_str = " SUM(glat113-glat114) " #160526-00035#1 add
          LET l_sql =                              #160526-00035#1 add
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 < =  ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '9'  #期末餘額在貸方
#          LET l_sql = "SELECT SUM(glat114) ",     #160526-00035#1 mark
          LET l_sum_str = " SUM(glat114-glat113) " #160526-00035#1 add
          LET l_sql =                              #160526-00035#1 add
                     "  FROM glat_t ",
                     " WHERE glatent = '",g_enterprise,"'",
                     "   AND glatld IN ('",p_ld,"') ",
                     "   AND glat001 = ",p_year,
                     "   AND glat002 < =  ",p_emonth,
                     "   AND glat007 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
   END CASE 


   #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field = 'glatorga'
      WHEN '2'   #部門
         LET l_field = 'glat011'
      WHEN '3'   #利潤/成本中心
         LET l_field = 'glat012'
      WHEN '4'   #區域
         LET l_field = 'glat013'
      WHEN '5'   #交易客商
         LET l_field = 'glat005'
      WHEN '6'   #帳款客商
         LET l_field = 'glat006'
      WHEN '7'   #客群
         LET l_field = 'glat014'
      WHEN '8'   #產品類別
         LET l_field = 'glat015'
      WHEN '9'   #經營方式
         LET l_field = 'glat020'
      WHEN '10'   #渠道
         LET l_field = 'glat021'
      WHEN '11'   #品牌
         LET l_field = 'glat022'
      WHEN '12'   #人員
         LET l_field = 'glat016'
      WHEN '13'  #專案編號
         LET l_field = 'glat017'
      WHEN '14'  #WBS
         LET l_field = 'glat018'
      WHEN '15'  #自由核算項一
         LET l_field = 'glat023'
      WHEN '16'  #自由核算項二
         LET l_field = 'glat024'
      WHEN '17'  #自由核算項三
         LET l_field = 'glat025'
      WHEN '18'  #自由核算項四
         LET l_field = 'glat026'
      WHEN '19'  #自由核算項五
         LET l_field = 'glat027'
      WHEN '20'  #自由核算項六
         LET l_field = 'glat028'
      WHEN '21'  #自由核算項七
         LET l_field = 'glat029'
      WHEN '22'  #自由核算項八
         LET l_field = 'glat030'
      WHEN '23'  #自由核算項九
         LET l_field = 'glat031'
      WHEN '24'  #自由核算項十
         LET l_field = 'glat032'
      OTHERWISE
         LET l_field = ''
   END CASE

  
   LET l_sql = l_sql," AND glat007 IN (SELECT glac002 FROM glac_t ",
                     "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                     "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
   IF NOT cl_null(p_wc) THEN
      LET l_wc=cl_replace_str(p_wc,"glar001","glat007")
      LET l_wc=cl_replace_str(l_wc,"glar012","glatorga")
      LET l_wc=cl_replace_str(l_wc,'glar013','glat011')
      LET l_wc=cl_replace_str(l_wc,'glar014','glat012')
      LET l_wc=cl_replace_str(l_wc,'glar015','glat013')
      LET l_wc=cl_replace_str(l_wc,'glar016','glat005')
      LET l_wc=cl_replace_str(l_wc,'glar017','glat006')
      LET l_wc=cl_replace_str(l_wc,'glar018','glat014')
      LET l_wc=cl_replace_str(l_wc,'glar019','glat015')
      LET l_wc=cl_replace_str(l_wc,'glar051','glat020')
      LET l_wc=cl_replace_str(l_wc,'glar052','glat021')
      LET l_wc=cl_replace_str(l_wc,'glar053','glat022')
      LET l_wc=cl_replace_str(l_wc,'glar020','glat016')
      LET l_wc=cl_replace_str(l_wc,'glar022','glat017')
      LET l_wc=cl_replace_str(l_wc,'glar023','glat018')
      #自由核算項
      LET l_wc=cl_replace_str(l_wc,'glar024','glat023')
      LET l_wc=cl_replace_str(l_wc,'glar025','glat024')
      LET l_wc=cl_replace_str(l_wc,'glar026','glat025')
      LET l_wc=cl_replace_str(l_wc,'glar027','glat026')
      LET l_wc=cl_replace_str(l_wc,'glar028','glat027')
      LET l_wc=cl_replace_str(l_wc,'glar029','glat028')
      LET l_wc=cl_replace_str(l_wc,'glar030','glat029')
      LET l_wc=cl_replace_str(l_wc,'glar031','glat030')
      LET l_wc=cl_replace_str(l_wc,'glar032','glat031')
      LET l_wc=cl_replace_str(l_wc,'glar033','glat032')
      LET l_sql = l_sql," AND ",l_wc
   END IF
   
   #核算项范围条件
   IF NOT cl_null(l_field) THEN       
      IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
      END IF
      
      IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
      END IF
      IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
      END IF
   END IF
   
   #額外條件
   IF NOT cl_null(p_glfc010) THEN 
      LET l_sql = l_sql," AND ",p_glfc010
   END IF
   
   #160526-00035#1--add--str--
   IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
      IF cl_null(l_field) THEN
         LET l_field="''"
      END IF
      LET l_sql="SELECT sum(amt) ",
                "  FROM (",
                "        SELECT glat007,",l_field,",",l_sum_str," amt ",l_sql,
                "         GROUP BY glat007,",l_field,
                "         HAVING ",l_sum_str,">0 ",
                "       )"
   END IF
   #160526-00035#1--add--end
   
   PREPARE glat_pre FROM l_sql
   EXECUTE glat_pre INTO r_amount
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' THEN   #1:期初餘額 6:本期發生額 7:期末餘額
      IF l_glac008 = '2' THEN   #貸余
         LET r_amount = r_amount * -1
      END IF
   END IF
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 數據來源:合併報表合併後各期科目餘額檔 glea_t
# Memo...........:
# Usage..........: CALL s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfc001   變量編號
#                : p_glfc002   科目參照表
#                : p_glfc003   起始科目
#                : p_glfc004   截止科目
#                : p_glfc005   選定核算項
#                : p_glfc006   起始核算項
#                : p_glfc007   截止核算項
#                : p_glfc008   取數方式
#                : p_glfc010   額外條件
#                : p_wc        筛选条件
#                : p_stus      本位幣狀態
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2014/12/02 By Hans #151013-00016#13
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_amt_2(p_ld,p_year,p_bmonth,p_emonth,p_glfc001,p_glfc002,p_glfc003,p_glfc004,p_glfc005,p_glfc006,p_glfc007,p_glfc008,p_glfc010,p_wc,p_stus)
 #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
 DEFINE p_ld            STRING                                #170104-00043#1 add
 DEFINE p_year          LIKE type_t.num5
 DEFINE p_bmonth        LIKE type_t.num5
 DEFINE p_emonth        LIKE type_t.num5
 DEFINE p_glfc001       LIKE glfc_t.glfc001
 DEFINE p_glfc002       LIKE glfc_t.glfc002
 DEFINE p_glfc003       LIKE glfc_t.glfc003
 DEFINE p_glfc004       LIKE glfc_t.glfc004
 DEFINE p_glfc005       LIKE glfc_t.glfc005
 DEFINE p_glfc006       LIKE glfc_t.glfc006
 DEFINE p_glfc007       LIKE glfc_t.glfc007
 DEFINE p_glfc008       LIKE glfc_t.glfc008
 DEFINE p_glfc010       LIKE glfc_t.glfc010
 DEFINE p_wc            STRING
 DEFINE p_stus          LIKE type_t.chr1
 DEFINE r_success       LIKE type_t.num5
 DEFINE r_amount        LIKE type_t.num20_6
 DEFINE l_sql           STRING
 DEFINE l_field         LIKE type_t.chr100
 DEFINE l_glaa004       LIKE glaa_t.glaa004
 DEFINE l_glac008       LIKE glac_t.glac008
 DEFINE l_wc            STRING
 DEFINE l_field1        STRING
 DEFINE l_field2        STRING
 DEFINE l_field3        STRING
 DEFINE l_field4        STRING
 DEFINE l_field5        STRING
 DEFINE l_sum_str       STRING #160526-00035#1 add
 DEFINE l_diff          LIKE type_t.num20_6     #170418-00002#1 add  
 DEFINE l_diff2         LIKE type_t.num20_6     #170418-00002#1 add 
 #170623-00034#6---add---start---
 DEFINE l_bmonth        LIKE type_t.num5        
 DEFINE l_success       LIKE type_t.num5        
 DEFINE l_glaa003       LIKE glaa_t.glaa003     
 DEFINE l_last_yy       LIKE type_t.num5        
 DEFINE l_last_mm       LIKE type_t.num5        
 #170623-00034#6---add---end---
   
   # p_stus  1  記帳幣   本位幣一
   #         2  功能幣   本位幣二
   #         3  報告幣   本位幣三
   
   LET r_success = TRUE
   LET l_field = ''
   LET r_amount = 0
   LET l_glac008 = ''
#170510-00043#2--mark--str--
#   LET l_sql ="  SELECT DISTINCT glaa004  FROM glaa_t WHERE glaaent = '",g_enterprise,"'",
#              "  AND glaald IN ('",p_ld,"') "
#   PREPARE glaa004_1_pre02 FROM l_sql
#   EXECUTE glaa004_1_pre02 INTO l_glaa004     
#170510-00043#2--mark--end
   
   #抓取起始科目的正常餘額形態
#170510-00043#2--mod--str--
#   SELECT glac008 INTO l_glac008
#     FROM glac_t
#    WHERE glacent = g_enterprise
#      AND glac001 = l_glaa004
#      AND glac002 = p_glfc003
   EXECUTE glac008_pre USING p_glfc003 INTO l_glac008 
#170510-00043#2--mod--end   
   IF cl_null(p_glfc004) THEN 
      LET p_glfc004 = p_glfc003
   END IF
   IF cl_null(p_stus)THEN LET p_stus = '1' END IF
   CASE  p_stus
      WHEN 1 
         #記帳幣
         LET l_field1 = " SELECT SUM(glea008 - glea009) "
         LET l_field2 = " SELECT SUM(glea008) "
         LET l_field3 = " SELECT SUM(glea009) "
         LET l_field4 = " SUM(glea008-glea009) " #160526-00035#1 add
         LET l_field5 = " SUM(glea009-glea008) " #160526-00035#1 add
      WHEN 2           
         LET l_field1 = " SELECT SUM(glea027 - glea028)"
         LET l_field2 = " SELECT SUM(glea027) "
         LET l_field3 = " SELECT SUM(glea028) "
         LET l_field4 = " SELECT SUM(glea027-glea028) " #160526-00035#1 add
         LET l_field5 = " SELECT SUM(glea028-glea027) " #160526-00035#1 add
     WHEN 3               
        LET l_field1 =  " SELECT SUM(glea030 - glea031)"
        LET l_field2 =  " SELECT SUM(glea030) "
        LET l_field3 =  " SELECT SUM(glea031) "
        LET l_field4 =  " SELECT SUM(glea030-glea031) " #160526-00035#1 add
        LET l_field5 =  " SELECT SUM(glea031-glea030) " #160526-00035#1 add
   END CASE      

   #170623-00034#---add--start
   IF p_glfc008 MATCHES '[123]' THEN       #期初資料
      #取得會計週期參照表
      LET l_glaa003 = ''
      CALL s_ld_sel_glaa(p_ld,'glaa003') RETURNING  l_success,l_glaa003
      
      #取得去年期末
      CALL s_fin_date_get_last_period(l_glaa003,p_ld,p_year,'1')
            RETURNING l_success,l_last_yy,l_last_mm
   END IF
   #170623-00034#6---add--end
   
   #取值方式
   CASE p_glfc008 
      WHEN '1'   #期初餘額
         #LET l_sql = "SELECT SUM(glea008 - glea009) ",
         LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                    #"   AND glea003 = ",p_year,         #170623-00034#6 mark
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         #170623-00034#6---mark---start---            
         #IF p_bmonth=0 THEN
         #   LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
         #ELSE
         #   LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
         #END IF
         #170623-00034#6---mark---end---
         #170623-00034#6---add--start
         IF g_prog MATCHES 'aglq938*' THEN
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
         #170623-00034#6---add--end
      WHEN '2'  #期初餘額在借方
         #LET l_sql = "SELECT SUM(glea008) ",
#         LET l_sql = l_field2 CLIPPED,  #160526-00035#1 mark
         LET l_sql =                     #160526-00035#1 add
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                    #"   AND glea003 = ",p_year,            #170623-00034#6 mark
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         #170623-00034#6---mark---start---            
         #IF p_bmonth=0 THEN
         #   LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
         #ELSE
         #   LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
         #END IF
         #170623-00034#6---mark---end---
         #170623-00034#6---add--start
         IF g_prog MATCHES 'aglq938*' THEN
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
         #170623-00034#6---add--end
         
      WHEN '3'  #期初餘額在貸方
         # LET l_sql = "SELECT SUM(glea009) ",
#          LET l_sql = l_field3 CLIPPED, #160526-00035#1 mark
          LET l_sql =                    #160526-00035#1 add
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                    #"   AND glea003 = ",p_year,                 #170623-00034#6 mark
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         #170623-00034#6---mark---start---            
         #IF p_bmonth=0 THEN
         #   LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
         #ELSE
         #   LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
         #END IF
         #170623-00034#6---mark---end---
         #170623-00034#6---add--start
         IF g_prog MATCHES 'aglq938*' THEN
            LET l_sql=l_sql,"   AND glea003 = ",l_last_yy
            LET l_sql=l_sql,"   AND glea004 = ",l_last_mm
         ELSE
            LET l_sql=l_sql,"   AND glea003 = ",p_year
            IF p_bmonth=0 THEN
               LET l_sql=l_sql,"   AND glea004 = ",p_bmonth
            ELSE
               LET l_sql=l_sql,"   AND glea004 < ",p_bmonth
            END IF
         END IF
         #170623-00034#6---add--end
               
      WHEN '4'  #本期借方
          #LET l_sql = "SELECT SUM(glea008) ",
          LET l_sql = l_field2 CLIPPED, 
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,               
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
      
      WHEN '5'  #本期貸方
         #LET l_sql = "SELECT SUM(glea009) ",
          LET l_sql = l_field3 CLIPPED, 
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '6'  #本期發生額
          #LET l_sql = "SELECT SUM(glea008 - glea009) ",
          LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                     "   AND glea004 BETWEEN ",p_bmonth," AND ",p_emonth,
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
                     
      WHEN '7'  #期末餘額
          #LET l_sql = "SELECT SUM(glea008 - glea009) ",
          LET l_sql = l_field1 CLIPPED,
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                    #"   AND glea004 < =  ",p_emonth,   #170623-00034#6 mark
                     "   AND glea004 =  ",p_emonth,     #170623-00034#6 add
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
         
      WHEN '8'  #期末餘額在借方
          #LET l_sql = "SELECT SUM(glea008) ",
#           LET l_sql = l_field2 CLIPPED, #160526-00035#1 mark
          LET l_sql =                     #160526-00035#1 add
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                    #"   AND glea004 < =  ",p_emonth,   #170623-00034#6 mark
                     "   AND glea004 =  ",p_emonth,     #170623-00034#6 add
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
         
      WHEN '9'  #期末餘額在貸方
          #LET l_sql = "SELECT SUM(glea009) ",
#           LET l_sql = l_field3 CLIPPED, #160526-00035#1 mark
          LET l_sql =                     #160526-00035#1 add
                     "  FROM glea_t ",
                     " WHERE gleaent = '",g_enterprise,"'",
                     "   AND gleald IN ('",p_ld,"') ",
                     "   AND glea003 = ",p_year,
                    #"   AND glea004 < =  ",p_emonth,   #170623-00034#6 mark
                     "   AND glea004 =  ",p_emonth,     #170623-00034#6 add
                     "   AND glea005 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'"
        
   END CASE 


   #選定核算項
   CASE p_glfc005
      WHEN '1'   #營運據點
         LET l_field = 'glea012'
      WHEN '2'   #部門
         LET l_field = 'glea013'
      WHEN '3'   #利潤/成本中心
         LET l_field = 'glea014'
      WHEN '4'   #區域
         LET l_field = 'glea015'
      WHEN '5'   #交易客商
         LET l_field = 'glea016'
      WHEN '6'   #帳款客商
         LET l_field = 'glea017'
      WHEN '7'   #客群
         LET l_field = 'glea018'
      WHEN '8'   #產品類別
         LET l_field = 'glea019'
      WHEN '9'   #經營方式
         LET l_field = 'glea020'
      WHEN '10'   #渠道
         LET l_field = 'glea021'
      WHEN '11'   #品牌
         LET l_field = 'glea022'
      WHEN '12'   #人員
         LET l_field = 'glea023'
      WHEN '13'  #專案編號
         LET l_field = 'glea024'
      WHEN '14'  #WBS
         LET l_field = 'glea024'      
      OTHERWISE
         LET l_field = ''
   END CASE

  
   LET l_sql = l_sql," AND glea005 IN (SELECT glac002 FROM glac_t ",
                     "                  WHERE glac002 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"'",
                     "                    AND glac003 <> '1'  AND glac001 = '",p_glfc002,"')"
   IF NOT cl_null(p_wc) THEN
      LET l_wc=cl_replace_str(p_wc,"glar001","glea005")
      LET l_wc=cl_replace_str(l_wc,"glar012","glea012")
      LET l_wc=cl_replace_str(l_wc,'glar013','glea013')
      LET l_wc=cl_replace_str(l_wc,'glar014','glea014')
      LET l_wc=cl_replace_str(l_wc,'glar015','glea015')
      LET l_wc=cl_replace_str(l_wc,'glar016','glea016')
      LET l_wc=cl_replace_str(l_wc,'glar017','glea017')
      LET l_wc=cl_replace_str(l_wc,'glar018','glea018')
      LET l_wc=cl_replace_str(l_wc,'glar019','glea019')
      LET l_wc=cl_replace_str(l_wc,'glar051','glea020')
      LET l_wc=cl_replace_str(l_wc,'glar052','glea021')
      LET l_wc=cl_replace_str(l_wc,'glar053','glea022')
      LET l_wc=cl_replace_str(l_wc,'glar020','glea023')
      LET l_wc=cl_replace_str(l_wc,'glar022','glea024')
      LET l_wc=cl_replace_str(l_wc,'glar023','glea025')
      LET l_sql = l_sql," AND ",l_wc
   END IF
   
   #核算项范围条件
   IF NOT cl_null(l_field) THEN       
      IF NOT cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc007,"'"
      END IF
      
      IF NOT cl_null(p_glfc006) AND cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc006,"' AND '",p_glfc006,"'"
      END IF
      IF cl_null(p_glfc006) AND NOT cl_null(p_glfc007) THEN 
         LET l_sql = l_sql," AND ",l_field," BETWEEN '",p_glfc007,"' AND '",p_glfc007,"'"
      END IF
   END IF
   
   #額外條件
   IF NOT cl_null(p_glfc010) THEN 
      LET l_sql = l_sql," AND ",p_glfc010
   END IF
   
   #160526-00035#1--add--str--
   IF p_glfc008='2' OR p_glfc008='3' OR p_glfc008='8' OR p_glfc008='9' THEN
      IF cl_null(l_field) THEN
         LET l_field="''"
      END IF
      IF p_glfc008='2' OR p_glfc008='8' THEN
         LET l_sum_str=l_field4 #借-贷
      ELSE
         LET l_sum_str=l_field5 #贷-借
      END IF
      LET l_sql="SELECT sum(amt) ",
                "  FROM (",
                "        SELECT glea005,",l_field,",",l_sum_str," amt ",l_sql,
                "         GROUP BY glea005,",l_field,
                "         HAVING ",l_sum_str,">0 ",
                "       )"
   END IF
   #160526-00035#1--add--end
   
   PREPARE glat_pre02 FROM l_sql
   EXECUTE glat_pre02 INTO r_amount
   

   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = p_glfc001
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   #170418-00002#1---add---start---
  #IF g_prog = 'aglq938' THEN          #170623-00034#6 mark
   IF g_prog MATCHES 'aglq938*' THEN   #170623-00034#6 add
      LET l_diff = 0
      LET l_sql = "SELECT SUM(gldq017-gldq018) FROM gldp_t,gldq_t ",
                  "WHERE gldpent = gldqent AND gldpdocno = gldqdocno ",
                  "  AND gldpent = ",g_enterprise," AND gldpstus = 'Y' ",
                  "  AND gldpld IN ('",p_ld,"') AND gldp001 IN (SELECT gldc002 FROM gldc_t WHERE gldcent = ",g_enterprise,
                  "  AND gldcld IN ('",p_ld,"') AND gldc005 = 'Y') ",                  
                  "  AND gldp003 = ",p_year," AND gldp004 = ",p_emonth,
                  "  AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' AND gldp005='4'"
      PREPARE gldq_diff FROM l_sql
      EXECUTE gldq_diff INTO l_diff      
      IF cl_null(l_diff) THEN LET l_diff = 0 END IF
      LET l_diff2 = 0
      LET l_sql = "SELECT SUM(gldq017-gldq018) FROM gldp_t,gldq_t",
                  " WHERE gldpent = gldqent AND gldpdocno = gldqdocno ",
                  "   AND gldpent = ",g_enterprise," AND gldpstus = 'Y'",
                  "   AND gldpld IN ('",p_ld,"') AND gldp001 IN (SELECT gldc002 FROM gldc_t WHERE gldcent =  ",g_enterprise,
                  "   AND gldcld IN ('",p_ld,"') AND gldc005 = 'Y') ",
                  "   AND gldp003 = ",p_year," AND gldp004 = ",p_emonth,
                  "   AND gldq001 BETWEEN '",p_glfc003,"' AND '",p_glfc004,"' AND gldp005='1' AND gldp006 = 'W' "
      PREPARE gldq_diff2 FROM l_sql
      EXECUTE gldq_diff2 INTO l_diff2      
      IF cl_null(l_diff2) THEN LET l_diff2 = 0 END IF
      LET r_amount = r_amount - l_diff - l_diff2
    END IF
   #170418-00002#1---add---end---
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   IF p_glfc008 = '1' OR p_glfc008 = '6' OR p_glfc008 = '7' THEN   #1:期初餘額 6:本期發生額 7:期末餘額
      IF l_glac008 = '2' THEN   #貸余
         LET r_amount = r_amount * -1
      END IF
   END IF
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 解析报表设置的公式
# Memo...........: #151201-00004#3
#                : 用于agli075设置公式解析
# Usage..........: CALL s_analy_form_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa009,p_glfa008,p_glfa001,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfa009   小數位數
#                : p_glfa008   金額單位
#                : p_glfa001   報表模板編號
#                : p_str       公式
#                : p_wc        筛选条件
#                : p_show_ad   含審計調整傳票否 
#                : p_stus      傳票狀態
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2016/04/14 By 02599
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_analy_form_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa009,p_glfa008,p_glfa001,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add   
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE p_str           STRING
   DEFINE p_wc            STRING    #查询条件
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_success       LIKE type_t.num5  
   DEFINE l_left          LIKE type_t.chr1
   DEFINE l_right         LIKE type_t.chr1
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---   
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_amount = 0
   
   #170816-00007#159 mark by 10043 --(s)
   #IF cl_null(p_ld) AND cl_null(p_year) AND cl_null(p_bmonth) AND cl_null(p_emonth) AND cl_null(p_glfa001) AND cl_null(p_str) THEN 
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'sub-268'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = TRUE
   #   CALL cl_err()
   #   LET r_success = FALSE
   #   RETURN r_success,r_amount
   #END IF
   #170816-00007#159 mark by 10043 --(e)
   #170816-00007#159 add by 10043 --(s)
   #修改錯誤訊息報錯內容
   LET g_msg = ''
   LET g_colname_1 = ''
   LET g_comment_1 = ''
   IF cl_null(p_ld) THEN
      LET g_colname_1 = cl_getmsg("axc-00585",g_dlang)  #帳別
      LET g_msg = g_colname_1   
   END IF      
   IF cl_null(p_year) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("agl-00274",g_dlang)  #年
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_bmonth) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-00794",g_dlang)  #起始期別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_emonth) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("sub-00795",g_dlang)  #截止期別
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_glfa001) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      CALL s_azzi902_get_gzzd("abgq050","lbl_glfa001") RETURNING g_colname_1,g_comment_1  #報表模版編號
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF
   IF cl_null(p_str) THEN
      LET g_colname_1 = ''
      LET g_comment_1 = ''   
      LET g_colname_1 = cl_getmsg("lib-00362",g_dlang)   #公式
      IF g_msg IS NULL THEN   
         LET g_msg = g_colname_1   
      ELSE   
         LET g_msg = g_msg,",",g_colname_1
      END IF        
   END IF     
   IF NOT cl_null(g_msg) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00788'  #%1傳入值為空(錯誤)
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_msg 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF   
   #170816-00007#159 add by 10043 --(e) 
   #去掉公式左右兩邊的空格
   LET p_str = p_str.trim()
   
   LET g_str = p_str
   
   #报表模板类型
   SELECT glfa002 INTO g_glfa002 FROM glfa_t
   WHERE glfaent=g_enterprise AND glfa001=p_glfa001
   
   #1）将公式逐层解析，直到公式中的表内项目全部变成总账变量
   CALL s_analy_form_get_coordinate_2(p_glfa001,p_str)
   RETURNING l_success,p_str  
   IF l_success = FALSE THEN
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   #2）将解析的公式计算金额
   #CALL s_analy_form_formula_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus)                     #170222-00003#1 mark
   CALL s_analy_form_formula_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)  #170222-00003#1 add
   RETURNING l_success,r_amount  
   
   IF l_success = FALSE THEN
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 逐层解析公式，直至公式中的表内项目全部被替换
# Memo...........: #151201-00004#3
# Usage..........: CALL s_analy_form_get_coordinate_2(p_glfa001,p_str)
#                  RETURNING r_success,r_amount
# Input parameter: p_glfa001   報表模板編號
#                : p_str       公式、座標
# Return code....: r_success   檢核狀態
#                : r_str       金額
# Date & Author..: 2016/04/14 By 02599
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_coordinate_2(p_glfa001,p_str)
  DEFINE p_str           STRING
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE l_delimiter1    STRING   #分隔符
   DEFINE l_delimiter2    STRING   #分隔符
   DEFINE l_operator      DYNAMIC ARRAY OF RECORD  #存儲運算符
                    symbol  LIKE type_t.chr80
                          END RECORD  
   DEFINE l_str           STRING
   DEFINE l_str1          LIKE type_t.chr100
   DEFINE l_str2          LIKE type_t.chr1
   DEFINE l_str3          STRING
   DEFINE l_sql           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_j             LIKE type_t.num5
   DEFINE l_glfb004       LIKE glfb_t.glfb004
   DEFINE l_glfb005       LIKE glfb_t.glfb005
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_flag          LIKE type_t.num5
   DEFINE l_success       LIKE type_t.num5
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE r_str           STRING
   DEFINE l_chr1          LIKE type_t.chr1
   DEFINE l_str4           STRING
            
   LET r_success = TRUE
   LET r_amount = 0
   
   #將公式一直解析到全部是變量再算金額
   LET l_flag = TRUE
   WHILE l_flag 
      LET l_flag = FALSE
      LET l_str = ''
      LET l_str1 = ''
      LET l_str2 = ''
      CALL l_operator.clear()
      #抓取第一位字符是變量還是"("
      LET l_str2 = p_str.substring(1,1)
      
      LET l_delimiter1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #字母數字當做分隔符
      LET l_delimiter2 = "+-*/()"                                  #運算符、括號作為分隔符
      LET tok5 = base.StringTokenizer.create(p_str,l_delimiter2)   #運算符、括號作為分隔符,取出字母數字   
      LET tok6 = base.StringTokenizer.create(p_str,l_delimiter1)   #字母數字當做分隔符,取出運算符、括號
      
      #將公式里的運算符存放到數組里
      LET l_i = 1
      WHILE tok6.hasMoreTokens()
        LET l_str3 = tok6.nextToken()
        LET l_str3 = l_str3.trim()
        LET l_operator[l_i].symbol = l_str3
        IF cl_null(l_operator[l_i].symbol) THEN   #去除掉空格
           CALL l_operator.deleteElement(l_i)
        ELSE
           LET l_i = l_i + 1
        END IF
      END WHILE
      CALL l_operator.deleteElement(l_i)
      LET l_i = l_i - 1
      
   
      #取出每個座標到財務報表結構設置作業(agli070)抓取公式
      LET l_j = 1
      WHILE tok5.hasMoreTokens() 
        LET l_str1 = tok5.nextToken()
        #去除掉空格
        IF cl_null(l_str1) THEN 
           CONTINUE WHILE
        END IF
        #抓取第一个字母，判断变量类型
        LET l_str4 = l_str1
        LET l_str4 = l_str4.trim()
        LET l_chr1 = l_str4.substring(1,1)
        IF l_chr1 NOT MATCHES '[IVN]' THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = 'sub-00758'
           LET g_errparam.extend = l_str1
           LET g_errparam.popup = TRUE
           CALL cl_err()
           LET r_success = FALSE
           CONTINUE WHILE
        END IF
        
        #I表內項目
        IF l_chr1='I' THEN
           #根據座標抓取公式
           CALL s_analy_form_get_formula_2(p_glfa001,l_str1) RETURNING l_glfb005 
           IF cl_null(l_glfb005) THEN
              LET l_glfb005 = 0
           END IF
           
           #如果下层公式还是坐标，接着往下解析
           LET l_str4 = l_glfb005
           LET l_str4 = l_str4.trim()
           LET l_chr1 = l_str4.substring(1,1)
           IF l_chr1 = 'I' THEN
              LET l_flag = TRUE
           END IF
        ELSE
           #V總帳變量  #N数值
           LET l_glfb005 = l_str1
        END IF
        
        #防止有乘除的運算，先把公式用括號括起來
        IF l_operator[l_j].symbol = '*' OR l_operator[l_j].symbol = '/' THEN 
           LET l_glfb005 = "(" CLIPPED,l_glfb005 CLIPPED,")" CLIPPED
        END IF
        
        #前一个运算符是乘、除、减,把后面的公式用括号括起来
        IF l_j > 1 THEN 
           IF l_operator[l_j-1].symbol = '*' OR l_operator[l_j-1].symbol = '/' OR l_operator[l_j-1].symbol = '-' THEN 
              LET l_glfb005 = "(" CLIPPED,l_glfb005 CLIPPED,")" CLIPPED
           END IF
        END IF

        IF l_str2 = '(' THEN 
           IF cl_null(l_str) THEN
              LET l_str = l_operator[l_j].symbol CLIPPED,l_glfb005 CLIPPED
           ELSE
              LET l_str = l_str CLIPPED,l_operator[l_j].symbol CLIPPED,l_glfb005 CLIPPED
           END IF
        ELSE
           IF cl_null(l_str) THEN
              LET l_str = l_glfb005 CLIPPED,l_operator[l_j].symbol CLIPPED
           ELSE
              LET l_str = l_str CLIPPED, l_glfb005 CLIPPED,l_operator[l_j].symbol CLIPPED
           END IF
        END IF
        LET l_j = l_j + 1
      END WHILE 
      
      #如果運算符比變量多一位，遍歷變量時會少加最後一位運算符
      IF l_i = l_j THEN 
         LET l_str = l_str CLIPPED, l_operator[l_j].symbol CLIPPED
      END IF
      
      LET p_str = l_str    
   END WHILE      
   
   LET r_str = l_str
   RETURN r_success,r_str
END FUNCTION

################################################################################
# Descriptions...: 通過座標獲取公式
# Memo...........: #151201-00004#3
# Usage..........: CALL s_analy_form_get_formula_2(p_glfa001,p_glfb005)
#                  RETURNING r_glfb005
# Input parameter: p_glfa001      報表模板編號
#                : p_glfb005      座標
# Return code....: r_glfb005      公式
# Date & Author..: 2016/04/14 By 02599
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_get_formula_2(p_glfa001,p_glfb005)
   DEFINE p_glfa001          LIKE glfa_t.glfa001
   DEFINE p_glfb005          LIKE glfb_t.glfb005
   DEFINE l_coordinate       STRING
   DEFINE l_glfbseq          LIKE type_t.chr1000  #行次
   DEFINE l_glfbseq1         LIKE type_t.chr1000  #列次
   DEFINE r_glfb005          LIKE glfb_t.glfb005
   
   LET l_coordinate = p_glfb005   
    
   LET l_coordinate = l_coordinate.trim() 
   #將座標解析成行、列
   LET l_glfbseq  = l_coordinate.substring(3,l_coordinate.getLength())  #行次
   LET l_glfbseq1 = l_coordinate.substring(2,2)  #列次   

   LET r_glfb005 = ''
   
   #先根据坐标抓取數公式來源和公式
   SELECT glfb005 INTO r_glfb005 
     FROM glfb_t
    WHERE glfbent = g_enterprise
      AND glfb001 = p_glfa001
      AND glfbseq = l_glfbseq
      AND glfbseq1 = l_glfbseq1
   #160506-00012#1--add--str--
   IF SQLCA.sqlcode = 100 THEN
      LET r_glfb005 = 0
   END IF
   IF r_glfb005 IS NULL THEN
      LET r_glfb005 = 0
   END IF
   #160506-00012#1--add--end   
   RETURN r_glfb005
END FUNCTION

################################################################################
# Descriptions...: 解析公式
# Memo...........: #151201-00004#3
# Usage..........: CALL s_analy_form_formula_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
#                  RETURNING r_success,r_amount
# Input parameter: p_ld        帳別
#                : p_year      年度
#                : p_bmonth    起始期別
#                : p_emonth    截止期別
#                : p_glfa001   報表模板編號
#                : p_glfa009   小數位數
#                : p_glfa008   金額單位
#                : p_str       公式
#                : p_wc        筛选条件
#                : p_show_ad   含審計調整傳票否
#                : p_stus      傳票狀態
#                : p_show_ce   含月结传票否 #170222-00003#1 add
#                : p_show_ye   含年结传票否 #170222-00003#1 add 
# Return code....: r_success   檢核狀態
#                : r_amount    金額
# Date & Author..: 2016/04/14 By 02599
# Modify.........: 
################################################################################
PUBLIC FUNCTION s_analy_form_formula_2(p_ld,p_year,p_bmonth,p_emonth,p_glfa001,p_glfa009,p_glfa008,p_str,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)
   #DEFINE p_ld            LIKE type_t.chr50   #存放帳套字符串   #170104-00043#1 mark
   DEFINE p_ld            STRING                                #170104-00043#1 add
   DEFINE p_year          LIKE type_t.num5
   DEFINE p_bmonth        LIKE type_t.num5
   DEFINE p_emonth        LIKE type_t.num5
   DEFINE p_glfa001       LIKE glfa_t.glfa001
   DEFINE p_glfa009       LIKE glfa_t.glfa009
   DEFINE p_glfa008       LIKE glfa_t.glfa008
   DEFINE p_str           STRING
   DEFINE p_wc            STRING    #筛选条件
   DEFINE p_show_ad       LIKE type_t.chr1
   DEFINE p_stus          LIKE type_t.chr1 
   DEFINE r_success       LIKE type_t.num5
   DEFINE r_amount        LIKE glar_t.glar005
   DEFINE l_str           STRING
   DEFINE l_str1          LIKE type_t.chr100
   DEFINE l_str2          LIKE type_t.chr1
   DEFINE l_str3          STRING
   DEFINE l_str4          STRING    
   DEFINE l_sql           STRING
   DEFINE l_i             LIKE type_t.num5
   DEFINE l_j             LIKE type_t.num5
   DEFINE l_amt           LIKE glar_t.glar005
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_delimiter1    STRING   #分隔符
   DEFINE l_delimiter2    STRING   #分隔符
   DEFINE l_operator      DYNAMIC ARRAY OF RECORD  #存儲運算符
                    symbol  LIKE type_t.chr80
                          END RECORD  
   DEFINE l_chr1          LIKE type_t.chr1
   #170222-00003#1 add s---
   DEFINE p_show_ce       LIKE type_t.chr1
   DEFINE p_show_ye       LIKE type_t.chr1
   #170222-00003#1 add e---   
   
   LET r_success = TRUE
   LET r_amount = 0
   
   #去掉公式左右兩邊的空格
   LET p_str = p_str.trim()
   
   LET l_str  = ''
   LET l_str1 = ''
   LET l_str2 = ''
   CALL l_operator.clear()
   
   #抓取第一位字符是變量還是"("
   LET l_str2 = p_str.substring(1,1) 
    
   LET l_delimiter1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"   #字母數字當做分隔符
   LET l_delimiter2 = "+-*/()"                                                 #運算符、括號作為分隔符
   LET tok3 = base.StringTokenizer.create(p_str,l_delimiter2)   #運算符、括號作為分隔符,取出字母數字   
   LET tok4 = base.StringTokenizer.create(p_str,l_delimiter1)  #字母數字當做分隔符,取出運算符、括號
   
   #將公式里的運算符存放到數組里
   LET l_i = 1
   WHILE tok4.hasMoreTokens()
     LET l_str3 = tok4.nextToken()
     LET l_str3 = l_str3.trim()
     LET l_operator[l_i].symbol = l_str3
     IF cl_null(l_operator[l_i].symbol) THEN  #去除掉空格
        CALL l_operator.deleteElement(l_i)
     ELSE
        LET l_i = l_i + 1
     END IF
   END WHILE
   CALL l_operator.deleteElement(l_i)
   LET l_i = l_i - 1
   
   #定义SQL申请
   CALL s_analy_form_def_cursor(p_ld,p_year,p_bmonth,p_emonth,p_show_ce) #170510-00043#2 add
   
   #取出每個變量到變量設置作業(agli201)抓取金額,然後再重組公式算出最後金額
   LET l_j = 1
   WHILE tok3.hasMoreTokens()
     LET l_str1 = tok3.nextToken()
     
     #去除掉空格
     IF cl_null(l_str1) THEN 
        CONTINUE WHILE
     END IF
     #抓取第一个字母，判断变量类型
     LET l_str4 = l_str1
     LET l_str4 = l_str4.trim()
     LET l_chr1 = l_str4.substring(1,1)
#160506-00012#1--mark--str--
#     #抓取变量
#     LET l_str4 = l_str4.substring(2,l_str4.getLength()) 
#     LET l_str1 = l_str4
#160506-00012#1--mark--end
     #当为总账变量时计算金额
     IF l_chr1 = 'V' THEN#抓取变量
        #160506-00012#1--add--str--
        #抓取变量
        LET l_str4 = l_str4.substring(2,l_str4.getLength()) 
        LET l_str1 = l_str4
        #160506-00012#1--add--end
        LET l_amt = 0  
        CALL s_analy_form_get_glfc(p_ld,p_year,p_bmonth,p_emonth,l_str1,p_wc,p_show_ad,p_stus,p_show_ce,p_show_ye)  #170222-00003#1 add ,p_show_ce,p_show_ye
        RETURNING l_success,l_amt
        IF l_success = FALSE THEN
           LET r_success = FALSE
           RETURN r_success,r_amount
        END IF
     ELSE
        #N数值
        IF l_chr1='N' THEN
           LET l_str1=l_str4.substring(2,l_str4.getLength())
           LET l_sql = "SELECT ",l_str1 CLIPPED," FROM DUAL"
           PREPARE l_sql_pre_3 FROM l_sql
           EXECUTE l_sql_pre_3 INTO l_amt
           IF cl_null(l_amt) THEN LET l_amt=0 END IF
        ELSE
           LET l_amt = l_str1
        END IF
     END IF

     IF l_str2 = '(' THEN     
        IF cl_null(l_str) THEN
           LET l_str = l_operator[l_j].symbol CLIPPED,l_amt CLIPPED
        ELSE
           LET l_str = l_str CLIPPED,l_operator[l_j].symbol CLIPPED,l_amt CLIPPED
        END IF
     ELSE
        IF cl_null(l_str) THEN
           LET l_str = l_amt CLIPPED,l_operator[l_j].symbol CLIPPED
        ELSE
           LET l_str = l_str CLIPPED, l_amt CLIPPED,l_operator[l_j].symbol CLIPPED
        END IF
     END IF
     LET l_j = l_j + 1
   END WHILE
   
   #如果運算符比變量多一位，遍歷變量時會少加最後一位運算符
   IF l_i = l_j THEN 
      LET l_str = l_str CLIPPED, l_operator[l_j].symbol CLIPPED
   END IF
   
   IF cl_null(l_str) THEN 
      RETURN r_success,r_amount
   END IF
   
   LET l_sql = "SELECT ",l_str CLIPPED," FROM DUAL"
   PREPARE l_sql_pre_2 FROM l_sql
   EXECUTE l_sql_pre_2 INTO r_amount
   
   #除數不可為0
   IF SQLCA.sqlerrd[2] = -1476 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'agl-00237'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00559'
      LET g_errparam.extend = l_str
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_amount
   END IF
   
   IF cl_null(r_amount) THEN 
      LET r_amount = 0
   END IF
   
   #小數取位
   CALL s_num_round('1',r_amount,p_glfa009) RETURNING r_amount
   
   #根據金額單位對金額進行處理
   CASE p_glfa008
      WHEN '1'  #元
         LET r_amount = r_amount
      WHEN '2'  #千
         LET r_amount = r_amount / 1000
      WHEN '3'  #萬
         LET r_amount = r_amount / 10000
      OTHERWISE
         LET r_amount = r_amount
   END CASE
   
   RETURN r_success,r_amount
END FUNCTION

################################################################################
# Descriptions...: 設定外接參數/資料
# Memo...........:
# Usage..........: CALL s_analy_form_argv(p_feld,p_init)
# Input parameter: p_feld         預計給資料的欄位
# Return code....: p_init         預設資料
# Date & Author..: 170623-00034#1 170710 By JIE
# Modify.........:
################################################################################
PUBLIC FUNCTION s_analy_form_argv(p_feld,p_init)
   DEFINE p_feld      STRING        #欄位
   DEFINE p_init      STRING        #資料
   
   CASE
      WHEN p_feld = 'clear'        INITIALIZE g_fun_argv TO NULL
      WHEN p_feld = 'glfa001'      LET g_fun_argv.glfa001 = p_init   #報表模板
      WHEN p_feld = 'glfbl004'     LET g_fun_argv.glfbl004= p_init   #項目
      WHEN p_feld = 'glfb003'      LET g_fun_argv.glfb003 = p_init   #報表行序
   END CASE
END FUNCTION

 
{</section>}
 
