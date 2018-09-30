# Prog. Version..: '5.30.27-18.04.26(00010)'     #
#
# Pattern name...: saxrp310_bu.4gl    
# Descriptions...: 自動產生應收帳款副程式
# Date & Author..: 11/09/11 CHI-B90025 By Dido
# Remark ........: 
# Modify.........: No.MOD-BA0227 11/11/01 By Dido 出貨應收之訂金金額應採用金額比率方式計算
# Modify.........: No.MOD-BB0082 11/11/07 By Dido 發票金額應與本幣金額一樣有差異調整 
# Modify.........: No.MOD-BB0077 11/11/08 By Polly 調整撈取訂金資料條件
# Modify.........: No.MOD-BC0294 11/12/29 By Polly 調整axmp800拋轉時,當oea261/oea262/oea263為null時，給予0
# Modify.........: No.FUN-C10055 12/01/18 By fanbj 調整應收賬款oma70（來源類型）欄位值
# Modify.........: No.MOD-C20078 12/02/10 By Polly 調整尾款金額計算的判斷
# Modify.........: No.MOD-C20141 12/02/20 By Polly 類別為「非應收發票」單身總計金額應回寫oma55、oma57
# Modify.........: No.MOD-C30415 12/03/13 By zhangweib 若業態為零售(azw04 = '2')且客戶設置了'按交款金額產生應收'(occ73 = 'Y')，則按照實際交款金額產生應收,
#                                                      而不是按照訂金比例；且稅額為零
#                                                      saxrp310_bu()計算稅額時給l_occ73賦值
# Modify.........: No.TQC-C30309 12/03/27 By Dido 無訂單出貨單時,原幣未稅金額有誤 
# Modify.........: No.FUN-C30296 12/03/28 By xuxz LINE 790 g_mTax = TRUE --->g_mTax = FALSE
# Modify.........: No.TQC-C40180 12/04/19 By lutingting 修正TQC-C30415 bug
# Modify.........: No.TQC-BB0019 12/04/30 By Elise 因未給予l_occ73,應改用g_occ73,在此程式共用即可
# Modify.........: No.CHI-C10018 12/05/15 By Polly 出貨合併折讓邏輯調整
# Modify.........: No.FUN-C60036 12/06/29 By xuxz 增加大陸版且走開票時數額計算方式
# Modify.........: No.MOD-C60229 12/06/29 By Polly 調整更改立帳匯率後原幣金額會變成0的錯誤
# Modify.........: No.MOD-C70122 12/07/12 By Polly 改抓單身的訂單編號抓取原幣幣金額
# Modify.........: No.TQC-C70227 12/09/11 By yinhy 流通版本訂金應收比例為100%時，產生應收賬款錯誤
# Modify.........: No.MOD-C80007 12/08/06 By Polly oea262出貨金額為0，不需計算尾差
# Modify.........: No.MOD-C90145 12/09/18 By Polly 增加oea162判斷，若oea262=0 and oea162=100時，比照無訂單出貨方式抓取
# Modify.........: No.FUN-C90105 12/10/16 By xuxz 根據是否認列收入，來重新計算訂金，出貨時候的金額
# Modify.........: No.CHI-CB0016 12/11/08 By Dido axrp330 彙總問題處理 
# Modify.........: No:MOD-CC0042 12/12/06 By Polly 修正銷退方式為"折讓"時單價及含稅金額
# Modify.........: No:MOD-CC0189 12/12/21 By Polly 當含稅時，訂金金額不可反推計算，應以訂單總未稅金額計算
# Modify.........: No.MOD-C90173 13/01/22 By apo 出貨應收時部分尾款比率計算調整
# Modify.........: No.TQC-D40007 13/01/22 By pauline 流通業並且功能別為台灣時,含稅金額/未稅金額必須要由含稅否欄位回推計算 
# Modify.........: No.MOD-D50242 13/05/29 By apo 在saxrp310_tax中,重取g_occ73後,若為空值給予'N'值
# Modify.........: No.MOD-D60020 13/06/04 By yinhy oaz92為Y並且為大陸版時oma54不可為0
# Modify.........: No.CHI-D60025 13/06/18 By apo 修改含稅時,oma54計算方式
# Modify.........: No.MOD-D60156 13/06/19 By SunLM t_azi04未取到值
# Modify.........: No.CHI-D80004 13/08/12 By apo 部分待抵退款抵應收,後續出貨轉應收無扣除部分待抵數
# Modify.........: No.FUN-D90020 13/09/18 By bart 流通所產生的應收帳款,稅額計算方式調整
# Modify.........: No.TQC-DB0012 13/11/08 By yuhuabao 出貨應收若調整匯率後,訂金金額計算錯誤問題
# Modify.........: No.TQC-DB0052 13/11/21 By bart 以IF l_flag1 = 'N' THEN來作FUN-D90020的部分
# Modify.........: No.FUN-E10006 14/01/14 By apo 以字串存放cl_get_target_table傳回結果來使用,避免多次呼叫lib
# Modify.........: No.TQC-E10051 14/02/07 By Vampire axrp304 須支持流通零售單身稅單據立 AR
# Modify.........: No.FUN-E20014 14/02/07 By Johnson 流通零售業態的單據立應收時,原本判斷是否有單身稅別資料,來決定g_mTax=Y或N.改為用實際交易稅別檔來判斷.
# Modify.........: No.FUN-E20007 14/02/20 By yinhy 1.ooz33去掉区域别限制 2.訂金全額付款時修正出貨立賬金額
# Modify.........: NO.TQC-E10010 14/03/14 By Vampire 修正流通零售AR問題
# Modify.........: No.TQC-E30026 14/04/03 By Vampire 修正 借貸金額不平衡
# Modify.........: No.CHI-E40029 14/05/13 By yihsuan PREPARE sel_oga_pre 改為 foreach 方式以 omb44 為 group 作為 cl_parse_qry_sql 第二個參數應用,並於 foreach 中將 oga53 累計給予 l_oea262
#                                                    PREPARE sel_oga_pre_1 一併處理
# Modify.........: No.MOD-E70013 14/07/04 By yihsuan saxrp310_bu 中,計算本幣調整尾差部分,在原幣計算基礎與本幣不同,應同步調整原幣計算部分改善原幣與本幣差異問題
# Modify.........: No.TQC-E80012 14/08/20 By yihsuan saxrp310_bu 段當 ooz33 為 N 時取消重新計算未稅/含稅金額動作
# Modify.........: No.MOD-E80118 14/08/21 By Johnson 修正本幣金額小數取位問題.
# Modify.........: No.TQC-E90008 14/09/09 By Johnson 修正多張出貨單匯開AR,單頭稅額不正確的問題.
# Modify.........: No.TQC-E90010 14/09/10 By Johnson 修正 l_mTax 變數沒有給預設值的問題
# Modify.........: No.MOD-E90117 14/09/25 By Johnson 修正 saxrp310_bu.4gl, 當多張出貨單立一張應收時, oma16沒有來源單據, 所以判斷不到是否有實際交易稅額檔, 造成 l_mTax 變數為 false. 導致零售業態的單據以標準製造邏輯處理, 而發生稅額計算錯誤.
# Modify.........: No.CHI-E90043 14/10/03 By yihsuan 1.當 ooz33 為 N 時,訂金採含稅方式計算,因此在批次出貨時,若 oma213 為未稅者,則不再計算未稅金額
#                                                    2.多張出貨合併應收時計算訂金金額問題排除
# Modify.........: No.CHI-E80048 14/10/28 By yihsuan PREPARE sel_ogb_pre01 oga10條件改為小於本次產生的應收
# Modify.........: No.MOD-EC0033 14/12/05 By yihsuan 當ooz33='N'時，需用g_oma.oma52計算
# Modify.........: No.TQC-EA0022 14/12/18 By yihsuan 調整計算l_oma52t/l_oma53t的判斷式 
# Modify.........: No.MOD-F10100 15/01/26 By yihsuan 移除計算l_oma52t時，ooz33為Y的判斷條件
# Modify.........: No.CHI-F10019 15/03/04 By Charles4m 調整流通零售財務段應收帳款單據分錄邏輯.
# Modify.........: No.MOD-F30004 15/03/04 By yihsuan 帳款類別31類時已收金額位置調整
# Modify.........: No.CHI-F30074 15/03/31 By yihsuan 將CHI-E80048修改條件還原為 oga10 不為空
# Modify.........: No.MOD-F60095 15/06/22 By yihsuan 調整ooz33='N'產生出貨應收邏輯
# Modify.........: No.MOD-F70067 15/07/15 By yihsuan 解決單頭原幣及本幣金額計算錯誤的問題
# Modify.........: No.MOD-F70120 15/07/27 By yihsuan 調整計算訂金邏輯
# Modify.........: No.MOD-F70125 15/07/28 By yihsuan 訂金100%比率,一次出貨時,23.預收本幣金額作為12出貨應收的訂金本幣金額
# Modify.........: No.MOD-F70146 15/07/31 By yihsuan 調整訂單變更訂金比率後發票金額錯誤問題
# Modify.........: No.MOD-F80013 15/08/05 By yihsuan 判斷當訂金比率100%且一次出貨時,oma56t改用SUM的方式計算
# Modify.........: No.MOD-F70168 15/08/05 By yihsuan 增加MOD-F70125 IF判斷條件，訂金應收與出貨應收匯率需相同 
# Modify.........: No.MOD-F80084 15/08/19 By yihsuan 改用 t_azi04 取位
# Modify.........: No.FUN-F40073 15/08/21 By yihsuan 搭配款別優化,對應財務系統應映調整
# Modify.........: No.MOD-F80140 15/08/25 By yihsuan 發票金額計算問題處理
# Modify.........: No.MOD-F90076 15/09/16 By yihsuan 增加判斷條件，排除進入TQC-E80012調整段重新計算訂金金額
# Modify.........: No.MOD-FA0111 15/10/22 By yihsuan 不重新計算g_oma.oma53
# Modify.........: No.MOD-FC0038 15/12/09 By yihsuan ooz33='Y'時，增加oma213判斷決定oma52的值
# Modify.........: No.MOD-FC0126 15/12/22 By yihsuan 延續MOD-FC0038，計算發票金額也需參考此單調整
# Modify.........: No.MOD-G30003 16/03/01 By yihsuan 若為流通流程，單頭的未稅/含稅改SUM單身稅別明細檔的值。
# Modify.........: No.MOD-G30038 16/03/04 By yihsuan單頭金額不符問題
# Modify.........: No.MOD-G30169 16/03/31 By yihsuan 訂金比率100%時，直接以oma50t給予oma52
# Modify.........: No.MOD-G40118 16/04/27 By yihsuan 若oma213為未含稅，l_oea1008需再計算為含稅金額，否則判斷訂金100%會有誤
# Modify.........: No.MOD-G50151 16/06/27 By yihsuan 原幣與本幣訂金欄位金額不一致
# Modify.........: No.MOD-G60166 16/06/29 By yihsuan 小數取位後才計算發票金額
# Modify.........: No.MOD-G80011 16/08/04 By yihsuan l_oea1008_2應增加當oma213='Y'時，l_oea1008_2 = l_oea261t
# Modify.........: No.FUN-HB0002 17/11/29 By yihsuan 增加ooz34參數：預收沖銷時，是否以歷史匯率確認銷售收入本幣金額邏輯處理
# Modify.........: No.MOD-I40012 18/04/25 By yihsuan 當ooz33='N'且oma213='Y'時，需將oma52換算成未稅的金額

DATABASE ds
 
GLOBALS "../../config/top.global"
GLOBALS "../../sub/4gl/s_g_ar.global"      
 
DEFINE g_oma RECORD LIKE oma_file.*
DEFINE g_ogb RECORD LIKE ogb_file.*
DEFINE g_check      LIKE type_file.chr1
DEFINE g_sql        STRING           
DEFINE g_net        LIKE oox_file.oox10         
DEFINE g_mTax       LIKE type_file.chr1    # FUN-C10055 add
DEFINE g_occ73      LIKE occ_file.occ73  #TQC-BB0019
DEFINE g_oaz92      LIKE oaz_file.oaz92  #MOD-D60020
DEFINE g_tar_occ  STRING                 #FUN-E10006

#由訂單或出貨單產生應收
#----------------------------(單身更新單頭)----------------------------
FUNCTION saxrp310_bu(p_oma,p_ogb,p_oea01,p_oeaa08)        
   DEFINE p_oma     RECORD LIKE oma_file.*
   DEFINE p_ogb     RECORD LIKE ogb_file.*
   DEFINE p_oea01   LIKE oea_file.oea01   
   DEFINE p_oeaa08  LIKE oeaa_file.oeaa08 
   DEFINE l_oea01   LIKE oea_file.oea01   
   DEFINE l_oea01x  LIKE oea_file.oea01   #MOD-BA0227 
   DEFINE l_oeaa08  LIKE oeaa_file.oeaa08 
   DEFINE l_oea61   LIKE oea_file.oea61   #訂單總未稅金額
   DEFINE l_oea1008 LIKE oea_file.oea1008 #訂單總含稅金額
   DEFINE l_oea162  LIKE oea_file.oea162      #MOD-C90145
   DEFINE l_oea261  LIKE oea_file.oea261    #訂金未稅
   DEFINE l_oea261t LIKE oea_file.oea261    #訂金含稅   #MOD-BA0227 
   DEFINE l_oea262  LIKE oea_file.oea262  
   DEFINE l_oea263  LIKE oea_file.oea263    #尾款未稅
   DEFINE l_oea263t LIKE oea_file.oea263    #尾款含稅   #MOD-BA0227 
   DEFINE l_sumoea261  LIKE oea_file.oea261 #訂金未稅金額   
   DEFINE l_sumoea263  LIKE oea_file.oea263 #尾款未稅金額 
   DEFINE l_sumoea263t LIKE oea_file.oea263 #尾款含稅金額  #MOD-BA0227 
   DEFINE l_n      LIKE type_file.num5
   DEFINE l_occ73  LIKE occ_file.occ73
   DEFINE l_rxx00  LIKE rxx_file.rxx00
   DEFINE l_oma54  LIKE oma_file.oma54      #待抵預收淨額未稅
   DEFINE l_oma54t LIKE oma_file.oma54t     #待抵預收淨額含稅 #MOD-E70013 add 
   DEFINE l_diff_oma54  LIKE oma_file.oma54      #TQC-E80012
   DEFINE l_oma56  LIKE oma_file.oma56    
   DEFINE l_oma56t LIKE oma_file.oma56t   
   DEFINE l_oma59  LIKE oma_file.oma59      #MOD-BB0082
   DEFINE l_oma59t LIKE oma_file.oma59t     #MOD-BB0082
   DEFINE l_rxx04  LIKE rxx_file.rxx04
   DEFINE l_12_oma52  LIKE oma_file.oma52   #分批訂金金額(未稅)
   DEFINE l_13_oma54  LIKE oma_file.oma54   #尾款金額(未稅)
   DEFINE l_13_oma54t LIKE oma_file.oma54t  #尾款金額(含稅)
   DEFINE l_13_oma56  LIKE oma_file.oma56 
   DEFINE l_13_oma56t LIKE oma_file.oma56 
   DEFINE l_13_oma59  LIKE oma_file.oma59   #MOD-BB0082 
   DEFINE l_13_oma59t LIKE oma_file.oma59   #MOD-BB0082
   DEFINE l_oeb917    LIKE oeb_file.oeb917  
   DEFINE l_ogb917    LIKE ogb_file.ogb917  
   DEFINE l_sumogb917 LIKE ogb_file.ogb917  #出貨總數量
   DEFINE l_sumomb14  LIKE omb_file.omb14   #出貨總金額(含稅) #MOD-E70013 add
   DEFINE l_sumomb14t LIKE omb_file.omb14t  #出貨總金額(含稅) #MOD-E70013 add
   DEFINE l_sumomb16  LIKE omb_file.omb16   #出貨總金額(未稅)
   DEFINE l_sumomb16t LIKE omb_file.omb16t  #出貨總金額(含稅)
   DEFINE l_sumomb18  LIKE omb_file.omb18   #MOD-BB0082
   DEFINE l_sumomb18t LIKE omb_file.omb18t  #MOD-BB0082
   DEFINE l_oea263_1  LIKE oea_file.oea263  
   DEFINE l_oea263_1t LIKE oea_file.oea263  
   DEFINE l_oea263_2  LIKE oea_file.oea263  
   DEFINE l_oea263_2t LIKE oea_file.oea263  
   DEFINE l_oma52     LIKE oma_file.oma52   
   DEFINE l_oma52t    LIKE oma_file.oma52
   DEFINE l_oma53t    LIKE oma_file.oma53   #MOD-BA0227
   DEFINE l_sumoma54  LIKE oma_file.oma54  
   DEFINE l_sumoma54t LIKE oma_file.oma54t  
   DEFINE l_sumoma56  LIKE oma_file.oma56  
   DEFINE l_sumoma56t LIKE oma_file.oma56t  
   DEFINE li_count    LIKE type_file.num10    #FUN-C30296 add
   DEFINE l_cnt       LIKE type_file.num5     #CHI-C10018 add
   DEFINE l_21_omb14  LIKE omb_file.omb14         #MOD-CC0042
   DEFINE l_21_omb14t LIKE omb_file.omb14t        #MOD-CC0042
   DEFINE l_21_omb16  LIKE omb_file.omb16         #MOD-CC0042
   DEFINE l_21_omb16t LIKE omb_file.omb16t        #MOD-CC0042
   DEFINE l_21_omb18  LIKE omb_file.omb18         #MOD-CC0042
   DEFINE l_21_omb18t LIKE omb_file.omb18t        #MOD-CC0042
   DEFINE l_amt1  LIKE oma_file.oma59     #TQC-DB0012
   DEFINE l_amt2  LIKE oma_file.oma59     #TQC-DB0012
   DEFINE l_amt3  LIKE oma_file.oma59     #TQC-DB0012
   DEFINE l_amt4  LIKE oma_file.oma59     #MOD-FC0038 add
   DEFINE l_tar_oay  STRING                       #FUN-E10006
   DEFINE l_tar_oea  STRING                       #FUN-E10006
   DEFINE l_tar_oeb  STRING                       #FUN-E10006
   DEFINE l_tar_oha  STRING                       #FUN-E10006
   DEFINE l_tar_ohb  STRING                       #FUN-E10006
   DEFINE l_tar_oga  STRING                       #FUN-E10006
   DEFINE l_tar_ogb  STRING                       #FUN-E10006
   DEFINE l_tar_rxx  STRING                       #FUN-E10006
   DEFINE l_rxx04_01 LIKE rxx_file.rxx04       #TQC-E10010 add 
   DEFINE l_rxx04_02 LIKE rxx_file.rxx04      #TQC-E10010 add 
   DEFINE l_mTax     LIKE type_file.chr1      #TQC-E10010 add
   DEFINE l_omb44    LIKE omb_file.omb44      #CHI-E40029 add
   DEFINE l_oea262_2   LIKE oea_file.oea262   #CHI-E40029 add
   DEFINE l_oeb12    LIKE oeb_file.oeb12      #MOD-F70125 add
   DEFINE l_ogb12    LIKE ogb_file.ogb12      #MOD-F70125 add
   DEFINE l_oma24_11 LIKE oma_file.oma24      #MOD-F70168 add
   DEFINE l_tot      LIKE type_file.num5      #MOD-F70168 add
   DEFINE l_cnt2     LIKE type_file.num5      #MOD-F80140 add
   DEFINE l_oea_cnt  LIKE type_file.num5      #MOD-F90076 add
   DEFINE l_omb_cnt  LIKE type_file.num5      #MOD-F90076 add
   DEFINE l_flag2    LIKE type_file.chr1      #MOD-F90076 add
   DEFINE l_sumamt1  LIKE oma_file.oma59      #MOD-G30038 add
   DEFINE l_oea1008_2 LIKE oea_file.oea1008   #MOD-G40118 add
   DEFINE l_oma50     LIKE oma_file.oma50     #MOD-G60166 add
   LET g_oma.*  = p_oma.*
   LET g_ogb.*  = p_ogb.*
   LET l_oea01  = p_oea01
   LET l_oeaa08 = p_oeaa08
   LET g_tar_occ = cl_get_target_table(g_plant_new,'occ_file')  #FUN-E10006
   LET l_tar_oay = cl_get_target_table(g_plant_new,'oay_file')  #FUN-E10006
   LET l_tar_rxx = cl_get_target_table(g_plant_new,'rxx_file')  #FUN-E10006
   LET l_tar_oea = cl_get_target_table(g_plant_new,'oea_file')  #FUN-E10006
   LET l_tar_oeb = cl_get_target_table(g_plant_new,'oeb_file')  #FUN-E10006
   LET l_tar_oha = cl_get_target_table(g_plant_new,'oha_file')  #FUN-E10006
   LET l_tar_ohb = cl_get_target_table(g_plant_new,'ohb_file')  #FUN-E10006
   LET l_tar_oga = cl_get_target_table(g_plant_new,'oga_file')  #FUN-E10006
   LET l_tar_ogb = cl_get_target_table(g_plant_new,'ogb_file')  #FUN-E10006
   
  #計數交易單號是否存在於交款匯總檔
   LET l_n = 0
   IF g_oma.oma16 <> ' ' THEN  #CHI-CB0016 
      LET g_sql = "SELECT COUNT(*)",
                  "  FROM ",cl_get_target_table(g_plant_new,'rxx_file'),
                  " WHERE rxx01 = '",g_oma.oma16,"'",
                  "   AND rxxplant = '",g_oma.oma66,"'"
  #-CHI-CB0016-add-
   ELSE
      LET g_sql = "SELECT COUNT(*)",
                 #"  FROM ",cl_get_target_table(g_plant_new,'rxx_file'),  #FUN-E10006 mark
                  "  FROM ",l_tar_rxx,                                    #FUN-E10006
                  " WHERE rxx01 IN (SELECT omb31 FROM omb_file ",
                  "                  WHERE omb01 = '",g_oma.oma01,"')",
                  "   AND rxxplant = '",g_oma.oma66,"'"
   END IF
  #-CHI-CB0016-end-
   CASE 
      WHEN g_oma.oma00 = '11' OR g_oma.oma00 = '13'
         LET g_sql = g_sql 
         LET l_rxx00 = '01'
      WHEN g_oma.oma00 = '12' OR g_oma.oma00 = '19'
         LET g_sql = g_sql
         LET l_rxx00 = '02'
      WHEN g_oma.oma00 = '21' OR g_oma.oma00 = '28'
        LET g_sql = g_sql
        LET l_rxx00 = '03' 
   END CASE
   CALL cl_replace_sqldb(g_sql) RETURNING g_sql              
   CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
   PREPARE sel_rxx_pre FROM g_sql
   EXECUTE sel_rxx_pre INTO l_n

  #抓取收款客戶的按交款金額產生應收欄位
   LET g_sql = "SELECT occ73 ",
              #"  FROM ",cl_get_target_table(g_plant_new,'occ_file'),   #FUN-E10006 mark
               "  FROM ",g_tar_occ,                                     #FUN-E10006
               " WHERE occ01 = '",g_oma.oma68,"'"
   CALL cl_replace_sqldb(g_sql) RETURNING g_sql              					
   CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql            
   PREPARE sel_occ_pre49 FROM g_sql
   EXECUTE sel_occ_pre49 INTO g_occ73  #TQC-BB0019 l_occ73->g_occ73
   IF cl_null(g_occ73) THEN LET g_occ73 = 'N' END IF   #TQC-BB0019 l_occ73->g_occ73 

   IF l_n > 0 AND g_occ73 ='Y' THEN  #TQC-BB0019 l_occ73->g_occ73 
      LET g_check = 'Y'
   ELSE 
      LET g_check = 'N' 
   END IF
   
   SELECT oaz92 INTO g_oaz92 FROM oaz_file             #MOD-D60020
  #預設值
   LET g_oma.oma50 = 0   LET g_oma.oma50t = 0   
   LET g_oma.oma52 = 0   LET g_oma.oma53  = 0   #訂金原幣/本幣
   LET g_oma.oma56 = 0   LET g_oma.oma56t = 0
   LET g_oma.oma59 = 0   LET g_oma.oma59t = 0

   #TQC-E90008 add (begin)
   LET l_mTax = FALSE
  #SELECT COUNT(*) INTO l_cnt FROM omk_file WHERE omk01 = g_oma.oma01 #CHI-F10019 mark
   SELECT COUNT(*) INTO l_cnt FROM oml_file WHERE oml01 = g_oma.oma01 #CHI-F10019 add
   IF l_cnt > 0 THEN
      LET l_mTax = TRUE
   END IF

   IF l_mTax = TRUE THEN
      #CHI-F10019 ---begin mark---
      #SELECT SUM(omk07),SUM(omk07t),SUM(omk07),SUM(omk07t),SUM(omk07),SUM(omk07t)
      #  INTO g_oma.oma50,g_oma.oma50t,g_oma.oma56,g_oma.oma56t,g_oma.oma59,g_oma.oma59t
      #  FROM omk_file
      # WHERE omk01 = g_oma.oma01
      #CHI-F10019 ---end mark---

      #CHI-F10019 ---begin add---
       SELECT SUM(oml08),SUM(oml08t),SUM(oml08),SUM(oml08t)
         INTO g_oma.oma50,g_oma.oma50t,g_oma.oma56,g_oma.oma56t
         FROM oml_file
        WHERE oml01 = g_oma.oma01

       SELECT SUM(omk07),SUM(omk07t)
         INTO g_oma.oma59,g_oma.oma59t
         FROM omk_file
        WHERE omk01 = g_oma.oma01
      #CHI-F10019 ---end add---
   
   ELSE
   #TQC-E90008 add (end)

      SELECT SUM(omb14),SUM(omb14t),SUM(omb16),SUM(omb16t),SUM(omb18),SUM(omb18t)  
        INTO g_oma.oma50,g_oma.oma50t,g_oma.oma56,g_oma.oma56t,g_oma.oma59,g_oma.oma59t
        FROM omb_file
       WHERE omb01 = g_oma.oma01

   END IF     #TQC-E90008 add
   #-----------------------MOD-CC0042----------------(S)
   SELECT SUM(omb14)*-1,SUM(omb14t)*-1,SUM(omb16)*-1,SUM(omb16t)*-1,SUM(omb18)*-1,SUM(omb18t)*-1
     INTO l_21_omb14,l_21_omb14t,l_21_omb16,l_21_omb16t,l_21_omb18,l_21_omb18t
     FROM omb_file
    WHERE omb01 = g_oma.oma01
     AND omb38 = '3'
   #-----------------------MOD-CC0042----------------(E)
   IF g_oma.oma50  IS NULL THEN LET g_oma.oma50  = 0 END IF
   IF g_oma.oma50t IS NULL THEN LET g_oma.oma50t = 0 END IF 
   IF g_oma.oma56  IS NULL THEN LET g_oma.oma56  = 0 END IF   
   IF g_oma.oma56t IS NULL THEN LET g_oma.oma56t = 0 END IF   
   IF g_oma.oma59  IS NULL THEN LET g_oma.oma59  = 0 END IF   
   IF g_oma.oma59t IS NULL THEN LET g_oma.oma59t = 0 END IF   
   IF cl_null(l_21_omb14) THEN LET l_21_omb14 = 0 END IF          #MOD-CC0042
   IF cl_null(l_21_omb14t) THEN LET l_21_omb14t = 0 END IF        #MOD-CC0042
   IF cl_null(l_21_omb16) THEN LET l_21_omb16 = 0 END IF          #MOD-CC0042
   IF cl_null(l_21_omb16t) THEN LET l_21_omb16t = 0 END IF        #MOD-CC0042
   IF cl_null(l_21_omb18) THEN LET l_21_omb18 = 0 END IF          #MOD-CC0042
   IF cl_null(l_21_omb18t) THEN LET l_21_omb18t = 0 END IF        #MOD-CC0042

   LET g_oma.oma73 = 0   LET g_oma.oma73f = 0   #原幣代收/本幣代收
   IF g_oma.oma74 = '2' AND (g_oma.oma00 ='28' OR g_oma.oma00 ='19') THEN    
      SELECT SUM(omb14t),SUM(omb16t) INTO g_oma.oma73f,g_oma.oma73 
        FROM omb_file 
       WHERE omb01=g_oma.oma01
      IF g_oma.oma73 IS NULL THEN LET g_oma.oma73=0 END IF
      IF g_oma.oma73f IS NULL THEN LET g_oma.oma73f=0 END IF
   END IF
 
  #累計已出貨訂單的訂金金額與尾款金額
   IF g_oma.oma16 <> ' ' THEN   #CHI-CB0016
      LET g_sql = "SELECT SUM(oea261),SUM(oea263) ",
                 #"  FROM ",cl_get_target_table(g_plant_new,'oea_file'), #FUN-E10006 mark
                  "  FROM ",l_tar_oea,                                   #FUN-E10006
                  " WHERE oea01 IN (",
                  " SELECT ogb31 ",
                 #" FROM ",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark 
                  " FROM ",l_tar_ogb,                                   #FUN-E10006
                  "  WHERE ogb01 = '",g_oma.oma16,"')"
  #-CHI-CB0016-add-
   ELSE
      LET g_sql = "SELECT oea261,oea263 ",
                 #"  FROM ",cl_get_target_table(g_plant_new,'oea_file'), #FUN-E10006 mark
                  "  FROM ",l_tar_oea,                                   #FUN-E10006
                  " WHERE oea01 = '",l_oea01,"'"
   END IF   
  #-CHI-CB0016-end-
   CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
   CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
   PREPARE sel_oea26x_pre FROM g_sql

  #非本張出貨訂單的單身金額
  #-MOD-BB0077-mark-
  #LET g_sql = "SELECT SUM(omb14)-SUM(oma52)-SUM(oma54),",
  #            "       SUM(omb14t)-SUM(oma52*(1+oma211/100))-SUM(oma54t),",
  #            "       SUM(omb16)-SUM(oma53)-SUM(oma56),",
  #            "       SUM(omb16t)-SUM(oma53*(1+oma211/100))-SUM(oma56t),",
  #            "       SUM(oma52) ",
  #-MOD-BB0077-end-
   LET g_sql = "SELECT SUM(omb14),SUM(omb14t),SUM(omb16),SUM(omb16t) ",  #MOD-BB0077
              #"  FROM oma_file,omb_file,",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark
               "  FROM oma_file,omb_file,",l_tar_ogb,                                   #FUN-E10006
               " WHERE oma01=omb01 AND omb31=ogb01",
              #"   AND ogb31 IN (SELECT ogb31 FROM ",cl_get_target_table(g_plant_new,'ogb_file'), #CHI-CB0016 mark
              #"                  WHERE ogb01 = '",g_ogb.ogb01,"')",                              #CHI-CB0016 mark
               "   AND ogb31 IN (SELECT omb31 FROM omb_file ",        #CHI-CB0016
               "                  WHERE omb01 = '",g_oma.oma01,"')",  #CHI-CB0016          
              #"   AND ogb01!='",g_ogb.ogb01,"'",                     #CHI-CB0016 mark
               "   AND oma01 != '",g_oma.oma01,"'",                   #CHI-CB0016
               "   AND (oma00 = '12' OR oma00 = '19')",
               "   AND omavoid= 'N'",
               "   AND omb32 = ogb03"                                    #MOD-BB0077
   CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
   CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
   PREPARE sel_oea26x_1_pre FROM g_sql

  #-MOD-BB0077-add-
  #非本張出貨訂單的單頭金額
   IF g_oma.oma16 <> ' ' THEN  #CHI-CB0016 
      LET g_sql = "SELECT SUM(oma52)+SUM(oma54),SUM(oma52*(1+oma211/100))+SUM(oma54t),",
                  "       SUM(oma53)+SUM(oma56),SUM(oma53*(1+oma211/100))+SUM(oma56t),",
                  "       SUM(oma52) ",
                  "  FROM oma_file ",
                 #" WHERE oma19 IN (SELECT ogb31 FROM ",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark
                  " WHERE oma19 IN (SELECT ogb31 FROM ",l_tar_ogb,                                   #FUN-E10006
                  "                  WHERE ogb01 = '",g_ogb.ogb01,"')",
                  "   AND oma16 != '",g_ogb.ogb01,"'",
                  "   AND (oma00 = '12' OR oma00 = '19')",
                  "   AND omavoid= 'N'"
  #-CHI-CB0016-add-
   ELSE
      LET g_sql = "SELECT SUM(oma52)+SUM(oma54),SUM(oma52*(1+oma211/100))+SUM(oma54t),",
                  "       SUM(oma53)+SUM(oma56),SUM(oma53*(1+oma211/100))+SUM(oma56t),",
                  "       SUM(oma52) ",
                  "  FROM oma_file ",
                 #" WHERE oma19 IN (SELECT ogb31 FROM ",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark
                  " WHERE oma19 IN (SELECT ogb31 FROM ",l_tar_ogb,                                   #FUN-E10006 
                  "                  WHERE ogb01 IN (SELECT omb31 FROM omb_file ",        
                  "                                   WHERE omb01 = '",g_oma.oma01,"'))", 
                  "   AND oma16 NOT IN (SELECT omb31 FROM omb_file ",        
                  "                      WHERE omb01 = '",g_oma.oma01,"')", 
                  "   AND (oma00 = '12' OR oma00 = '19')",
                  "   AND omavoid= 'N'"
   END IF
  #-CHI-CB0016-end-
   CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
   CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
   PREPARE sel_oea26x_2_pre FROM g_sql
  #-MOD-BB0077-end-

  #-MOD-BA0227-add-
  #抓取訂單資料
   CASE 
      WHEN g_oma.oma00 = '12' OR g_oma.oma00 = '19'
       #-----------------MOD-C70122-----------(S)
       #------MOD-C70122----mark
       ##-----------------MOD-C60229-----------(S)
       # SELECT oga16 INTO g_ogb.ogb31
       #   FROM oga_file
       #  WHERE oga01 = g_oma.oma16
       ##-----------------MOD-C60229-----------(E)
       #------MOD-C70122----mark
         DECLARE t620_ogb31 SCROLL CURSOR FOR
                 SELECT ogb31 FROM ogb_file,oga_file
                  WHERE ogb01 = g_oma.oma16
                    AND oga01 = ogb01
                    AND ogaconf = 'Y'
         OPEN t620_ogb31
         FETCH FIRST t620_ogb31 INTO g_ogb.ogb31
         CLOSE t620_ogb31
        #-CHI-CB0016-add-
         IF cl_null(g_ogb.ogb01) AND NOT cl_null(l_oea01) THEN 
            LET g_ogb.ogb31 = l_oea01
         END IF
        #-CHI-CB0016-end-
       #-----------------MOD-C70122-----------(E)
         LET l_oea01x = g_ogb.ogb31
      WHEN g_oma.oma00 = '13'
         LET l_oea01x = g_oma.oma16 
   END CASE
  #LET g_sql = "SELECT oea61,oea261,oea262,oea263 ",                    #MOD-C90145 mark
   LET g_sql = "SELECT oea61,oea162,oea261,oea262,oea263 ",             #MOD-C90145
              #"  FROM ",cl_get_target_table(g_plant_new,'oea_file'),   #FUN-E10006 mark
               "  FROM ",l_tar_oea,                                     #FUN-E10006
               " WHERE oea01 = '",l_oea01x,"'"
   CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
   CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
   PREPARE sel_oea_pre FROM g_sql
  #-MOD-BA0227-end-

  #-CHI-CB0016-add-
   LET g_sql = "SELECT oga162 ",         
              #"  FROM ",cl_get_target_table(g_plant_new,'oga_file'), #FUN-E10006 mark
               "  FROM ",l_tar_oga,                                   #FUN-E10006
               " WHERE oga01 IN (SELECT omb31 FROM omb_file ",        
               "                  WHERE omb01 = '",g_oma.oma01,"')"
   CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
   CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
   PREPARE p310_oga_pre2 FROM g_sql
   DECLARE p310_oga_cs2 SCROLL CURSOR FOR p310_oga_pre2
  #-CHI-CB0016-end-

   CASE 
     #-訂金-
      WHEN g_oma.oma00 = '11'         
         LET l_rxx04 = 0  
         LET g_sql = "SELECT SUM(rxx04) ",
                    #"  FROM ",cl_get_target_table(g_plant_new,'rxx_file'), #FUN-E10006 mark 
                     "  FROM ",l_tar_rxx,                                   #FUN-E10006
                     " WHERE rxx01 = '",l_oea01,"' AND rxx03 = '1'",
                     "   AND rxx00 = '01'"
        #TQC-E10010 add start -----
         IF g_oma.oma213 = 'N' THEN
            LET g_sql = g_sql,"   AND rxx02 NOT IN ('04','07','09') "
         END IF
        #TQC-E10010 add end   -----
         CALL cl_replace_sqldb(g_sql) RETURNING g_sql              						
         CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql                 
         PREPARE sel_rxx_pre48 FROM g_sql
         EXECUTE sel_rxx_pre48 INTO l_rxx04
         IF cl_null(l_rxx04) THEN LET l_rxx04 = 0 END IF        
        #TQC-E10010 add start -----
         LET l_cnt = 0
         LET l_mTax = FALSE     #TQC-E90008 mark     #TQC-E90010 unmark
         SELECT COUNT(*) INTO l_cnt FROM oeh_file WHERE oeh01 = l_oea01
         IF l_cnt > 0 THEN
            LET l_mTax = TRUE
         END IF
        #TQC-E10010 add end   -----
        #原幣計算
        #IF l_occ73 = 'N' THEN       #No.MOD-C30415   Mark
        #IF l_occ73 = 'N' AND g_azw.azw04 = '2' THEN   #No.MOD-C30415   Add   #TQC-C40180
        #IF g_occ73 = 'N' AND g_azw.azw04 <> '2' THEN   #TQC-C40180  #TQC-BB0019 l_occ73->g_occ73 #TQC-E10010 add
         IF (g_occ73 = 'N' AND g_azw.azw04 <> '2') OR NOT l_mTax THEN #TQC-E10010 add
               IF g_oma.oma213 = 'Y' THEN
                  LET g_oma.oma54t = l_oeaa08
                 #-CHI-D60025--str
                  SELECT oea61,oea261,oea262 INTO l_oea61,l_oea261,l_oea262
                    FROM oea_file
                   WHERE oea01 = p_oea01
                 #-CHI-D60025--end
                 #LET g_oma.oma54  = g_oma.oma54t/(1+ g_oma.oma211/100)         #CHI-D60025 mark
                  LET g_oma.oma54  = g_oma.oma54t/(l_oea261+l_oea262)*l_oea61   #CHI-D60025
                  #FUN-C90105--add--str
                  #IF g_ooz.ooz33 = 'N' AND g_aza.aza26 ='2' THEN   #FUN-E20007 mark
                  IF g_ooz.ooz33 = 'N' THEN                         #FUN-E20007
                     LET g_oma.oma54 = g_oma.oma54t
                  END IF 
                  #FUN-C90105--add--end
               ELSE
                  LET g_oma.oma54  = l_oeaa08
                  LET g_oma.oma54t = g_oma.oma54*(1+ g_oma.oma211/100)
                  #FUN-C90105--add--str
                  #IF g_ooz.ooz33 = 'N' AND g_aza.aza26 ='2' THEN   #FUN-E20007 mark
                  IF g_ooz.ooz33 = 'N' THEN                         #FUN-E20007
                     LET g_oma.oma54 = g_oma.oma54t
                  END IF 
                  #FUN-C90105--add--end
               END IF
               LET g_oma.oma54x = g_oma.oma54t - g_oma.oma54 #TQC-E10010 add
         ELSE
           #流通業但是功能別不為台灣時,含稅金額 = 未稅金額
            IF g_aza.aza26 <> '0' THEN    #TQC-D40007 add 
               LET g_oma.oma54t = l_rxx04
               LET g_oma.oma54 = l_rxx04
           #TQC-D40007 add START
           #流通業並且功能別為台灣時,含稅金額/未稅金額必須要由含稅否欄位回推計算 
            ELSE
               IF g_oma.oma213 = 'Y' THEN
                  LET g_oma.oma54t = l_rxx04
                  LET g_oma.oma54 = g_oma.oma54t/(1+ g_oma.oma211/100)  
                  LET g_oma.oma54x = g_oma.oma54t - g_oma.oma54
               ELSE
                  LET g_oma.oma54 = l_rxx04                        
                 #LET g_oma.oma54t = g_oma.oma54t*(1+ g_oma.oma211/100) #TQC-E10010 mark 
                  LET g_oma.oma54t = g_oma.oma54*(1+ g_oma.oma211/100)  #TQC-E10010 add
                  LET g_oma.oma54x = g_oma.oma54t - g_oma.oma54
               END IF
            END IF
           #TQC-D40007 add END
         END IF 
        #TQC-E10010 add start -----
         CALL cl_digcut(g_oma.oma54,t_azi04) RETURNING g_oma.oma54
         CALL cl_digcut(g_oma.oma54t,t_azi04) RETURNING g_oma.oma54t
         CALL cl_digcut(g_oma.oma54x,t_azi04) RETURNING g_oma.oma54x
        #TQC-E10010 add end   -----
        #原幣稅額計算
        #IF l_occ73 = 'N' AND g_azw.azw04 = '2' THEN   #No.MOD-C30415   Add  #TQC-C40180
        #IF g_occ73 = 'N' AND g_azw.azw04 <> '2' THEN   #TQC-C40180  #TQC-BB0019 l_occ73->g_occ73 #FUN-C90105 mark
         #IF g_occ73 = 'N' AND g_azw.azw04 <> '2' AND (g_ooz.ooz33 = 'Y' OR g_aza.aza26 !='2')THEN #FUN-C90105 add  #FUN-E20007 mark
         IF g_occ73 = 'N' AND g_azw.azw04 <> '2' AND g_ooz.ooz33 = 'Y' THEN                                         #FUN-E20007
            CALL saxrp310_tax(g_oma.oma54,g_oma.oma54t,'A') 
                 RETURNING g_oma.oma54,g_oma.oma54t,g_oma.oma54x
         END IF                                        #No.MOD-C30415   Add
        #本幣計算
        #IF l_occ73 = 'N' THEN    #No.MOD-C30415   Mark
        #IF l_occ73 = 'N' AND g_azw.azw04 = '2' THEN   #No.MOD-C30415   Add   #TQC-C40180
        #IF g_occ73 = 'N' AND g_azw.azw04 <> '2' THEN   #TQC-C40180  #TQC-BB0019 l_occ73->g_occ73 #TQC-E10010 mark
         IF (g_occ73 = 'N' AND g_azw.azw04 <> '2') OR NOT l_mTax THEN #TQC-E10010 add 
            LET g_oma.oma56  = g_oma.oma54 * g_oma.oma24
            LET g_oma.oma56t = g_oma.oma54t* g_oma.oma24
            LET g_oma.oma56x = g_oma.oma56t - g_oma.oma56 #TQC-E10010 add
         ELSE
           #流通業但是功能別不為台灣時,含稅金額 = 未稅金額
            IF g_aza.aza26 <> '0' THEN    #TQC-D40007 add
               LET g_oma.oma56t  = l_rxx04 * g_oma.oma24
               LET g_oma.oma56 = l_rxx04 * g_oma.oma24
           #TQC-D40007 add START
           #流通業並且功能別為台灣時,含稅金額/未稅金額必須要由含稅否欄位回推計算
            ELSE
               IF g_oma.oma213 = 'Y' THEN
                  LET g_oma.oma56t = l_rxx04
                  LET g_oma.oma56 = g_oma.oma56t/(1+ g_oma.oma211/100)  
                  LET g_oma.oma56x = g_oma.oma56t - g_oma.oma56
               ELSE
                  LET g_oma.oma56 = l_rxx04                       
                 #LET g_oma.oma56t = g_oma.oma56t*(1+ g_oma.oma211/100) #TQC-E10010 mark
                  LET g_oma.oma56t = g_oma.oma56*(1+ g_oma.oma211/100)  #TQC-E10010 add  
                  LET g_oma.oma56x = g_oma.oma56t - g_oma.oma56
               END IF
            END IF
           #TQC-D40007 add END
         END IF
        #TQC-E10010 add start -----
         CALL cl_digcut(g_oma.oma56,g_azi04) RETURNING g_oma.oma56      #MOD-E80118 modify t_azi04 -> g_azi04
         CALL cl_digcut(g_oma.oma56t,g_azi04) RETURNING g_oma.oma56t    #MOD-E80118 modify t_azi04 -> g_azi04
         CALL cl_digcut(g_oma.oma56x,g_azi04) RETURNING g_oma.oma56x    #MOD-E80118 modify t_azi04 -> g_azi04
        #TQC-E10010 add end   -----
        #本幣稅額計算
        #IF l_occ73 = 'N' AND g_azw.azw04 = '2' THEN   #No.MOD-C30415   Add  #TQC-C40180
        #IF g_occ73 = 'N' AND g_azw.azw04 <> '2' THEN   #TQC-C40180  #TQC-BB0019 l_occ73->g_occ73#FUN-C90105 mark
        #IF g_occ73 = 'N' AND g_azw.azw04 <> '2' AND (g_ooz.ooz33 = 'Y' OR g_aza.aza26 !='2')THEN #FUN-C90105 add  #FUN-E20007 mark
         IF g_occ73 = 'N' AND g_azw.azw04 <> '2' AND g_ooz.ooz33 = 'Y' THEN                                        #FUN-E20007             
            CALL saxrp310_tax(g_oma.oma56,g_oma.oma56t,'B') 
                 RETURNING g_oma.oma56,g_oma.oma56t,g_oma.oma56x
         END IF                                        #No.MOD-C30415   Add
        #發票計算       
        #LET g_oma.oma59  = g_oma.oma54 * g_oma.oma58 #CHI-F10019 mark
        #LET g_oma.oma59t = g_oma.oma54t* g_oma.oma58 #CHI-F10019 mark
         IF l_mTax = TRUE THEN                                             #MOD-F70146 add
            LET g_oma.oma59  = g_oma.oma59 * g_oma.oma58 #CHI-F10019 add    
            LET g_oma.oma59t = g_oma.oma59t* g_oma.oma58 #CHI-F10019 add
         ELSE                                                              #MOD-F70146 add
            LET g_oma.oma59  = g_oma.oma54 * g_oma.oma58                   #MOD-F70146 add
            LET g_oma.oma59t = g_oma.oma54t* g_oma.oma58                   #MOD-F70146 add
         END IF                                                            #MOD-F70146 add
        #發票稅額計算
         #IF g_ooz.ooz33 = 'Y' OR g_aza.aza26 !='2' THEN #FUN-C90105 add  #FUN-E20007 mark            
        #IF g_ooz.ooz33 = 'Y' THEN                                        #FUN-E20007       #FUN-F40073 mark 
            CALL saxrp310_tax(g_oma.oma59,g_oma.oma59t,'C') 
                    RETURNING g_oma.oma59,g_oma.oma59t,g_oma.oma59x
        #END IF #FUN-C90105 add   #FUN-F40073 mark

     #-出貨/代收-
      WHEN g_oma.oma00 = '12' OR g_oma.oma00 = '19'
        #累計出貨訂單計價數量
         LET l_oeb917 = 0
         LET g_sql = "SELECT SUM(oeb917) ",   
                    #"  FROM ",cl_get_target_table(g_plant_new,'oeb_file'),       #FUN-E10006 mark 
                     "  FROM ",l_tar_oeb,                                         #FUN-E10006
                     " WHERE oeb01 = '",g_ogb.ogb31,"'"                            
         CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
         CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
         PREPARE sel_oeb_pre02 FROM g_sql
         EXECUTE sel_oeb_pre02 INTO l_oeb917  
         IF l_oeb917 IS NULL THEN LET l_oeb917 = 0 END IF
        #累計存在於其他出貨單的訂單計價數量
         LET l_ogb917 = 0
         IF g_oma.oma16 <> ' ' THEN  #CHI-CB0016
            LET g_sql = "SELECT SUM(ogb917)",
                       #"  FROM ",cl_get_target_table(g_plant_new,'oga_file'),",",  #FUN-E10006 mark 
                        "  FROM ",l_tar_oga,",",                                    #FUN-E10006
                                 #cl_get_target_table(g_plant_new,'ogb_file'),      #FUN-E10006 mark 
                                  l_tar_ogb,                                        #FUN-E10006
                        " WHERE ogb01 <> '",g_ogb.ogb01,"' AND ogb31 = '",g_ogb.ogb31,"'",
                        "   AND (oga10 IS NOT NULL AND oga10 <> ' ' ) ",   #CHI-E80048 mark   #CHI-F30074 remark
                       #"   AND oga10 < '",g_oma.oma01,"'",                #CHI-E80048 add    #CHI-F30074 mark
                        "   AND oga01 = ogb01 ",                                                    
                        "   AND ((oga09 = '2' AND oga65 = 'N') OR (oga09 IN ('3','4','8','A'))) " 
        #-CHI-CB0016-add-
         ELSE
            LET g_sql = "SELECT SUM(ogb917)",
                       #"  FROM ",cl_get_target_table(g_plant_new,'oga_file'),",",   #FUN-E10006 mark 
                        "  FROM ",l_tar_oga,",",                                     #FUN-E10006
                                 #cl_get_target_table(g_plant_new,'ogb_file'),       #FUN-E10006 mark 
                                  l_tar_ogb,                                         #FUN-E10006
                        " WHERE ogb01 NOT IN (SELECT omb31 FROM omb_file ",        
                        "                      WHERE omb01 = '",g_oma.oma01,"')", 
                        "   AND ogb31 = '",l_oea01,"'",
                        "   AND (oga10 IS NOT NULL AND oga10 <> ' ' ) ",   #CHI-E80048 mark   #CHI-F30074 remark
                       #"   AND oga10 < '",g_oma.oma01,"'",                #CHI-E80048 add    #CHI-F30074 mark
                        "   AND oga01 = ogb01 ",                                                    
                        "   AND ((oga09 = '2' AND oga65 = 'N') OR (oga09 IN ('3','4','8','A'))) " 
         END IF
        #-CHI-CB0016-end-
         CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
         CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
         PREPARE sel_ogb_pre01 FROM g_sql
         EXECUTE sel_ogb_pre01 INTO l_ogb917  
         IF l_ogb917 IS NULL THEN LET l_ogb917 = 0 END IF
        #累計本張出貨單的訂單計價數量
         LET l_sumogb917 = 0
         IF g_oma.oma16 <> ' ' THEN #CHI-CB0016
            LET g_sql = "SELECT SUM(ogb917)",
                       #"  FROM ",cl_get_target_table(g_plant_new,'oga_file'),",",       #FUN-E10006 mark 
                        "  FROM ",l_tar_oga,",",                                         #FUN-E10006
                                 #cl_get_target_table(g_plant_new,'ogb_file'),           #FUN-E10006 mark 
                                  l_tar_ogb,                                             #FUN-E10006
                        " WHERE ogb01 = '",g_ogb.ogb01,"' AND ogb31 = '",g_ogb.ogb31,"'",
                        "   AND oga01 = ogb01 ",                                                   
                        "   AND ((oga09 = '2' AND oga65 = 'N') OR (oga09 IN ('3','4','8','A'))) " 
        #-CHI-CB0016-add-
         ELSE
            LET g_sql = "SELECT SUM(ogb917)",
                       #"  FROM ",cl_get_target_table(g_plant_new,'oga_file'),",",       #FUN-E10006 mark 
                        "  FROM ",l_tar_oga,",",                                         #FUN-E10006
                                 #cl_get_target_table(g_plant_new,'ogb_file'),           #FUN-E10006 mark 
                                  l_tar_ogb,                                             #FUN-E10006
                        " WHERE ogb01 IN (SELECT omb31 FROM omb_file ",        
                        "                  WHERE omb01 = '",g_oma.oma01,"')", 
                        "   AND ogb31 = '",l_oea01,"'",
                        "   AND oga01 = ogb01 ",                                                   
                        "   AND ((oga09 = '2' AND oga65 = 'N') OR (oga09 IN ('3','4','8','A'))) " 
         END IF
        #-CHI-CB0016-end-
         CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
         CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
         PREPARE sel_ogb_pre08 FROM g_sql
         EXECUTE sel_ogb_pre08 INTO l_sumogb917  
         IF l_sumogb917  IS NULL THEN LET l_sumogb917 = 0 END IF
        #累計存在於其他出貨單的出貨訂金金額
         LET l_12_oma52 = 0
         IF g_oma.oma16 <> ' ' THEN  #CHI-CB0016
            LET g_sql = " SELECT SUM(oma52) ",
                        "   FROM oma_file ",
                       #"  WHERE oma01 IN (SELECT oma01 FROM oma_file,",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark 
                        "  WHERE oma01 IN (SELECT oma01 FROM oma_file,",l_tar_ogb,                                   #FUN-E10006 
                        "  WHERE oma16 = ogb01 ",
                        "    AND oma16 <> '",g_ogb.ogb01,"'",
                        "    AND (oma00 = '12' OR oma00 = '19')",  
                        "    AND omavoid = 'N' ", 
                        "    AND ogb31 = '",g_ogb.ogb31,"' AND omaconf = 'N')"
        #-CHI-CB0016-add-
         ELSE
            LET g_sql = " SELECT SUM(oma52) ",
                        "   FROM oma_file ",
                       #"  WHERE oma01 IN (SELECT oma01 FROM oma_file,",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark  
                        "  WHERE oma01 IN (SELECT oma01 FROM oma_file,",l_tar_ogb,                                   #FUN-E10006 
                        "                   WHERE oma16 = ogb01 ",
                        "                     AND oma16 NOT IN (SELECT omb31 FROM omb_file ",        
                        "                                        WHERE omb01 = '",g_oma.oma01,"')", 
                        "                     AND (oma00 = '12' OR oma00 = '19')",  
                        "                     AND omavoid = 'N' ", 
                        "                     AND ogb31 = '",l_oea01,"' AND omaconf = 'N')"
         END IF
        #-CHI-CB0016-end-
         CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
         CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
         PREPARE sel_ogb_pre09 FROM g_sql
         EXECUTE sel_ogb_pre09 INTO l_12_oma52
         IF l_12_oma52  IS NULL THEN LET l_12_oma52 = 0 END IF   
        #-MOD-BA0227-add-
        #EXECUTE sel_oea_pre INTO l_oea61,l_oea261,l_oea262,l_oea263          #MOD-C90145 mark
         EXECUTE sel_oea_pre INTO l_oea61,l_oea162,l_oea261,l_oea262,l_oea263 #MOD-C90145
        #----------------------MOD-BC0294----------------------start
         IF STATUS THEN     #找不到訂單，表無訂單出貨  #CHI-CB0016 remark
            LET l_oea61 = 0                            #CHI-CB0016 remark
            LET l_oea261 = 0                           #CHI-CB0016 remark
            LET l_oea262 = 0                           #CHI-CB0016 remark
            LET l_oea263 = 0                           #CHI-CB0016 remark
           #-CHI-CB0016-add-
            OPEN p310_oga_cs2
            FETCH FIRST p310_oga_cs2 INTO l_oea162 
            CLOSE p310_oga_cs2 
           #-CHI-CB0016-end-
         END IF          #CHI-CB0016 remark
        #FUN-C30296--add--str
         LET li_count = 0 
         IF g_oma.oma16 <> ' ' THEN  #CHI-CB0016
            LET g_sql = " SELECT COUNT(ogb31) ",
                       #"  FROM ",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark 
                        "  FROM ",l_tar_ogb,                                   #FUN-E10006
                        " WHERE ogb01 = '",g_ogb.ogb01,"'",
                        "   AND ogb31 IS NOT NULL"
        #-CHI-CB0016-add-
         ELSE
            LET g_sql = " SELECT COUNT(ogb31) ",
                       #"  FROM ",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark
                        "  FROM ",l_tar_ogb,                                   #FUN-E10006
                        " WHERE ogb01 IN (SELECT omb31 FROM omb_file ",        
                        "                  WHERE omb01 = '",g_oma.oma01,"')", 
                        "   AND ogb31 IS NOT NULL"
         END IF
        #-CHI-CB0016-end-
         CALL cl_replace_sqldb(g_sql) RETURNING g_sql
         CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql
         PREPARE sel_ogb31_pre FROM g_sql
         EXECUTE sel_ogb31_pre INTO li_count


         #--CHI-E40029 add start--
         LET g_sql = "SELECT omb44 ", 
                     "  FROM omb_file",
                     "  WHERE omb01 = '",g_oma.oma01,"'",
                     "  GROUP BY omb44"
         PREPARE omb44_pre FROM g_sql
         DECLARE omb44_cs CURSOR FOR omb44_pre
         #--CHI-E40029 add end--

           #IF li_count < 1 THEN                                       #MOD-C90145 mark
            IF li_count < 1 OR (l_oea262 = 0 AND l_oea162 = 100) THEN  #MOD-C90145
              #FUN-C30296--add--end
               #--CHI-E40029 add start--
               FOREACH omb44_cs INTO l_omb44
                  IF STATUS THEN
                     CALL s_errmsg('','','omb44_cs:',STATUS,1)
                     LET g_success='N'
                     EXIT FOREACH
                  END IF
                  LET l_oea262_2 = 0
                  LET l_tar_oga = cl_get_target_table(l_omb44,'oga_file')
                #--CHI-E40029 add end--
                  #-TQC-C30309-add-
                  #LET g_sql = "SELECT oga53 ",        #CHI-CB0016 mark         
                   LET g_sql = "SELECT SUM(oga53) ",   #CHI-CB0016          
                              #"  FROM ",cl_get_target_table(g_plant_new,'oga_file'), #FUN-E10006 mark
                               "  FROM ",l_tar_oga,                                   #FUN-E10006
                              #" WHERE oga01 = '",g_ogb.ogb01,"'",                    #CHI-CB0016 mark
                               " WHERE oga01 IN (SELECT omb31 FROM omb_file ",        #CHI-CB0016  
                               "                  WHERE omb01 = '",g_oma.oma01,"')",  #CHI-CB0016
                               "   AND (oga09 = '3' OR oga09 = '2' OR oga09 = '8')"   #FUN-C60036 add '8'
                   CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
                  #CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql   #CHI-E40029 mark
                   CALL cl_parse_qry_sql(g_sql,l_omb44) RETURNING g_sql       #CHI-E40029 add 
                   PREPARE sel_oga_pre FROM g_sql
                  #EXECUTE sel_oga_pre INTO l_oea262     #CHI-E40029 mark
                   EXECUTE sel_oga_pre INTO l_oea262_2   #CHI-E40029 add

                   IF cl_null(l_oea262_2) THEN           #CHI-E40029 add
                      LET l_oea262_2 = 0                 #CHI-E40029 add
                   END IF                                #CHI-E40029 add
                   LET l_oea262 = l_oea262 + l_oea262_2  #CHI-E40029 add 
                   #-TQC-C30309-end-
               END FOREACH   #CHI-E40029 add  
               #FUN-C60036--add--st
              #IF cl_null(l_oea262) THEN   #CHI-E40029 mark
               IF l_oea262 = 0 THEN        #CHI-E40029 add
                  #--CHI-E40029 add start--
                  FOREACH omb44_cs INTO l_omb44
                     IF STATUS THEN
                        CALL s_errmsg('','','omb44_cs:',STATUS,1)
                        LET g_success='N'
                        EXIT FOREACH
                     END IF
                     LET l_oea262_2 = 0
                     LET l_tar_oha = cl_get_target_table(l_omb44,'oha_file')  
                  #--CHI-E40029 add end--
                    #LET g_sql = "SELECT oha53 ",        #CHI-E40029 mark
                     LET g_sql = "SELECT SUM(oha53) ",   #CHI-E40029 add
                                #"  FROM ",cl_get_target_table(g_plant_new,'oha_file'),  #FUN-E10006 mark
                                 "  FROM ",l_tar_oha,                                    #FUN-E10006
                                #" WHERE oha01 = '",g_ogb.ogb01,"'",                     #CHI-E40029 mark
                                 " WHERE oha01 IN (SELECT omb31 FROM omb_file ",         #CHI-E40029 add 
                                 "                  WHERE omb01 = '",g_oma.oma01,"')",   #CHI-E40029 add
                                 "   AND oha09 IN ('1','4','5') "
                     CALL cl_replace_sqldb(g_sql) RETURNING g_sql
                    #CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql            #CHI-E40029 mark
                     CALL cl_parse_qry_sql(g_sql,l_omb44) RETURNING g_sql                #CHI-E40029 add
                     PREPARE sel_oga_pre_1 FROM g_sql
                    #EXECUTE sel_oga_pre_1 INTO l_oea262   #CHI-E40029 mark
                     EXECUTE sel_oga_pre_1 INTO l_oea262_2 #CHI-E40029 add

                     IF cl_null(l_oea262_2) THEN           #CHI-E40029 add
                        LET l_oea262_2 = 0                 #CHI-E40029 add
                     END IF                                #CHI-E40029 add
                     LET l_oea262 = l_oea262 + l_oea262_2  #CHI-E40029 add
                  END FOREACH   #CHI-E40029 add
               END IF
               SELECT oaz92 INTO g_oaz.oaz92 FROM oaz_file
              #IF cl_null(l_oea262) AND g_aza.aza26 = '2' AND g_oaz.oaz92 = 'Y' THEN   #CHI-E40029 mark
               IF l_oea262 = 0 AND g_aza.aza26 = '2' AND g_oaz.oaz92 = 'Y' THEN        #CHI-E40029 add
                  LET l_oea262 = g_ogb.ogb14 
               END IF 
            END IF #FUN-C30296 add--end
         IF cl_null(l_oea61) THEN LET l_oea61 = 0 END IF
         IF cl_null(l_oea261) THEN LET l_oea261 = 0 END IF
         IF cl_null(l_oea262) THEN LET l_oea262 = 0 END IF
         IF cl_null(l_oea263) THEN LET l_oea263 = 0 END IF
        #----------------------MOD-BC0294------------------------end
         LET l_oea1008 = l_oea261+l_oea262+l_oea263
        #-MOD-BA0227-end-
        #LET g_oma.oma52 = g_oma.oma50 * g_oma.oma161/100       #MOD-BA0227 mark
        #LET l_13_oma54  = g_oma.oma50  * g_oma.oma163/100      #MOD-BA0227 mark
        #LET l_13_oma54t = g_oma.oma50t * g_oma.oma163/100      #MOD-BA0227 mark
        #-MOD-BA0227-add-
         IF g_oma.oma213 = 'Y' THEN 
            LET l_oea261t = l_oea261
            LET l_oea263t = l_oea263
           #LET l_13_oma54t = g_oma.oma50t * l_oea263t / l_oea1008                 #MOD-CC0042 mark
            LET l_13_oma54t = (g_oma.oma50t +l_21_omb14t) * l_oea263t / l_oea1008  #MOD-CC0042 add
            LET l_13_oma54  = l_13_oma54t / (1+g_oma.oma211/100)
            IF l_oea261 <> l_oea1008 THEN                                         #FUN-E20007
               LET l_oea261  = l_oea261t / (1+g_oma.oma211/100)  #MOD-CC0189 mark #FUN-E20007 remark
            ELSE                                                                  #FUN-E20007
               LET l_oea261  = l_oea61                           #MOD-CC0189
            END IF                                                                #FUN-E20007
            LET l_oea263  = l_oea263t / (1+g_oma.oma211/100)
            CALL cl_digcut(l_oea261,t_azi04) RETURNING l_oea261
            CALL cl_digcut(l_oea263,t_azi04) RETURNING l_oea263
         ELSE
           #LET l_13_oma54  = g_oma.oma50 * l_oea263 / l_oea61                  #MOD-CC0042 mark
            LET l_13_oma54  = (g_oma.oma50 + l_21_omb14) * l_oea263 / l_oea61   #MOD-CC0042 add
            LET l_13_oma54t = l_13_oma54 * (1+g_oma.oma211/100)
            LET l_oea261t = l_oea261 * (1+g_oma.oma211/100)
            LET l_oea263t = l_oea263 * (1+g_oma.oma211/100)
            CALL cl_digcut(l_oea261t,t_azi04) RETURNING l_oea261t
            CALL cl_digcut(l_oea263t,t_azi04) RETURNING l_oea263t
         END IF
        #FUN-C90105--mod--str
        #LET g_oma.oma52 = g_oma.oma50 * l_oea261 / l_oea61   #訂金金額一律以未稅計算
       #--MOD-F70067 mark start--
       # IF g_ooz.ooz33 = 'N' THEN									
       #    LET g_oma.oma52 = g_oma.oma50t * l_oea261t /(l_oea61*(1+g_oma.oma211/100))   #訂金金額一律以含稅計算
       # ELSE									
       #    LET g_oma.oma52 = g_oma.oma50 * l_oea261 / l_oea61   #訂金金額一律以未稅計算
       # END IF 
       ##FUN-C90105--mod--end
       #--MOD-F70067 mark end-- 
       #LET g_oma.oma52 = g_oma.oma50 * l_oea261 / l_oea61   #MOD-F70067 add   #MOD-G50151 mark
       #--MOD-G50151 add start--
       IF g_ooz.ooz33 = 'N' THEN
          IF g_oma.oma213 = 'Y' THEN
             LET g_oma.oma52 = g_oma.oma50t * l_oea261t /(l_oea61*(1+g_oma.oma211/100))
          ELSE
             LET g_oma.oma52 = g_oma.oma50 * l_oea261 / l_oea61
          END IF
       ELSE
          LET g_oma.oma52 = g_oma.oma50 * l_oea261 / l_oea61
       END IF
       #--MOD-G50151 add end--
         CALL cl_digcut(g_oma.oma52,t_azi04) RETURNING g_oma.oma52    
        #-MOD-BA0227-end-
         CALL cl_digcut(l_13_oma54,t_azi04) RETURNING l_13_oma54 
         CALL cl_digcut(l_13_oma54t,t_azi04) RETURNING l_13_oma54t 
        #累計出貨訂單的預收待抵淨額
         LET l_oma54  = 0  
         IF g_oma.oma16 <> ' ' THEN #CHI-CB0016
            LET g_sql = "SELECT SUM(oma54t-oma55)",
                        "  FROM oma_file ",
                       #" WHERE oma16 IN (SELECT ogb31 FROM ",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark
                        " WHERE oma16 IN (SELECT ogb31 FROM ",l_tar_ogb,                                   #FUN-E10006
                        "                  WHERE ogb01 = '",g_ogb.ogb01,"')",
                        "   AND oma00='23'"
        #-CHI-CB0016-add-
         ELSE
            LET g_sql = "SELECT SUM(oma54t-oma55)",
                        "  FROM oma_file ",
                       #" WHERE oma16 IN (SELECT ogb31 FROM ",cl_get_target_table(g_plant_new,'ogb_file'), #FUN-E10006 mark
                        " WHERE oma16 IN (SELECT ogb31 FROM ",l_tar_ogb,                                   #FUN-E10006
                        "                  WHERE ogb01 IN (SELECT omb31 FROM omb_file ",       
                        "                                   WHERE omb01 = '",g_oma.oma01,"'))", 
                        "   AND oma00='23'"
         END IF
        #-CHI-CB0016-end-
         CALL cl_replace_sqldb(g_sql) RETURNING g_sql      	
         CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql 
         PREPARE sel_oma_23_pre FROM g_sql
         EXECUTE sel_oma_23_pre INTO l_oma54
         IF l_oma54 IS NULL THEN LET l_oma54 = 0 END IF   

        #-TQC-E80012-mark-
        #IF l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917 THEN 
        #   LET g_oma.oma52 = l_oma54 - l_12_oma52    #原幣訂金       
        #END IF
        #-TQC-E80012-end-
         LET l_sumoea261 = 0   LET l_sumoea263   =0
         EXECUTE sel_oea26x_pre INTO l_sumoea261,l_sumoea263
         IF cl_null(l_sumoea261) THEN LET l_sumoea261=0 END IF
         IF cl_null(l_sumoea263) THEN LET l_sumoea263=0 END IF
        #-MOD-BA0227-add-
         IF g_oma.oma213 = 'Y' THEN 
            LET l_sumoea263t = l_sumoea263
            LET l_sumoea263  = l_sumoea263t / (1+g_oma.oma211/100)
         ELSE
            LET l_sumoea263t = l_sumoea263 * (1+g_oma.oma211/100)
         END IF
         CALL cl_digcut(l_sumoea263,t_azi04) RETURNING l_sumoea263
         CALL cl_digcut(l_sumoea263t,t_azi04) RETURNING l_sumoea263t
        #-MOD-BA0227-end- 

         LET l_oea263_1 = 0   LET l_oea263_1t = 0
         LET l_oea263_2 = 0   LET l_oea263_2t = 0
         LET l_oma52    = 0 
        #出貨單->訂單,再查這張訂單分幾張出貨單出貨,扣掉之前出貨所佔的尾款,剩下的歸最後一次出貨單
        #ex:原始訂單金額5800,尾款比率10%=>所以尾款金額是580
        #   第一次出貨金額5000,其中尾款佔5000*10%=500
        #   第二次出貨金額1000(有超交),此時尾款應該是580-第一次出貨單的尾款500=80
        #EXECUTE sel_oea26x_1_pre INTO l_oea263_1,l_oea263_1t,l_oea263_2,l_oea263_2t,l_oma52 #MOD-BB0077 mark
         EXECUTE sel_oea26x_1_pre INTO l_oea263_1,l_oea263_1t,l_oea263_2,l_oea263_2t         #MOD-BB0077
         IF cl_null(l_oea263_1)  THEN LET l_oea263_1  = 0 END IF
         IF cl_null(l_oea263_1t) THEN LET l_oea263_1t = 0 END IF
         IF cl_null(l_oea263_2)  THEN LET l_oea263_2  = 0 END IF
         IF cl_null(l_oea263_2t) THEN LET l_oea263_2t = 0 END IF
        #IF cl_null(l_oma52) THEN LET l_oma52=0 END IF   #MOD-BB0077 mark
        #-MOD-C90173-add-
         IF g_oma.oma213 = 'Y' THEN
            LET l_oea263_1t = l_oea263_1t * l_oea263t / l_oea1008
            LET l_oea263_2t = l_oea263_2t * l_oea263t / l_oea1008
            LET l_oea263_1  = l_oea263_1t / (1+g_oma.oma211/100)
            LET l_oea263_2  = l_oea263_2t / (1+g_oma.oma211/100)
         ELSE
            LET l_oea263_1 = l_oea263_1 * l_oea263 / l_oea61
            LET l_oea263_2 = l_oea263_2 * l_oea263 / l_oea61
            LET l_oea263_1t = l_oea263_1 * (1+g_oma.oma211/100)
            LET l_oea263_2t = l_oea263_2 * (1+g_oma.oma211/100)
         END IF
         CALL cl_digcut(l_oea263_1t,t_azi04) RETURNING l_oea263_1t
         CALL cl_digcut(l_oea263_1,t_azi04) RETURNING l_oea263_1
         CALL cl_digcut(l_oea263_2t,g_azi04) RETURNING l_oea263_2t
         CALL cl_digcut(l_oea263_2,g_azi04) RETURNING l_oea263_2
        #-MOD-C90173-end-
        #-MOD-BB0077-add- 
         LET l_sumoma54 = 0   LET l_sumoma54t = 0
         LET l_sumoma56 = 0   LET l_sumoma56t = 0
         EXECUTE sel_oea26x_2_pre INTO l_sumoma54,l_sumoma54t,l_sumoma56,l_sumoma56t,l_oma52
         IF cl_null(l_sumoma54)  THEN LET l_sumoma54  = 0 END IF
         IF cl_null(l_sumoma54t) THEN LET l_sumoma54t = 0 END IF
         IF cl_null(l_sumoma56)  THEN LET l_sumoma56  = 0 END IF
         IF cl_null(l_sumoma56t) THEN LET l_sumoma56t = 0 END IF
         IF cl_null(l_oma52) THEN LET l_oma52 = 0 END IF
         LET l_oea263_1  = l_oea263_1  - l_sumoma54
         LET l_oea263_1t = l_oea263_1t - l_sumoma54t
         LET l_oea263_2  = l_oea263_2  - l_sumoma56
         LET l_oea263_2t = l_oea263_2t - l_sumoma56t
        #-MOD-BB0077-end- 
         IF l_oea263 > 0 THEN   #MOD-BB0077
           #IF l_sumoea263-l_oea263_1 < cl_digcut((g_oma.oma50*g_oma.oma163/100),t_azi04) THEN  #MOD-BA0227 mark 
            IF l_sumoea263-l_oea263_1 < cl_digcut((g_oma.oma50*l_oea263/l_oea61),t_azi04) THEN  #MOD-BA0227
               LET l_13_oma54 = l_sumoea263-l_oea263_1
            ELSE
              #LET l_13_oma54 = cl_digcut((g_oma.oma50*g_oma.oma163/100),t_azi04)  #MOD-BA0227 mark
              #LET l_13_oma54 = cl_digcut((g_oma.oma50*l_oea263/l_oea61),t_azi04)               #MOD-BA0227 #MOD-CC0042 mark
               LET l_13_oma54 = cl_digcut(((g_oma.oma50+l_21_omb14)*l_oea263/l_oea61),t_azi04)  #MOD-CC0042 add
            END IF
        ####IF l_sumoea263-l_oea263_1t < cl_digcut((g_oma.oma50t*g_oma.oma163/100),t_azi04) THEN     #MOD-BA0227 mark
            IF l_sumoea263t-l_oea263_1t < cl_digcut((g_oma.oma50t*l_oea263t/l_oea1008),t_azi04) THEN #MOD-BA0227
               LET l_13_oma54t = l_sumoea263t-l_oea263_1t
            ELSE
              #LET l_13_oma54t = cl_digcut((g_oma.oma50t*g_oma.oma163/100),t_azi04)    #MOD-BA0227 mark
              #LET l_13_oma54t = cl_digcut((g_oma.oma50t*l_oea263t/l_oea1008),t_azi04)                #MOD-BA0227 #MOD-CC0042 mark
               LET l_13_oma54t = cl_digcut(((g_oma.oma50t+l_21_omb14t)*l_oea263t/l_oea1008),t_azi04)  #MOD-CC0042 add
            END IF
         END IF   #MOD-BB0077
         IF cl_null(l_13_oma54)  THEN LET l_13_oma54  = 0 END IF   #MOD-BA0227 
         IF cl_null(l_13_oma54t) THEN LET l_13_oma54t = 0 END IF   #MOD-BA0227 
         #--CHI-E90043 add start--
         IF g_ooz.ooz33 = 'N' THEN
            LET l_sumoea261 = l_sumoea261 * (1 + g_oma.oma211/100)
         END IF
         #--CHI-E90043 add end--
         LET l_amt1 = l_sumoea261-l_oma52                               #TQC-DB0012
         LET l_amt2 = l_oma54 - l_12_oma52                              #TQC-DB0012
         LET l_amt3 = cl_digcut((g_oma.oma50*l_oea261/l_oea61),t_azi04) #TQC-DB0012
        #IF l_sumoea261-l_oma52 < cl_digcut((g_oma.oma50*g_oma.oma161/100),t_azi04) THEN                             #MOD-BA0227 mark
        #IF l_sumoea261-l_oma52 < cl_digcut((g_oma.oma50*l_oea261/l_oea61),t_azi04) THEN                             #CHI-D80004 mark  #MOD-BA0227
        #IF (l_sumoea261-l_oma52 OR l_oma54 - l_12_oma52) < cl_digcut((g_oma.oma50*l_oea261/l_oea61),t_azi04) THEN   #CHI-D80004 #TQC-DB0012 mark
         IF (l_amt1 < l_amt3) OR (l_amt2 < l_amt3) THEN   #TQC-DB0012
            IF l_sumoea261-l_oma52 < l_oma54 - l_12_oma52 THEN
               LET g_oma.oma52 = l_sumoea261-l_oma52    #原幣訂金
            ELSE
               LET g_oma.oma52 = l_oma54 - l_12_oma52
            END IF
         #TQC-E90010 mark (begin)
         #ELSE
         #  #LET g_oma.oma52 = g_oma.oma50 * g_oma.oma161/100    #MOD-BA0227 mark
         #  #LET g_oma.oma52 = g_oma.oma50 * l_oea261 / l_oea61  #MOD-BA0227       #MOD-E70013 mark
         #   LET g_oma.oma52 = g_oma.oma52/(1+g_oma.oma211/100)                    #MOD-E70013 add
         #TQC-E90010 mark (end)
         END IF
         IF g_check = 'Y' THEN
            LET g_oma.oma52 = 0
         END IF
         CALL cl_digcut(g_oma.oma52,t_azi04) RETURNING g_oma.oma52   
        #--------------------------------CHI-C10018----------------------------------(S)
         IF g_ooz.ooz65 = 'Y' THEN
            LET l_cnt = 0
            IF g_oma.oma16 <> ' ' THEN #CHI-CB0016
               LET g_sql = "SELECT COUNT(*) ",
                     #"       FROM ",cl_get_target_table(g_plant_new,'oha_file'),",", #FUN-E10006 mark
                      "       FROM ",l_tar_oha,",",                                   #FUN-E10006
                                    #cl_get_target_table(g_plant_new,'ohb_file'),",", #FUN-E10006 mark
                                     l_tar_ohb,",",                                   #FUN-E10006
                                    #cl_get_target_table(g_plant_new,'oay_file'),     #FUN-E10006 mark
                                     l_tar_oay,                                       #FUN-E10006
                      "      WHERE oha01 = '",g_ogb.ogb01,"'",
                      "        AND oha01=ohb01 ",
                      "        AND ohaconf='Y' ",
                      "        AND oha01 LIKE trim(oayslip)||'-%' AND oay11='Y'",
                      "        AND oha09 IN ('1','4','5') AND ohapost='Y'"
           #-CHI-CB0016-add-
            ELSE
	       LET g_sql = "SELECT COUNT(*) ", 
                     #"       FROM ",cl_get_target_table(g_plant_new,'oha_file'),",", #FUN-E10006 mark
                      "       FROM ",l_tar_oha,",",                                   #FUN-E10006
                                    #cl_get_target_table(g_plant_new,'ohb_file'),",", #FUN-E10006 mark
                                     l_tar_ohb,",",                                   #FUN-E10006
                                    #cl_get_target_table(g_plant_new,'oay_file'),     #FUN-E10006 mark
                                     l_tar_oay,                                       #FUN-E10006
                      "      WHERE oha01 IN (SELECT omb31 FROM omb_file ",       
                      "                       WHERE omb01 = '",g_oma.oma01,"')", 
                      "        AND oha01=ohb01 ", 
                      "        AND ohaconf='Y' ",
                      "        AND oha01 LIKE trim(oayslip)||'-%' AND oay11='Y'",
                      "        AND oha09 IN ('1','4','5') AND ohapost='Y'"
            END IF
           #-CHI-CB0016-end-
            CALL cl_replace_sqldb(g_sql) RETURNING g_sql              #FUN-A50102
            CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql  #FUN-A50102
            PREPARE p310bu_21_p FROM g_sql
            EXECUTE p310bu_21_p INTO l_cnt
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
         END IF

        #--------------------------------CHI-C10018----------------------------------(E)
       #IF g_oma.oma00 = '12' THEN                                      #MOD-C20078 mark
       #IF g_oma.oma00 = '12' AND l_oea262 <> 0 THEN                    #MOD-C20078 add          #TQC-C70227 mark
       #IF g_oma.oma00 = '12' AND (l_oea262 <> 0 OR (g_azw.azw04 = '2' AND g_occ73 = 'Y')) THEN  #TQC-C70227#CHI-C10018 mark
        #IF g_oma.oma00 = '12' AND (l_oea262 <> 0 OR (g_azw.azw04 = '2' AND g_occ73 = 'Y')        #CHI-C10018 add
        IF g_oma.oma00 = '12' AND (l_oea262 <> 0 OR (g_oaz92 = 'Y' AND g_aza.aza26 = '2')        #MOD-D60020
                                  OR l_cnt > 0 )  THEN     #CHI-C10018 add 

           #TQC-E10010 add start -----
            IF g_oma.oma19 <> ' ' THEN
               LET l_rxx04_01 = 0
              #TQC-E30026 mark start -----
              #LET g_sql = "SELECT SUM(rxx04) ",
              #            "  FROM ",l_tar_rxx,
              #            " WHERE rxx01 = '",g_oma.oma19,"' AND rxx03 = '1'",
              #            "   AND rxx00 = '01'"
              #IF g_oma.oma213 = 'N' THEN
              #   LET g_sql = g_sql,"   AND rxx02 NOT IN ('04','07','09') "
              #END IF
              #CALL cl_replace_sqldb(g_sql) RETURNING g_sql
              #CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql
              #PREPARE sel_rxx_pre49 FROM g_sql
              #EXECUTE sel_rxx_pre49 INTO l_rxx04_01
              #TQC-E30026 mark end   -----
             #--FUN-F40073 mark start--
             ##TQC-E30026 add start -----
             # SELECT SUM(oma52) INTO l_rxx04_01 FROM oma_file  
             #  WHERE oma01 = g_oma.oma19 AND oma00 = '23'
             ##TQC-E30026 add end   -----
             #--FUN-F40073 mark end--

             #--FUN-F40073 add sart--
              SELECT SUM(oma54t) INTO l_rxx04_01 
                FROM oma_file
               WHERE oma16 = g_oma.oma19
                 AND oma00 = '23'
             #--FUN-F40073 add end--
            END IF
            IF cl_null(l_rxx04_01) THEN
               LET l_rxx04_01 = 0
            END IF

            IF g_oma.oma16 <> ' ' THEN
               LET l_rxx04_02 = 0
               LET g_sql = "SELECT SUM(rxx04) ",
                           "  FROM ",l_tar_rxx,
                           " WHERE rxx01 = '",g_oma.oma16,"' AND rxx03 = '1'",
                           "   AND rxx00 = '02'"
               IF g_oma.oma213 = 'N' THEN
                  LET g_sql = g_sql,"   AND rxx02 NOT IN ('04','07','09') "
               END IF
               CALL cl_replace_sqldb(g_sql) RETURNING g_sql
               CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql
               PREPARE sel_rxx_pre50 FROM g_sql
               EXECUTE sel_rxx_pre50 INTO l_rxx04_02
            END IF
            IF cl_null(l_rxx04_02) THEN
               LET l_rxx04_02 = 0
            END IF

            LET l_cnt = 0
            LET l_mTax = FALSE     #TQC-E90008 mark     #TQC-E90010 unmark
            #SELECT COUNT(*) INTO l_cnt FROM ogh_file WHERE ogh01 = g_oma.oma16    #MOD-E90117 mark
           #SELECT COUNT(*) INTO l_cnt FROM ogh_file WHERE ogh01 = g_ogb.ogb01     #MOD-E90117 modify   #FUN-F40073 mark
            #--FUN-F40073 add start--
            SELECT COUNT(*) INTO l_cnt 
              FROM ogi_file 
             WHERE ogi01 = g_ogb.ogb01
            #--FUN-F40073 add end--
            IF l_cnt > 0 THEN
               LET l_mTax = TRUE
            END IF

            #--MOD-E70013 add start--
            LET l_sumomb14t = 0 
            SELECT SUM(omb14),SUM(omb14t) INTO l_sumomb14,l_sumomb14t
              FROM omb_file
             WHERE omb01 = g_oma.oma01 
            IF l_sumomb14  IS NULL THEN LET l_sumomb14  = 0 END IF 
            IF l_sumomb14t IS NULL THEN LET l_sumomb14t = 0 END IF
            #--MOD-E70013 add end--

            #--MOD-F90076 add start--
            LET g_sql = "SELECT COUNT(*) ",     
               "  FROM ",l_tar_oeb,                                    
               " WHERE oeb01 = '",g_ogb.ogb31,"'"
            CALL cl_replace_sqldb(g_sql) RETURNING g_sql
            CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql
            PREPARE sel_oea_pre2 FROM g_sql 
            EXECUTE sel_oea_pre2 INTO l_oea_cnt

            SELECT COUNT(*) INTO l_omb_cnt
              FROM omb_file
             WHERE omb01 = g_oma.oma01 

            LET l_flag2 = 'N' 
            #axrs010 有設定內/外銷應收單身最大筆數
            IF l_oea_cnt > l_omb_cnt AND ((g_oma.oma08 = '1' AND l_omb_cnt <= g_ooz.ooz121)  OR
                                          (g_oma.oma08 = '2' AND l_omb_cnt <= g_ooz.ooz122)) THEN 
               LET l_flag2 = 'Y'
            END IF
            #--MOD-F90076 add end--

           #-TQC-E80012-add-
           #IF l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917 THEN                            #MOD-F70120 mark
           #IF (l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917) AND g_ooy.ooy10 <> 'Y' THEN   #MOD-F70120 add   #MOD-F90076 mark
            IF (l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917)   #MOD-F90076 add
               AND g_ooy.ooy10 <> 'Y' AND l_flag2 = 'N' THEN                 #MOD-F90076 add
               LET g_oma.oma52 = l_oma54 - l_12_oma52    #原幣訂金      
               IF g_ooz.ooz33 = 'N' THEN     #TQC-E90010 add 
                  LET g_oma.oma52 = g_oma.oma52 / (1+g_oma.oma211/100)   #MOD-EC0033 remark     
                 #LET g_oma.oma52 = l_12_oma52 / (1+g_oma.oma211/100)    #MOD-EC0033 mark 
               END IF                        #TQC-E90010 add
               CALL cl_digcut(g_oma.oma52,t_azi04) RETURNING g_oma.oma52  
            #--MOD-I40012 add start--
            ELSE
               IF g_ooz.ooz33 = 'N' AND g_oma.oma213 = 'Y' THEN
                  LET g_oma.oma52 = g_oma.oma52 / (1+g_oma.oma211/100)
                  CALL cl_digcut(g_oma.oma52,t_azi04) RETURNING g_oma.oma52
               END IF
            #--MOD-I40012 add end--      
            END IF
           #-TQC-E80012-end-

            IF NOT l_mTax THEN 
           #TQC-E10010 add end   -----
               LET g_oma.oma54 = g_oma.oma50 - g_oma.oma52 - l_13_oma54
               #--MOD-E70013 add start--
              #LET l_oma54 = g_oma.oma52 + g_oma.oma54 + l_13_oma54        #TQC-E80012 mark    
               LET l_diff_oma54 = g_oma.oma52 + g_oma.oma54 + l_13_oma54   #TQC-E80012       
              #CALL cl_digcut(l_oma54,t_azi04) RETURNING l_oma54           #TQC-E80012 mark
               CALL cl_digcut(l_diff_oma54,t_azi04) RETURNING l_diff_oma54 #TQC-E80012 
              #LET l_oma54 = l_oma54 - l_sumomb14              #TQC-E80012 mark
               LET l_diff_oma54 = l_diff_oma54 - l_sumomb14    #TQC-E80012
              #IF l_oma54 <> 0 AND g_oma.oma24 = 1 THEN        #TQC-E80012 mark
               IF l_diff_oma54 <> 0 AND g_oma.oma24 = 1 THEN   #TQC-E80012
                 #LET g_oma.oma54 = g_oma.oma54 - l_oma54      #TQC-E80012 mark
                  LET g_oma.oma54 = g_oma.oma54 - l_diff_oma54 #TQC-E80012
               END IF
               #--MOD-E70013 add end--
               IF g_ooz.ooz33 = 'N' THEN #CHI-E90043 add  #TQC-EA0022 mark  #MOD-F70067 remark 
              #IF g_ooz.ooz33 = 'Y' THEN #TQC-EA0022 add  #MOD-F10100 mark  #MOD-F60095 remark   #MOD-F70067 mark
                  LET l_oma52t = g_oma.oma52 * (1+g_oma.oma211/100) 
               ELSE                           #CHI-E90043 add                          #MOD-F10100 mark  #MOD-F60095 remark
                  #--MOD-FC0038 add start--
                  IF g_oma.oma213 = 'Y' THEN
                     LET l_oma52t = g_oma.oma52 * (1+g_oma.oma211/100)
                     CALL cl_digcut(l_oma52t,t_azi04) RETURNING l_oma52t
                    #LET l_amt4 = l_oma52t - l_amt1                                        #MOD-G30038 mark
                     LET l_sumamt1 = cl_digcut(g_oma.oma50t * l_oea261 / l_oea61,t_azi04)  #MOD-G30038 add
                     LET l_amt4 = l_oma52t - l_sumamt1                                     #MOD-G30038 add
                     IF l_amt4 <> 0 AND g_oma.oma24 = 1 THEN
                        LET l_oma52t = l_oma52t - l_amt4
                     END IF
                  ELSE
                  #--MOD-FC0038 add end--
                     LET l_oma52t = g_oma.oma52  #CHI-E90043 add                          #MOD-F10100 mark  #MOD-F60095 remark
                  END IF   #MOD-FC0038 add
               END IF                         #CHI-E90043 add                          #MOD-F10100 mark  #MOD-F60095 remark
               CALL cl_digcut(l_oma52t,t_azi04) RETURNING l_oma52t
              #LET g_oma.oma54t= g_oma.oma50t - l_oma52t - l_13_oma54t   #MOD-F60095 mark
              #LET g_oma.oma54t= cl_digcut(g_oma.oma54*(1+g_oma.oma211/100),g_azi04)   #MOD-F60095 add   #MOD-F80084 mark 
               LET g_oma.oma54t= cl_digcut(g_oma.oma54*(1+g_oma.oma211/100),t_azi04)                     #MOD-F80084 add   
               #--MOD-E70013 add start--
               LET l_oma54t = l_oma52t + g_oma.oma54t + l_13_oma54t  
               CALL cl_digcut(l_oma54t,t_azi04) RETURNING l_oma54t  
               LET l_oma54t = l_oma54t - l_sumomb14t
               IF l_oma54t <> 0 AND g_oma.oma24 = 1 THEN
                  LET g_oma.oma54t = g_oma.oma54t - l_oma54t
               END IF
               #--MOD-E70013 add end--
           #TQC-E10010 add start -----
            ELSE
               LET g_oma.oma52 = l_rxx04_01 
              #--MOD-G30003 mark start--
              #   IF g_oma.oma213 = 'Y' THEN
              #     #LET g_oma.oma54t = l_rxx04_02                 #FUN-F40073 mark
              #      LET g_oma.oma54t = l_rxx04_02 - g_oma.oma52   #FUN-F40073 add
              #      LET g_oma.oma54 = g_oma.oma54t/(1+ g_oma.oma211/100)
              #   ELSE
              #      LET g_oma.oma54 = l_rxx04_02
              #      LET g_oma.oma54t = g_oma.oma54t*(1+ g_oma.oma211/100) 
              #   END IF
              #--MOD-G30003 mark end--
              #--MOD-G30003 add start--
              LET g_oma.oma54 = 0
              LET g_oma.oma54t = 0
              SELECT SUM(oml08),SUM(oml08t) INTO g_oma.oma54,g_oma.oma54t
                FROM oml_file
               WHERE oml01 = g_oma.oma01
              IF cl_null(g_oma.oma54) THEN LET g_oma.oma54 = 0 END IF
              IF cl_null(g_oma.oma54t) THEN LET g_oma.oma54t = 0 END IF
              LET g_oma.oma54t = g_oma.oma54t - g_oma.oma52
              #--MOD-G30003 add end--
            END IF
           #TQC-E10010 add end   -----
           #FUN-C90105--add--str
            #IF g_ooz.ooz33 = 'N' AND g_aza.aza26 = '2' THEN   #FUN-E20007 mark
           #IF g_ooz.ooz33 = 'N' THEN                          #FUN-E20007 #TQC-E30026 mark
               IF g_ooz.ooz33 = 'N' AND NOT l_mTax THEN           #TQC-E30026 add
                  LET g_oma.oma52 = g_oma.oma50t * l_oea261t /(l_oea61*(1+g_oma.oma211/100))
                 #-TQC-E80012-add-
                 #IF l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917 THEN   #MOD-F70120 mark
                 #IF (l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917) AND g_ooy.ooy10 <> 'Y' THEN  #MOD-F70120 add   #MOD-F90076 mark
                  IF (l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917)   #MOD-F90076 add
                     AND g_ooy.ooy10 <> 'Y' AND l_flag2 = 'N' THEN                 #MOD-F90076 add
                     LET g_oma.oma52 = l_oma54 - l_12_oma52    #原幣訂金       
                  END IF
                 #-TQC-E80012-end-
                  CALL cl_digcut(g_oma.oma52,t_azi04) RETURNING g_oma.oma52
                  LET g_oma.oma54x = g_oma.oma52 + g_oma.oma54t - ((g_oma.oma52 +g_oma.oma54t)/(1+g_oma.oma211/100)) 
                  CALL cl_digcut(g_oma.oma54x,t_azi04) RETURNING g_oma.oma54x
                  LET g_oma.oma54 = g_oma.oma54t-g_oma.oma54x
                  CALL cl_digcut(g_oma.oma54,t_azi04) RETURNING g_oma.oma54
               ELSE   
              #FUN-C90105--add--end
                  IF NOT l_mTax THEN   #FUN-F40073 add    
                  #原幣稅額計算
                     CALL saxrp310_tax(g_oma.oma54,g_oma.oma54t,'A')    #MOD-BA0227 mod 'B' -> 'A'
                             RETURNING g_oma.oma54,g_oma.oma54t,g_oma.oma54x
                  END IF   #FUN-F40073 add
               END IF #FUN-C90105 add  
         ELSE
            LET g_oma.oma54 = 0
            LET g_oma.oma54x = 0
            LET g_oma.oma54t = g_oma.oma73f
         END IF
        #-TQC-E80012-add-
        #IF l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917 THEN                            #MOD-F70120 mark
        #IF (l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917) AND g_ooy.ooy10 <> 'Y' THEN   #MOD-F70120 add   #MOD-F90076 mark
         IF (l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917)   #MOD-F90076 add
            AND g_ooy.ooy10 <> 'Y' AND l_flag2 = 'N' THEN                 #MOD-F90076 add 
            LET g_oma.oma52 = l_oma54 - l_12_oma52    #原幣訂金       
         END IF
        #-TQC-E80012-end-
        #TQC-E10010 add start -----
         LET g_oma.oma54x = g_oma.oma54t - g_oma.oma54
         CALL cl_digcut(g_oma.oma52,t_azi04) RETURNING g_oma.oma52
         CALL cl_digcut(g_oma.oma54,t_azi04) RETURNING g_oma.oma54
         CALL cl_digcut(g_oma.oma54t,t_azi04) RETURNING g_oma.oma54t
         CALL cl_digcut(g_oma.oma54x,t_azi04) RETURNING g_oma.oma54x
        #TQC-E10010 add end   -----
        #本幣計算
         LET g_oma.oma53 = g_oma.oma52 * g_oma.oma24            
         #FUN-C90105--add--str
         #IF g_ooz.ooz33 = 'N' AND g_aza.aza26 = '2' THEN   #FUN-E20007 mark
        #IF g_ooz.ooz33 = 'N' THEN                          #FUN-E20007 #TQC-E30026 mark
         IF g_ooz.ooz33 = 'N' AND NOT l_mTax THEN           #TQC-E30026 add  
            LET g_oma.oma53 = g_oma.oma53/(1+g_oma.oma211/100)  
           #--CHI-E90043 mark start-- 
           #IF g_oma.oma213 = 'N' THEN 
           #   LET g_oma.oma53 = g_oma.oma53/(1+g_oma.oma211/100)
           #END IF
           #--CHI-E90043 mark end--  
         END IF    
         #FUN-C90105--add--end

         #--MOD-G40118 add start--
         IF g_oma.oma213 = 'N' THEN
            LET l_oea1008_2 = l_oea1008 * (1+g_oma.oma211/100)
            CALL cl_digcut(l_oea1008_2,t_azi04) RETURNING l_oea1008_2   #MOD-G80011 add 
         ELSE                                                           #MOD-G80011 add
            LET l_oea1008_2 = l_oea1008                                 #MOD-G80011 add
         END IF
         #--MOD-G40118 add end--

         #FUN-E20007  --Begin
        #IF g_ooz.ooz33 = 'N' AND g_oma.oma161 = 100 THEN                                #MOD-G30169 mark
           #LET g_oma.oma52 = g_oma.oma50t * l_oea261t /(l_oea61*(1+g_oma.oma211/100))   #MOD-G30169 mark
           #CALL cl_digcut(g_oma.oma52,t_azi04) RETURNING g_oma.oma52                    #MOD-G30169 mark
        #IF g_ooz.ooz33 = 'N' AND (l_oea261t = l_oea1008) THEN   #訂金100%               #MOD-G30169 add   #MOD-G40118 mark
         IF g_ooz.ooz33 = 'N' AND (l_oea261t = l_oea1008_2) THEN #訂金100%                                 #MOD-G40118 add            
            LET g_oma.oma52 = g_oma.oma50t                                               #MOD-G30169 add
         END IF
         #FUN-E20007  --End
        #-MOD-BA0227-add-
         LET l_oma53t = 0
         LET l_oma53t = g_oma.oma53 * (1+g_oma.oma211/100) 
         IF cl_null(l_oma53t) THEN LET l_oma53t = 0 END IF
        #-MOD-BA0227-end-
        #TQC-E10010 mark start -----
        #IF g_check = 'Y' THEN
        #   LET g_oma.oma53 = 0
        #   LET l_oma53t = 0      #MOD-BA0227
        #END IF
        #TQC-E10010 mark end  -----
         CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53   
         CALL cl_digcut(l_oma53t,g_azi04) RETURNING l_oma53t          #MOD-BA0227 
        #單頭本幣與單身本幣尾差調整
         LET l_sumomb16 = 0    LET l_sumomb16t = 0
         SELECT SUM(omb16),SUM(omb16t) INTO l_sumomb16,l_sumomb16t
           FROM omb_file
          WHERE omb01 = g_oma.oma01 
         IF l_sumomb16  IS NULL THEN LET l_sumomb16  = 0 END IF
         IF l_sumomb16t IS NULL THEN LET l_sumomb16t = 0 END IF

        #-MOD-BB0082-mark-可省略,此變數可沿用不須重新抓取
        #LET l_sumoea261  =0   LET l_sumoea263   =0
        #EXECUTE sel_oea26x_pre INTO l_sumoea261,l_sumoea263
        #IF cl_null(l_sumoea261) THEN LET l_sumoea261=0 END IF
        #IF cl_null(l_sumoea263) THEN LET l_sumoea263=0 END IF
        #LET l_sumoea263 = cl_digcut(l_sumoea263*g_oma.oma24,g_azi04)        
        #
        #LET l_oea263_1 = 0   LET l_oea263_1t = 0
        #LET l_oea263_2 = 0   LET l_oea263_2t = 0
        #LET l_oma52    = 0  
        #出貨單->訂單,再查這張訂單分幾張出貨單出貨,扣掉之前出貨所佔的尾款,剩下的歸最後一次出貨單
        #ex:原始訂單金額5800,尾款比率10%=>所以尾款金額是580
        #   第一次出貨金額5000,其中尾款佔5000*10%=500
        #   第二次出貨金額1000(有超交),此時尾款應該是580-第一次出貨單的尾款500=80
        #EXECUTE sel_oea26x_1_pre INTO l_oea263_1,l_oea263_1t,l_oea263_2,l_oea263_2t,l_oma52
        #IF cl_null(l_oea263_1) THEN LET l_oea263_1=0 END IF
        #IF cl_null(l_oea263_1t) THEN LET l_oea263_1t=0 END IF
        #IF cl_null(l_oea263_2) THEN LET l_oea263_2=0 END IF
        #IF cl_null(l_oea263_2t) THEN LET l_oea263_2t=0 END IF
        #IF cl_null(l_oma52) THEN LET l_oma52=0 END IF
        #-MOD-BB0082-end-
         LET l_sumoea263  = cl_digcut(l_sumoea263*g_oma.oma24,g_azi04)  #MOD-BB0082 
         LET l_sumoea263t = cl_digcut(l_sumoea263*(1+g_oma.oma211/100),g_azi04)  #MOD-BA0227

         IF l_oea263 > 0 THEN   #MOD-BB0077
           #l_sumomb16跟l_sumomb16t要考慮有使用尾款使用比率的情況
           #IF l_sumoea263-l_oea263_2 < cl_digcut((l_sumomb16*g_oma.oma163/100),g_azi04) THEN #MOD-BA0227 mark
            IF l_sumoea263-l_oea263_2 < cl_digcut((l_sumomb16*l_oea263/l_oea61),g_azi04) THEN #MOD-BA0227
               LET l_13_oma56 = l_sumoea263-l_oea263_2
            ELSE
              #LET l_13_oma56 = cl_digcut((l_sumomb16*g_oma.oma163/100),g_azi04) #MOD-BA0227 mark
              #LET l_13_oma56 = cl_digcut((l_sumomb16*l_oea263/l_oea61),g_azi04)               #MOD-BA0227 #MOD-CC0042 mark
               LET l_13_oma56 = cl_digcut(((l_sumomb16+l_21_omb16)*l_oea263/l_oea61),g_azi04)  #MOD-CC0042 add
            END IF 
           #IF l_sumoea263-l_oea263_2t < cl_digcut((l_sumomb16t*g_oma.oma163/100),g_azi04) THEN     #MOD-BA0227 mark
            IF l_sumoea263t-l_oea263_2t < cl_digcut((l_sumomb16t*l_oea263t/l_oea1008),g_azi04) THEN #MOD-BA0227
               LET l_13_oma56t = l_sumoea263t-l_oea263_2t
            ELSE
              #LET l_13_oma56t = cl_digcut((l_sumomb16t*g_oma.oma163/100),g_azi04)    #MOD-BA0227 mark
              #LET l_13_oma56t = cl_digcut((l_sumomb16t*l_oea263t/l_oea1008),g_azi04)                 #MOD-BA0227 #MOD-CC0042 mark
               LET l_13_oma56t = cl_digcut(((l_sumomb16t+l_21_omb16t)*l_oea263t/l_oea1008),g_azi04)   #MOD-CC0042 add
            END IF
         END IF    #MOD-BB0077
         IF cl_null(l_13_oma56)  THEN LET l_13_oma56  = 0 END IF   #MOD-BA0227 
         IF cl_null(l_13_oma56t) THEN LET l_13_oma56t = 0 END IF   #MOD-BA0227

         #-TQC-E80012-add-
         #IF l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917 THEN                           #MOD-F70120 mark 
         #IF (l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917) AND g_ooy.ooy10 <> 'Y' THEN  #MOD-F70120 add   #MOD-F90076 mark 
          IF (l_oma54 < g_oma.oma52 OR l_oeb917 <= l_sumogb917+l_ogb917)   #MOD-F90076 add
             AND g_ooy.ooy10 <> 'Y' AND l_flag2 = 'N' THEN                 #MOD-F90076 add
             LET g_oma.oma53 = (l_oma54 * g_oma.oma24) - (l_12_oma52 * g_oma.oma24)    #原幣訂金       
             IF g_ooz.ooz33 = 'N' THEN     #TQC-E90010 add
                LET g_oma.oma53 = g_oma.oma53 / (1+g_oma.oma211/100)     
             END IF                        #TQC-E90010 add
             CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53        
          END IF
         #-TQC-E80012-end-

         IF NOT l_mTax THEN #TQC-E10010 add
           #LET g_oma.oma56 = cl_digcut(g_oma.oma54*g_oma.oma24,g_azi04)              #TQC-E80012 mark 
            LET g_oma.oma56 = (g_oma.oma50 * g_oma.oma24) - g_oma.oma53 - l_13_oma56  #TQC-E80012
            LET g_oma.oma56 = cl_digcut(g_oma.oma56,g_azi04)                          #TQC-E80012 mark 
            LET l_oma56 = g_oma.oma53 + g_oma.oma56 + l_13_oma56            
            CALL cl_digcut(l_oma56,g_azi04) RETURNING l_oma56  
            LET l_oma56 = l_oma56 - l_sumomb16
            IF l_oma56 <> 0 THEN
               LET g_oma.oma56 = g_oma.oma56 - l_oma56
            END IF
            LET g_oma.oma56t= cl_digcut(g_oma.oma54t*g_oma.oma24,g_azi04)  
           #IF g_ooz.ooz33 = 'N' THEN    #CHI-E90043 add   #TQC-EA0022 mark
               LET l_oma53t = g_oma.oma53 * (1+g_oma.oma211/100)                      #TQC-E80012 
           #ELSE                            #CHI-E90043 add   #TQC-EA0022 mark
           #   LET l_oma53t = g_oma.oma53   #CHI-E90043 add   #TQC-EA0022 mark
           #END IF                          #CHI-E90043 add   #TQC-EA0022 mark
            CALL cl_digcut(l_oma53t,g_azi04) RETURNING l_oma53t                       #TQC-E80012 
            #--MOD-FC0038 add start--
           #LET l_amt4 = l_oma53t - l_amt1                                        #MOD-G30038 mark
            LET l_sumamt1 = cl_digcut(g_oma.oma50t * l_oea261 / l_oea61,g_azi04)  #MOD-G30038 add
            LET l_amt4 = l_oma53t - l_sumamt1                                     #MOD-G30038 add
            IF l_amt4 <> 0 AND g_oma.oma24 = 1 THEN
               LET l_oma53t = l_oma53t - l_amt4
            END IF
            #--MOD-FC0038 add end--
           #LET l_oma56t = g_oma.oma53*(1+g_oma.oma211/100) + g_oma.oma56t + l_13_oma56t #MOD-BA0227 mark 

           #IF g_ooz.ooz34 <> 'Y' THEN   #FUN-HB0002 add
            LET l_oma56t = l_oma53t + g_oma.oma56t + l_13_oma56t  #MOD-BA0227 
            CALL cl_digcut(l_oma56t,g_azi04) RETURNING l_oma56t  
            #--FUN-HB0002 add start--
            IF g_ooz.ooz34 = 'Y' THEN
               LET l_sumomb16t = l_sumomb14t * g_oma.oma24
               CALL cl_digcut(l_sumomb16t,g_azi04) RETURNING l_sumomb16t 
            END IF    
            #--FUN-HB0002 add end--
            LET l_oma56t = l_oma56t - l_sumomb16t
            IF l_oma56t <> 0 THEN
               LET g_oma.oma56t = g_oma.oma56t - l_oma56t
            END IF
           #END IF   #FUN-HB0002 add
        #TQC-E10010 add start -----
         ELSE
            LET g_oma.oma56 = cl_digcut(g_oma.oma54*g_oma.oma24,g_azi04)  
            LET g_oma.oma56t= cl_digcut(g_oma.oma54t*g_oma.oma24,g_azi04)  
            LET g_oma.oma56x = g_oma.oma56t - g_oma.oma56   #FUN-F40073 add
         END IF
        #TQC-E10010 add end   -----
         #FUN-C90105--add--str
         #IF g_ooz.ooz33 = 'N' AND g_aza.aza26 = '2' THEN   #FUN-E20007 mark
        #IF g_ooz.ooz33 = 'N' THEN                          #FUN-E20007 #TQC-E30026 mark
         IF g_ooz.ooz33 = 'N' AND NOT l_mTax THEN           #TQC-E30026 add
            LET g_oma.oma53 = g_oma.oma53*(1+g_oma.oma211/100)          
            CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53 
            LET g_oma.oma56x = g_oma.oma53+ g_oma.oma56t - ((g_oma.oma53+ g_oma.oma56t)/(1+g_oma.oma211/100))
            CALL cl_digcut(g_oma.oma56x,g_azi04) RETURNING g_oma.oma56x
            LET g_oma.oma56 = g_oma.oma56t- g_oma.oma56x
            CALL cl_digcut(g_oma.oma56,g_azi04) RETURNING g_oma.oma56
           #--CHI-E90043 mark start--
           #IF g_oma.oma213 = 'N' THEN 
           #   LET g_oma.oma56 = g_oma.oma56 - (g_oma.oma53*( g_oma.oma211/100))
           #   CALL cl_digcut(g_oma.oma56,g_azi04) RETURNING g_oma.oma56
           #   LET g_oma.oma56t = g_oma.oma56t - (g_oma.oma53*( g_oma.oma211/100))
           #   CALL cl_digcut(g_oma.oma56x,g_azi04) RETURNING g_oma.oma56x
           #END IF
           #--CHI-E90043 mark end--            
         ELSE
         #FUN-C90105--add--end
            IF NOT l_mTax THEN   #FUN-F40073 add
               #本幣稅額計算
               CALL saxrp310_tax(g_oma.oma56,g_oma.oma56t,'B') 
                       RETURNING g_oma.oma56,g_oma.oma56t,g_oma.oma56x
            END IF   #FUN-F40073 add
         END IF #FUN-C90105 add  
        #IF g_oma.oma00='19' THEN                                                              #MOD-C80007 mark
         #IF g_oma.oma00 = '12' AND (l_oea262 <> 0 OR l_cnt > 0) THEN                           #MOD-C80007 add    #MOD-D60020 mark
         IF g_oma.oma00 = '12' AND (l_oea262 <> 0 OR l_cnt > 0 OR (g_oaz92 = 'Y' AND g_aza.aza26 = '2')) THEN      #MOD-D60020    
         ELSE                                                                                  #MOD-C80007 add
            LET g_oma.oma56 = 0
            LET g_oma.oma56x = 0
            LET g_oma.oma56t = g_oma.oma73
         END IF

         #--MOD-G30169 add start--
        #IF g_ooz.ooz33 = 'N' AND (l_oea261t = l_oea1008) THEN   #訂金100%   #MOD-G40118 mark
         IF g_ooz.ooz33 = 'N' AND (l_oea261t = l_oea1008_2) THEN #訂金100%   #MOD-G40118 add 
            LET g_oma.oma53 = g_oma.oma52 * g_oma.oma24
            CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53
         END IF
         #--MOD-G30169 add end--

        #發票計算
        #LET g_oma.oma59 = g_oma.oma54 *g_oma.oma58  #MOD-BB0082 mark 
        #LET g_oma.oma59t= g_oma.oma54t*g_oma.oma58  #MOD-BB0082 mark 
        #-MOD-BB0082-add-
        #單頭發票與單身發票尾差調整
         LET l_sumomb18 = 0    LET l_sumomb18t = 0
         SELECT SUM(omb18),SUM(omb18t) INTO l_sumomb18,l_sumomb18t
           FROM omb_file
          WHERE omb01 = g_oma.oma01 
         IF l_sumomb18  IS NULL THEN LET l_sumomb18  = 0 END IF
         IF l_sumomb18t IS NULL THEN LET l_sumomb18t = 0 END IF

         IF l_oea263 > 0 THEN   #MOD-BB0077
           #l_sumomb18跟l_sumomb18t要考慮有使用尾款使用比率的情況
            IF l_sumoea263-l_oea263_2 < cl_digcut((l_sumomb18*l_oea263/l_oea61),g_azi04) THEN 
               LET l_13_oma59 = l_sumoea263-l_oea263_2
            ELSE
              #LET l_13_oma59 = cl_digcut((l_sumomb18*l_oea263/l_oea61),g_azi04)               #MOD-CC0042 mark
               LET l_13_oma59 = cl_digcut(((l_sumomb18+l_21_omb18)*l_oea263/l_oea61),g_azi04)  #MOD-CC0042 add
            END IF 
            IF l_sumoea263t-l_oea263_2t < cl_digcut((l_sumomb18t*l_oea263t/l_oea1008),g_azi04) THEN 
               LET l_13_oma59t = l_sumoea263t-l_oea263_2t
            ELSE
              #LET l_13_oma59t = cl_digcut((l_sumomb18t*l_oea263t/l_oea1008),g_azi04)                #MOD-CC0042 mark
               LET l_13_oma59t = cl_digcut(((l_sumomb18t+l_21_omb18t)*l_oea263t/l_oea1008),g_azi04)  #MOD-CC0042 add
            END IF
         END IF    #MOD-BB0077
         IF cl_null(l_13_oma59)  THEN LET l_13_oma59  = 0 END IF
         IF cl_null(l_13_oma59t) THEN LET l_13_oma59t = 0 END IF
        #-TQC-E80012-add-
         IF g_ooz.ooz33 = 'N' AND NOT l_mTax THEN           #TQC-E30026 add
            LET g_oma.oma59  = l_sumomb18 - l_13_oma59 
            LET g_oma.oma59t = l_sumomb18t - l_13_oma59t 
         ELSE
        #-TQC-E80012-end-
           #IF NOT l_mTax THEN #CHI-F10019 add       #MOD-F80140 mark
           #IF NOT l_mTax AND g_oma.oma54 > 0 THEN   #MOD-F80140 add             #MOD-FC0126 mark
           #LET g_oma.oma59 = (g_oma.oma50*g_oma.oma24)-g_oma.oma53-l_13_oma56   #MOD-FC0126 add   #MOD-G60166 mark
           #--MOD-G60166 add start--
           LET l_oma50 = cl_digcut(g_oma.oma50*g_oma.oma24,g_azi04)
           LET g_oma.oma59 = l_oma50 - g_oma.oma53 - l_13_oma56
           #--MOD-G60166 add end--
            LET g_oma.oma59 = cl_digcut(g_oma.oma59,g_azi04)                     #MOD-FC0126 add
            IF NOT l_mTax AND g_oma.oma59 > 0 THEN                               #MOD-FC0126 add
              #LET g_oma.oma59 = cl_digcut(g_oma.oma54*g_oma.oma58,g_azi04)      #MOD-FC0126 mark
               LET l_oma59 = g_oma.oma53 + g_oma.oma59 + l_13_oma59            
               CALL cl_digcut(l_oma59,g_azi04) RETURNING l_oma59
               LET l_oma59 = l_oma59 - l_sumomb18
               IF l_oma59 <> 0 THEN
                  LET g_oma.oma59 = g_oma.oma59 - l_oma59
               END IF
              #LET g_oma.oma59t= cl_digcut(g_oma.oma54t*g_oma.oma58,g_azi04)   #MOD-FC0126 mark
               LET g_oma.oma59t = g_oma.oma59*(1+g_oma.oma211/100)             #MOD-FC0126 add
               LET g_oma.oma59t = cl_digcut(g_oma.oma59t,g_azi04)              #MOD-FC0126 add
               #--MOD-FC0126 add start--
               LET l_oma53t = g_oma.oma53*(1+g_oma.oma211/100)
               LET l_oma53t = cl_digcut(l_oma53t,g_azi04)
               LET l_amt4 = l_oma53t - l_amt1
               IF l_amt4 <> 0 AND g_oma.oma24 = 1 THEN
                  LET l_oma53t = l_oma53t - l_amt4
               END IF
               LET l_oma59t = l_oma53t + g_oma.oma59t + l_13_oma59t
               #--MOD-FC0126 add end--
              #LET l_oma59t = g_oma.oma53*(1+g_oma.oma211/100) + g_oma.oma59t + l_13_oma59t   #MOD-FC0126 mark                     
               CALL cl_digcut(l_oma59t,g_azi04) RETURNING l_oma59t  
               LET l_oma59t = l_oma59t - l_sumomb18t
               IF l_oma59t <> 0 THEN
                  LET g_oma.oma59t = g_oma.oma59t - l_oma59t
               END IF
            END IF             #CHI_F10019 add
        END IF   #TQC-E80012
        #-MOD-BB0082-end-
        #發票稅額計算
           CALL saxrp310_tax(g_oma.oma59,g_oma.oma59t,'C') 
                   RETURNING g_oma.oma59,g_oma.oma59t,g_oma.oma59x
         #FUN-C90105--add--str
        #IF g_oma.oma213 = 'N' AND g_ooz.ooz33 = 'N' AND g_aza.aza26 = '2'  THEN   #FUN-E20007 mark
       #-TQC-E80012-mark-
       #IF g_oma.oma213 = 'N' AND g_ooz.ooz33 = 'N' THEN                           #FUN-E20007 
       #   LET g_oma.oma53 = g_oma.oma53*(1+g_oma.oma211/100)
       #   CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53
       #END IF 
       #-TQC-E80012-end-
        #FUN-C90105--add-end                
       #--MOD-FA0111 mark start--
       ##--MOD-F70120 add start--
       #IF g_oma.oma213 = 'Y' AND g_ooz.ooz33 = 'N' THEN         
       #   LET g_oma.oma53 = g_oma.oma53*(1+g_oma.oma211/100)
       #   CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53
       #END IF
       ##--MOD-F70120 add end--
       #--MOD-FA0111 mark end--

        #--MOD-F80140 add start--
        LET l_cnt2 = 0
        SELECT COUNT(*) INTO l_cnt2
          FROM oma_file
         WHERE oma16 = g_oma.oma19
           AND oma10 IS NOT NULL
           AND oma00 = '11'
        IF cl_null(l_cnt2) THEN
           LET l_cnt2 = 0
        END IF
        #--MOD-F80140 add end--

        IF NOT l_mTax THEN   #FUN-F40073 add
           #No.FUN-E20007  --Begin
          #IF g_ooz.ooz33 = 'N' AND g_oma.oma161 = 100 THEN    #MOD-F80140 mark
           IF g_ooz.ooz33 = 'N' AND g_oma.oma161 = 100 AND l_cnt2 > 0 THEN  #MOD-F80140 add #訂金有開發票時才將發票金額歸零 
           	 LET g_oma.oma53 = g_oma.oma52 * g_oma.oma24
           	 CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53
           	 LET g_oma.oma59 = 0
           	 LET g_oma.oma59x = 0 
           	 LET g_oma.oma59t = 0
           END IF
           #No.FUN-E20007  --End
        END IF   #FUN-F40073 add
       #-TQC-E80012-add-
        IF g_ooz.ooz33 = 'Y' THEN
           LET g_oma.oma53 = g_oma.oma52 * g_oma.oma24    
           CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53
        END IF
       #-TQC-E80012-end-

       #--MOD-F70125 add start--
        #訂單總數量
        LET l_oeb12 = 0
        LET g_sql = "SELECT SUM(oeb12) ",
                    "  FROM ",l_tar_oeb,
                    " WHERE oeb01 = '",g_oma.oma19,"'"
        CALL cl_replace_sqldb(g_sql) RETURNING g_sql
        CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql
        PREPARE sel_oeb_pre03 FROM g_sql
        EXECUTE sel_oeb_pre03 INTO l_oeb12
        IF cl_null(l_oeb12) THEN LET l_oeb12 = 0 END IF

        #出貨單總數量
        LET l_ogb12 = 0
        LET g_sql = "SELECT SUM(ogb12) ",
                    "  FROM ",l_tar_ogb,
                    " WHERE ogb01 = '",g_oma.oma16,"'"
        CALL cl_replace_sqldb(g_sql) RETURNING g_sql
        CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql
        PREPARE sel_ogb_pre03 FROM g_sql
        EXECUTE sel_ogb_pre03 INTO l_ogb12
        IF cl_null(l_ogb12) THEN LET l_ogb12 = 0 END IF

        #--MOD-F70168 add start--
        SELECT COUNT(DISTINCT oma24) INTO l_tot 
          FROM oma_file 
         WHERE oma16 = g_oma.oma19 
           AND oma00 = '11' 
        IF l_tot = 1 THEN
           SELECT DISTINCT(oma24) INTO l_oma24_11
             FROM oma_file
            WHERE oma16 = g_oma.oma19
              AND oma00 = '11'
        END IF

        IF cl_null(l_oma24_11) THEN
           LET l_oma24_11 = 0
        END IF
        #--MOD-F70168 add end--

       #IF (l_oea261 <> 0 AND l_oea262 = 0)                           #MOD-F70120 mark 
        IF (l_oea261 <> 0 AND l_oea262 = 0) AND g_ooy.ooy10 <> 'Y'    #MOD-F70120 add
           AND (l_tot = 1 AND l_oma24_11 = g_oma.oma24)               #MOD-F70168 add
           AND (l_oeb12 = l_ogb12) THEN   #訂金比率100%且一次出貨時
          #SELECT oma56t INTO g_oma.oma53        #MOD-F80013 mark
           SELECT SUM(oma56t) INTO g_oma.oma53   #MOD-F80013 add
             FROM oma_file
            WHERE oma16 = g_oma.oma19
              AND oma00 = '23'
              AND omavoid <> 'Y'
        END IF
       #--MOD-F70125 add end--
      WHEN g_oma.oma00 = '13'        #FUN-B10058
        #-MOD-BA0227-mark-
        #SELECT oea61,oea1008,oea261,oea262,oea263
        #  INTO l_oea61,l_oea1008,l_oea261,l_oea262,l_oea263
        #  FROM oea_file
        # WHERE oea01 = g_oma.oma16
        #EXECUTE sel_oea_pre INTO l_oea61,l_oea1008,l_oea261,l_oea262,l_oea263 
        #-MOD-BA0227-end-
        #EXECUTE sel_oea_pre INTO l_oea61,l_oea261,l_oea262,l_oea263          #MOD-BA0227#MOD-C90145 mark
         EXECUTE sel_oea_pre INTO l_oea61,l_oea162,l_oea261,l_oea262,l_oea263 #MOD-C90145
        #----------------------MOD-BC0294-----------------------start
        #IF STATUS THEN     #找不到訂單，表無訂單出貨
        #   LET l_oea61 = 100
        #  #LET l_oea1008 = 100  #MOD-BA0227 mark
        #   LET l_oea261 = 0
        #   LET l_oea262 = 0
        #   LET l_oea263 = 0
        #END IF
         IF cl_null(l_oea61) THEN LET l_oea61 = 0 END IF
         IF cl_null(l_oea261) THEN LET l_oea261 = 0 END IF
         IF cl_null(l_oea262) THEN LET l_oea262 = 0 END IF
         IF cl_null(l_oea263) THEN LET l_oea263 = 0 END IF
        #----------------------MOD-BC0294------------------------end
         LET l_oea1008 = l_oea261+l_oea262+l_oea263   #MOD-BA0227
        #原幣計算
         IF l_oea262=0 AND l_oea263 >0 AND NOT cl_null(g_oma.oma19) THEN
            IF g_oma.oma213 = 'Y' THEN                             
               LET g_oma.oma52 = g_oma.oma50t * l_oea261 / l_oea1008
            ELSE
              #LET g_oma.oma52 = g_oma.oma50 * l_oea261 / l_oea61   #MOD-BA0227 mark
               LET g_oma.oma52 = g_oma.oma50 * l_oea261 / l_oea1008 #MOD-BA0227
            END IF
            CALL cl_digcut(g_oma.oma52,t_azi04) RETURNING g_oma.oma52    
         END IF
         IF g_oma.oma213 = 'Y' THEN
            LET g_oma.oma54t = l_oeaa08
            LET g_oma.oma54  = g_oma.oma54t/(1+ g_oma.oma211/100)
         ELSE
            LET g_oma.oma54  = l_oeaa08
            LET g_oma.oma54t = g_oma.oma54*(1+ g_oma.oma211/100)
         END IF
        #稅額計算
         CALL saxrp310_tax(g_oma.oma54,g_oma.oma54t,'A')    #MOD-BA0227 mod 'B' -> 'A'
                 RETURNING g_oma.oma54,g_oma.oma54t,g_oma.oma54x
        #本幣計算
         LET g_oma.oma56  = g_oma.oma54 * g_oma.oma24
         LET g_oma.oma56t = g_oma.oma54t* g_oma.oma24
         IF l_oea262 = 0 AND l_oea263 > 0 THEN
            LET g_oma.oma53  = g_oma.oma52 * g_oma.oma24
            CALL cl_digcut(g_oma.oma53,g_azi04) RETURNING g_oma.oma53 
         END IF
        #本幣稅額計算
         CALL saxrp310_tax(g_oma.oma56,g_oma.oma56t,'B') 
                 RETURNING g_oma.oma56,g_oma.oma56t,g_oma.oma56x
        #發票計算
         LET g_oma.oma59  = g_oma.oma54 * g_oma.oma58
         LET g_oma.oma59t = g_oma.oma54t* g_oma.oma58
        #發票稅額計算
         CALL saxrp310_tax(g_oma.oma59,g_oma.oma59t,'C') 
                 RETURNING g_oma.oma59,g_oma.oma59t,g_oma.oma59x

     #-代退-
      WHEN g_oma.oma00 = '28'
         LET g_oma.oma54 = 0
         LET g_oma.oma54x = 0
         LET g_oma.oma54t = g_oma.oma73f
         LET g_oma.oma56 = 0
         LET g_oma.oma56x = 0
         LET g_oma.oma56t = g_oma.oma73

     #----------------------MOD-C20141----------start
     #非應收發票
      WHEN g_oma.oma00 = '31'
        LET g_oma.oma54 = g_oma.oma50
        LET g_oma.oma54t= g_oma.oma50t
       #LET g_oma.oma55=g_oma.oma54t   #MOD-F30004 mark
       #LET g_oma.oma57=g_oma.oma56t   #MOD-F30004 mark
       #原幣稅額計算
        CALL saxrp310_tax(g_oma.oma54,g_oma.oma54t,'A')
                RETURNING g_oma.oma54,g_oma.oma54t,g_oma.oma54x
       #本幣稅額計算
        CALL saxrp310_tax(g_oma.oma56,g_oma.oma56t,'B')
                RETURNING g_oma.oma56,g_oma.oma56t,g_oma.oma56x
       #發票稅額計算
        CALL saxrp310_tax(g_oma.oma59,g_oma.oma59t,'C')
                RETURNING g_oma.oma59,g_oma.oma59t,g_oma.oma59x

         LET g_oma.oma55=g_oma.oma54t   #MOD-F30004 add
         LET g_oma.oma57=g_oma.oma56t   #MOD-F30004 add
     #----------------------MOD-C20141------------end

      OTHERWISE       
        #原幣金額 
         LET g_oma.oma54 = g_oma.oma50
         LET g_oma.oma54t= g_oma.oma50t
        #原幣稅額計算
         CALL saxrp310_tax(g_oma.oma54,g_oma.oma54t,'A')
                 RETURNING g_oma.oma54,g_oma.oma54t,g_oma.oma54x
        #本幣稅額計算
         CALL saxrp310_tax(g_oma.oma56,g_oma.oma56t,'B') 
                 RETURNING g_oma.oma56,g_oma.oma56t,g_oma.oma56x
        #發票稅額計算
         CALL saxrp310_tax(g_oma.oma59,g_oma.oma59t,'C') 
                 RETURNING g_oma.oma59,g_oma.oma59t,g_oma.oma59x

   END CASE

   LET g_oma.oma61 = g_oma.oma56t-g_oma.oma57    
   CALL s_ar_oox03(g_oma.oma01) RETURNING g_net                                                                                     
   LET g_oma.oma61 = g_oma.oma61+g_net                                                                                              
   IF cl_null(g_oma.oma53) THEN LET g_oma.oma53 = 0 END IF #FUN-C60036 add
   IF cl_null(g_oma.oma56x) THEN LET g_oma.oma56x = 0 END IF #FUN-C60036 add
   IF cl_null(g_oma.oma54x) THEN LET g_oma.oma54x = 0 END IF #FUN-C60036 add
   
   UPDATE oma_file SET
          oma50=g_oma.oma50,oma50t=g_oma.oma50t,
          oma73=g_oma.oma73,oma73f=g_oma.oma73f,  
          oma52=g_oma.oma52,oma53=g_oma.oma53,
          oma54=g_oma.oma54,oma54x=g_oma.oma54x,oma54t=g_oma.oma54t,
          oma56=g_oma.oma56,oma56x=g_oma.oma56x,oma56t=g_oma.oma56t,
          oma59=g_oma.oma59,oma59x=g_oma.oma59x,oma59t=g_oma.oma59t,
          oma55=g_oma.oma55,oma57=g_oma.oma57,oma61=g_oma.oma61
          WHERE oma01=g_oma.oma01
   IF STATUS OR SQLCA.SQLCODE THEN
      IF g_bgerr THEN
         CALL s_errmsg('oma01',g_oma.oma11,'upd oma50',SQLCA.SQLCODE,1)
      ELSE
         CALL cl_err3("upd","oma_file",g_oma.oma01,"",SQLCA.sqlcode,"","upd oma50",1)
      END IF
      LET g_success='N' RETURN
   END IF
   RETURN g_oma.*
END FUNCTION

FUNCTION saxrp310_tax(p_amt,p_amt_t,p_flag)
   DEFINE p_amt   LIKE oma_file.oma54    
   DEFINE p_amt_t lIKE oma_file.oma54t    
   DEFINE p_flag  LIKE type_file.chr1   
   DEFINE l_amt   LIKE oma_file.oma54    
   DEFINE l_amt_t LIKE oma_file.oma54t    
   DEFINE l_amtx  LIKE oma_file.oma54    
   DEFINE l_amx   LIKE oma_file.oma54x    
   DEFINE l_flag  LIKE type_file.chr1   
   DEFINE l_azi04 LIKE azi_file.azi04    
   DEFINE l_occ73 LIKE occ_file.occ73
   DEFINE l_cnt   LIKE type_file.num10     #FUN-C10055 add
   #FUN-C60036--ad--str
   DEFINE l_oaz92 LIKE oaz_file.oaz92
   DEFINE l_flag1  LIKE type_file.chr1 
   #FUN-C60036--ad--end

   LET l_amt = p_amt
   LET l_amt_t = p_amt_t
   LET l_flag = p_flag

  #No.MOD-C30415   ---start---   Add
  #抓取收款客戶的按交款金額產生應收欄位
   LET g_sql = "SELECT occ73 ",
              #"  FROM ",cl_get_target_table(g_plant_new,'occ_file'), #FUN-E10006 mark
               "  FROM ",g_tar_occ,                                   #FUN-E10006
               " WHERE occ01 = '",g_oma.oma68,"'"
   CALL cl_replace_sqldb(g_sql) RETURNING g_sql
   CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql
   PREPARE sel_occ_prep FROM g_sql
   EXECUTE sel_occ_prep INTO g_occ73  #TQC-BB0019 l_occ73->g_occ73
   IF cl_null(g_occ73) THEN LET g_occ73 = 'N' END IF   #MOD-D50242
  #No.MOD-C30415   ---end---     Add
   #MOD-D60156 add begin-------------
   IF cl_null(t_azi04) THEN 
      LET g_sql = "SELECT azi04 ",
                  "  FROM ",cl_get_target_table(g_plant_new,'azi_file'),
                  " WHERE azi01 = '",g_oma.oma23,"'"
      CALL cl_replace_sqldb(g_sql) RETURNING g_sql
      CALL cl_parse_qry_sql(g_sql,g_plant_new) RETURNING g_sql
      PREPARE sel_azi04_prep FROM g_sql
      EXECUTE sel_azi04_prep INTO t_azi04
   END IF 
   #MOD-D60156 add end-------------   
  #l_flag 說明: A-原幣 ; B-本幣 ; C-發票
   IF l_flag = 'A' THEN
      LET l_azi04 = t_azi04
   ELSE
      LET l_azi04 = g_azi04
   END IF

   #FUN-C10055--start add-----------------------------
   IF g_oma.oma70 = '3' THEN
      LET g_mTax = TRUE
   #END IF   #FUN-D90020
   ELSE  #FUN-D90020
   #IF g_oma.oma70 = '2' THEN  #FUN-D90020
      LET g_mTax = FALSE
   END IF

  #IF g_mTax = TRUE THEN  #FUN-C30296 mark
   IF g_mTax = FALSE THEN #FUN-C30296 add
      LET l_cnt = 0 #TQC-E10051 add
      IF g_oma.oma00 = '11' OR g_oma.oma00 = '13' THEN
         SELECT COUNT(*) INTO l_cnt 
        #TQC-E10010 mark start -----
        #  FROM oeg_file
        # WHERE oeg01 = g_oma.oma16
        #TQC-E10010 mark end   -----
        #TQC-E10010 add start -----
           FROM oeh_file
          WHERE oeh01 = g_oma.oma16
        #TQC-E10010 add end   -----
         IF l_cnt > 0 THEN
            LET g_mTax = TRUE
         END IF
      END IF
      IF g_oma.oma00 = '12' THEN
         SELECT COUNT(*) INTO l_cnt
#           FROM ogi_file                #FUN-E20014 mark
           FROM ogh_file                 #FUN-E20014 add
#          WHERE ogi01 = g_oma.oma16     #FUN-E20014 mark
           WHERE ogh01 = g_oma.oma16     #FUN-E20014 add
         IF l_cnt > 0 THEN
            LET g_mTax = TRUE
         END IF  
      END IF  
     #TQC-E10051 add start -----
      IF g_oma.oma00 = '21' THEN
         SELECT COUNT(*) INTO l_cnt FROM ogj_file WHERE ogj01 = g_oma.oma16
         IF l_cnt > 0 THEN
            LET g_mTax = TRUE
         END IF
      END IF
     #TQC-E10051 add end   -----

     #TQC-E90008 add (begin)
    #SELECT COUNT(*) INTO l_cnt FROM omk_file WHERE omk01 = g_oma.oma01 #CHI-F10019 mark
     SELECT COUNT(*) INTO l_cnt FROM oml_file WHERE oml01 = g_oma.oma01 #CHI-F10019 add
     IF l_cnt > 0 THEN
        LET g_mTax = TRUE
     END IF
     #TQC-E90008 add (end)

   END IF 
   #FUN-C10055--end add-------------------------------

   #IF g_oma.oma70 = '3' THEN       #FUN-C10055 mark
   #FUN-C60036--ad--str
   LET l_flag1 = 'N'
   SELECT oaz92 INTO l_oaz92 FROM oaz_file
   IF (g_oma.oma00 = '12' OR g_oma.oma00 = '19' OR g_oma.oma00 = '21' OR g_oma.oma00 = '28') AND l_oaz92 = 'Y' 
      AND g_aza.aza26 = '2' THEN 
      LET g_mTax = TRUE 
      LET l_flag1 = 'Y'
   END IF 
   #FUN-C60036--ad--end
   IF g_mTax = TRUE THEN            #FUN-C10055 add
      LET l_amt = 0   LET l_amt_t = 0
      #FUN-D90020---begin mark
      IF l_flag1 = 'Y' THEN  #TQC-DB0052
      #TQC-DB0052---begin remark
      CASE l_flag
         WHEN 'A'
            SELECT SUM(omb14),SUM(omb14t) INTO l_amt,l_amt_t 
              FROM omb_file 
             WHERE omb01 = g_oma.oma01
            IF l_amt   IS NULL THEN LET l_amt   = 0 END IF
            IF l_amt_t IS NULL THEN LET l_amt_t = 0 END IF
            #FUN-C60036--add--str--
            IF l_flag1 = 'Y' THEN
               SELECT ABS(SUM(omf29x)) INTO l_amtx FROM omf_file
                WHERE omf04 = g_oma.oma01
            END IF  
            #FUN-C60036--add--end
         WHEN 'B'
            SELECT SUM(omb16),SUM(omb16t) INTO l_amt,l_amt_t 
              FROM omb_file 
             WHERE omb01 = g_oma.oma01
            IF l_amt   IS NULL THEN LET l_amt   = 0 END IF
            IF l_amt_t IS NULL THEN LET l_amt_t = 0 END IF
            #FUN-C60036--add--str--
            IF l_flag1 = 'Y' THEN
               SELECT ABS(SUM(omf19x)) INTO l_amtx FROM omf_file
                WHERE omf04 = g_oma.oma01
            END IF
            #FUN-C60036--add--end
         WHEN 'C'
            SELECT SUM(omb18),SUM(omb18t) INTO l_amt,l_amt_t 
              FROM omb_file 
             WHERE omb01 = g_oma.oma01
            IF l_amt   IS NULL THEN LET l_amt   = 0 END IF
            IF l_amt_t IS NULL THEN LET l_amt_t = 0 END IF
            #FUN-C60036--add--str--
            IF l_flag1 = 'Y' THEN
               SELECT ABS(SUM(omf19x)) INTO l_amtx FROM omf_file
                WHERE omf04 = g_oma.oma01
            END IF
            #FUN-C60036--add--end
      END CASE
      #TQC-DB0052---end
      #IF l_flag1 = 'N' THEN #FUN-C60036 
      #   IF g_azw.azw04 = '2' AND g_oma.oma00 = '11' AND g_check = 'Y' AND g_occ73 = 'Y' THEN  #TQC-BB0019 l_occ73->g_occ73 
      #      LET l_amtx = 0
      #      LET l_amt = l_amt_t
      #   ELSE
      #      LET l_amtx = l_amt_t-l_amt
      #   END IF
      #END IF   #FUN-C60036 
      CALL cl_digcut(l_amt,l_azi04) RETURNING l_amt  #TQC-DB0052 remark
      CALL cl_digcut(l_amt_t,l_azi04) RETURNING l_amt_t  #TQC-DB0052 remark
      CALL cl_digcut(l_amtx,l_azi04) RETURNING l_amtx  #TQC-DB0052 remark
      #FUN-D90020---end 
      ELSE   #TQC-DB0052
         #FUN-D90020---begin
         #CHI-F10019 ---begin mark---
         #SELECT SUM(omk07),SUM(omk07t),SUM(omk08)
         #  INTO l_amt,l_amt_t,l_amtx
         #  FROM omk_file
         #  WHERE omk01 = g_oma.oma01
         #CHI-F10019 ---end mark---
         #CHI-F10019 ---begin add---
          IF p_flag = 'C' THEN 
             SELECT SUM(omk07),SUM(omk07t),SUM(omk08)
               INTO l_amt,l_amt_t,l_amtx
               FROM omk_file
               WHERE omk01 = g_oma.oma01
          ELSE
             SELECT SUM(oml08),SUM(oml08t),SUM(oml09)
               INTO l_amt,l_amt_t,l_amtx
               FROM oml_file
               WHERE oml01 = g_oma.oma01
          END IF
         #CHI-F10019 ---end add--- 
         IF l_amt   IS NULL THEN LET l_amt   = 0 END IF
         IF l_amt_t   IS NULL THEN LET l_amt_t   = 0 END IF
         IF l_amtx   IS NULL THEN LET l_amtx   = 0 END IF  
         #FUN-D90020---end
      END IF  #TQC-DB0052
   ELSE
      IF g_oma.oma213 = 'N'   THEN
         CALL cl_digcut(l_amt,l_azi04) RETURNING l_amt   
         IF g_azw.azw04 = '2' AND g_oma.oma00 = '11' AND g_check = 'Y' AND g_occ73 = 'Y' THEN  #TQC-BB0019 l_occ73->g_occ73 
            LET l_amtx = 0
         ELSE
            LET l_amtx = l_amt * g_oma.oma211/100
         END IF   
         CALL cl_digcut(l_amtx,l_azi04) RETURNING l_amtx   
         LET l_amt_t = l_amt + l_amtx
      ELSE 
         CALL cl_digcut(l_amt_t,l_azi04) RETURNING l_amt_t   
         IF g_azw.azw04 = '2' AND g_oma.oma00 = '11' AND g_check = 'Y' AND g_occ73 = 'Y' THEN  #TQC-BB0019 l_occ73->g_occ73
            LET l_amtx = 0
         ELSE
            LET l_amtx = l_amt_t * g_oma.oma211/(100+g_oma.oma211)
         END IF  
         CALL cl_digcut(l_amtx,l_azi04) RETURNING l_amtx   
         LET l_amt = l_amt_t - l_amtx
      END IF
   END IF    
   RETURN l_amt,l_amt_t,l_amtx
END FUNCTION
#CHI-B90025
