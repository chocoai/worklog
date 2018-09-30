# Prog. Version..: '5.30.06-13.03.12(00002)'     #
#
# Pattern name...: csfq303.4gl
# Descriptions...: 工單狀況明細查詢
# Date & Author..: NO.FUN-C90076 12/10/15 By lixh1
# Modify.........: No:TQC-CC0128 12/12/27 By lixh1 l_ima153 改從CALL s_get_ima153()获取
# Modify.........: No:TQC-D60023 13/06/24 By yangtt WHERE條件修改
# Modify.........: No:MOD-DB0116 13/11/18 By suncx ima153不應參與齊料套數計算
# Modify.........: No:MOD-E80176 14/08/29 By qiull g_sfb_1_excel變量不應清空

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

#模組變數(Module Variables)
DEFINE   g_arr1         DYNAMIC ARRAY OF RECORD
            a1          LIKE sfa_file.sfa03,
            a11         LIKE sfa_file.sfa26,
            a2          LIKE sfa_file.sfa08,
            a3          LIKE sfa_file.sfa05,
            a4          LIKE sfa_file.sfa06,
            a5          LIKE sfa_file.sfa07,
            a51         LIKE sfa_file.sfa063,
            a52         LIKE sfa_file.sfa062,
            a6          LIKE sfa_file.sfa07,
            a7          LIKE type_file.num15_3,
            a8          LIKE type_file.num15_3,
            a9          LIKE ima_file.ima02,
            a10         LIKE ima_file.ima021
                        END RECORD
DEFINE   g_arr2         DYNAMIC ARRAY OF RECORD
            b1          LIKE ecm_file.ecm03,
            b2          LIKE ecm_file.ecm301,
            b3          LIKE ecm_file.ecm45,
            b4          LIKE sfq_file.sfq01,
            b5          LIKE type_file.chr10,     #類別sfp06
            b6          LIKE sfp_file.sfp03,
            b7          LIKE sfq_file.sfq03,
            b8          LIKE sfv_file.sfv09,
            b9          LIKE sfv_file.sfv12
                        END RECORD
DEFINE   g_arr3         DYNAMIC ARRAY OF RECORD
            c1          LIKE pmm_file.pmm01,
            c2          LIKE pmm_file.pmm09,
            c3          LIKE pmn_file.pmn02,
            c4          LIKE pmn_file.pmn04,
            c12         LIKE ima_file.ima02,
            c13         LIKE ima_file.ima021,
            c5          LIKE pmn_file.pmn33,
            c6          LIKE pmn_file.pmn20,
            c8          LIKE pmn_file.pmn83,
            c9          LIKE pmn_file.pmn85,
            c10         LIKE pmn_file.pmn80,
            c11         LIKE pmn_file.pmn82,
            c7          LIKE pmn_file.pmn50
                        END RECORD
DEFINE   g_arr4         DYNAMIC ARRAY OF RECORD
            d1          LIKE tlf_file.tlf06,
            d2          LIKE tlf_file.tlf905,
            d3          LIKE tlf_file.tlf906,
            d4          LIKE tlf_file.tlf01,
            d15         LIKE ima_file.ima02,
            d16         LIKE ima_file.ima021,
            d5          LIKE tlf_file.tlf05,
            d6          LIKE tlf_file.tlf902,
            d19         LIKE imd_file.imd02,
            d7          LIKE tlf_file.tlf903,
            d20         LIKE ime_file.ime03,
            d8          LIKE tlf_file.tlf904,
            d9          LIKE tlf_file.tlf10,
            d10         LIKE tlf_file.tlf11,
            d11         LIKE tlf_file.tlf11,
            d12         LIKE tlf_file.tlf10,
            d13         LIKE tlf_file.tlf11,
            d14         LIKE tlf_file.tlf10,
            d17         LIKE sfs_file.sfs012,
            d18         LIKE sfs_file.sfs013
                        END RECORD
DEFINE   g_arr5         DYNAMIC ARRAY OF RECORD
            e1          LIKE qcf_file.qcf01,
            e2          LIKE qcf_file.qcf04,
            e3          LIKE qcf_file.qcf22,
           #e4          LIKE qcf_file.qcf06,
            e5          LIKE qcf_file.qcf091
                        END RECORD
DEFINE   g_arr6         DYNAMIC ARRAY OF RECORD
            f1          LIKE tlf_file.tlf06,
            f2          LIKE tlf_file.tlf905,
            f3          LIKE tlf_file.tlf906,
            f4          LIKE tlf_file.tlf01,
            f15         LIKE ima_file.ima02,
            f16         LIKE ima_file.ima021,
            f5          LIKE tlf_file.tlf902,
            f17         LIKE imd_file.imd02,
            f6          LIKE tlf_file.tlf903,
            f18         LIKE ime_file.ime03,
            f7          LIKE tlf_file.tlf904,
            f8          LIKE tlf_file.tlf10,
            f9          LIKE tlf_file.tlf11,
            f11         LIKE tlf_file.tlf11,
            f12         LIKE tlf_file.tlf10,
            f13         LIKE tlf_file.tlf11,
            f14         LIKE tlf_file.tlf10,
            f10         LIKE tlf_file.tlf05
                        END RECORD
DEFINE   g_arr7         DYNAMIC ARRAY OF RECORD
            g1          LIKE sfb_file.sfb01,
            g2          LIKE sfb_file.sfb05,
            g8          LIKE ima_file.ima02,
            g9          LIKE ima_file.ima021,
            g3          LIKE sfb_file.sfb82,
            g10         LIKE pmc_file.pmc03,    #lixh121205 add
            g4          LIKE sfb_file.sfb13,
            g5          LIKE sfb_file.sfb08,
            g6          LIKE sfb_file.sfb081,
            g7          LIKE sfb_file.sfb09
                        END RECORD
DEFINE   g_arr8         DYNAMIC ARRAY OF RECORD
            h1          LIKE sfa_file.sfa27,
            h7          LIKE ima_file.ima02,
            h8          LIKE ima_file.ima021,
            h2          LIKE sfa_file.sfa26,
            h3          LIKE type_file.num15_3,
            h4          LIKE type_file.num15_3,
            h5          LIKE bmd_file.bmd04,
            h9          LIKE ima_file.ima02,    #lixh121205 add
            h10         LIKE ima_file.ima021,   #lixh121205 add
            h6          LIKE type_file.num15_3
                        END RECORD
DEFINE   g_arr9         DYNAMIC ARRAY OF RECORD
            i1          LIKE sfa_file.sfa03,
            i4          LIKE ima_file.ima02,
            i5          LIKE ima_file.ima021,
            i2          LIKE sfa_file.sfa05,
            i3          LIKE type_file.chr1000
                        END RECORD
DEFINE   g_arr10        DYNAMIC ARRAY OF RECORD
            j1          LIKE shm_file.shm01,
            j2          LIKE shm_file.shm08,
            j3          LIKE shm_file.shm13,
            j4          LIKE shm_file.shm15,
            j5          LIKE shm_file.shm09
                        END RECORD
DEFINE   g_arr11        DYNAMIC ARRAY OF RECORD
            k1          LIKE srf_file.srf01,
            k2          LIKE srf_file.srf02,
            k3          LIKE srg_file.srg02,
            k4          LIKE srg_file.srg04,
            k5          LIKE srg_file.srg15,
            k6          LIKE srg_file.srg05,
            k7          LIKE srg_file.srg06,
            k8          LIKE srg_file.srg07,
            k9          LIKE srg_file.srg08,
            k10         LIKE srg_file.srg09,
            k11         LIKE srg_file.srg10,
            k12         LIKE srg_file.srg11,
            k13         LIKE srg_file.srg12
                        END RECORD
DEFINE   g_arr13      DYNAMIC ARRAY OF RECORD
         m1           LIKE shb_file.shb01,
         m2           LIKE shb_file.shb02,
         m021         LIKE shb_file.shb021,
         m3           LIKE shb_file.shb03,
         m031         LIKE shb_file.shb031,
         m032         LIKE shb_file.shb032,
         m033         LIKE shb_file.shb033,
         m4           LIKE shb_file.shb04,
         m21          LIKE gen_file.gen02,     #lixh121205 add
         m5           LIKE shb_file.shb05,
         m6           LIKE shb_file.shb06,
         m7           LIKE shb_file.shb07,
         m8           LIKE shb_file.shb08,
         m081         LIKE shb_file.shb081,
         m9           LIKE shb_file.shb09,
         m10          LIKE shb_file.shb10,
         m19          LIKE ima_file.ima02,
         m20          LIKE ima_file.ima021,
         m111         LIKE shb_file.shb111,
         m112         LIKE shb_file.shb112,
         m113         LIKE shb_file.shb113,
         m114         LIKE shb_file.shb114,
         m115         LIKE shb_file.shb115,
         m12          LIKE shb_file.shb12,
         m13          LIKE shb_file.shb13,
         m14          LIKE shb_file.shb14,
         m15          LIKE shb_file.shb15,
         m16          LIKE shb_file.shb16,
         m17          LIKE shb_file.shb17,
         m18          LIKE shb_file.shb012
        ,m22          LIKE shb_file.shbud02   #add by lili 170531
                      END RECORD
DEFINE   tm           RECORD
              y1      LIKE type_file.chr1,
              y2      LIKE type_file.chr1,
              y3      LIKE type_file.chr1,
              p       LIKE type_file.chr1,
              c       LIKE type_file.chr1,
              d       LIKE type_file.chr1,    #add by lili 170717
              wc1     STRING,
              wc2     STRING,
              wc3     STRING
                      END RECORD

DEFINE   g_sfb_1      DYNAMIC ARRAY OF RECORD
         sfb01        LIKE sfb_file.sfb01,
         sfb81        LIKE sfb_file.sfb81,
         sfb02        LIKE sfb_file.sfb02,      #add by lili 170722
         sfb05        LIKE sfb_file.sfb05,
         imaud02      LIKE ima_file.imaud02,    #add by lili 170606
         ima02        LIKE ima_file.ima02,
         sfb04        LIKE sfb_file.sfb04,
         sfb36        LIKE sfb_file.sfb36,     #add by lili 170705
         sfb96        LIKE sfb_file.sfb96,
         sfb08        LIKE sfb_file.sfb08,
         sfb081       LIKE sfb_file.sfb081,
         #qi           LIKE sfb_file.sfb08,
         sfb09        LIKE sfb_file.sfb09,
         sfv091       LIKE sfv_file.sfv09,  #add by lili 170717
         sfv09        LIKE sfv_file.sfv09,   #add by lili 170629
         trate        LIKE type_file.num20_6,   #add by lili 170722
         qcf091       LIKE qcf_file.qcf091,
         tot_wip      LIKE sfb_file.sfb12,
         #sfb12        LIKE sfb_file.sfb12,
         ecm301_011    LIKE ecm_file.ecm314,
         ecm301_021    LIKE ecm_file.ecm314,
         ecm301_031     LIKE ecm_file.ecm314,
         ecm301_041     LIKE ecm_file.ecm314,
         ecm301_051     LIKE ecm_file.ecm314,
         ecm301_061     LIKE ecm_file.ecm314,
         ecm301_071     LIKE ecm_file.ecm314,
         ecm301_081     LIKE ecm_file.ecm314,
         ecm301_091     LIKE ecm_file.ecm314,
         ecm301_101     LIKE ecm_file.ecm314,
         ecm301_111      LIKE ecm_file.ecm314,
         ecm301_121      LIKE ecm_file.ecm314,
         ecm301_131      LIKE ecm_file.ecm314,
         ecm301_141      LIKE ecm_file.ecm314,
         ecm301_151      LIKE ecm_file.ecm314,
         ecm301_161      LIKE ecm_file.ecm314,
         ecm301_171      LIKE ecm_file.ecm314,
         ecm301_181      LIKE ecm_file.ecm314,
         ecm301_191      LIKE ecm_file.ecm314,
         ecm301_201      LIKE ecm_file.ecm314,
         ecm301_211      LIKE ecm_file.ecm314,
         ecm301_221      LIKE ecm_file.ecm314,
         ecm301_231      LIKE ecm_file.ecm314,
         ecm301_241      LIKE ecm_file.ecm314,
         ecm301_251      LIKE ecm_file.ecm314,
         ecm301_261      LIKE ecm_file.ecm314,
         ecm301_271      LIKE ecm_file.ecm314,
         ecm301_281      LIKE ecm_file.ecm314,
         ecm301_291      LIKE ecm_file.ecm314,
         ecm301_301      LIKE ecm_file.ecm314,
         ecm314       LIKE ecm_file.ecm314,
         shd07        LIKE shd_file.shd07,
         diff         LIKE shd_file.shd07
                      END RECORD

DEFINE   g_sfb_1_excel    DYNAMIC ARRAY OF RECORD
         sfb01        LIKE sfb_file.sfb01,
         sfb81        LIKE sfb_file.sfb81,
         sfb02        LIKE sfb_file.sfb02,      #add by lili 170722
         sfb05        LIKE sfb_file.sfb05,
         imaud02      LIKE ima_file.imaud02,    #add by lili 170606
         ima02        LIKE ima_file.ima02,
         sfb04        LIKE sfb_file.sfb04,
         sfb36        LIKE sfb_file.sfb36,     #add by lili 170705
         sfb96        LIKE sfb_file.sfb96,
         sfb08        LIKE sfb_file.sfb08,
         sfb081       LIKE sfb_file.sfb081,
         #qi           LIKE sfb_file.sfb08,
         sfb09        LIKE sfb_file.sfb09,
         sfv091       LIKE sfv_file.sfv09,    #add by lili 170717
         sfv09        LIKE sfv_file.sfv09,     #add by lili 170629
         trate        LIKE type_file.num20_6,   #add by lili 170722
         qcf091       LIKE qcf_file.qcf091,
         tot_wip      LIKE sfb_file.sfb12,
         #sfb12        LIKE sfb_file.sfb12,
         ecm301_011    LIKE ecm_file.ecm314,
         ecm301_021    LIKE ecm_file.ecm314,
         ecm301_031     LIKE ecm_file.ecm314,
         ecm301_041     LIKE ecm_file.ecm314,
         ecm301_051     LIKE ecm_file.ecm314,
         ecm301_061     LIKE ecm_file.ecm314,
         ecm301_071     LIKE ecm_file.ecm314,
         ecm301_081     LIKE ecm_file.ecm314,
         ecm301_091     LIKE ecm_file.ecm314,
         ecm301_101     LIKE ecm_file.ecm314,
         ecm301_111      LIKE ecm_file.ecm314,
         ecm301_121      LIKE ecm_file.ecm314,
         ecm301_131      LIKE ecm_file.ecm314,
         ecm301_141      LIKE ecm_file.ecm314,
         ecm301_151      LIKE ecm_file.ecm314,
         ecm301_161      LIKE ecm_file.ecm314,
         ecm301_171      LIKE ecm_file.ecm314,
         ecm301_181      LIKE ecm_file.ecm314,
         ecm301_191      LIKE ecm_file.ecm314,
         ecm301_201      LIKE ecm_file.ecm314,
         ecm301_211      LIKE ecm_file.ecm314,
         ecm301_221      LIKE ecm_file.ecm314,
         ecm301_231      LIKE ecm_file.ecm314,
         ecm301_241      LIKE ecm_file.ecm314,
         ecm301_251      LIKE ecm_file.ecm314,
         ecm301_261      LIKE ecm_file.ecm314,
         ecm301_271      LIKE ecm_file.ecm314,
         ecm301_281      LIKE ecm_file.ecm314,
         ecm301_291      LIKE ecm_file.ecm314,
         ecm301_301      LIKE ecm_file.ecm314,
         ecm314       LIKE ecm_file.ecm314,
         shd07        LIKE shd_file.shd07,
         diff         LIKE shd_file.shd07
                          END RECORD
   TYPE sr1_t              RECORD
         sfb01        LIKE sfb_file.sfb01,
         sfb81        LIKE sfb_file.sfb81,
         sfb02        LIKE sfb_file.sfb02,      #add by lili 170722
         sfb05        LIKE sfb_file.sfb05,
         imaud02      LIKE ima_file.imaud02,    #add by lili 170606
         ima02        LIKE ima_file.ima02,
         sfb04        LIKE sfb_file.sfb04,
         sfb36        LIKE sfb_file.sfb36,     #add by lili 170705
         sfb96        LIKE sfb_file.sfb96,
         sfb08        LIKE sfb_file.sfb08,
         sfb081       LIKE sfb_file.sfb081,
         #qi           LIKE sfb_file.sfb08,
         sfb09        LIKE sfb_file.sfb09,
         qcf091       LIKE qcf_file.qcf091,
         tot_wip      LIKE sfb_file.sfb12,
         sfb12        LIKE sfb_file.sfb12,
         ecm03        LIKE ecm_file.ecm03,
         ecm54        LIKE ecm_file.ecm54,
         ecm62        LIKE ecm_file.ecm62,   #lixh121205
         ecm63        LIKE ecm_file.ecm63,   #lixh121205
         ecm291       LIKE ecm_file.ecm291,
         ecm301       LIKE ecm_file.ecm301,
         ecm302       LIKE ecm_file.ecm302,
         ecm303       LIKE ecm_file.ecm303,
         ecm311       LIKE ecm_file.ecm311,
         ecm312       LIKE ecm_file.ecm312,
         ecm313       LIKE ecm_file.ecm313,
         ecm314       LIKE ecm_file.ecm314,
         ecm315       LIKE ecm_file.ecm315,
         ecm316       LIKE ecm_file.ecm316
                           END RECORD

DEFINE   g_ecm        RECORD
         ecm03        LIKE ecm_file.ecm03,
         ecm53        LIKE ecm_file.ecm53,
         ecm54        LIKE ecm_file.ecm54,
         ecm62        LIKE ecm_file.ecm62,   #lixh121205
         ecm63        LIKE ecm_file.ecm63,   #lixh121205
         ecm291       LIKE ecm_file.ecm291,
         ecm301       LIKE ecm_file.ecm301,
         ecm302       LIKE ecm_file.ecm302,
         ecm303       LIKE ecm_file.ecm303,
         ecm311       LIKE ecm_file.ecm311,
         ecm312       LIKE ecm_file.ecm312,
         ecm313       LIKE ecm_file.ecm313,
         ecm314       LIKE ecm_file.ecm314,
         ecm315       LIKE ecm_file.ecm315,
         ecm316       LIKE ecm_file.ecm316
                      END RECORD

DEFINE   g_action_flag  LIKE type_file.chr100
DEFINE   g_filter_wc    STRING
DEFINE   l_ac1          LIKE type_file.num10
DEFINE   g_sum_sfb08    LIKE sfb_file.sfb08
DEFINE   g_sum_sfb09    LIKE sfb_file.sfb09
DEFINE   g_sum_pro      LIKE ima_file.ima128
DEFINE   g_sum_com      LIKE ima_file.ima128
DEFINE   g_sum_sfv091   LIKE sfv_file.sfv09   #add by lili 170717
DEFINE   g_sum_sfv09    LIKE sfv_file.sfv09
DEFINE   g_sum_wip      LIKE sfb_file.sfb08
DEFINE   g_sum_01       LIKE sfb_file.sfb08
DEFINE   g_sum_02       LIKE sfb_file.sfb08
DEFINE   g_sum_03       LIKE sfb_file.sfb08
DEFINE   g_sum_04       LIKE sfb_file.sfb08
DEFINE   g_sum_05       LIKE sfb_file.sfb08
DEFINE   g_sum_06       LIKE sfb_file.sfb08
DEFINE   g_sum_07       LIKE sfb_file.sfb08
DEFINE   g_sum_ecm314   LIKE sfb_file.sfb08
DEFINE   g_sum_shd07    LIKE sfb_file.sfb08
DEFINE   g_sum_diff     LIKE sfb_file.sfb08
DEFINE   g_wipqty       LIKE ecm_file.ecm301
DEFINE   g_ecm_sum      LIKE ecm_file.ecm301
DEFINE   g_sfb              RECORD LIKE sfb_file.*,
         g_ima              RECORD LIKE ima_file.*,
         g_pmc              RECORD LIKE pmc_file.*,
         g_bbb_flag         LIKE type_file.chr1,
         g_bbb              ARRAY[600] of LIKE type_file.chr1000,
         g_line1,g_line2,l_line3	  LIKE type_file.num10,
         g_wc,g_wc2         string,
         g_sql              string,
         g_t1               LIKE oay_file.oayslip,
         g_argv1            LIKE type_file.chr21,
         g_buf              LIKE type_file.chr20,
         g_rec_b            LIKE type_file.num5
DEFINE   l_za05             LIKE type_file.chr1000
DEFINE   g_flag             LIKE type_file.chr1
DEFINE   g_b_flag           LIKE type_file.num5
DEFINE   g_b_flag_up        LIKE type_file.num5
DEFINE   g_row_count        LIKE type_file.num10
DEFINE   g_curs_index       LIKE type_file.num10
DEFINE   g_i                LIKE type_file.num5
DEFINE   g_forupd_sql       STRING
DEFINE   g_chr              LIKE type_file.chr1
DEFINE   g_msg              LIKE type_file.chr1000
DEFINE   l_ac,l_ac2         LIKE type_file.num10
DEFINE   l_ac_t,l_ac2_t     LIKE type_file.num10
DEFINE   g_cnt              LIKE type_file.num10
DEFINE   g_jump             LIKE type_file.num10
DEFINE   mi_no_ask          LIKE type_file.num5
DEFINE   g_confirm          LIKE type_file.chr1
DEFINE   g_approve          LIKE type_file.chr1
DEFINE   g_post             LIKE type_file.chr1
DEFINE   g_close            LIKE type_file.chr1
DEFINE   g_void             LIKE type_file.chr1
DEFINE   g_valid            LIKE type_file.chr1
DEFINE   w    ui.Window
DEFINE   f    ui.Form
DEFINE   page om.DomNode
DEFINE   g_rec_b_1          LIKE type_file.num10
DEFINE   l_msg              STRING
DEFINE   l_over             LIKE type_file.num5     #lixh121205  add
DEFINE   l_over_1           LIKE type_file.num5     #lixh121205  add
#add by lili 170717 ---s---
DEFINE  g_sfb_2  DYNAMIC ARRAY OF RECORD
                 ima01    LIKE ima_file.ima01,
                 imaud02  LIKE ima_file.imaud02,
                 ima02    LIKE ima_file.ima02,
                 ima09    LIKE ima_file.ima09,
                 qty1     LIKE type_file.num20_6,
                 qty2     LIKE type_file.num20_6,
                 qty3     LIKE type_file.num20_6,
                 qty4     LIKE type_file.num20_6,
                 sfb081    LIKE sfb_file.sfb081     #add by zhaotq
                 END RECORD
DEFINE g_rec_b2    LIKE type_file.num5
DEFINE g_sfb_sum1  LIKE sfb_file.sfb08
DEFINE g_sfb_sum2  LIKE sfb_file.sfb08
DEFINE g_sfb_sum3  LIKE sfb_file.sfb08
DEFINE g_sfb_sum4  LIKE sfb_file.sfb08
DEFINE g_sum_sfb081    LIKE sfb_file.sfb081
#add by lili 170717 ---e---

MAIN
   DEFINE   p_row,p_col   LIKE type_file.num5
   OPTIONS                               #改變一些系統預設值
      INPUT NO WRAP
   DEFER INTERRUPT

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CSF")) THEN
      EXIT PROGRAM
   END IF
  LET g_argv1=ARG_VAL(1)
   CALL cl_used(g_prog,g_time,1) RETURNING g_time
   OPEN WINDOW t303_w AT p_row,p_col WITH FORM "csf/42f/csfq303"
         ATTRIBUTE (STYLE = g_win_style CLIPPED)

   CALL cl_ui_init()

   CALL q303_def_form()

   CALL cl_set_act_visible("revert_filter",FALSE)
   CALL q303_q()
   CALL q303()
   DROP TABLE csfq303_tmp;
   DROP TABLE csfq303_tmp1;
   CLOSE WINDOW t303_w                 #結束畫面
   CALL  cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION q303()
   LET g_wc2=' 1=1'

   LET g_forupd_sql= " SELECT * FROM sfb_file ",
                      " WHERE sfb01 = ? FOR UPDATE "
   LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
   DECLARE q303_cl CURSOR FROM g_forupd_sql

   SELECT * INTO g_sma.* FROM sma_file WHERE sma00='0'

   CALL q303_menu()
END FUNCTION

FUNCTION q303_cs()
   DEFINE lc_qbe_sn       LIKE gbm_file.gbm01
   IF NOT cl_null(g_argv1) THEN
      LET g_wc=" sfb01='",g_argv1,"'"
   ELSE
      CLEAR FORM                             #清除畫面
      CALL g_sfb_1.clear()
      CALL g_sfb_1_excel.clear()
      CALL g_sfb_2.clear()     #add by lili 170717
      CALL cl_set_act_visible("accept,cancel", TRUE)
      LET g_action_choice=" "
      CALL cl_set_head_visible("group01","YES")
      INITIALIZE g_sfb.* TO NULL
      LET tm.y1 = 'Y'
      LET tm.y2 = 'Y'
      LET tm.y3 = 'Y'
      LET tm.p = '2'
      LET tm.c = '3'
      LET tm.wc1 = "sfb08 < sfb09"
      LET tm.wc2 = "sfb08 = sfb09"
      LET tm.wc3 = "sfb08 > sfb09"
      LET g_filter_wc = ''     #lixh1 add
      LET tm.d = '1'    #add by lili 170717
      DISPLAY BY NAME tm.y1,tm.y2,tm.y3,tm.p,tm.c,tm.d   #add d by lili 170717
      DIALOG ATTRIBUTE(UNBUFFERED)
      INPUT BY NAME tm.y1,tm.y2,tm.y3,tm.p,tm.c,tm.d ATTRIBUTES (WITHOUT DEFAULTS=TRUE)
         BEFORE INPUT
            CALL cl_qbe_display_condition(lc_qbe_sn)

         AFTER FIELD y1
            IF tm.y1 = 'N' THEN
               LET tm.wc1 = '1 =1'
            END IF

         AFTER FIELD y2
            IF tm.y2 = 'N' THEN
               LET tm.wc2 = '1 =1'
            END IF

         AFTER FIELD y3
            IF tm.y3 = 'N' THEN
               LET tm.wc3 = '1 =1'
            END IF

      END INPUT

      CONSTRUCT g_wc ON sfb01,sfb81,sfb02,sfb05,sfb08,sfb09,sfb04,sfb36,sfb96
                   FROM s_sfb_1[1].sfb01,s_sfb_1[1].sfb81,s_sfb_1[1].sfb02,s_sfb_1[1].sfb05,s_sfb_1[1].sfb08,
                        s_sfb_1[1].sfb09,s_sfb_1[1].sfb04,s_sfb_1[1].sfb36,s_sfb_1[1].sfb96

        BEFORE CONSTRUCT
           CALL cl_qbe_init()

        END CONSTRUCT

        ON ACTION controlp
           CASE WHEN INFIELD(sfb05) #item
                     CALL cl_init_qry_var()
                     LET g_qryparam.state    = "c"
                     LET g_qryparam.form     = "q_ima"
                     LET g_qryparam.default1 = g_sfb.sfb05
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO sfb05
                     NEXT FIELD sfb05

                WHEN INFIELD(sfb01)
                     CALL cl_init_qry_var()
                     LET g_qryparam.state    = "c"
                     LET g_qryparam.form     = "q_sfb"
                     LET g_qryparam.where = " sfb01[1,",g_doc_len,"] NOT IN (SELECT smy69 FROM smy_file WHERE smy69 IS NOT NULL) "
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO sfb01
                     NEXT FIELD sfb01

                OTHERWISE EXIT CASE
            END CASE

         ON ACTION allotment
            LET g_b_flag = "1"

         ON ACTION routing
            LET g_b_flag = "2"

         ON ACTION sub_po
            LET g_b_flag = "3"

         ON ACTION issue
            LET g_b_flag = "4"

         ON ACTION fqc
            LET g_b_flag = "5"

         ON ACTION store_in
            LET g_b_flag = "6"

         ON ACTION sub_wo
            LET g_b_flag = "7"

         ON ACTION substitute
            LET g_b_flag = "8"

         ON ACTION qvl
            LET g_b_flag = "9"

         ON ACTION runcard
            LET g_b_flag = "10"

         ON ACTION report_no
            LET g_b_flag = "11"

         ON ACTION Routing_Reportable
            LET g_b_flag = "13"

         ON ACTION ACCEPT
            ACCEPT DIALOG

         ON ACTION cancel
            LET INT_FLAG=1
            EXIT DIALOG

         ON ACTION exit
            LET INT_FLAG = 1
            EXIT DIALOG

         ON ACTION qbe_select
       	    CALL cl_qbe_select()
            ON ACTION qbe_save
	    CALL cl_qbe_save()

         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE DIALOG

         ON ACTION about
            CALL cl_about()

         ON ACTION controlg
            CALL cl_cmdask()

         ON ACTION help
            CALL cl_show_help()

      END DIALOG

#     IF INT_FLAG OR g_action_choice = "exit" THEN
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         RETURN
      END IF

   END IF
   LET g_wc = g_wc CLIPPED,cl_get_extra_cond('sfbuser', 'sfbgrup')

   CALL q303_get_tmp()
   CALL q303_b_fill_1()
   CALL q303_b_fill_3()    #add by lili 170717
END FUNCTION

FUNCTION q303_menu()

   WHILE TRUE
      IF g_action_choice = "exit"  THEN
         EXIT WHILE
      END IF
      CASE g_b_flag_up     #第一層
         WHEN 1
            #CALL q303_bp_1()
            CALL q303_bp0()
         WHEN 2
            CALL q303_bp_2()
         OTHERWISE
            #CALL q303_bp_1()
            CALL q303_bp0()
      END CASE

      CASE g_action_choice

         WHEN "data_filter"
            IF cl_chk_act_auth() THEN
               CALL q303_filter_askkey()
               CALL q303_get_tmp()
               CALL q303_b_fill_1()
               CALL q303_b_fill_3()    #add by lili 170717
            END IF
            LET g_action_choice = " "

         WHEN "revert_filter"
            IF cl_chk_act_auth() THEN
               LET g_filter_wc = ''
               CALL cl_set_act_visible("revert_filter",FALSE)
               CALL q303_get_tmp()
               CALL q303_b_fill_1()
               CALL q303_b_fill_3()    #add by lili 170717
            END IF
            LET g_action_choice = " "

         WHEN "inquires_wip"
            IF cl_chk_act_auth() AND NOT cl_null(g_sfb.sfb01)
               AND g_sma.sma54 = 'Y' AND g_sfb.sfb93 = 'Y' THEN
               LET l_msg = "aecq700 '",g_sfb.sfb01,"'"
               CALL cl_cmdrun_wait(l_msg)
            END IF
            LET g_action_choice = " "

         WHEN "help"
            CALL cl_show_help()
            LET g_action_choice = " "

         WHEN "exit"
            EXIT WHILE

         WHEN "controlg"
            CALL cl_cmdask()
            LET g_action_choice = " "


         #@WHEN "查詢"
         WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL q303_q()
            END IF
            LET g_action_choice = " "

#        #@WHEN "備料"
         WHEN "allotment"
            CALL q303_1()
            LET g_b_flag = "1"
            LET g_action_choice = " "

#        #@WHEN "製程"
         WHEN "routing"
            CALL q303_2()
            LET g_b_flag = "2"
            LET g_action_choice = " "

#        #@WHEN "委外採購"
         WHEN "sub_po"
            CALL q303_3()
            LET g_b_flag = "3"
            LET g_action_choice = " "

#        #@WHEN "發料"
         WHEN "issue"
            CALL q303_4()
            LET g_b_flag = "4"
            LET g_action_choice = " "

         WHEN "fqc"
            CALL q303_5()
            LET g_b_flag = "5"
            LET g_action_choice = " "

#        #@WHEN "入庫"
         WHEN "store_in"
            CALL q303_6()
            LET g_b_flag = "6"
            LET g_action_choice = " "

#        #@WHEN "子工單"
         WHEN "sub_wo"
            CALL q303_7()
            LET g_b_flag = "7"
            LET g_action_choice = " "

#        #@WHEN "替代"
         WHEN "substitute"
            CALL q303_8()
            LET g_b_flag = "8"
            LET g_action_choice = " "

         WHEN "qvl"
            CALL q303_9()
            LET g_b_flag = "9"
            LET g_action_choice = " "

         WHEN "runcard"
            CALL q303_10()
            LET g_b_flag = "10"
            LET g_action_choice = " "

         WHEN "report_no"
            CALL q303_11()
            LET g_b_flag = "11"
            LET g_action_choice = " "

         WHEN "Routing_Reportable"
            CALL q303_13()
            LET g_b_flag = "13"
            LET g_action_choice = " "

         #@WHEN "材料庫存"
         WHEN "inventory"
            LET g_msg="aimq102 2 '",g_sfb.sfb01,"'"
            CALL cl_cmdrun(g_msg)
            LET g_action_choice = " "

         #@WHEN "材料供需"
         WHEN "meterial_supply"
            LET g_msg="aimq841 2 '",g_sfb.sfb01,"'"
            CALL cl_cmdrun(g_msg)
            LET g_action_choice = " "

         #@WHEN "備註"
         WHEN "memo"
            CALL s_asf_memo('d',g_sfb.sfb01)
            LET g_action_choice = " "

         #@WHEN "工單維護"
         WHEN "maint_w_o"
            LET g_msg="asfi301 '",g_sfb.sfb01,"'"
            CALL cl_cmdrun(g_msg)
            LET g_action_choice = " "

         #@WHEN "匯出excel"
         WHEN "exporttoexcel"
            IF cl_chk_act_auth() THEN
               LET w = ui.Window.getCurrent()
               LET f = w.getForm()
               IF g_b_flag_up = 2 THEN
                  CASE g_b_flag
                     WHEN '1'
                        LET page = f.FindNode("Page","page01")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr1),'','')
                     WHEN '2'
                        LET page = f.FindNode("Page","page02")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr2),'','')
                     WHEN '3'
                        LET page = f.FindNode("Page","page03")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr3),'','')
                     WHEN '4'
                        LET page = f.FindNode("Page","page04")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr4),'','')
                     WHEN '5'
                        LET page = f.FindNode("Page","page05")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr5),'','')
                     WHEN '6'
                        LET page = f.FindNode("Page","page06")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr6),'','')
                     WHEN '7'
                        LET page = f.FindNode("Page","page07")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr7),'','')
                     WHEN '8'
                        LET page = f.FindNode("Page","page08")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr8),'','')
                     WHEN '9'
                        LET page = f.FindNode("Page","page09")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr9),'','')
                     WHEN '10'
                        LET page = f.FindNode("Page","page10")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr10),'','')
                     WHEN '11'
                        LET page = f.FindNode("Page","page11")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr11),'','')
                     WHEN '13'
                        LET page = f.FindNode("Page","page13")
                        CALL cl_export_to_excel(page,base.TypeInfo.create(g_arr13),'','')
                  END CASE
               END IF
               IF g_b_flag_up <> 2 THEN     #匯出第一頁簽的excel
                  IF g_action_flag = 2 THEN    #add by lili 170718
                     LET page = f.FindNode("Page","page7")
                     CALL cl_export_to_excel(page,base.TypeInfo.create(g_sfb_2),'','')
                  ELSE
                     #LET page = f.FindNode("Page","page1")
                     LET page = f.FindNode("Page","page6")
                     CALL cl_export_to_excel(page,base.TypeInfo.create(g_sfb_1),'','')
                  END IF
               END IF
            END IF
            LET g_action_choice = " "
      END CASE
   END WHILE
END FUNCTION

FUNCTION q303_q()
   LET g_row_count = 0
   LET g_curs_index = 0
   CALL cl_navigator_setting( g_curs_index, g_row_count )
   LET g_b_flag = ""
   LET g_b_flag = "1"
   LET l_ac_t = 0
   LET g_rec_b_1 = 0
   LET g_rec_b = 0
   DISPLAY g_rec_b TO cn2
   CALL cl_opmsg('q')
   MESSAGE ""
   DISPLAY '   ' TO FORMONLY.cnt1
   IF g_sma.sma541 = 'N' THEN
      CALL cl_set_comp_visible("ecm012,m18,d17",FALSE)
   ELSE
      CALL cl_set_comp_visible("ecm012,m18,d17",TRUE)
   END IF
   CALL cl_set_comp_visible("ecm301_011,ecm301_021,ecm301_031,ecm301_041,ecm301_051,ecm301_061,ecm301_071,ecm301_081,ecm301_091,ecm301_101,
                             ecm301_111,ecm301_121,ecm301_131,ecm301_141,ecm301_151,ecm301_161,ecm301_171,ecm301_181,ecm301_191,ecm301_201,
                             ecm301_211,ecm301_221,ecm301_231,ecm301_241,ecm301_251,ecm301_261,ecm301_271,ecm301_281,ecm301_291,ecm301_301",FALSE)
   CALL q303_cs()
   IF INT_FLAG OR g_action_choice="exit" THEN
      LET INT_FLAG = 0
      INITIALIZE g_sfb.* TO NULL
      CALL  cl_used(g_prog,g_time,2) RETURNING g_time
      EXIT PROGRAM
   END IF

   MESSAGE " SEARCHING ! "
   MESSAGE ""
END FUNCTION

FUNCTION q303_filter_askkey()
   DEFINE  l_wc  STRING
   CLEAR FORM
   CALL g_sfb_1.clear()
   CALL g_sfb_1_excel.clear()
   CALL cl_set_act_visible("accept,cancel", TRUE)
   CALL cl_set_comp_visible("ecm301_011,ecm301_021,ecm301_031,ecm301_041,ecm301_051,ecm301_061,ecm301_071,ecm301_081,ecm301_091,ecm301_101,
                             ecm301_111,ecm301_121,ecm301_131,ecm301_141,ecm301_151,ecm301_161,ecm301_171,ecm301_181,ecm301_191,ecm301_201,
                             ecm301_211,ecm301_221,ecm301_231,ecm301_241,ecm301_251,ecm301_261,ecm301_271,ecm301_281,ecm301_291,ecm301_301",FALSE)

      CONSTRUCT l_wc ON sfb01,sfb81,sfb05,sfb08,sfb09,sfb04
                   FROM s_sfb_1[1].sfb01,s_sfb_1[1].sfb81,s_sfb_1[1].sfb05,s_sfb_1[1].sfb08,
                        s_sfb_1[1].sfb09,s_sfb_1[1].sfb04
        BEFORE CONSTRUCT
           CALL cl_qbe_init()

        ON ACTION controlp
           CASE WHEN INFIELD(sfb05) #item
                     CALL cl_init_qry_var()
                     LET g_qryparam.state    = "c"
                     LET g_qryparam.form     = "q_ima"
                     LET g_qryparam.default1 = g_sfb.sfb05
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO sfb05
                     NEXT FIELD sfb05

                WHEN INFIELD(sfb01)
                     CALL cl_init_qry_var()
                     LET g_qryparam.state    = "c"
                     LET g_qryparam.form     = "q_sfb"
                     LET g_qryparam.where = " sfb01[1,",g_doc_len,"] NOT IN (SELECT smy69 FROM smy_file WHERE smy69 IS NOT NULL) "
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO sfb01
                     NEXT FIELD sfb01

                OTHERWISE EXIT CASE
            END CASE

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE CONSTRUCT

        ON ACTION about
           CALL cl_about()

        ON ACTION HELP
           CALL cl_show_help()

        ON ACTION controlg
           CALL cl_cmdask()

        ON ACTION qbe_select
           CALL cl_qbe_select()

        ON ACTION qbe_save
           CALL cl_qbe_save()

      END CONSTRUCT

   IF INT_FLAG THEN
      LET g_filter_wc = ''
      CALL cl_set_act_visible("revert_filter",FALSE)
      LET INT_FLAG = 0
      RETURN
   END IF
   IF l_wc !=" 1=1" THEN
      CALL cl_set_act_visible("revert_filter",TRUE)
   END IF

   IF cl_null(g_filter_wc) THEN LET g_filter_wc = " 1=1" END IF
   LET g_filter_wc = g_filter_wc CLIPPED," AND ",l_wc CLIPPED

END FUNCTION

FUNCTION q303_1()
   DEFINE   l_sfa       RECORD LIKE sfa_file.*
   DEFINE   l_ima02     LIKE ima_file.ima02
   DEFINE   l_ima021    LIKE ima_file.ima021
   DEFINE   l_avl_stk   LIKE type_file.num15_3
   DEFINE   l_ima25    LIKE ima_file.ima25
   DEFINE   l_cnt      LIKE type_file.num5
   DEFINE   l_factor   LIKE ima_file.ima55_fac
   DEFINE   l_short_qty LIKE sfa_file.sfa07
   DEFINE   l_n1        LIKE type_file.num15_3
   DEFINE   l_n2        LIKE type_file.num15_3
   DEFINE   l_n3        LIKE type_file.num15_3

   DECLARE q303_1_c CURSOR FOR
      SELECT sfa_file.*, ima02,ima021,0,ima25 FROM sfa_file, ima_file
       WHERE sfa01 = g_sfb.sfb01 AND sfa03 = ima01
       ORDER BY sfa27

   CALL g_arr1.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_1_c INTO l_sfa.*,l_ima02,l_ima021,l_avl_stk,l_ima25
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      CALL s_getstock(l_sfa.sfa03,g_plant) RETURNING  l_n1,l_n2,l_n3
      LET l_avl_stk = l_n3
      CALL s_umfchk(l_sfa.sfa03,l_sfa.sfa12,l_ima25)
             RETURNING l_cnt,l_factor
      IF l_cnt THEN LET l_factor = 1 END IF
      IF cl_null(l_factor) THEN LET l_factor = 1 END IF
      #計算欠料量
      CALL s_shortqty(l_sfa.sfa01,l_sfa.sfa03,l_sfa.sfa08,
                      l_sfa.sfa12,l_sfa.sfa27,l_sfa.sfa012,l_sfa.sfa013)
         RETURNING l_short_qty
      IF cl_null(l_short_qty) THEN LET l_short_qty = 0 END IF
      LET g_arr1[g_cnt].a1  = l_sfa.sfa03
      LET g_arr1[g_cnt].a11 = l_sfa.sfa26
      LET g_arr1[g_cnt].a2  = l_sfa.sfa08
      LET g_arr1[g_cnt].a3  = l_sfa.sfa05
      LET g_arr1[g_cnt].a4  = l_sfa.sfa06
      LET g_arr1[g_cnt].a5  = l_short_qty
      LET g_arr1[g_cnt].a51 = l_sfa.sfa063
      LET g_arr1[g_cnt].a52 = l_sfa.sfa062
      LET g_arr1[g_cnt].a6  = l_sfa.sfa05 - l_sfa.sfa06 - l_short_qty
      LET g_arr1[g_cnt].a7  = l_avl_stk
      LET g_arr1[g_cnt].a8  = l_avl_stk - ((l_sfa.sfa05-l_sfa.sfa06)*l_factor)
      LET g_arr1[g_cnt].a9  = l_ima02
      LET g_arr1[g_cnt].a10 = l_ima021
      LET g_cnt = g_cnt + 1
      IF g_cnt > g_max_rec THEN
         CALL cl_err( '', 9035, 0 )
	 EXIT FOREACH
      END IF
   END FOREACH
   DISPLAY g_rec_b TO FORMONLY.cn2
   LET g_cnt = 0
END FUNCTION

FUNCTION q303_2()
   DEFINE   l_ecm        RECORD LIKE ecm_file.*
   DEFINE   l_sfp        RECORD LIKE sfp_file.*
   DEFINE   l_sfq        RECORD LIKE sfq_file.*
   DEFINE   l_sfu        RECORD LIKE sfu_file.*
   DEFINE   l_sfv        RECORD LIKE sfv_file.*
   DEFINE   l_minopseq   LIKE type_file.num5
   DEFINE   l_ima571     LIKE ima_file.ima571
   DEFINE   l_ecb17      LIKE ecb_file.ecb17
   DEFINE   l_add        LIKE type_file.num5


   SELECT ima571 INTO l_ima571 FROM ima_file WHERE ima01 = g_sfb.sfb05
   IF l_ima571 IS NULL THEN LET l_ima571=' ' END IF

   DECLARE q303_2_c CURSOR FOR
      SELECT ecm_file.* FROM ecm_file
       WHERE ecm01 = g_sfb.sfb01
       ORDER BY ecm03

   CALL g_arr2.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_2_c INTO l_ecm.*   #No.MOD-950148
      LET l_add = FALSE   #MOD-BB0290 add
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      LET l_ecm.ecm301 = l_ecm.ecm301 + l_ecm.ecm302 + l_ecm.ecm303
      LET g_arr2[g_cnt].b1 = l_ecm.ecm03 USING '#&'
      LET g_arr2[g_cnt].b2 = l_ecm.ecm301 USING '-------&'
      LET g_arr2[g_cnt].b3 = l_ecm.ecm45
      IF NOT cl_null(l_ecm.ecm04) THEN
         DECLARE q303_2_c2 CURSOR FOR
            SELECT * FROM sfq_file, sfp_file
             WHERE sfq02 = g_sfb.sfb01 AND sfq04 = l_ecm.ecm04
               AND sfq01 = sfp01 AND sfp04='Y'
             ORDER BY sfq01
         FOREACH q303_2_c2 INTO l_sfq.*, l_sfp.*
            LET g_arr2[g_cnt].b4   =l_sfq.sfq01
            CASE l_sfp.sfp06
                 WHEN '1'      LET g_arr2[g_cnt].b5 = cl_getmsg('asf-231',g_lang)
                 WHEN '2'      LET g_arr2[g_cnt].b5 = cl_getmsg('asf-232',g_lang)
                 WHEN '3'      LET g_arr2[g_cnt].b5 = cl_getmsg('asf-233',g_lang)
                 WHEN '4'      LET g_arr2[g_cnt].b5 = cl_getmsg('asf-234',g_lang)
                 WHEN 'A'      LET g_arr2[g_cnt].b5 = cl_getmsg('asf-235',g_lang)
                 WHEN 'C'      LET g_arr2[g_cnt].b5 = cl_getmsg('asf-236',g_lang)
                 WHEN 'D'      LET g_arr2[g_cnt].b5 = cl_getmsg('asf-231',g_lang)
               OTHERWISE
            END CASE
            LET g_arr2[g_cnt].b6   =l_sfp.sfp03
            LET g_arr2[g_cnt].b7   =l_sfq.sfq03 USING '--------'
            LET g_cnt=g_cnt+1
            LET l_add = TRUE
         END FOREACH
      END IF

      DECLARE q303_2_c3 CURSOR FOR
         SELECT * FROM sfv_file, sfu_file
          WHERE sfv11 = g_sfb.sfb01 AND (sfv14 = l_ecm.ecm03 OR sfv15 = l_ecm.ecm03)
            AND sfv01 = sfu01 AND sfupost = 'Y'
          ORDER BY sfu02,sfu00,sfu01
      FOREACH q303_2_c3 INTO l_sfv.*, l_sfu.*
         LET l_sfv.sfv09 = l_sfv.sfv09 * -1		#先視為轉出
         IF l_sfu.sfu00 = '0' AND l_sfv.sfv15 = l_ecm.ecm03 THEN
            LET g_i=l_sfv.sfv14
            LET l_sfv.sfv14 = l_sfv.sfv15
            LET l_sfv.sfv15 = g_i
            LET l_sfv.sfv09 = l_sfv.sfv09*-1	#改為轉入
         END IF
         IF l_sfu.sfu00='2' THEN LET l_sfv.sfv09=l_sfv.sfv09*-1 END IF
         LET g_arr2[g_cnt].b4   =l_sfv.sfv01
         LET g_arr2[g_cnt].b5   = cl_getmsg('asf-851',g_lang)
         LET g_arr2[g_cnt].b6   =l_sfu.sfu00
         LET g_arr2[g_cnt].b7   =l_sfu.sfu02
         LET g_arr2[g_cnt].b8   =l_sfv.sfv09
         LET g_arr2[g_cnt].b9   =l_sfv.sfv12
         LET g_cnt=g_cnt+1
         LET l_add = TRUE
      END FOREACH
      IF NOT l_add THEN
         LET g_cnt=g_cnt+1
      END IF
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_3()
   DEFINE   l_pmm   RECORD LIKE pmm_file.*
   DEFINE   l_pmn   RECORD LIKE pmn_file.*

   DECLARE q303_3_c CURSOR FOR
      SELECT * FROM pmn_file, OUTER pmm_file
       WHERE pmn41 = g_sfb.sfb01 AND pmn_file.pmn01 = pmm_file.pmm01 AND pmm18 <> 'X'
         AND pmm02 = 'SUB'

   CALL g_arr3.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_3_c INTO l_pmn.*, l_pmm.*
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      SELECT pmc03 INTO l_pmm.pmm09 FROM pmc_file WHERE pmc01 = l_pmm.pmm09
      SELECT ima02,ima021 INTO g_arr3[g_cnt].c12,g_arr3[g_cnt].c13 FROM ima_file
       WHERE ima01 = l_pmn.pmn04
      LET g_arr3[g_cnt].c1   = l_pmm.pmm01
      LET g_arr3[g_cnt].c2   = l_pmm.pmm09
      LET g_arr3[g_cnt].c3   = l_pmn.pmn02 USING '#&'
      LET g_arr3[g_cnt].c4   = l_pmn.pmn04
      LET g_arr3[g_cnt].c5   = l_pmn.pmn33
      LET g_arr3[g_cnt].c6   = l_pmn.pmn20 USING '-------&'
      LET g_arr3[g_cnt].c8   = l_pmn.pmn83
      LET g_arr3[g_cnt].c9   = l_pmn.pmn85 USING '-------&'
      LET g_arr3[g_cnt].c10  = l_pmn.pmn80
      LET g_arr3[g_cnt].c11  = l_pmn.pmn82 USING '-------&'
      LET g_arr3[g_cnt].c7   = l_pmn.pmn50 USING '-------&'
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_4()
   DEFINE  l_tlf      RECORD LIKE tlf_file.*
   DEFINE  l_tlff     RECORD LIKE tlff_file.*
   DEFINE  l_tlff218t LIKE tlff_file.tlff218
   DEFINE  l_ware     LIKE type_file.chr20
   DEFINE  l_sfe30    LIKE sfe_file.sfe30
   DEFINE  l_sfe32    LIKE sfe_file.sfe32
   DEFINE  l_sfe33    LIKE sfe_file.sfe33
   DEFINE  l_sfe35    LIKE sfe_file.sfe35
   DEFINE  l_ima02    LIKE ima_file.ima02
   DEFINE  l_ima021   LIKE ima_file.ima021

   DECLARE q303_4_c CURSOR FOR
   SELECT tlf_file.*, ima02,ima021 FROM tlf_file, ima_file
    WHERE tlf01 = ima01
      AND tlf62 = g_sfb.sfb01 AND tlf13 MATCHES 'asfi5*' AND tlf907 <> 0
    ORDER BY tlf06,tlf905

   CALL g_arr4.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_4_c INTO l_tlf.*,l_ima02,l_ima021  #CHI-A50043 add l_ima02,l_ima021
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      LET l_ware=l_tlf.tlf902 CLIPPED,'/',l_tlf.tlf903 CLIPPED,'/',l_tlf.tlf904
      SELECT imd02 INTO g_arr4[g_cnt].d19 FROM imd_file
       WHERE imd01 = l_tlf.tlf902
      SELECT ime03 INTO g_arr4[g_cnt].d20 FROM ime_file
       WHERE ime01 = l_tlf.tlf902
         AND ime02 = l_tlf.tlf903

      LET l_tlf.tlf10 = l_tlf.tlf10 * l_tlf.tlf907 * -1
      LET g_arr4[g_cnt].d1   = l_tlf.tlf06
      LET g_arr4[g_cnt].d2   = l_tlf.tlf905
      LET g_arr4[g_cnt].d3   = l_tlf.tlf906
      LET g_arr4[g_cnt].d4   = l_tlf.tlf01
      LET g_arr4[g_cnt].d15  = l_ima02
      LET g_arr4[g_cnt].d16  = l_ima021
      LET g_arr4[g_cnt].d5   = l_tlf.tlf05
      LET g_arr4[g_cnt].d6   = l_tlf.tlf902
      LET g_arr4[g_cnt].d7   = l_tlf.tlf903
      LET g_arr4[g_cnt].d8   = l_tlf.tlf904
      LET g_arr4[g_cnt].d9   = l_tlf.tlf10
      LET g_arr4[g_cnt].d10  = l_tlf.tlf11

      SELECT sfs012,sfs013 INTO g_arr4[g_cnt].d17,g_arr4[g_cnt].d18
        FROM sfs_file
       WHERE sfs01 = l_tlf.tlf905
         AND sfs02 = l_tlf.tlf906

     #抓雙單位的資料
      DECLARE q303_4_du_c CURSOR FOR
       SELECT sfe30,sfe32,sfe33,sfe35 FROM sfe_file
        WHERE sfe02 = l_tlf.tlf026   #單號
          AND sfe28 = l_tlf.tlf027   #項次
          AND sfe07 = l_tlf.tlf01    #料號
      FOREACH q303_4_du_c INTO l_sfe30,l_sfe32,l_sfe33,l_sfe35
         LET g_arr4[g_cnt].d11  = l_sfe33
         LET g_arr4[g_cnt].d12  = l_sfe35
         LET g_arr4[g_cnt].d13  = l_sfe30
         LET g_arr4[g_cnt].d14  = l_sfe32
      END FOREACH
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_5()
   DEFINE   l_qcf      RECORD LIKE qcf_file.*,
            l_retqty   LIKE qcf_file.qcf061

   DECLARE q303_5_c CURSOR FOR
      SELECT * FROM qcf_file WHERE qcf02=g_sfb.sfb01 AND qcf14 <> 'X'
       ORDER BY qcf00

   CALL g_arr5.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_5_c INTO l_qcf.*
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      LET g_arr5[g_cnt].e1   = l_qcf.qcf01
      LET g_arr5[g_cnt].e2   = l_qcf.qcf04
      LET g_arr5[g_cnt].e3   = l_qcf.qcf22
      LET g_arr5[g_cnt].e5   = l_qcf.qcf091
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_6()
   DEFINE   l_tlf    RECORD LIKE tlf_file.*
   DEFINE   l_tlff   RECORD LIKE tlff_file.*
   DEFINE   l_tlff218t      LIKE tlff_file.tlff218
   DEFINE   l_ware    LIKE type_file.chr20
   DEFINE  l_sfv30    LIKE sfv_file.sfv30
   DEFINE  l_sfv32    LIKE sfv_file.sfv32
   DEFINE  l_sfv33    LIKE sfv_file.sfv33
   DEFINE  l_sfv35    LIKE sfv_file.sfv35

   DECLARE q303_6_c CURSOR FOR
   SELECT * FROM tlf_file
    WHERE tlf62 = g_sfb.sfb01 AND tlf13 MATCHES 'asft6*' AND tlf907 <> 0
    ORDER BY tlf06,tlf905

   CALL g_arr6.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_6_c INTO l_tlf.*
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      SELECT ima02,ima021 INTO g_arr6[g_cnt].f15,g_arr6[g_cnt].f16 FROM ima_file
      #WHERE ima01 = l_tlf.tlf902   #TQC-D60023
       WHERE ima01 = l_tlf.tlf01    #TQC-D60023

      SELECT imd02 INTO g_arr6[g_cnt].f17 FROM imd_file
      #WHERE imd01 = l_tlf.tlf05    #TQC-D60023
       WHERE imd01 = l_tlf.tlf902   #TQC-D60023
      SELECT ime03 INTO g_arr6[g_cnt].f18 FROM ime_file
       WHERE ime01 = l_tlf.tlf902
         AND ime02 = l_tlf.tlf903

      LET l_ware=l_tlf.tlf902 CLIPPED,'/',l_tlf.tlf903 CLIPPED,'/',l_tlf.tlf904
      LET l_tlf.tlf10 = l_tlf.tlf10 * l_tlf.tlf907
      LET g_arr6[g_cnt].f1   = l_tlf.tlf06
      LET g_arr6[g_cnt].f2   = l_tlf.tlf905
      LET g_arr6[g_cnt].f3   = l_tlf.tlf906
      LET g_arr6[g_cnt].f4   = l_tlf.tlf01
      LET g_arr6[g_cnt].f5   = l_tlf.tlf05
      LET g_arr6[g_cnt].f5   = l_tlf.tlf902
      LET g_arr6[g_cnt].f6   = l_tlf.tlf903
      LET g_arr6[g_cnt].f7   = l_tlf.tlf904
      LET g_arr6[g_cnt].f8   = l_tlf.tlf10
      LET g_arr6[g_cnt].f9   = l_tlf.tlf11
      LET g_arr6[g_cnt].f10  = l_tlf.tlf05

     #抓雙單位的資料
      DECLARE q303_6_du_c CURSOR FOR
       SELECT sfv30,sfv32,sfv33,sfv35 FROM sfv_file
        WHERE sfv01 = l_tlf.tlf905   #單號
          AND sfv03 = l_tlf.tlf906   #項次
          AND sfv04 = l_tlf.tlf01    #料號
      FOREACH q303_6_du_c INTO l_sfv30,l_sfv32,l_sfv33,l_sfv35
         LET g_arr6[g_cnt].f11  = l_sfv33
         LET g_arr6[g_cnt].f12  = l_sfv35
         LET g_arr6[g_cnt].f13  = l_sfv30
         LET g_arr6[g_cnt].f14  = l_sfv32
      END FOREACH
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_7()
   DEFINE   l_sfb   RECORD LIKE sfb_file.*

   DECLARE q303_7_c CURSOR FOR
    SELECT * FROM sfb_file WHERE sfb86=g_sfb.sfb01 ORDER BY sfb01

   CALL g_arr7.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_7_c INTO l_sfb.*
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      SELECT ima02,ima021 INTO g_arr7[g_cnt].g8,g_arr7[g_cnt].g9 FROM ima_file
       WHERE ima01 = l_sfb.sfb05
      LET g_arr7[g_cnt].g1   = l_sfb.sfb01
      LET g_arr7[g_cnt].g2   = l_sfb.sfb05
      LET g_arr7[g_cnt].g3   = l_sfb.sfb82
      LET g_arr7[g_cnt].g4   = l_sfb.sfb13
      LET g_arr7[g_cnt].g5   = l_sfb.sfb08
      LET g_arr7[g_cnt].g6   = l_sfb.sfb081
      LET g_arr7[g_cnt].g7   = l_sfb.sfb09
      IF l_sfb.sfb02 MATCHES '[78]' THEN     #lixh121205 add
         SELECT pmc03 INTO g_arr7[g_cnt].g10 FROM pmc_file
          WHERE pmc01 = l_sfb.sfb82
      ELSE
         SELECT gem02 INTO g_arr7[g_cnt].g10 FROM gem_file
          WHERE gem01 = l_sfb.sfb82
      END IF
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_8()
   DEFINE   l_sfa            RECORD LIKE sfa_file.*
   DEFINE   l_qty,l_avl_stk  LIKE type_file.num15_3
   DEFINE   l_bmd04          LIKE bmd_file.bmd04
   DEFINE   l_n1             LIKE type_file.num15_3
   DEFINE   l_n2             LIKE type_file.num15_3
   DEFINE   l_n3             LIKE type_file.num15_3
   DEFINE   l_count          LIKE type_file.num5

   DECLARE q303_8_c CURSOR FOR
    SELECT sfa_file.*,0 FROM sfa_file, ima_file
     WHERE sfa01 = g_sfb.sfb01 AND sfa26 IN ('1','2','3','4','5','6','7','8')
       AND sfa27 = ima01
     ORDER BY sfa27

   CALL g_arr8.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_8_c INTO l_sfa.*, l_avl_stk
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      CALL s_getstock(l_sfa.sfa27,g_plant) RETURNING  l_n1,l_n2,l_n3
      LET l_avl_stk = l_n3
      LET l_qty=0
      SELECT SUM(sfa05-sfa06) INTO l_qty FROM sfa_file
       WHERE sfa01=g_sfb.sfb01 AND sfa27 = l_sfa.sfa27
      SELECT ima02,ima021 INTO g_arr8[g_cnt].h7,g_arr8[g_cnt].h8 FROM ima_file
       WHERE ima01 = l_sfa.sfa27
      LET g_arr8[g_cnt].h1   = l_sfa.sfa27
      LET g_arr8[g_cnt].h2   = l_sfa.sfa26
      LET g_arr8[g_cnt].h3   = l_qty
      LET g_arr8[g_cnt].h4   = l_avl_stk
#lixh121205 add
      SELECT COUNT(*) INTO l_count FROM bmd_file, ima_file
       WHERE bmd01 = l_sfa.sfa27 AND (bmd08 = 'ALL' OR bmd08 = g_sfb.sfb05)
         AND bmd04 = ima01
         AND bmdacti = 'Y'
      IF cl_null(l_count) THEN LET l_count = 0 END IF
      IF l_count = 0 THEN LET g_cnt = g_cnt +1 END IF
#lixh121205 add
      DECLARE q303_8_c2 CURSOR FOR
         SELECT bmd04, 0,ima02,ima021 FROM bmd_file, ima_file  #lixh121205 add
          WHERE bmd01 = l_sfa.sfa27 AND (bmd08 = 'ALL' OR bmd08 = g_sfb.sfb05)
            AND bmd04 = ima01
            AND bmdacti = 'Y'
      FOREACH q303_8_c2 INTO l_bmd04, l_avl_stk,g_arr8[g_cnt].h9,g_arr8[g_cnt].h10   #lixh121205 add
         CALL s_getstock(l_sfa.sfa27,g_plant) RETURNING  l_n1,l_n2,l_n3
         LET l_avl_stk = l_n3
         LET g_arr8[g_cnt].h5 = l_bmd04
         LET g_arr8[g_cnt].h6 = l_avl_stk
         LET g_cnt=g_cnt+1
      END FOREACH
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_9()
   DEFINE   l_sfa     RECORD LIKE sfa_file.*
   DEFINE   l_bml04   LIKE type_file.chr20

   DECLARE q303_9_c CURSOR FOR
      SELECT sfa_file.* FROM sfa_file
       WHERE sfa01=g_sfb.sfb01
         AND sfa03 IN (SELECT bml01 FROM bml_file WHERE bml01=sfa03)
       ORDER BY sfa03

   CALL g_arr9.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_9_c INTO l_sfa.*
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      DECLARE q303_9_c2 CURSOR FOR
         SELECT bml04 FROM bml_file
          WHERE bml01=l_sfa.sfa03 AND (bml02='ALL' OR bml02=g_sfb.sfb05)
      LET g_msg=NULL
      FOREACH q303_9_c2 INTO l_bml04
         LET g_msg=g_msg CLIPPED,l_bml04 CLIPPED,','
      END FOREACH
      IF g_msg IS NULL THEN CONTINUE FOREACH END IF
      SELECT ima02,ima021 INTO g_arr9[g_cnt].i4,g_arr9[g_cnt].i5 FROM ima_file
       WHERE ima01 = l_sfa.sfa03
      LET g_arr9[g_cnt].i1   = l_sfa.sfa03
      LET g_arr9[g_cnt].i2   = l_sfa.sfa05-l_sfa.sfa06
      LET g_arr9[g_cnt].i3   = g_msg CLIPPED
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_10()
   DEFINE   l_shm     RECORD LIKE shm_file.*
   DEFINE   l_bml04   LIKE type_file.chr20


   DECLARE q303_a_c CURSOR FOR
      SELECT shm_file.* FROM shm_file
       WHERE shm012=g_sfb.sfb01
       ORDER BY shm01

   CALL g_arr10.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_a_c INTO l_shm.*
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      LET g_arr10[g_cnt].j1   = l_shm.shm01
      LET g_arr10[g_cnt].j2   = l_shm.shm08
      LET g_arr10[g_cnt].j3   = l_shm.shm13
      LET g_arr10[g_cnt].j4   = l_shm.shm15
      LET g_arr10[g_cnt].j5   = l_shm.shm09
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_11()
   DEFINE   l_srg     RECORD LIKE srg_file.*
   DEFINE   l_srf01   LIKE srf_file.srf01
   DEFINE   l_srf02   LIKE srf_file.srf02

   DECLARE q303_b_c CURSOR FOR
      SELECT srg_file.* FROM srg_file,srf_file
       WHERE srg16 = g_sfb.sfb01
         AND srg01 = srf01
         AND srfconf <> 'X'
       ORDER BY srg16

   CALL g_arr11.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_b_c INTO l_srg.*
      SELECT srf01,srf02 INTO l_srf01,l_srf02 FROM srf_file
       WHERE srf01 = l_srg.srg01
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      LET g_arr11[g_cnt].k1   = l_srf01
      LET g_arr11[g_cnt].k2   = l_srf02
      LET g_arr11[g_cnt].k3   = l_srg.srg02
      LET g_arr11[g_cnt].k4   = l_srg.srg04
      LET g_arr11[g_cnt].k5   = l_srg.srg15
      LET g_arr11[g_cnt].k6   = l_srg.srg05
      LET g_arr11[g_cnt].k7   = l_srg.srg06
      LET g_arr11[g_cnt].k8   = l_srg.srg07
      LET g_arr11[g_cnt].k9   = l_srg.srg08
      LET g_arr11[g_cnt].k10  = l_srg.srg09
      LET g_arr11[g_cnt].k11  = l_srg.srg10
      LET g_arr11[g_cnt].k12  = l_srg.srg11
      LET g_arr11[g_cnt].k13  = l_srg.srg12
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

FUNCTION q303_13()
   DEFINE   l_shb     RECORD LIKE shb_file.*

   DECLARE q303_b_c13 CURSOR FOR
      SELECT shb_file.* FROM shb_file
       WHERE shb05 = g_sfb.sfb01
         AND shbconf = 'Y'     #FUN-A70095
       #ORDER BY shb01
       ORDER BY shb06,shbud02    #mod by lili 170601

   CALL g_arr13.clear()

   LET g_rec_b = 0
   LET g_cnt=1
   FOREACH q303_b_c13 INTO l_shb.*
      LET g_rec_b = g_rec_b + 1
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      SELECT ima02,ima021 INTO g_arr13[g_cnt].m19,g_arr13[g_cnt].m20 FROM ima_file
       WHERE ima01 = l_shb.shb10
      LET g_arr13[g_cnt].m1   = l_shb.shb01
      LET g_arr13[g_cnt].m2   = l_shb.shb02
      LET g_arr13[g_cnt].m021 = l_shb.shb021
      LET g_arr13[g_cnt].m3   = l_shb.shb03
      LET g_arr13[g_cnt].m031 = l_shb.shb031
      LET g_arr13[g_cnt].m032 = l_shb.shb032
      LET g_arr13[g_cnt].m033 = l_shb.shb033
      LET g_arr13[g_cnt].m4   = l_shb.shb04
      LET g_arr13[g_cnt].m5   = l_shb.shb05
      LET g_arr13[g_cnt].m6   = l_shb.shb06
      LET g_arr13[g_cnt].m7   = l_shb.shb07
      LET g_arr13[g_cnt].m8   = l_shb.shb08
      LET g_arr13[g_cnt].m081 = l_shb.shb081
      LET g_arr13[g_cnt].m9   = l_shb.shb09
      LET g_arr13[g_cnt].m10  = l_shb.shb10
      LET g_arr13[g_cnt].m111 = l_shb.shb111
      LET g_arr13[g_cnt].m112 = l_shb.shb112
      LET g_arr13[g_cnt].m113 = l_shb.shb113
      LET g_arr13[g_cnt].m114 = l_shb.shb114
      LET g_arr13[g_cnt].m115 = l_shb.shb115
      LET g_arr13[g_cnt].m12  = l_shb.shb12
      LET g_arr13[g_cnt].m13  = l_shb.shb13
      LET g_arr13[g_cnt].m14  = l_shb.shb14
      LET g_arr13[g_cnt].m15  = l_shb.shb15
      LET g_arr13[g_cnt].m16  = l_shb.shb16
      LET g_arr13[g_cnt].m17  = l_shb.shb17
      LET g_arr13[g_cnt].m18  = l_shb.shb012
      LET g_arr13[g_cnt].m22  = l_shb.shbud02    #add by lili 170531
      SELECT gen02 INTO g_arr13[g_cnt].m21 FROM gen_file   #lixh121205 add
       WHERE gen01 = g_arr13[g_cnt].m4
      LET g_cnt=g_cnt+1
   END FOREACH
   DISPLAY g_rec_b TO cn2
END FUNCTION

#add by lili 170717 ---s---
FUNCTION q303_bp0()

   LET g_action_choice = " "
   #LET g_action_flag = "page1"

   CASE g_action_flag
      WHEN 1
        CALL q303_bp_1()
      WHEN 2
        CALL q303_bp_3()
      OTHERWISE
        CALL q303_bp_1()
   END CASE
END FUNCTION

FUNCTION q303_bp_3()

   LET g_action_choice = " "
   DISPLAY g_rec_b2 TO FORMONLY.cnt2
   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY BY NAME tm.y1,tm.y2,tm.y3,tm.p,tm.c,tm.d   #add tm.d by lili 170717

   DIALOG ATTRIBUTES(UNBUFFERED)
    DISPLAY ARRAY g_sfb_2 TO s_sfb_2.* ATTRIBUTE(COUNT=g_rec_b2)
         BEFORE DISPLAY
            IF NOT cl_null(l_ac2_t) AND l_ac2_t > 0 THEN
               CALL fgl_set_arr_curr(l_ac2_t)
            END IF

         BEFORE ROW
            LET l_ac2 = ARR_CURR()
            CALL cl_show_fld_cont()
      END DISPLAY

    INPUT tm.y1,tm.y2,tm.y3,tm.p,tm.c,tm.d FROM y1,y2,y3,p,c,d ATTRIBUTE(WITHOUT DEFAULTS)   #add tm.d by lili 170717

         ON CHANGE y1
            IF tm.y1 = 'Y' THEN
               LET tm.wc1 = "sfb08 < sfb09"
            ELSE
               LET tm.wc1 = " 1 =1"
            END IF
            CALL g_sfb_2.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 2
            DISPLAY g_rec_b2 TO FORMONLY.cnt2
            DISPLAY BY NAME tm.y1
            EXIT DIALOG

         ON CHANGE y2
            IF tm.y2 = 'Y' THEN
               LET tm.wc2 = "sfb08 = sfb09"
            ELSE
               LET tm.wc2 = " 1 =1"
            END IF
            CALL g_sfb_2.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 2
            DISPLAY g_rec_b2 TO FORMONLY.cnt2
            DISPLAY BY NAME tm.y2
            EXIT DIALOG

         ON CHANGE y3
            IF tm.y3 = 'Y' THEN
               LET tm.wc3 = "sfb08 > sfb09"
            ELSE
               LET tm.wc3 = " 1 =1"
            END IF
            CALL g_sfb_2.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 2
            DISPLAY g_rec_b2 TO FORMONLY.cnt2
            DISPLAY BY NAME tm.y3
            EXIT DIALOG

         ON CHANGE p
            CALL g_sfb_2.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 2
            DISPLAY g_rec_b2 TO FORMONLY.cnt2
            DISPLAY BY NAME tm.p
            EXIT DIALOG

         ON CHANGE c
            CALL g_sfb_2.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 2
            DISPLAY g_rec_b2 TO FORMONLY.cnt2
            DISPLAY BY NAME tm.c
            EXIT DIALOG

         #add by lili 170717 ---s---
         ON CHANGE d
            CALL g_sfb_2.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 2
            DISPLAY g_rec_b2 TO FORMONLY.cnt2
            DISPLAY BY NAME tm.d
            EXIT DIALOG
         #add by lili 170717 ---e---
      END INPUT

      #add by lili 170717 ---s---
      ON ACTION page6  #明細資料
         CALL q303_b_fill_1()
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_action_choice = 'page6'
         LET g_action_flag = 1
         EXIT DIALOG

      ON ACTION page7   #汇总页签
         CALL q303_b_fill_3()
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         LET g_action_choice = 'page7'
         LET g_action_flag = 2
         EXIT DIALOG
      #add by lili 170717 ---e---

      ON ACTION query
         LET g_action_choice="query"
         EXIT DIALOG

      ON ACTION ACCEPT
         LET l_ac1 = ARR_CURR()
         LET l_ac_t = ARR_CURR()
         IF l_ac1 > 0  THEN
            CALL q303_detail_fill(l_ac1)
            CALL cl_set_comp_visible("page1", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page1", TRUE)
            LET g_action_choice= "page2"
            LET g_b_flag_up = 2
            LET g_b_flag = 1
            LET g_action_flag = 2
            EXIT DIALOG
         END IF

      ON ACTION data_filter      #資料過濾
         LET g_action_choice="data_filter"
         EXIT DIALOG

      ON ACTION revert_filter    #過濾還原
         LET g_action_choice="revert_filter"
         EXIT DIALOG

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_action_choice = 'page1'
         LET g_action_flag = 2
         EXIT DIALOG

      ON ACTION HELP
         LET g_action_choice="help"
         EXIT DIALOG

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()

      ON ACTION EXIT
         LET g_action_choice="exit"
         EXIT DIALOG

      ON ACTION controlg
         LET l_ac = ARR_CURR()
         LET l_ac_t = ARR_CURR()
         LET g_action_choice="controlg"
         EXIT DIALOG

      ON ACTION CANCEL
         LET INT_FLAG=FALSE
         LET g_action_choice="exit"
         EXIT DIALOG

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DIALOG

      ON ACTION about
         CALL cl_about()

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DIALOG

      ON ACTION related_document
         LET g_action_choice="related_document"
         EXIT DIALOG

      AFTER DIALOG
         CONTINUE DIALOG

      ON ACTION controls
         CALL cl_set_head_visible("","AUTO")

   END DIALOG

END FUNCTION
#add by lili 170717 ---e---

FUNCTION q303_bp_1()

   LET g_action_choice = " "
   DISPLAY g_rec_b_1 TO FORMONLY.cnt1
   DISPLAY g_sum_sfb08,g_sum_sfb09 TO sum_sfb08,sum_sfb09
   DISPLAY g_sum_sfv09,g_sum_wip,g_sum_ecm314,g_sum_shd07,g_sum_diff TO sum_sfv09,sum_wip,sum_ecm314,sum_shd07,sum_diff
   DISPLAY g_sum_01,g_sum_02,g_sum_03,g_sum_04,g_sum_05,g_sum_06,g_sum_07 TO sum_ecm45_01,sum_ecm45_02,sum_ecm45_03,sum_ecm45_04,sum_ecm45_05,sum_ecm45_06,sum_ecm45_07
   DISPLAY g_sum_sfv091 TO sum_sfv091    #add by lili 170717
   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY BY NAME tm.y1,tm.y2,tm.y3,tm.p,tm.c,tm.d   #add tm.d by lili 170717
   DIALOG ATTRIBUTES(UNBUFFERED)
    DISPLAY ARRAY g_sfb_1 TO s_sfb_1.* ATTRIBUTE(COUNT=g_rec_b)
         BEFORE DISPLAY
            #CALL DIALOG.setArrayAttributes("s_sfb_1",g_sfb_1_attr)    #参数：屏幕变量,属性数组
            CALL ui.Interface.refresh()
            IF NOT cl_null(l_ac_t) AND l_ac_t > 0 THEN
               CALL fgl_set_arr_curr(l_ac_t)
            END IF
         BEFORE ROW
            LET l_ac = ARR_CURR()
            CALL cl_show_fld_cont()
      END DISPLAY

    INPUT tm.y1,tm.y2,tm.y3,tm.p,tm.c,tm.d FROM y1,y2,y3,p,c,d ATTRIBUTE(WITHOUT DEFAULTS)   #add tm.d by lili 170717
         BEFORE INPUT
            #CALL DIALOG.setArrayAttributes("s_sfb_1",g_sfb_1_attr)    #参数：屏幕变量,属性数组
            CALL ui.Interface.refresh()

         ON CHANGE y1
            IF tm.y1 = 'Y' THEN
               LET tm.wc1 = "sfb08 < sfb09"
            ELSE
               LET tm.wc1 = " 1 =1"
            END IF
            CALL g_sfb_1.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()    #add by lili 170717
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page2", TRUE)
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 1
            DISPLAY g_rec_b_1 TO FORMONLY.cnt1
            DISPLAY g_sum_sfb08,g_sum_sfb09 TO sum_sfb08,sum_sfb09
            DISPLAY g_sum_sfv09,g_sum_wip,g_sum_ecm314,g_sum_shd07,g_sum_diff TO sum_sfv09,sum_wip,sum_ecm314,sum_shd07,sum_diff
            DISPLAY g_sum_01,g_sum_02,g_sum_03,g_sum_04,g_sum_05,g_sum_06,g_sum_07 TO sum_ecm45_01,sum_ecm45_02,sum_ecm45_03,sum_ecm45_04,sum_ecm45_05,sum_ecm45_06,sum_ecm45_07
            DISPLAY g_sum_sfv091 TO sum_sfv091    #add by lili 170717
            DISPLAY BY NAME tm.y1
            EXIT DIALOG

         ON CHANGE y2
            IF tm.y2 = 'Y' THEN
               LET tm.wc2 = "sfb08 = sfb09"
            ELSE
               LET tm.wc2 = " 1 =1"
            END IF
            CALL g_sfb_1.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()    #add by lili 170717
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page2", TRUE)
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 1
            DISPLAY g_rec_b_1 TO FORMONLY.cnt1
            DISPLAY g_sum_sfb08,g_sum_sfb09 TO sum_sfb08,sum_sfb09
            DISPLAY g_sum_sfv09,g_sum_wip,g_sum_ecm314,g_sum_shd07,g_sum_diff TO sum_sfv09,sum_wip,sum_ecm314,sum_shd07,sum_diff
            DISPLAY g_sum_01,g_sum_02,g_sum_03,g_sum_04,g_sum_05,g_sum_06,g_sum_07 TO sum_ecm45_01,sum_ecm45_02,sum_ecm45_03,sum_ecm45_04,sum_ecm45_05,sum_ecm45_06,sum_ecm45_07
            DISPLAY g_sum_sfv091 TO sum_sfv091    #add by lili 170717
            DISPLAY BY NAME tm.y2
            EXIT DIALOG

         ON CHANGE y3
            IF tm.y3 = 'Y' THEN
               LET tm.wc3 = "sfb08 > sfb09"
            ELSE
               LET tm.wc3 = " 1 =1"
            END IF
            CALL g_sfb_1.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()    #add by lili 170717
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page2", TRUE)
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 1
            DISPLAY g_rec_b_1 TO FORMONLY.cnt1
            DISPLAY g_sum_sfb08,g_sum_sfb09 TO sum_sfb08,sum_sfb09
            DISPLAY g_sum_sfv09,g_sum_wip,g_sum_ecm314,g_sum_shd07,g_sum_diff TO sum_sfv09,sum_wip,sum_ecm314,sum_shd07,sum_diff
            DISPLAY g_sum_01,g_sum_02,g_sum_03,g_sum_04,g_sum_05,g_sum_06,g_sum_07 TO sum_ecm45_01,sum_ecm45_02,sum_ecm45_03,sum_ecm45_04,sum_ecm45_05,sum_ecm45_06,sum_ecm45_07
            DISPLAY g_sum_sfv091 TO sum_sfv091    #add by lili 170717
            DISPLAY BY NAME tm.y3
            EXIT DIALOG

         ON CHANGE p
            CALL g_sfb_1.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()    #add by lili 170717
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page2", TRUE)
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 1
            DISPLAY g_rec_b_1 TO FORMONLY.cnt1
            DISPLAY g_sum_sfb08,g_sum_sfb09 TO sum_sfb08,sum_sfb09
            DISPLAY g_sum_sfv09,g_sum_wip,g_sum_ecm314,g_sum_shd07,g_sum_diff TO sum_sfv09,sum_wip,sum_ecm314,sum_shd07,sum_diff
            DISPLAY g_sum_01,g_sum_02,g_sum_03,g_sum_04,g_sum_05,g_sum_06,g_sum_07 TO sum_ecm45_01,sum_ecm45_02,sum_ecm45_03,sum_ecm45_04,sum_ecm45_05,sum_ecm45_06,sum_ecm45_07
            DISPLAY g_sum_sfv091 TO sum_sfv091    #add by lili 170717
            DISPLAY BY NAME tm.y3
            EXIT DIALOG

         ON CHANGE c
            CALL g_sfb_1.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()    #add by lili 170717
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page2", TRUE)
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 1
            DISPLAY g_rec_b_1 TO FORMONLY.cnt1
            DISPLAY g_sum_sfb08,g_sum_sfb09 TO sum_sfb08,sum_sfb09
            DISPLAY g_sum_sfv09,g_sum_wip,g_sum_ecm314,g_sum_shd07,g_sum_diff TO sum_sfv09,sum_wip,sum_ecm314,sum_shd07,sum_diff
            DISPLAY g_sum_01,g_sum_02,g_sum_03,g_sum_04,g_sum_05,g_sum_06,g_sum_07 TO sum_ecm45_01,sum_ecm45_02,sum_ecm45_03,sum_ecm45_04,sum_ecm45_05,sum_ecm45_06,sum_ecm45_07
            DISPLAY g_sum_sfv091 TO sum_sfv091    #add by lili 170717
            DISPLAY BY NAME tm.y3
            EXIT DIALOG

         #add by lili 170717 ---s---
         ON CHANGE d
            CALL g_sfb_1.clear()
            CALL q303_get_tmp()
            CALL q303_b_fill_1()
            CALL q303_b_fill_3()    #add by lili 170717
            CALL cl_set_comp_visible("page2", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page2", TRUE)
            LET g_action_choice = "page1"
            LET g_b_flag_up = 1
            LET g_action_flag = 1
            DISPLAY g_rec_b_1 TO FORMONLY.cnt1
            DISPLAY g_sum_sfb08,g_sum_sfb09 TO sum_sfb08,sum_sfb09
            DISPLAY g_sum_sfv09,g_sum_wip,g_sum_ecm314,g_sum_shd07,g_sum_diff TO sum_sfv09,sum_wip,sum_ecm314,sum_shd07,sum_diff
            DISPLAY g_sum_01,g_sum_02,g_sum_03,g_sum_04,g_sum_05,g_sum_06,g_sum_07 TO sum_ecm45_01,sum_ecm45_02,sum_ecm45_03,sum_ecm45_04,sum_ecm45_05,sum_ecm45_06,sum_ecm45_07
            DISPLAY g_sum_sfv091 TO sum_sfv091    #add by lili 170717
            DISPLAY BY NAME tm.d
            EXIT DIALOG
         #add by lili 170717 ---e---
      END INPUT

      ON ACTION page2
         LET l_ac = ARR_CURR()        #獲取光標所在行
         LET l_ac_t = ARR_CURR()
         IF g_sfb_1.getLength() > 0 AND l_ac = 0 THEN
            LET l_ac = 1
         END IF
         IF l_ac > 0 THEN
            SELECT * INTO g_sfb.* FROM sfb_file WHERE sfb01 = g_sfb_1[l_ac].sfb01   #撈取單頭的值
            LET g_b_flag_up = 2
            LET g_b_flag = 1
            LET g_action_flag = 1
            LET g_action_choice="allotment"
         END IF
         EXIT DIALOG

      #add by lili 170717 ---s---
      ON ACTION page6  #明細資料
         CALL q303_b_fill_1()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_action_choice = 'page6'
         LET g_action_flag = '1'
         EXIT DIALOG

      ON ACTION page7   #汇总页签
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         LET g_action_choice = 'page7'
         LET g_action_flag = '2'
         EXIT DIALOG
      #add by lili 170717 ---e---

      ON ACTION query
         LET g_action_choice="query"
         EXIT DIALOG


      ON ACTION ACCEPT
         LET l_ac1 = ARR_CURR()
         LET l_ac_t = ARR_CURR()
         IF l_ac1 > 0  THEN
            CALL q303_detail_fill(l_ac1)
            CALL cl_set_comp_visible("page1", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page1", TRUE)
            LET g_action_choice= "page2"
            LET g_b_flag_up = 2
            LET g_b_flag = 1
            LET g_action_flag = 1
            EXIT DIALOG
         END IF

      ON ACTION data_filter      #資料過濾
         LET g_action_choice="data_filter"
         EXIT DIALOG

      ON ACTION revert_filter    #過濾還原
         LET g_action_choice="revert_filter"
         EXIT DIALOG

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_action_choice = 'page1'
         LET g_action_flag = 1
         EXIT DIALOG

      ON ACTION HELP
         LET g_action_choice="help"
         EXIT DIALOG

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()

      ON ACTION EXIT
         LET g_action_choice="exit"
         EXIT DIALOG

      ON ACTION controlg
         LET l_ac = ARR_CURR()
         LET l_ac_t = ARR_CURR()
         LET g_action_choice="controlg"
         EXIT DIALOG

      ON ACTION CANCEL
         LET INT_FLAG=FALSE
         LET g_action_choice="exit"
         EXIT DIALOG

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DIALOG

      ON ACTION about
         CALL cl_about()

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DIALOG

      ON ACTION related_document
         LET g_action_choice="related_document"
         EXIT DIALOG

      AFTER DIALOG
         CONTINUE DIALOG

      ON ACTION controls
         CALL cl_set_head_visible("","AUTO")

   END DIALOG

END FUNCTION

FUNCTION q303_bp_2()

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL q303_b_fill_2()   #顯示詳細資料

      CASE g_b_flag
         WHEN '1'
            CALL q303_bp1("G")
         WHEN '2'
            CALL q303_bp2("G")
         WHEN '3'
            CALL q303_bp3("G")
         WHEN '4'
            CALL q303_bp4("G")
         WHEN '5'
            CALL q303_bp5("G")
         WHEN '6'
            CALL q303_bp6("G")
         WHEN '7'
            CALL q303_bp7("G")
         WHEN '8'
            CALL q303_bp8("G")
         WHEN '9'
            CALL q303_bp9("G")
         WHEN '10'
            CALL q303_bp10("G")
         WHEN '11'
            CALL q303_bp11("G")
         WHEN '13'
            CALL q303_bp13("G")
         OTHERWISE
            CALL q303_bp1("G")
      END CASE
   CALL cl_set_act_visible("accept,cancel", TRUE)

END FUNCTION

FUNCTION q303_table()
   DROP TABLE csfq303_tmp;
   CREATE TEMP TABLE csfq303_tmp(
         speed        LIKE type_file.chr1,
         state        LIKE type_file.chr1,
         sfb01        LIKE sfb_file.sfb01,
         smydesc      LIKE smy_file.smydesc,
         sfb81        LIKE sfb_file.sfb81,
         sfb02        LIKE sfb_file.sfb02,
         sfb87        LIKE sfb_file.sfb87,
         sfb28        LIKE sfb_file.sfb28,
         sfb82        LIKE sfb_file.sfb82,
         pmc03        LIKE pmc_file.pmc03,
         sfb98        LIKE sfb_file.sfb98,
         gem02        LIKE gem_file.gem02,
         sfb05        LIKE sfb_file.sfb05,
         ima02        LIKE ima_file.ima02,
         ima021       LIKE ima_file.ima021,
         imaud02      LIKE ima_file.imaud02,    #add by lili 170606
         ima09        LIKE ima_file.ima09,      #add by lili 170722
         sfb96        LIKE sfb_file.sfb96,      #add by lili 170606
         sfb36        LIKE sfb_file.sfb36,      #add by lili 170706
         ima55        LIKE ima_file.ima55,
         sfb08        LIKE sfb_file.sfb08,
         sfb081       LIKE sfb_file.sfb081,
         qi           LIKE sfb_file.sfb08,
         sfb09        LIKE sfb_file.sfb09,
         sfv091       LIKE sfv_file.sfv09,      #add by lili 170717
         sfv09        LIKE sfv_file.sfv09,      #add by lili 170717
         tot_wip      LIKE sfv_file.sfv09,      #add by lili 170717
         qcf091       LIKE qcf_file.qcf091,
         sfb12        LIKE sfb_file.sfb12,
         qrate        LIKE sfb_file.sfb08,
         trate        LIKE sfb_file.sfb08,
         sfb13        LIKE sfb_file.sfb13,
         sfb15        LIKE sfb_file.sfb15,
         sfp03        LIKE sfp_file.sfp03,
         sfp03_1      LIKE sfp_file.sfp03,
         shb02        LIKE shb_file.shb02,
         shb02_1      LIKE shb_file.shb02,
         sfu02        LIKE sfu_file.sfu02,
         sfu02_1      LIKE sfu_file.sfu02,
         sfb86        LIKE sfb_file.sfb86,
         sfb27        LIKE sfb_file.sfb27,
         pja02        LIKE pja_file.pja02,
         sfb91        LIKE sfb_file.sfb91,
         sfb92        LIKE sfb_file.sfb92,
         sfb22        LIKE sfb_file.sfb22,
         sfb221       LIKE sfb_file.sfb221,
         oea03        LIKE oea_file.oea03,
         oea032       LIKE oea_file.oea032,
         oea14        LIKE oea_file.oea14,
         gen02        LIKE gen_file.gen02,
         oeb15        LIKE oeb_file.oeb15,
         ima06        LIKE ima_file.ima06,
         imz02        LIKE imz_file.imz02,
         pro          LIKE ima_file.ima128,
         compro       LIKE ima_file.ima128,
         sfb39        LIKE sfb_file.sfb39,
         sfb04        LIKE sfb_file.sfb04,
         sfb38        LIKE sfb_file.sfb38,
         pmm09        LIKE pmm_file.pmm09,
         pmc03_1      LIKE type_file.chr200,
         sfb93        LIKE sfb_file.sfb93,
         sfb06        LIKE sfb_file.sfb06,
         sfb94        LIKE sfb_file.sfb94,
         ecm012       LIKE ecm_file.ecm012,
         ecm45_1      LIKE ecm_file.ecm45,
         ecm45_011    LIKE ecm_file.ecm45,
         ecm45_2      LIKE ecm_file.ecm45,
         ecm45_021    LIKE ecm_file.ecm45,
         ecm45_3      LIKE ecm_file.ecm45,
         ecm45_031     LIKE ecm_file.ecm45,
         ecm45_4      LIKE ecm_file.ecm45,
         ecm45_041     LIKE ecm_file.ecm45,
         ecm45_5      LIKE ecm_file.ecm45,
         ecm45_051     LIKE ecm_file.ecm45,
         ecm45_6      LIKE ecm_file.ecm45,
         ecm45_061     LIKE ecm_file.ecm45,
         ecm45_7      LIKE ecm_file.ecm45,
         ecm45_071     LIKE ecm_file.ecm45,
         ecm45_8      LIKE ecm_file.ecm45,
         ecm45_081     LIKE ecm_file.ecm45,
         ecm45_9      LIKE ecm_file.ecm45,
         ecm45_091     LIKE ecm_file.ecm45,
         ecm45_10     LIKE ecm_file.ecm45,
         ecm45_101      LIKE ecm_file.ecm45,
         ecm45_11     LIKE ecm_file.ecm45,
         ecm45_111      LIKE ecm_file.ecm45,
         ecm45_12     LIKE ecm_file.ecm45,
         ecm45_121      LIKE ecm_file.ecm45,
         ecm45_13     LIKE ecm_file.ecm45,
         ecm45_131      LIKE ecm_file.ecm45,
         ecm45_14     LIKE ecm_file.ecm45,
         ecm45_141      LIKE ecm_file.ecm45,
         ecm45_15     LIKE ecm_file.ecm45,
         ecm45_151      LIKE ecm_file.ecm45,
         ecm45_16     LIKE ecm_file.ecm45,
         ecm45_161      LIKE ecm_file.ecm45,
         ecm45_17     LIKE ecm_file.ecm45,
         ecm45_171      LIKE ecm_file.ecm45,
         ecm45_18     LIKE ecm_file.ecm45,
         ecm45_181      LIKE ecm_file.ecm45,
         ecm45_19     LIKE ecm_file.ecm45,
         ecm45_191      LIKE ecm_file.ecm45,
         ecm45_20     LIKE ecm_file.ecm45,
         ecm45_201      LIKE ecm_file.ecm45,
         ecm45_21     LIKE ecm_file.ecm45,
         ecm45_211      LIKE ecm_file.ecm45,
         ecm45_22     LIKE ecm_file.ecm45,
         ecm45_221      LIKE ecm_file.ecm45,
         ecm45_23     LIKE ecm_file.ecm45,
         ecm45_231      LIKE ecm_file.ecm45,
         ecm45_24     LIKE ecm_file.ecm45,
         ecm45_241      LIKE ecm_file.ecm45,
         ecm45_25     LIKE ecm_file.ecm45,
         ecm45_251      LIKE ecm_file.ecm45,
         ecm45_26     LIKE ecm_file.ecm45,
         ecm45_261      LIKE ecm_file.ecm45,
         ecm45_27     LIKE ecm_file.ecm45,
         ecm45_271      LIKE ecm_file.ecm45,
         ecm45_28     LIKE ecm_file.ecm45,
         ecm45_281      LIKE ecm_file.ecm45,
         ecm45_29     LIKE ecm_file.ecm45,
         ecm45_291      LIKE ecm_file.ecm45,
         ecm45_30     LIKE ecm_file.ecm45,
         ecm45_301      LIKE ecm_file.ecm45,
         tot_ecm314   LIKE ecm_file.ecm314,
         shd07        LIKE shd_file.shd07,
         diff         LIKE shd_file.shd07,
         ecm03        LIKE ecm_file.ecm03,
         ecm53        LIKE ecm_file.ecm53,
         ecm54        LIKE ecm_file.ecm54,
         ecm62        LIKE ecm_file.ecm62,
         ecm63        LIKE ecm_file.ecm63,
         ecm291       LIKE ecm_file.ecm291,
         ecm301       LIKE ecm_file.ecm301,
         ecm302       LIKE ecm_file.ecm302,
         ecm303       LIKE ecm_file.ecm303,
         ecm311       LIKE ecm_file.ecm311,
         ecm312       LIKE ecm_file.ecm312,
         ecm313       LIKE ecm_file.ecm313,
         ecm314       LIKE ecm_file.ecm314,
         ecm315       LIKE ecm_file.ecm315,
         ecm316       LIKE ecm_file.ecm316)
END FUNCTION

FUNCTION q303_get_tmp()
   DEFINE   l_sql     STRING
   DEFINE   l_sql1    STRING
   DEFINE   l_slip    LIKE smy_file.smyslip
   DEFINE   l_ima153  LIKE ima_file.ima153
   DEFINE   l_cnt     LIKE type_file.num5
   DEFINE   l_sfb04   LIKE sfb_file.sfb04
   DEFINE   l_count1,l_count2,l_count3  LIKE type_file.num10
   DEFINE   l_count4,l_count5           LIKE type_file.num10
   DEFINE   l_qcf091  LIKE qcf_file.qcf091
   DEFINE   l_qcm091  LIKE qcm_file.qcm091
   DEFINE   l_ecm53   LIKE ecm_file.ecm53
   DEFINE   l_ecm012  LIKE ecm_file.ecm012
   DEFINE   l_ecm03   LIKE ecm_file.ecm03
   DEFINE   l_ecm311  LIKE ecm_file.ecm311
   DEFINE   l_sfv09   LIKE sfv_file.sfv09
   DEFINE   l_str     STRING
   DEFINE   l_pmm09   LIKE pmm_file.pmm09
   DEFINE   l_pmc03   LIKE pmc_file.pmc03
   DEFINE   l_tot     LIKE type_file.num5
   DEFINE sr          sr1_t
   DEFINE   l_sfb94   LIKE sfb_file.sfb94
   DEFINE   l_sfb93   LIKE sfb_file.sfb93

   CALL g_sfb_1.clear()
   CALL g_sfb_1_excel.clear()
   LET g_cnt = 1
   LET g_rec_b_1 = 0
   MESSAGE "Searching!"
   CALL q303_table()

   DELETE FROM csfq303_tmp
   IF tm.y1 = 'N' AND tm.y2 = 'N' AND tm.y3 = 'N' THEN  #此種情況不需要撈出資料
      DISPLAY g_rec_b_1 TO FORMONLY.cnt1
      RETURN
   END IF

   IF cl_null(g_wc) THEN LET g_wc = " 1 =1" END IF
   IF cl_null(g_filter_wc) THEN LET g_filter_wc = " 1 =1" END IF
   IF cl_null(tm.wc1) THEN LET tm.wc1 = " 1 =1" END IF
   IF cl_null(tm.wc2) THEN LET tm.wc2 = " 1 =1" END IF
   IF cl_null(tm.wc3) THEN LET tm.wc3 = " 1 =1" END IF

   LET l_sql = "SELECT '' speed,'' state,sfb01,'' smydesc,sfb81,sfb02,sfb87,sfb28,sfb82,'' pmc03,sfb98,gem02,sfb05,ima02,ima021,imaud02,ima09,sfb96,sfb36,",   #add imaud02,sfb96 by lili 170606
               "       ima55,sfb08,sfb081,0 qi,sfb09,0 sfv091,0 sfv09,0 tot_wip,0 qcf091,sfb12,'' qrate,'' trate,sfb13,sfb15,'' sfp03,'' sfp03_1,'' shb02,",
               "       '' shb02_1,'' sfu02,'' sfu02_1,sfb86,sfb27,",
               "       pja02,sfb91,sfb92,sfb22,sfb221,oea03,oea032,oea14,gen02,oeb15,ima06,imz02,(sfb08*ima128),(sfb09*ima128),",
               #"       sfb39,sfb04,sfb38,'' pmm09,'' pmc03_1,sfb93,sfb06,sfb94,ecm012,ecm45 ecm45_1,''ecm45_2,'' ecm45_3,'' ecm45_4,",               "       '' ecm45_5,'' ecm45_6,'' ecm45_7,'' ecm45_8,'' ecm45_9,'' ecm45_10,",
               #"       '' ecm45_11,'' ecm45_12,'' ecm45_13,'' ecm45_14 ,'' ecm45_15,'' ecm45_16,'' ecm45_17,'' ecm45_18,'' ecm45_19,",
               #"       '' ecm45_20,'' ecm45_21,'' ecm45_22,'' ecm45_23,'' ecm45_24,'' ecm45_25,'' ecm45_26,'' ecm45_27,'' ecm45_28,",
               #"       '' ecm45_29,'' ecm45_30,ecm03,ecm53,ecm54,ecm62,ecm63,ecm291,ecm301,",
               "       sfb39,sfb04,sfb38,'' pmm09,'' pmc03_1,sfb93,sfb06,sfb94,ecm012,ecm45 ecm45_1,0 ecm45_011,''ecm45_2,0 ecm45_021,'' ecm45_3,0 ecm45_031,'' ecm45_4,0 ecm45_041,",
               "       '' ecm45_5,0 ecm45_051,'' ecm45_6,0 ecm45_061,'' ecm45_7,0 ecm45_071,'' ecm45_8,0 ecm45_081,'' ecm45_9,0 ecm45_091,'' ecm45_10,0 ecm45_101,",
               "       '' ecm45_11,0 ecm45_111,'' ecm45_12,0 ecm45_121,'' ecm45_13,0 ecm45_131,'' ecm45_14 ,0 ecm45_141,'' ecm45_15,0 ecm45_151,'' ecm45_16,0 ecm45_161,'' ecm45_17,0 ecm45_171,'' ecm45_18,0 ecm45_181,'' ecm45_19,0 ecm45_191, ",
               "       '' ecm45_20,0 ecm45_201,'' ecm45_21,0 ecm45_211,'' ecm45_22,0 ecm45_221,'' ecm45_23,0 ecm45_231,'' ecm45_24,0 ecm45_241,'' ecm45_25,0 ecm45_251,'' ecm45_26,0 ecm45_261,'' ecm45_27,0 ecm45_271,'' ecm45_28,0 ecm45_281,",
               "       '' ecm45_29,0 ecm45_291,'' ecm45_30,0 ecm45_301,0 tot_ecm314,0 shd07,0 diff,ecm03,ecm53,ecm54,ecm62,ecm63,ecm291,ecm301,",
               "       ecm302,ecm303,ecm311,ecm312,",
               "       ecm313,ecm314,ecm315,ecm316 ",
               "  FROM sfb_file LEFT OUTER JOIN ecm_file ON ecm01 = sfb01 LEFT OUTER JOIN oea_file ON oea01 = sfb22 ",
               "                LEFT OUTER JOIN oeb_file ON oeb01 = sfb22 AND oeb03 = sfb221",
               "                LEFT OUTER JOIN ima_file ON sfb05 = ima01 LEFT OUTER JOIN imz_file ON ima06 = imz01",
               "                LEFT OUTER JOIN gem_file ON sfb98 = gem01 LEFT OUTER JOIN gen_file ON oea14 = gen01",
               "                LEFT OUTER JOIN pja_file ON pja01 = sfb27 ",
               " WHERE ",g_wc CLIPPED, " AND ",g_filter_wc CLIPPED
   IF tm.y1 = 'Y' AND tm.y2 = 'N' AND tm.y3 = 'N' THEN
      LET l_sql = l_sql," AND ",tm.wc1
   END IF

   IF tm.y2 = 'Y' AND tm.y1 = 'N' AND tm.y3 = 'N' THEN
      LET l_sql = l_sql," AND ",tm.wc2
   END IF

   IF tm.y3 = 'Y' AND tm.y1 = 'N' AND tm.y2 = 'N' THEN
      LET l_sql = l_sql," AND ",tm.wc3
   END IF

   IF tm.y1 = 'Y' AND tm.y2 = 'Y' AND tm.y3 = 'Y' THEN
      LET l_sql = l_sql," AND ","(",tm.wc1," OR ",tm.wc2," OR ",tm.wc3,")"
   END IF

   IF tm.y1 = 'Y' AND tm.y2 = 'Y' AND tm.y3 = 'N' THEN
      LET l_sql = l_sql," AND ","(",tm.wc1," OR ",tm.wc2,")"
   END IF

   IF tm.y1 = 'Y' AND tm.y3 = 'Y' AND tm.y2 = 'N' THEN
      LET l_sql = l_sql," AND ","(",tm.wc1," OR ",tm.wc3,")"
   END IF

   IF tm.y2 = 'Y' AND tm.y3 = 'Y' AND tm.y1 = 'N' THEN
      LET l_sql = l_sql," AND ","(",tm.wc2," OR ",tm.wc3,")"
   END IF
   LET l_sql = l_sql CLIPPED," ORDER BY sfb01,sfb02,sfb04,ecm012,ecm03 "

   LET l_sql1 = "INSERT INTO csfq303_tmp",
                " SELECT x.* FROM (",l_sql CLIPPED,") x "
   PREPARE q303_ins FROM l_sql1
   EXECUTE q303_ins

   DISPLAY TIME   #lixh1

#lixh120121122 ----------Begin------------
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET sfb93 = 'N' ",
               "  WHERE TRIM(sfb93) IS NULL "

   PREPARE q303_pre1 FROM l_sql
   EXECUTE q303_pre1

   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET sfb94 = 'N' ",
               "  WHERE TRIM(sfb94) IS NULL "

   PREPARE q303_pre2 FROM l_sql
   EXECUTE q303_pre2
#lixh120121122 ----------End--------------
#lixh120121122 ----------Begin------------
   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT x.sfb01,substr(x.sfb01,0,instr(x.sfb01,'-')-1) slip ",
               "               FROM sfb_file x",
               "              ORDER BY x.sfb01) n ",
               "         ON (o.sfb01 = n.sfb01) ",
               " WHEN MATCHED ",
               "    UPDATE ",
               "       SET o.smydesc = (SELECT smydesc FROM smy_file WHERE smyslip = n.slip) "
   LET l_sql = " UPDATE csfq303_tmp o ",
               "    SET o.smydesc = (SELECT smydesc FROM smy_file",
               "  WHERE smyslip = (SELECT substr(sfb01,0,instr(sfb01,'-')-1) FROM sfb_file WHERE sfb01 = o.sfb01))"
   PREPARE q303_pre24 FROM l_sql
   EXECUTE q303_pre24

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT distinct gem01,gem02 ",
               "               FROM gem_file ",
               "              ORDER BY gem01) n ",
               "         ON (o.sfb82 = n.gem01)  ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.pmc03 = n.gem02 ",
               " WHERE TRIM(o.sfb82) IS NOT NULL "
   PREPARE q303_pre3 FROM l_sql
   EXECUTE q303_pre3

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT distinct pmc01,pmc03 ",
               "               FROM pmc_file ",
               "              ORDER BY pmc01) n ",
               "         ON (o.sfb82 = n.pmc01)  ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.pmc03 = n.pmc03 ",
               " WHERE TRIM(o.sfb82) IS NOT NULL "
   PREPARE q303_pre4 FROM l_sql
   EXECUTE q303_pre4
#lixh120121122 ----------End--------------
#lixh120121122 ----------Begin------------
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET sfb08 = 0 ",
               "  WHERE TRIM(sfb08) IS NULL "

   PREPARE q303_pre5 FROM l_sql
   EXECUTE q303_pre5

   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET sfb09 = 0 ",
               "  WHERE TRIM(sfb09) IS NULL "

   PREPARE q303_pre6 FROM l_sql
   EXECUTE q303_pre6
#lixh120121122 ----------End--------------

#lixh120121122 ----------Begin------------
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET trate = 0 ",
               "  WHERE sfb08 = 0 "

   PREPARE q303_pre7 FROM l_sql
   EXECUTE q303_pre7

   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET trate = sfb09/sfb08 * 100 ",
               "  WHERE sfb08 <> 0 "

   PREPARE q303_pre8 FROM l_sql
   EXECUTE q303_pre8

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01,SUM(qcf091) qcf091_sum ",
               "               FROM qcf_file,sfb_file ",
               "              WHERE qcf02 = sfb01 ",
               "              GROUP BY sfb01) n ",
               "         ON (o.sfb01 = n.sfb01) ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.qcf091 = NVL(n.qcf091_sum,0) - o.sfb09 ",
               " WHERE o.sfb94 = 'Y'"
   PREPARE q303_pre9 FROM l_sql
   EXECUTE q303_pre9

#lixh120121122 ----------End--------------
#lixh120121122 ----------Begin------------

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT qcm02,qcm012,qcm05,SUM(qcm091) qcm091_sum ",
               "               FROM qcm_file x,ecm_file,sfb_file ",
               "              WHERE x.qcm02 = ecm01 AND ecm012 = x.qcm012 AND ecm03 = x.qcm05 ",
               "                AND x.qcm02 = sfb01 ",
               "                AND qcm012 in (SELECT DISTINCT ecm012 FROM ecm_file b,sfb_file WHERE ecm01 = sfb01 ",
               "                                  AND (b.ecm015 IS NULL OR b.ecm015=' ') AND b.ecm012 <> ' ' ",
               "                                  AND b.ecm01 = x.qcm02) ",
               "                AND qcm05 in (SELECT MAX(ecm03) FROM ecm_file a,sfb_file ",
               "                               WHERE a.ecm01 = sfb01 ",
               "                                 AND a.ecm012 in (SELECT DISTINCT ecm012 FROM ecm_file c,sfb_file ",
               "                                                   WHERE c.ecm01 = sfb01 ",
               "                                                     AND c.ecm01 = a.ecm01",
               "                                                     AND (c.ecm015 IS NULL OR c.ecm015=' ')",
               "                                                     AND c.ecm012 <> ' ')",
               "                               GROUP BY a.ecm01)",
               "              GROUP BY x.qcm02,x.qcm012,x.qcm05) n ",
               "         ON (o.sfb01 = n.qcm02) ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.qcf091 = NVL(n.qcm091_sum,0) - o.sfb09 ",
               " WHERE o.sfb94 = 'N' AND o.sfb93 = 'Y' AND o.ecm53 = 'Y' "

   PREPARE q303_pre10 FROM l_sql
   EXECUTE q303_pre10

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT ecm01,ecm012,ecm03,ecm311 ",
               "               FROM ecm_file x,sfb_file ",
               "              WHERE x.ecm01 = sfb01 ",
               "                AND x.ecm012 IN (SELECT DISTINCT b.ecm012 FROM ecm_file b, sfb_file",
               "                                  WHERE b.ecm01 = sfb01 AND (b.ecm015 IS NULL OR b.ecm015 = ' ')",
               "                                    AND b.ecm012 <> ' ' AND b.ecm01 = x.ecm01)",
               "                AND x.ecm03 IN (SELECT MAX(a.ecm03) FROM ecm_file a,sfb_file ",
               "                                 WHERE a.ecm01 = sfb01 AND a.ecm01 = x.ecm01 ",
               "                                   AND ecm012 IN (SELECT DISTINCT c.ecm012 FROM ecm_file c, sfb_file",
               "                                                   WHERE c.ecm01 = sfb01 AND (c.ecm015 IS NULL OR c.ecm015 = ' ')",
               "                                                     AND c.ecm012 <> ' ' AND c.ecm01 = a.ecm01)",
               "                                 GROUP BY a.ecm01) ",
               "   ORDER BY x.ecm01,x.ecm012,x.ecm03) n ",
           #   "         ON (o.sfb01 = n.ecm01 AND o.ecm012 = n.ecm012 ) ",
               "         ON (o.sfb01 = n.ecm01 ) ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.qcf091 = NVL(n.ecm311,0) - o.sfb09 ",
               " WHERE o.sfb94 = 'N' AND o.sfb93 = 'Y' AND o.ecm53 = 'N' "

   PREPARE q303_pre34 FROM l_sql
   EXECUTE q303_pre34

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT ecm01,ecm012,ecm03,ecm311 ",
               "               FROM ecm_file x,sfb_file ",
               "              WHERE x.ecm01 = sfb01 ",
               "                AND x.ecm012 = ' ' ",
               "                AND x.ecm03 IN (SELECT MAX(a.ecm03) FROM ecm_file a,sfb_file ",
               "                                 WHERE a.ecm01 = sfb01 ",
               "                                   AND a.ecm012= ' '  AND a.ecm01 = x.ecm01",
               "                                 GROUP BY a.ecm01) ",
               "              ORDER BY x.ecm01,x.ecm012,x.ecm03 ) n ",
               "         ON (o.sfb01 = n.ecm01 AND o.ecm012 = n.ecm012) ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.qcf091 = NVL(n.ecm311,0) - o.sfb09 ",
               " WHERE o.sfb94 = 'N' AND o.sfb93 = 'Y' AND o.ecm53 = 'N' "

   PREPARE q303_pre11 FROM l_sql
   EXECUTE q303_pre11

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT qcm02,qcm012,qcm05,SUM(qcm091) qcm091_sum ",
               "               FROM qcm_file x,ecm_file,sfb_file ",
               "              WHERE x.qcm02 = ecm01 AND ecm012 = x.qcm012 AND ecm03 = x.qcm05 ",
               "                AND x.qcm02 = sfb01 ",
               "                AND x.qcm012 = ' '",
               "                AND x.qcm05 in (SELECT MAX(ecm03) FROM ecm_file a,sfb_file ",
               "                                 WHERE a.ecm01 = sfb01 ",
               "                                   AND a.ecm01 = x.qcm02",
               "                                   AND a.ecm012 = ' ' ",
               "                                 GROUP BY a.ecm01)",
               "              GROUP BY x.qcm02,x.qcm012,x.qcm05) n ",
               "         ON (o.sfb01 = n.qcm02) ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.qcf091 = NVL(n.qcm091_sum,0) - o.sfb09 ",
               " WHERE o.sfb94 = 'N' AND o.sfb93 = 'Y' AND o.ecm53 = 'Y' "

   PREPARE q303_pre35 FROM l_sql
   EXECUTE q303_pre35
#lixh120121122 ----------End--------------

#lixh120121122 ----------Begin------------
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET qcf091 = 0 ",
               #"  WHERE qcf091 < 0 "
               "  WHERE qcf091 < 0  AND sfb93='N' "   #jolly170801

   PREPARE q303_pre33 FROM l_sql
   EXECUTE q303_pre33
#lixh120121122 ----------End--------------
#lixh120121122 ----------Begin------------
   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01,MIN(sfp03) sfp03_min,MAX(sfp03) sfp03_max FROM sfp_file,sfe_file,sfb_file ",
               "      WHERE sfp01 = sfe02 AND sfe01 = sfb01 ",
               "        AND sfe06 IN ('1','2','3','7','8','A') GROUP BY sfb01) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.sfp03 = n.sfp03_min, ",
               "           o.sfp03_1 = n.sfp03_max "
   PREPARE q303_pre12 FROM l_sql
   EXECUTE q303_pre12
#lixh120121122 ----------End--------------
#lixh120121122 ----------Begin------------
   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01,MIN(shb02) shb02_min,MAX(shb02) shb02_max FROM shb_file,sfb_file ",
               "      WHERE shb05 = sfb01 AND shbconf = 'Y' GROUP BY sfb01) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.shb02 = n.shb02_min, ",
               "           o.shb02_1 = n.shb02_max "
   PREPARE q303_pre13 FROM l_sql
   EXECUTE q303_pre13

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01,MIN(srf02) srf02_min,MAX(srf02) srf02_max FROM srf_file,srg_file,sfb_file ",
               "      WHERE srg16 = sfb01  AND srf01 = srg01 AND srfconf = 'Y' GROUP BY sfb01) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.shb02 = n.srf02_min, ",
               "           o.shb02_1 = n.srf02_max "
   PREPARE q303_pre36 FROM l_sql
   EXECUTE q303_pre36
#lixh120121122 ----------End--------------
#{     IF sr.sfb02 MATCHES '[78]' THEN  #委外工單入庫
#        SELECT MIN(rvu03),MAX(rvu03) INTO sr.sfu02,sr.sfu02_1 FROM rvu_file,rvv_file     #委外工單最早入庫日&最晚入庫日
#         WHERE rvu01 = rvv01  AND rvv18 = sr.sfb01
#     END IF }
#lixh120121122 ----------Begin------------
   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01,MIN(rvu03) sfu02_min,MAX(rvu03) sfu02_max FROM rvu_file,rvv_file,sfb_file ",
               "      WHERE rvu01 = rvv01 AND rvv18 = sfb01 GROUP BY sfb01) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.sfu02 = n.sfu02_min, ",
               "           o.sfu02_1 = n.sfu02_max " ,
            #  "     WHERE o.sfb02 MATCHES '[78]'"
               "     WHERE o.sfb02 = '7' OR o.sfb02 = '8' "
   PREPARE q303_pre14 FROM l_sql
   EXECUTE q303_pre14
#lixh120121122 ----------End--------------
#{     IF sr.sfb02 = '11' THEN    #拆件式工單完工入庫
#        SELECT MIN(ksc02),MAX(ksc02) INTO sr.sfu02,sr.sfu02_1 FROM ksc_file,ksd_file
#         WHERE ksc01 = ksd01 AND kscpost = 'Y' AND ksd11 = sr.sfb01
#     END IF  }
#lixh120121122 ----------Begin------------
   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01,MIN(ksc02) sfu02_min,MAX(ksc02) sfu02_max FROM ksc_file,ksd_file,sfb_file ",
               "      WHERE ksc01 = ksd01 AND ksd11 = sfb01 AND kscpost = 'Y' GROUP BY sfb01) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.sfu02 = n.sfu02_min, ",
               "           o.sfu02_1 = n.sfu02_max " ,
               "     WHERE o.sfb02 = '11'"
   PREPARE q303_pre15 FROM l_sql
   EXECUTE q303_pre15
#lixh120121122 ----------End--------------
#{     IF sr.sfb02 MATCHES '[15]' OR sr.sfb02 = '13' OR sr.sfb02 = '15' THEN
#        SELECT MIN(sfu02),MAX(sfu02) INTO sr.sfu02,sr.sfu02_1 FROM sfu_file,sfv_file     #最早入庫日&最晚入庫日
#         WHERE sfu01 = sfv01 AND sfupost = 'Y' AND sfv11 = sr.sfb01
#     END IF  }
#lixh120121122 ----------Begin------------
   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT c.sfb01,MIN(sfu02) sfu02_min,MAX(sfu02) sfu02_max FROM sfu_file a,sfv_file b,sfb_file c ",
               "      WHERE a.sfu01 = b.sfv01 AND b.sfv11 = c.sfb01 AND a.sfupost = 'Y' GROUP BY c.sfb01) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.sfu02 = n.sfu02_min, ",
               "           o.sfu02_1 = n.sfu02_max " ,
             # "     WHERE o.sfb02 MATCHES '[15]' OR o.sfb02 = '13' OR o.sfb02 = '15'"
               "     WHERE o.sfb02 = '1' OR o.sfb02 = '5' OR o.sfb02 = '13' OR o.sfb02 = '15'"
   PREPARE q303_pre16 FROM l_sql
   EXECUTE q303_pre16
#lixh120121122 ----------End--------------
      #狀況
#{     IF sr.sfb09 > = sr.sfb08 OR sr.sfb04 = '8' THEN
#        LET sr.state = '2'             #已完成
#     END IF    }
#lixh120121122 ----------Begin------------
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET state = '2' ",
               "  WHERE sfb09 > = sfb08 OR sfb04 = '8'"
   PREPARE q303_pre17 FROM l_sql
   EXECUTE q303_pre17
#lixh120121122 ----------End--------------

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01 FROM sfp_file ,sfs_file ,sfb_file   WHERE   sfp01 =   sfs01 AND   sfs03 =   sfb01 ",
               "      UNION  SELECT   sfb01 FROM sfb_file  ,sfe_file   WHERE   sfe01 =   sfb01",
               "      UNION  SELECT   sfb01 FROM sfb_file  ,shb_file   WHERE   shb05 =   shb01 ",
               "      UNION  SELECT   sfb01 FROM srf_file  ,srg_file  ,sfb_file   WHERE   srf01 =   srg01 ",
               "        AND   srg16 =   sfb01 ",
               "      UNION  SELECT   sfb01 FROM rvu_file  ,rvv_file  ,sfb_file   WHERE   rvu01 =   rvv01 ",
   #           "        AND   rvv18 =   sfb01 AND   sfb02 MATCHES '[78]'",
               "        AND   rvv18 =   sfb01 AND   (sfb02 = '7' OR sfb02 = '8')",
               "      UNION  SELECT   sfb01 FROM sfu_file  ,sfv_file  ,sfb_file   WHERE   sfu01 =   sfv01 ",
   #           "        AND   sfv11 =   sfb01 AND   sfb02 NOT MATCHES '[78]') n ",
               "        AND   sfv11 =   sfb01 AND   sfb02 <> '7' AND sfb02 <> '8') n ",
               "         ON (o.sfb01 = n.sfb01) ",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "       SET o.state = '1' ",
               "     WHERE o.sfb04 <> '8'",
               "       AND o.sfb09 < o.sfb08"
   PREPARE q303_pre18 FROM l_sql
   EXECUTE q303_pre18
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET state = '0' ",
               "  WHERE sfb04 <> '8'",
               "    AND sfb09 < sfb08",
               "    AND TRIM(state) IS NULL "
   PREPARE q303_pre21 FROM l_sql
   EXECUTE q303_pre21
#lixh120121122 ----------End--------------
      #進度狀態
#      IF sr.sfb15 <=  g_today AND sr.state <> '2' THEN
#        LET sr.speed = '1'       #延期
#     ELSE
#        LET sr.speed = '0'       #正常
#     END IF

#lixh120121122 ----------Begin------------
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET speed = '1' ",
               "  WHERE state <> '2' AND sfb15 < '",g_today,"'", " OR TRIM(sfb15) IS NULL"
   PREPARE q303_pre19 FROM l_sql
   EXECUTE q303_pre19

   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET speed = '0' ",
               "  WHERE state <> '2' AND sfb15 > = '",g_today,"'"
   PREPARE q303_pre20 FROM l_sql
   EXECUTE q303_pre20
#lixh120121122 ----------End--------------

#      IF sr.state = '2' THEN      #已經完成
#        IF sr.sfb15 > = sr.sfu02_1 THEN
#           LET sr.speed = '0'    #正常
#        ELSE
#           LET sr.speed = '1'    #延期
#        END IF
#     END IF

#lixh120121122 ----------Begin------------
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET speed = '0' ",
               "  WHERE state = '2' AND sfb15 >= sfu02_1"
   PREPARE q303_pre22 FROM l_sql
   EXECUTE q303_pre22

   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET speed = '1' ",
   #           "  WHERE state = '2' AND sfb15 < sfu02_1"
               "  WHERE state = '2' AND TRIM(speed) IS NULL"
   PREPARE q303_pre23 FROM l_sql
   EXECUTE q303_pre23
#lixh120121122 ----------End--------------

#      IF tm.p <> '2' THEN
#        IF sr.speed <> tm.p THEN
#           INITIALIZE sr.* TO NULL
#           CONTINUE FOREACH
#        END IF
#     END IF
#     IF tm.c <> '3' THEN
#        IF sr.state <> tm.c THEN
#           INITIALIZE sr.* TO NULL
#           CONTINUE FOREACH
#        END IF
#     END IF
#     IF cl_null(sr.pro) THEN LET sr.pro = 0 END IF
#     IF cl_null(sr.compro) THEN LET sr.compro = 0 END IF }
#lixh120121122 ----------Begin------------
   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET pro = 0 ",
               "  WHERE TRIM(pro) IS NULL"
   PREPARE q303_pre25 FROM l_sql
   EXECUTE q303_pre25

   LET l_sql = " UPDATE csfq303_tmp ",
               "    SET compro = 0 ",
               "  WHERE TRIM(compro) IS NULL"
   PREPARE q303_pre26 FROM l_sql
   EXECUTE q303_pre26
#lixh120121122 ----------End--------------
     #供應廠商
#     IF sr.sfb02 MATCHES'[78]' THEN   #委外工單才去撈取委外供應廠商
#        SELECT COUNT(DISTINCT pmm09) INTO l_tot FROM sfb_file,pmm_file,pmn_file
#         WHERE sfb01 = pmn41 AND pmm01 = pmn01
#           AND sfb01 = sr.sfb01
#        IF cl_null(l_tot) THEN LET l_tot = 0 END IF
#        IF l_tot > 1 THEN
#           LET sr.pmm09 = 'MISC'
#           DECLARE q303_cur_pmm09 CURSOR FOR
#              SELECT DISTINCT pmm09 FROM sfb_file,pmm_file,pmn_file
#               WHERE sfb01 = pmn41 AND pmm01 = pmn01
#                 AND sfb01 = sr.sfb01
#           LET l_str = ''
#           FOREACH q303_cur_pmm09 INTO l_pmm09
#              SELECT pmc03 INTO l_pmc03 FROM pmc_file,pmm_file
#               WHERE pmm09 = pmc01 AND pmm09 = l_pmm09
#              IF cl_null(l_str) THEN
#                 LET l_str = l_pmc03
#              ELSE
#                 LET l_str = l_str,"/",l_pmc03
#              END IF
#           END FOREACH

#           LET sr.pmc03_1 = l_str
#        ELSE
#           SELECT pmm09,pmc03 INTO sr.pmm09,sr.pmc03_1 FROM sfb_file,pmn_file,pmm_file,OUTET pmc_file
#            WHERE sfb01 = pmn41 AND pmm01 = pmn01 AND pmc01 = pmm09 AND sfb01 = sr.sfb01
#        END IF
#     END IF }
#lixh120121122 ----------Begin------------
   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01,COUNT(DISTINCT pmm09) cnt FROM sfb_file,pmm_file,pmn_file ",
               "              WHERE sfb01 = pmn41 AND pmm01 = pmn01 AND (sfb02 = '7' OR sfb02 = '8')",
               "           GROUP BY sfb01) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "    SET o.pmm09 = 'MISC' ",
           #   "  WHERE o.sfb02 = '7' OR o.sfb02 = '8' AND n.cnt > 1 "
           #   "  WHERE o.sfb02 = '7' OR o.sfb02 = '8' "
               "  WHERE n.cnt > 1 "
   PREPARE q303_pre27 FROM l_sql
   EXECUTE q303_pre27

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT DISTINCT sfb01,pmm09,pmc03 FROM sfb_file,pmn_file,",
               "             pmm_file LEFT OUTER JOIN pmc_file ON pmc01 = pmm09 ",
               "              WHERE sfb01 = pmn41 AND pmm01 = pmn01 AND (sfb02 = '7' OR sfb02 = '8')) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "    SET o.pmm09 = n.pmm09,",
               "        o.pmc03_1 = n.pmc03",
               " WHERE o.pmm09 IS NULL "

   PREPARE q303_pre28 FROM l_sql
   EXECUTE q303_pre28
#  LET l_sql = " MERGE INTO csfq303_tmp o ",
#        #     "      USING (SELECT sfb01,pmm09,pmc03 FROM sfb_file,pmn_file,pmm_file LEFT OUTER JOIN pmc_file ON (pmc01 = pmm09)",
#              "      USING (SELECT sfb01,pmm09 FROM pmn_file,pmm_file,sfb_file ",
#              "              WHERE sfb01 = pmn41 AND pmm01 = pmn01",
#              "                AND (sfb02 = '7' OR sfb02 = '8')) n",
#              "         ON (o.sfb01 = n.sfb01)",
#              " WHEN MATCHED ",
#              " THEN ",
#              "    UPDATE ",
#              "    SET o.pmm09 = n.pmm09 ",
#  #           "    SET o.pmm09 = n.pmm09, ",
#  #           "        o.pmc03_1 = n.pmc03"
#              "  WHERE TRIM(o.pmm09) IS NULL "
#  PREPARE q303_pre28 FROM l_sql
#  EXECUTE q303_pre28 }

   LET l_sql = " MERGE INTO csfq303_tmp o ",
               "      USING (SELECT sfb01,wmsys.wm_con","cat(pmc03) str_pmc03 from sfb_file,pmm_file,pmn_file,pmc_file",
               "              WHERE sfb01 = pmn41 AND pmm01 = pmn01 and pmm09 = pmc01",
               "           GROUP BY sfb01) n ",
               "         ON (o.sfb01 = n.sfb01)",
               " WHEN MATCHED ",
               " THEN ",
               "    UPDATE ",
               "    SET o.pmc03_1 = REPLACE(n.str_pmc03,',','/') ",
               " WHERE o.pmm09 = 'MISC' "
   PREPARE q303_pre31 FROM l_sql
   EXECUTE q303_pre31

   IF tm.p <> '2' THEN
      LET l_sql = " DELETE FROM csfq303_tmp o ",
                  "  WHERE o.speed != '",tm.p,"' "
      PREPARE q303_pre29 FROM l_sql
      EXECUTE q303_pre29
   END IF
   IF tm.c <> '3' THEN
      LET l_sql = " DELETE FROM csfq303_tmp o ",
                  "  WHERE o.state != '",tm.c,"' "
      PREPARE q303_pre30 FROM l_sql
      EXECUTE q303_pre30
   END IF
#lixh120121122 ----------End--------------
#     EXECUTE insert_prep USING sr.*
#     INITIALIZE sr.* TO NULL   #初始化
#  END FOREACH
   DISPLAY TIME   #lixh1
END FUNCTION

FUNCTION q303_b_fill_1()
   DEFINE   l_sql     STRING
   DEFINE   l_slip    LIKE smy_file.smyslip
   DEFINE   l_ima153  LIKE ima_file.ima153
   DEFINE   l_cnt     LIKE type_file.num10
   DEFINE   l_sfb04   LIKE sfb_file.sfb04
   DEFINE   l_sfb01_t LIKE sfb_file.sfb01
   DEFINE   l_ecm012  LIKE ecm_file.ecm012
   DEFINE   l_ecm012_t LIKE ecm_file.ecm012
   DEFINE   l_ecm45    LIKE ecm_file.ecm45
   DEFINE   l_sum     LIKE type_file.num5
   DEFINE   l_count   LIKE type_file.num10

   DEFINE   l_max     LIKE type_file.num10
   DEFINE   li_i      LIKE type_file.num5
   DEFINE   li_j      LIKE type_file.num5
   DEFINE   ls_show   STRING
   DEFINE   ls_hide   STRING
   DEFINE   lc_index  STRING
   DEFINE   l_sfb08   LIKE sfb_file.sfb08
   DEFINE   l_sfb94   LIKE sfb_file.sfb94
   DEFINE   l_sfb93   LIKE sfb_file.sfb93
   DEFINE   l_ecm_cnt,i LIKE type_file.num5

   CALL g_sfb_1.clear()
   CALL g_sfb_1_excel.clear()
   LET g_cnt = 1
   LET g_rec_b_1 = 0
   MESSAGE "Searching!"
   #LET l_sql = "SELECT sfb01,sfb81,sfb05,imaud02,ima02,sfb04,sfb96,sfb08,sfb081,sfb09,qcf091,'',sfb12,0 ecm45_011,0 ecm45_021,0 ecm45_031,0 ecm45_041,",
   LET l_sql = "SELECT sfb01,sfb81,sfb02,sfb05,imaud02,ima02,sfb04,sfb36,sfb96,sfb08,sfb081,sfb09,'','','',qcf091,'',0 ecm45_011,0 ecm45_021,0 ecm45_031,0 ecm45_041,",      #add '' by lili 170629
               "       0 ecm45_051,0 ecm45_061,0 ecm45_071,0 ecm45_081,0 ecm45_091,0 ecm45_101,",
               "       0 ecm45_111,0 ecm45_121,0 ecm45_131,0 ecm45_141,0 ecm45_151,0 ecm45_161,0 ecm45_171,0 ecm45_181,0 ecm45_191, ",
               "       0 ecm45_201,0 ecm45_211,0 ecm45_221,0 ecm45_231,0 ecm45_241,0 ecm45_251,0 ecm45_261,0 ecm45_271,0 ecm45_281,",
               "       0 ecm45_291,0 ecm45_301,0 tot_ecm314,0 shd07,0 diff,ecm03,ecm53,ecm54,ecm62,ecm63,ecm291,ecm301,",
               "       ecm302,ecm303,ecm311,ecm312,",
               "       ecm313,ecm314,ecm315,ecm316,sfb94,sfb93,ecm012 ",
               "  FROM csfq303_tmp ",
   #LET l_sql = "SELECT * FROM csfq303_tmp",
               " ORDER BY sfb01,ecm03 "

   PREPARE q303_pre_1 FROM l_sql
   DECLARE q303_cur_1 CURSOR FOR q303_pre_1
   LET g_cnt = 1
   LET l_sfb01_t = NULL
   LET l_ecm012_t = NULL
   LET l_max = 0
   LET g_sum_sfb08 = 0
   LET g_sum_sfb09 = 0
   LET g_sum_sfv09 = 0
   LET g_sum_sfv091 = 0
   LET g_sum_wip = 0
   LET g_sum_ecm314 = 0
   LET g_sum_shd07 = 0
   LET g_sum_diff = 0
   LET g_sum_01 = 0
   LET g_sum_02 = 0
   LET g_sum_03 = 0
   LET g_sum_04 = 0
   LET g_sum_05 = 0
   LET g_sum_06 = 0
   LET g_sum_07 = 0
   DISPLAY TIME   #lixh1
   FOREACH q303_cur_1 INTO g_sfb_1_excel[g_cnt].*,g_ecm.*,l_sfb94,l_sfb93,l_ecm012
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      #当站下线量（汇总）
      SELECT NVL(SUM(ecm314),0) INTO g_sfb_1_excel[g_cnt].ecm314 FROM ecm_file
       WHERE ecm01 = g_sfb_1_excel[g_cnt].sfb01
         AND ecm012 = l_ecm012
      #工单在制量（工单已发料套数-完工入库数量-报废数量-当站下线数量）
      #LET g_sfb_1_excel[g_cnt].tot_wip = g_sfb_1_excel[g_cnt].sfb081 - g_sfb_1_excel[g_cnt].sfb09 - g_sfb_1_excel[g_cnt].sfb12 - g_sfb_1_excel[g_cnt].ecm314
      LET g_sfb_1_excel[g_cnt].tot_wip = g_sfb_1_excel[g_cnt].sfb081 - g_sfb_1_excel[g_cnt].sfb09
      #不良品入库
      SELECT NVL(SUM(sfv09),0) INTO g_sfb_1_excel[g_cnt].sfv09 FROM sfv_file,sfu_file
       WHERE sfv11 = g_sfb_1_excel[g_cnt].sfb01
         AND sfv01 = sfu01
         AND sfu00 = '1'
         AND sfuconf = 'Y'
         AND sfupost = 'Y'
         AND sfv01 like (select smyslip from smy_file where smyud04 = 'Y')||'%'

      #良品入库
      SELECT NVL(SUM(sfv09),0) INTO g_sfb_1_excel[g_cnt].sfv091 FROM sfv_file,sfu_file
       WHERE sfv11 = g_sfb_1_excel[g_cnt].sfb01
         AND sfv01 = sfu01
         AND sfu00 = '1'
         AND sfuconf = 'Y'
         AND sfupost = 'Y'
         AND sfv01 NOT LIKE (SELECT smyslip FROM smy_file WHERE smyud04 = 'Y')||'%'

      IF g_sfb_1_excel[g_cnt].sfb04 = '8' THEN
         LET g_sfb_1_excel[g_cnt].tot_wip = 0
      END IF

      #add by lili 170722 ---s---良率
      LET g_sfb_1_excel[g_cnt].trate = 100*(g_sfb_1_excel[g_cnt].sfv091/(g_sfb_1_excel[g_cnt].sfv091+g_sfb_1_excel[g_cnt].sfv09))
      #add by lili 170722 ---e---

      #当站入库量
      SELECT NVL(SUM(shd07),0) INTO g_sfb_1_excel[g_cnt].shd07 FROM shd_file,shb_file
       WHERE shd01 = shb01
         AND shb05 = g_sfb_1_excel[g_cnt].sfb01
         AND shbconf = 'Y'
         #AND shbud03 = 'Y'
       GROUP BY shb05
      #差异数量=当站下线-当站入库数量
      IF l_sfb93 = 'Y' THEN
         LET g_sfb_1_excel[g_cnt].diff = g_sfb_1_excel[g_cnt].ecm314 - g_sfb_1_excel[g_cnt].sfv09
      END IF
      IF cl_null(g_sfb_1_excel[g_cnt].diff) THEN LET g_sfb_1_excel[g_cnt].diff = 0 END IF

      #CALL s_minp(g_sfb_1_excel[g_cnt].sfb01,g_sma.sma73,0,'','','','')              #MOD-DB0116 l_ima153->0
      #     RETURNING l_cnt,g_sfb_1_excel[g_cnt].qi

      #IF cl_null(g_sfb_1_excel[g_cnt].qi) THEN LET g_sfb_1_excel[g_cnt].qi = 0 END IF

      IF l_sfb94 = 'N' AND l_sfb93 = 'N' THEN
         #LET g_sfb_1_excel[g_cnt].qcf091 = g_sfb_1_excel[g_cnt].qi - g_sfb_1_excel[g_cnt].sfb09
         LET g_sfb_1_excel[g_cnt].qcf091 = g_sfb_1_excel[g_cnt].sfb081 - g_sfb_1_excel[g_cnt].sfb09
      END IF
      #add by lili 170717 ---s---
      IF l_sfb93 = 'Y' AND g_sfb_1_excel[g_cnt].qcf091 <> 0 THEN    #待完工入库=完工数量-不良品入库量
         LET g_sfb_1_excel[g_cnt].qcf091 = g_sfb_1_excel[g_cnt].qcf091 + g_sfb_1_excel[g_cnt].sfv09
      END IF
      UPDATE csfq303_tmp SET sfv091 = g_sfb_1_excel[g_cnt].sfv091,
                             sfv09 = g_sfb_1_excel[g_cnt].sfv09,
                             tot_wip = g_sfb_1_excel[g_cnt].tot_wip
                       WHERE sfb01 = g_sfb_1_excel[g_cnt].sfb01
      #add by lili 170717 ---e---
      IF g_sma.sma54 = 'Y' AND l_sfb93 = 'Y' THEN    #走製程&背景色

         IF g_sma.sma541 = 'Y' THEN
            IF cl_null(l_sfb01_t) OR g_sfb_1_excel[g_cnt].sfb01 <> l_sfb01_t THEN
               LET g_sum_sfb08 = g_sum_sfb08 + g_sfb_1_excel[g_cnt].sfb08
               LET g_sum_sfb09 = g_sum_sfb09 + g_sfb_1_excel[g_cnt].sfb09
               LET g_sum_sfv09 = g_sum_sfv09 + g_sfb_1_excel[g_cnt].sfv09
               LET g_sum_sfv091 = g_sum_sfv091 + g_sfb_1_excel[g_cnt].sfv091
               LET g_sum_wip = g_sum_wip + g_sfb_1_excel[g_cnt].tot_wip
               LET g_sum_ecm314 = g_sum_ecm314 + g_sfb_1_excel[g_cnt].ecm314
               LET g_sum_shd07 = g_sum_shd07 + g_sfb_1_excel[g_cnt].shd07
               LET g_sum_diff = g_sum_diff + g_sfb_1_excel[g_cnt].diff

               LET l_sfb01_t = g_sfb_1_excel[g_cnt].sfb01
               LET l_ecm012_t = l_ecm012
               LET l_count = 0
               SELECT COUNT(*) INTO l_count FROM ecm_file
                WHERE ecm01 = g_sfb_1_excel[g_cnt].sfb01
                  AND ecm012 = l_ecm012
               IF cl_null(l_count) THEN LET l_count = 0 END IF
               IF l_max < l_count THEN LET l_max = l_count END IF    #取工藝序的最大值
               LET l_sum = 1

               SELECT sfb04 INTO l_sfb04 FROM sfb_file
                WHERE sfb01 = g_sfb_1_excel[g_cnt].sfb01

               CALL q303_get_wip(g_cnt,'') RETURNING g_wipqty,g_ecm_sum
               IF g_cnt < = g_max_rec THEN
                  LET g_sfb_1[g_cnt].* = g_sfb_1_excel[g_cnt].*
               END IF
               LET g_cnt = g_cnt + 1
            END IF
            IF g_sfb_1_excel[g_cnt].sfb01 = l_sfb01_t AND l_ecm012 = l_ecm012_t THEN  #同工單同製程段下不同作業編號
               LET l_sum = l_sum + 1
               CALL q303_get_ecm04(l_sum)
               IF g_cnt < = g_max_rec THEN
                  LET g_sfb_1[g_cnt-1].* = g_sfb_1_excel[g_cnt-1].*
               END IF
            END IF
            IF g_sfb_1_excel[g_cnt].sfb01 = l_sfb01_t AND l_ecm012 <> l_ecm012_t THEN
               LET l_sum = 1
               LET l_ecm012_t = l_ecm012
               LET l_sfb08 = g_sfb_1_excel[g_cnt].sfb08
               LET g_sfb_1_excel[g_cnt].sfb08 = l_sfb08   #lixh121205 add
               LET l_count = 0
               SELECT COUNT(*) INTO l_count FROM ecm_file
                WHERE ecm01 = g_sfb_1_excel[g_cnt].sfb01
                  AND ecm012 = l_ecm012

               IF cl_null(l_count) THEN LET l_count = 0 END IF
               IF l_max < l_count THEN LET l_max = l_count END IF    #取工藝序的最大值

               CALL q303_get_wip(g_cnt,'') RETURNING g_wipqty,g_ecm_sum
               LET g_sfb_1_excel[g_cnt].sfb08 = NULL    #lixh121205 add

               IF g_cnt < = g_max_rec THEN
                  LET g_sfb_1[g_cnt].* = g_sfb_1_excel[g_cnt].*
               END IF
               LET g_cnt = g_cnt + 1
            END IF
         ELSE
            #不走平行工藝
            SELECT sfb04 INTO l_sfb04 FROM sfb_file
             WHERE sfb01 = g_sfb_1_excel[g_cnt].sfb01

            IF (cl_null(l_sfb01_t)) OR g_sfb_1_excel[g_cnt].sfb01 <> l_sfb01_t THEN
               LET g_sum_sfb08 = g_sum_sfb08 + g_sfb_1_excel[g_cnt].sfb08
               LET g_sum_sfb09 = g_sum_sfb09 + g_sfb_1_excel[g_cnt].sfb09
               LET g_sum_sfv09 = g_sum_sfv09 + g_sfb_1_excel[g_cnt].sfv09
               LET g_sum_sfv091 = g_sum_sfv091 + g_sfb_1_excel[g_cnt].sfv091
               LET g_sum_wip = g_sum_wip + g_sfb_1_excel[g_cnt].tot_wip
               LET g_sum_ecm314 = g_sum_ecm314 + g_sfb_1_excel[g_cnt].ecm314
               LET g_sum_shd07 = g_sum_shd07 + g_sfb_1_excel[g_cnt].shd07
               LET g_sum_diff = g_sum_diff + g_sfb_1_excel[g_cnt].diff
               LET l_sfb01_t = g_sfb_1_excel[g_cnt].sfb01
               LET l_count = 0
               SELECT COUNT(*) INTO l_count FROM ecm_file
                WHERE ecm01 = g_sfb_1_excel[g_cnt].sfb01
               IF cl_null(l_count) THEN LET l_count = 0 END IF
               IF l_max < l_count THEN LET l_max = l_count END IF    #取工藝序的最大值
               LET l_sum = 1
               CALL q303_get_wip(g_cnt,'ecm301_011') RETURNING g_wipqty,g_ecm_sum
               LET g_sfb_1_excel[g_cnt].ecm301_011 = g_wipqty
               IF g_cnt < = g_max_rec THEN
                  LET g_sfb_1[g_cnt].* = g_sfb_1_excel[g_cnt].*
               END IF
               LET g_cnt = g_cnt + 1
            END IF
            IF g_sfb_1_excel[g_cnt].sfb01 = l_sfb01_t THEN
               LET l_sum = l_sum + 1
               CALL q303_get_ecm04(l_sum)
               IF g_cnt < = g_max_rec THEN
                  LET g_sfb_1[g_cnt-1].* = g_sfb_1_excel[g_cnt-1].*
               END IF
            END IF
         END IF
      ELSE   #不走製程
         LET g_sum_sfb08 = g_sum_sfb08 + g_sfb_1_excel[g_cnt].sfb08
         LET g_sum_sfb09 = g_sum_sfb09 + g_sfb_1_excel[g_cnt].sfb09
         LET g_sum_sfv09 = g_sum_sfv09 + g_sfb_1_excel[g_cnt].sfv09
         LET g_sum_sfv091 = g_sum_sfv091 + g_sfb_1_excel[g_cnt].sfv091
         LET g_sum_wip = g_sum_wip + g_sfb_1_excel[g_cnt].tot_wip
         LET g_sum_ecm314 = g_sum_ecm314 + g_sfb_1_excel[g_cnt].ecm314
         LET g_sum_shd07 = g_sum_shd07 + g_sfb_1_excel[g_cnt].shd07
         LET g_sum_diff = g_sum_diff + g_sfb_1_excel[g_cnt].diff
         SELECT sfb04 INTO l_sfb04 FROM sfb_file
          WHERE sfb01 = g_sfb_1_excel[g_cnt].sfb01

         IF g_cnt < = g_max_rec THEN
            LET g_sfb_1[g_cnt].* = g_sfb_1_excel[g_cnt].*
         END IF
         LET g_cnt = g_cnt + 1
      END IF
   END FOREACH
   DISPLAY TIME   #lixh1

   LET l_ecm_cnt = 0
   LET l_ecm_cnt = g_sfb_1.getLength()
   FOR i = 1 TO l_ecm_cnt
      IF cl_null(g_sfb_1_excel[i].ecm301_011) THEN LET g_sfb_1_excel[i].ecm301_011 = 0 END IF
      IF cl_null(g_sfb_1_excel[i].ecm301_021) THEN LET g_sfb_1_excel[i].ecm301_021 = 0 END IF
      IF cl_null(g_sfb_1_excel[i].ecm301_031) THEN LET g_sfb_1_excel[i].ecm301_031 = 0 END IF
      IF cl_null(g_sfb_1_excel[i].ecm301_041) THEN LET g_sfb_1_excel[i].ecm301_041 = 0 END IF
      IF cl_null(g_sfb_1_excel[i].ecm301_051) THEN LET g_sfb_1_excel[i].ecm301_051 = 0 END IF
      IF cl_null(g_sfb_1_excel[i].ecm301_061) THEN LET g_sfb_1_excel[i].ecm301_061 = 0 END IF
      IF cl_null(g_sfb_1_excel[i].ecm301_071) THEN LET g_sfb_1_excel[i].ecm301_071 = 0 END IF
      LET g_sum_01 = g_sum_01 + g_sfb_1_excel[i].ecm301_011
      LET g_sum_02 = g_sum_02 + g_sfb_1_excel[i].ecm301_021
      LET g_sum_03 = g_sum_03 + g_sfb_1_excel[i].ecm301_031
      LET g_sum_04 = g_sum_04 + g_sfb_1_excel[i].ecm301_041
      LET g_sum_05 = g_sum_05 + g_sfb_1_excel[i].ecm301_051
      LET g_sum_06 = g_sum_06 + g_sfb_1_excel[i].ecm301_061
      LET g_sum_07 = g_sum_07 + g_sfb_1_excel[i].ecm301_071
   END FOR

   LET ls_hide = ' '
   LET ls_show = ' '
   FOR li_i = 1 TO l_max     #欄位的顯示
      LET lc_index = li_i USING '&&','1'
      IF li_i = 1 THEN
         LET  ls_show = ls_show || "ecm301_" || lc_index
      ELSE
         LET  ls_show = ls_show || ",ecm301_" || lc_index
      END IF
      CALL cl_chg_comp_att("ecm04_" || lc_index,"NOT NULL|REQUIRED|SCROLL","1|1|1")
   END FOR

   FOR li_j = li_i TO 30     #欄位的隱藏
      LET lc_index = li_j USING '&&','1'
      IF li_j = li_i THEN
         LET ls_hide = ls_hide || "ecm301_" || lc_index
      ELSE
         LET ls_hide = ls_hide || ",ecm301_" || lc_index
      END IF
   END FOR
   CALL cl_set_comp_visible(ls_hide,FALSE)
   CALL cl_set_comp_visible(ls_show,TRUE)

   IF g_cnt <= g_max_rec THEN
      CALL g_sfb_1.deleteElement(g_cnt)
   END IF
   CALL g_sfb_1_excel.deleteElement(g_cnt)
   LET g_rec_b_1 = g_cnt - 1
   IF g_rec_b_1 > g_max_rec AND (g_bgjob = 'N' OR cl_null(g_bgjob)) THEN
      CALL cl_err_msg(NULL,"axc-131",g_rec_b_1||"|"||g_max_rec,10)
      LET g_rec_b_1  = g_max_rec   #筆數顯示畫面檔的筆數
   END IF
   DISPLAY g_rec_b_1 TO FORMONLY.cnt1
END FUNCTION

FUNCTION q303_b_fill_2()
   DEFINE l_smydesc LIKE smy_file.smydesc
   DEFINE l_sfb01   LIKE sfb_file.sfb01
   DEFINE i         LIKE type_file.num10
   INITIALIZE g_sfb.* TO NULL
   CALL g_arr1.clear()
   CALL g_arr2.clear()
   CALL g_arr3.clear()
   CALL g_arr4.clear()
   CALL g_arr5.clear()
   CALL g_arr6.clear()
   CALL g_arr7.clear()
   CALL g_arr8.clear()
   CALL g_arr9.clear()
   CALL g_arr10.clear()
   CALL g_arr11.clear()
   CALL g_arr13.clear()
   IF l_ac_t <= 0  THEN LET l_ac_t = 1 END IF    #lixh121205 add
   IF NOT cl_null(g_sfb_1[l_ac_t].sfb01) THEN
      LET l_sfb01 = g_sfb_1[l_ac_t].sfb01
   ELSE
      FOR i = l_ac_t TO 1 step -1
         IF NOT cl_null(g_sfb_1[i].sfb01) THEN
            LET l_sfb01 = g_sfb_1[i].sfb01
            EXIT FOR
         END IF
      END FOR
   END IF
   SELECT * INTO g_sfb.* FROM sfb_file WHERE sfb01 = l_sfb01
   CASE g_sfb.sfb87
        WHEN 'Y'   LET g_confirm = 'Y'
                   LET g_void = ''
        WHEN 'N'   LET g_confirm = 'N'
                   LET g_void = ''
        WHEN 'X'   LET g_confirm = ''
                   LET g_void = 'Y'
     OTHERWISE     LET g_confirm = ''
                   LET g_void = ''
   END CASE
   IF NOT cl_null(g_sfb.sfb28) THEN
      LET g_close = 'Y'
   ELSE
      LET g_close = 'N'
   END IF
   #圖形顯示
   CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
   LET g_buf = s_get_doc_no(g_sfb.sfb01)
   SELECT smydesc INTO l_smydesc FROM smy_file WHERE smyslip=g_buf
   DISPLAY l_smydesc TO smydesc_n
   LET g_buf = NULL

   INITIALIZE g_ima.* TO NULL
   SELECT * INTO g_ima.* FROM ima_file WHERE ima01=g_sfb.sfb05
   DISPLAY g_ima.ima02,g_ima.ima021,g_ima.ima55 TO ima02_n,ima021_n,ima55_n

   LET g_buf=''
   IF NOT cl_null(g_sfb.sfb82) THEN
      IF (g_sfb.sfb02=7 OR g_sfb.sfb02=8 ) THEN
         SELECT pmc03 INTO g_buf FROM pmc_file WHERE pmc01=g_sfb.sfb82
      ELSE
         SELECT gem02 INTO g_buf FROM gem_file WHERE gem01=g_sfb.sfb82
            AND gemacti='Y'
      END IF
   END IF
   DISPLAY g_buf TO pmc03_n
   DISPLAY tm.y1,tm.y2,tm.y3,tm.p,tm.c TO y1,y2,y3,p,c
   DISPLAY g_sfb.sfb01, g_sfb.sfb81, g_sfb.sfb98,g_sfb.sfb02, g_sfb.sfb04,
           g_sfb.sfb39,g_sfb.sfb82, g_sfb.sfb22, g_sfb.sfb221,g_sfb.sfb05,
           g_sfb.sfb08,g_sfb.sfb081,g_sfb.sfb09, g_sfb.sfb07, g_sfb.sfb071,
           g_sfb.sfb06,g_sfb.sfb919,g_sfb.sfb86, g_sfb.sfb13,g_sfb.sfb25,
           g_sfb.sfb15, g_sfb.sfb28,g_sfb.sfb38, g_sfb.sfb34, g_sfb.sfb27,
           g_sfb.sfb23, g_sfb.sfb24, g_sfb.sfb41, g_sfb.sfb99
        TO sfb01_n,sfb81_n,sfb98_n,sfb02_n,sfb04_n,
           sfb39_n,sfb82_n,sfb22_n,sfb221_n,sfb05_n,
           sfb08_n,sfb081_n,sfb09_n,sfb07_n,sfb071_n,
           sfb06_n,sfb919_n,sfb86_n,sfb13_n,sfb25_n,
           sfb15_n,sfb28_n,sfb38_n,sfb34_n,sfb27_n,
           sfb23_n,sfb24_n,sfb41_n,sfb99_n
   CASE g_b_flag
      WHEN '1'
         CALL q303_1()
      WHEN '2'
         CALL q303_2()
      WHEN '3'
         CALL q303_3()
      WHEN '4'
         CALL q303_4()
      WHEN '5'
         CALL q303_5()
      WHEN '6'
         CALL q303_6()
      WHEN '7'
         CALL q303_7()
      WHEN '8'
         CALL q303_8()
      WHEN '9'
         CALL q303_9()
      WHEN '10'
         CALL q303_10()
      WHEN '11'
         CALL q303_11()
      WHEN '13'
         CALL q303_13()
      OTHERWISE
         CALL q303_1()
   END CASE

END FUNCTION

FUNCTION q303_detail_fill(p_ac)
   DEFINE p_ac         LIKE type_file.num10
   DEFINE l_sfb01      LIKE sfb_file.sfb01
   DEFINE i            LIKE type_file.num10
   INITIALIZE g_sfb.* TO NULL
   CALL g_arr1.clear()
   CALL g_arr2.clear()
   CALL g_arr3.clear()
   CALL g_arr4.clear()
   CALL g_arr5.clear()
   CALL g_arr6.clear()
   CALL g_arr7.clear()
   CALL g_arr8.clear()
   CALL g_arr9.clear()
   CALL g_arr10.clear()
   CALL g_arr11.clear()
   CALL g_arr13.clear()
   IF NOT cl_null(g_sfb_1[p_ac].sfb01) THEN
      LET l_sfb01 = g_sfb_1[p_ac].sfb01
   ELSE
      FOR i = l_ac TO 1 STEP -1
         IF NOT cl_null(g_sfb_1[i].sfb01) THEN
            LET l_sfb01 = g_sfb_1[i].sfb01
            EXIT FOR
         END IF
      END FOR
   END IF
   SELECT * INTO g_sfb.* FROM sfb_file WHERE sfb01 = l_sfb01
   LET g_b_flag = "1"     #默認顯示第二個頁簽的基本資料頁簽
   CALL q303_1()          #撈出詳細資料頁簽第一個頁簽的資料
   CALL cl_show_fld_cont()
END FUNCTION

FUNCTION q303_get_ecm04(p_sum)
   DEFINE   p_sum       LIKE type_file.num5
   DEFINE   l_count1    LIKE type_file.num10

   CALL q303_get_wip(g_cnt,'') RETURNING g_wipqty,g_ecm_sum
   CASE p_sum
               WHEN 2
                  LET g_sfb_1_excel[g_cnt-1].ecm301_021 = g_wipqty
               WHEN 3
                  LET g_sfb_1_excel[g_cnt-1].ecm301_031 = g_wipqty
               WHEN 4
                  LET g_sfb_1_excel[g_cnt-1].ecm301_041 = g_wipqty
               WHEN 5
                  LET g_sfb_1_excel[g_cnt-1].ecm301_051 = g_wipqty
               WHEN 6
                  LET g_sfb_1_excel[g_cnt-1].ecm301_061 = g_wipqty
               WHEN 7
                  LET g_sfb_1_excel[g_cnt-1].ecm301_071 = g_wipqty
               WHEN 8
                  LET g_sfb_1_excel[g_cnt-1].ecm301_081 = g_wipqty
               WHEN 9
                  LET g_sfb_1_excel[g_cnt-1].ecm301_091 = g_wipqty
               WHEN 10
                  LET g_sfb_1_excel[g_cnt-1].ecm301_101 = g_wipqty
               WHEN 11
                  LET g_sfb_1_excel[g_cnt-1].ecm301_111 = g_wipqty
               WHEN 12
                  LET g_sfb_1_excel[g_cnt-1].ecm301_121 = g_wipqty
               WHEN 13
                  LET g_sfb_1_excel[g_cnt-1].ecm301_131 = g_wipqty
               WHEN 14
                  LET g_sfb_1_excel[g_cnt-1].ecm301_141 = g_wipqty
               WHEN 15
                  LET g_sfb_1_excel[g_cnt-1].ecm301_151 = g_wipqty
               WHEN 16
                  LET g_sfb_1_excel[g_cnt-1].ecm301_161 = g_wipqty
               WHEN 17
                  LET g_sfb_1_excel[g_cnt-1].ecm301_171 = g_wipqty
               WHEN 18
                  LET g_sfb_1_excel[g_cnt-1].ecm301_181 = g_wipqty
               WHEN 19
                  LET g_sfb_1_excel[g_cnt-1].ecm301_191 = g_wipqty
               WHEN 20
                  LET g_sfb_1_excel[g_cnt-1].ecm301_201 = g_wipqty
               WHEN 21
                  LET g_sfb_1_excel[g_cnt-1].ecm301_211 = g_wipqty
               WHEN 22
                  LET g_sfb_1_excel[g_cnt-1].ecm301_221 = g_wipqty
               WHEN 23
                  LET g_sfb_1_excel[g_cnt-1].ecm301_231 = g_wipqty
               WHEN 24
                  LET g_sfb_1_excel[g_cnt-1].ecm301_241 = g_wipqty
               WHEN 25
                  LET g_sfb_1_excel[g_cnt-1].ecm301_251 = g_wipqty
               WHEN 26
                  LET g_sfb_1_excel[g_cnt-1].ecm301_261 = g_wipqty
               WHEN 27
                  LET g_sfb_1_excel[g_cnt-1].ecm301_271 = g_wipqty
               WHEN 28
                  LET g_sfb_1_excel[g_cnt-1].ecm301_281 = g_wipqty
               WHEN 29
                  LET g_sfb_1_excel[g_cnt-1].ecm301_291 = g_wipqty
               WHEN 30
                  LET g_sfb_1_excel[g_cnt-1].ecm301_301 = g_wipqty
   END CASE
END FUNCTION

FUNCTION q303_get_wip(p_i,p_type)
DEFINE
   p_i         LIKE type_file.num5,
   l_wipqty    LIKE ecm_file.ecm301,
   l_ecm_sum   LIKE ecm_file.ecm301,
   p_type      STRING                # add by lixwz 180322


#      某站若要報工則其可報工數=WIP量(a+b-f-g-d-e-h+i)，
#      若要做Check-In則可報工數=c-f-g-d-e-h+i。
   IF g_ecm.ecm54='Y' THEN   #check in 否
        LET l_wipqty
                        =  g_ecm.ecm291                  #check in
                         - g_ecm.ecm311 #*g_ecm59        #良品轉出
                         - g_ecm.ecm312 #*g_ecm59        #重工轉出
                         - g_ecm.ecm313 #*g_ecm59        #當站報廢
                         - g_ecm.ecm314 #*g_ecm59        #當站下線
                         - g_ecm.ecm316 #*g_ecm59        #工單轉出量
   ELSE
         # add by lixwz 180320 s---
         IF p_type = 'ecm301_011' THEN
            LET l_wipqty = # 良品转入改为实际发料量 mod by lixwz 180320  s---
                          # g_ecm.ecm301                  #良品轉入量
                            g_sfb_1_excel[p_i].sfb081
                          # add by lixwz 180320 e---
                         + g_ecm.ecm302                  #重工轉入量
                         + g_ecm.ecm303                  #工單轉入量
                         - g_ecm.ecm311 #*g_ecm59        #良品轉出
                         - g_ecm.ecm312 #*g_ecm59        #重工轉出
                         - g_ecm.ecm313 #*g_ecm59        #當站報廢
                         - g_ecm.ecm314 #*g_ecm59        #當站下線
                         - g_ecm.ecm316 #*g_ecm59        #工單轉出量

            IF g_sfb_1_excel[p_i].sfb081 = 0 THEN LET l_wipqty = 0 END IF  # add by lixwz 180320 发料为0，wip也为0
         ELSE
         # add by lixwz 180320 e---
            LET l_wipqty = g_ecm.ecm301                  #良品轉入量
                         + g_ecm.ecm302                  #重工轉入量
                         + g_ecm.ecm303                  #工單轉入量
                         - g_ecm.ecm311 #*g_ecm59        #良品轉出
                         - g_ecm.ecm312 #*g_ecm59        #重工轉出
                         - g_ecm.ecm313 #*g_ecm59        #當站報廢
                         - g_ecm.ecm314 #*g_ecm59        #當站下線
                         - g_ecm.ecm316 #*g_ecm59        #工單轉出量
         END IF
   END IF

   LET l_ecm_sum = g_ecm.ecm311 + g_ecm.ecm312 + g_ecm.ecm313
                 + g_ecm.ecm314 + g_ecm.ecm315 + g_ecm.ecm316
   IF cl_null(l_wipqty) THEN LET l_wipqty=0 END IF
   IF cl_null(l_ecm_sum) THEN LET l_ecm_sum = 0 END IF
   LET l_ecm_sum = l_ecm_sum * g_ecm.ecm63/g_ecm.ecm62
   RETURN l_wipqty,l_ecm_sum
END FUNCTION

FUNCTION q303_bp1(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)


   DISPLAY ARRAY g_arr1 TO s_arr1.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()   #FUN-550037(smin)
         CALL q303_def_form()      #FUN-610006
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY

      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY

      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY

      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY

      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY

      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY

      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY

      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY

      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY

      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY

      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY

      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY

      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY

      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY

      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY

      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY

      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY

      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")
   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp1_refresh()
   DISPLAY ARRAY g_arr1 TO s_arr1.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp2(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_arr2 TO s_arr2.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY

   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp2_refresh()
   DISPLAY ARRAY g_arr2 TO s_arr2.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp3(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_arr3 TO s_arr3.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()


      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY


      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp3_refresh()
   DISPLAY ARRAY g_arr3 TO s_arr3.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp4(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_arr4 TO s_arr4.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp4_refresh()
   DISPLAY ARRAY g_arr4 TO s_arr4.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp5(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_arr5 TO s_arr5.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY


      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp5_refresh()
   DISPLAY ARRAY g_arr5 TO s_arr5.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp6(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_arr6 TO s_arr6.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()


      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp6_refresh()
   DISPLAY ARRAY g_arr6 TO s_arr6.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp7(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_arr7 TO s_arr7.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY

      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp7_refresh()
   DISPLAY ARRAY g_arr7 TO s_arr7.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp8(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "
   DISPLAY 'g_rec_b=',g_rec_b
   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_arr8 TO s_arr8.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp8_refresh()
   DISPLAY ARRAY g_arr8 TO s_arr8.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp9(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_arr9 TO s_arr9.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp9_refresh()
   DISPLAY ARRAY g_arr9 TO s_arr9.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp10(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_arr10 TO s_arr10.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY


      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp10_refresh()
   DISPLAY ARRAY g_arr10 TO s_arr10.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp11(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_arr11 TO s_arr11.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp11_refresh()
   DISPLAY ARRAY g_arr11 TO s_arr11.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_bp13(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_arr13 TO s_arr13.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()

      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY


      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL q303_def_form()
         CASE g_sfb.sfb87
              WHEN 'Y'   LET g_confirm = 'Y'
                         LET g_void = ''
              WHEN 'N'   LET g_confirm = 'N'
                         LET g_void = ''
              WHEN 'X'   LET g_confirm = ''
                         LET g_void = 'Y'
           OTHERWISE     LET g_confirm = ''
                         LET g_void = ''
         END CASE
         IF NOT cl_null(g_sfb.sfb28) THEN
            LET g_close = 'Y'
         ELSE
            LET g_close = 'N'
         END IF
         #圖形顯示
         CALL cl_set_field_pic(g_confirm,"","",g_close,g_void,g_sfb.sfbacti)
         EXIT DISPLAY


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION cancel
         LET g_action_choice="exit"
         EXIT DISPLAY


      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

      #@ON ACTION 切換到第一頁簽
      ON ACTION page1
         LET g_b_flag_up = 1
         LET g_action_choice="page1"
         EXIT DISPLAY

      ON ACTION inquires_wip
         LET g_action_choice = "inquires_wip"
         EXIT DISPLAY

      ON ACTION refresh_detail   #明細資料刷新
         CALL q303_get_tmp()
         CALL q303_b_fill_1()
         CALL q303_b_fill_3()    #add by lili 170717
         CALL cl_set_comp_visible("page2", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page2", TRUE)
         LET g_b_flag_up = 1
         LET g_action_choice = "page1"
         EXIT DISPLAY

      #@ON ACTION 查詢
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY


      #@ON ACTION 備料
      ON ACTION allotment
         LET g_b_flag = 1
         LET g_action_choice="allotment"
         EXIT DISPLAY


      #@ON ACTION 製程
      ON ACTION routing
         LET g_b_flag = 2
         LET g_action_choice="routing"
         EXIT DISPLAY


      #@ON ACTION 委外採購
      ON ACTION sub_po
         LET g_b_flag = 3
         LET g_action_choice="sub_po"
         EXIT DISPLAY


      #@ON ACTION 發料
      ON ACTION issue
         LET g_b_flag = 4
         LET g_action_choice="issue"
         EXIT DISPLAY


      ON ACTION fqc
         LET g_b_flag = 5
         LET g_action_choice="fqc"
         EXIT DISPLAY


      #@ON ACTION 入庫
      ON ACTION store_in
         LET g_b_flag = 6
         LET g_action_choice="store_in"
         EXIT DISPLAY


      #@ON ACTION 子工單
      ON ACTION sub_wo
         LET g_b_flag = 7
         LET g_action_choice="sub_wo"
         EXIT DISPLAY


      #@ON ACTION 替代
      ON ACTION substitute
         LET g_b_flag = 8
         LET g_action_choice="substitute"
         EXIT DISPLAY


      ON ACTION qvl
         LET g_b_flag = 9
         LET g_action_choice="qvl"
         EXIT DISPLAY


      ON ACTION runcard
         LET g_b_flag = 10
         LET g_action_choice="runcard"
         EXIT DISPLAY


      ON ACTION report_no
         LET g_b_flag = 11
         LET g_action_choice="report_no"
         EXIT DISPLAY


      ON ACTION Routing_Reportable
         LET g_b_flag = 13
         LET g_action_choice="Routing_Reportable"
         EXIT DISPLAY


      #@ON ACTION 庫存資料
      ON ACTION inventory
         LET g_action_choice="inventory"
         EXIT DISPLAY


      #@ON ACTION 材料供需
      ON ACTION meterial_supply
         LET g_action_choice="meterial_supply"
         EXIT DISPLAY


      #@ON ACTION 備註
      ON ACTION memo
         LET g_action_choice="memo"
         EXIT DISPLAY


      #@ON ACTION 工單維護
      ON ACTION maint_w_o
         LET g_action_choice="maint_w_o"
         EXIT DISPLAY

      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY


      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

        ON ACTION CONTROLS
           CALL cl_set_head_visible("group01","AUTO")

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION

FUNCTION q303_bp13_refresh()
   DISPLAY ARRAY g_arr13 TO s_arr13.* ATTRIBUTE(COUNT = g_rec_b,UNBUFFERED)
      BEFORE DISPLAY
         EXIT DISPLAY
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
   END DISPLAY
END FUNCTION

FUNCTION q303_def_form()
   IF g_sma.sma115 ='N' THEN
      CALL cl_set_comp_visible("c8,c9,c10,c11,d11,d12,d13,d14,f11,f12,f13,f14",FALSE)
   END IF
   IF g_sma.sma122 ='1' THEN
      CALL cl_getmsg('asm-302',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("c8",g_msg CLIPPED)
      CALL cl_set_comp_att_text("d11",g_msg CLIPPED)
      CALL cl_set_comp_att_text("f11",g_msg CLIPPED)
      CALL cl_getmsg('asm-306',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("c9",g_msg CLIPPED)
      CALL cl_set_comp_att_text("d12",g_msg CLIPPED)
      CALL cl_set_comp_att_text("f12",g_msg CLIPPED)
      CALL cl_getmsg('asm-303',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("c10",g_msg CLIPPED)
      CALL cl_set_comp_att_text("d13",g_msg CLIPPED)
      CALL cl_set_comp_att_text("f13",g_msg CLIPPED)
      CALL cl_getmsg('asm-307',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("c11",g_msg CLIPPED)
      CALL cl_set_comp_att_text("d14",g_msg CLIPPED)
      CALL cl_set_comp_att_text("f14",g_msg CLIPPED)
   END IF
   IF g_sma.sma122 ='2' THEN
      CALL cl_getmsg('asm-304',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("c8",g_msg CLIPPED)
      CALL cl_set_comp_att_text("d11",g_msg CLIPPED)
      CALL cl_set_comp_att_text("f11",g_msg CLIPPED)
      CALL cl_getmsg('asm-308',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("c9",g_msg CLIPPED)
      CALL cl_set_comp_att_text("d12",g_msg CLIPPED)
      CALL cl_set_comp_att_text("f12",g_msg CLIPPED)
      CALL cl_getmsg('asm-305',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("c10",g_msg CLIPPED)
      CALL cl_getmsg('asm-309',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("c11",g_msg CLIPPED)
      CALL cl_getmsg('asm-328',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("d13",g_msg CLIPPED)
      CALL cl_set_comp_att_text("f13",g_msg CLIPPED)
      CALL cl_getmsg('asm-329',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("d14",g_msg CLIPPED)
      CALL cl_set_comp_att_text("f14",g_msg CLIPPED)
   END IF
   CALL cl_set_comp_visible('sfb919',g_sma.sma1421='Y')
END FUNCTION

#add by lili 170717 ---s---
FUNCTION q303_b_fill_3()

   CALL g_sfb_2.clear()
   LET g_rec_b2 = 0
   LET g_cnt = 1
   LET g_sfb_sum1 = 0
   LET g_sfb_sum2 = 0
   LET g_sfb_sum3 = 0
   LET g_sfb_sum4 = 0

   CALL q303_tmp1()
   CALL q303_sum()   #重新整理数据
   CALL q303_get_sum()

END FUNCTION

FUNCTION q303_tmp1()

   DROP TABLE csfq303_tmp1;
   CREATE TEMP TABLE csfq303_tmp1(
         sfb01        LIKE sfb_file.sfb01,
         smydesc      LIKE smy_file.smydesc,
         sfb81        LIKE sfb_file.sfb81,
         sfb02        LIKE sfb_file.sfb02,
         sfb87        LIKE sfb_file.sfb87,
         sfb28        LIKE sfb_file.sfb28,
         sfb82        LIKE sfb_file.sfb82,
         pmc03        LIKE pmc_file.pmc03,
         sfb98        LIKE sfb_file.sfb98,
         gem02        LIKE gem_file.gem02,
         sfb05        LIKE sfb_file.sfb05,
         ima02        LIKE ima_file.ima02,
         ima021       LIKE ima_file.ima021,
         imaud02      LIKE ima_file.imaud02,    #add by lili 170606
         ima09        LIKE ima_file.ima09,      #add by lili 170722
         sfb96        LIKE sfb_file.sfb96,      #add by lili 170606
         sfb36        LIKE sfb_file.sfb36,      #add by lili 170706
         ima55        LIKE ima_file.ima55,
         sfb08        LIKE sfb_file.sfb08,
         sfb081       LIKE sfb_file.sfb081,
         qi           LIKE sfb_file.sfb08,
         sfb09        LIKE sfb_file.sfb09,
         sfv091       LIKE sfv_file.sfv09,      #add by lili 170717
         sfv09        LIKE sfv_file.sfv09,      #add by lili 170717
         tot_wip      LIKE sfv_file.sfv09,      #add by lili 170717
         qcf091       LIKE qcf_file.qcf091,
         sfb12        LIKE sfb_file.sfb12,
         qrate        LIKE sfb_file.sfb08,
         trate        LIKE sfb_file.sfb08,
         sfb13        LIKE sfb_file.sfb13,
         sfb15        LIKE sfb_file.sfb15,
         sfp03        LIKE sfp_file.sfp03,
         sfp03_1      LIKE sfp_file.sfp03,
         shb02        LIKE shb_file.shb02,
         shb02_1      LIKE shb_file.shb02,
         sfu02        LIKE sfu_file.sfu02,
         sfu02_1      LIKE sfu_file.sfu02,
         sfb86        LIKE sfb_file.sfb86,
         sfb27        LIKE sfb_file.sfb27,
         pja02        LIKE pja_file.pja02,
         sfb91        LIKE sfb_file.sfb91,
         sfb92        LIKE sfb_file.sfb92,
         sfb22        LIKE sfb_file.sfb22,
         sfb221       LIKE sfb_file.sfb221,
         oea03        LIKE oea_file.oea03,
         oea032       LIKE oea_file.oea032,
         oea14        LIKE oea_file.oea14,
         gen02        LIKE gen_file.gen02,
         oeb15        LIKE oeb_file.oeb15,
         ima06        LIKE ima_file.ima06,
         imz02        LIKE imz_file.imz02,
         pro          LIKE ima_file.ima128,
         compro       LIKE ima_file.ima128,
         sfb39        LIKE sfb_file.sfb39,
         sfb04        LIKE sfb_file.sfb04,
         sfb38        LIKE sfb_file.sfb38,
         pmm09        LIKE pmm_file.pmm09,
         pmc03_1      LIKE type_file.chr200,
         sfb93        LIKE sfb_file.sfb93,
         sfb06        LIKE sfb_file.sfb06,
         sfb94        LIKE sfb_file.sfb94)

END FUNCTION

FUNCTION q303_sum()
   DEFINE l_sql      STRING

   LET l_sql = " INSERT INTO csfq303_tmp1
                 SELECT DISTINCT sfb01,smydesc,sfb81,sfb02,sfb87,sfb28,sfb82,pmc03,
                        sfb98,gem02,sfb05,ima02,ima021,imaud02,ima09,sfb96,sfb36,ima55,sfb08,sfb081,qi,sfb09,sfv091,
                        sfv09,tot_wip,qcf091,sfb12,qrate,trate,sfb13,sfb15,sfp03,sfp03_1,shb02,shb02_1,sfu02,
                        sfu02_1,sfb86,sfb27,pja02,sfb91,sfb92,sfb22,sfb221,oea03,oea032,oea14,gen02,oeb15,ima06,
                        imz02,pro,compro,sfb39,sfb04,sfb38,pmm09,pmc03_1,sfb93,sfb06,sfb94
                   FROM csfq303_tmp ORDER BY sfb01 "

   PREPARE q303_tmp1_p FROM l_sql
   EXECUTE q303_tmp1_p

END FUNCTION

FUNCTION q303_get_sum()
DEFINE     l_wc     STRING
DEFINE     l_sql    STRING

   CASE tm.d
      WHEN '1'
         CALL cl_set_comp_visible("ima01,imaud02_3,ima02_3,qty1,qty2,qty3,qty4,sfb081",TRUE)
         CALL cl_set_comp_visible("ima09",FALSE)
      WHEN '2'
         CALL cl_set_comp_visible("ima09,qty1,qty2,qty3,qty4,sfb081",TRUE)
         CALL cl_set_comp_visible("ima01,imaud02_3,ima02_3",FALSE)
   END CASE

   CASE tm.d
      WHEN '1'
         LET l_sql = "SELECT sfb05,imaud02,ima02,'',NVL(SUM(sfv091),0),NVL(SUM(sfv09),0),NVL(SUM(tot_wip),0),0,SUM(sfb081) ",
                     "  FROM csfq303_tmp1 ",
                     " GROUP BY sfb05,imaud02,ima02 ",
                     " ORDER BY sfb05 "
      WHEN '2'
         LET l_sql = "SELECT '','','',ima09,NVL(SUM(sfv091),0),NVL(SUM(sfv09),0),NVL(SUM(tot_wip),0),0,SUM(sfb081))  ",
                     "  FROM csfq303_tmp1 ",
                     " GROUP BY ima09 ",
                     " ORDER BY ima09 "
   END CASE

   PREPARE q303_pb FROM l_sql
   DECLARE q303_curs1 CURSOR FOR q303_pb
   FOREACH q303_curs1 INTO g_sfb_2[g_cnt].*
      IF SQLCA.sqlcode THEN
         CALL cl_err('foreach:',SQLCA.sqlcode,1)
         EXIT FOREACH
      END IF
      LET g_sfb_2[g_cnt].qty4 = (g_sfb_2[g_cnt].qty1/(g_sfb_2[g_cnt].qty1+g_sfb_2[g_cnt].qty2))*100
      LET g_sfb_sum1 = g_sfb_sum1 + g_sfb_2[g_cnt].qty1
      LET g_sfb_sum2 = g_sfb_sum2 + g_sfb_2[g_cnt].qty2
      LET g_sfb_sum3 = g_sfb_sum3 + g_sfb_2[g_cnt].qty3


      LET g_cnt = g_cnt + 1
      IF g_cnt > g_max_rec THEN
         CALL cl_err( '', 9035, 0 )
         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_sfb_2.deleteElement(g_cnt)
   LET g_cnt = g_cnt - 1
   DISPLAY ARRAY g_sfb_2 TO s_sfb_2.* ATTRIBUTE(COUNT=g_cnt)
      BEFORE DISPLAY
         EXIT DISPLAY
   END DISPLAY
   LET g_sfb_sum4 = (g_sfb_sum1/(g_sfb_sum1 + g_sfb_sum2))*100
   LET g_rec_b2 = g_cnt
   DISPLAY g_rec_b2 TO FORMONLY.cnt2
   DISPLAY g_sfb_sum1 TO FORMONLY.sum_sfb1
   DISPLAY g_sfb_sum2 TO FORMONLY.sum_sfb2
   DISPLAY g_sfb_sum3 TO FORMONLY.sum_sfb3
   DISPLAY g_sfb_sum4 TO FORMONLY.sum_sfb4
END FUNCTION
#add by lili 170717 ---e---