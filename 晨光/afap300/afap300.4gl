# Prog. Version..: '5.00.04-08.02.19(00009)'     #
#
# Pattern name...: afap300.4gl
# Descriptions...: 自動攤提折舊作業
# Date & Author..: 96/06/11 By Melody
#
# Modify ........: 00/12/08 By dennon 1.修改分攤時尾差處理
#                                     2.再次檢查/設定折舊科目
# Modify.........: No.8541 03/10/22 By Kitty 1.折舊金額在開帳時可以為0 2.分攤比率改為可以輸>0 < 100
# Modify.........: No:A099 04/06/29 By Danny 大陸折舊方式/減值準備/資產停用
# Modify.........: MOD-480034 04/08/04 By Kitty 將commit的位置修正
# Modify.........: MOD-4B0086 04/11/11 By Nicola 放寬t_rate,t_rate2小數為十位
# Modify.........: No:FUN-4C0008 04/12/03 By Nicola 單價、金額欄位改為DEC(20,6)
# Modify.........: No:MOD-580157 05/08/18 By Smapmin 折舊費用分攤方式為變動比率時,
#                                                    fan_file的值以及m_curr等值,沒有重新再做四捨五入的動作
# Modify.........: No:MOD-590396 05/10/05 By Smapmin 將BEGIN WORK移到FOREACH外
# Modify.........: No:FUN-5A0003 05/10/13 By Sarah 將m_ratio,mm_ratio放大成DEC(20,10)
# Modify.........: No:MOD-5C0081 05/12/19 By Smapmin 折舊還原處要考慮折畢再提的情況
# Modify.........: No:TQC-5C0096 05/12/21 By Smapmin 折舊期別為1時,本期累折為0
# Modify.........: No:FUN-570144 06/03/03 By yiting 批次作業背景執行
# Modify.........: No:TQC-630004 06/03/06 By Smapmin 資產狀態已無'C'這個選項,故相關程式予以修正
# Modify.........: No:MOD-640109 06/04/09 By Smapmin insert fan10時,要給faj43的值
# Modify.........: No:MOD-640313 06/04/10 By Smapmin 分攤方式為2時,若是afai030沒有分攤資料,則應秀出訊息
# Modify.........: No:MOD-640391 06/04/12 By Smapmin IF cl_null(m_faj24) THEN LET m_faj24=''
# Modify.........: No:FUN-660136 06/06/20 By Ice cl_err --> cl_err3
# Modify.........: No:FUN-670039 06/07/11 By Carrier 帳別擴充為5碼
# Modify.........: No:TQC-640183 06/07/20 By Smapmin 提列折舊有誤
# Modify.........: No.FUN-680028 06/08/25 By Ray 多帳套修改
# Modify.........: No:FUN-680070 06/09/07 By johnray 欄位形態定義改為LIKE形式,并入FUN-680028過單
# Modify.........: No:TQC-690087 06/09/22 By Rayven 累計折舊到第2年時折舊額計算錯誤
# Modify.........: No.TQC-680124 06/10/17 By Smapmin 折舊金額為0,就不寫入fan_file
# Modify.........: No:MOD-690085 06/10/17 By Smapmin LET g_success = 'Y' 應放在整個FOREACH 外面
# Modify.........: No:MOD-690099 06/10/17 By Smapmin update 後要判斷SQLCA.sqlerrd[3]的值
# Modify.........: No:FUN-6A0069 06/10/30 By yjkhero l_time轉g_time
# Modify.........: No:CHI-6A0004 06/10/30 By bnlent g_azixx(本幣取位)與t_azixx(原幣取位)變數定義問題修改
# Modify.........: No:MOD-6C0089 06/12/14 By Smapmin l_last該月份最後一天計算有誤
# Modify.........: No:MOD-710038 07/01/03 By Smapmin 折畢再提當月就做異動處理,重算折舊有誤
# Modify.........: No:FUN-710028 07/01/16 By hellen 錯誤訊息匯總顯示修改
# Modify.........: No:TQC-720032 07/03/01 By johnray 修正期別檢核方式
# Modify.........: No:MOD-740009 07/04/03 By Smapmin 修正MOD-710038
# Modify.........: No:MOD-740095 07/04/22 By Smapmin 修正FUN-680028
# Modify.........: No:MOD-770019 07/07/05 By Smapmin 還原TQC-680124
# Modify.........: No:CHI-790004 07/09/03 By kim 新增段PK值不可為NULL
# Modify.........: No:TQC-780083 07/09/21 By Smapmin 將原本的程式段備份於afap300.bak,該張單子將程式段重新調整
# Modify.........: No:TQC-7B0060 07/11/13 By Rayven 異動單據的日期為自然年月, 沒有轉換成會計月的年月，與會計年月比較，造成異動未過帳的單據檢查不到
# Modify.........: No:MOD-7B0133 07/11/15 By Smapmin 折畢資產不需計算折舊
# Modify.........: No:CHI-810009 08/01/10 By Smapmin 附件依自己的未用年限計算
# Modify.........: No:MOD-820067 08/02/18 By Smapmin 折畢再提時續提折舊,若未折減額為0時,狀態應為4.折畢
# add by lixwz 180624 s---
# Modify.........: No.MOD-CC0065 13/04/15 By apo 增加使用已使用工作量等於預計總工作量來做資產的折畢標準
# Modify.........: No.MOD-D80103 13/08/16 By suncx 工作量法折舊時，控制最後一期折舊後纍計折舊不能大於成本
# Modify.........: No.MOD-E30084 14/03/05 By yinhy 工作量法折旧时，若超出预计总工作量也需要更新afai100累计折旧等栏位
# add by lixwz 180624 e---

DATABASE ds

GLOBALS "../../config/top.global"

DEFINE g_wc,g_sql  STRING,
       m_yy             LIKE faa_file.faa07,
       m_mm             LIKE faa_file.faa08,
       g_yy             LIKE type_file.chr4,
       g_mm             LIKE type_file.chr2,
       g_ym             LIKE type_file.chr6,
       tm               RECORD
                        yy   LIKE type_file.num5,
                        mm   LIKE type_file.num5
                        END RECORD,
       m_tot            LIKE type_file.num20_6,
       m_tot_fan07      LIKE fan_file.fan07,
       m_tot_fan14      LIKE fan_file.fan14,
       m_tot_fan15      LIKE fan_file.fan15,
       m_tot_fan17      LIKE fan_file.fan17,
       m_tot_curr       LIKE type_file.num20_6,
       l_first2,l_last2 LIKE type_file.dat,
       l_first,l_last   LIKE type_file.num5,
       g_cnt,g_cnt2     LIKE type_file.num5,
       g_type           LIKE type_file.chr1,
       g_faj       RECORD LIKE faj_file.*,
       g_fan       RECORD LIKE fan_file.*,
       g_fae       RECORD LIKE fae_file.*,
       m_aao            LIKE type_file.num20_6,
       m_amt,m_amt2,m_cost,m_accd,m_curr LIKE type_file.num20_6,
       m_fan07     LIKE fan_file.fan07,
       m_fan08     LIKE fan_file.fan08,
       m_fan14     LIKE fan_file.fan14,
       m_fan15     LIKE fan_file.fan15,
       m_fan17     LIKE fan_file.fan17,
       mm_fan07    LIKE fan_file.fan07,
       mm_fan08    LIKE fan_file.fan08,
       mm_fan14    LIKE fan_file.fan14,
       mm_fan15    LIKE fan_file.fan15,
       mm_fan17    LIKE fan_file.fan17,
       m_ratio,mm_ratio  LIKE type_file.num26_10,
       m_faa02b    LIKE aaa_file.aaa01,
       m_status    LIKE type_file.chr1,
       l_diff,l_diff2  LIKE fan_file.fan07,
       m_faj24     LIKE faj_file.faj24,
       m_faj30     LIKE faj_file.faj30,
       m_faj32     LIKE faj_file.faj32,
       m_faj203    LIKE faj_file.faj203,
       m_faj57     LIKE faj_file.faj57,
       m_faj571    LIKE faj_file.faj571,
       m_fad05     LIKE fad_file.fad05,
       m_fad031    LIKE fad_file.fad031,
       m_fae08,mm_fae08   LIKE fae_file.fae08,
       p_row,p_col LIKE type_file.num5,
       g_fan_rowid LIKE type_file.chr18, # saki 20070821 rowid chr18 -> num10
       g_fan07_year, g_fan07_all LIKE fan_file.fan07,
       g_msg       LIKE type_file.chr1000,
       l_flag      LIKE type_file.chr1
DEFINE l_bdate     LIKE type_file.dat  #No.TQC-7B0060
DEFINE l_edate     LIKE type_file.dat  #No.TQC-7B0060

DEFINE  g_show_msg  DYNAMIC ARRAY OF RECORD
                  faj02     LIKE faj_file.faj02,
                  faj022    LIKE faj_file.faj022,
                  ze01      LIKE ze_file.ze01,
                  ze03      LIKE ze_file.ze03
        END RECORD,
        l_msg,l_msg2    STRING,
        lc_gaq03  LIKE gaq_file.gaq03


MAIN
   OPTIONS
        FORM LINE     FIRST + 2,
        MESSAGE LINE  LAST-1,
        PROMPT LINE   LAST,
        INPUT NO WRAP
   DEFER INTERRUPT


   INITIALIZE g_bgjob_msgfile TO NULL
   LET g_wc    = ARG_VAL(1)
   LET tm.yy   = ARG_VAL(2)
   LET tm.mm   = ARG_VAL(3)
   LET g_bgjob = ARG_VAL(4)
   IF cl_null(g_bgjob) THEN
      LET g_bgjob= "N"
   END IF

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("AFA")) THEN
      EXIT PROGRAM
   END IF

   WHILE TRUE
      IF g_bgjob = "N" THEN
         SELECT * INTO g_faa.* FROM faa_file WHERE faa00='0'
         SELECT faa02b,faa07,faa08 INTO m_faa02b,m_yy,m_mm FROM faa_file
          WHERE faa00='0'
         IF SQLCA.sqlcode THEN LET m_faa02b='00' END IF
         CALL s_azm(m_yy,m_mm) RETURNING l_flag,l_bdate,l_edate #No.TQC-7B0060
         CALL p300()
         IF cl_sure(18,20) THEN
            LET g_cnt2 = 1
            CALL g_show_msg.clear()
            CALL p300_process()
            IF g_show_msg.getLength() > 0 THEN
               CALL cl_get_feldname("faj02",g_lang) RETURNING lc_gaq03 LET l_msg2=l_msg2.trim(),"|",lc_gaq03 CLIPPED
               CALL cl_get_feldname("faj022",g_lang) RETURNING lc_gaq03 LET l_msg2=l_msg2.trim(),"|",lc_gaq03 CLIPPED
               CALL cl_get_feldname("ze01",g_lang) RETURNING lc_gaq03 LET l_msg2=l_msg2.trim(),"|",lc_gaq03 CLIPPED
               CALL cl_get_feldname("ze03",g_lang) RETURNING lc_gaq03 LET l_msg2=l_msg2.trim(),"|",lc_gaq03 CLIPPED
               CALL cl_getmsg("lib-314",g_lang) RETURNING l_msg
               CALL cl_show_array(base.TypeInfo.create(g_show_msg),l_msg,l_msg2)
               CONTINUE WHILE
            ELSE
               CALL cl_end2(1) RETURNING l_flag
            END IF
            IF l_flag THEN
               CONTINUE WHILE
            ELSE
               CLOSE WINDOW p300_w
               EXIT WHILE
            END IF
         ELSE
            CONTINUE WHILE
         END IF
      ELSE
         LET g_cnt2 = 1
         CALL g_show_msg.clear()
         CALL p300_process()
         IF g_show_msg.getLength() > 0 THEN
            CALL cl_get_feldname("faj02",g_lang) RETURNING lc_gaq03 LET l_msg2=l_msg2.trim(),"|",lc_gaq03 CLIPPED
            CALL cl_get_feldname("faj022",g_lang) RETURNING lc_gaq03 LET l_msg2=l_msg2.trim(),"|",lc_gaq03 CLIPPED
            CALL cl_get_feldname("ze01",g_lang) RETURNING lc_gaq03 LET l_msg2=l_msg2.trim(),"|",lc_gaq03 CLIPPED
            CALL cl_get_feldname("ze03",g_lang) RETURNING lc_gaq03 LET l_msg2=l_msg2.trim(),"|",lc_gaq03 CLIPPED
            CALL cl_getmsg("lib-314",g_lang) RETURNING l_msg
            CALL cl_show_array(base.TypeInfo.create(g_show_msg),l_msg,l_msg2)
         END IF
         CALL cl_batch_bg_javamail(g_success)
         EXIT WHILE
      END IF
   END WHILE
END MAIN

FUNCTION p300()
   DEFINE   lc_cmd    LIKE type_file.chr1000

   OPEN WINDOW p300_w AT p_row,p_col WITH FORM "afa/42f/afap300"
       ATTRIBUTE (STYLE = g_win_style CLIPPED)

   CALL cl_ui_init()

   CLEAR FORM
   CALL cl_opmsg('w')
   IF g_aza.aza26 = '2' THEN
      CALL cl_err('','afa-397',0)
   END IF

#  LET tm.yy=m_yy LET tm.mm=m_mm  #No.TQC-7B0060 mark
   LET tm.yy = YEAR(l_bdate)      #No.TQC-7B0060
   LET tm.mm = MONTH(l_bdate)     #No.TQC-7B0060
   LET m_tot=0
   LET m_tot_fan07=0
   LET m_tot_fan14=0
   LET m_tot_fan15=0
   LET m_tot_fan17=0
   LET m_tot_curr =0
   LET g_yy = m_yy
   LET g_mm = m_mm
   LET g_ym = g_yy USING '&&&&',g_mm USING '&&'
   LET l_first2 = MDY(g_mm,1,g_yy)
   CALL s_mothck_ar(l_first2) RETURNING l_first2,l_last2
   LET l_last = DAY(l_last2)

   LET g_bgjob = "N"

   WHILE TRUE

   CALL cl_opmsg('a')
   DISPLAY g_yy TO FORMONLY.yy
   DISPLAY g_mm TO FORMONLY.mm
   LET g_bgjob = "N"
   INPUT BY NAME g_bgjob WITHOUT DEFAULTS

      ON ACTION CONTROLG
         CALL cl_cmdask()

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE INPUT

      ON ACTION about
         CALL cl_about()

      ON ACTION help
         CALL cl_show_help()

      ON ACTION locale
        CALL cl_dynamic_locale()
        CALL cl_show_fld_cont()
        EXIT INPUT

      ON ACTION qbe_save
         CALL cl_qbe_save()

      ON ACTION exit
         LET INT_FLAG = 1
         EXIT INPUT

   END INPUT

   IF INT_FLAG THEN
      LET INT_FLAG = 0
      CLOSE WINDOW p300_w
      EXIT PROGRAM
   END IF

   CONSTRUCT BY NAME g_wc ON faj09,faj04,faj02

     BEFORE CONSTRUCT
        CALL cl_qbe_init()

     ON ACTION locale
        CALL cl_dynamic_locale()
        CALL cl_show_fld_cont()
        EXIT CONSTRUCT

     ON IDLE g_idle_seconds
        CALL cl_on_idle()
        CONTINUE CONSTRUCT

     ON ACTION about
        CALL cl_about()

     ON ACTION help
        CALL cl_show_help()

     ON ACTION controlg
        CALL cl_cmdask()

     ON ACTION exit
        LET INT_FLAG = 1
        EXIT CONSTRUCT

     ON ACTION qbe_select
        CALL cl_qbe_select()

   END CONSTRUCT

   IF INT_FLAG THEN
      LET INT_FLAG = 0
      CLOSE WINDOW p300_w
      EXIT PROGRAM
   END IF

   IF g_wc =' 1=1' THEN
      CALL cl_err('','9046',0)
      CONTINUE WHILE
   END IF

   IF g_bgjob = "Y" THEN
      SELECT zz08 INTO lc_cmd FROM zz_file
       WHERE zz01 = "afap300"
      IF SQLCA.sqlcode OR lc_cmd IS NULL THEN
         CALL cl_err('afap300','9031',1)
      ELSE
         LET g_wc=cl_replace_str(g_wc, "'", "\"")
         LET lc_cmd = lc_cmd CLIPPED,
                      " '",g_wc CLIPPED,"'",
                      " '",tm.yy CLIPPED,"'",
                      " '",tm.mm CLIPPED,"'",
                      " '",g_bgjob  CLIPPED,"'"
         CALL cl_cmdat('afap300',g_time,lc_cmd CLIPPED)
      END IF
      CLOSE WINDOW p300_w
      EXIT PROGRAM
   END IF
   EXIT WHILE
END WHILE

END FUNCTION

FUNCTION p300_process()
   DEFINE   l_over      LIKE type_file.chr1,
            l_fbi02     LIKE fbi_file.fbi02,
            l_fbi021    LIKE fbi_file.fbi021,
            l_faj33     LIKE faj_file.faj33,
            m_faj35     LIKE faj_file.faj35,
            p_yy,p_mm   LIKE type_file.num5,
            p_fan08     LIKE fan_file.fan08,
            p_fan15     LIKE fan_file.fan15,
            l_rate      LIKE azx_file.azx04,
            l_rate_y    LIKE type_file.num20_6,
            t_rate      LIKE type_file.num26_10,
            t_rate2     LIKE type_file.num26_10,
            l_fgj05     LIKE fgj_file.fgj05, #本月实际总工作量
            s_fgj05     LIKE fgj_file.fgj05, #add by ganlinbing 20120705 本月之前实际总工作量
            l_amt_y     LIKE faj_file.faj31


   #------------------ 資產主檔 SQL ----------------------------------
   # 判斷 資產狀態, 開始折舊年月, 確認碼, 折舊方法, 剩餘月數
   LET g_sql="SELECT '1',faj_file.* FROM faj_file ",
             #" WHERE faj43 NOT MATCHES '[0567X]' ",     #MOD-7B0133
             " WHERE faj43 NOT IN ('0','4','5','6','7','X') ",     #MOD-7B0133
             " AND faj27 <= '",g_ym CLIPPED,"'",
             " AND fajconf='Y' AND ",g_wc CLIPPED
   IF g_aza.aza26 = '2' THEN
      LET g_sql = g_sql CLIPPED," AND faj28 IN ('1','2','3','4')"
   ELSE
      LET g_sql = g_sql CLIPPED," AND faj28 IN ('1','2','3')"
   END IF
   #已停用資產是否提列折舊
   IF g_faa.faa30 = 'N' THEN
      LET g_sql = g_sql CLIPPED," AND (faj105 = 'N' OR faj105 IS NULL)"
   END IF
   LET g_sql = g_sql CLIPPED," UNION ALL ",
               "SELECT '2',faj_file.* FROM faj_file ",   #折畢再提/續提
               " WHERE faj43 IN ('7') ",
               " AND faj28 = '1' ",
               " AND fajconf='Y' AND ",g_wc CLIPPED
   #已停用資產是否提列折舊
   IF g_faa.faa30 = 'N' THEN
      LET g_sql = g_sql CLIPPED," AND (faj105 = 'N' OR faj105 IS NULL)"
   END IF
   LET g_sql = g_sql CLIPPED," ORDER BY 3,4,5 "

   PREPARE p300_pre FROM g_sql
   IF STATUS THEN
      CALL cl_err('p300_pre',STATUS,0)
      RETURN
   END IF
   DECLARE p300_cur CURSOR WITH HOLD FOR p300_pre
   FOREACH p300_cur INTO g_type,g_faj.*
      IF SQLCA.sqlcode THEN
         CALL cl_err('p300_cur foreach:',STATUS,1)
         EXIT FOREACH
      END IF
      LET g_success='Y'
      BEGIN WORK
      #--折舊月份已提列折舊,則不再提列(訊息不列入清單中)
      LET g_cnt = 0
      SELECT COUNT(*) INTO g_cnt FROM fan_file
        WHERE fan01=g_faj.faj02 AND fan02=g_faj.faj022
#         AND (fan03>tm.yy OR (fan03=tm.yy AND fan04>=tm.mm)) #No.TQC-7B0060 mark
          AND (fan03>m_yy OR (fan03=m_yy AND fan04>=m_mm))    #No.TQC-7B0060
          AND fan05 <> '3' AND fan041='1'
      IF g_cnt > 0 THEN
         CONTINUE FOREACH
      END IF
      #--

      #--已全額提列減值準備的固定資產,不再提列折舊
      IF g_faj.faj33 - (g_faj.faj101 - g_faj.faj102) <= 0 THEN
         CALL cl_getmsg("afa-177",g_lang) RETURNING l_msg
         LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
         LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
         LET g_show_msg[g_cnt2].ze01   = 'afa-177'
         LET g_show_msg[g_cnt2].ze03   = l_msg
         LET g_cnt2 = g_cnt2 + 1
         CONTINUE FOREACH
      END IF
      #--

      #--檢核異動未過帳
      LET g_cnt=0
      SELECT COUNT(*) INTO g_cnt FROM fay_file,faz_file
        WHERE fay01=faz01 AND faz03=g_faj.faj02 AND faz031=g_faj.faj022
          AND faypost<>'Y' AND YEAR(fay02)=tm.yy AND MONTH(fay02)=tm.mm
          AND fayconf<>'X'
      IF g_cnt > 0 THEN
         CALL cl_getmsg("afa-180",g_lang) RETURNING l_msg
         LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
         LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
         LET g_show_msg[g_cnt2].ze01   = 'afa-180'
         LET g_show_msg[g_cnt2].ze03   = l_msg
         LET g_cnt2 = g_cnt2 + 1
         CONTINUE FOREACH
      END IF

      LET g_cnt=0
      SELECT COUNT(*) INTO g_cnt FROM fba_file,fbb_file
        WHERE fba01=fbb01 AND fbb03=g_faj.faj02 AND fbb031=g_faj.faj022
          AND fbapost<>'Y' AND YEAR(fba02)=tm.yy AND MONTH(fba02)=tm.mm
          AND fbaconf<>'X'
      IF g_cnt > 0 THEN
         CALL cl_getmsg("afa-181",g_lang) RETURNING l_msg
         LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
         LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
         LET g_show_msg[g_cnt2].ze01   = 'afa-181'
         LET g_show_msg[g_cnt2].ze03   = l_msg
         LET g_cnt2 = g_cnt2 + 1
         CONTINUE FOREACH
      END IF

      LET g_cnt=0
      SELECT COUNT(*) INTO g_cnt FROM fbc_file,fbd_file
        WHERE fbc01=fbd01 AND fbd03=g_faj.faj02 AND fbd031=g_faj.faj022
          AND fbcpost<>'Y' AND YEAR(fbc02)=tm.yy AND MONTH(fbc02)=tm.mm
          AND fbcconf<>'X'
      IF g_cnt > 0 THEN
         CALL cl_getmsg("afa-182",g_lang) RETURNING l_msg
         LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
         LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
         LET g_show_msg[g_cnt2].ze01   = 'afa-182'
         LET g_show_msg[g_cnt2].ze03   = l_msg
         LET g_cnt2 = g_cnt2 + 1
         CONTINUE FOREACH
      END IF

      LET g_cnt=0
      SELECT COUNT(*) INTO g_cnt FROM fgh_file,fgi_file
        WHERE fgh01=fgi01 AND fgi06=g_faj.faj02 AND fgi07=g_faj.faj022
          AND fghconf<>'Y' AND YEAR(fgh02)=tm.yy AND MONTH(fgh02)=tm.mm
      IF g_cnt > 0 THEN
         CALL cl_getmsg("afa-183",g_lang) RETURNING l_msg
         LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
         LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
         LET g_show_msg[g_cnt2].ze01   = 'afa-183'
         LET g_show_msg[g_cnt2].ze03   = l_msg
         LET g_cnt2 = g_cnt2 + 1
         CONTINUE FOREACH
      END IF
      #--

      #--檢核當月處份應提列折舊='N',已存在處份資料,不可進行折舊
      IF g_faa.faa23 = 'N' THEN
         LET g_cnt=0
         SELECT COUNT(*) INTO g_cnt FROM fbg_file,fbh_file
           WHERE fbg01=fbh01 AND fbh03=g_faj.faj02 AND fbh031=g_faj.faj022
             AND YEAR(fbg02)=tm.yy AND MONTH(fbg02)=tm.mm
             AND fbgconf<>'X'
         IF g_cnt > 0 THEN
            CALL cl_getmsg("afa-184",g_lang) RETURNING l_msg
            LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
            LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
            LET g_show_msg[g_cnt2].ze01   = 'afa-184'
            LET g_show_msg[g_cnt2].ze03   = l_msg
            LET g_cnt2 = g_cnt2 + 1
            CONTINUE FOREACH
         END IF

         LET g_cnt=0
         SELECT COUNT(*) INTO g_cnt FROM fbe_file,fbf_file
           WHERE fbe01=fbf01 AND fbf03=g_faj.faj02 AND fbf031=g_faj.faj022
             AND YEAR(fbe02)=tm.yy AND MONTH(fbe02)=tm.mm
             AND fbeconf<>'X'
         IF g_cnt > 0 THEN
            CALL cl_getmsg("afa-185",g_lang) RETURNING l_msg
            LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
            LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
            LET g_show_msg[g_cnt2].ze01   = 'afa-185'
            LET g_show_msg[g_cnt2].ze03   = l_msg
            LET g_cnt2 = g_cnt2 + 1
            CONTINUE FOREACH
         END IF
      END IF
      #--

      #--若在折舊月份前就為先前折畢
#No.TQC-7B0060 --start--
#     IF g_faj.faj30 = 0 and ( g_faj.faj57 < tm.yy or
#        ( g_faj.faj57=tm.yy and g_faj.faj571 < tm.mm )) THEN
      #IF g_faj.faj30 = 0 and ( g_faj.faj57 < m_yy or           #MOD-CC0065 mark
      IF ((g_faj.faj30 = 0 AND g_faj.faj28 <> '4' ) OR         #MOD-CC0065
         #(g_faj.faj28 = '4' AND g_faj.faj106 = g_faj.faj107)) #MOD-CC0065 #MOD-D80103 mark
          (g_faj.faj28 = '4' AND g_faj.faj106 <= g_faj.faj107)) #MOD-D80103 ADD
         AND ( g_faj.faj57 < m_yy or                           #MOD-CC0065
         ( g_faj.faj57=m_yy and g_faj.faj571 < m_mm )) THEN
#No.TQC-7B0060
         LET l_over = 'Y'
      ELSE
         LET l_over = 'N'
      END IF
      #--
    # mark by lixwz 180624 s---
    #No:140313  Add  <<--yangjian--
    #工作量法提折旧不能用 耐用年限做判断
    #  IF g_faj.faj33 <= g_faj.faj31 and ( g_faj.faj57 < m_yy or
    #     ( g_faj.faj57=m_yy and g_faj.faj571 < m_mm )) THEN
    #     LET l_over = 'Y'
    #  ELSE
    #     LET l_over = 'N'
    #  END IF
    #No:140313  End  <<--yangjian--
    # mark by lixwz 180624 e---

      #--折舊提列時，再檢查/設定折舊科目
      IF g_faa.faa20 = '2' THEN
         IF g_faj.faj23='1' THEN
            DECLARE p300_fbi CURSOR FOR
            SELECT fbi02,fbi021 FROM fbi_file WHERE fbi01=g_faj.faj24 AND fbi03= g_faj.faj04
            FOREACH p300_fbi INTO l_fbi02,l_fbi021
               IF SQLCA.sqlcode THEN
                  EXIT FOREACH
               END IF
               IF NOT cl_null(l_fbi02) THEN
                  EXIT FOREACH
               END IF
               IF g_aza.aza63 = 'Y' THEN
                  IF NOT cl_null(l_fbi021) THEN
                     EXIT FOREACH
                  END IF
               END IF
            END FOREACH
            IF cl_null(l_fbi02) THEN
               CALL cl_getmsg("afa-317",g_lang) RETURNING l_msg
               LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
               LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
               LET g_show_msg[g_cnt2].ze01   = 'afa-317'
               LET g_show_msg[g_cnt2].ze03   = l_msg
               LET g_cnt2 = g_cnt2 + 1
               CONTINUE FOREACH
            END IF
            LET g_faj.faj55 = l_fbi02
            UPDATE faj_file SET faj55=l_fbi02
             WHERE faj01=g_faj.faj01 AND faj02=g_faj.faj02
               AND faj022=g_faj.faj022
            IF STATUS OR SQLCA.sqlerrd[3]=0 THEN
               LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
               LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
               LET g_show_msg[g_cnt2].ze01   = ''
               LET g_show_msg[g_cnt2].ze03   = 'upd faj_file'
               LET g_cnt2 = g_cnt2 + 1
               CONTINUE FOREACH
            END IF
            IF g_aza.aza63 = 'Y' THEN
               IF cl_null(l_fbi021) THEN
                  CALL cl_getmsg("afa-317",g_lang) RETURNING l_msg
                  LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
                  LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
                  LET g_show_msg[g_cnt2].ze01   = 'afa-317'
                  LET g_show_msg[g_cnt2].ze03   = l_msg
                  LET g_cnt2 = g_cnt2 + 1
                  CONTINUE FOREACH
               END IF
               LET g_faj.faj551 = l_fbi021
               UPDATE faj_file SET faj551=l_fbi021
                WHERE faj01=g_faj.faj01 AND faj02=g_faj.faj02
                  AND faj022=g_faj.faj022
               IF STATUS OR SQLCA.sqlerrd[3]=0 THEN
                  LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
                  LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
                  LET g_show_msg[g_cnt2].ze01   = ''
                  LET g_show_msg[g_cnt2].ze03   = 'upd faj_file'
                  LET g_cnt2 = g_cnt2 + 1
                  CONTINUE FOREACH
               END IF
            END IF
         END IF
      ELSE
         IF cl_null(g_faj.faj55) THEN
            CALL cl_getmsg("afa-361",g_lang) RETURNING l_msg
            LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
            LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
            LET g_show_msg[g_cnt2].ze01   = 'afa-361'
            LET g_show_msg[g_cnt2].ze03   = l_msg
            LET g_cnt2 = g_cnt2 + 1
            CONTINUE FOREACH
         END IF
         IF g_aza.aza63 = 'Y' THEN
            IF cl_null(g_faj.faj551) THEN
               CALL cl_getmsg("afa-361",g_lang) RETURNING l_msg
               LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
               LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
               LET g_show_msg[g_cnt2].ze01   = 'afa-361'
               LET g_show_msg[g_cnt2].ze03   = l_msg
               LET g_cnt2 = g_cnt2 + 1
               CONTINUE FOREACH
            END IF
         END IF
      END IF
      #--

      IF g_faj.faj33 <= g_faj.faj31 THEN
         LET g_type = '2'
      ELSE
         LET g_type = '1'
      END IF

      #計算本期折舊金額
      #因為舊資料中,仍有主件止舊,而副件續繼的情形
      #附件之剩餘月數以主件為主
      LET m_faj30=g_faj.faj30
      #-----CHI-810009---------
      #IF not cl_null(g_faj.faj022) THEN
      #   SELECT faj30,faj57,faj571 INTO m_faj30,m_faj57,m_faj571
      #     FROM faj_file WHERE faj02=g_faj.faj02
      #      AND (faj022=' ' OR faj022 IS NULL)
      #      AND faj43 not IN ('4','5','6')
      #   IF SQLCA.sqlcode THEN
      #      LET m_faj30=g_faj.faj30
      #   ELSE
      #   #No.TQC-7B0060 --start--
      #      #IF NOT ( m_faj30=0 AND (m_faj57<tm.yy OR     # 主件已無剩餘月數
      #      #       (m_faj571=tm.yy AND m_faj571<tm.mm))) THEN
      #      IF NOT ( m_faj30=0 AND (m_faj57<m_yy OR
      #             (m_faj571=m_yy AND m_faj571<m_mm))) THEN
      #   #No.TQC-7B0060 --end--
      #         LET m_faj30 = m_faj30 + 1
      #      END IF
      #   END IF
      #   IF m_faj30=0 THEN
      #      LET m_faj30=g_faj.faj30
      #   END IF
      #END IF
      #-----END CHI-810009-----
      #已為最後一期折舊則將剩餘淨值一併視為該期折舊
      LET l_amt_y = 0
      IF m_faj30=1 THEN
         IF g_type = '1' THEN
            LET m_amt=g_faj.faj14+g_faj.faj141-g_faj.faj59
                                  -(g_faj.faj32-g_faj.faj60)
                                  -(g_faj.faj101-g_faj.faj102) - g_faj.faj31
         ELSE
            LET m_amt=g_faj.faj14+g_faj.faj141-g_faj.faj59
                                 -(g_faj.faj32-g_faj.faj60)-g_faj.faj35
         END IF
      ELSE
         IF m_faj30 = 0 THEN
            LET m_amt = 0
         ELSE
            CASE g_faj.faj28
               WHEN '1'    #有殘值
                  IF g_type = '1' THEN   #一般提列
                     LET m_amt=(g_faj.faj14+g_faj.faj141-g_faj.faj59-
                               (g_faj.faj32-g_faj.faj60)-g_faj.faj31-
                               (g_faj.faj101-g_faj.faj102))/m_faj30
                  ELSE                   #折畢提列
                     LET m_amt=(g_faj.faj14+g_faj.faj141-g_faj.faj59-
                               (g_faj.faj32-g_faj.faj60)-g_faj.faj35)/
                               m_faj30
                  END IF
               WHEN '2'    #無殘值
                  IF g_aza.aza26 = '2' THEN      #雙倍餘額遞減法
                     IF m_faj30 > 24 THEN
                        IF g_faj.faj108 = 0 OR (g_faj.faj30 MOD 12 = 0) THEN   #TQC-690087
                           LET l_rate_y = (2/(g_faj.faj29/12))
                           LET l_amt_y = (g_faj.faj14+g_faj.faj141-
                                          g_faj.faj59-
                                         (g_faj.faj32-g_faj.faj60))*l_rate_y
                           LET m_amt = l_amt_y / 12
                        ELSE
                           LET m_amt = g_faj.faj108 / 12
                        END IF
                     ELSE
                        IF m_faj30 = 24 THEN
                           LET l_amt_y = (g_faj.faj14+g_faj.faj141-
                                          g_faj.faj59-
                                         (g_faj.faj32-g_faj.faj60)-
                                          g_faj.faj31) / 2
                           LET m_amt = l_amt_y / 12
                        ELSE
                           LET m_amt = g_faj.faj108 / 12
                        END IF
                     END IF
                  ELSE
                     LET m_amt=(g_faj.faj14+g_faj.faj141-g_faj.faj59-
                               (g_faj.faj32-g_faj.faj60))/m_faj30
                  END IF
               WHEN '3'    #定率餘額遞減法
                  IF g_aza.aza26 = '2' THEN    #年數總合法
                     IF g_faj.faj108 = 0 OR (g_faj.faj30 MOD 12 = 0) THEN
                        LET l_rate_y = (m_faj30/12)/((g_faj.faj29/12)*
                                       ((g_faj.faj29/12)+1)/2)
                        LET l_amt_y = (g_faj.faj14+g_faj.faj141-g_faj.faj31)
                                       * l_rate_y
                        LET m_amt = l_amt_y / 12
                     ELSE
                        LET m_amt = g_faj.faj108 / 12
                     END IF
                  ELSE
                     IF g_type = '1' THEN   #一般提列
                        LET t_rate = 0
                        LET t_rate2= 0
                        SELECT power(g_faj.faj31/(g_faj.faj14+g_faj.faj141),
                                   1/(g_faj.faj29/12)) INTO t_rate
                          FROM faa_file
                         WHERE faa00 = '0'
                        LET t_rate2 = ((1 - t_rate) /12) * 100
                        LET m_amt=(g_faj.faj14+g_faj.faj141-g_faj.faj59-
                                  (g_faj.faj32-g_faj.faj60)) *
                                  t_rate2 / 100
                     ELSE                   #折畢提列
                        LET t_rate = 0
                        LET t_rate2= 0
                        SELECT power(g_faj.faj35/(g_faj.faj14+g_faj.faj141),
                                   1/(g_faj.faj29/12)) INTO t_rate
                          FROM faa_file
                         WHERE faa00 = '0'
                        LET t_rate2 = ((1 - t_rate) / 12) * 100
                        LET m_amt=(g_faj.faj14+g_faj.faj141-g_faj.faj59-
                                  (g_faj.faj32-g_faj.faj60)) *
                                  t_rate2 / 100
                     END IF
                  END IF
               OTHERWISE EXIT CASE
            END CASE
         END IF
      END IF
      IF g_aza.aza26 = '2' THEN
         IF g_faj.faj28 = '4' THEN      #工作量法
            LET l_fgj05 = 0
            LET s_fgj05 = 0     #add by ganlinbing 20120705 本月之前实际总工作量
            SELECT fgj05 INTO l_fgj05 FROM fgj_file
#            WHERE fgj01 = tm.yy AND fgj02 = tm.mm  #No.TQC-7B0060 mark
             WHERE fgj01 = m_yy AND fgj02 = m_mm    #No.TQC-7B0060
               AND fgj03 = g_faj.faj02 AND fgj04 = g_faj.faj022
               AND fgjconf = 'Y'
            IF cl_null(l_fgj05) THEN LET l_fgj05 = 0 END IF
          #add by ganlinbing 20120705 #算出本月之前实际总工作量
            SELECT sum(fgj05) INTO s_fgj05 FROM fgj_file
             WHERE ((fgj01=m_yy AND fgj02<m_mm) OR fgj01<m_yy)
               AND fgj03 = g_faj.faj02 AND fgj04 = g_faj.faj022
               AND fgjconf = 'Y'
            IF cl_null(s_fgj05) THEN LET s_fgj05 = 0 END IF
          #end add by ganlinbing 20120705 #算出本月之前实际总工作量
            LET l_rate_y = (g_faj.faj14+g_faj.faj141-g_faj.faj31)/g_faj.faj106
            IF (s_fgj05+l_fgj05<g_faj.faj106 OR s_fgj05+l_fgj05=g_faj.faj106) THEN  #add by ganlinbing 20120705
               LET m_amt = l_rate_y * l_fgj05
            END IF   #add by ganlinbing 20120705
            #MOD-D80103 add begin------------------------
            IF (g_faj.faj14+g_faj.faj141-g_faj.faj31-g_faj.faj32) < m_amt THEN
               LET m_amt = g_faj.faj14+g_faj.faj141-g_faj.faj31-g_faj.faj32
            END IF
            #MOD-D80103 add end--------------------------
          #add by ganlinbing 20120705 #截止到本月实际总工作量大于预计总工作量时
            IF s_fgj05+l_fgj05>g_faj.faj106 THEN
            	 LET m_amt = l_rate_y * (g_faj.faj106-s_fgj05)
                 LET g_faj.faj43='4'   #让资产状态变为折毕
            END IF
          #end add by ganlinbing 20120705 #截止到本月实际总工作量大于预计总工作量时
         END IF
         LET l_amt_y = cl_digcut(l_amt_y,g_azi04)
         IF l_amt_y = 0 THEN LET l_amt_y = g_faj.faj108 END IF
         IF g_faj.faj28 NOT MATCHES '[23]' THEN
            LET l_amt_y = 0
         END IF
      ELSE
         LET l_amt_y = 0
      END IF
      #新增一筆折舊費用資料 ----------------------------------------
      IF g_faj.faj23 = '1' THEN
         LET m_faj24 = g_faj.faj24   # 單一部門 -> 折舊部門
      ELSE
         LET m_faj24 = g_faj.faj20   # 多部門分攤 -> 保管部門
      END IF

      LET m_cost=g_faj.faj14+g_faj.faj141-g_faj.faj59  #成本

      IF g_faa.faa15 = '4' THEN
         IF g_ym = g_faj.faj27 THEN    #第一期攤提
            LET l_first = l_last - DAY(g_faj.faj26) + 1
            LET l_rate = l_first / l_last   #攤提比率
            IF cl_null(l_rate) THEN
               LET l_rate = 1
            END IF
            LET m_amt = m_amt * l_rate
         END IF
      END IF
      IF cl_null(m_amt) THEN LET m_amt = 0 END IF
      LET m_amt = cl_digcut(m_amt,g_azi04)
      LET m_accd=g_faj.faj32-g_faj.faj60+m_amt         #累折
      #--->本期累折改由(faj_file)讀取
      #--->本期累折 - 本期銷帳累折
      IF g_faj.faj203 = 0 THEN
         LET m_curr   = m_amt
         LET m_faj203 = m_amt
      ELSE
         LET m_curr=(g_faj.faj203 - g_faj.faj204) + m_amt
         LET m_faj203 = g_faj.faj203 + m_amt
      END IF
      IF m_amt < 0 THEN
         CALL cl_getmsg("afa-178",g_lang) RETURNING l_msg
         LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
         LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
         LET g_show_msg[g_cnt2].ze01   = 'afa-178'
         LET g_show_msg[g_cnt2].ze03   = l_msg
         LET g_cnt2 = g_cnt2 + 1
         CONTINUE FOREACH
      END IF
      IF cl_null(m_faj24) THEN LET m_faj24=' ' END IF
      INSERT INTO fan_file(fan01,fan02,fan03,fan04,fan041,fan05,fan06,
                            fan07,fan08,fan09,fan10,fan11,fan12,fan13,
                            fan14,fan15,fan16,fan17,fan111,fan121)
#                    VALUES(g_faj.faj02,g_faj.faj022,tm.yy,tm.mm,'1', #No.TQC-7B0060
                     VALUES(g_faj.faj02,g_faj.faj022,m_yy,m_mm,'1',   #No.TQC-7B0060
                            g_faj.faj23,m_faj24,m_amt,m_curr,' ',g_faj.faj43,
                            g_faj.faj53,g_faj.faj55,g_faj.faj24,
                            m_cost,m_accd,1,g_faj.faj101-g_faj.faj102,
                            g_faj.faj531,g_faj.faj551)
      IF SQLCA.sqlcode THEN
         LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
         LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
         LET g_show_msg[g_cnt2].ze01   = ''
         LET g_show_msg[g_cnt2].ze03   = 'ins fan_file'
         LET g_cnt2 = g_cnt2 + 1
         LET g_success='N'
         CONTINUE FOREACH
      END IF
      #update 回資產主檔
      # 剩餘月數減 1
      LET m_faj30 = g_faj.faj30 -1
      LET m_faj35 = g_faj.faj35
      IF m_faj30 < 0 THEN LET m_faj30 = 0 END IF
      #----->資產狀態碼
      IF g_type = '2' THEN
         IF m_faj30 > 0 THEN
            LET m_status = '2'
         ELSE
            #LET m_status = '7'   #MOD-820067
            LET m_status = '4'   #MOD-820067
         END IF
      ELSE
         #IF m_faj30=0 THEN                                                                                      #MOD-CC0065 mark
         #IF (m_faj30 = 0 AND g_faj.faj28 <> '4') OR (g_faj.faj28 = '4' AND g_faj.faj106 = g_faj.faj107) THEN    #MOD-CC0065 add #MOD-D80103MARK
         IF (m_faj30 = 0 AND g_faj.faj28 <> '4') OR (g_faj.faj28 = '4' AND g_faj.faj106 <= g_faj.faj107) THEN    #MOD-D80103 add
            #折畢再提:折完時,殘值為0 時 即為折畢
            IF g_faj.faj34 MATCHES '[Nn]' THEN
               LET m_status = '4'
            ELSE
               LET m_status='7'  # 第一次折畢, 即直接當做欲折畢再提
               LET m_faj30 = g_faj.faj36
            END IF
         ELSE
            LET m_status='2'
         END IF
      END IF

    #add by ganlinbing 20120705 当是工作量法时且预计总工作量超过实际总工作量则资产状态为折毕
      IF g_faj.faj28='4' AND (s_fgj05+l_fgj05>g_faj.faj106) THEN
         LET m_status = '4'
      END IF
    #end add by ganlinbing 20120705

      #UPDATE  累折, 未折減額, 剩餘月數, 資產狀態
      #IF l_over = 'N' THEN                                               #MOD-E30084 mark
       IF l_over = 'N' OR (g_faj.faj28='4' AND l_over = 'Y' ) THEN        #MOD-E30084
         LET l_faj33=(g_faj.faj14+g_faj.faj141)-g_faj.faj59
                    -(g_faj.faj32+m_amt-g_faj.faj60)
#No.TQC-7B0060 --start--
#        UPDATE faj_file SET faj57 =tm.yy,                 #最近折舊年
#                            faj571=tm.mm,                 #最近折舊月
         UPDATE faj_file SET faj57 =m_yy,                  #最近折舊年
                             faj571=m_mm,                  #最近折舊月
#No.TQC-7B0060 --end--
                             faj32 =faj32+m_amt,           #累折
                             faj33 =l_faj33,               #未折減額
                             faj30 =m_faj30,               #未用年限
                             faj35 =m_faj35,               #折畢再提預留殘值
                             faj43 =m_status,              #狀態
                             faj203=m_faj203,              #本期累折
                             faj108=l_amt_y                #年折舊額
          WHERE faj02=g_faj.faj02 AND faj022=g_faj.faj022
         IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
            LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
            LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
            LET g_show_msg[g_cnt2].ze01   = ''
            LET g_show_msg[g_cnt2].ze03   = 'upd faj_file'
            LET g_cnt2 = g_cnt2 + 1
            LET g_success='N'
            CONTINUE FOREACH
         END IF
      END IF
   IF g_faj.faj23 = '2' THEN
      #-------- 折舊明細檔 SQL (針對多部門分攤折舊金額) ---------------
#No.TQC-7B0060 --start--
#     LET g_sql="SELECT * FROM fan_file WHERE fan03='",tm.yy,"'",
#             "                         AND fan04='",tm.mm,"'",
      LET g_sql="SELECT * FROM fan_file WHERE fan03='",m_yy,"'",
              "                         AND fan04='",m_mm,"'",
#No.TQC-7B0060 --end--
              "                         AND fan05='2' AND fan041 = '1' ",
              "                         AND fan01='",g_faj.faj02,"'"
      PREPARE p300_pre1 FROM g_sql
      DECLARE p300_cur1 CURSOR WITH HOLD FOR p300_pre1
      FOREACH p300_cur1 INTO g_fan.*
         IF STATUS THEN
            LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
            LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
            LET g_show_msg[g_cnt2].ze01   = ''
            LET g_show_msg[g_cnt2].ze03   = 'foreach p300_cur1'
            LET g_cnt2 = g_cnt2 + 1
            LET g_success='N'
            CONTINUE FOREACH
         END IF
         #-->讀取分攤方式
         SELECT fad05,fad031 INTO m_fad05,m_fad031 FROM fad_file
          WHERE fad01=g_fan.fan03 AND fad02=g_fan.fan04
            AND fad03=g_fan.fan11
            AND fad04=g_fan.fan13
         IF SQLCA.sqlcode THEN
            CALL cl_getmsg("afa-152",g_lang) RETURNING l_msg
            LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
            LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
            LET g_show_msg[g_cnt2].ze01   = 'afa-152'
            LET g_show_msg[g_cnt2].ze03   = l_msg
            LET g_cnt2 = g_cnt2 + 1
            LET g_success='N'
            CONTINUE FOREACH
         END IF
         #-->讀取分母
         IF m_fad05='1' THEN
            SELECT SUM(fae08) INTO m_fae08 FROM fae_file
              WHERE fae01=g_fan.fan03 AND fae02=g_fan.fan04
                AND fae03=g_fan.fan11 AND fae04=g_fan.fan13
            IF SQLCA.sqlcode OR cl_null(m_fae08) THEN
               CALL cl_getmsg("afa-152",g_lang) RETURNING l_msg
               LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
               LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
               LET g_show_msg[g_cnt2].ze01   = 'afa-152'
               LET g_show_msg[g_cnt2].ze03   = l_msg
               LET g_cnt2 = g_cnt2 + 1
               LET g_success='N'
               CONTINUE FOREACH
            END IF
            LET mm_fae08 = m_fae08            # 分攤比率合計
         END IF

         #-->保留金額以便處理尾差
         LET mm_fan07=g_fan.fan07          # 被分攤金額
         LET mm_fan08=g_fan.fan08          # 本期累折金額
         LET mm_fan14=g_fan.fan14          # 被分攤成本
         LET mm_fan15=g_fan.fan15          # 被分攤累折
         LET mm_fan17=g_fan.fan17          # 被分攤減值

         #------- 找 fae_file 分攤單身檔 ---------------
         LET m_tot=0
         DECLARE p300_cur2 CURSOR WITH HOLD FOR
         SELECT * FROM fae_file
          WHERE fae01=g_fan.fan03 AND fae02=g_fan.fan04
            AND fae03=g_fan.fan11 AND fae04=g_fan.fan13
         FOREACH p300_cur2 INTO g_fae.*
            IF SQLCA.sqlcode OR (cl_null(m_fae08) AND m_fad05='1') THEN
               CALL cl_getmsg("afa-152",g_lang) RETURNING l_msg
               LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
               LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
               LET g_show_msg[g_cnt2].ze01   = 'afa-152'
               LET g_show_msg[g_cnt2].ze03   = l_msg
               LET g_cnt2 = g_cnt2 + 1
               LET g_success='N'
               CONTINUE FOREACH
            END IF
            CASE m_fad05
               WHEN '1'
                  SELECT rowid INTO g_fan_rowid FROM fan_file
                   WHERE fan01=g_fan.fan01 AND fan02=g_fan.fan02
                     AND fan03=g_fan.fan03 AND fan04=g_fan.fan04
                     AND fan06=g_fae.fae06 AND fan05='3'
                     AND (fan041 = '1' OR fan041='0')
                  IF STATUS=100 THEN
                     LET g_fan_rowid=NULL
                  END IF
                  LET mm_ratio=g_fae.fae08/mm_fae08*100     # 分攤比率(存入fan16用)
                  LET m_ratio=g_fae.fae08/m_fae08*100       # 分攤比率
                  LET m_fan07=mm_fan07*m_ratio/100          # 分攤金額
                  LET m_curr =mm_fan08*m_ratio/100          # 分攤金額
                  LET m_fan14=mm_fan14*m_ratio/100          # 分攤成本
                  LET m_fan15=mm_fan15*m_ratio/100          # 分攤累折
                  LET m_fan17=mm_fan17*m_ratio/100          # 分攤減值
                  LET m_fae08 = m_fae08 - g_fae.fae08       # 總分攤比率減少
                  LET m_fan07 = cl_digcut(m_fan07,g_azi04)
                  LET mm_fan07 = mm_fan07 - m_fan07         # 被分攤總數減少
                  LET m_curr   = cl_digcut(m_curr,g_azi04)
                  LET mm_fan08 = mm_fan08 - m_curr          # 被分攤總數減少
                  LET m_fan14 = cl_digcut(m_fan14,g_azi04)
                  LET mm_fan14 = mm_fan14 - m_fan14         # 被分攤總數減少
                  LET m_fan15  = cl_digcut(m_fan15,g_azi04)
                  LET mm_fan15 = mm_fan15 - m_fan15         # 被分攤總數減少
                  LET m_fan17  = cl_digcut(m_fan17,g_azi04)
                  LET mm_fan17 = mm_fan17 - m_fan17         # 被分攤總數減少
                  IF g_fan_rowid IS NOT NULL THEN
                     UPDATE fan_file SET fan07 = m_fan07,
                                         fan08 = m_curr,
                                         fan09 = g_fan.fan06,
                                         fan12 = g_fae.fae07,
                                         fan14 = m_fan14,
                                         fan15 = m_fan15,
                                         fan16 = mm_ratio,
                                         fan17 = m_fan17,
                                         fan111=m_fad031,
                                         fan121=g_fae.fae071
                     WHERE ROWID=g_fan_rowid
                     IF STATUS OR SQLCA.SQLERRD[3]=0 THEN
                        LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
                        LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
                        LET g_show_msg[g_cnt2].ze01   = ''
                        LET g_show_msg[g_cnt2].ze03   = 'upd fan_file'
                        LET g_cnt2 = g_cnt2 + 1
                        LET g_success='N'
                        CONTINUE FOREACH
                     END IF
                  ELSE
                     IF cl_null(g_fae.fae06) THEN
                        LET g_fae.fae06=' '
                     END IF
                     INSERT INTO fan_file(fan01,fan02,fan03,fan04,fan041,
                                          fan05,fan06,fan07,fan08,fan09,
                                          fan10,fan11,fan12,fan13,fan14,
                                          fan15,fan16,fan17,fan111,fan121)
                                   VALUES(g_fan.fan01,g_fan.fan02,
                                          g_fan.fan03,g_fan.fan04,'1','3',
                                          g_fae.fae06,m_fan07,m_curr,
                                          g_fan.fan06,g_faj.faj43,g_fan.fan11,
                                          g_fae.fae07,g_fan.fan13,m_fan14,
                                          m_fan15,mm_ratio,m_fan17,m_fad031,
                                          g_fae.fae071)
                     IF STATUS THEN
                        LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
                        LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
                        LET g_show_msg[g_cnt2].ze01   = ''
                        LET g_show_msg[g_cnt2].ze03   = 'ins fan_file'
                        LET g_cnt2 = g_cnt2 + 1
                        LET g_success='N'
                        CONTINUE FOREACH
                     END IF
                  END IF
# dennon lai 01/04/18 本期累折=今年度本期折舊(fan07)的加總
#                     累積折舊=全期本期折舊(fan07)的加總
             #No.3426 010824 modify 若用上述方法在年中導入時折舊會少
                #例7月導入,fan 6月資料,本月折舊fan07=6月折舊金額, 故用
                #select sum(fan07)的方法會少1-5 月的折舊金額
                #故改成抓前一期累折+本月的折舊
                     IF g_fan.fan04=1 THEN
                        LET p_yy = g_fan.fan03-1
                        LET p_mm=12
                     ELSE
                        LET p_yy = g_fan.fan03
                        LET p_mm=g_fan.fan04-1
                     END IF
                      LET p_fan08=0  LET p_fan15=0
                      SELECT SUM(fan08),SUM(fan15) INTO p_fan08,p_fan15
                        FROM  fan_file
                       WHERE fan01=g_fan.fan01
                         AND fan02=g_fan.fan02
                         AND fan03=p_yy
                         AND fan04=p_mm
                         AND fan06=g_fae.fae06 AND fan05='3'
                         AND (fan041 = '1' OR fan041='0')
                     IF SQLCA.SQLCODE THEN
                        LET p_fan08=0   LET p_fan15=0
                     END IF
                     IF cl_null(p_fan08) THEN
                        LET p_fan08=0
                     END IF
                     IF cl_null(p_fan15) THEN
                        LET p_fan15=0
                     END IF
                     IF g_fan.fan04 = 1 THEN
                        LET p_fan08 = 0
                     END IF
                     LET g_fan07_year = p_fan08 +m_fan07
                     LET g_fan07_all  = p_fan15 +m_fan07
                     UPDATE fan_file SET fan08=g_fan07_year,fan15=g_fan07_all
                      WHERE fan01=g_fan.fan01
                        AND fan02=g_fan.fan02
                        AND fan03=g_fan.fan03 AND fan04=g_fan.fan04
                        AND fan06=g_fae.fae06 AND fan05='3'
                        AND fan041 = '1'
                     IF SQLCA.SQLCODE OR SQLCA.SQLERRD[3]=0 THEN
                        LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
                        LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
                        LET g_show_msg[g_cnt2].ze01   = ''
                        LET g_show_msg[g_cnt2].ze03   = 'upd fan_file'
                        LET g_cnt2 = g_cnt2 + 1
                        LET g_success='N'
                        CONTINUE FOREACH
                     END IF
                  WHEN '2'
                     SELECT aao05-aao06 INTO m_aao FROM aao_file
                            WHERE aao00=m_faa02b AND aao01=g_fae.fae09
#No.TQC-7B0060 --start--
#                           AND aao02=g_fae.fae06 AND aao03=tm.yy
#                           AND aao04=tm.mm
                            AND aao02=g_fae.fae06 AND aao03=m_yy
                            AND aao04=m_mm
#No.TQC-7B0060 --end--
                     IF STATUS=100 OR m_aao IS NULL THEN LET m_aao=0 END IF
                     LET m_tot=m_tot+m_aao          ## 累加變動比率分母金額
               END CASE
            END FOREACH

       #----- 若為變動比率, 重新 foreach 一次 insert into fan_file -----------
            IF m_fad05='2' THEN
               FOREACH p300_cur2 INTO g_fae.*
                  SELECT aao05-aao06 INTO m_aao FROM aao_file
                   WHERE aao00=m_faa02b AND aao01=g_fae.fae09
#                    AND aao02=g_fae.fae06 AND aao03=tm.yy AND aao04=tm.mm #No.TQC-7B0060 mark
                     AND aao02=g_fae.fae06 AND aao03=m_yy AND aao04=m_mm   #No.TQC-7B0060
                  IF STATUS=100 OR m_aao IS NULL THEN
                     LET m_aao=0
                  END IF
                  LET m_ratio = m_aao/m_tot*100
                  LET m_fan07=g_fan.fan07*m_ratio/100
                  LET m_curr =g_fan.fan08*m_ratio/100
                  LET m_fan14=g_fan.fan14*m_ratio/100
                  LET m_fan15=g_fan.fan15*m_ratio/100
                  LET m_fan17=g_fan.fan17*m_ratio/100
                  LET m_fan07 = cl_digcut(m_fan07,g_azi04)
                  LET m_curr = cl_digcut(m_curr,g_azi04)
                  LET m_fan14 = cl_digcut(m_fan14,g_azi04)
                  LET m_fan15 = cl_digcut(m_fan15,g_azi04)
                  LET m_fan17 = cl_digcut(m_fan17,g_azi04)
                  LET m_tot_fan07=m_tot_fan07+m_fan07
                  LET m_tot_curr =m_tot_curr +m_curr
                  LET m_tot_fan14=m_tot_fan14+m_fan14
                  LET m_tot_fan15=m_tot_fan15+m_fan15
                  LET m_tot_fan17=m_tot_fan17+m_fan17
                  SELECT COUNT(*) INTO g_cnt FROM fan_file
                   WHERE fan01=g_fan.fan01 AND fan02=g_fan.fan02
                     AND fan03=g_fan.fan03 AND fan04=g_fan.fan04
                     AND fan06=g_fae.fae06 AND fan05='3' AND fan041 = '1'
                  IF g_cnt>0 THEN
                     UPDATE fan_file SET fan07 = m_fan07,
                                         fan08 = m_curr,
                                         fan09 = g_fan.fan06,
                                         fan12 = g_fae.fae07,
                                         fan16 = m_ratio,
                                         fan17 = m_fan17,
                                         fan111=m_fad031,
                                         fan121=g_fae.fae071
                      WHERE fan01=g_fan.fan01 AND fan02=g_fan.fan02
                        AND fan03=g_fan.fan03 AND fan04=g_fan.fan04
                        AND fan06=g_fae.fae06 AND fan05='3' AND fan041 = '1'
                     IF STATUS OR SQLCA.sqlerrd[3] = 0 THEN
                        LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
                        LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
                        LET g_show_msg[g_cnt2].ze01   = ''
                        LET g_show_msg[g_cnt2].ze03   = 'upd fan_file'
                        LET g_cnt2 = g_cnt2 + 1
                        LET g_success='N'
                        CONTINUE FOREACH
                     END IF
                  ELSE
                     IF cl_null(g_fae.fae06) THEN
                        LET g_fae.fae06=' '
                     END IF
                     INSERT INTO fan_file(fan01,fan02,fan03,fan04,fan041,fan05,
                                          fan06,fan07,fan08,fan09,fan10,fan11,
                                          fan12,fan13,fan14,fan15,fan16,fan17,
                                          fan111,fan121)
                                VALUES(g_fan.fan01,g_fan.fan02,g_fan.fan03,
                                       g_fan.fan04,'1','3',g_fae.fae06,m_fan07,
                                       m_curr,g_fan.fan06,g_faj.faj43,g_fan.fan11,
                                       g_fae.fae07,g_fan.fan13,m_fan14,m_fan15,
                                       m_ratio,m_fan17,m_fad031,g_fae.fae071)
                     IF STATUS THEN
                        LET g_show_msg[g_cnt2].faj02  = g_faj.faj02
                        LET g_show_msg[g_cnt2].faj022 = g_faj.faj022
                        LET g_show_msg[g_cnt2].ze01   = ''
                        LET g_show_msg[g_cnt2].ze03   = 'ins fan_file'
                        LET g_cnt2 = g_cnt2 + 1
                        LET g_success='N'
                        CONTINUE FOREACH
                     END IF
                  END IF
               END FOREACH
            END IF
      END FOREACH
   END IF
   IF g_success = 'Y' THEN
      COMMIT WORK
   ELSE
      ROLLBACK WORK
   END IF
   END FOREACH
END FUNCTION
#TQC-780083
