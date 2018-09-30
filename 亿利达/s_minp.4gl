# Prog. Version..: '5.30.27-19.04.12(00010)'     #
#
# Pattern name...: s_minp.4gl
# Descriptions...: 最小投入套數    
# Date & Author..: 92/11/25 By David
# Usage..........: CALL s_minp(p_wono,p_check,p_percent,p_opseq) RETURNING l_stat,l_qty
# Input Parameter: p_wono     工單單號
#                  p_check    是否檢查(Y/N)
#                  p_percent  檢查上限比率
#                  p_opseq    作業序號 (Null:不分作業序號)  970717 by roger
# Return code....: l_stat     結果碼  0:OK, 1:FAIL
#                  l_qty      最小投入套數
# Revise record..: 93/06/03 By stone  以應發己發比例計算套數
# Modify ........: 94/11/14 By Jackson 為配合發料底搞,及取替代情況
# Modify.........: No.TQC-610132 06/01/25 By Pengu 計算最小發料套數公式改為，((sfa06-sfa063+sfa062)/sfa05)*sfb08
# Modify.........: No.FUN-630083 06/04/06 By pengu 當l_sfa.sfa26 MATCHES '[34]'時SELECT SUM(sfa06/sfa28) INTO l_sfa.sfa06
                                          #        應調整為 SELECT SUM(sfa06/sfa28),SUM(sfa05) INTO l_sfa.sfa06,l_sfa.sf05
# Modify.........: No.MOD-680046 06/08/15 By pengu 計算取替代料的數量時SUM(sfa05)也應改為SUM(sfa05/sfa28)
# Modify.........: No.FUN-680147 06/09/04 By chen 類型轉換
# Modify.........: No.FUN-7C0053 07/12/17 By alex 修改說明only
# Modify.........: No.FUN-870051 08/07/26 By sherry 增加被替代料為Key值
# Modify.........: No.FUN-870092 08/08/31 By Mandy -1349 err
# Modify.........: No.MOD-880070 08/08/08 By claire 報廢sfa063,超領sfa062要計算替代料
# Modify.........: No.MOD-880109 08/08/15 By claire 最小發料套數要依取位無修件捨去
# Modify.........: No.MOD-8B0098 08/11/10 By sherry p_opseq定義類型錯誤 
# Modify.........: No.MOD-910239 09/01/21 By sherry 修改消耗材料及代買料的發料套數   
# Modify.........: No:FUN-9B0140 09/11/25 by dxfwo 新增函數s_minp_routing
# Modify.........: No:FUN-9C0040 10/01/29 by jan 計算最小套數時排除回收料
# Modify.........: No.FUN-A20037 10/03/15 By lilingyu 替代碼sfa26加上"8,Z"的條件
# Modify.........: No:FUN-A60027 10/06/12 by sunchenxu 製造功能優化-平行制程（批量修改）
# Modify.........: No:FUN-A50066 10/06/24 By kim 平行工艺功能
# Modify.........: No:MOD-A60179 10/06/29 By Sarah 修正FUN-870051,SQL不需增加sfa27條件
# Modify.........: No:FUN-A60095 10/07/21 By kim 最小套數要考慮盤盈虧量
# Modify.........: No:TQC-AC0084 10/12/08 By jan sma541-->sma542
# Modify.........: No:CHI-AC0023 11/01/03 By Summer 消耗性料件增加考慮完工誤差率
# Modify.........: No:FUN-B50059 11/05/12 By kim 還原FUN-A60095中,和sfa064有關的所有調整
# Modify.........: No:TQC-B80154 11/08/19 By houlia 取消齊料套數的判斷
# Modify.........: No:TQC-BA0001 11/10/04 By jason SQL寫錯
# Modify.........: No:FUN-C30166 12/06/12 By bart 控卡不可大於工單備料檔的已發+代買量，以最小套數算
# Modify.........: No:MOD-C70211 12/07/25 By ck2yuan l_sfb08值沒抓,但有使用到
# Modify.........: No:FUN-C70037 12/08/14 By fengrui s_minp添加參數p_date,添加跨月補單可用量控管
# Modify.........: No:MOD-CB0161 12/11/20 By Elise 無指定作業編號，需考慮到有指定作業編號為第一站
# Modify.........: No:MOD-D20027 13/03/12 By jt_chen 應排除工單備料中來源特性除消耗材料及代買料回收料不計外，X: 資訊參考也應排除
# Modify.........: No:TQC-D30041 13/03/15 By ck2yuan s_minp_routing中使用到 l_sfa08，但卻沒有給他值得地方。 
# Modify.........: No:MOD-D30196 13/03/22 By bart 當參數asms270 sma73沒勾時需考慮完工誤差率
# Modify.........: No:TQC-D30069 13/03/26 By ck2yuan 修正MOD-CB0161 
# Modify.........: No:MOD-D80039 13/08/08 By Alberti 取替代的單位不同時會算不出最小發料套數
# Modify.........: No:MOD-DC0115 13/10/20 By Alberti 修正 sql 內的 除數 不可有0之情況
# Modify.........: No:TQC-E20003 14/02/07 By lixh1 計算跨月最小發料套數考慮代採買
# Modify.........: No:MOD-E30080 14/03/13 By Alberti 修正 委外製程採購，實收量(rvb08)沒有控卡分站投料的情況
# Modify.........: No:FUN-E60027 14/06/03 By SunLM 調整SQL語法錯誤
# Modify.........: No:MOD-E90068 14/09/16 By liliwen 修正MOD-E30080,修正齊料套數控管異常
# Modify.........: No:MOD-EA0003 14/10/02 By Mandy 當是QC程式且單位小數位數為零(gfe03)時,齊套數做無條件進位
# Modify.........: No:MOD-EA0105 14/10/21 By liliwen 調整qty計算邏輯,減少尾差的問題
# Modify.........: No:MOD-EB0022 14/11/05 By Alberti 修正 qty之邏輯，當月/非當月計算邏輯應當一致
# Modify.........: No:MOD-F10017 15/01/08 By Alberti 修正 非當月 發料套數，沒有考慮到取替代之問題
# Modify.........: No:MOD-F40014 15/04/02 By Alberti 修正 如單身有應發 = 0，會造成其他資料也無法產出之問題
# Modify.........: No:MOD-F40067 15/04/17 By Alberti 修正 如單身有應發 = 0，會造成其他資料也無法產出之問題
# Modify.........: No:MOD-F40118 15/04/28 By Alberti 修正 計算完工誤差率，會計算兩次的問題
# Modify.........: No:MOD-F80027 15/08/05 By catmoon 應排除工單備料中來源特性除消耗材料及代買料回收料不計外，X: 資訊參考也應排除
# Modify.........: No:MOD-F80033 15/08/06 By catmoon 修正s_minp_c3、s_minp_c4的p_date，改為當月份的最大日
# Modify.........: No:MOD-F80144 15/08/24 BY catmoon 修正因asms270未勾選 [工單完工數量檢查發料最小套數](sma73=p_check)時，沒有依據該料號單位的小數位數來進行取位
# Modify.........: No:MOD-F90159 15/10/01 By fionchen 取消MOD-F40067的調整,因為目前產品已有MOD-F90064控卡變更單當替代碼不為[SUTZ6]時,QPA不能為0,故不會有原單問題 
# Modify.........: No:MOD-G10086 16/01/18 By fionchen 調整MOD-E90068,將取得l_rva10的sql往上移動 
# Modify.........: No:MOD-G10116 16/01/21 By fionchen 修正若工單單身只有消耗性料件時,回傳最小套數時,若asms270未勾選[工單完工數量檢查發料最小套數]時,沒有依據該料號單位的小數位數來取位 
# Modify.........: No:MOD-GC0048 16/12/28 By Mandy SQL判斷條件錯誤,l_cnt是抓NOT IN ('E','S','X') 所以l_cnt2要抓IN ('E','S','X')

DATABASE ds
 
GLOBALS "../../config/top.global"   #FUN-7C0053
 
FUNCTION s_minp(p_wono,p_check,p_percent,p_opseq,p_process,p_sequence,p_date)  #FUN-C70037 add 'p_date'
   DEFINE  p_wono	LIKE sfb_file.sfb01,
           p_check	LIKE type_file.chr1,             #No.FUN-680147 VARCHAR(1)
           p_percent	LIKE ima_file.ima31_fac,         #No.FUN-680147 DECIMAL(16,8)
           #p_opseq	LIKE type_file.num5,             #No.FUN-680147 SMALLINT   #MOD-8B0098 mark
           p_opseq	LIKE sfa_file.sfa08,             #No.MOD-8B0098 add 
           p_process    LIKE sfa_file.sfa012,            #No.FUN-A60027 add
           p_sequence   LIKE sfa_file.sfa013,            #No.FUN-A60027 add
           p_date       LIKE type_file.dat,              #No.FUN-C70037 add
           min_set	LIKE sfb_file.sfb08,             #No.FUN-680147 DECIMAL(15,3)
           l_cnt        LIKE type_file.num5,             #No.FUN-680147 SMALLINT 
           l_cnt1       LIKE type_file.num5,             #No.FUN-680147 SMALLINT
           l_sfb08      LIKE sfb_file.sfb08,
           l_sfb93      LIKE sfb_file.sfb93,             #No.FUN-A60027 add
           qty    	LIKE sfb_file.sfb08,             #No.FUN-680147 DECIMAL(15,3)
           l_sfa	RECORD LIKE sfa_file.*,
           l_sfe        RECORD LIKE sfe_file.*,          #No.FUN-C70037 add
           l_sql	LIKE type_file.chr1000,          #No.FUN-680147 VARCHAR(1000)
           l_ima55      LIKE ima_file.ima55,    #No.+437 add
           l_gfe03      LIKE gfe_file.gfe03,    #No.+437 add
           g_sma        RECORD LIKE sma_file.*
   DEFINE  l_cnt2       LIKE type_file.num5     #MOD-910239 add   
   DEFINE  ecm_min_set	LIKE sfb_file.sfb08     #FUN-A50066
   DEFINE  l_ecm012     LIKE ecm_file.ecm012    #FUN-A50066
   DEFINE  l_ecm03      LIKE ecm_file.ecm03     #FUN-A50066
   DEFINE  l_sfb05      LIKE sfb_file.sfb05     #FUN-A50066
   DEFINE  l_sfb06      LIKE sfb_file.sfb06     #FUN-A50066
   DEFINE  l_year       LIKE azn_file.azn02     #FUN-C70037 add # 年度
   DEFINE  l_month      LIKE azn_file.azn04     #FUN-C70037 add # 期別
   DEFINE  l_current    LIKE type_file.chr1     #FUN-C70037 add # 當期否[當期TRUE] 
   DEFINE  l_sfa27      LIKE sfa_file.sfa27     #FUN-C70037 add
   DEFINE  l_sfa100     LIKE sfa_file.sfa100    #FUN-C70037 add
   DEFINE  l_sfa161     LIKE sfa_file.sfa161    #FUN-C70037 add
   DEFINE  l_qty_temp   LIKE sfb_file.sfb08     #FUN-C70037 add 
   DEFINE  l_qty_chk    LIKE sfb_file.sfb08     #FUN-C70037 add # 用於檢查p_date日期后,退料等情況
   DEFINE  l_cnt_1      LIKE type_file.num5     #MOD-DC0115 add
 #TQC-E20003 ------Begin-------
   DEFINE  l_sfa065     LIKE sfa_file.sfa065
   DEFINE  l_sfa26      LIKE sfa_file.sfa26
   DEFINE  l_sfa28      LIKE sfa_file.sfa28
 #TQC-E20003 ------End---------
   DEFINE  l_rva10      LIKE rva_file.rva10    #MOD-E30080 add
   DEFINE  l_qty    	LIKE sfb_file.sfb08    #MOD-EA0105 add
   DEFINE  l_sfa05      LIKE sfa_file.sfa05    #MOD-EB0022 add
  #MOD-F10017-Start-Add
   DEFINE  l_sfa01      LIKE sfa_file.sfa01
   DEFINE  l_sfa03      LIKE sfa_file.sfa03
   DEFINE  l_sfa08      LIKE sfa_file.sfa08
   DEFINE  l_sfa012     LIKE sfa_file.sfa012
   DEFINE  l_sfa013     LIKE sfa_file.sfa013
  #MOD-F10017-End-Add 
   DEFINE l_bdate       LIKE type_file.dat     #MOD-F80033 add
   DEFINE l_edate       LIKE type_file.dat     #MOD-F80033 add
   DEFINE l_correct     LIKE type_file.chr1    #MOD-F80033 add
   DEFINE l_flag        LIKE type_file.chr1    #MOD-G10116 add
   
   SELECT * INTO g_sma.* FROM sma_file WHERE sma00 = '0'
   SELECT sfb08,sfb93 INTO l_sfb08,l_sfb93 FROM sfb_file WHERE sfb01=p_wono  #FUN-C70037 #賦值被mark,故添加 
   #FUN-C70037--add--str--
   LET l_current = TRUE
   IF NOT cl_null(p_date) THEN
      CALL s_yp(p_date) RETURNING l_year,l_month 
      IF (l_year*12+l_month) <> (g_sma.sma51*12+g_sma.sma52) THEN
         LET l_current = FALSE   #開啟使用 
      END IF
      CALL s_azm(l_year,l_month) RETURNING l_correct,l_bdate,l_edate   #當月起始日與截止日 #MOD-F80033 add
   END IF
   #FUN-C70037--add--end-- 
   
   #No.+269 010702 add by linda 判斷若備料全為委外代買時,default給生產數量
   #FUN-C30166---begin mark
   #LET l_cnt=0   LET l_cnt1=0
   #SELECT COUNT(*) INTO l_cnt
   #  FROM sfa_file
   # WHERE sfa01=p_wono
   #SELECT COUNT(*) INTO l_cnt1
   #  FROM sfa_file
   # WHERE sfa01=p_wono
   #   AND sfa065 <>0 
   #IF l_cnt1 IS NULL  THEN LET l_cnt1=0 END IF
   ##IF l_cnt = l_cnt1 THEN     #No.TQC-610132 mark
   #   SELECT sfb08,sfb93,sfb05,sfb06 
   #     INTO l_sfb08,l_sfb93,l_sfb05,l_sfb06   #FUN-A60027 add sfb93  #FUN-A50066
   #     FROM sfb_file
   #    WHERE sfb01=p_wono
   #
   #IF l_cnt = l_cnt1 THEN     #No.TQC-610132 add
   #   IF l_sfb08 IS NULL THEN LET l_sfb08=0 END IF
   #   LET min_set = l_sfb08
   #   RETURN 0,min_set
   #END IF
   #FUN-C30166---end
   #No.+269 end---
   
   #FUN-A50066
   #IF g_sma.sma541 = 'Y' AND l_sfb93 ='Y' THEN  #TQC-AC0084
   IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y' THEN  #TQC-AC0084
      #若走平行工藝的製程工單,若最終站不需發料,則最小套數需看最終站的良品轉出數
      IF cl_null(p_process) THEN
         LET l_ecm012 = NULL
         LET l_ecm03  = NULL
         CALL s_schdat_max_ecm03(p_wono) RETURNING l_ecm012,l_ecm03
         IF l_ecm03 IS NOT NULL AND l_ecm03 > 0 THEN
            LET l_cnt = 0
            SELECT COUNT(*) INTO l_cnt FROM sfa_file 
                           WHERE sfa01=p_wono
                             AND sfa012=l_ecm012
                             AND sfa013=l_ecm03
            IF l_cnt = 0 THEN
               LET ecm_min_set = NULL
               SELECT ecm311 INTO ecm_min_set
                 FROM ecm_file 
                WHERE ecm01=p_wono
                  AND ecm012=l_ecm012
                  AND ecm03=l_ecm03
               IF ecm_min_set IS NULL THEN LET ecm_min_set = 0 END IF
               RETURN 0,ecm_min_set
            END IF
         END IF
      END IF
   END IF

   LET l_flag = 'N'    #MOD-G10116 add
   IF l_current THEN  #FUN-C70037 add # 當期
      #MOD-E30080-Start-Add
     #IF g_prog MATCHES 'apmt200*' AND l_rva10 = 'SUB' THEN   #MOD-E90068 add   #MOD-G10086 mark 
     #   IF cl_null(p_opseq) THEN LET p_opseq = 0 END IF                        #MOD-G10086 mark 
         SELECT DISTINCT rva10 INTO l_rva10  #判斷是否為委外加工
           FROM rva_file,rvb_file
          WHERE rva01 = rvb01 
            AND rvb34 = p_wono  #工單單號
      IF g_prog MATCHES 'apmt200*' AND l_rva10 = 'SUB' THEN   #MOD-E90068 mark  #MOD-G10086 remark
         IF cl_null(p_opseq) THEN LET p_opseq = 0 END IF                        #MOD-G10086 add 
         LET l_sql = 
           "SELECT sfa_file.* FROM sfa_file,pmn_file ",
           " WHERE sfa01='",p_wono,"' AND sfa26 NOT IN ('S','U','Z')", 
           "    AND sfa161>0 AND sfa11 NOT IN ('E','S','X') ",
           "    AND pmn41 = sfa01 ",
           "    AND ((sfa08 = ' ' or sfa08 is NULL) or pmn43 < '",p_opseq,"')"     #MOD-F90159 取消[,] 
          #"    AND sfa05>0 "  #MOD-F40067 add                                     #MOD-F90159 mark
      ELSE      
      #MOD-E30080-End-Add
         LET l_sql=					#消耗材料及代買料回收料不計
           "SELECT * FROM sfa_file",
        #  "  WHERE sfa01='",p_wono,"' AND sfa26 NOT IN ('S','U')",     #FUN-A20037
           "  WHERE sfa01='",p_wono,"' AND sfa26 NOT IN ('S','U','Z')", #FUN-A20037
          #"    AND sfa065=0 AND sfa161>0 AND sfa11 NOT IN ('E','S') "  #FUN-9C0040  #FUN-C30166
          #"    AND sfa161>0 AND sfa11 NOT IN ('E','S') "  #FUN-C30166  #MOD-D20027 mark
           "    AND sfa161>0 AND sfa11 NOT IN ('E','S','X') "           #MOD-D20027 add    #MOD-F90159 取消[,] 
          #"    AND sfa05>0 " #MOD-F40067 add                                              #MOD-F90159 mark
         #IF p_opseq IS NOT NULL THEN
          #-1349 err
          #LET l_sql=l_sql CLIPPED," AND sfa08=",p_opseq         #FUN-870092 mark
          # LET l_sql=l_sql CLIPPED," AND sfa08='",p_opseq,"'"    #FUN-870092 mod
         #END IF
       END IF #MOD-E30080 add  
      #FUN-A60027 begin
     #IF g_sma.sma541 = 'Y' AND l_sfb93 ='Y'    #TQC-AC0084
      IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y'    #TQC-AC0084
         AND (p_process IS NOT NULL OR p_process <> '') THEN
         LET l_sql=l_sql CLIPPED," AND sfa012='",p_process,"'",
                                 " AND sfa013='",p_sequence,"'"
      ELSE
         IF g_prog NOT MATCHES 'apmt200*' THEN  #MOD-E30080-Add if
            IF p_opseq IS NOT NULL THEN
               LET l_sql=l_sql CLIPPED," AND sfa08='",p_opseq,"'"    
            END IF
         END IF                                 #MOD-E30080-Add   
      END IF
      #FUN-A60027 end
      PREPARE s_minp_p FROM l_sql
      DECLARE s_minp_c CURSOR FOR s_minp_p
      LET l_cnt = 0
      SELECT sfb08 INTO l_sfb08 FROM sfb_file WHERE sfb01=p_wono   #MOD-C70211 add
      SELECT COUNT(*)  INTO l_cnt FROM sfa_file 
      #WHERE sfa01=p_wono AND sfa26 NOT IN ('S','U')      #FUN-A20037
       WHERE sfa01=p_wono AND sfa26 NOT IN ('S','U','Z')  #FUN-A20037
         #AND sfa065=0 AND sfa161>0 AND sfa11 NOT IN ('E','S')  #FUN-9C0040  #FUN-C30166
         #AND sfa161>0 AND sfa11 NOT IN ('E','S')  #FUN-C30166  #MOD-D20027 mark
         AND sfa161>0 AND sfa11 NOT IN ('E','S','X')            #MOD-D20027 add
      IF l_cnt > 0 THEN
         SELECT sfb08 INTO min_set FROM sfb_file WHERE sfb01=p_wono
         IF p_check = 'N' THEN  #MOD-F40118 Add
            LET min_set = min_set * (100+p_percent)/100 #MOD-D30196
         END IF                 #MOD-F40118 Add
      ELSE
         #MOD-910239---Begin                                                                                                           
         LET l_cnt2 = 0                                                                                                                
         SELECT COUNT(*)  INTO l_cnt2 FROM sfa_file                                                                                    
        # WHERE sfa01=p_wono AND sfa26 NOT IN ('S','U')      #FUN-A20037                                                                           
          WHERE sfa01=p_wono AND sfa26 NOT IN ('S','U','Z')  #FUN-A20037                                                                             
            #AND sfa161>0 AND (sfa11='E' OR sfa065 > 0)       #TQC-BA0001  #FUN-C30166
           #AND sfa161>0 AND sfa11='E'    #FUN-C30166             #MOD-GC0048 mark
            AND sfa161>0 AND sfa11 IN ('E','S','X')               #MOD-GC0048 add  
         IF l_cnt2 > 0 THEN                                                                                                   
            SELECT sfb08 INTO min_set FROM sfb_file WHERE sfb01=p_wono                                                                 
            LET min_set = min_set * (100+p_percent)/100 #CHI-AC0023 add
           #RETURN 0,min_set         #MOD-G10116 mark
            LET l_flag = 'Y'         #MOD-G10116 add                                                                                                   
         ELSE                                                                                                                          
         #MOD-910239---End 
            LET min_set = 0 
         END IF   #MOD-910239 add 
      END IF
      IF STATUS THEN RETURN 1,0 END IF

     #MOD-F80144--add--start--依單位小數位數取位------
      IF p_check='N' THEN 
         SELECT ima55 INTO l_ima55
           FROM sfb_file,ima_file
          WHERE sfb01=p_wono
            AND sfb05 = ima01
         
         SELECT gfe03 INTO l_gfe03 
           FROM gfe_file 
          WHERE gfe01 = l_ima55
       
         IF SQLCA.sqlcode OR cl_null(l_gfe03) THEN LET l_gfe03 = 0 END IF
         LET min_set = s_trunc(min_set,l_gfe03) 
      END IF 
     #MOD-F80144--add--end-------------------------

     #IF p_check='N' THEN RETURN 0,min_set END IF                      #MOD-G10116 mark
      IF p_check='N' OR l_flag = 'Y' THEN RETURN 0,min_set END IF      #MOD-G10116 add
      
      FOREACH s_minp_c INTO l_sfa.*
         #BugNo:6448
         IF l_sfa.sfa100 = 100 THEN
             CONTINUE FOREACH 
         END IF
         #MOD-DC0115-Start-Add
         LET l_cnt_1 = 0
         SELECT COUNT(*) INTO l_cnt_1 
           FROM sfa_file  
          WHERE sfa01=l_sfa.sfa01
            AND sfa27=l_sfa.sfa03
            AND sfa08=l_sfa.sfa08
            AND sfa012=l_sfa.sfa012  
            AND sfa013=l_sfa.sfa013
            AND sfa28 = 0 
         IF l_cnt_1 > 0 THEN 
            RETURN 1,0 
         END IF    
         #MOD-DC0115-End-Add
       # IF l_sfa.sfa26 MATCHES '[34]' THEN   #FUN-A20037
         IF l_sfa.sfa26 MATCHES '[348]' THEN  #FUN-A20037
          #--------No.MOD-680046 modify
           #SELECT SUM(sfa06/sfa28),SUM(sfa05) INTO l_sfa.sfa06,l_sfa.sfa05 FROM sfa_file  #No.FUN-630083 add
           #MOD-880070-begin-modify
            #SELECT SUM(sfa06/sfa28),SUM(sfa05/sfa28),SUM(sfa063/sfa28),SUM(sfa062/sfa28)  #FUN-B50059      #FUN-C30166
              #INTO l_sfa.sfa06,l_sfa.sfa05,l_sfa.sfa063,l_sfa.sfa062  #FUN-B50059                          #FUN-C30166
            SELECT SUM(sfa06/sfa28),SUM(sfa05/sfa28),SUM(sfa063/sfa28),SUM(sfa062/sfa28),SUM(sfa065/sfa28)  #FUN-C30166 
              INTO l_sfa.sfa06,l_sfa.sfa05,l_sfa.sfa063,l_sfa.sfa062,l_sfa.sfa065                           #FUN-C30166 
              FROM sfa_file  
           #MOD-880070-end-modify
          #--------No.MOD-680046 end 
              WHERE sfa01=l_sfa.sfa01
                AND sfa27=l_sfa.sfa03
                AND sfa08=l_sfa.sfa08
          #     AND sfa12=l_sfa.sfa12    #NO:TQC-B80154  mark
          #     AND sfa27=l_sfa.sfa27   #No:FUN-870051  #MOD-A60179 mark
                AND sfa012=l_sfa.sfa012  #No.FUN-A60027
                AND sfa013=l_sfa.sfa013  #No.FUN-A60027
            IF l_sfa.sfa06 IS NULL THEN LET l_sfa.sfa06 = 0 END IF
         END IF
        #LET qty=(l_sfa.sfa06-l_sfa.sfa063+l_sfa.sfa062)/l_sfa.sfa161           #No.TQC-610132 mark
         #LET qty=((l_sfa.sfa06-l_sfa.sfa063+l_sfa.sfa062)/l_sfa.sfa05)*l_sfb08  #No.TQC-610132 add  #FUN-C30166
         LET qty=((l_sfa.sfa06+l_sfa.sfa065-l_sfa.sfa063+l_sfa.sfa062)/l_sfa.sfa05)*l_sfb08          #FUN-C30166 
         # ---------------------------
         # 已發 - 報費 / 實計單位用量
         # --------------------------- 
         # No.+114 Tommy 考慮發料誤差 
         IF cl_null(l_sfa.sfa100) THEN LET l_sfa.sfa100 = 0 END IF
         IF g_sma.sma899 = 'Y' THEN LET qty = qty * (1+l_sfa.sfa100/100) END IF
         # End Tommy
         IF qty<min_set THEN LET min_set=qty END IF
         # ---------------------------
         # 發料數不可能小於發料套數
         # ---------------------------
         IF qty=0 THEN EXIT FOREACH END IF
      END FOREACH
      LET min_set = min_set * (100+p_percent)/100 
      #No.+437 010718 add by linda 依單位小數位數取位
         SELECT ima55 INTO l_ima55
           FROM sfb_file,ima_file
          WHERE sfb01=p_wono
            AND sfb05 = ima01
           #-->考慮單位小數取位 
            SELECT gfe03 INTO l_gfe03 FROM gfe_file WHERE gfe01 = l_ima55
            IF SQLCA.sqlcode OR cl_null(l_gfe03) THEN LET l_gfe03 = 0 END IF
           #MOD-880109-begin-add
           #(應發20,已發19)最小發料套數 9.5 pcs ,可是生產單位set 取位=0 ,造成可入庫數=10 set ,
           #這樣會造成入庫數>發料套數,應該是可入庫數=9 ,以免欠料user 忘記補發料..
            LET min_set = s_trunc(min_set,l_gfe03) 
           #CALL cl_digcut(min_set,l_gfe03) RETURNING min_set
           #MOD-880109-end-add
      #No.+437 end---
      RETURN 0,min_set
   #FUN-C70037--add--str--
   #依據sfe_file算出當時可用的齊料套數
   ELSE  #不為當期,跨月
      LET min_set = 0
      SELECT sfb08 INTO min_set FROM sfb_file WHERE sfb01=p_wono
      SELECT COUNT(*)  INTO l_cnt FROM sfa_file 
       WHERE sfa01=p_wono AND sfa26 NOT IN ('S','U','Z')  
        #AND sfa161>0 AND sfa11 NOT IN ('E','S')     #MOD-F80027 mark
         AND sfa161>0 AND sfa11 NOT IN ('E','S','X') #MOD-F80027 add
      IF l_cnt > 0 THEN
         SELECT sfb08 INTO min_set FROM sfb_file WHERE sfb01=p_wono
         IF p_check = 'N' THEN #MOD-F40118 Add
            LET min_set = min_set * (100+p_percent)/100  #MOD-D30196
         END IF                #MOD-F40118 add   
      ELSE                                                                                                        
         LET l_cnt2 = 0                                                                                                                
         SELECT COUNT(*)  INTO l_cnt2 FROM sfa_file                                                                                                                                                             
          WHERE sfa01=p_wono AND sfa26 NOT IN ('S','U','Z')                                                                         
            AND sfa161>0 AND sfa11='E'   
         IF l_cnt2 > 0 THEN                                                                                                  
            SELECT sfb08 INTO min_set FROM sfb_file WHERE sfb01=p_wono                                                                 
            LET min_set = min_set * (100+p_percent)/100 
           #RETURN 0,min_set         #MOD-G10116 mark                                                                                                    
            LET l_flag = 'Y'         #MOD-G10116 add                                                                                                   
         ELSE                                                                                                                          
            LET min_set = 0 
         END IF  
      END IF
      IF STATUS THEN RETURN 1,0 END IF


     #MOD-F80144--add--start--依單位小數位數取位------
      IF p_check='N' THEN 
         SELECT ima55 INTO l_ima55
           FROM sfb_file,ima_file
          WHERE sfb01=p_wono
            AND sfb05 = ima01
         
         SELECT gfe03 INTO l_gfe03 
           FROM gfe_file 
          WHERE gfe01 = l_ima55
       
         IF SQLCA.sqlcode OR cl_null(l_gfe03) THEN LET l_gfe03 = 0 END IF
         LET min_set = s_trunc(min_set,l_gfe03) 
      END IF 
     #MOD-F80144--add--end------------------------- 
     #IF p_check='N' THEN RETURN 0,min_set END IF                      #MOD-G10116 mark
      IF p_check='N' OR l_flag = 'Y' THEN RETURN 0,min_set END IF      #MOD-G10116 add
   
     #LET l_sql= " SELECT DISTINCT sfa27,sfa100,sfa161 FROM sfa_file WHERE sfa01 = '", p_wono ,"' ",        #MOD-EB0022 mark
     #LET l_sql= " SELECT DISTINCT sfa27,sfa100,sfa161,sfa05 FROM sfa_file WHERE sfa01 = '", p_wono ,"' ",  #MOD-EB0022 add #MOD-F10017 mark
      LET l_sql= " SELECT DISTINCT sfa27,sfa100,sfa161,sfa05,sfa26,sfa01,  ",                               #MOD-F10017 add 
                 "                 sfa03,sfa08,sfa012,sfa013 ",                                             #MOD-F10017 add 
                 "    FROM sfa_file WHERE sfa01 = '", p_wono ,"' ",                                         #MOD-F10017 add 
                #"    AND sfa26 NOT IN ('S','U','Z') AND sfa161>0 AND sfa11 NOT IN ('E','S')  ",            #MOD-F80027 mark
                 "    AND sfa26 NOT IN ('S','U','Z') AND sfa161>0 AND sfa11 NOT IN ('E','S','X')  "         #MOD-F80027 add   #MOD-F90159 取消[,] 
                #"    AND sfa05>0 " #MOD-F40067 add                                                                           #MOD-F90159 mark

      IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y' 
         AND (p_process IS NOT NULL OR p_process <> '') THEN
         LET l_sql=l_sql CLIPPED," AND sfa012='",p_process,"' ",
                                 " AND sfa013='",p_sequence,"' "
      ELSE
         IF p_opseq IS NOT NULL THEN
            LET l_sql=l_sql CLIPPED," AND sfa08='",p_opseq,"' "    
         END IF
      END IF
      PREPARE s_minp_p2 FROM l_sql
      DECLARE s_minp_c2 CURSOR FOR s_minp_p2

      LET l_sql= "SELECT sfa_file.*,sfe_file.* ",   
                 "  FROM sfe_file,sfa_file ",
                 " WHERE sfe01=sfa01 AND sfe07=sfa03 AND sfe17=sfa12 ", 
                 "   AND sfe14=sfa08 AND sfe27=sfa27 AND sfe012 = sfa012 AND sfe013 = sfa013 ", 
                 "   AND sfe01 = '", p_wono ,"' AND sfe27 = ? ", 
                #"   AND sfa11 NOT IN ('E','S')  ",                                #消耗材料及代買料回收料不計  #MOD-F80027 mark
                 "   AND sfa11 NOT IN ('E','S','X')  ",                                                    #MOD-F80027 add
                #"   AND sfe06 IN ('1','2','3','4') AND sfe04 <= '", p_date ,"' "  #, #FUN-E60027 MAKR #MOD-F80033 mark
                 "   AND sfe06 IN ('1','2','3','4') AND sfe04 <= '", l_edate ,"' "                     #MOD-F80033 add
                 #" ORDER BY sfe04 " #FUN-E60027 MAKR

      IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y' 
         AND (p_process IS NOT NULL OR p_process <> '') THEN
         LET l_sql=l_sql CLIPPED," AND sfe012='",p_process,"' ",
                                 " AND sfe013='",p_sequence,"' "
      ELSE
         IF p_opseq IS NOT NULL THEN
            LET l_sql=l_sql CLIPPED," AND sfe14='",p_opseq,"' "    
         END IF
      END IF
      LET l_sql = l_sql  CLIPPED," ORDER BY sfe04 " #FUN-E60027 add
      PREPARE s_minp_p3 FROM l_sql
      DECLARE s_minp_c3 CURSOR FOR s_minp_p3
   
      LET l_sql= "SELECT sfa_file.*,sfe_file.* ",  #檢查可以用發料套數
                 "  FROM sfe_file,sfa_file ",
                 " WHERE sfe01=sfa01 AND sfe07=sfa03 AND sfe17=sfa12 ",
                 "   AND sfe14=sfa08 AND sfe27=sfa27 AND sfe012 = sfa012 AND sfe013 = sfa013 ",
                 "   AND sfe01 = '", p_wono ,"' AND sfe27 = ? ",
                #"   AND sfa11 NOT IN ('E','S')  ",       #MOD-F80027 mark
                 "   AND sfa11 NOT IN ('E','S','X')  ",   #MOD-F80027 add
                #"   AND sfe06 IN ('1','2','3','4') AND sfe04 > '", p_date ,"' "  #,#FUN-E60027 MAKR #MOD-F80033 mark
                 "   AND sfe06 IN ('1','2','3','4') AND sfe04 > '", l_edate ,"' "                    #MOD-F80033 add
                 #" ORDER BY sfe04 "  #FUN-E60027 MARK

      IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y'
         AND (p_process IS NOT NULL OR p_process <> '') THEN
         LET l_sql=l_sql CLIPPED," AND sfe012='",p_process,"' ",
                                 " AND sfe013='",p_sequence,"' "
      ELSE
         IF p_opseq IS NOT NULL THEN
            LET l_sql=l_sql CLIPPED," AND sfe14='",p_opseq,"' "
         END IF
      END IF
      LET l_sql = l_sql  CLIPPED," ORDER BY sfe04 " #FUN-E60027 add
      PREPARE s_minp_p4 FROM l_sql
      DECLARE s_minp_c4 CURSOR FOR s_minp_p4  

    #TQC-E20003 ---------Begin--------
      LET l_sql= " SELECT sfa065,sfa26,sfa28 FROM sfa_file WHERE sfa01 = '", p_wono ,"' ",
                #"    AND sfa26 NOT IN ('S','U','Z') AND sfa161>0 AND sfa11 NOT IN ('E','S') AND sfa27 = ? "     #MOD-F80027 mark
                 "    AND sfa26 NOT IN ('S','U','Z') AND sfa161>0 AND sfa11 NOT IN ('E','S','X') AND sfa27 = ? " #MOD-F80027 add

      IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y'
         AND (p_process IS NOT NULL OR p_process <> '') THEN
         LET l_sql=l_sql CLIPPED," AND sfa012='",p_process,"' ",
                                 " AND sfa013='",p_sequence,"' "
      ELSE
         IF p_opseq IS NOT NULL THEN
            LET l_sql=l_sql CLIPPED," AND sfa08='",p_opseq,"' "
         END IF
      END IF
      PREPARE s_minp_p5 FROM l_sql
      DECLARE s_minp_c5 CURSOR FOR s_minp_p5
    #TQC-E20003 ---------End----------

     #FOREACH s_minp_c2 INTO l_sfa27,l_sfa100,l_sfa161         #MOD-EB0022 mark
      FOREACH s_minp_c2 INTO l_sfa27,l_sfa100,l_sfa161,l_sfa05 #MOD-EB0022 add
                            ,l_sfa26,l_sfa01,l_sfa03,l_sfa08   #MOD-F10017 add 
                            ,l_sfa012,l_sfa013                 #MOD-F10017 add

      #MOD-F10017-Start-Add #取替代
         IF l_sfa26 MATCHES '[348]' THEN   
            SELECT SUM(sfa05/sfa28) 
              INTO l_sfa05                      
              FROM sfa_file  
             WHERE sfa01=l_sfa01
               AND sfa27=l_sfa03
               AND sfa08=l_sfa08
               AND sfa012=l_sfa012  
               AND sfa013=l_sfa013
         END IF     
       #MOD-F10017-End-Mark      
       
         LET qty = 0 
         LET l_qty = 0    #MOD-EA0105 add
         INITIALIZE l_sfa.* TO NULL
         INITIALIZE l_sfe.* TO NULL
         FOREACH s_minp_c3 USING l_sfa27 INTO l_sfa.*,l_sfe.*   #折算補單日期前可以用最小齊料套數
            LET l_qty_temp = 0  
            IF NOT cl_null(l_sfa.sfa26) AND l_sfa.sfa26 NOT MATCHES '[0]' AND NOT cl_null(l_sfa.sfa28) AND l_sfa.sfa28>0 THEN 
              #LET l_qty_temp = l_sfe.sfe16/l_sfa.sfa28/l_sfa161   #MOD-EA0105 mark
               LET l_qty_temp = l_sfe.sfe16/l_sfa.sfa28            #MOD-EA0105 add
            ELSE 
              #LET l_qty_temp = l_sfe.sfe16/l_sfa161   #MOD-EA0105 mark
               LET l_qty_temp = l_sfe.sfe16            #MOD-EA0105 add
            END IF
            IF l_sfe.sfe06 MATCHES '[123]' THEN
               LET qty = qty + l_qty_temp
            ELSE
               LET qty = qty - l_qty_temp
            END IF
         END FOREACH 
        #LET qty = qty/l_sfa161    #MOD-EA0105 add   #MOD-EB0022 mark
         LET qty = qty/l_sfa05*l_sfb08               #MOD-EB0022 add    
       #TQC-E20003 --------Begin-----
         FOREACH s_minp_c5 USING l_sfa27 INTO l_sfa065,l_sfa26,l_sfa28  
            IF l_sfa065 <> 0 THEN
               IF NOT cl_null(l_sfa26) AND l_sfa26 NOT MATCHES '[0]' AND NOT cl_null(l_sfa28) AND l_sfa28>0 THEN 
                 #LET qty = qty + l_sfa065/l_sfa28/l_sfa161   #MOD-EA0105 mark 
                  LET l_qty = l_qty + l_sfa065/l_sfa28        #MOD-EA0105 add
               ELSE
                 #LET qty = qty + l_sfa065/l_sfa161   #MOD-EA0105 mark
                  LET l_qty = l_qty + l_sfa065        #MOD-EA0105 add
               END IF 
            END IF
         END FOREACH 
       #TQC-E20003 --------End-------
        #LET l_qty = l_qty/l_sfa161   #MOD-EA0105 add  #MOD-EB0022 mark
         LET l_qty = l_qty/l_sfa05*l_sfb08             #MOD-EB0022 add
         LET qty = qty + l_qty        #MOD-EA0105 add
         #檢查補單日期后最小齊料套數
         INITIALIZE l_sfa.* TO NULL
         INITIALIZE l_sfe.* TO NULL
         LET l_qty_chk = qty 
         FOREACH s_minp_c4 USING l_sfa27 INTO l_sfa.*,l_sfe.*  
            LET l_qty_temp = 0  
            IF NOT cl_null(l_sfa.sfa26) AND l_sfa.sfa26 NOT MATCHES '[0]' AND NOT cl_null(l_sfa.sfa28) AND l_sfa.sfa28>0 THEN
              #LET l_qty_temp = l_sfe.sfe16/l_sfa.sfa28/l_sfa161         #MOD-EB0022 mark
               LET l_qty_temp = l_sfe.sfe16/l_sfa.sfa28/l_sfa05*l_sfb08  #MOD-EB0022 add
            ELSE
              #LET l_qty_temp = l_sfe.sfe16/l_sfa161                     #MOD-EB0022 mark
               LET l_qty_temp = l_sfe.sfe16/l_sfa05*l_sfb08              #MOD-EB0022 add
            END IF
            IF l_sfe.sfe06 MATCHES '[123]' THEN
               LET l_qty_chk = l_qty_chk + l_qty_temp
            ELSE
               LET l_qty_chk = l_qty_chk - l_qty_temp
            END IF
            IF l_qty_chk < qty THEN LET qty = l_qty_chk END IF 
         END FOREACH

         IF cl_null(l_sfa100) THEN LET l_sfa100 = 0 END IF
         IF g_sma.sma899 = 'Y' THEN LET qty = qty * (1+l_sfa100/100) END IF  # 考慮發料誤差 
         IF qty < min_set THEN LET min_set = qty END IF
         #IF qty=0 THEN RETURN 0,min_set END IF
         IF qty < 0 THEN RETURN 0,min_set END IF
      END FOREACH 
      LET min_set = min_set * (100+p_percent)/100
      #-->考慮單位小數取位 
      SELECT ima55 INTO l_ima55 FROM sfb_file,ima_file WHERE sfb01=p_wono AND sfb05 = ima01
      SELECT gfe03 INTO l_gfe03 FROM gfe_file WHERE gfe01 = l_ima55
      IF SQLCA.sqlcode OR cl_null(l_gfe03) THEN LET l_gfe03 = 0 END IF
     #MOD-EA0003---mod---str---
     #LET min_set = s_trunc(min_set,l_gfe03)  
     #當元件的組成用量:5 組件底數:7500 ,
     #此數據算出來的min_set = 7,499.963
     #當在做FQC時，就會發生「送驗量合計(7500) > 工單生產數量(7499.963)」
     #故當是QC程式且單位小數位數為零(gfe03)時,做無條件進位
      IF g_prog MATCHES  'aqc*' AND l_gfe03 = 0 THEN
          LET min_set = s_digqty(min_set,l_ima55)
      ELSE
          LET min_set = s_trunc(min_set,l_gfe03)
      END IF
     #MOD-EA0003---mod---end---

      RETURN 0,min_set 

   END IF 
   #FUN-C70037--add--end--
END FUNCTION

  ##NO.FUN-9B0140  add--begin
FUNCTION s_minp_routing(p_wono1,p_check1,p_percent1,p_operation,p_process,p_sequence)  
   DEFINE  p_wono1      LIKE sfb_file.sfb01,
           p_check1     LIKE type_file.chr1,       
           p_percent1   LIKE ima_file.ima31_fac,      
           p_operation  LIKE sfa_file.sfa08, 
           p_process    LIKE sfa_file.sfa012,           #No.FUN-A60027 add
           p_sequence   LIKE sfa_file.sfa013,           #No.FUN-A60027 add
           min_set      LIKE sfb_file.sfb08,       
           l_cnt        LIKE type_file.num5,   
           l_cnt1       LIKE type_file.num5,   
           l_sfb08      LIKE sfb_file.sfb08,
           l_sfb93      LIKE sfb_file.sfb93,            #No.FUN-A60027 add
           qty          LIKE sfb_file.sfb08,       
           l_sfa        RECORD LIKE sfa_file.*,
           l_sql        LIKE type_file.chr1000,      
           l_ima55      LIKE ima_file.ima55,   
           l_gfe03      LIKE gfe_file.gfe03,   
           g_sma        RECORD LIKE sma_file.*
   DEFINE  l_cnt2       LIKE type_file.num5              
   DEFINE  l_ecm04      LIKE ecm_file.ecm04     #MOD-CB0161 add
   DEFINE  l_cnt_1      LIKE type_file.num5     #MOD-DC0115 add
 
   #TQC-D30041--begin 
   SELECT sfb08,sfb93 INTO l_sfb08,l_sfb93 
     FROM sfb_file
    WHERE sfb01=p_wono1
   #TQC-D30041--end
   SELECT * INTO g_sma.* FROM sma_file WHERE sma00 = '0'
   #No.+269 010702 add by linda 判斷若備料全為委外代買時,default給生產數量
   #FUN-C30166---begin mark
   #LET l_cnt=0   LET l_cnt1=0
   ##FUN-A60027 begin
   ##IF g_sma.sma541 = 'Y' AND l_sfb93 ='Y'  #TQC-AC0084
   #IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y'  #TQC-AC0084
   #   AND (p_process IS NOT NULL OR p_process <> '')THEN
   #   SELECT COUNT(*) INTO l_cnt
   #     FROM sfa_file
   #    WHERE sfa01=p_wono1
   #      AND sfa012 = p_process AND SFA013 = p_sequence    
   #   SELECT COUNT(*) INTO l_cnt1
   #     FROM sfa_file
   #    WHERE sfa01=p_wono1
   #      AND sfa012 = p_process AND SFA013 = p_sequence     
   #      AND sfa065 <>0 
   # #FUN-A60027 end
   #ELSE
   #   SELECT COUNT(*) INTO l_cnt
   #     FROM sfa_file
   #    WHERE sfa01=p_wono1
   #      AND (sfa08 =p_operation OR sfa08 = ' ')
   #   SELECT COUNT(*) INTO l_cnt1
   #     FROM sfa_file
   #    WHERE sfa01=p_wono1
   #      AND (sfa08 =p_operation OR sfa08 = ' ')    
   #      AND sfa065 <>0 
   #END IF
   #IF l_cnt1 IS NULL  THEN LET l_cnt1=0 END IF
   #   SELECT sfb08,sfb93 INTO l_sfb08,l_sfb93   #FUN-A60027 add sfb93
   #     FROM sfb_file
   #    WHERE sfb01=p_wono1
   #
   #IF l_cnt = l_cnt1 THEN     
   #   IF l_sfb08 IS NULL THEN LET l_sfb08=0 END IF
   #   LET min_set = l_sfb08
   #   RETURN 0,min_set
   #END IF
   #FUN-C30166---end
 
   LET l_sql=					#消耗材料及代買料不計
     "SELECT * FROM sfa_file",
    #"  WHERE sfa01='",p_wono1,"' AND sfa26 NOT IN ('S','U')",      #FUN-A20037
     "  WHERE sfa01='",p_wono1,"' AND sfa26 NOT IN ('S','U','Z')",  #FUN-A20037
     "    AND sfa05 > 0 ",                                       #MOD-F40014 add
    #"    AND sfa065=0 AND sfa161>0 AND sfa11<>'E' ",            #FUN-9C0040
    #"    AND sfa065=0 AND sfa161>0 AND sfa11 NOT IN ('E','S')" #FUN-9C0040  #FUN-C30166
    #"    AND sfa161>0 AND sfa11 NOT IN ('E','S')"  #FUN-C30166  #MOD-D20027 mark
     "    AND sfa161>0 AND sfa11 NOT IN ('E','S','X')"           #MOD-D20027 add
     
   #FUN-A60027 begin
  #IF g_sma.sma541 = 'Y' AND l_sfb93 ='Y' #TQC-AC0084
   IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y' #TQC-AC0084
      AND (p_process IS NOT NULL OR p_process <> '')THEN
      LET l_sql=l_sql CLIPPED," AND sfa012='",p_process,"'",
                              " AND sfa013='",p_sequence,"'"  #TQC-BA0001
   ELSE
     #MOD-CB0161---add---S
      IF cl_null(p_operation) AND g_sma.sma541 ='N' THEN          #TQC-D30069 add AND g_sma.sma541 ='N'
         SELECT DISTINCT ecm04 INTO l_ecm04 FROM ecm_file
          WHERE ecm01 = p_wono1
            AND ecm03 IN (SELECT MIN(ecm03) FROM ecm_file WHERE ecm01 = p_wono1)
         LET l_sql=l_sql CLIPPED," AND (sfa08='",l_ecm04,"' OR sfa08= ' ')"
      ELSE
     #MOD-CB0161---add---E
         LET l_sql=l_sql CLIPPED," AND (sfa08='",p_operation,"' OR sfa08= ' ')" #TQC-BA0001
      END IF    #MOD-CB0161 add
   END IF
   #FUN-A60027 end
   PREPARE s_minp_p1 FROM l_sql
   DECLARE s_minp_c1 CURSOR FOR s_minp_p1
   LET l_cnt = 0
   #FUN-A60027 begin
  #IF g_sma.sma541 = 'Y' AND l_sfb93 ='Y'  #TQC-AC0084
   IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y'  #TQC-AC0084
      AND (p_process IS NOT NULL OR p_process <> '')THEN
      SELECT COUNT(*)  INTO l_cnt FROM sfa_file 
       WHERE sfa01=p_wono1 AND sfa26 NOT IN ('S','U','Z')  
         #AND sfa065=0 AND sfa161>0 AND sfa11 NOT IN ('E','S')  #FUN-C30166
         #AND sfa161>0 AND sfa11 NOT IN ('E','S')   #FUN-C30166 #MOD-D20027 mark
         AND sfa161>0 AND sfa11 NOT IN ('E','S','X')            #MOD-D20027 add
         AND sfa012 = p_process AND SFA013 = p_sequence 
   ELSE
   #FUN-A60027 end
      SELECT COUNT(*)  INTO l_cnt FROM sfa_file 
      #WHERE sfa01=p_wono1 AND sfa26 NOT IN ('S','U')      #FUN-A20037
       WHERE sfa01=p_wono1 AND sfa26 NOT IN ('S','U','Z')  #FUN-A20037
        #AND sfa065=0 AND sfa161>0 AND sfa11<>'E'             #FUN-9C0040
         #AND sfa065=0 AND sfa161>0 AND sfa11 NOT IN ('E','S') #FUN-9C0040  #FUN-C30166
         #AND sfa161>0 AND sfa11 NOT IN ('E','S')  #FUN-C30166 #MOD-D20027 mark
         AND sfa161>0 AND sfa11 NOT IN ('E','S','X')           #MOD-D20027 add
         AND (sfa08 =p_operation OR sfa08 = ' ')
   END IF
        
   IF l_cnt > 0 THEN
      SELECT sfb08 INTO min_set FROM sfb_file WHERE sfb01=p_wono1
      LET min_set = min_set * (100+p_percent1)/100  #MOD-D30196  
   ELSE                                                                                                         
      LET l_cnt2 = 0  
     #FUN-A60027 begin 
     #IF g_sma.sma541 = 'Y' AND l_sfb93 ='Y'   #TQC-AC0084
      IF g_sma.sma542 = 'Y' AND l_sfb93 ='Y'   #TQC-AC0084
         AND (p_process IS NOT NULL OR p_process <> '')THEN   
         SELECT COUNT(*)  INTO l_cnt2 FROM sfa_file                                                                                                                                                            
          WHERE sfa01=p_wono1 AND sfa26 NOT IN ('S','U','Z')                                                                               
            #AND sfa161>0 AND (sfa11='E' OR sfa065 > 0)    #TQC-BA0001  #FUN-C30166
            AND sfa161>0 AND sfa11='E'   #FUN-C30166
            AND sfa012 = p_process AND SFA013 = p_sequence 
      #FUN-A60027 end
      ELSE   
         SELECT COUNT(*)  INTO l_cnt2 FROM sfa_file                                                                                    
         #WHERE sfa01=p_wono1 AND sfa26 NOT IN ('S','U')        #FUN-A20037                                                                         
          WHERE sfa01=p_wono1 AND sfa26 NOT IN ('S','U','Z')    #FUN-A20037                                                                            
            #AND sfa161>0 AND (sfa11='E' OR sfa065 > 0)    #TQC-BA0001  #FUN-C30166
            AND sfa161>0 AND sfa11='E'  #FUN-C30166
            AND (sfa08 =p_operation OR sfa08 = ' ')
      END IF
      IF l_cnt2 > 0 THEN                                                                                                            
         SELECT sfb08 INTO min_set FROM sfb_file WHERE sfb01=p_wono1   
         LET min_set = min_set * (100+p_percent1)/100  #MOD-D30196         
         RETURN 0,min_set                                                                                                           
      ELSE             
         LET min_set = 0 
      END IF  
   END IF
   IF STATUS THEN RETURN 1,0 END IF
   IF p_check1='N' THEN RETURN 0,min_set END IF
   FOREACH s_minp_c1 INTO l_sfa.*
      IF l_sfa.sfa100 = 100 THEN
          CONTINUE FOREACH 
      END IF
      #MOD-DC0115-Start-Add
      LET l_cnt_1 = 0
      SELECT COUNT(*) INTO l_cnt_1 
        FROM sfa_file  
       WHERE sfa01=l_sfa.sfa01
         AND sfa27=l_sfa.sfa03
         AND sfa08=l_sfa.sfa08
         AND sfa012=l_sfa.sfa012  
         AND sfa013=l_sfa.sfa013
         AND sfa28 = 0 
      IF l_cnt_1 > 0 THEN 
         RETURN 1,0 
      END IF    
      #MOD-DC0115-End-Add
    # IF l_sfa.sfa26 MATCHES '[34]' THEN    #FUN-A20037
      IF l_sfa.sfa26 MATCHES '[348]' THEN   #FUN-A20037
         #SELECT SUM(sfa06/sfa28),SUM(sfa05/sfa28),SUM(sfa063/sfa28),SUM(sfa062/sfa28)  #AND sfa161>0 AND sfa11='E'  #FUN-C30166
           #INTO l_sfa.sfa06,l_sfa.sfa05,l_sfa.sfa063,l_sfa.sfa062                                                   #FUN-C30166
         SELECT SUM(sfa06/sfa28),SUM(sfa05/sfa28),SUM(sfa063/sfa28),SUM(sfa062/sfa28),SUM(sfa065/sfa28)  #FUN-C30166 
           INTO l_sfa.sfa06,l_sfa.sfa05,l_sfa.sfa063,l_sfa.sfa062,l_sfa.sfa065                           #FUN-C30166 
           FROM sfa_file  
           WHERE sfa01=l_sfa.sfa01
             AND sfa27=l_sfa.sfa03
             AND sfa08=l_sfa.sfa08
            #AND sfa12=l_sfa.sfa12   #MOD-D80039 mark
       #     AND sfa27=l_sfa.sfa27   #No:FUN-870051  #MOD-A60179 mark
             AND sfa012=l_sfa.sfa012  #No.FUN-A60027
             AND sfa013=l_sfa.sfa013  #No.FUN-A60027
         IF l_sfa.sfa06 IS NULL THEN LET l_sfa.sfa06 = 0 END IF
      END IF
      #LET qty=((l_sfa.sfa06-l_sfa.sfa063+l_sfa.sfa062)/l_sfa.sfa05)*l_sfb08  #FUN-C30166
      LET qty=((l_sfa.sfa06+l_sfa.sfa065-l_sfa.sfa063+l_sfa.sfa062)/l_sfa.sfa05)*l_sfb08   #FUN-C30166 
      # ---------------------------
      # 已發 - 報費 / 實計單位用量
      # --------------------------- 
      # No.+114 Tommy 考慮發料誤差 
      IF cl_null(l_sfa.sfa100) THEN LET l_sfa.sfa100 = 0 END IF
      IF g_sma.sma899 = 'Y' THEN LET qty = qty * (1+l_sfa.sfa100/100) END IF
      IF qty<min_set THEN LET min_set=qty END IF
      # ---------------------------
      # 發料數不可能小於發料套數
      # ---------------------------
      IF qty=0 THEN EXIT FOREACH END IF
   END FOREACH
   LET min_set = min_set * (100+p_percent1)/100 
   #No.+437 010718 add by linda 依單位小數位數取位
      SELECT ima55 INTO l_ima55
        FROM sfb_file,ima_file
       WHERE sfb01=p_wono1
         AND sfb05 = ima01
        #-->考慮單位小數取位 
         SELECT gfe03 INTO l_gfe03 FROM gfe_file WHERE gfe01 = l_ima55
         IF SQLCA.sqlcode OR cl_null(l_gfe03) THEN LET l_gfe03 = 0 END IF
        #MOD-880109-begin-add
        #(應發20,已發19)最小發料套數 9.5 pcs ,可是生產單位set 取位=0 ,造成可入庫數=10 set ,
        #這樣會造成入庫數>發料套數,應該是可入庫數=9 ,以免欠料user 忘記補發料..
         LET min_set = s_trunc(min_set,l_gfe03) 
        #CALL cl_digcut(min_set,l_gfe03) RETURNING min_set
   RETURN 0,min_set
END FUNCTION
  ##NO.FUN-9B0140  add--end

