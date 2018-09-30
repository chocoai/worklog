# Prog. Version..: '5.30.28-18.04.13' #
#
# Descriptions...: 應收稅別稅率變更功能
# Memo...........: 
# Date & Author..: 01/04/20
# Modify.........: No.FUN-I40010 18/04/13 By yihsuan 大陸財務帳款單稅率變更功能
# Modify.........: No.FUN-I40012 18/04/13 By yihsuan 包patch用程式註記
# Modify.........: No.TQC-I40002 18/04/20 By yihsuan 調整單頭金額計算邏輯(CALL saxrp310_bu)

DATABASE ds

GLOBALS "../../config/top.global"

DEFINE g_oma RECORD LIKE oma_file.*
DEFINE g_omb RECORD LIKE omb_file.*
DEFINE g_ogb RECORD LIKE ogb_file.*

DEFINE tm  RECORD
           gec07      LIKE gec_file.gec07,   #變更後含稅否
           chtype     LIKE type_file.chr1    #金額重計原則
           END RECORD

DEFINE g_oma211  LIKE oma_file.oma211

FUNCTION s_t300_change_tax(p_oma01)
   DEFINE p_oma01   LIKE oma_file.oma01
   DEFINE l_sql     STRING 
   DEFINE l_oma21   LIKE oma_file.oma21
   DEFINE l_oma213  LIKE oma_file.oma213
   DEFINE l_gec02   LIKE gec_file.gec02
   DEFINE l_gec04   LIKE gec_file.gec04
   DEFINE l_gec07   LIKE gec_file.gec07
   DEFINE l_flag    LIKE type_file.chr1 
   DEFINE l_success LIKE type_file.chr1

   LET l_success= 'Y'

   IF cl_null(p_oma01) THEN CALL cl_err('',-400,0) RETURN 'N' END IF  

   INITIALIZE g_oma.* TO NULL 
   SELECT * INTO g_oma.* FROM oma_file WHERE oma01 = p_oma01 


   IF g_oma.oma00 = '10' THEN
      LET l_success = 'N'
      RETURN l_success
   END IF

   IF g_oma.omaconf = 'Y' AND g_oma.oma99 IS NULL THEN
      CALL cl_err('','axr-913',1)
      LET l_success = 'N'
      RETURN l_success
   END IF

   IF g_oma.omaconf = 'Y' AND g_oma.oma99 IS NOT NULL AND g_oma.oma33 IS NOT NULL THEN
      LET l_success = 'N'
      RETURN l_success
   END IF

   OPEN WINDOW axrt300_tax
        WITH FORM "axr/42f/axrt300_tax"  ATTRIBUTE (STYLE = g_win_style CLIPPED)
   CALL cl_ui_locale("axrt300_tax")
   
   #抓取原單據稅別/稅別名稱/稅率/含稅否

   LET l_sql = "SELECT oma21,oma211,oma213",
               "  FROM oma_file",
               " WHERE oma01 = '",g_oma.oma01,"'"
   PREPARE t300_tax_p1 FROM l_sql
   EXECUTE t300_tax_p1 INTO l_oma21,g_oma211,l_oma213 

   SELECT gec02 INTO l_gec02 
     FROM gec_file
    WHERE gec01 = l_oma21 
      AND gec011='2'
      AND gecacti = 'Y' 

   IF SQLCA.sqlcode THEN
      CALL cl_err('t300_tax_p1:',SQLCA.sqlcode,1)
      LET l_success = 'N'
      RETURN l_success
   END IF

   DISPLAY l_oma21  TO FORMONLY.taxcode
   DISPLAY l_gec02  TO FORMONLY.taxname
   DISPLAY g_oma211 TO FORMONLY.taxrate
   DISPLAY l_oma213 TO FORMONLY.oma213 

   LET g_oma.oma21 = ''

   INPUT BY NAME g_oma.oma21,tm.chtype
                 WITHOUT DEFAULTS

      BEFORE INPUT

         AFTER FIELD oma21 
            IF NOT cl_null(g_oma.oma21) THEN
               CALL s_taxchk(l_oma21,g_oma.oma21,g_oma.oma02) RETURNING l_flag
               IF l_flag = 'N' THEN
                  NEXT FIELD oma21
               END IF
               SELECT gec02,gec04,gec07 INTO l_gec02,l_gec04,l_gec07
                 FROM gec_file
                WHERE gec01 = g_oma.oma21 
                  AND gec011='2'
                  AND gecacti = 'Y' 
         
               IF l_gec07 = 'Y' THEN
                  LET tm.chtype = 1
               ELSE
                  LET tm.chtype = 2
               END IF
               DISPLAY BY NAME g_oma.oma21
               DISPLAY l_gec02   TO FORMONLY.taxname2
               DISPLAY l_gec04   TO FORMONLY.taxrate2
               DISPLAY l_gec07   TO FORMONLY.gec07 
               DISPLAY tm.chtype TO FORMONLY.chtype
            END IF

               

         ON ACTION CONTROLP
            CASE
               WHEN INFIELD(oma21)
                  CALL cl_init_qry_var()
                  LET g_qryparam.form = "q_hsc"
                  LET g_qryparam.arg1 = '2'
                  CALL cl_create_qry() RETURNING g_oma.oma21
                  DISPLAY BY NAME g_oma.oma21
                  SELECT gec02 INTO l_gec02 
                    FROM gec_file
                   WHERE gec01 = g_oma.oma21 
                     AND gec011='2'
                     AND gecacti = 'Y' 
                  DISPLAY l_gec02 TO FORMONLY.taxname2 
                  NEXT FIELD oma21
            END CASE 
   END INPUT


   IF INT_FLAG THEN
     LET INT_FLAG = 0
     CLOSE WINDOW axrt300_tax  
     LET g_success = 'N'
     LET l_success = 'N'
     RETURN l_success
   END IF

   BEGIN WORK

   CASE
      WHEN l_oma213 = 'Y' AND tm.chtype = 1   #新舊稅別皆為含稅 
           CALL t300_tax_upd(1,l_gec04,l_gec07) RETURNING l_success
      WHEN l_oma213 = 'N' AND tm.chtype = 2   #新舊稅別皆為未稅 
           CALL t300_tax_upd(2,l_gec04,l_gec07) RETURNING l_success
      WHEN l_oma213 = 'N' AND tm.chtype = 1   #新稅別含稅,舊稅別為未稅  
           CALL t300_tax_upd(3,l_gec04,l_gec07) RETURNING l_success
      WHEN l_oma213 = 'Y' AND tm.chtype = 2   #新稅別未稅,舊稅別為含稅 
           CALL t300_tax_upd(4,l_gec04,l_gec07) RETURNING l_success
   END CASE

   IF l_success = 'Y' THEN
      CALL cl_cmmsg(4)
      COMMIT WORK
      LET g_success = 'Y'
   ELSE
      CALL cl_rbmsg(4)
      ROLLBACK WORK
      LET g_success = 'N'
   END IF

   CLOSE WINDOW axrt300_tax 
   RETURN l_success
END FUNCTION


FUNCTION t300_tax_upd(p_type,l_oma211_new,l_oma213_new)
   DEFINE p_type         LIKE type_file.chr1
   DEFINE l_sql          STRING
   DEFINE l_success      LIKE type_file.chr1
   DEFINE tmp            RECORD LIKE omb_file.*
   DEFINE l_oma211_new   LIKE oma_file.oma211
   DEFINE l_oma213_new   LIKE oma_file.oma213
   DEFINE l_21_omb14     LIKE omb_file.omb14        
   DEFINE l_21_omb14t    LIKE omb_file.omb14t       
   DEFINE l_21_omb16     LIKE omb_file.omb16        
   DEFINE l_21_omb16t    LIKE omb_file.omb16t       
   DEFINE l_21_omb18     LIKE omb_file.omb18        
   DEFINE l_21_omb18t    LIKE omb_file.omb18t       
   DEFINE l_omb14x       LIKE oma_file.oma54x
   DEFINE l_oma54x_tot   LIKE oma_file.oma54x
   DEFINE l_oma55_u      LIKE oma_file.oma55
   DEFINE l_oma57_u      LIKE oma_file.oma57
   DEFINE l_omb14x_old    LIKE oma_file.oma54x
   #--TQC-I40002 add start--
   DEFINE l_oeaa08       LIKE oeaa_file.oeaa08
   DEFINE l_oea01        LIKE oea_file.oea01
   #--TQC-I40002 add end--

   LET l_success = 'Y'
   LET l_oma54x_tot = 0

   SELECT azi03,azi04 INTO t_azi03,t_azi04
     FROM azi_file
    WHERE azi01  =g_oma.oma23
      AND aziacti = 'Y'

   LET l_sql = "SELECT * ",
               "  FROM omb_file ",
               " WHERE omb01 = '",g_oma.oma01,"'" 
   DECLARE t300_tax_p2 CURSOR FROM l_sql

   FOREACH t300_tax_p2 INTO tmp.*
      IF STATUS THEN
         EXIT FOREACH
      END IF

      IF p_type = 1 THEN
         LET tmp.omb14t = tmp.omb12 * tmp.omb13
         CALL cl_digcut(tmp.omb14t , t_azi04) RETURNING tmp.omb14t 
         LET l_omb14x = tmp.omb14t * l_oma211_new / (100 + l_oma211_new) 
         CALL cl_digcut(l_omb14x , t_azi04) RETURNING l_omb14x 
         LET tmp.omb14 = tmp.omb14t - l_omb14x
         IF l_oma213_new = 'N' THEN
            LET tmp.omb13 = tmp.omb14 / tmp.omb12
            CALL cl_digcut(tmp.omb13,t_azi03)  RETURNING tmp.omb13 
         END IF
      END IF 

      IF p_type = 2 THEN
         LET tmp.omb14 = tmp.omb12 * tmp.omb13
         LET l_omb14x = tmp.omb14 * l_oma211_new / 100
         CALL cl_digcut(l_omb14x , t_azi04) RETURNING l_omb14x
 
         LET tmp.omb14t = tmp.omb14 + l_omb14x 

         IF l_oma213_new = 'N' THEN
            LET tmp.omb13 = tmp.omb14 / tmp.omb12
         ELSE
            LET tmp.omb13 = tmp.omb14t / tmp.omb12
         END IF
         CALL cl_digcut(tmp.omb13,t_azi03)  RETURNING tmp.omb13 
      END IF

      IF p_type = 3 THEN
         LET l_omb14x = tmp.omb14t * l_oma211_new / (100 + l_oma211_new)
         CALL cl_digcut(l_omb14x , t_azi04) RETURNING l_omb14x
         LET tmp.omb14 = tmp.omb14t - l_omb14x
         IF l_oma213_new = 'N' THEN
            LET tmp.omb13 = tmp.omb14 / tmp.omb12
         ELSE
            LET tmp.omb13 = tmp.omb14t / tmp.omb12
         END IF
         CALL cl_digcut(tmp.omb13,t_azi03)  RETURNING tmp.omb13 
      END IF

      IF p_type = 4 THEN
        #IF l_oma213_new = 'N' THEN
        #   LET tmp.omb14 = tmp.omb12 * tmp.omb13
        #ELSE
            LET l_omb14x_old= (tmp.omb12 * tmp.omb13) * g_oma211 / (100 + g_oma211)
            CALL cl_digcut(l_omb14x_old , t_azi04) RETURNING l_omb14x_old 
            LET tmp.omb14t = tmp.omb12 * tmp.omb13
            CALL cl_digcut(tmp.omb14t , t_azi04) RETURNING tmp.omb14t
            LET tmp.omb14 = tmp.omb14t - l_omb14x_old 
        #END IF
         LET l_omb14x = tmp.omb14 * l_oma211_new / 100
         CALL cl_digcut(l_omb14x , t_azi04) RETURNING l_omb14x
         LET tmp.omb14t = tmp.omb14 + l_omb14x
         IF l_oma213_new = 'N' THEN
            LET tmp.omb13 = tmp.omb14 / tmp.omb12
         ELSE
            LET tmp.omb13 = tmp.omb14t / tmp.omb12
         END IF
         CALL cl_digcut(tmp.omb13,t_azi03)  RETURNING tmp.omb13
      END IF

      LET tmp.omb15  = tmp.omb13  * g_oma.oma24   #本幣單價
      LET tmp.omb16  = tmp.omb14  * g_oma.oma24   #本幣未稅金額
      LET tmp.omb16t = tmp.omb14t * g_oma.oma24   #本幣含稅金額
      LET tmp.omb17  = tmp.omb13  * g_oma.oma58   #發票單價
      LET tmp.omb18  = tmp.omb14  * g_oma.oma58   #發票未稅金額
      LET tmp.omb18t = tmp.omb14t * g_oma.oma58   #發票含稅金額
      CALL cl_digcut(tmp.omb15, g_azi03) RETURNING tmp.omb15  
      CALL cl_digcut(tmp.omb16, g_azi04) RETURNING tmp.omb16  
      CALL cl_digcut(tmp.omb16t,g_azi04) RETURNING tmp.omb16t 
      CALL cl_digcut(tmp.omb17, g_azi03) RETURNING tmp.omb17  
      CALL cl_digcut(tmp.omb18, g_azi04) RETURNING tmp.omb18  
      CALL cl_digcut(tmp.omb18t,g_azi04) RETURNING tmp.omb18t 

      LET l_oma54x_tot = l_oma54x_tot + l_omb14x

      #更新此筆單身項次
       UPDATE omb_file SET * = tmp.*
        WHERE omb01 = g_oma.oma01
          AND omb03 = tmp.omb03
       IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3]=0 THEN
          CALL cl_err3("t300_tax_omb","omb_file",g_oma.oma01,tmp.omb03,SQLCA.SQLCODE,"","update omb",1) 
          LET l_success = 'N' 
       END IF
   END FOREACH

   #更新單頭原幣/本幣/發票金額
   SELECT SUM(omb14) ,SUM(omb14t) ,SUM(omb16) ,SUM(omb16t) ,SUM(omb18) ,SUM(omb18t)
     INTO g_oma.oma54,g_oma.oma54t,g_oma.oma56,g_oma.oma56t,g_oma.oma59,g_oma.oma59t
     FROM omb_file
    WHERE omb01 = g_oma.oma01

   IF cl_null(g_oma.oma54) THEN LET g_oma.oma54  = 0 END IF
   IF cl_null(g_oma.oma54t)THEN LET g_oma.oma54t = 0 END IF
   IF cl_null(g_oma.oma56)  THEN LET g_oma.oma56  = 0 END IF
   IF cl_null(g_oma.oma56t) THEN LET g_oma.oma56t = 0 END IF
   IF cl_null(g_oma.oma59)  THEN LET g_oma.oma59  = 0 END IF
   IF cl_null(g_oma.oma59t) THEN LET g_oma.oma59t = 0 END IF

   #--TQC-I40002 add start--
   UPDATE oma_file
      SET oma21  = g_oma.oma21,
          oma211 = l_oma211_new,
          oma213 = l_oma213_new
    WHERE oma01 = g_oma.oma01
   
   IF SQLCA.sqlcode THEN
      CALL cl_err3("t300_tax_upd","oma_file",g_oma.oma01,"",SQLCA.sqlcode,"","",1)
      LET l_success= 'N'
   END IF
   
   IF g_oma.oma00='11' THEN
      SELECT oeaa08,oea01 INTO l_oeaa08,l_oea01 FROM oeaa_file,oea_file
       WHERE oeaa01 = g_oma.oma16
         AND oeaa02 = '1'
         AND oeaa03 = g_oma.oma165
         AND oeaa01 = oea01
   END IF
   IF g_oma.oma00='13' THEN
      SELECT oeaa08,oea01 INTO l_oeaa08,l_oea01 FROM oeaa_file,oea_file
       WHERE oeaa01 = g_oma.oma16
         AND oeaa02 = '2'
         AND oeaa03 = g_oma.oma165
         AND oeaa01 = oea01
   END IF
   
   LET l_sql = "SELECT ogb_file.* FROM "
               ,cl_get_target_table(g_plant_new,'oga_file'),",",
                cl_get_target_table(g_plant_new,'ogb_file'),
               " WHERE oga01 = '",g_oma.oma16,"'",
               "   AND ogb03 = 1 ",
               "   AND oga01 = ogb01"
   CALL cl_replace_sqldb(l_sql) RETURNING l_sql
   CALL cl_parse_qry_sql(l_sql,g_plant_new) RETURNING l_sql
   PREPARE sel_oea_pre1 FROM l_sql
   EXECUTE sel_oea_pre1 INTO g_ogb.*
   
   SELECT * INTO g_oma.* FROM oma_file WHERE oma01 = g_oma.oma01
   CALL saxrp310_bu(g_oma.*,g_ogb.*,l_oea01,l_oeaa08) RETURNING g_oma.*
   
   LET g_oma.oma56  = g_oma.oma54 * g_oma.oma24
   LET g_oma.oma56x = g_oma.oma54x * g_oma.oma24
   LET g_oma.oma56t = g_oma.oma54t * g_oma.oma24
   
   CALL cl_digcut(g_oma.oma56,g_azi04) RETURNING g_oma.oma56
   CALL cl_digcut(g_oma.oma56x,g_azi04) RETURNING g_oma.oma56x
   CALL cl_digcut(g_oma.oma56t,g_azi04) RETURNING g_oma.oma56t
   
   #--TQC-I40002 add end--


  #--TQC-I40002 mark start--
  ##稅額
  #LET g_oma.oma54x = l_oma54x_tot
  #LET g_oma.oma56x = l_oma54x_tot * g_oma.oma24
  #CALL cl_digcut(g_oma.oma56x,g_azi04) RETURNING g_oma.oma56x 
  #LET g_oma.oma59x = g_oma.oma56x
  #--TQC-I40002 mark end--

  #--TQC-I40002 mark start--
  #UPDATE oma_file
  #   SET oma21  = g_oma.oma21,
  #       oma211 = l_oma211_new,
  #       oma213 = l_oma213_new,
  #       oma50 = g_oma.oma50,oma50t = g_oma.oma54t,
  #       oma54 = g_oma.oma54,oma54x = g_oma.oma54x,oma54t = g_oma.oma54t,
  #       oma56 = g_oma.oma56,oma56x = g_oma.oma56x,oma56t = g_oma.oma56t,
  #       oma59 = g_oma.oma59,oma59x = g_oma.oma59x,oma59t = g_oma.oma59t
  # WHERE oma01 = g_oma.oma01
  #--TQC-I40002 mark end--

  #--TQC-I40002 add start--
  UPDATE oma_file
     SET oma50 = g_oma.oma50,oma50t = g_oma.oma54t,
         oma54 = g_oma.oma54,oma54x = g_oma.oma54x,oma54t = g_oma.oma54t,
         oma56 = g_oma.oma56,oma56x = g_oma.oma56x,oma56t = g_oma.oma56t,
         oma59 = g_oma.oma59,oma59x = g_oma.oma59x,oma59t = g_oma.oma59t
   WHERE oma01 = g_oma.oma01
  #--TQC-I40002 add end--
  
     IF SQLCA.sqlcode THEN
         CALL cl_err3("t300_tax_updoma","oma_file",g_oma.oma01,"",SQLCA.sqlcode,"","",1)
         LET l_success= 'N'
     END IF    

    #更新子帳期
    SELECT * INTO g_oma.* FROM oma_file WHERE oma01 = g_oma.oma01 
    CALL t300_ins_omc('1')

    #若已產生發票(oma10 IS NOT NULL)，進行ome_file變更
    IF g_oma.oma10 <> '' THEN
       UPDATE ome_file
         SET ome21 = g_oma.oma21,ome211 = g_oma.oma211,ome213 = g_oma.oma213,
             ome59 = g_oma.oma59,ome59x = g_oma.oma59x,ome59t = g_oma.oma59t
        WHERE ome03 = g_oma.oma75
          AND ome01 = g_oma.oma10
    END IF

    RETURN l_success

END FUNCTION
#FUN-I40010 add
#FUN-I40012 add
