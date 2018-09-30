# Prog. Version..: '5.30.28-18.04.16(00002)'     #
#
# Descriptions...: 稅別稅率變更處理 
# Date & Author..: No.FUN-I40011 18/04/13 By doris 
# Modify.........: No.FUN-I40012 18/04/13 By yihsuan 包patch用程式註記

DATABASE ds

GLOBALS "../../config/top.global"
GLOBALS "../4gl/saapt110.global"

FUNCTION s_t110_changetax(p_apa01,p_apa15_o)
   DEFINE p_apa01     LIKE apa_file.apa01   #帳款編號
   DEFINE p_apa15_o   LIKE apa_file.apa15   #舊稅別
   DEFINE l_apa15     LIKE apa_file.apa15   #新稅別
   DEFINE l_apa02     LIKE apa_file.apa02   #帳款日期
   DEFINE l_chtype    LIKE type_file.chr1   #金額重計原則:1.依總額(含稅額)反推稅額,2.依未稅金額推算稅額
   DEFINE l_gec01     LIKE gec_file.gec01   #稅別碼
   DEFINE l_gec02     LIKE gec_file.gec02   #稅別名稱
   DEFINE l_gec04     LIKE gec_file.gec04   #稅率
   DEFINE l_gec05     LIKE gec_file.gec05   #發票聯數
   DEFINE l_gec07     LIKE gec_file.gec07   #單價含稅否
   DEFINE l_flag      LIKE type_file.chr1

   OPEN WINDOW t110_tax_w AT 12,2 WITH FORM "aap/42f/aapt110_changetax"
         ATTRIBUTE (STYLE = g_win_style CLIPPED)

   CALL cl_ui_locale("aapt110_changetax")

   #帶入舊稅別值
   CALL s_t110_get_gec(p_apa15_o) RETURNING l_gec01,l_gec02,l_gec04,l_gec05,l_gec07
   DISPLAY l_gec01,l_gec02,l_gec04,l_gec07 TO apa15_1,gec02_1,apa16_1,gec07_1

   #取得帳款日期
   SELECT apa02 INTO l_apa02
     FROM apa_file
    WHERE apa01 = p_apa01

   WHILE TRUE
      INPUT l_apa15,l_chtype WITHOUT DEFAULTS FROM apa15,chtype

         AFTER FIELD apa15
            IF NOT cl_null(l_apa15) THEN
               #新稅別輸入後需檢核：
               #原單據稅別及變更後的稅別資料有無存在稅別對照表的設定中, 要存在設定才可作變更。
               CALL s_taxchk(p_apa15_o,l_apa15,l_apa02) RETURNING l_flag
               IF l_flag = 'N' THEN
                  NEXT FIELD apa15
               END IF
              
               #稅別輸入後,帶出稅別名稱,稅率,單價含稅否
               CALL s_t110_get_gec(l_apa15) RETURNING l_gec01,l_gec02,l_gec04,l_gec05,l_gec07
               DISPLAY l_gec01,l_gec02,l_gec04,l_gec07 TO apa15,gec02,apa16,gec07
               #根據單價含稅否,預設金額重計原則,允許變更
               IF l_gec07 = 'Y' THEN   #單價含稅
                  LET l_chtype = '1'
               ELSE
                  LET l_chtype = '2'
               END IF
               DISPLAY l_chtype TO chtype
            ELSE
               CALL cl_err(p_apa01,'aap-099',1)
               NEXT FIELD apa15
            END IF

         AFTER FIELD chtype
            DISPLAY l_chtype

         ON ACTION CONTROLP
            INFIELD apa15
               CALL cl_init_qry_var()
               LET g_qryparam.form = "q_hsc"
               LET g_qryparam.arg1 = '1'
               CALL cl_create_qry() RETURNING l_apa15
               DISPLAY l_apa15 TO apa15
               NEXT FIELD apa15
      END INPUT

      IF INT_FLAG THEN
         EXIT WHILE
      END IF

      #金額重計
      CALL s_t110_tax_recount(p_apa01,l_apa15,l_gec04,l_chtype)
      EXIT WHILE 
   END WHILE

   CLOSE WINDOW t110_tax_w
END FUNCTION

#取得稅別資料
FUNCTION s_t110_get_gec(p_gec01)
   DEFINE p_gec01     LIKE gec_file.gec01
   DEFINE l_gec01     LIKE gec_file.gec01   #稅別碼
   DEFINE l_gec02     LIKE gec_file.gec02   #稅別名稱
   DEFINE l_gec04     LIKE gec_file.gec04   #稅率
   DEFINE l_gec05     LIKE gec_file.gec05   #發票聯數
   DEFINE l_gec07     LIKE gec_file.gec07   #單價含稅否

   SELECT gec01,gec02,gec04,gec05,gec07
     INTO l_gec01,l_gec02,l_gec04,l_gec05,l_gec07
     FROM gec_file
    WHERE gec01 = p_gec01
      AND gec011 = '1'  #進項
      AND gecacti = 'Y' 

   RETURN l_gec01,l_gec02,l_gec04,l_gec05,l_gec07
END FUNCTION

#稅別稅率變更金額重計
FUNCTION s_t110_tax_recount(p_apa01,p_apa15,p_apa16,p_chtype)
   DEFINE p_apa01     LIKE apa_file.apa01      #帳款編號
   DEFINE p_apa15     LIKE apa_file.apa15      #稅別
   DEFINE p_apa16     LIKE apa_file.apa16      #稅率
   DEFINE p_chtype    LIKE type_file.chr1      #金額重計原則:1.依總額(含稅額)反推稅額,2.依未稅金額推算稅額
   DEFINE l_success   LIKE type_file.chr1      
   DEFINE l_cnt       LIKE type_file.num10     
   DEFINE l_apb02     LIKE apb_file.apb02      #項次
   DEFINE l_apb09     LIKE apb_file.apb09      #數量
   DEFINE l_apb23     LIKE apb_file.apb23      #原幣單價
   DEFINE l_apb24     LIKE apb_file.apb24      #原幣金額
   DEFINE l_apb08     LIKE apb_file.apb08      #本幣單價
   DEFINE l_apb10     LIKE apb_file.apb10      #本幣金額
   DEFINE l_apb24_n   LIKE apb_file.apb24      #原幣金額(差異調整後)
   DEFINE l_apb10_n   LIKE apb_file.apb10      #本幣金額(差異調整後)
   DEFINE l_apa00     LIKE apa_file.apa00      #帳款性質
   DEFINE l_apa13     LIKE apa_file.apa13      #幣別
   DEFINE l_apa57f    LIKE apa_file.apa57f     #原幣單身合計金額
   DEFINE l_apa57     LIKE apa_file.apa57      #本幣單身合計金額
   DEFINE l_apa31     LIKE apa_file.apa31      #本幣未稅
   DEFINE l_apa31f    LIKE apa_file.apa31f     #原幣未稅
   DEFINE l_apa32     LIKE apa_file.apa32      #本幣稅額
   DEFINE l_apa32f    LIKE apa_file.apa32f     #原幣稅額
   DEFINE l_apa34     LIKE apa_file.apa34      #本幣合計
   DEFINE l_apa34f    LIKE apa_file.apa34f     #原幣合計
   DEFINE l_difff     LIKE type_file.num20_6   #單頭單身原幣差異金額
   DEFINE l_diff      LIKE type_file.num20_6   #單頭單身本幣差異金額
   DEFINE l_sql       STRING

   IF cl_null(p_apa15) OR cl_null(p_apa16) THEN
      RETURN
   END IF

   LET l_success = 'Y'

   #1.更新單頭 稅別,稅率
   #2.根據金額重計原則,重新計算 稅額、未稅金額、含稅金額
   #3.將差異調整在單身金額最大筆

   #取出單頭的原幣/本幣未稅金額,含稅金額
   SELECT apa00,apa13,apa31f,apa31,apa34f,apa34
     INTO l_apa00,l_apa13,l_apa31f,l_apa31,l_apa34f,l_apa34
     FROM apa_file
    WHERE apa01 = p_apa01
   IF cl_null(l_apa31f) THEN LET l_apa31f = 0 END IF
   IF cl_null(l_apa31) THEN LET l_apa31 = 0 END IF
   IF cl_null(l_apa34f) THEN LET l_apa34f = 0 END IF
   IF cl_null(l_apa34) THEN LET l_apa34 = 0 END IF

   SELECT azi04 INTO t_azi04
     FROM azi_file  WHERE azi01 = g_apa.apa13

   BEGIN WORK
   #1.更新單頭 稅別,稅率
    UPDATE apa_file
       SET apa15 = p_apa15,
           apa16 = p_apa16
     WHERE apa01 = p_apa01   

   IF STATUS OR SQLCA.SQLERRD[3] = 0 THEN 
      CALL cl_err3("upd","apa_file",p_apa01,"",STATUS,"","upd apa01",1)
      LET l_success = 'N'
      RETURN
   END IF
   LET g_apa.apa15 = p_apa15
   LET g_apa.apa16 = p_apa16

   #2.根據金額重計原則,重新計算 稅額、未稅金額、含稅金額
   #  以計稅基礎,先算出稅額,再推算另一個金額
   LET l_apa32f = 0
   LET l_apa32 = 0
   CASE p_chtype
      WHEN '1'   #依總額(含稅額)反推稅額
         #稅額
         LET l_apa32f = l_apa34f * p_apa16 / (100 + p_apa16)
         LET l_apa32 = l_apa34 * p_apa16 / (100 + p_apa16) 
         #稅額取位
         LET l_apa32f = cl_digcut(l_apa32f,t_azi04)
         LET l_apa32 = cl_digcut(l_apa32,g_azi04)
         
         #未稅金額
         LET l_apa31f = l_apa34f - l_apa32f
         LET l_apa31 = l_apa34 - l_apa32

      WHEN '2'   #依未稅金額推算稅額
         #稅額
         LET l_apa32f = l_apa31f * (p_apa16/100)
         LET l_apa32 = l_apa31 * (p_apa16/100)
         #稅額取位
         LET l_apa32f = cl_digcut(l_apa32f,t_azi04)
         LET l_apa32 = cl_digcut(l_apa32,g_azi04)

         #含稅金額
         LET l_apa34f = l_apa31f + l_apa32f
         LET l_apa34 = l_apa31 + l_apa32
 
   END CASE  
   #2-2.更新單頭稅額、未稅金額、含稅金額
   UPDATE apa_file
      SET apa31f = l_apa31f,
          apa31 = l_apa31,
          apa32f = l_apa32f,
          apa32 = l_apa32,
          apa34f = l_apa34f,
          apa34 = l_apa34
    WHERE apa01 = p_apa01
   IF STATUS OR SQLCA.SQLERRD[3] = 0 THEN 
      CALL cl_err3("upd","apa_file",p_apa01,"",STATUS,"","upd apa01",1)
      LET l_success = 'N'
      RETURN
   END IF
   LET g_apa.apa31f = l_apa31f
   LET g_apa.apa31 = l_apa31
   LET g_apa.apa32f = l_apa32f
   LET g_apa.apa32 = l_apa32
   LET g_apa.apa34f = l_apa34f
   LET g_apa.apa34 = l_apa34
 
   LET l_cnt = 0 
   SELECT COUNT(1) INTO l_cnt 
     FROM apb_file
    WHERE apb01 = p_apa01
   IF cl_null(l_cnt) THEN LET l_cnt=0 END IF

   #3.將差異調整在單身金額最大筆(單身筆數>0再做)
   IF l_cnt >0 THEN
      LET l_apa57f = 0
      LET l_apa57 = 0
      LET l_difff = 0
      LET l_diff = 0
      #3-1.先把單身金額加總,放到單身合計apa57,apa57f
      LET l_apa57f = 0
      LET l_apa57 = 0
      CALL s_t110_get_apb(l_apa00,p_apa01) RETURNING l_apa57f,l_apa57

      LET l_difff = l_apa31f - l_apa57f
      LET l_diff = l_apa31 - l_apa57

      #將差異調整在單身金額最大筆
      IF l_difff <> 0 OR l_diff <> 0 THEN
         LET l_sql = "SELECT apb02,apb09,apb24,apb10 ",
                     "  FROM apb_file ",
                     " WHERE apb01 = '",p_apa01,"' ",
                     "   AND apb29 <> '3' ",
                     " ORDER BY apb24 DESC "
         PREPARE s_t110_tax_p FROM l_sql
         DECLARE s_t110_tax_c SCROLL CURSOR FOR s_t110_tax_p
         OPEN s_t110_tax_c
         FETCH FIRST s_t110_tax_c INTO l_apb02,l_apb09,l_apb24,l_apb10
         CLOSE s_t110_tax_c 

         LET l_apb24_n = l_apb24 + l_difff
         LET l_apb24_n = cl_digcut(l_apb24_n,t_azi04)
         LET l_apb10_n = l_apb10 + l_diff
         LET l_apb10_n = cl_digcut(l_apb10_n,g_azi04)
 
         #重推單價
         LET l_apb23 = l_apb24_n / l_apb09
         LET l_apb23 = cl_digcut(l_apb23,t_azi03)
         LET l_apb08 = l_apb10_n / l_apb09
         LET l_apb08 = cl_digcut(l_apb08,g_azi03)

         UPDATE apb_file
            SET apb24 = l_apb24_n,
                apb10 = l_apb10_n,
                apb23 = l_apb23,
                apb08 = l_apb08
          WHERE apb01 = p_apa01 AND apb02 = l_apb02

         IF STATUS OR SQLCA.SQLERRD[3] = 0 THEN 
            CALL cl_err3("upd","apb_file",p_apa01,"",STATUS,"","upd apb01",1)
            LET l_success = 'N'
            RETURN
         END IF

         #3-2.更新單身合計金額
         CALL s_t110_get_apb(l_apa00,p_apa01) RETURNING l_apa57f,l_apa57
         UPDATE apa_file
            SET apa57f = l_apa57f,
                apa57 = l_apa57
          WHERE apa01 = p_apa01
         IF STATUS OR SQLCA.SQLERRD[3] = 0 THEN 
            CALL cl_err3("upd","apa_file",p_apa01,"",STATUS,"","upd apa01",1)
            LET l_success = 'N'
            RETURN
         END IF
         LET g_apa.apa57f = l_apa57f
         LET g_apa.apa57 = l_apa57
      END IF
   END IF

   IF l_success = 'Y' THEN
      COMMIT WORK
      CALL cl_err(p_apa01,'aap-511',1)
   ELSE
      ROLLBACK WORK
   END IF
END FUNCTION

#取得單身金額合計
FUNCTION s_t110_get_apb(p_apa00,p_apb01)
   DEFINE p_apa00     LIKE apa_file.apa00
   DEFINE p_apb01     LIKE apb_file.apb01
   DEFINE l_amt1f     LIKE type_file.num20_6
   DEFINE l_amt1      LIKE type_file.num20_6
   DEFINE l_amt2f     LIKE type_file.num20_6
   DEFINE l_amt2      LIKE type_file.num20_6
   DEFINE l_apa57f    LIKE apa_file.apa57f     #原幣單身合計金額
   DEFINE l_apa57     LIKE apa_file.apa57      #本幣單身合計金額

   SELECT azi04 INTO t_azi04
     FROM azi_file  WHERE azi01 = g_apa.apa13

   LET l_amt1f = 0
   LET l_amt1 = 0
   LET l_amt2f = 0
   LET l_amt2 = 0
   LET l_apa57f = 0
   LET l_apa57 = 0
   IF p_apa00 = '12' THEN
         SELECT SUM(apb24),SUM(apb10) INTO l_amt1f,l_amt1 FROM apb_file
          WHERE apb01 = p_apb01
      ELSE
         SELECT SUM(apb24),SUM(apb10) INTO l_amt1f,l_amt1 FROM apb_file
          WHERE apb01 = p_apb01 AND apb29='1' #入庫
      END IF 
         
      SELECT SUM(apb24),SUM(apb10) INTO l_amt2f,l_amt2 FROM apb_file
       WHERE apb01 = p_apb01 AND apb29='3' #倉退
         
      IF cl_null(l_amt1f) THEN LET l_amt1f = 0 END IF
      IF cl_null(l_amt1) THEN LET l_amt1 = 0 END IF
      IF cl_null(l_amt2f) THEN LET l_amt2f = 0 END IF
      IF cl_null(l_amt2) THEN LET l_amt2 = 0 END IF

      IF p_apa00 MATCHES '1*' THEN
        LET l_apa57f = l_amt1f + l_amt2f
        LET l_apa57  = l_amt1 + l_amt2
      END IF
      IF p_apa00 MATCHES '2*' THEN
         LET l_apa57f = l_amt2f + l_amt1f
         LET l_apa57  = l_amt2 + l_amt1
      END IF

      LET l_apa57f = cl_digcut(l_apa57f,t_azi04)
      LET l_apa57 = cl_digcut(l_apa57,g_azi04)
   
      RETURN l_apa57f,l_apa57
END FUNCTION
#FUN-I40011
#FUN-I40012 add
