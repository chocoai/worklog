#該程式未解開Section, 採用最新樣板產出!
#該程式為freestyle程式!
{<section id="s_ainp100.description" type="s" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0015(1900-01-01 00:00:00), PR版次:0015(2017-11-09 15:33:09)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000173
#+ Filename...: s_ainp100
#+ Description: 庫存月結計算作業相關元件
#+ Creator....: 02294(2016-08-10 16:38:51)
#+ Modifier...: 00000 -SD/PR- 01534
 
{</section>}
 
{<section id="s_ainp100.global" type="s" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#160810-00031#1  2016/08/10 By lixiang  将ainp100中的ainp100_process的处理逻辑段独立到元件中
#161107-00010#2  2016/11/07 By 02295    效能优化
#161201-00023#1  2016/12/01 By 02295    庫存計算需逐筆取位
#161212-00017#1  2016/12/13 By 02295     小数取位调整
#161207-00047#1  2016/12/14 By 02295    效能优化（服务追单只需追此单，此单上面单据无需追单）
#161207-00047#2  2016/12/15 By 02295    去掉画面上的上期年度和上期期别，抓取inaj_t时直接计算所有inaj_t的数据
#161220-00034#1  2016/12/15 By 02295    还原#161207-00047#2这个单的处理逻辑
#170221-00040#1  2016/02/21 By lixh     ainp100 新增自动产生inag_t 功能
#170217-00025#8  2017/03/07 By zhujing  整批调整未产生数据时，提示消息修正。
#170308-00016#1  2017/03/03 By Whitney  修正沒有更新inai
#170317-00039#1  2017/03/17 By lixiang  s_ainp100_process返回参数需一致的问题
#170414-00011#1  2017/04/14 By Whitney  已存在inag_t沒有對應的inaj_t要將數量update為0
#170428-00041#1  2017/05/09 By lixh     当单位是设置无条件进位时，出库时应先取位，再乘出入库码，再sum
#170913-00036#1  2017/09/13 By 00537    增加考虑inaj没有的时候，用inat去更新inag，原来是不更新inag
#171109-00022#1  2017/11/09 By 01534    QBE条件不输入或输入*，库存重计后inag008和SUM(inaj011)不一致
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
 
{<section id="s_ainp100.free_style_variable" type="s" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"

#end add-point
 
{</section>}
 
{<section id="s_ainp100.global_variable" type="s" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"
#160810-00031#1--s
DEFINE g_glaa003       LIKE glaa_t.glaa003
DEFINE g_inag          RECORD LIKE inag_t.*
DEFINE g_stagecomplete LIKE type_t.num10
DEFINE g_sql           STRING
#160810-00031#1--e
#end add-point
 
{</section>}
 
{<section id="s_ainp100.other_dialog" type="s" >}

 
{</section>}
 
{<section id="s_ainp100.other_function" readonly="Y" type="s" >}

################################################################################
# Descriptions...: 将ainp100中的ainp100_process的处理逻辑段独立到元件中
# Memo...........:
# Usage..........: CALL s_ainp100_process(p_year,p_month,p_wc)
# Date & Author..: 2016/08/10 By lixiang
# Modify.........: #160810-00031#1 add
# ...............: #161207-00047#2 年度月份p_year,p_month两个参数作废
# ...............: #161220-00034#1 还原#161207-00047#2的处理
################################################################################
PUBLIC FUNCTION s_ainp100_process(p_year,p_month,p_wc)
DEFINE p_year      LIKE type_t.num5  #年度   
DEFINE p_month     LIKE type_t.num5  #期別   
DEFINE ls_value    STRING
DEFINE l_bdate     LIKE type_t.dat
DEFINE l_edate     LIKE type_t.dat
DEFINE l_success   LIKE type_t.num5
DEFINE l_inat015   LIKE inat_t.inat015,
       l_inat021   LIKE inat_t.inat021,
       l_inaj004   LIKE inaj_t.inaj004,
       l_inaj011   LIKE inaj_t.inaj011,
       l_inaj013   LIKE inaj_t.inaj013,
       l_inaj027   LIKE inaj_t.inaj027,
       l_inai007   LIKE inai_t.inai007,
       l_inai008   LIKE inai_t.inai008,
       l_inau017   LIKE inau_t.inau017,
       l_inal014   LIKE inal_t.inal014,
       l_inal014_sum   LIKE inal_t.inal014,
       l_imaf071   LIKE imaf_t.imaf071,
       l_imaf081   LIKE imaf_t.imaf081,
       l_inag008   LIKE inag_t.inag008,
       l_inag025   LIKE inag_t.inag025,
       l_inai010   LIKE inai_t.inai010
DEFINE l_imaa006   LIKE imaa_t.imaa006   
DEFINE l_inaj046   LIKE inaj_t.inaj046
DEFINE l_inaj047   LIKE inaj_t.inaj047
DEFINE l_inaj048   LIKE inaj_t.inaj048
DEFINE l_inaj049   LIKE inaj_t.inaj049
DEFINE p_wc        STRING
DEFINE p_wc2       STRING   #170221-00040#1
DEFINE p_wc3       STRING   #171109-00022#1 add
#161107-00010#2---add---s
DEFINE l_inag032   LIKE inag_t.inag032
DEFINE l_inai001   LIKE inai_t.inai001,
       l_inai002   LIKE inai_t.inai002,
       l_inai003   LIKE inai_t.inai003,
       l_inai004   LIKE inai_t.inai004,
       l_inai005   LIKE inai_t.inai005,
       l_inai006   LIKE inai_t.inai006,
       l_inai009   LIKE inai_t.inai009
DEFINE r_flag      LIKE type_t.num5 #170217-00025#8 add
       
   WHENEVER ERROR CONTINUE
#161107-00010#2---add---s

   LET r_flag = TRUE   #170317-00039#1
   
    SELECT DISTINCT glaa003 INTO g_glaa003
     FROM glaa_t,ooef_t
    WHERE glaacomp = ooef017
      AND glaaent = ooefent
      AND ooefent = g_enterprise
      AND ooef001 = g_site
      AND glaa014 = 'Y'
      
   IF cl_null(g_glaa003) THEN
      #RETURN    #170317-00039#1
      RETURN r_flag   #170317-00039#1
   END IF      
   LET r_flag = FALSE   #170217-00025#8 add
   IF cl_null(p_wc) THEN
      LET p_wc = " 1=1"
   END IF
   #170221-00040#1-S
   IF NOT cl_null(p_wc) THEN 
      LET p_wc2 = cl_replace_str(p_wc,'inag001','inaj005')
      LET p_wc2 = cl_replace_str(p_wc2,'inag004','inaj008')
   END IF
   #170221-00040#1-E   
   
   #171109-00022#1-S
   IF NOT cl_null(p_wc) THEN
      LET p_wc3 = cl_replace_str(p_wc,'inag001','inat001')
      LET p_wc3 = cl_replace_str(p_wc3,'inag004','inat004')
   END IF   
   #171109-00022#1-E
   
   LET g_errshow = FALSE  #161201-00023#1
   
   ##抓取期別起迄日期
   #CALL s_fin_date_get_period_range(g_glaa003,p_year,p_month) RETURNING l_bdate,l_edate   #161207-00047#2 mark
   CALL s_fin_date_get_period_range(g_glaa003,p_year,p_month) RETURNING l_bdate,l_edate    #161220-00034#1
   
   #161207-00047#1---add---s
   #1.更新inaj_t中各单位之前的转换的分子分母
   #CALL s_ainp100_upd_inaj(p_wc,l_edate)   #161207-00047#2 mark
   #CALL s_ainp100_upd_inaj(p_wc)           #161207-00047#2 add  #161220-00034#1  mark
    #170217-00025#8 mod-S
#   CALL s_ainp100_upd_inaj(p_wc,l_edate)    #161220-00034#1
   CALL s_ainp100_upd_inaj(p_wc,l_edate) RETURNING r_flag
    #170217-00025#8 mod-E
   IF g_bgjob <> "Y" THEN
      LET ls_value = 'UPDATE inaj_t'
      CALL cl_progress_no_window_ing(ls_value)
   END IF 
   #2.更新inag008账面库存数量|inag025参考数量|inag033基础单位数量
   LET g_sql = " MERGE INTO inag_t A ",
               " USING ( ",
               " SELECT DISTINCT inajent,inajsite,inaj005,NVL(inaj006,' ') inaj006,NVL(inaj007,' ') inaj007,NVL(inaj008,' ') inaj008,NVL(inaj009,' ') inaj009,NVL(inaj010,' ') inaj010,",  #170221-00040#1 add inajent,inajsite,
               #inag008账面库存数量
               "        inaj045,imaf015,",           #170221-00040#1 add inaj027
               "        inaa008,inaa009,inaa010,",   #170221-00040#1 add
               "        SUM((CASE WHEN a.ooca004 = '1'  THEN round(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002)  ",
               "                  WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002),(2/power(10,a.ooca002)))=0 THEN round(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002) ",
               "                                                 ELSE round(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002)-(inaj004*1/power(10,a.ooca002)) ",
               "                                             END )",
               "                  WHEN a.ooca004 = '3'  THEN trunc(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002)",
               #"                  WHEN a.ooca004 = '4'  THEN ceil(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6)*power(10,a.ooca002))/power(10,a.ooca002) ",   #170428-00041#1 mark
               "                  WHEN a.ooca004 = '4'  THEN ceil(round(COALESCE(inaj011*inaj046/inaj047,0),6)*power(10,a.ooca002))/power(10,a.ooca002)*inaj004 ",    #170428-00041#1 add 
               "              END ))",
               "        inag008, ",
               #inag025参考数量               
               "        SUM((CASE WHEN b.ooca004 = '1'  THEN round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002)  ",
               "                  WHEN b.ooca004 = '2'  THEN (CASE WHEN MOD(round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002),(2/power(10,b.ooca002)))=0 THEN round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002) ",
               "                                                       ELSE round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002)-(inaj004*1/power(10,b.ooca002)) ",
               "                                             END )",
               "                  WHEN b.ooca004 = '3'  THEN trunc(round(COALESCE(inaj027*inaj004,0),6),b.ooca002)",
               #"                  WHEN b.ooca004 = '4'  THEN ceil(round(COALESCE(inaj027*inaj004,0),6)*power(10,b.ooca002))/power(10,b.ooca002) ",  #170428-00041#1 mark
               "                  WHEN b.ooca004 = '4'  THEN ceil(round(COALESCE(inaj027,0),6)*power(10,b.ooca002))/power(10,b.ooca002)*inaj004 ",   #170428-00041#1 add
               "              END ))",
               "         inag025,",
               #inag033基础单位数量 
               "        imaa006 inag032,",
               "        SUM((CASE WHEN c.ooca004 = '1'  THEN round(round(COALESCE(inaj011*inaj048/inaj049*inaj004,0),6),c.ooca002)  ",
               "                  WHEN c.ooca004 = '2'  THEN (CASE WHEN MOD(round(round(COALESCE(inaj011*inaj048/inaj049*inaj004,0),6),c.ooca002),(2/power(10,c.ooca002)))=0 THEN round(round(COALESCE(inaj011*inaj048/inaj049*inaj004,0),6),c.ooca002) ",
               "                                                 ELSE round(round(COALESCE(inaj011*inaj048/inaj049*inaj004,0),6),c.ooca002)-(inaj004*1/power(10,c.ooca002)) ",
               "                                             END )",
               "                  WHEN c.ooca004 = '3'  THEN trunc(round(COALESCE(inaj011*inaj048/inaj049*inaj004,0),6),c.ooca002)",
               #"                  WHEN c.ooca004 = '4'  THEN ceil(round(COALESCE(inaj011*inaj048/inaj049*inaj004,0),6)*power(10,c.ooca002))/power(10,c.ooca002) ",    #170428-00041#1 mark
               "                  WHEN c.ooca004 = '4'  THEN ceil(round(COALESCE(inaj011*inaj048/inaj049,0),6)*power(10,c.ooca002))/power(10,c.ooca002)*inaj004 ",     #170428-00041#1 add  
               "              END ))",
               "         inag033,",
               "         COALESCE(inat015,0) inat015,COALESCE(inat021,0) inat021",  #161207-00047#2 mark     #161220-00034#1 remark              
               "    FROM inaj_t ",
               #"   INNER JOIN inag_t ON inajent = inagent AND inajsite = inagsite AND inaj005 = inag001 AND inaj006 = inag002  ",  #170221-00040#1 mark
               "   LEFT JOIN inag_t ON inajent = inagent AND inajsite = inagsite AND inaj005 = inag001 AND inaj006 = inag002  ",    #170221-00040#1 add 
               "                    AND inaj007 = inag003 AND inaj008 = inag004 AND inaj009 = inag005 AND inaj010 = inag006 ",
               "                    AND inaj045 = inag007 ",  
               #161207-00047#2---mark---s    #161220-00034#1 remark            
               "    LEFT JOIN inat_t ON inatent = inajent AND inatsite = inajsite ",
               "                    AND inat001 = inaj005 AND inat002 = inaj006 ",
               "                    AND inat003 = inaj007 AND inat004 = inaj008 ",
               "                    AND inat005 = inaj009 AND inat006 = inaj010 ",
               "                    AND inat007 = inaj045 AND inat008 = ",p_year,
               "                    AND inat009 = ",p_month,               
               #161207-00047#2---mark---e    #161220-00034#1 remark       
               "   INNER JOIN imaa_t ON imaaent = inajent AND imaa001 = inaj005 ",  
               "    LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = inaj045 ",
               "    LEFT OUTER JOIN ooca_t b ON b.oocaent = inajent AND b.ooca001 = inaj026 ",
               "    LEFT OUTER JOIN ooca_t c ON c.oocaent = imaaent AND c.ooca001 = imaa006 ",
               #170221-00040#1-S
               "    LEFT OUTER JOIN inaa_t ON inaaent = inajent AND inaasite = inajsite AND inaa001 = inaj008 ",
               "    LEFT OUTER JOIN imaf_t ON imafent = inajent AND imafsite = inajsite AND imaf001 = inaj005 ",
               #170221-00040#1-E
               "   WHERE inajent = '",g_enterprise,"'",
               "     AND inajsite = '",g_site,"'",
               "     AND inaj022 > '",l_edate,"'",   #161207-00047#2 mark #161220-00034#1 remark 
               "     AND ",p_wc2,      #170221-00040#1 add
               "     AND inaj004 <> 0 ",
               #"   GROUP BY inaj005,inaj006,inaj007,inaj008,inaj009,inaj010,inaj045,imaa006,inat015,inat021",  #161207-00047#2 mark
               "   GROUP BY inajent,inajsite,inaj005,inaj006,inaj007,inaj008,inaj009,inaj010,inaj045,imaf015,inaa008,inaa009,inaa010,imaa006,inat015,inat021",  #161220-00034#1 add #170221-00040#1 add inaj026,inajent,inajsite,inaa008,inaa009,inaa010 mod imaa006=>inag032
               #"   GROUP BY inaj005,inaj006,inaj007,inaj008,inaj009,inaj010,inaj045,imaa006",  #161207-00047#2 add  #161220-00034#1 mark  #170221-00040#1 mark 
#170913-00036#1   --begin
               "   UNION ",
               " SELECT DISTINCT inatent,inatsite,inat001,inat002,inat003,inat004,inat005,inat006,inat007,imaf015,inaa008,inaa009,inaa010,0,0,",
               "        imaa006 inag032,0,COALESCE(inat015,0) inat015,COALESCE(inat021,0) inat021",             
               "   FROM inat_t ",  
               "        INNER JOIN imaa_t ON imaaent = inatent AND imaa001 = inat001 ",  
               "        LEFT OUTER JOIN inaa_t ON inaaent = inatent AND inaasite = inatsite AND inaa001 = inat004 ",
               "        LEFT OUTER JOIN imaf_t ON imafent = inatent AND imafsite = inatsite AND imaf001 = inat001 ",    
               "  WHERE inatent = '",g_enterprise,"'",
               "    AND inatsite = '",g_site,"'",
               "    AND inat008 = ",p_year,
               "    AND inat009 = ",p_month,
               "    AND ",p_wc3,               #171109-00022#1 add
               "    AND NOT EXISTS (SELECT 1 FROM inaj_t",
               "                     WHERE  inat001 = inaj005 AND inat002 = inaj006 ",
               "                     AND inatent = inajent AND inatsite = inajsite ",    #171109-00022#1 add
               "                     AND inat003 = inaj007 AND inat004 = inaj008 ",
               "                     AND inat005 = inaj009 AND inat006 = inaj010 ",
               "                     AND inat007 = inaj045 ",   
               "                     AND inajent = '",g_enterprise,"'",
               "                     AND inajsite = '",g_site,"'",
               "                     AND inaj022 > '",l_edate,"'", 
               "                     AND ",p_wc2,     
               "                     AND inaj004 <> 0 )",                        
#170913-00036#1   --end
               " ) B ",
               " ON (A.inag001 = B.inaj005 AND A.inag002 = B.inaj006 AND A.inag003 = B.inaj007 ",
               " AND A.inag004 = B.inaj008 AND A.inag005 = B.inaj009 AND A.inag006 = B.inaj010 ",
               " AND A.inag007 = B.inaj045 AND A.inagent = B.inajent AND A.inagsite = B.inajsite) ",
               " WHEN MATCHED THEN ",
               " UPDATE ",
               #161220-00034#1---mod---s
               ##161207-00047#2---mod---s               
               ##"    SET A.inag008 = B.inat015 + B.inag008,", 
               ##"        A.inag025 = B.inat021 + B.inag025,", 
               ##"        A.inag032 = B.inag032,", 
               ##"        A.inag033 = B.inat015 + B.inag033 ", 
               #"    SET A.inag008 = B.inag008,", 
               #"        A.inag025 = B.inag025,", 
               #"        A.inag032 = B.inag032,", 
               #"        A.inag033 = B.inag033 ",                
               ##161207-00047#2---mod---e 
               "    SET A.inag008 = B.inat015 + B.inag008,", 
               "        A.inag009 = B.inat015 + B.inag008,",     #170913-00036#1 add 
               "        A.inag025 = B.inat021 + B.inag025,", 
               "        A.inag032 = B.inag032,", 
               "        A.inag033 = B.inat015 + B.inag033 ",               
               #161220-00034#1---mod---s
               " WHERE A.inagent = '",g_enterprise,"'",
               "   AND A.inagsite = '",g_site,"'",                
               #170221-00040#1-S
               " WHEN NOT MATCHED THEN ",
#               " INSERT (inagent,inagsite,inag001,inag002,inag003,inag004,inag005,inag006,inag007 ) ",
#               " VALUES (",g_enterprise,",","'",g_site,"',","B.inaj005,B.inaj006,B.inaj007,B.inaj008,B.inaj009,B.inaj010,B.inaj045 )"
               " INSERT VALUES (",g_enterprise,",","'",g_site,"',","B.inaj005,B.inaj006,B.inaj007,B.inaj008,B.inaj009,B.inaj010,B.inaj045,B.inag008,B.inag008,",
               "                B.inaa008,B.inaa009,B.inaa010,'','','','','','','N','',0,'','',B.imaf015,B.inag025,'','','','','','',B.inag032,B.inag033) "             
               #170221-00040#1-E

   PREPARE s_p100_inag FROM g_sql
   EXECUTE s_p100_inag
   #170217-00025#8 add-S
   IF SQLCA.sqlerrd[3] > 0 THEN
      LET r_flag = TRUE
   END IF
   #170217-00025#8 add-E
   #170414-00011#1-s
   LET g_sql = " UPDATE inag_t SET (inag008,inag025,inag033) = (0,0,0) ",
               " WHERE inagent = ",g_enterprise," AND inagsite = '",g_site,"' ",
               "   AND NOT EXISTS (SELECT 1 FROM inaj_t WHERE inagsite=inajsite ",
               "   AND inagent=inajent AND inag001=inaj005 AND inag002=inaj006 AND inag003=inaj007 ",
               "   AND inag004=inaj008 AND inag005=inaj009 AND inag006=inaj010 AND inag007=inaj045 ) ",
               "   AND EXISTS (SELECT 1 FROM imaa_t,imaf_t WHERE imaaent=inagent AND imaa001=inag001 ",
               "   AND imafent=inagent AND imafsite=inagsite AND imaf001=inag001 AND ",p_wc,") "
   PREPARE s_p100_inag1 FROM g_sql
   EXECUTE s_p100_inag1
   #170414-00011#1-e
   IF g_bgjob <> "Y" THEN
      LET ls_value = 'UPDATE inag_t'
      CALL cl_progress_no_window_ing(ls_value)
   END IF    
   #3.更新inai010账面基础单位库存数量   
   LET g_sql = " MERGE INTO inai_t A ",
               " USING ( ",
               #170308-00016#1-s
               #" SELECT DISTINCT NVL(inal006,' ') inal006,NVL(inal007,' ') inal007,NVL(inal008,' ') inal008,NVL(inal009,' ') inal009,NVL(inal010,' ') inal010,NVL(inal011,' ') inal011,NVL(inal012,' ' inal012),NVL(inal013,' ') inal013,",  #170221-00040#1 mod NVL()
               " SELECT DISTINCT NVL(inal006,' ') inal006,NVL(inal007,' ') inal007,NVL(inal008,' ') inal008,NVL(inal009,' ') inal009,NVL(inal010,' ') inal010,NVL(inal011,' ') inal011,NVL(inal012,' ') inal012,NVL(inal013,' ') inal013,",  #170221-00040#1 mod NVL()
               #170308-00016#1-e
               #inag008账面库存数量
               "        inaj045,inalent,inalsite,",    #170221-00040#1 add inalent,inalsite
               "        SUM((CASE WHEN ooca004 = '1'  THEN round(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002)  ",
               "                  WHEN ooca004 = '2'  THEN (CASE WHEN MOD(round(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002),(2/power(10,ooca002)))=0 THEN round(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002) ",
               "                                                 ELSE round(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002)-(inaj004*1/power(10,ooca002)) ",
               "                                             END )",
               "                  WHEN ooca004 = '3'  THEN trunc(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002)",
               #"                  WHEN ooca004 = '4'  THEN ceil(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6)*power(10,ooca002))/power(10,ooca002) ",   #170428-00041#1 mark
               "                  WHEN ooca004 = '4'  THEN ceil(round(COALESCE(inal014*inaj046/inaj047,0),6)*power(10,ooca002))/power(10,ooca002)*inaj004 ",    #170428-00041#1 add
               "             END ))",
               "         inai010, ",
               "         imaa006 inai014, ",
               "         COALESCE(inau017,0) inau017",    #161207-00047#2 mark   #161220-00034#1 remark 
               #170221-00040#1-S               
               #"    FROM inaj_t ",   
               #"   INNER JOIN inal_t ON inajent = inalent AND inajsite = inalsite AND inaj001 = inal001 ",                  
               "    FROM inal_t ",               
               "    LEFT JOIN inaj_t ON inajent = inalent AND inajsite = inalsite AND inaj001 = inal001 ",     
               #170221-00040#1-E
               "                    AND inaj002 = inal002 AND inaj003 = inal003 AND inaj004 = inal005 ",                   
               #161207-00047#2---mark---s     #161220-00034#1 remark            
               "    LEFT JOIN inau_t ON inauent = inajent AND inausite = inajsite ",
               "                    AND inau001 = inaj005 AND inau002 = inaj006 ",
               "                    AND inau003 = inaj007 AND inau004 = inaj008 ",
               "                    AND inau005 = inaj009 AND inau006 = inaj010 ",
               "                    AND inau007 = inal012 AND inau008 = inal013 ",
               "                    AND inau009 = inaj045 AND inau010 = ",p_year,
               "                    AND inau011 = ",p_month,             
               #161207-00047#2---mark---e   #161220-00034#1 remark             
               "   INNER JOIN imaa_t ON imaaent = inajent AND imaa001 = inaj005 ",  
               "   INNER JOIN imaf_t ON inajent = imafent AND inajsite = imafsite AND inaj005 = imaf001 ",
               "    LEFT OUTER JOIN ooca_t ON oocaent = inajent AND ooca001 = inaj045 ",
               "   WHERE inajent = '",g_enterprise,"'",
               "     AND inajsite = '",g_site,"'",
               "     AND inaj022 > '",l_edate,"'",    #161207-00047#2 mark  #161220-00034#1 remark 
               "     AND ",p_wc2,      #170221-00040#1 add 
               #170308-00016#1-s
               #"     AND imaf071 <> '2' ",
               #"     AND imaf081 <> '2' ",
               "     AND (imaf081 <> '2' OR imaf081 <> '2') ",
               #170308-00016#1-e
               "     AND inal014 <> 0   ",            
               #"   GROUP BY inal006,inal007,inal008,inal009,inal010,inal011,inal012,inal013,inaj045,imaa006,inau017",  #161207-00047#2 mark
               #"   GROUP BY inal006,inal007,inal008,inal009,inal010,inal011,inal012,inal013,inaj045,imaa006",           #161207-00047#2 add #161220-00034#1 mark  #170221-00040#1 mark 
               "   GROUP BY inalent,inalsite,inal006,inal007,inal008,inal009,inal010,inal011,inal012,inal013,inaj045,imaa006,inau017",   #161220-00034#1 add  #170221-00040#1 add inalent,inalsite mod imaa006=>inai014
               " ) B ",
               " ON (A.inai001 = B.inal006 AND A.inai002 = B.inal007 AND A.inai003 = B.inal008 ",
               " AND A.inai004 = B.inal009 AND A.inai005 = B.inal010 AND A.inai006 = B.inal011 ",
               " AND A.inaient = B.inalent AND A.inaisite = B.inalsite ",                         #170221-00040#1 add   
               " AND A.inai007 = B.inal012 AND A.inai008 = B.inal013 AND A.inai009 = B.inaj045) ",
               " WHEN MATCHED THEN ",
               " UPDATE ",
               #"    SET A.inai010 = B.inau017 + B.inai010,",    #161207-00047#2 mark 
               #"    SET A.inai010 = B.inai010,",                #161207-00047#2 mark  #161220-00034#1 mark
               "    SET A.inai010 = B.inau017 + B.inai010,",     #161220-00034#1 add
               "        A.inai014 = B.inai014 ", 
               " WHERE A.inaient = '",g_enterprise,"'",
               "   AND A.inaisite = '",g_site,"'",
               #170221-00040#1-S
               " WHEN NOT MATCHED THEN ",
               " INSERT VALUES ('",g_enterprise,"',","'",g_site,"',","B.inal006,B.inal007,B.inal008,B.inal009,B.inal010,B.inal011,B.inal012,B.inal013,B.inaj045,",
               "                B.inai010,B.inai010,'','',B.inai014)"
               
               #170221-00040#1-E
   PREPARE s_p100_inai FROM g_sql
   EXECUTE s_p100_inai 
   #170217-00025#8 add-S
   IF SQLCA.sqlerrd[3] > 0 THEN
      LET r_flag = TRUE
   END IF
   #170217-00025#8 add-E
   IF g_bgjob <> "Y" THEN
      LET ls_value = 'UPDATE inai_t'
      CALL cl_progress_no_window_ing(ls_value)
   END IF    
   #161207-00047#1---add---e
   RETURN r_flag   #170217-00025#8 add
#161207-00047#1---add---s
#   #161201-00023#1---mod---s    
#   #LET g_sql = "SELECT COALESCE(SUM(inaj011*inaj046/inaj047*inaj004),0),COALESCE(SUM(inaj027*inaj004),0)",          
#   #            "  FROM inaj_t ",
#   #            " WHERE inajent = '",g_enterprise,"'",
#   #            "   AND inajsite = '",g_site,"'",
#   #            "   AND inaj005 =? AND inaj006 =? AND inaj007 =? AND inaj008 =? AND inaj009 = ? AND inaj010 =?",
#   #            "   AND inaj045 = ?",
#   #            "   AND inaj022 > '",l_edate,"'",
#   #            "   AND inaj004 <> 0 "
#   #161212-00017#1---mod---s
#   #LET g_sql = "SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),a.ooca002)  ",
#   #            "                 WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),a.ooca002),(2/power(10,a.ooca002)))=0 THEN round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),a.ooca002) ",
#   #            "                                                ELSE round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),a.ooca002)-(inaj004*1/power(10,a.ooca002)) ",
#   #            "                                            END )",
#   #            "                 WHEN a.ooca004 = '3'  THEN trunc(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002)",
#   #            "                 WHEN a.ooca004 = '4'  THEN ceil(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6)*power(10,a.ooca002))/power(10,a.ooca002) ",
#   #            "             END ))",
#   #            "        a, ",    
#   #            "       SUM((CASE WHEN b.ooca004 = '1'  THEN round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002)  ",
#   #            "                 WHEN b.ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inaj027*inaj004,0),b.ooca002),(2/power(10,b.ooca002)))=0 THEN round(COALESCE(inaj027*inaj004,0),b.ooca002) ",
#   #            "                                                      ELSE round(COALESCE(inaj027*inaj004,0),b.ooca002)-(inaj004*1/power(10,b.ooca002)) ",
#   #            "                                            END )",
#   #            "                 WHEN b.ooca004 = '3'  THEN trunc(COALESCE(inaj027*inaj004,0),b.ooca002)",
#   #            "                 WHEN b.ooca004 = '4'  THEN ceil(COALESCE(inaj027*inaj004,0)*power(10,b.ooca002))/power(10,b.ooca002) ",
#   #            "             END ))",
#   #            "        a1",
#   LET g_sql = "SELECT SUM((CASE WHEN a.ooca004 = '1'  THEN round(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002)  ",
#               "                 WHEN a.ooca004 = '2'  THEN (CASE WHEN MOD(round(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002),(2/power(10,a.ooca002)))=0 THEN round(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002) ",
#               "                                                ELSE round(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002)-(inaj004*1/power(10,a.ooca002)) ",
#               "                                            END )",
#               "                 WHEN a.ooca004 = '3'  THEN trunc(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6),a.ooca002)",
#               "                 WHEN a.ooca004 = '4'  THEN ceil(round(COALESCE(inaj011*inaj046/inaj047*inaj004,0),6)*power(10,a.ooca002))/power(10,a.ooca002) ",
#               "             END ))",
#               "        a, ",    
#               "       SUM((CASE WHEN b.ooca004 = '1'  THEN round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002)  ",
#               "                 WHEN b.ooca004 = '2'  THEN (CASE WHEN MOD(round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002),(2/power(10,b.ooca002)))=0 THEN round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002) ",
#               "                                                      ELSE round(round(COALESCE(inaj027*inaj004,0),6),b.ooca002)-(inaj004*1/power(10,b.ooca002)) ",
#               "                                            END )",
#               "                 WHEN b.ooca004 = '3'  THEN trunc(round(COALESCE(inaj027*inaj004,0),6),b.ooca002)",
#               "                 WHEN b.ooca004 = '4'  THEN ceil(round(COALESCE(inaj027*inaj004,0),6)*power(10,b.ooca002))/power(10,b.ooca002) ",
#               "             END ))",
#               "        a1",               
#   #161212-00017#1---mod---e               
#               "  FROM inaj_t ",
#               "  LEFT OUTER JOIN ooca_t a ON a.oocaent = inajent AND a.ooca001 = inaj045 ",
#               "  LEFT OUTER JOIN ooca_t b ON b.oocaent = inajent AND b.ooca001 = inaj026 ",
#               " WHERE inajent = '",g_enterprise,"'",
#               "   AND inajsite = '",g_site,"'",
#               "   AND inaj005 =? AND inaj006 =? AND inaj007 =? AND inaj008 =? AND inaj009 = ? AND inaj010 =?",
#               "   AND inaj045 = ?",
#               "   AND inaj022 > '",l_edate,"'",
#               "   AND inaj004 <> 0 "               
#   #161201-00023#1---mod---e   
#   PREPARE p100_per2 FROM g_sql 
#   DECLARE p100_cur2 CURSOR FOR p100_per2    
#        
#   #161107-00010#2---mod---s        
#   #LET g_sql = "SELECT DISTINCT inai007,inai008,inau017 ",    
#   #            "  FROM inai_t ",
#   #            "  LEFT JOIN inau_t ON inauent = inaient AND inausite = inaisite ",
#   #            "                  AND inau001 = inai001 AND inau002 = inai002 ",
#   #            "                  AND inau003 = inai003 AND inau004 = inai004 ",
#   #            "                  AND inau005 = inai005 AND inau006 = inai006 ",
#   #            "                  AND inau007 = inai007 AND inau008 = inai008 ",
#   #            "                  AND inau009 = inai009 AND inau010 = ",p_year,
#   #            "                  AND inau011 = ",p_month,
#   #            " WHERE inaient = '",g_enterprise,"'",
#   #            "   AND inaisite = '",g_site,"'",
#   #            "   AND inai001=? AND inai002=? AND inai003=? AND inai004=? AND inai005=? AND inai006=? AND inai009=?"
#
#   LET g_sql = "SELECT DISTINCT inai001,inai002,inai003,inai004,inai005,",
#               "                inai006,inai009,inai007,inai008,COALESCE(inau017,0),",
#               "                inag032",               
#               "  FROM inai_t ",
#               "  LEFT JOIN inau_t ON inauent = inaient AND inausite = inaisite ",
#               "                  AND inau001 = inai001 AND inau002 = inai002 ",
#               "                  AND inau003 = inai003 AND inau004 = inai004 ",
#               "                  AND inau005 = inai005 AND inau006 = inai006 ",
#               "                  AND inau007 = inai007 AND inau008 = inai008 ",
#               "                  AND inau009 = inai009 AND inau010 = ",p_year,
#               "                  AND inau011 = ",p_month,
#               "  INNER JOIN imaf_t ON inaient = imafent AND inaisite = imafsite AND inai001 = imaf001 ", 
#               "  INNER JOIN inag_t ON inai001=inag001 AND inai002=inag002 AND inai003=inag003 AND inai004=inag004",
#               "                   AND inai005=inag005 AND inai006=inag006 AND inai009=inag007 ",
#               " WHERE inaient = '",g_enterprise,"'",
#               "   AND inaisite = '",g_site,"'",
#               "   AND ",p_wc,
#               "   AND imaf071 <> '2' ",
#               "   AND imaf081 <> '2' ",
#               #161201-00023#1---add---s-new
#               "   AND EXISTS(SELECT 1 FROM inal_t WHERE inaient = inalent AND inaisite = inalsite AND inai001 = inal006 ",
#               "                 AND inai002 = inal007 AND inai003 = inal008 AND inai004 = inal009 AND inai005 = inal010 ",
#               "                 AND inai006 = inal011 AND inai007 = inal012 AND inai008 = inal013 AND inal014 <> 0 )"
#               #161201-00023#1---add---e-new
#   #161107-00010#2---mod---e        
#   PREPARE p100_pre3 FROM g_sql
#   DECLARE p100_cur3 CURSOR FOR p100_pre3
#   
#   #161201-00023#1---mod---s
#   #LET g_sql = "SELECT COALESCE(SUM(inal014*inaj046/inaj047*inaj004),0) ",
#   #            "  FROM inal_t,inaj_t ",
#   #            " WHERE inajent = inalent AND inajsite = inalsite AND inaj001 = inal001 ",
#   #            "   AND inaj002 = inal002 AND inaj003 = inal003 AND inaj004 = inal005 ",
#   #            "   AND inalent = '",g_enterprise,"'",
#   #            "   AND inalsite = '",g_site,"'",
#   #            "   AND inal006 =? AND inal007 =? AND inal008 =? AND inal009 = ? AND inal010 =? ",
#   #            "   AND inal011 =? AND inal012 =? AND inal013 =? ",
#   #            "   AND inal016 > '",l_edate,"'",
#   #            "   AND inal005 <> 0 "
#   #161212-00017#1---mod---e 
#   #LET g_sql = "SELECT SUM((CASE WHEN ooca004 = '1'  THEN round(COALESCE(inal014*inaj046/inaj047*inaj004,0),ooca002)  ",
#   #            "                 WHEN ooca004 = '2'  THEN (CASE WHEN MOD(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),ooca002),(2/power(10,ooca002)))=0 THEN round(COALESCE(inal014*inaj046/inaj047*inaj004,0),ooca002) ",
#   #            "                                                ELSE round(COALESCE(inal014*inaj046/inaj047*inaj004,0),ooca002)-(inaj004*1/power(10,ooca002)) ",
#   #            "                                            END )",
#   #            "                 WHEN ooca004 = '3'  THEN trunc(COALESCE(inal014*inaj046/inaj047*inaj004,0),ooca002)",
#   #            "                 WHEN ooca004 = '4'  THEN ceil(COALESCE(inal014*inaj046/inaj047*inaj004,0)*power(10,ooca002))/power(10,ooca002) ",
#   #            "             END ))",
#   #            "        a ", 
#   LET g_sql = "SELECT SUM((CASE WHEN ooca004 = '1'  THEN round(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002)  ",
#               "                 WHEN ooca004 = '2'  THEN (CASE WHEN MOD(round(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002),(2/power(10,ooca002)))=0 THEN round(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002) ",
#               "                                                ELSE round(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002)-(inaj004*1/power(10,ooca002)) ",
#               "                                            END )",
#               "                 WHEN ooca004 = '3'  THEN trunc(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6),ooca002)",
#               "                 WHEN ooca004 = '4'  THEN ceil(round(COALESCE(inal014*inaj046/inaj047*inaj004,0),6)*power(10,ooca002))/power(10,ooca002) ",
#               "             END ))",
#               "        a ",                 
#   #161212-00017#1---mod---e              
#               "  FROM inal_t,inaj_t ",
#               "  LEFT OUTER JOIN ooca_t ON oocaent = inajent AND ooca001 = inaj045 ",
#               " WHERE inajent = inalent AND inajsite = inalsite AND inaj001 = inal001 ",
#               "   AND inaj002 = inal002 AND inaj003 = inal003 AND inaj004 = inal005 ",
#               "   AND inalent = '",g_enterprise,"'",
#               "   AND inalsite = '",g_site,"'",
#               "   AND inal006 =? AND inal007 =? AND inal008 =? AND inal009 = ? AND inal010 =? ",
#               "   AND inal011 =? AND inal012 =? AND inal013 =? ",
#               "   AND inal016 > '",l_edate,"'",
#               "   AND inal005 <> 0 "               
#   #161201-00023#1---mod---e            
#   PREPARE p100_pre4 FROM g_sql
#   DECLARE p100_cur4 CURSOR FOR p100_pre4   
#    
#   LET g_sql = "SELECT DISTINCT inaj012,inaj045,inaj028,",
#               "                imaa006,imag013,imag014",
#               "  FROM inaj_t ",
#               "  LEFT OUTER JOIN imaa_t ON inajent = imaaent AND inaj005 = imaa001 ",
#               "  LEFT OUTER JOIN imag_t ON inajent = imagent AND inajsite = imagsite AND inaj005 = imag001 ",               
#               " WHERE inajent = '",g_enterprise,"'",
#               "   AND inajsite = '",g_site,"'",
#               "   AND inaj005 =? AND inaj006 =? AND inaj007 =? AND inaj008 =? AND inaj009 = ? AND inaj010 =?",
#               "   AND inaj045 = ?",
#               "   AND inaj022 > ? ",
#               "   AND inaj004 <> 0 "
#   PREPARE p100_up_inaj_per FROM g_sql 
#   DECLARE p100_up_inaj_cur CURSOR FOR p100_up_inaj_per  
#
#   LET g_sql = " UPDATE inaj_t ",
#               "    SET inaj013 = ? ,",
#               "        inaj014 = ? ,",
#               "        inaj028 = ? ,",
#               "        inaj046 = ? ,",
#               "        inaj047 = ? ,",
#               "        inaj048 = ? ,",
#               "        inaj049 = ? ,",
#               "        inaj050 = ? ,",
#               "        inaj051 = ? ",
#               "  WHERE inajent = '",g_enterprise,"'",
#               "    AND inajsite = '",g_site,"'",
#               "    AND inaj005 = ?",  #g_inag.inag001
#               "    AND inaj006 = ?",  #g_inag.inag002
#               "    AND inaj007 = ?",  #g_inag.inag003
#               "    AND inaj008 = ?",  #g_inag.inag004
#               "    AND inaj009 = ?",  #g_inag.inag005
#               "    AND inaj010 = ?",  #g_inag.inag006
#               "    AND inaj012 = ?",  #l_inaj012
#               "    AND inaj045 = ?"   #l_inaj045
#   PREPARE p100_upd_inaj FROM g_sql          
#         
#   LET g_sql = "UPDATE inag_t ",
#               "   SET inag008 = ?,",    #g_inag.inag008,
#               "       inag025 = ?,",    #g_inag.inag025,
#               "       inag032 = ?,",    #g_inag.inag032,
#               "       inag033 = ?",     #g_inag.inag033 
#               " WHERE inagent = '",g_enterprise,"'",
#               "   AND inagsite = '",g_site,"'",
#               "   AND inag001 = ? ",   #g_inag.inag001
#               "   AND inag002 = ? ",   #g_inag.inag002
#               "   AND inag003 = ? ",   #g_inag.inag003
#               "   AND inag004 = ? ",   #g_inag.inag004
#               "   AND inag005 = ? ",   #g_inag.inag005
#               "   AND inag006 = ? ",   #g_inag.inag006
#               "   AND inag007 = ? "    #g_inag.inag007
#   PREPARE p100_upd_inag FROM g_sql         
#         
#   LET g_sql = "UPDATE inai_t ",
#               "   SET inai010 = ?,",  #l_inai010,
#               "       inai014 = ? ",  #g_inag.inag032   
#               " WHERE inaient = '",g_enterprise,"'",
#               "   AND inaisite = '",g_site,"'",
#               "   AND inai001 = ? ",  #g_inag.inag001 
#               "   AND inai002 = ? ",  #g_inag.inag002
#               "   AND inai003 = ? ",  #g_inag.inag003
#               "   AND inai004 = ? ",  #g_inag.inag004
#               "   AND inai005 = ? ",  #g_inag.inag005
#               "   AND inai006 = ? ",  #g_inag.inag006
#               "   AND inai007 = ? ",  #l_inai007
#               "   AND inai008 = ? ",  #l_inai008
#               "   AND inai009 = ? "   #g_inag.inag007
#   PREPARE p100_upd_inai FROM g_sql            
#
#   
#   LET g_sql = " SELECT DISTINCT inag001,inag002,inag003,inag004,inag005,inag006,inag007,",
#               "                 inag024,inag032,",   
#               "                 COALESCE(inat015,0),COALESCE(inat021,0),imaa006,imaf071,imaf081",  
#               "   FROM inag_t  ",
#               "        LEFT JOIN inat_t ON inatent = inagent AND inatsite = inagsite ",
#               "                        AND inat001 = inag001 AND inat002 = inag002 ",
#               "                        AND inat003 = inag003 AND inat004 = inag004 ",
#               "                        AND inat005 = inag005 AND inat006 = inag006 ",
#               "                        AND inat007 = inag007 AND inat008 = ",p_year,
#               "                        AND inat009 = ",p_month,
#               "        LEFT OUTER JOIN imaa_t ON inagent = imaaent AND inag001 = imaa001 ",
#               "        LEFT OUTER JOIN imaf_t ON inagent = imafent AND inagsite = imafsite AND inag001 = imaf001 ",              
#               "  WHERE inagent = '",g_enterprise,"'",
#               "    AND inagsite = '",g_site,"' AND ",p_wc
#   PREPARE p100_pre FROM g_sql
#   DECLARE p100_cur CURSOR FOR p100_pre
#   FOREACH p100_cur INTO g_inag.inag001,g_inag.inag002,g_inag.inag003,g_inag.inag004,
#                         g_inag.inag005,g_inag.inag006,g_inag.inag007,
#                         g_inag.inag024,g_inag.inag032,       
#                         l_inat015,l_inat021,l_imaa006,l_imaf071,l_imaf081   
#      #更新庫存交易明細檔中交易單位與庫存單位換算率和交易單位與料件基本單位換算率           
#      CALL s_ainp100_upd_inaj(l_edate) 
#      
#      ##畫面顯示處理進度 
#      IF g_bgjob <> "Y" THEN
#         LET ls_value = g_inag.inag001
#         CALL cl_progress_no_window_ing(ls_value)
#      END IF       
#
#      LET l_inag008 = 0   
#      LET l_inag025 = 0   
#
#      EXECUTE p100_cur2 USING g_inag.inag001,g_inag.inag002,g_inag.inag003,g_inag.inag004,
#                              g_inag.inag005,g_inag.inag006,g_inag.inag007
#                         INTO l_inag008,l_inag025 
#                         
#      IF cl_null(l_inag008) THEN LET l_inag008 = 0 END IF  #161201-00023#1               
#      IF cl_null(l_inag025) THEN LET l_inag025 = 0 END IF  #161201-00023#1
#      
#      LET g_inag.inag008 = l_inat015 + l_inag008   
#      LET g_inag.inag025 = l_inat021 + l_inag025   
#
#      #取位
#      IF NOT cl_null(g_inag.inag007) AND NOT cl_null(g_inag.inag008) THEN
#         CALL s_aooi250_take_decimals(g_inag.inag007,g_inag.inag008) RETURNING l_success,g_inag.inag008
#      END IF
#      IF NOT cl_null(g_inag.inag024) AND NOT cl_null(g_inag.inag025) THEN
#         CALL s_aooi250_take_decimals(g_inag.inag024,g_inag.inag025) RETURNING l_success,g_inag.inag025
#      END IF
#
#      CALL s_aimi190_get_convert1(g_inag.inag001,g_inag.inag007,l_imaa006) RETURNING g_success,l_inaj049,l_inaj048
#      LET g_inag.inag032 = l_imaa006
#      LET g_inag.inag033 = g_inag.inag008 * l_inaj048 / l_inaj049
#
#      IF NOT cl_null(g_inag.inag032) AND NOT cl_null(g_inag.inag033) THEN
#         CALL s_aooi250_take_decimals(g_inag.inag032,g_inag.inag033) RETURNING l_success,g_inag.inag033
#      END IF
#
#      EXECUTE p100_upd_inag USING g_inag.inag008,g_inag.inag025,g_inag.inag032,g_inag.inag033,
#                                  g_inag.inag001,g_inag.inag002,g_inag.inag003,g_inag.inag004,
#                                  g_inag.inag005,g_inag.inag006,g_inag.inag007                                  
#      #161107-00010#2---mark---s
#      #IF l_imaf071 <> '2' AND l_imaf081 <> '2' THEN                
#      #   FOREACH p100_cur3 USING g_inag.inag001,g_inag.inag002,g_inag.inag003,g_inag.inag004,
#      #                           g_inag.inag005,g_inag.inag006,g_inag.inag007
#      #                      INTO l_inai007,l_inai008,l_inau017     #160504-00001#1 add l_inau017
#      #
#      #      LET l_inal014_sum = 0
#      #
#      #      EXECUTE p100_cur4 USING g_inag.inag001,g_inag.inag002,g_inag.inag003,g_inag.inag004,
#      #                              g_inag.inag005,g_inag.inag006,l_inai007,l_inai008
#      #                         INTO l_inal014_sum
#      #
#      #      LET l_inai010 = l_inau017 + l_inal014_sum
#      #      
#      #      IF NOT cl_null(g_inag.inag032) AND NOT cl_null(l_inai010) THEN
#      #         CALL s_aooi250_take_decimals(g_inag.inag032,l_inai010) RETURNING l_success,l_inai010
#      #      END IF
#      #      EXECUTE p100_upd_inai USING l_inai010,g_inag.inag032,
#      #                                  g_inag.inag001,g_inag.inag002,g_inag.inag003,
#      #                                  g_inag.inag004,g_inag.inag005,g_inag.inag006,
#      #                                  l_inai007,l_inai008,g_inag.inag007
#      #      
#      #   END FOREACH
#      #END IF   
#      #161107-00010#2---mark---e
#   END FOREACH
#   #161107-00010#2---add---s              
#   FOREACH p100_cur3 INTO l_inai001,l_inai002,l_inai003,l_inai004,l_inai005,
#                          l_inai006,l_inai009,l_inai007,l_inai008,l_inau017,
#                          l_inag032                           
#      #161201-00023#1---add---s-new
#      ##畫面顯示處理進度 
#      IF g_bgjob <> "Y" THEN
#         LET ls_value = g_inag.inag001
#         CALL cl_progress_no_window_ing(ls_value)
#      END IF 
#      #161201-00023#1---add---e-new
#      
#      LET l_inal014_sum = 0
#   
#      EXECUTE p100_cur4 USING l_inai001,l_inai002,l_inai003,l_inai004,
#                              l_inai005,l_inai006,l_inai007,l_inai008
#                         INTO l_inal014_sum
#      IF cl_null(l_inal014_sum) THEN LET l_inal014_sum = 0 END IF  #161201-00023#1               
#   
#      LET l_inai010 = l_inau017 + l_inal014_sum
#      
#      IF NOT cl_null(l_inag032) AND NOT cl_null(l_inai010) THEN
#         CALL s_aooi250_take_decimals(l_inag032,l_inai010) RETURNING l_success,l_inai010
#      END IF
#      EXECUTE p100_upd_inai USING l_inai010,l_inag032,
#                                  l_inai001,l_inai002,l_inai003,
#                                  l_inai004,l_inai005,l_inai006,
#                                  l_inai007,l_inai008,l_inai009       
#   END FOREACH 
#   #161107-00010#2---add---e 
#161207-00047#1---add---s
   
      
END FUNCTION

################################################################################
# Descriptions...: 将ainp100中的ainp100_process的处理逻辑段独立到元件中
# Memo...........:
# Usage..........: CALL s_ainp100_upd_inaj(p_wc,p_date)
# Date & Author..: 2016/08/10 By lixiang
# Modify.........: #160810-00031#1 add
# ................ #161207-00047#2 去掉日期p_date 161220-00034#1 remark
################################################################################
PUBLIC FUNCTION s_ainp100_upd_inaj(p_wc,p_date)
DEFINE p_wc       STRING   #161207-00047#1
DEFINE p_date     LIKE type_t.dat     #161207-00047#2 mark #161220-00034#1 remark
DEFINE l_sql      STRING
DEFINE l_imaa006  LIKE imaa_t.imaa006
DEFINE l_inaj012  LIKE inaj_t.inaj012
DEFINE l_rate     LIKE inaj_t.inaj013
DEFINE l_inaj013  LIKE inaj_t.inaj013
DEFINE l_inaj014  LIKE inaj_t.inaj013
DEFINE l_imag013  LIKE imag_t.imag013
DEFINE l_imag014  LIKE imag_t.imag014
DEFINE l_inaj045  LIKE inaj_t.inaj045
DEFINE l_inaj046  LIKE inaj_t.inaj046
DEFINE l_inaj047  LIKE inaj_t.inaj047
DEFINE l_inaj048  LIKE inaj_t.inaj048
DEFINE l_inaj049  LIKE inaj_t.inaj049
DEFINE l_inaj050  LIKE inaj_t.inaj050
DEFINE l_inaj051  LIKE inaj_t.inaj051
DEFINE l_inaj028  LIKE inaj_t.inaj028
#161207-00047#1---add---s
DEFINE l_inaj005  LIKE inaj_t.inaj005,
       l_inaj006  LIKE inaj_t.inaj006,
       l_inaj007  LIKE inaj_t.inaj007,
       l_inaj008  LIKE inaj_t.inaj008,
       l_inaj009  LIKE inaj_t.inaj009,
       l_inaj010  LIKE inaj_t.inaj010
#161207-00047#1---add---e
DEFINE r_flag  LIKE type_t.num5   #170217-00025#8 add

   LET r_flag = FALSE    #170217-00025#8 add
   #161207-00047#1---add---s
   LET g_sql = " UPDATE inaj_t ",
               "    SET inaj013 = ? ,",
               "        inaj014 = ? ,",
               "        inaj028 = ? ,",
               "        inaj046 = ? ,",
               "        inaj047 = ? ,",
               "        inaj048 = ? ,",
               "        inaj049 = ? ,",
               "        inaj050 = ? ,",
               "        inaj051 = ? ",
               "  WHERE inajent = '",g_enterprise,"'",
               "    AND inajsite = '",g_site,"'",
               "    AND inaj005 = ?",  
               "    AND inaj006 = ?",  
               "    AND inaj007 = ?",  
               "    AND inaj008 = ?",  
               "    AND inaj009 = ?",  
               "    AND inaj010 = ?",  
               "    AND inaj012 = ?",  
               "    AND inaj045 = ?"   
   PREPARE p100_upd_inaj FROM g_sql 
   
   IF cl_null(p_wc) THEN LET p_wc = " 1=1" END IF
   LET g_sql = "SELECT DISTINCT inaj005,inaj006,inaj007,inaj008,inaj009,inaj010,",
               "                inaj012,inaj045,inaj028,imaa006,imag013,imag014",
               "  FROM inaj_t ",
               "  INNER JOIN inag_t ON inajent = inagent AND inajsite = inagsite AND inaj005 = inag001 AND inaj006 = inag002  ",
               "                   AND inaj007 = inag003 AND inaj008 = inag004 AND inaj009 = inag005 AND inaj010 = inag006 ",
               "                   AND inaj045 = inag007 ",               
               "  LEFT OUTER JOIN imaa_t ON inajent = imaaent AND inaj005 = imaa001 ",
               "  LEFT OUTER JOIN imag_t ON inajent = imagent AND inajsite = imagsite AND inaj005 = imag001 ",
               "  LEFT OUTER JOIN imaf_t ON inajent = imafent AND inajsite = imafsite AND inaj005 = imaf001 ",               
               " WHERE inajent = '",g_enterprise,"'",
               "   AND inajsite = '",g_site,"'",
               "   AND ",p_wc,
               "   AND inaj004 <> 0 "
   #161207-00047#2---mark---s  #161220-00034#1 remark            
   IF NOT cl_null(p_date) THEN 
      LET g_sql = g_sql,"AND inaj022 > '",p_date,"'"
   END IF
   #161207-00047#2---mark---e  #161220-00034#1 remark             
   PREPARE p100_up_inaj_per FROM g_sql 
   DECLARE p100_up_inaj_cur CURSOR FOR p100_up_inaj_per 
   FOREACH p100_up_inaj_cur INTO l_inaj005,l_inaj006,l_inaj007,l_inaj008,l_inaj009,l_inaj010,
                                 l_inaj012,l_inaj045,l_inaj028,l_imaa006,l_imag013,l_imag014  
      IF NOT cl_null(l_inaj012) THEN
         IF NOT cl_null(l_inaj045) THEN 
            CALL s_aimi190_get_convert(l_inaj005,l_inaj012,l_inaj045) RETURNING g_success,l_inaj013
            CALL s_aimi190_get_convert1(l_inaj005,l_inaj012,l_inaj045) RETURNING g_success,l_inaj047,l_inaj046
         ELSE
            LET l_inaj013 = 1
            LET l_inaj046 = 1
            LET l_inaj047 = 1
         END IF
         
         IF NOT cl_null(l_imaa006) THEN 
            CALL s_aimi190_get_convert(l_inaj005,l_inaj012,l_imaa006) RETURNING g_success,l_inaj014
            CALL s_aimi190_get_convert1(l_inaj005,l_inaj012,l_imaa006) RETURNING g_success,l_inaj049,l_inaj048
         ELSE
            LET l_inaj014 = 1
            LET l_inaj048 = 1
            LET l_inaj049 = 1
         END IF
         
         IF NOT cl_null(l_imag014) THEN
            LET l_inaj028 = l_imag013
            CALL s_aimi190_get_convert1(l_inaj005,l_inaj012,l_imag014) RETURNING g_success,l_inaj051,l_inaj050
         ELSE
            LET l_inaj050 = 1
            LET l_inaj051 = 1
         END IF
      ELSE
         LET l_inaj013 = 1
         LET l_inaj014 = 1
         LET l_inaj046 = 1
         LET l_inaj047 = 1         
         LET l_inaj048 = 1
         LET l_inaj049 = 1
         LET l_inaj050 = 1
         LET l_inaj051 = 1
      END IF

      EXECUTE p100_upd_inaj USING l_inaj013,l_inaj014,l_inaj028,l_inaj046,l_inaj047,      
                                  l_inaj048,l_inaj049,l_inaj050,l_inaj051,l_inaj005,
                                  l_inaj006,l_inaj007,l_inaj008,l_inaj009,l_inaj010,      
                                  l_inaj012,l_inaj045    
      #170217-00025#8 add-S
      IF SQLCA.sqlerrd[3] > 0 THEN
         LET r_flag = TRUE
      END IF
      #170217-00025#8 add-E  
      
   END FOREACH   
   RETURN r_flag  #170217-00025#8 add
   #161207-00047#1---add---s            
   #161207-00047#1---mark---s            
   #FOREACH p100_up_inaj_cur USING g_inag.inag001,g_inag.inag002,g_inag.inag003,
   #                               g_inag.inag004,g_inag.inag005,g_inag.inag006,g_inag.inag007,p_date
   #                          INTO l_inaj012,l_inaj045,l_inaj028,
   #                               l_imaa006,l_imag013,l_imag014    #160504-00001#1
   #       
   #                                 
   #   IF NOT cl_null(l_inaj012) THEN
   #      IF NOT cl_null(l_inaj045) THEN 
   #         CALL s_aimi190_get_convert(g_inag.inag001,l_inaj012,l_inaj045) RETURNING g_success,l_inaj013
   #         CALL s_aimi190_get_convert1(g_inag.inag001,l_inaj012,l_inaj045) RETURNING g_success,l_inaj047,l_inaj046
   #      ELSE
   #         LET l_inaj013 = 1
   #         LET l_inaj046 = 1
   #         LET l_inaj047 = 1
   #      END IF
   #      
   #      IF NOT cl_null(l_imaa006) THEN 
   #         CALL s_aimi190_get_convert(g_inag.inag001,l_inaj012,l_imaa006) RETURNING g_success,l_inaj014
   #         CALL s_aimi190_get_convert1(g_inag.inag001,l_inaj012,l_imaa006) RETURNING g_success,l_inaj049,l_inaj048
   #      ELSE
   #         LET l_inaj014 = 1
   #         LET l_inaj048 = 1
   #         LET l_inaj049 = 1
   #      END IF
   #      
   #      IF NOT cl_null(l_imag014) THEN
   #         LET l_inaj028 = l_imag013
   #         CALL s_aimi190_get_convert1(g_inag.inag001,l_inaj012,l_imag014) RETURNING g_success,l_inaj051,l_inaj050
   #      ELSE
   #         LET l_inaj050 = 1
   #         LET l_inaj051 = 1
   #      END IF
   #   ELSE
   #      LET l_inaj013 = 1
   #      LET l_inaj014 = 1
   #      LET l_inaj046 = 1
   #      LET l_inaj047 = 1         
   #      LET l_inaj048 = 1
   #      LET l_inaj049 = 1
   #      LET l_inaj050 = 1
   #      LET l_inaj051 = 1
   #   END IF
   #
   #   EXECUTE p100_upd_inaj USING l_inaj013,l_inaj014,l_inaj028,l_inaj046,l_inaj047,      
   #                               l_inaj048,l_inaj049,l_inaj050,l_inaj051,      
   #                               g_inag.inag001,g_inag.inag002,g_inag.inag003,      
   #                               g_inag.inag004,g_inag.inag005,g_inag.inag006,      
   #                               l_inaj012,l_inaj045      
   #   
   #END FOREACH
   #161207-00047#1---mark---e  
END FUNCTION

 
{</section>}
 
