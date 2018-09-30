# Prog. Version..: '5.00.05-08.05.09(00009)'     #
# Pattern name...: apmt110.4gl
# Descriptions...: 採購收貨作業
# Date & Author..: 91/11/27 By Apple
# Modify ........: 93/01/10 BY David 加入 Subcontract 工單入庫數量UPDATE
# Modify ......... 93/02/04 BY P.C 1.加入收貨狀況資料(pmr_file) 2.flow diagram
# Modify ....... : 93/05/03 即日起本程式不處理委外部份
# Modify ....... : 95/04/26 By Danny (判斷是否使用保稅系統)
# Modify.........:          By Kitty check採購單價為0時show警告訊息,但可通過
# Modify ....... : 99/05/24 By Carol 判斷是否有品檢資料,有的話不可取消確認
# Modify ....... : 00/02/16 By Carol:單身 add 專案代號 field ->批號
# Modify ....... : No:7746 03/08/07 By Mandy 發票檔資料會錯亂
#                  一.KEY單身發票資料時,若符合
#                    (1)原本有發票資料,後來清空發票資料 或
#                    (2)原本有發票資料,後來更新發票資料 或
#                    (3)在該項次按F2 則應刪除rvw_file相關資料
#                  二.刪除整張收貨單時,則應刪除rvw_file相關資料
# Modify.........: No:7758 03/08/08 By Mandy 在BEFORE FIELD rvb22加上地區
#                               為大陸而且不是進口資料.才不得輸入發票號碼.
# Modify.........: No:7692 03/08/18 By Mandy 委外收入資料應納入
# Modify.........: No:7857 03/08/20 By Mandy  呼叫自動取單號時應在 Transction中
# Modify.........: No.7882 03/08/22 By Kammy 所有三角貿易單據統一在 apmt300查
# Modify.........: No.6963 03/08/25 By Nicola 從apmp300過來的單子會秀該筆資料
# Modify.........: No.7938 03/08/26 Kammy 1.add rva99 多角序號
#                                         2.多角流程檔案poa_file改成poz_file
# Modify.........: No.8374 03/10/01 Melody 委外代買料不檢驗(同bug#7143)
# Modify.........: No.9524 04/05/07 Melody 應加上 qcs14!='X'
# Modify.........: No.8969 03/12/24 應於after input加判斷該欄位為重要欄位不可空白
# Modify.........: No.8114 03/12/16 Melody rvb19定義應同pmn65
# Modify.........: No.9525 04/05/19 Ching NEXT FIELD rva02要改成NEXT FIELD rvb04!
# Modify.........: No.9728 04/05/07 Wiky 新增收貨單,且單據設定'立即列印'狀況下,列印 apmr920時會當掉
# Modify.........: No.9893 04/07/12 Wiky 進單身項次後應取pmn65 給 rvb19
# Modify.........: No.MOD-490173 Kammy   單價權限控管
# Modify.........: No.MOD-480604 04/09/15 By Smapmin加上倉庫CONTROLP的功能
# Modify.........: No.MOD-480363 04/09/21 By Melody 確認段免驗部份的 rvb39 應直接='N' 不用再重抓 pmh08
# Modify.........: No:MOD-490371 04/09/23 By Kitty Controlp 未加display
# Modify.........: No.FUN-4A0009 04/10/05 By Yuna 查詢時,收貨單號應開出收貨單號而不是單據別
# Modify.........: No:MOD-4A0063 04/10/06 By Mandy q_ime 的參數傳的有誤
# Modify.........: No:MOD-4A0146 04/10/11 By Mandy 採購單號的開窗,應該再加<>SUB的條件
# Modify.........: No:MOD-4A0213 04/10/14 By Mandy q_imd 的參數傳的有誤
# Modify.........: No:MOD-490328 04/10/26 By Mandy q_imd改用ON ACTION qry_warehouse #查詢倉庫資料
# Modify.........: No:MOD-4B0035 04/11/04 By Mandy 單頭修改後無法存檔,g_success是null
# Modify.........: No:MOD-4B0039 04/11/04 By Mandy 單身無法重show
# Modify.........: No.FUN-4B0025 04/11/05 By Smapmin ARRAY轉為EXCEL檔
# Modify.........: No:MOD-4B0275 04/11/25 By Danny CALL q_coc2
# Modify.........: No:FUN-4C0056 04/12/09 By Carol Q,U,R 加入權限控管處理
# Modify.........: No:MOD-530415 05/04/01 By Mandy 在單身產生時即應將是否檢驗的資料帶入，不需等到確認後再帶出。
# Modify.........: No:MOD-530700 05/05/05 By Mandy 1.進行收貨確認時，程式應加判斷應入的最小齊料套數
# Modify.........: No:MOD-530700 05/05/05 By Mandy 2.程式中直接寫中文ERROR "最小套數:",g_min_set,改用CALL cl_err(g_min_set,'aqc-426',0)
# Modify.........: No:MOD-530431 05/05/05 By pengu 單頭有輸入採購單號, 由系統自動產生單身 後,游標應出現在第一筆
# Modify.........: No.FUN-540027 05/05/23 By Carrier 雙單位內容修改
# Modify.........: No:FUN-550117 05/05/30 By Danny 採購含稅單價
# Modify.........: NO.FUN-540027 05/05/31 By jackie 單據編號加大
# Modify ........: No.FUN-560060 05/06/14 By wujie 單據編號加大返工
# Modify.........: No.MOD-550195 05/05/27 By Mandy EFORE ROW 時應要將g_rvb2清成NULL並且重新抓取當下那筆的rvb_file的資料
# Modify.........: No:MOD-530021 05/06/10 By Mandy 採購單單身料件不能部份交貨時,短交的判斷有誤.
# Modify.........: No:FUN-560102 05/06/18 By Danny 採購含稅單價取消判斷大陸版
# Modify.........: No:MOD-570144 05/07/13 By Nicola 修改時，單身欄位資料未重新
# Modify.........: No:MOD-570294 05/07/21 By Mandy AFTER FIELD rvb03 ....寫到LET g_rvb[l_ac].rvb10 = g_pmn31 之後nDISPLAY g_rvb[l_ac].rvb10 TO rvb10 #重show一次避免沒跑ON ROW CHANGE
# Modify.........: No:MOD-580087 05/08/10 By Nicola 當倉為空白時,會自動重捉倉儲顯示
# Modify.........: No.MOD-580086 05/08/19 By Nicola 作廢時同時刪掉rvw_file
# Modify.........: No.MOD-570411 05/08/19 By Nicola 自動產生單身時，也要新增img_file的資料
# Modify.........: No.FUN-580115 05/08/24 By Carrier 新增允收多單位rvb331/rvb332
# Modify.........: No:MOD-590119 05/09/09 By Carrier 多單位set_origin_field修改
# Modify.........: No:MOD-5A0297 05/10/19 By Nicola 單身自動產生時，計價單位及數量也要一併帶出
# Modify.........: NO.MOD-590530 05/10/05 BY yiting asmi300作倉庫設限無法用到此處
# Modify.........: NO.MOD-5A0448 05/11/01 BY Nicola 單身依項次排序
# Modify.........: NO.TQC-5B0070 05/11/09 BY Nicola 單身手動輸入時，實收數量修改
# Modify.........: NO.TQC-5C0012 05/12/05 By Mandy MOD-5A0297 Function Mark 筆誤
# Modify.........: NO.MOD-5C0039 05/12/07 BY Nicola 工單已結案，不可確認
# Modify.........: NO.FUN-5C0022 05/12/09 By Mandy 母子單位時,自動產生入庫時,需check 以下
#                                                  (允收數二+允收數一)經過換算<= IQC合格量才可自動產生
#                                                  (rvb332*l_factor+rvb331)   <= rvb33
# Modify.......... No.FUN-5C0078 05/12/20 By day 抓取qcs_file的程序多加判斷qcs00<'5'
# Modify.......... No.FUN-5C0055 05/12/19 By kim 先判斷是否已存在確認發料單(sfe_file),若是,才更新 sfb04 = '4',否則,應更新sfb04='2'
# Modify.........: NO.FUN-5A0076 06/01/10 BY yiting 建議單頭單據性質可以預設REG
# Modify.........: NO.FUN-610040 06/01/12 By Sarah 確認段增加判斷"收貨日期不可小於採購單據日期"
# Modify.........: No.FUN-610018 06/01/17 By ice 採購含稅單價功能調整
# Modify.........: No:FUN-610076 06/01/20 By Nicola 計價單位功能改善
# Modify.........: No:MOD-610034 06/01/24 By pengu 取消確認時,亦應判斷工單是否已結案
# Modify.........: No:FUN-610101 06/02/14 By pengu 委外製程收貨不應該要檔最小發料套數
# Modify.........: No:FUN-630010 06/03/07 By saki 流程訊息通知功能及apmt720...等參數順序調換
# Modify.........: No:TQC-610085 06/04/06 By Claire Review所有報表程式接收的外部參數是否完整
# Modify.........: No:MOD-640158 06/04/11 By pengu 輸入單頭時 ,先輸入採購單號 ,然後再將採購單號清除 ,就過不去了會卡在採購單號上
# Modify.........: No:FUN-640123 06/04/12 By kim 修改委外工單確認時之錯誤訊息
# Modify.........: NO.FUN-640151 06/04/18 BY yiting 多角貿易收貨單單頭採購單號不可為空白
# Modify.........: NO.MOD-640530 06/04/20 BY Joe 修正當產生入庫單時,母子單位與交易單位換算錯誤
# Modify.........: No:MOD-650095 06/05/23 By Pengu 程式1674行應加上IF cl_null(g_rvb2.rvb08) OR g_rvb2.rvb08=0判斷
# Modify.........: No:TQC-650108 06/05/24 By Ray 料件多屬性
# Modify.........: No:TQC-660053 06/06/12 By Pengu 新增時,打完單頭會問是否自動產生單身,若按'Y',則會產生-391的錯誤訊息
# Modify.........: No:FUN-660106 06/06/16 By kim GP3.1 增加確認碼欄位與處理
# Modify.........: No:FUN-660129 06/06/20 By wujie  cl_err -> cl_err3
# Modify.........: No:TQC-660097 06/06/21 By Rayven 多屬性功能改進:查詢時不顯示多屬性內容
# Modify.........: No:MOD-660090 06/06/22 By Rayven 料件多屬性補充修改，check_料號()內應再加傳p_cmd的參數
# Modify.........: No:MOD-660155 06/06/30 By kim 當修改單身時,當新值<>舊值時,改了單位二不會異動單位一
# Modify.........: No:FUN-660085 06/07/03 By Joe 若單身倉庫欄位已有值，則倉庫開窗查詢時，重新查詢時不會顯示該料號所有的倉儲。
# Modify.........: No:TQC-670008 06/07/05 By rainy 權限修正
# Modify.........: NO.TQC-660145 06/07/04 BY yiting 單價的控管,單價要可以為零,不可以小於零
# Modify.........: No:FUN-660216 06/07/10 By Rainy CALL cl_cmdrun()中的程式如果是"p"或"t"，則改成CALL cl_cmdrun_wait()
# Modify.........: No:FUN-670051 06/07/13 By kim GP3.5 利潤中心
# Modify.........: No:TQC-670089 06/07/25 By kim GP3.5 利潤中心
# Modify.........: No:TQC-670091 06/08/07 By Pengu 委外製程收貨應該要判斷該站製程發料量來控管委外收貨數量
# Modify.........: No:FUN-5A0090 06/08/08 By rainy 已結案的採購單不可取消確認
# Modify.........: No:FUN-680011 06/08/08 by Echo SPC整合專案-自動新增 QC 單據
# Modify.........: No:FUN-680136 06/09/08 By Jackho 欄位類型修改
# Modify.........: No:FUN-690024 06/10/05 By jamie 判斷pmcacti
# Modify.........: No.FUN-680064 06/10/18 By dxfwo 在新增函數_a()中的單身函數_b()前添加
#                                                           g_rec_b初始化命令
#                                                          "LET g_rec_b =0"
# Modify.........: No.MOD-6A0131 06/10/27 By 委外工單確認時,的檢查程序有誤
# Modify.........: No.CHI-6A0004 06/11/08 By bnlent 本幣原幣取位修改
# Modify.........: No:FUN-6B0032 06/11/10 By Czl 增加雙檔單頭折疊功能
# Modify.........: No:FUN-6A0162 06/11/16 By jamie 1.FUNCTION _q() 一開始應清空key值
#                                                  2.新增action"相關文件"
# Modify.........: NO.MOD-680004 06/11/23 BY Claire AFTER INSERT 段使用NEXT FIELD 就不需使用cancel insert
# Modify.........: NO.MOD-690012 06/11/23 BY Claire gec07已mark故不需給值
# Modify.........: No:MOD-6B0162 06/11/30 By ray 自動產生單身時計價數量應該是實收量-已交量
# Modify.........: No:TQC-6A0057 06/12/13 By pengu 委外製程時無法收貨
# Modify.........: No:TQC-6C0091 06/12/18 By Rayven mfg3037報錯信息未彈出導致報錯信息有誤，現改為報錯彈出
# Modify.........: No:TQC-6B0124 06/12/19 By pengu 參數勾選不使用多單位但使用計價單位時，計價單位與計價數量會異常
# Modify.........: No:FUN-6A0139 06/12/29 By rainy 未稅/含稅單價不顯示在畫面上
# Modify.........: No:CHI-6A0040 07/01/03 By jamie action"qc_status(驗收狀況)"原串apmq110 ->apmt110_x
# Modify.........: No:FUN-6C0055 07/01/08 By Joe 新增與GPM整合的顯示及查詢的Toolbar
# Modify.........: No:TQC-710042 07/01/11 By Joe 解決未經設定整合之工廠,會有Action顯示異常情況出現
# Modify.........: No:TQC-710032 07/01/15 By Smapmin 雙單位畫面調整
# Modify.........: No:CHI-6B0019 07/01/30 By rainy 委外不鎖超交問題
# Modify.........: No:FUN-710030 07/02/07 By johnray 錯誤訊息匯總顯示修改
# Modify.........: No:MOD-720103 07/03/07 By pengu 補登發票action輸入完後增加提示詢問是否更新所有項次的發票號碼
# Modify.........: No.TQC-6B0105 07/03/07 By carrier 連續兩次查詢,第二次查不到資料,做修改等操作會將當前筆停在上次查詢到的資料上
# Modify.........: No:MOD-730032 07/03/15 By pengu 當工單備料檔有"消耗性料件"時會照成製程委外無法收貨入庫
# Modify.........: No:MOD-730078 07/03/21 By pengu 將FUN-640123的調整還原
# Modify.........: No:FUN-730068 07/03/29 By kim 行業別架構
# Modify.........: No:TQC-730059 07/04/03 By pengu 委外製程在判斷足套數時應該考慮生產單位與採購單位轉換率
# Modify.........: No:TQC-6C0131 06/04/11 By pengu 未考慮計價數量的沖銷的情形
# Modify.........: No:MOD-740033 07/04/11 By claire 排除作廢單據
# Modify.........: No:TQC-740078 07/04/13 By chenl  修正非檢驗收貨單審核后，彈出的入庫單無資料。
# Modify.........: No:TQC-740117 07/04/20 By rainy GP5.0整合測試
# Modify.........: No.TQC-740313 07/04/25 By Ray 1.未直接產生入庫單 ,不必check img_file
#                                                2.參數設定 (sma886_7='N')  免檢不直接入庫 ,倉庫欄位可空白
#                                                3.限制不可更改計價單位
# Modify.........: No:MOD-740504 07/05/02 By kim 輸完單身採購項次,會出現-284的錯誤訊息
# Modify.........: No:MOD-740519 07/05/10 By claire 傳入入庫單的參數錯誤
# Modify.........: No:TQC-750097 07/05/18 By elva insrvu()時若插入異常則return
# Modify.........: No:FUN-750051 07/05/22 By johnray 連續二次查詢key值時,若第二次查詢不到key值時,會顯示錯誤key值
# Modify.........: No:TQC-750166 07/05/24 By kim 走runcard時,最小套數的檢查錯誤(作業編號抓錯)
# Modify.........: No:TQC-760055 07/06/06 By rainy 收貨單:003-07060001, 按確認, 僅出現..更新不成功, 應提示正確資訊以利user更改後再次確認
# Modify.........: No:TQC-760080 07/06/18 By chenl 多角貿易流程序好rva99欄位僅在apmt300中出現。
# Modify.........: No:MOD-760141 07/07/03 By Smapmin 不同廠商不可開同一發票
# Modify.........: No:CHI-770019 07/07/25 By Carrier 多單位:參考單位時,交易單位不寫入tlff
# Modify.........: No:FUN-710060 07/08/07 By jamie 料件供應商管制建議依品號設定;程式中原判斷sma63=1者改為判斷ima915=2 OR 3
# Modify.........: No:MOD-770082 07/08/09 By claire 製程委外時確認時仍會不允許倉儲批空白(mfg-021訊息顯示可空白)
# Modify.........: No:TQC-750014 07/08/15 By pengu 庫存轉換率異常
# Modify.........: No:TQC-770117 07/08/29 By claire 完全不使用計價單位時,自動產生入庫單時,計價數量仍維持原收貨量,應需call set_rvv87()
# Modify.........: NO.TQC-790003 07/09/03 BY yiting insert into前給予預設值
# Modify.........: No.MOD-790007 07/09/04 By claire 使用免驗收貨時不自動產生入庫單(sma886[7,7]不應再確認img_file
# Modify.........: No:MOD-790074 07/09/13 By claire 變數應將l_ac 改為p_i 才不致誤判訊息造成無法過帳
# Modify.........: No:MOD-790062 07/09/14 By claire 委外工單收貨除加入已確認單據,應再加入未確認及非本項次的數量
# Modify.........: No.MOD-790167 07/09/28 By Carol 使用免驗收貨時不自動產生入庫單(sma886[7,7]不應再確認img_file
# Modify.........: No:MOD-7A0030 07/10/05 By Claire 調整MOD-740504,否則會造成單身資料帶不出來
# Modify.........: No:CHI-7A0003 07/10/12 By Carol 還原TQC-740313的處理
# Modify.........: No:MOD-780060 07/10/17 By pengu 在計算最小套數時應排除委外代採買料
# Modify.........: No:MOD-7A0132 07/10/23 By claire MISC料的倉庫不可輸入,但移到下筆新增放棄後再回到上一筆MISC料,倉庫可以輸入,需控卡
# Modify.........: No:MOD-790176 07/10/30 By Pengu 調整MOD-7A0090
# Modify.........: No:MOD-7A0203 07/10/31 By Carol for MOD-7A0132調整單身set_no_entry_b()的邏輯
# Modify.........: No:MOD-7B0097 07/11/09 By claire 自動帶出單身時 rvb19不會有值
# Modify.........: No:MOD-7B0145 07/11/14 By claire l_smy57定義應為文字
# Modify.........: No:CHI-7B0023 07/11/16 By kim 移除GP5.0行業別功能的所有程式段
# Modify.........: No:TQC-7B0083 07/11/22 By Carier rvv88賦初值0
# Modify.........: No:TQC-7C0086 07/12/08 By Rayven 不能進入“發票號碼”欄位，錄入發票號
#                                                   外購收貨未檢查提單資料亦能審核
# Modify.........: No:TQC-7C0108 07/12/08 By wujie  收貨單號，采購單號都綁定屬性群組，單身手動輸入項次時，料號無法帶出
#                                                   通過采購單帶出的單身資料,不可修改料件子屬性
# Modify.........: No:TQC-7C0131 07/12/10 By Judy  收貨單號，采購單號都綁定屬性群組，單身手動輸入項次時，料號無法帶出加入到cl_set_entry_b()
# Modify.........: No:MOD-810024 08/01/03 By claire 單身自行輸入時, 不會自動帶入採購單資訊
# Modify.........: No:MOD-810073 08/01/09 By claire 還原失敗時,要rollback
# Modify.........: No:MOD-7B0203 08/01/09 By Pengu 若工單為事後到扣料時，則在收或確認時不應該強制工單要發料
# Modify.........: No:TQC-810048 08/01/15 By claire (1)多角待採正拋會有一張收貨單多張採購單狀況, 故單頭採購單應允許可以空白
#                                                   (2)合併收貨時,非MISC料rvb38批號若為null時,應給空字元
# Modify.........: No:MOD-810137 08/01/18 By claire 在寫入單身前,判斷倉儲批的值不塞null
# Modify.........: No.MOD-810208 08/01/25 By claire 以單身修改發票資料時,若選擇不回寫rvw_file,則rvb22也因不回寫
# Modify.........: No:MOD-810248 08/01/29 By claire 單身修改時,若採購項次為空白,則鍵入採購單號後無法跳至下一欄問題
# Modify.........: No:TQC-810094 08/01/31 By lumxa 計算最小發料套數的邏輯程序中FOREACH t110_min_c1 INTO l_sfa.*這段，計算sfa06，sfa05，sfa062，sfa063時有重復累加的問題，
# Modify.........: No:MOD-820073 08/02/18 By claire 委外收貨單確認時,單身若使用QBE查詢時不會列出所有單身筆數,造成chk_over()僅檢查列出資料
# Modify.........: No:CHI-820010 08/02/21 By claire 不使用計價單位,計價數量=實數數,rvb87()計算時避免小數位差問題
# Modify.........: No:MOD-820179 08/02/29 By claire 單身採購單修改與單頭單號不同時沒有控卡
# Modify.........: No:MOD-830023 08/03/05 By claire g_rvb[l_ac]--> g_rvb[p_ac] 調整
# Modify.........: No:MOD-830171 08/03/21 By claire 使用計價單位時,於採購單已修改計價數量應以採購單計價數量為主不需重推收貨單的計價數量
# Modify.........: No:MOD-830210 08/03/26 By Dido 單身輸入發票後也需要詢問更新單身動作
# Modify.........: No:CHI-830033 08/03/31 By claire 未(含)稅金額=未(含)稅單價*計價數量的方式調整為:
#                                                   (1)單價含稅時,以含稅金額/(1+稅率)/100 = 未稅金額
#                                                   (1)單價未稅時,以未稅金額*(1+稅率)/100 = 含稅金額
# Modify.........: No:MOD-840130 08/04/16 By claire 免驗料自動入庫時,計價數量直來自收貨單的計價數量,不再重推
# Modify.........: No:FUN-840012 08/04/28 By kim 提供自動確認的功能
# Modify.........: No:CHI-840066 08/05/05 By claire 委外製程時,不確認最小發料套數
# Modify.........: No:CHI-840071 08/05/06 By Dido 調整 Transation 架構語法
# Modify.........: No:FUN-850022 08/05/07 By Kevin 將Function t110_get_rvb39()獨立成共用程式
# Modify.........: No:MOD-850093 08/05/09 By claire 最終供應商值為NULL時應給空值,才不會誤判
# Modify.........:               08/07/01 By yinwei 原有字段rva07送货单号，具开窗查询
# Modify.........:               08/07/25 By lichaob 计算采购订单未交量时要考虑仓退的数量，即未交量＝pmn20－（pmn50－pmn55）－pmn58。
# Modify.........: No:080829     08/08/29 By chenl  修正将实收数量改回旧值后，计价数量不更新的问题。
# Modify.........:               08/09/19 By yinwei 屏蔽L/C收货
# Modify.........:               08/12/01 by CJY 不良品收货单价设为0
# Modify ........: 140716 by beamon 产生入库单 时自动带出刀具寿命
# Modify ........: 140801 by beamon 只对刀具管理料号入寿命仓
# Modify ........: 141014 by lily 由舊系統搬至新系統，增加資料清單，自定字段頁以及新系統必要欄位
# Modify.........: 141125 by stevie  增加委外申請表欄位，如果沒有相應申請表不能確認
# Modify.........: 150408 by yinghui 單身rvb35樣品否欄位設置為不可修改(默認值為N)
# Modify.........: add by endy 20150513 如果是集团内交易，出貨單已過帳，则不允许作废
# Modify.........: 20160318  by wenny添加单别为271时设置检验码rvb39为'N'
# Modify.........: 20160624  by jianwei WFWIP修改为YWFWIP
# Modify.........: 20160711  by jianwei 根据料件的分群码来设定仓库
# Modify.........: 2016-11-04 by dengyu 程式BUG,自动带出单身内容的逻辑错误，实收数量可以随意输入
# Modify.........: 20161105  by lucy  委外返工工单根据料件分群码来设定仓库
# Modify.........: 2016-11-11  by jianwei  取价时委外核价单应该是已审核的
# Modify.........: 2016-11-28  by jianwei  修正铠嘉的委外返工工单根据料件分群码来设定仓库，取不到仓库则取取料件的主要仓库

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"
GLOBALS "../4gl/capmt110.global"

DEFINE g_shr  LIKE type_file.chr1
DEFINE g_oga09  LIKE oga_file.oga09
#-----------by lily add 20141013--------------
DEFINE g_rva_l DYNAMIC ARRAY OF RECORD
               rva01         LIKE rva_file.rva01,
               rva06         LIKE rva_file.rva06,
               rva02         LIKE rva_file.rva02,
               rva05         LIKE rva_file.rva05,
               pmc03         LIKE pmc_file.pmc03,
               rva04         LIKE rva_file.rva04,
               rva21         LIKE rva_file.rva21,
               rva08         LIKE rva_file.rva08,
               rva09         LIKE rva_file.rva09,
               rva10         LIKE rva_file.rva10,
               rvaconf       LIKE rva_file.rvaconf,
               rvacond       LIKE rva_file.rvacond,
               rvaconu       LIKE rva_file.rvaconu,
               rvaconu_desc  LIKE gen_file.gen02,
               rva29         LIKE rva_file.rva29,
               rva33         LIKE rva_file.rva33,
               gen02         LIKE gen_file.gen02,
               rvamksg       LIKE rva_file.rvamksg,
               rva32         LIKE rva_file.rva32
               END RECORD,
        l_ac4    LIKE type_file.num5,
        g_rec_b4 LIKE type_file.num5,
        g_action_flag  STRING
DEFINE   w    ui.Window
DEFINE   f    ui.Form
DEFINE   page om.DomNode
#-------------by lily end-----------------------
DEFINE g_coz01  LIKE coz_file.coz01,
       g_ta_smy01 LIKE smy_file.ta_smy01,
       g_smyslip            LIKE smy_file.smyslip,
       g_bs     varchar(1)

FUNCTION t110(p_argv1,p_argv2,p_argv3,p_argv4,p_argv5) #No:FUN-630010 #FUN-840012
   DEFINE l_time     LIKE type_file.chr8,     #No.FUN-680136 VARCHAR(8)
          p_argv1    LIKE rva_file.rva01,     #收貨單號
          p_argv2    LIKE rva_file.rva10,     #採購類別
          p_argv3    LIKE rva_file.rva04,     #L/C收貨
          p_argv4    STRING,                  #No:FUN-630010 執行功能
          p_argv5    LIKE type_file.chr1      #FUN-840012  1:執行確認

   WHENEVER ERROR CALL cl_err_msg_log

   LET g_argv1_2=p_argv1
   LET g_argv2_2=p_argv2
   LET g_argv3_2=p_argv3
   LET g_argv4_2=p_argv4     #No:FUN-630010
   LET g_argv5=p_argv5     #FUN-840012
#   LET g_argv6=p_argv6

  # LET g_forupd_sql = "SELECT * FROM rva_file WHERE ROWID = ? FOR UPDATE NOWAIT"
  # DECLARE t110_cl CURSOR FROM g_forupd_sql
   CALL t110_set_cl()

   IF (NOT cl_null(g_argv5)) AND (g_argv5='1') THEN  #FUN-840012 1:執行自動確認
      LET g_bgjob='Y'  #M化
      CALL t110_q()
      CALL t110_y()
   ELSE
      LET p_row = 3 LET p_col = 8
      CASE
         WHEN  g_argv2_2 = 'SUB'
            OPEN WINDOW t110_w AT p_row,p_col           #顯示畫面
              WITH FORM "cpm/42f/cpmt200"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No:FUN-580092 HCN
         WHEN g_argv2_2 = 'TAP'
            OPEN WINDOW t110_w AT p_row,p_col           #顯示畫面
              WITH FORM "cpm/42f/apmt300"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No:FUN-580092 HCN
         OTHERWISE
            OPEN WINDOW t110_w AT p_row,p_col           #顯示畫面
              WITH FORM "cpm/42f/apmt110"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No:FUN-580092 HCN

      END CASE


     #No.TQC-760080--begin--
      IF g_argv2_2 != 'TAP' THEN
         CALL cl_set_comp_visible("rva99",FALSE)
      END IF
     #No.TQC-760080--end--

      CALL cl_ui_init()

      #No:FUN-6C0055 --start--
      IF g_aza.aza71 MATCHES '[Yy]' THEN
         CALL aws_gpmcli_toolbar()
         CALL cl_set_act_visible("gpm_show,gpm_query", TRUE)
      ELSE
         CALL cl_set_act_visible("gpm_show,gpm_query", FALSE)
      END IF
      #No:FUN-6C0055 --end--
      CALL cl_set_comp_entry("rvb86",FALSE)      #No.TQC-740313

      #No:FUN-550117  No:FUN-560102
   #  IF g_aza.aza26 != '2' THEN
   #     CALL cl_set_comp_visible("rvb10t,pmm21,pmm43,gec07",FALSE)
   #  END IF
      #end No:FUN-550117


      CALL t110_mu_ui()

       #FUN-670051...............begin
       CALL cl_set_comp_visible("rvb930,gem02a",g_aaz.aaz90='Y')
       #FUN-670051...............end

       #TQC-650108
       #初始化界面的樣式(沒有任何默認屬性組)
       LET lg_smy62 = ''
       LET lg_group = ''
       CALL t110_refresh_detail()
       #TQC-650108 --end

      IF NOT cl_null(g_argv1_2) THEN
         #No:FUN-630010 --start--
         CASE g_argv4_2
            WHEN "query"
               LET g_action_choice = "query"
               IF cl_chk_act_auth() THEN
                  CALL t110_q()
               END IF
            WHEN "insert"
               LET g_action_choice = "insert"
               IF cl_chk_act_auth() THEN
                  CALL t110_a()
               END IF
            OTHERWISE
               CALL t110_q()
              #CALL t110_cs()
              #CALL t110_fetch('F')
         END CASE
         #No:FUN-630010 ---end---
      END IF

      CALL t110_coz01()#by stevie 141210
      CALL t110_menu()

      #FUN-680011---start---
      IF g_aza.aza64 matches '[ Nn]' OR g_aza.aza64 IS NULL THEN
         CALL cl_set_act_visible("trans_spc",TRUE)
         CALL cl_set_comp_visible("rvaspc",TRUE)
      END IF
      #FUN-680011---end---

      CLOSE WINDOW t110_w                 #結束畫面
   END IF
END FUNCTION
FUNCTION t110_set_cl()
   LET g_forupd_sql = "SELECT * FROM rva_file WHERE ROWID = ? FOR UPDATE NOWAIT"
   DECLARE t110_cl CURSOR FROM g_forupd_sql
END FUNCTION

FUNCTION t110_cs()
DEFINE  lc_qbe_sn       LIKE    gbm_file.gbm01   #No:FUN-580031  HCN
DEFINE  l_pmm04         LIKE    pmm_file.pmm04   #No:MOD-4B0275

   CLEAR FORM                             #清除畫面
   CALL g_rvb.clear()

IF g_rr<>'rirunquery' THEN
   IF cl_null(g_argv1_2) THEN
      INITIALIZE g_rva.* TO NULL      #No.FUN-750051
      CONSTRUCT BY NAME g_wc ON
         rva01,rva06,rva02,rva05,rva99,rva04,rva07,rva21,rva08,rvaprno,   # by cjy 09/06/19 add rvaprno
         rva09,rva10,rvaconf,rvaspc,ta_rva01,ta_rva03,ta_rva04,    #  by cjy 09/01/08    ta_rva01        # by cjy 101125 add ta_rva03                   #FUN-680011
         rvauser,rvagrup,rvamodu,rvadate,rvaacti,ta_rva02,   #  by cjy add ta_rva02 10/07/23
  #-------------by lily add 20141013--------------
         rvaud01,rvaud02,rvaud03,rvaud04,rvaud05,
         rvaud06,rvaud07,rvaud08,rvaud09,rvaud10,
         rvaud11,rvaud12,rvaud13,rvaud14,rvaud15
  #-------------by lily end---------------------
               #No:FUN-580031 --start--     HCN
               BEFORE CONSTRUCT
                  CALL cl_qbe_init()
               #No:FUN-580031 --end--       HCN

       ON ACTION controlp
          CASE
             #--No.FUN-4A0034----------
             WHEN INFIELD(rva01) #查詢收貨單號
                CALL cl_init_qry_var()
                LET g_qryparam.state= "c"
                CASE
                   WHEN g_argv2_2 = 'SUB'   LET g_qryparam.form = "q_rva05"
                   WHEN g_argv2_2 = 'TAP'   LET g_qryparam.form = "q_rva07"
                   OTHERWISE              LET g_qryparam.form = "q_rva06"
                END CASE
            CALL cl_create_qry() RETURNING g_qryparam.multiret
            DISPLAY g_qryparam.multiret TO rva01
            NEXT FIELD rva01
             #--END---------------------
             WHEN INFIELD(rva02) #查詢採購單號
#               CALL q_pmm6(2,16,g_rva.rva02,g_argv2_2) RETURNING g_rva.rva02
                CALL cl_init_qry_var()
                LET g_qryparam.state ="c"
                LET g_qryparam.form ="q_pmm6"
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO rva02
                NEXT FIELD rva02
             WHEN INFIELD(rva05) #查詢廠商
#               CALL q_pmc1(0,0,g_rva.rva05) RETURNING g_rva.rva05
                CALL cl_init_qry_var()
                LET g_qryparam.state ="c"
                LET g_qryparam.form ="q_pmc1"
                LET g_qryparam.default1 = g_rva.rva05
                CALL cl_create_qry() RETURNING g_rva.rva05
                DISPLAY BY NAME g_rva.rva05
                CALL t110_rva05('a')
                NEXT FIELD rva05
             WHEN INFIELD(rva07) #查詢送貨單號
                CALL cl_init_qry_var()
                LET g_qryparam.state ="c"
                LET g_qryparam.form ="q_rva001"
                CALL cl_create_qry() RETURNING g_qryparam.multiret
                DISPLAY g_qryparam.multiret TO rva07
                NEXT FIELD rva07
           END CASE

         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121

        #No:FUN-580031 --start--     HCN
      ON ACTION qbe_select
             CALL cl_qbe_list() RETURNING lc_qbe_sn
             CALL cl_qbe_display_condition(lc_qbe_sn)
        #No:FUN-580031 --end--       HCN
      END CONSTRUCT

      IF INT_FLAG THEN
         RETURN
      END IF
   ELSE
      LET g_wc= " rva01= '",g_argv1_2 CLIPPED,"'"
      LET g_wc2 = ' 1=1'
   END IF
   #資料權限的檢查
   IF g_priv2='4' THEN                           #只能使用自己的資料
      LET g_wc = g_wc clipped," AND rvauser = '",g_user,"'"
   END IF

   IF g_priv3='4' THEN                           #只能使用相同群的資料
      LET g_wc = g_wc clipped," AND rvagrup MATCHES '",g_grup CLIPPED,"*'"
   END IF

   IF g_priv3 MATCHES "[5678]" THEN    #TQC-5C0134群組權限
      LET g_wc = g_wc clipped," AND rvagrup IN ",cl_chk_tgrup_list()
   END IF


   CASE WHEN g_argv2_2='SUB'         #委外
             LET g_wc = g_wc clipped," AND rva10 = 'SUB' "
        WHEN g_argv2_2='TAP'         #三角代採買
             LET g_wc = g_wc clipped," AND (rva10 = 'TAP' OR rva10='TRI') " #No.7882
        OTHERWISE
             LET g_wc = g_wc clipped," AND rva10 != 'SUB' AND rva10 !='TAP' ",
                                     " AND rva10 != 'TRI' " #No.7882
   END CASE
   CALL cl_set_head_visible("","YES")           #No.FUN-6B0032

   IF cl_null(g_argv1_2) THEN
       #No.FUN-540027  --begin
       CONSTRUCT g_wc2 ON rvb02,rvb22,rvb04,rvb03,rvb34,rvb05,rvb30,rvb29,
                          rvb35,rvb07,rvb83,rvb84,rvb85,rvb80,rvb81,rvb82,
                          rvb86,rvb87,rvb10,rvb10t,rvb36,rvb37,rvb38,rvb25,   #No:FUN-550117
                          rvb930   #FUN-670051
        FROM s_rvb[1].rvb02,s_rvb[1].rvb22,s_rvb[1].rvb04,s_rvb[1].rvb03,
             s_rvb[1].rvb34,s_rvb[1].rvb05,s_rvb[1].rvb30,s_rvb[1].rvb29,
             s_rvb[1].rvb35,s_rvb[1].rvb07,s_rvb[1].rvb83,s_rvb[1].rvb84,
             s_rvb[1].rvb85,s_rvb[1].rvb80,s_rvb[1].rvb81,s_rvb[1].rvb82,
             s_rvb[1].rvb86,s_rvb[1].rvb87,s_rvb[1].rvb10,s_rvb[1].rvb10t,   #No:FUN-550117
             s_rvb[1].rvb36,s_rvb[1].rvb37,s_rvb[1].rvb38,s_rvb[1].rvb25,    #No:FUN-550117
             s_rvb[1].rvb930   #FUN-670051
       #No.FUN-540027  --end

        #No:FUN-580031 --start--     HCN
        BEFORE CONSTRUCT
           CALL cl_qbe_display_condition(lc_qbe_sn)
        #No:FUN-580031 --end--       HCN
        ON ACTION CONTROLP
             CASE  WHEN INFIELD(rvb04)    #
                     CALL cl_init_qry_var()
                     CASE
                        WHEN g_argv2_2 = 'SUB'   LET g_qryparam.form = "q_pmm9"
                        WHEN g_argv2_2 = 'TAP'   LET g_qryparam.form = "q_pmm10"
                        OTHERWISE              LET g_qryparam.form = "q_pmm11"
                     END CASE
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO rvb04
                     NEXT FIELD rvb04
                   WHEN INFIELD(rvb05)    #
                     CALL cl_init_qry_var()
                     LET g_qryparam.form = "q_ima"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO rvb05
                     NEXT FIELD rvb36
                    WHEN INFIELD(rvb36)  #MOD-480604查詢倉庫
                     CALL cl_init_qry_var()
                     LET g_qryparam.form = "q_imd"
                     LET g_qryparam.state = "c"
                     #LET g_qryparam.arg1  = "A"  #MOD-4A0213
                      LET g_qryparam.arg1     = 'SW'        #倉庫類別 #MOD-4A0213
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO rvb36
                     NEXT FIELD rvb36
                    #No:MOD-4B0275
                   WHEN INFIELD(rvb25)
                     SELECT pmm04 INTO l_pmm04 FROM pmm_file
                      WHERE pmm01 = g_rvb[1].rvb04
                     CALL q_coc2(TRUE,TRUE,g_rvb[1].rvb25,'',l_pmm04,'1',
                                 '',g_rvb[1].rvb05)
                     RETURNING g_rvb[1].rvb25
                      DISPLAY BY NAME g_rvb[1].rvb25                #No:MOD-490371
                     NEXT FIELD rvb25
                    #No:MOD-4B0275 end
                #No.FUN-540027  --begin
                WHEN INFIELD(rvb83)
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_gfe"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO rvb83
                     NEXT FIELD rvb83

                WHEN INFIELD(rvb80)
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_gfe"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO rvb80
                     NEXT FIELD rvb80

                WHEN INFIELD(rvb86)
                     CALL cl_init_qry_var()
                     LET g_qryparam.state = "c"
                     LET g_qryparam.form ="q_gfe"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO rvb86
                     NEXT FIELD rvb86
                #No.FUN-540027  --end
                #FUN-670051...............begin
                WHEN INFIELD(rvb930)
                   CALL cl_init_qry_var()
                   LET g_qryparam.form  = "q_gem4"
                   LET g_qryparam.state = "c"   #多選
                   CALL cl_create_qry() RETURNING g_qryparam.multiret
                   DISPLAY g_qryparam.multiret TO rvb930
                   NEXT FIELD rvb930
                #FUN-670051...............end
             END CASE

        ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE CONSTRUCT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121


        #No:FUN-580031 --start--     HCN
                    ON ACTION qbe_save
               CALL cl_qbe_save()
        #No:FUN-580031 --end--       HCN
      END CONSTRUCT
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         RETURN
      END IF
   END IF

   IF g_wc2 = ' 1=1 ' THEN            # 若單身未輸入條件
      LET g_sql = "SELECT ROWID, rva01 FROM rva_file ",
                  " WHERE ", g_wc CLIPPED,
                  "   AND (ta_rva06 = 'N' OR ta_rva06 IS NULL) ",
                  " ORDER BY 2"
   ELSE                    # 若單身有輸入條件
      LET g_sql = "SELECT UNIQUE rva_file.ROWID, rva01 ",
                  "  FROM rva_file, rvb_file ",
                  " WHERE rva01 = rvb01",
                  "   AND (ta_rva06 = 'N' OR ta_rva06 IS NULL) ",
                  "   AND ", g_wc CLIPPED, " AND ",g_wc2 CLIPPED,
                  " ORDER BY 2"
   END IF

END  IF
   ###########BY CJY 071023 增加查詢未經過日潤審核的單據START #############
   IF g_rr='rirunquery'  THEN
    LET g_sql = "SELECT ROWID, rva01 FROM rva_file ",
                  " WHERE rva05='RT0037' and rva10='SUB' and  (ta_rva02='N' OR ta_rva02 is null) and rvaconf<>'X' ",
                  " ORDER BY 2"

   END IF

   ###########BY CJY 071023 增加查詢未經過日潤審核的單據END  #############
   PREPARE t110_prepare FROM g_sql
   DECLARE t110_cs                         #SCROLL CURSOR
    SCROLL CURSOR WITH HOLD FOR t110_prepare
    DECLARE t110_fill_cs CURSOR FOR t110_prepare   #by lily add 20141014

   IF g_wc2 = ' 1=1 ' THEN            # 取合乎條件筆數
      LET g_sql="SELECT COUNT(*) FROM rva_file WHERE ",g_wc CLIPPED," AND (ta_rva06 = 'N' OR ta_rva06 IS NULL) "
   ELSE
      LET g_sql="SELECT COUNT(DISTINCT rva01) FROM rva_file,rvb_file WHERE ",
                "rvb01=rva01 AND ",g_wc CLIPPED," AND ",g_wc2 CLIPPED," AND (ta_rva06 = 'N' OR ta_rva06 IS NULL) "
   END IF

      ###########BY CJY 071023 增加查詢未經過日潤審核的單據START #############
   IF g_rr='rirunquery' THEN
  LET g_sql="SELECT COUNT(*) FROM rva_file WHERE rva05='RT0037' and rva10='SUB' and (ta_rva02='N' OR ta_rva02 is null) and rvaconf<>'X' ",
            " AND (ta_rva06 = 'N' OR ta_rva06 IS NULL) "

   END IF

   ###########BY CJY 071023 增加查詢未經過日潤審核的單據END  #############

   PREPARE t110_precount FROM g_sql
   DECLARE t110_count CURSOR FOR t110_precount

END FUNCTION

FUNCTION t110_menu()
   DEFINE   l_cmd   LIKE type_file.chr1000 #No.FUN-680136 VARCHAR(100)
   #No:FUN-6C0055 --start--
   DEFINE l_partnum    STRING   #GPM料號
   DEFINE l_supplierid STRING   #GPM廠商
   DEFINE l_status     LIKE type_file.num10  #GPM傳回值
   #No:FUN-6C0055 --end--
   DEFINE  l_ret  LIKE type_file.num5  # add by caroline_zhang 20110402
   DEFINE  l_f    LIKE type_file.chr1
   DEFINE   l_i     LIKE type_file.num5
   DEFINE l_rvu01      LIKE rvu_file.rvu01     #by lily add 20141213


   WHILE TRUE
     # CALL t110_bp("G")   #by lily modify 20141013
#-------by lily add 20141013---------------------------
 IF cl_null(g_action_flag) OR g_action_flag = "page_main" THEN
      CALL t110_bp("G")

  ELSE
         CALL t110_list_fill()
         CALL t110_bp2("G")
         IF NOT cl_null(g_action_choice) AND l_ac4>0 THEN #將清單的資料回傳到主畫面
            SELECT rva_file.* INTO g_rva.*
              FROM rva_file
             WHERE rva01=g_rva_l[l_ac4].rva01
         END IF
         IF g_action_choice!= "" THEN
            LET g_action_flag = "page_main"
            LET l_ac4 = ARR_CURR()
            LET g_jump = l_ac4
            LET mi_no_ask = TRUE
            IF g_rec_b4 >0 THEN
               CALL t110_fetch('/')
            END IF
            CALL cl_set_comp_visible("page_list", FALSE)
            CALL cl_set_comp_visible("info,userdefined_field", FALSE)
            CALL ui.interface.refresh()
            CALL cl_set_comp_visible("page_list", TRUE)
           #CALL cl_set_comp_visible("info,userdefined_field", TRUE) #MOD-D30148 mark
           #MOD-D30148 add start -----
            CALL cl_set_comp_visible("info,userdefined_field", TRUE)
           #MOD-D30148 add end   -----
          END IF
      END IF
#------------by lily end --------------------
      CASE g_action_choice

         WHEN "insert"
            IF cl_chk_act_auth() THEN
               CALL t110_a()
            END IF
         WHEN "query"
            IF cl_chk_act_auth() THEN
              LET g_rr='query'
               CALL t110_q()
            END IF

############加入日潤確認按鈕start 100723##########

         WHEN "rirunquery"
            IF cl_chk_act_auth() THEN
              LET g_rr='rirunquery'
               CALL t110_rirunq()
            END IF

         WHEN "rirunconfirm"
            IF cl_chk_act_auth() THEN
              CALL s_get_mrp_state()         # add by caroline_zhang 20110402  确认系统是否在跑MRP
                 RETURNING l_ret
               IF l_ret THEN
                 CALL t110_rirun()
               END IF
            END IF

         WHEN "rirunnoconfirm"
            IF cl_chk_act_auth() THEN
            CALL s_get_mrp_state()         # add by caroline_zhang 20110402  确认系统是否在跑MRP
                 RETURNING l_ret
               IF l_ret THEN
                CALL t110_rirun_no()
               END IF
            END IF

############加入日潤確認按鈕start 100723##########


       #@WHEN "勝瑞過賬"
         WHEN "sr_post"
            IF cl_chk_act_auth() THEN
               CALL t110_sr_post()
            END IF


         WHEN "delete"
            IF cl_chk_act_auth() THEN
               CALL t110_r()
            END IF
         WHEN "modify"
            IF cl_chk_act_auth() THEN
               CALL t110_u()
            END IF
         WHEN "detail"
            IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01) THEN
               CALL t110_b()
            ELSE
               LET g_action_choice = NULL
            END IF
         WHEN "output"
            IF cl_chk_act_auth() THEN
               CALL t110_out()
            END IF
         WHEN "help"
            CALL cl_show_help()
         WHEN "exit"
            EXIT WHILE
         WHEN "controlg"
            CALL cl_cmdask()
         WHEN "add_invoice"
            CALL t110_k()
         WHEN "void"
            IF cl_chk_act_auth() THEN
               CALL t110_x()
            END IF
         WHEN "confirm"
            IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01) THEN
             CALL s_get_mrp_state()         # add by caroline_zhang 20110402  确认系统是否在跑MRP
                 RETURNING l_ret
               IF l_ret THEN
                CALL t110_check_price() #steven_yue add 20110622
               RETURNING l_f
                   IF l_f='Y' THEN
                     CALL t110_y()
                   END IF
               END IF
            END IF
         WHEN "undo_confirm"
            IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01) THEN
              CALL s_get_mrp_state()         # add by caroline_zhang 20110402  确认系统是否在跑MRP
                 RETURNING l_ret
               IF l_ret THEN
#-------------------------------START---------------------------ADD BY ZELIANG 20130719
                    LET l_i = 0
                    SELECT COUNT(*) INTO l_i FROM sfp_file WHERE sfp08 = g_rva.rva01 AND sfpconf <>'X'
                    IF l_i >0 THEN
                        MESSAGE '系统中存在发料单，不允许取消审核！'
                        CONTINUE WHILE
                    END IF
#--------------------------------END----------------------------
                CALL t110_z()
               END IF
            END IF
         WHEN "qc_status"
            IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01) THEN
               LET l_cmd = "apmt110_x '",g_rva.rva01,"'"   #CHI-6A0040 mod
               CALL cl_cmdrun(l_cmd)
            END IF
         WHEN "generate_st_in_qc_return"
            IF cl_chk_act_auth() THEN
               CALL t110_g()
            END IF
  #       WHEN  "generate_sfs"
 #        IF cl_chk_act_auth() THEN
 #              CALL t110_sfs()
 #           END IF
         WHEN "qry_st_in"
            IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01) THEN
               LET l_rvu01 = '' #by lily add 20141213
               SELECT rvu01 INTO l_rvu01 FROM rvu_file WHERE rvu00 = '1' AND rvu02 = g_rva.rva01    #by lily 20141213

               CASE
                  WHEN g_rva.rva10='SUB'
                   #  LET g_cmd = "apmt730 ","'",g_rva.rva01 CLIPPED,"' '' ",    #by lily mod  141212
                                # "'1' '' 'SUB'"  #No:FUN-630010       #by lily mod 141212

                      LET g_cmd = "apmt730 ","'",l_rvu01 CLIPPED,"' '' '",g_rva.rva01 CLIPPED,"' '1' 'SUB'" #by lily mod 20141213
                  WHEN g_rva.rva10='TAP' OR g_rva.rva10 = 'TRI'
                    # LET g_cmd = "apmt740 ","'",g_rva.rva01 CLIPPED,"' '' '1'"  #No:FUN-630010
                     LET g_cmd = "apmt740 ","'",l_rvu01 CLIPPED,"' '' '",g_rva.rva01 CLIPPED,"' '1'" #by lily mod 20141213
                  OTHERWISE
                   #  LET g_cmd = "apmt720 ","'",g_rva.rva01 CLIPPED,"' '' '1'"  #No:FUN-630010
                     LET g_cmd = "apmt720 ","'",l_rvu01 CLIPPED,"' '' '",g_rva.rva01 CLIPPED,"' '1'"    #by lily mod 20141213
               END CASE
               #CALL cl_cmdrun(g_cmd)     #FUN-660216 remark
               CALL cl_cmdrun_wait(g_cmd) #FUN-660216 add
            END IF


            WHEN "qry_st_out"                      # steven_yue  add  20101208
            IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01) THEN
               IF cl_null(g_rva.ta_rva03) THEN
                  SELECT sfp01 INTO g_rva.ta_rva03 FROM sfp_file
                   WHERE sfp08 = g_rva.rva01
                    AND sfp06 = '6'
                    AND sfpconf !='X'
                   IF NOT cl_null(g_rva.ta_rva03) THEN
                      UPDATE rva_file SET ta_rva03 =g_rva.ta_rva03 WHERE rva01 = g_rva.rva01
                      DISPLAY BY NAME g_rva.ta_rva03
                   END IF
               END IF
               LET g_cmd = "asfi526 '",g_rva.ta_rva03 CLIPPED,"' '' "
               CALL cl_cmdrun_wait(g_cmd) #FUN-660216 add
            END IF

             WHEN "qry_st_dev"                      # steven_yue  add  20110130
            IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01) THEN
                     LET g_cmd = "asfi511 '",g_rva.ta_rva01 CLIPPED,"' '' "
               CALL cl_cmdrun_wait(g_cmd) #FUN-660216 add
            END IF

            WHEN "callina4"
              IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01)  THEN
                 CALL callina4()
              END IF

         WHEN "qry_qc_return"
            LET l_rvu01 = '' #by lily add 20141213
            SELECT rvu01 INTO l_rvu01 FROM rvu_file WHERE rvu00 = '2' AND rvu02 = g_rva.rva01   #by lily add 20141213
            IF cl_chk_act_auth() AND NOT cl_null(g_rva.rva01) THEN
               CASE
                  WHEN g_rva.rva10='SUB'
               #      LET g_cmd = "apmt731 ","'",g_rva.rva01 CLIPPED,"' '' ",
                   #   LET g_cmd = "cpmt731 ","'",g_rva.rva01 CLIPPED,"' '' ", # 新增委外客制程序
                    #             "'2' 'SUB'"  #No:FUN-630010
                      LET g_cmd = "cpmt731 ","'",l_rvu01 CLIPPED,"' '' '",g_rva.rva01 CLIPPED,"' '2' 'SUB'"  #by lily add 20141213
                  WHEN g_rva.rva10='TAP' OR g_rva.rva10 = 'TRI'
                  #   LET g_cmd = "apmt741 ","'",g_rva.rva01 CLIPPED,"' '' '2'"  #No:FUN-630010
                     LET g_cmd = "apmt741 ","'",l_rvu01 CLIPPED,"' '' '",g_rva.rva01 CLIPPED,"' '2'"  #by lily add 20141213
                  OTHERWISE
                    # LET g_cmd = "apmt721 ","'",g_rva.rva01 CLIPPED,"' '' '2'"  #No:FUN-630010
                     LET g_cmd = "apmt721 ","'",l_rvu01 CLIPPED,"' '' '",g_rva.rva01 CLIPPED,"' '2'"   #by lily add 20141213
               END CASE
               #CALL cl_cmdrun(g_cmd)      #FUN-660216 remark
               CALL cl_cmdrun_wait(g_cmd)  #FUN-660216 add
            END IF
         WHEN "receiving"
            LET g_cmd = "apmq320 '",g_rva.rva01,"'"
            CALL cl_cmdrun(g_cmd)
         WHEN "exporttoexcel"     #FUN-4B0025
#---------------by lily modify 20141013-------------
            #IF cl_chk_act_auth() THEN
            #  CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_rvb),'','')

           LET w = ui.Window.getCurrent()
            LET f = w.getForm()
            IF cl_null(g_action_flag) OR g_action_flag = "page_main" THEN
               IF cl_chk_act_auth() THEN
                  LET page = f.FindNode("Page","page_main")
                  CALL cl_export_to_excel(page,base.TypeInfo.create(g_rvb),'','')
               END IF
  #------------------by lily end---------------------------
            END IF
            IF g_action_flag = "page_list" THEN
               LET page = f.FindNode("Page","page_list")
               IF cl_chk_act_auth() THEN
                  CALL cl_export_to_excel(page,base.TypeInfo.create(g_rva_l),'','')
               END IF
            END IF
            #FUN-CB0014---add---end---

         WHEN "trans_spc"         #FUN-680011
            IF cl_chk_act_auth() THEN
               CALL t110_spc()
            END IF

         #No:FUN-6A0162-------add--------str----
         WHEN "related_document"  #相關文件
              IF cl_chk_act_auth() THEN
                 IF g_rva.rva01 IS NOT NULL THEN
                 LET g_doc.column1 = "rva01"
                 LET g_doc.value1 = g_rva.rva01
                 CALL cl_doc()
               END IF
         END IF
         #No:FUN-6A0162-------add--------end----

         #No:FUN-6C0055 --start--
         #@WHEN GPM規範顯示
         WHEN "gpm_show"
              LET l_partnum = ''
              LET l_supplierid = ''
              IF l_ac > 0 THEN LET l_partnum = g_rvb[l_ac].rvb05 END IF
              LET l_supplierid = g_rva.rva05
              CALL aws_gpmcli(l_partnum,l_supplierid)
                RETURNING l_status

         #@WHEN GPM規範查詢
         WHEN "gpm_query"
              LET l_partnum = ''
              LET l_supplierid = ''
              IF l_ac > 0 THEN LET l_partnum = g_rvb[l_ac].rvb05 END IF
              LET l_supplierid = g_rva.rva05
              CALL aws_gpmcli(l_partnum,l_supplierid)
                RETURNING l_status
        #No:FUN-6C0055 --end--

      END CASE
   END WHILE
END FUNCTION


FUNCTION t110_sr_post()
DEFINE l_plant  LIKE azp_file.azp01  #PLANT營運中 心
DEFINE l_dbs,l_dbs1   LIKE azp_file.azp03  #DB


IF cl_null(g_rva.rva01) OR cl_null(g_rva.rva05) OR cl_null(g_rva.rva07)  THEN RETURN END IF


 LET l_plant = g_rva.rva05

 LET l_dbs = ''
 SELECT tc_szp03 INTO l_dbs FROM tc_szp_file WHERE tc_szp01 = l_plant
 IF cl_null(l_dbs) THEN RETURN END IF

IF cl_null(l_plant) THEN RETURN END IF

LET g_success = 'Y'
CALL t110_shr()
IF g_success = 'N' THEN RETURN END IF


 LET l_dbs1 = g_dbs

 CLOSE DATABASE
 DATABASE l_dbs
  LET g_success = 'Y'
  LET g_prog = 'axmt620'
  IF g_oga09 = '3' THEN LET g_prog='axmt650' END IF
  CALL t600sub_s('2',FALSE,g_rva.rva07,FALSE)
  LET g_prog = 'cpmt200'

 CLOSE DATABASE
 DATABASE l_dbs1

 CALL t110_set_cl()
 CALL t110_shr_show()

END FUNCTION

FUNCTION callina4()
  DEFINE l_ina01  LIKE ina_file.ina01
  DEFINE l_cmd        LIKE type_file.chr1000 #No.FUN-680121 VARCHAR(100)

  SELECT ina01 INTO l_ina01 FROM ina_file
   WHERE ina10 = g_rva.rva01  and ina00='4' and inaconf<>'X'
     AND ina01 LIKE 'SCI%'          # add by steven_yue 20110320
  IF SQLCA.sqlcode THEN
     IF SQLCA.sqlerrd[3]=0 THEN

        CALL cl_err3("sel","ina_file",g_rva.rva01,"","asf-020","","",1)  #No.FUN-660128
        RETURN
     ELSE
     RETURN
     END IF
  END IF

  IF NOT cl_null(l_ina01) THEN
     LET l_cmd = "aimt312 '", l_ina01 CLIPPED ,"'"

     CALL cl_cmdrun_wait(l_cmd)  #FUN-660216 add
  ELSE
     CALL cl_err('','asf-020',1)
  END IF
END FUNCTION

FUNCTION t110_rirun()

UPDATE rva_file SET  ta_rva02='Y' WHERE rva01=g_rva.rva01
LET g_rva.ta_rva02='Y'

DISPLAY BY NAME g_rva.ta_rva02


END FUNCTION


FUNCTION t110_rirun_no()

UPDATE rva_file SET  ta_rva02='N' WHERE rva01=g_rva.rva01
LET g_rva.ta_rva02='N'

DISPLAY BY NAME g_rva.ta_rva02

END FUNCTION

FUNCTION t110_a()

DEFINE li_result   LIKE type_file.num5        #No.FUN-540027  #No.FUN-680136 SMALLINT

   IF s_shut(0) THEN RETURN END IF
   MESSAGE ""
   CLEAR FORM
   CALL g_rvb.clear()
   INITIALIZE g_rva.* TO NULL             #DEFAULT 設定
   LET g_rva01_t = NULL
   #預設值及將數值類變數清成零
   LET g_rva_o.* = g_rva.*
   LET g_rva.rva06 = g_today
   LET g_rva.rvaprsw = 'Y'
   LET g_rva.rvaprno = 0
   LET g_rva.rvaplant=g_plant  #by lily add
   LET g_rva.rvalegal=g_legal  #by lily add
   LET g_rva.rva29=' '         #by lily add
   LET g_rva.rva00 = '1'
   IF NOT cl_null(g_argv2_2) THEN
      LET g_rva.rva10 = g_argv2_2
   END IF

   #No:FUN-630010 --start--
   IF NOT cl_null(g_argv1_2) AND (g_argv4_2 = "insert")THEN
      LET g_rva.rva02 = g_argv1_2
   END IF
   #No:FUN-630010 ---end---
#   IF NOT cl_null(g_argv6) AND (g_argv4_2 = "insert") THEN
#      LET g_rva.rva07 = g_argv6
#   END IF
   CALL cl_opmsg('a')

   WHILE TRUE
      IF g_argv2_2='TAP' THEN
         LET g_rva.rva10 = 'TAP'
      END IF

      LET g_rva.rva04 = 'N'
      LET g_rva.rvaconf = 'N'
      LET g_rva.rvaspc = '0'                               #FUN-680011
      LET g_rva.rvauser=g_user
      LET g_rva.ta_rva02='N'  #  by cjy 100723
      LET g_rva.rvagrup=g_grup
      LET g_rva.rvadate=g_today
      LET g_rva.rvaacti='Y'
      #NO.FUN-5A0076 START--
      IF cl_null(g_argv2_2) THEN
          LET g_rva.rva10 ='REG'
      END IF
      #NO.FUN-5A0076 END ---
      CALL t110_i("a")                #輸入單頭

      IF INT_FLAG THEN
         LET INT_FLAG = 0
         CALL cl_err('',9001,0)
         INITIALIZE g_rva.* TO NULL
         EXIT WHILE
      END IF

      IF cl_null(g_rva.rva01) THEN                # KEY 不可空白
         CONTINUE WHILE
      END IF

      BEGIN WORK
#No.FUN-540027 --start--
        CALL s_auto_assign_no("apm",g_rva.rva01,g_rva.rva06,"3","rva_file","rva01","","","")
             RETURNING li_result,g_rva.rva01
        IF (NOT li_result) THEN
           CONTINUE WHILE
        END IF
        DISPLAY BY NAME g_rva.rva01

#      IF g_smy.smyauno='Y' THEN
#         CALL s_smyauno(g_rva.rva01,g_rva.rva06) RETURNING g_i,g_rva.rva01
#         IF g_i THEN CONTINUE WHILE END IF      #有問題
#         DISPLAY BY NAME g_rva.rva01
#      END IF
#No.FUN-540027 ---end--

      INSERT INTO rva_file VALUES (g_rva.*)
      IF SQLCA.sqlcode THEN                     #置入資料庫不成功
         ROLLBACK WORK #No:7857
         CALL cl_err(g_rva.rva01,SQLCA.sqlcode,1)
         CONTINUE WHILE
      ELSE
         COMMIT WORK #No:7857
         CALL cl_flow_notify(g_rva.rva01,'I')
         SELECT ROWID INTO g_rva_rowid FROM rva_file
          WHERE rva01 = g_rva.rva01
         LET g_rva01_t = g_rva.rva01        #保留舊值
      END IF

      LET g_rva_t.* = g_rva.*
      LET g_sw = 'Y'
      LET g_rec_b =0                        #NO.FUN-680064
      IF NOT cl_null(g_rva.rva02) AND cl_null(g_rva.rva07)THEN
         CALL t110_g_b()
      ELSE
         LET g_rec_b = 0
      END IF
#      IF NOT cl_null(g_rva.rva07) THEN
#         CALL t110_g_b()
#      ELSE
#         LET g_rec_b = 0
#      END IF

      CALL t110_b()                   #輸入單身

      LET g_prt='Y'
      IF NOT cl_null(g_rva_rowid) AND g_smy.smyprint='Y' THEN  #是否馬上列印
         IF cl_confirm('mfg9392') THEN
            CALL t110_out()
         END IF
      END IF

      IF NOT cl_null(g_rva_rowid) AND g_smy.smydmy4='Y' THEN  #確認
         CALL t110_y()
      END IF
      EXIT WHILE
   END WHILE

END FUNCTION


#steven_yue add 20110622 for check price
FUNCTION  t110_check_price()
DEFINE    l_sql STRING
DEFINE    l_sql2 STRING
DEFINE    l_rvb RECORD
          rvb04 LIKE rvb_file.rvb04,
          rvb03 LIKE rvb_file.rvb03
          END RECORD
DEFINE    l_pmn41 LIKE pmn_file.pmn41
DEFINE    l_pmn25 LIKE pmn_file.pmn25
DEFINE    l_ta_sfb03 LIKE sfb_file.ta_sfb03
DEFINE    l_pmm04 LIKE pmm_file.pmm04
DEFINE    l_pmn31 LIKE pmn_file.pmn31
DEFINE    l_pmn31t LIKE pmn_file.pmn31t
DEFINE    l_pmn04  LIKE pmn_file.pmn04
DEFINE    l_pmj07  LIKE pmj_file.pmj07
DEFINE    l_pmj07t LIKE pmj_file.pmj07t
DEFINE    l_pmm22  LIKE pmm_file.pmm22
DEFINE    l_tamp  LIKE type_file.chr1
DEFINE    l_flag  LIKE type_file.chr1
DEFINE    l_ta_pmm04  LIKE type_file.chr1
DEFINE    l_pmm09  LIKE pmm_file.pmm09

       LET l_sql="select rvb04,rvb03 from rvb_file ",
                                  " where rvb01='",g_rva.rva01,"'"

       PREPARE q110_pb FROM l_sql
       DECLARE q110_curs CURSOR FOR q110_pb

      FOREACH q110_curs INTO l_rvb.*
       IF SQLCA.sqlcode THEN
           CALL cl_err('foreach:',SQLCA.sqlcode,1)
           EXIT FOREACH
       END IF
      IF l_rvb.rvb04[1,3]<>'WWC' THEN

       LET l_ta_pmm04=null
       select ta_pmm04 into l_ta_pmm04 from pmm_file where pmm01=l_rvb.rvb04
       IF l_ta_pmm04 is null THEN
         LET l_ta_pmm04='N'
       END IF

       select pmm04,pmm09,pmn31,pmn31t,pmn04,pmn41,pmm22 into l_pmm04,l_pmm09,l_pmn31,l_pmn31t,l_pmn04,l_pmn41,l_pmm22
         from pmn_file,pmm_file
        where pmn01=l_rvb.rvb04
          and pmn02=l_rvb.rvb03
          and pmm01=pmn01

    #   IF l_pmn24 is not null THEN     #判斷 樣品階段
          select ta_sfb03 into l_ta_sfb03
            from sfb_file
           where sfb01=l_pmn41
    #   END IF


       IF l_ta_sfb03  is null THEN
          LET l_ta_sfb03='N'
       END IF

       LET l_sql2=" SELECT pmj07,pmj07t ",
                   "  FROM ( SELECT   pmi01,pmj09,pmj07t,pmj07",
                            "  FROM pmi_file, pmj_file",
#                           "  WHERE pmi01 = pmj01  AND pmiconf<>'X' AND pmj09<=to_date('",l_pmm04,"','yy/mm/dd')" ,   #2016-11-11 by jianwei
                           "  WHERE pmi01 = pmj01  AND pmiconf = 'Y' AND pmj09<=to_date('",l_pmm04,"','yy/mm/dd')" ,   #2016-11-11 by jianwei
                           "    AND pmj03 ='",l_pmn04,"'",
                           "    AND pmi03 ='",l_pmm09,"'",
                           "    and pmj05 ='",l_pmm22,"'",
                           "    AND pmj12 ='2' "
                 IF l_ta_sfb03='Y' THEN
                   LET l_sql2=l_sql2 CLIPPED," AND ta_pmi01='Y'"  ,
                                   "  ORDER BY pmj09 DESC, pmi01 DESC",
                                  " )",
                          "  WHERE ROWNUM = 1"
                 ELSE
                    LET l_sql2=l_sql2 CLIPPED," AND (ta_pmi01='N' OR ta_pmi01 is null)"  ,
                                   "  ORDER BY pmj09 DESC, pmi01 DESC",
                                  " )",
                          "  WHERE ROWNUM = 1"
                 END IF

                  PREPARE sapmt420_prepare_b FROM l_sql2
                      IF SQLCA.sqlcode != 0 THEN
                         CALL cl_err('prepare:',SQLCA.sqlcode,1)
                      END IF
                      DECLARE sapmt420_curs_b CURSOR FOR sapmt420_prepare_b
                      OPEN sapmt420_curs_b
                       LET l_pmj07t=null
                       LET l_pmj07=null
                      FETCH sapmt420_curs_b INTO l_pmj07,l_pmj07t
                       IF l_pmj07 is null or l_pmj07t is null THEN
                         LET l_pmj07=0
                         LET l_pmj07t=0
                       END IF
                  CLOSE sapmt420_curs_b
               LET l_flag='Y'
             IF l_pmn31 <> l_pmj07 or l_pmn31t <> l_pmj07t THEN
               IF l_ta_pmm04<>'Y' THEN
                LET l_flag='N'
                CALL cl_err('','cpm-053',1)
                EXIT FOREACH
               END IF
             END IF
          ELSE
            LET l_flag='Y'
          END IF
      END FOREACH

     RETURN l_flag
END FUNCTION



FUNCTION t110_k()
   DEFINE l_rvb22      LIKE rvb_file.rvb22    #No.FUN-680136 VARCHAR(20)
   DEFINE l_i          LIKE type_file.num5    #No.FUN-680136 SMALLINT
   DEFINE l_cnt        LIKE type_file.num5    #No:MOD-720103 add

   IF s_shut(0) THEN
      RETURN
   END IF

   #大陸版, 發票統一在入庫單發票維護作業輸入
   IF g_aza.aza26 = '2' THEN
      CALL cl_err('','apm-978',0) #No.TQC-7C0086
      RETURN
   END IF

   IF cl_null(g_rva.rva01) THEN
      CALL cl_err('',-400,0)
      RETURN
   END IF

   SELECT * INTO g_rva.* FROM rva_file WHERE rva01=g_rva.rva01

   IF g_rva.rvaconf = 'X' THEN
      CALL cl_err('',9024,0)
      RETURN
   END IF

  #---------------No:MOD-720103 modify
  #LET l_rvb22=目前所指向的單身項次所對應的發票號碼
  #SELECT MAX(rvb22) INTO l_rvb22 FROM rvb_file WHERE rvb01=g_rva.rva01
   LET l_rvb22 = g_rvb[l_ac].rvb22
  #---------------No:MOD-720103 end
   CALL sapmt114(l_rvb22,g_rva.rva01) RETURNING l_rvb22

   IF INT_FLAG THEN
      LET INT_FLAG=0
      RETURN
   END IF

  #--------------------No:MOD-720103 modify
  #判斷單身是否有發票號碼為空白的，
  #若有則詢問是否一起UPDATE成相同的發票號碼
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM rvb_file
                   WHERE rvb01 = g_rva.rva01
                     AND rvb02 != g_rvb[l_ac].rvb02
                     AND (rvb22 = ' ' OR rvb22 IS NULL)

  #發現單身發票欄位有空白的資料，詢問是否一起UPDATE
   IF l_cnt > 0 THEN
      IF cl_confirm('aap-267') THEN
         UPDATE rvb_file
            SET rvb22=l_rvb22
          WHERE rvb01=g_rva.rva01
            AND (rvb22 = ' ' OR rvb22 IS NULL)

         IF SQLCA.sqlcode THEN
             CALL cl_err3("upd","rvb_file",g_rva.rva01,"",SQLCA.sqlcode,"","",1) #No.FUN-660129
         ELSE
             FOR l_i = 1 TO g_rec_b
                 IF cl_null(g_rvb[l_i].rvb22) THEN
                    LET g_rvb[l_i].rvb22 = l_rvb22
                 END IF
             END FOR
         END IF
      END IF
   END IF

  #UPDATE滑鼠所指向單身項次所對應的發票號碼
   UPDATE rvb_file
      SET rvb22=l_rvb22
    WHERE rvb01=g_rva.rva01
      AND rvb02 = g_rvb[l_ac].rvb02

   IF SQLCA.sqlcode THEN
       CALL cl_err('',SQLCA.sqlcode,0)
   ELSE
      LET g_rvb[l_ac].rvb22 = l_rvb22
   END IF
  #--------------------No:MOD-720103 end
END FUNCTION

FUNCTION t110_u()

   IF s_shut(0) THEN
      RETURN
   END IF

   IF g_rva.rva01 IS NULL THEN
      CALL cl_err('',-400,0)
      RETURN
   END IF

   SELECT * INTO g_rva.* FROM rva_file
    WHERE rva01=g_rva.rva01

   #IF g_rva.rvaconf = 'Y' THEN
   # CALL t110_u2() RETURN
   #END IF

   IF g_rva.rvaconf = 'Y' THEN
      CALL cl_err('',9023,0)
      RETURN
   END IF

   IF g_rva.rvaconf = 'X' THEN
      CALL cl_err('',9024,0)
      RETURN
   END IF

   MESSAGE ""
   CALL cl_opmsg('u')
   LET g_rva01_t = g_rva.rva01
   LET g_rva_o.* = g_rva.*
    LET g_success = 'Y' #MOD-4B0035
   BEGIN WORK

   OPEN t110_cl USING g_rva_rowid
   IF STATUS THEN
      CALL cl_err("OPEN t110_cl:", STATUS, 1)
      CLOSE t110_cl
      ROLLBACK WORK
      RETURN
   END IF

   FETCH t110_cl INTO g_rva.*          #鎖住將被更改或取消的資料
   IF SQLCA.sqlcode THEN
      CALL cl_err(g_rva.rva01,SQLCA.sqlcode,0)      #資料被他人LOCK
      CLOSE t110_cl
      ROLLBACK WORK
      RETURN
   END IF
   CALL t110_show()
   WHILE TRUE
      LET g_rva.rvamodu=g_user
      LET g_rva.rvadate=g_today

      CALL t110_i("u")                             #欄位更改

      IF INT_FLAG THEN
         LET INT_FLAG = 0
         LET g_rva.*=g_rva_t.*
         CALL t110_show()
         CALL cl_err('','9001',0)
         EXIT WHILE
      END IF

      IF g_rva.rva01 != g_rva01_t THEN
         UPDATE rvb_file SET rvb01=g_rva.rva01 WHERE rvb01=g_rva01_t
         IF STATUS THEN
#           CALL cl_err('update rvb',STATUS,1) #No.FUN-660129
            CALL cl_err3("upd","rvb_file",g_rva01_t,"",STATUS,"","update rvb",1) #No.FUN-660129
            ROLLBACK WORK
            CONTINUE WHILE
         END IF
      END IF

      UPDATE rva_file SET * = g_rva.* WHERE ROWID = g_rva_rowid
      IF STATUS OR SQLCA.SQLERRD[3]=0 THEN
#        CALL cl_err('update rva',STATUS,0)  #No.FUN-660129
         CALL cl_err3("upd","rva_file","","",STATUS,"","update rva",1) #No.FUN-660129
         CONTINUE WHILE
      END IF

      EXIT WHILE
   END WHILE

   CLOSE t110_cl
   IF g_success = 'Y' THEN
      COMMIT WORK
      CALL cl_flow_notify(g_rva.rva01,'U')
   ELSE
      ROLLBACK WORK
   END IF

END FUNCTION

FUNCTION t110_u2()

   INPUT BY NAME g_rva.rva07,g_rva.rva21,g_rva.rva08,g_rva.rva09 WITHOUT DEFAULTS

   IF INT_FLAG THEN
      SELECT * INTO g_rva.* FROM rva_file WHERE rva01=g_rva.rva01
      DISPLAY BY NAME g_rva.rva21,g_rva.rva08,g_rva.rva09
   END IF

   UPDATE rva_file SET rva07=g_rva.rva07,
                       rva21=g_rva.rva21,
                       rva08=g_rva.rva08,
                       rva09=g_rva.rva09
    WHERE rva01=g_rva.rva01

END FUNCTION

FUNCTION t110_i(p_cmd)
   DEFINE
      l_flag          LIKE type_file.chr1,                 #判斷必要欄位是否有輸入  #No.FUN-680136 VARCHAR(1)
      l_direct        LIKE type_file.chr1,                 #No.FUN-680136 VARCHAR(01)
      l_dir           LIKE type_file.chr1,                 #No.FUN-680136 VARCHAR(01)
      l_pmc04         LIKE pmc_file.pmc04,
      l_poz011        LIKE poz_file.poz011,
      l_cnt           LIKE type_file.num5,                 #No.FUN-680136 SMALLINT
      p_cmd           LIKE type_file.chr1                  #a:輸入 u:更改  #No.FUN-680136 VARCHAR(1)
   DEFINE
      li_result       LIKE type_file.num5 ,                 #No.FUN-540027  #No.FUN-680136 SMALLINT
      r_pmm04         LIKE pmm_file.pmm04                  #add by tianyao 20120605
   DEFINE l_tc_cna01    LIKE tc_cna_file.tc_cna01,
          l_tc_cna06    LIKE tc_cna_file.tc_cna06

   CALL cl_set_head_visible("","YES")           #No.FUN-6B0032
   INPUT BY NAME
         g_rva.rva01,g_rva.rva06,g_rva.rva02,g_rva.rva05,g_rva.rva99,
        # g_rva.rva04,      #mark by yinwei 080919
         g_rva.rva07,g_rva.rva21,g_rva.rva08,
         g_rva.rva09,g_rva.rva10,g_rva.rvaconf,g_rva.rvaspc,        #FUN-680011
         g_rva.rvauser,g_rva.rvagrup,g_rva.rvamodu,
         g_rva.rvadate,g_rva.rvaacti
   #-----------------by lily add 20141013-----------------
     ,g_rva.rvaud01,g_rva.rvaud02,g_rva.rvaud03,g_rva.rvaud04,
         g_rva.rvaud05,g_rva.rvaud06,g_rva.rvaud07,g_rva.rvaud08,
         g_rva.rvaud09,g_rva.rvaud10,g_rva.rvaud11,g_rva.rvaud12,
         g_rva.rvaud13,g_rva.rvaud14,g_rva.rvaud15
   #------------------------by lily end-------------------
      WITHOUT DEFAULTS

     BEFORE INPUT
        LET g_before_input_done = FALSE
        CALL t110_set_entry(p_cmd)
        CALL t110_set_no_entry(p_cmd)
        LET g_before_input_done = TRUE
#No.FUN-540027 --start--
         CALL cl_set_docno_format("rva01")
        #CALL cl_set_docno_format("rva02")  #No:MOD-640158 mark
         CALL cl_set_docno_format("rvb04")
#No.FUN-540027 ---end---
        CALL t110_set_required()      #NO.FUN-640151

      AFTER FIELD rva01
         IF NOT cl_null(g_rva.rva01) THEN
#        IF NOT cl_null(g_rva.rva01) AND (g_rva.rva01!=g_rva_t.rva01) THEN
            #TQC-650108
            LET g_t1=s_get_doc_no(g_rva.rva01)
            #得到該單別對應的屬性群組
            IF ( g_sma.sma120 = 'Y' )AND( g_sma.sma907 = 'Y' ) THEN
               #讀取smy_file中指定作業對應的默認屬性群組
               SELECT smy62 INTO lg_smy62 FROM smy_file WHERE smyslip = g_t1
               #TQC-650108
               LET g_t1=s_get_doc_no(g_rva.rva02)
               IF NOT cl_null(g_rva.rva02) THEN
                  SELECT smy62 INTO lg_smy621 FROM smy_file WHERE smyslip = g_t1
                  IF (cl_null(lg_smy621) AND NOT cl_null(lg_smy62)) OR (cl_null(lg_smy62)AND NOT cl_null(lg_smy621)) OR lg_smy621 <> lg_smy62 THEN
                     CALL cl_err(g_rva.rva02,'apm1005',0)
                     LET g_rva.rva01 = NULL
                     DISPLAY BY NAME g_rva.rva01
                     NEXT FIELD rva01
                  END IF
               END IF
               #TQC-650108 --end
               #刷新界面顯示
               CALL t110_refresh_detail()
            ELSE
               LET lg_smy62 = ''
            END IF
            #TQC-650108 --end

#No.FUN-540027 --start--
           CALL s_check_no("apm",g_rva.rva01,g_rva01_t,"3","rva_file","rva01","")
             RETURNING li_result,g_rva.rva01
           DISPLAY BY NAME g_rva.rva01
           IF (NOT li_result) THEN
             NEXT FIELD rva01
           END IF
#            LET g_t1=g_rva.rva01[1,3]   # 取驗收單號的前三位
#            CALL s_mfgslip(g_t1,'apm','3')#檢查單別(其中'3'代表採購系統的驗收單
#            IF NOT cl_null(g_errno) THEN             #抱歉, 有問題
#               CALL cl_err(g_t1,g_errno,0)
#               NEXT FIELD rva01
#            END IF
#            IF g_rva.rva01[1,3] IS NOT NULL AND cl_null(g_rva.rva01[5,10]) THEN     #請使用者自行輸入
#               IF g_smy.smyauno = 'N' THEN  #新增並要不自動編號
#                  NEXT FIELD rva01
#               ELSE #若使用者使用自動編號時則自動跳至下一欄位
#                  NEXT FIELD rva06     #輸入
#               END IF
#            END IF
#            IF g_smy.smyauno = 'N' THEN  #新增並要不自動編號
#               IF NOT cl_chk_data_continue(g_rva.rva01[5,10]) THEN
#                  CALL cl_err('','9056',0)
#                  NEXT FIELD rva01
#               END IF
#            END IF
#            #進行輸入之單號檢查
             CALL s_mfgchno(g_rva.rva01) RETURNING g_i,g_rva.rva01
             DISPLAY BY NAME g_rva.rva01
             IF NOT g_i THEN NEXT FIELD rva01 END IF
#            IF g_rva.rva01 != g_rva01_t OR g_rva01_t IS NULL THEN
#               SELECT count(*) INTO l_n FROM rva_file
#                WHERE rva01 = g_rva.rva01
#              IF l_n > 0 THEN                  # Duplicated
#                 CALL cl_err(g_rva.rva01,-239,0)
#                 LET g_rva.rva01 = g_rva01_t
#                 DISPLAY BY NAME g_rva.rva01
#                 NEXT FIELD rva01
#              END IF
#            END IF
#No.FUN-540027 ---end--
         #TQC-650108
         ELSE
            IF g_sma.sma120 = 'Y' AND g_sma.sma907 = 'Y' THEN
               LET lg_smy62 = ''
               CALL t110_refresh_detail()
            END IF
         #TQC-650108 --end
         END IF
         #by stevie ---start---141211
               LET g_bs = null
            IF NOT cl_null(g_rva.rva01) THEN
                 LET g_smyslip = g_rva.rva01[1,3]
               SELECT ta_smy01 INTO g_ta_smy01 FROM smy_file WHERE smyslip=g_smyslip
               IF cl_null(g_ta_smy01) THEN LET g_ta_smy01='3' END IF  #單據性質 1、保稅 2、非保稅 3、兩者
               IF g_ta_smy01 ="2" THEN
                 LET g_rva.ta_rva19 = null
                 DISPLAY BY NAME g_rva.ta_rva19
               ELSE
                 LET g_bs = "1"
               END IF
            END IF
         #by stevie ---end---

      AFTER FIELD rva06 #收貨日期
         IF NOT cl_null(g_rva.rva06) THEN
            IF NOT cl_null(g_sma.sma53) AND g_rva.rva06 <= g_sma.sma53 THEN
               CALL cl_err('','mfg9999',0)
               NEXT FIELD rva06
            END IF
         END IF


      BEFORE FIELD rva02 #採購單號
         CALL t110_set_entry(p_cmd)

      AFTER FIELD rva02 #採購單號
#NO.FUN-640151 start--
#         IF g_argv2_2 = 'TAP' THEN
#             IF cl_null(g_rva.rva02) THEN
#                 CALL cl_err('','asf-087',0)
#                 NEXT FIELD rva02
#             END IF
#         END IF
#NO.FUN-640151 end-----
          #add by tianyao 20120605 增加採購日期大於收貨日期不允許收貨的管控
         IF NOT cl_null(g_rva.rva02) THEN
         IF g_rva.rva10='SUB' THEN

           select pmm04 into r_pmm04
                from pmm_file
                where pmm01= g_rva.rva02

             IF r_pmm04> g_rva.rva06 THEN
               LET g_msg = "收貨日期不可小於採購單日期！"
               call cl_err(g_msg,'!',1)
               #call cl_err('','cpm-071',1)
               NEXT FIELD rva02
             END IF

       END IF

            #MOD-820179-begin-add
             LET g_cnt = 0
             SELECT COUNT(*) INTO g_cnt FROM rvb_file WHERE rvb01=g_rva.rva01
             IF g_cnt > 0 THEN
                LET g_cnt=0
                SELECT COUNT(*) INTO g_cnt FROM rvb_file
                 WHERE rvb01=g_rva.rva01
                   AND rvb04 <> g_rva.rva02
                IF g_cnt > 0 THEN
                   CALL cl_err(g_rva.rva02,'apm-940',1)
                   NEXT FIELD rva02
                END IF
             END IF
            #MOD-820179-end-add
            ###### 01/11/18 Tommy 避免三角收貨到一般採購或逆拋三角
            IF g_argv2_2 = 'TAP' THEN
               SELECT poz011 INTO l_poz011
                 FROM pmm_file,poz_file
                WHERE pmm904 = poz01
                  AND pmm01 = g_rva.rva02
                  AND pmm901 = 'Y'         #三角貿易否
                  AND pmm905 = 'Y'         #已拋轉
                  AND pmm02  = 'TAP'       #代採買性質
                  AND pmm906 = 'Y'         #來源單據
               IF SQLCA.sqlcode THEN LET l_poz011 = '' END IF
               IF cl_null(l_poz011) OR l_poz011 <> '1' THEN
                  CALL cl_err(g_rva.rva02,'apm-014',0)
                  NEXT FIELD rva02
               END IF
            END IF
            CALL t110_po(g_rva.rva02,'a')
            IF NOT cl_null(g_errno) THEN
               CALL cl_err(g_rva.rva02,g_errno,0)
               DISPLAY BY NAME g_rva.rva02
               NEXT FIELD rva02
            END IF
            #TQC-650108
            LET g_t1=s_get_doc_no(g_rva.rva02)
            IF g_sma.sma120 ='Y' AND g_sma.sma907 = 'Y' AND NOT cl_null(g_rva.rva01) THEN
               SELECT smy62 INTO lg_smy621 FROM smy_file WHERE smyslip = g_t1
               IF (cl_null(lg_smy621) AND NOT cl_null(lg_smy62)) OR (cl_null(lg_smy62)AND NOT cl_null(lg_smy621)) OR lg_smy621 <> lg_smy62 THEN
                  CALL cl_err(g_rva.rva02,'apm1005',0)
                  LET g_rva.rva01 = NULL
                  DISPLAY BY NAME g_rva.rva01
                  NEXT FIELD rva01
               END IF
            END IF
            #TQC-650108 --end
            CALL t110_rva05('d')
         END IF
         LET l_dir = 'D'
         CALL t110_set_no_entry(p_cmd)

       AFTER FIELD rva05 #廠商編號
          IF NOT cl_null(g_rva.rva05) THEN
             CALL t110_rva05('a')
             IF NOT cl_null(g_errno) THEN
                CALL cl_err(g_rva.rva05,g_errno,0)
                DISPLAY BY NAME g_rva.rva05
                NEXT FIELD rva05
             END IF
#by stevie 14/11/25 ---start---
             IF g_coz01 = "Y" AND g_bs = "1" THEN
               SELECT min(tc_cna01) INTO g_rva.ta_rva19 FROM tc_cna_file WHERE tc_cna05 in (SELECT min(tc_cna05) FROM tc_cna_file WHERE tc_cna04 = g_rva.rva05 AND tc_cnaacti = 'Y' AND tc_cnaconf = 'Y' and tc_cna05 <= g_today and tc_cna06 >= g_today) AND tc_cna04 = g_rva.rva05 AND tc_cnaacti = 'Y' AND tc_cnaconf = 'Y' AND g_today <= tc_cna06   #add tc_cna05 <= g_today and tc_cna06 >= g_today by xiaoyan 15/12/04
               IF STATUS THEN
                  CALL cl_err3("sel","tc_cna_file",g_rva.rva05,"",SQLCA.sqlcode,"",
                               "select tc_cna",1)
               END IF
               DISPLAY BY NAME g_rva.ta_rva19
             END IF
#by stevie 14/11/25 ---end---
          END IF
       AFTER FIELD rva07
            IF NOT cl_null(g_rva.rva07) THEN
               LET g_cnt = 0
               SELECT COUNT(*) INTO g_cnt FROM rvb_file WHERE rvb01=g_rva.rva01
             IF g_cnt > 0 THEN
                LET g_cnt=0
                SELECT COUNT(*) INTO g_cnt FROM rvb_file
                 WHERE rvb01=g_rva.rva01
                   AND rvb04 <> g_rva.rva02
                IF g_cnt > 0 THEN
                   CALL cl_err(g_rva.rva07,'apm-940',1)
                   NEXT FIELD rva07
                END IF
             END IF
            END IF
{                 #mark by yinwei 080919
       BEFORE FIELD rva04
          IF NOT cl_null(g_rva.rva02) THEN            #判斷是否已存在信用狀檔
             SELECT COUNT(*) INTO l_cnt FROM alb_file
              WHERE alb04=g_rva.rva02
             IF l_cnt>0 THEN
                LET g_rva.rva04='Y'
                DISPLAY BY NAME g_rva.rva04
             END IF
          END IF

       AFTER FIELD rva04
          IF cl_null(g_rva.rva04) OR g_rva.rva04 NOT MATCHES '[YN]'  THEN
             NEXT FIELD rva04
          END IF
          LET l_dir = 'U'
}
#-------------------by lily add 20141013----------------------
  AFTER FIELD rvaud01
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud02
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud03
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud04
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud05
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud06
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud07
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud08
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud09
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud10
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud11
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud12
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud13
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud14
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
       AFTER FIELD rvaud15
          IF NOT cl_validate() THEN NEXT FIELD CURRENT END IF
#------------------by lily end----------------------------------
       AFTER INPUT  #判斷必要欄位之值是否有值,若無則反白顯示,並要求重新輸入
          LET l_flag='N'
          IF INT_FLAG THEN
             EXIT INPUT
          END IF
          IF cl_null(g_rva.rva05) THEN
             LET l_flag='Y'
             DISPLAY BY NAME g_rva.rva05
          END IF
          IF cl_null(g_rva.rva04) THEN
             LET l_flag='Y'
             DISPLAY BY NAME g_rva.rva04
          END IF
          #No.8969
          IF cl_null(g_rva.rva10) THEN
             LET l_flag='Y'
             DISPLAY BY NAME g_rva.rva10 ATTRIBUTE(REVERSE)
          END IF

          IF l_flag='Y' THEN
             CALL cl_err('','9033',0)
             NEXT FIELD rva01
          END IF
          #by stevie 14/11/25 ---start---
               LET g_bs = null
            IF g_coz01 = "Y" THEN
                 LET g_smyslip  = g_rva.rva01[1,3]
               SELECT ta_smy01 INTO g_ta_smy01 FROM smy_file WHERE smyslip=g_smyslip
               IF cl_null(g_ta_smy01) THEN LET g_ta_smy01='3' END IF  #單據性質 1、保稅 2、非保稅 3、兩者
               IF g_ta_smy01 ="2" THEN
                 LET g_rva.ta_rva19 = null
               ELSE
                 LET g_bs = "1"
               END IF
             IF g_bs = "1" THEN
               SELECT min(tc_cna01) INTO g_rva.ta_rva19 FROM tc_cna_file WHERE tc_cna05 in (SELECT min(tc_cna05) FROM tc_cna_file WHERE tc_cna04 = g_rva.rva05 AND tc_cnaacti = "Y" AND tc_cnaconf = "Y" and tc_cna05 <= g_today and tc_cna06 >= g_today) AND tc_cna04 = g_rva.rva05 AND tc_cnaacti = "Y" AND tc_cnaconf = "Y" AND g_today <= tc_cna06   #add tc_cna05 <= g_today and tc_cna06 >= g_today by xiaoyan 15/12/07
               IF STATUS THEN
                  CALL cl_err3("sel","tc_cna_file",g_rva.rva05,"",SQLCA.sqlcode,"",
                               "select tc_cna",1)
               END IF
             END IF
             DISPLAY BY NAME g_rva.ta_rva19
             IF g_rva.ta_rva19 IS NOT NULL THEN
               SELECT tc_cna06 INTO l_tc_cna06 FROM tc_cna_file WHERE tc_cna01 = g_rva.ta_rva19
               IF g_rva.rva06 >= l_tc_cna06 THEN
                  CALL cl_err("收貨日期應小於申請表有效期","!",1)
                  LET g_rva.ta_rva19 = null
                  DISPLAY BY NAME g_rva.ta_rva19
               END IF
             END IF
            END IF
          #by stevie 14/11/25 ---end---

       ON ACTION controlp
          CASE
             WHEN INFIELD(rva01) #查詢單據性質
#                 LET g_t1=g_rva.rva01[1,3]
                 LET g_t1 = s_get_doc_no(g_rva.rva01)       #No.FUN-540027
                #CALL q_smy(FALSE,FALSE,g_t1,'apm','3') RETURNING g_t1  #TQC-670008 remark
                 CALL q_smy(FALSE,FALSE,g_t1,'APM','3') RETURNING g_t1  #TQC-670008
             #    LET g_rva.rva01[1,3]=g_t1
                 LET g_rva.rva01=g_t1         #No.FUN-540027
                 DISPLAY BY NAME g_rva.rva01
                 NEXT FIELD rva01
#
#               LET g_t1=g_rva.rva01[1,3]
#               CALL q_smy(0,0,g_t1,'apm','3') RETURNING g_t1
#               CALL FGL_DIALOG_SETBUFFER( g_t1 )
#               CALL cl_init_qry_var()
#               LET g_qryparam.form ="q_smy"
#               LET g_qryparam.default1 = g_t1,'apm','3'
#               LET g_qryparam.where = " AND smysys='apm' AND smykind = '3'"
#               CALL cl_create_qry() RETURNING g_t1
#                CALL FGL_DIALOG_SETBUFFER( g_t1 )
#               LET g_rva.rva01[1,3]=g_t1
#               DISPLAY BY NAME g_rva.rva01
#               NEXT FIELD rva01
#
             WHEN INFIELD(rva02) #查詢採購單號
#               CALL q_pmm6(2,16,g_rva.rva02,g_argv2_2) RETURNING g_rva.rva02
#               CALL FGL_DIALOG_SETBUFFER( g_rva.rva02 )
                 CALL cl_init_qry_var()
                 LET g_qryparam.form ="q_pmm6"
                 LET g_qryparam.default1 = g_rva.rva02
                 IF NOT cl_null(g_argv2_2) THEN
                    LET g_qryparam.where = "pmm02 ='",g_argv2_2,"' "
                 ELSE
                     LET g_qryparam.where = "pmm02 <> 'TAP' AND pmm02 <> 'TRI' AND pmm02 <> 'SUB' " #MOD-4A0146
                 END IF
                 CALL cl_create_qry() RETURNING g_rva.rva02
#                 CALL FGL_DIALOG_SETBUFFER( g_rva.rva02 )
                DISPLAY BY NAME g_rva.rva02
                NEXT FIELD rva02
             WHEN INFIELD(rva05) #查詢廠商
#               CALL q_pmc1(0,0,g_rva.rva05) RETURNING g_rva.rva05
#               CALL FGL_DIALOG_SETBUFFER( g_rva.rva05 )
                 CALL cl_init_qry_var()
                 LET g_qryparam.form ="q_pmc1"
                 LET g_qryparam.default1 = g_rva.rva05
                 CALL cl_create_qry() RETURNING g_rva.rva05
#                 CALL FGL_DIALOG_SETBUFFER( g_rva.rva05 )
                DISPLAY BY NAME g_rva.rva05
                CALL t110_rva05('a')
                NEXT FIELD rva05
             WHEN INFIELD(rva07) #送貨單號
                 CALL cl_init_qry_var()
                 LET g_qryparam.state = "c"
                 LET g_qryparam.form ="q_rva001"
                 LET g_qryparam.default1 = g_rva.rva07
                 CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY BY NAME g_rva.rva07
                NEXT FIELD rva07
          END CASE

       ON ACTION CONTROLF                  #欄位說明
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913


       ON ACTION CONTROLZ
          CALL cl_show_req_fields()

       ON ACTION CONTROLG
          CALL cl_cmdask()
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121


    END INPUT

END FUNCTION

FUNCTION t110_po(p_po,p_cmd)   #採購單號
   DEFINE
      p_po      LIKE rva_file.rva02,
      p_cmd     LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(1)
      l_pmm02   LIKE pmm_file.pmm02,
      l_pmm09   LIKE pmm_file.pmm09,
      l_pmm25   LIKE pmm_file.pmm25

   LET g_errno = " "
   #MOD-820179-begin-add
   IF NOT cl_null(g_rva.rva02) THEN
      IF g_rva.rva02 <> p_po THEN
         LET g_errno='apm-940'
         RETURN
      END IF
   END IF
   #MOD-820179-end-add
   SELECT pmm02,pmm09,pmm25,pmm904,pmm50
     INTO l_pmm02,l_pmm09,l_pmm25,g_pmm904,g_pmm50
     FROM pmm_file WHERE pmm01 = p_po

   CASE
      WHEN SQLCA.SQLCODE = 100
         LET g_errno = 'mfg3332'
         LET l_pmm25 = NULL
      WHEN l_pmm25 !='2'
         LET g_errno = 'mfg3333'
      WHEN p_cmd='b' AND l_pmm09 != g_rva.rva05
         LET g_errno = 'mfg3020'
      WHEN p_cmd='b' AND l_pmm02 != g_rva.rva10
         LET g_errno = 'mfg3332'
      WHEN p_cmd='a' AND g_argv2_2='SUB' AND l_pmm02 != 'SUB'
         LET g_errno = 'mfg3332'
      WHEN p_cmd='a' AND cl_null(g_argv2_2) AND l_pmm02 = 'SUB'
         LET g_errno = 'mfg3332'
      OTHERWISE
         LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE

   IF NOT cl_null(g_errno) THEN
      RETURN
   END IF

   IF cl_null(g_pmm50) THEN
      LET g_pmm50=' '
   END IF

   IF l_pmm02 = 'SUB' THEN
      LET g_rva.rva04='N'
   END IF

   IF g_argv2_2 != 'TAP' THEN
      IF l_pmm02 = 'TAP' THEN
         LET g_errno='apm-016'
      END IF
   END IF

   IF g_argv2_2 != 'TRI' THEN
      IF l_pmm02 = 'TRI' THEN
         LET g_errno='apm-016'
      END IF
   END IF

   IF p_cmd = 'a' THEN
      LET g_rva.rva05 = l_pmm09
      LET g_rva.rva10 = l_pmm02
     # CALL s_prtype(g_rva.rva10) RETURNING l_str   #by lily modify 20141012
      CALL s_prtype(g_rva.rva10) RETURNING l_str1
     #DISPLAY l_str TO FORMONLY.desc
      DISPLAY BY NAME g_rva.rva05
      DISPLAY BY NAME g_rva.rva10
   END IF

END FUNCTION
#FUNCTION t110_rva07(p_cmd)   #送貨單號
#   DEFINE
#      p_cmd     LIKE rva_file.rva07,    #No.FUN-680136 VARCHAR(1)
   #MOD-820179-begin-add
#   IF NOT cl_null(p_cmd) THEN
#      LET g_rva.rva01 = rva01
#      DISPLAY BY NAME g_rva.rva01
#    ELSE
#       RETURN
#   END IF

# END FUNCTION
FUNCTION t110_rva05(p_cmd)   #廠商編號
   DEFINE
      p_cmd     LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(1)
      l_pmc03   LIKE pmc_file.pmc03,
      l_pmc30   LIKE pmc_file.pmc30,
      l_pmcacti LIKE pmc_file.pmcacti

   LET g_errno = " "
   SELECT pmc04,pmc03,pmc30,pmcacti
     INTO g_pmc04,l_pmc03,l_pmc30,l_pmcacti
     FROM pmc_file WHERE pmc01 = g_rva.rva05

   IF g_coz01 = "Y" THEN
      LET g_smyslip  = g_rva.rva01[1,3]
      SELECT ta_smy01 INTO g_ta_smy01 FROM smy_file WHERE smyslip=g_smyslip
      IF cl_null(g_ta_smy01) THEN   #單據性質 1、保稅 2、非保稅 3、兩者
         LET g_ta_smy01='3'
      END IF
      IF g_ta_smy01 ="2" THEN
         LET g_rva.ta_rva19 = null
      ELSE
         SELECT min(tc_cna01) INTO g_rva.ta_rva19 FROM tc_cna_file WHERE tc_cna05 in (SELECT min(tc_cna05) FROM tc_cna_file WHERE tc_cna04 = g_rva.rva05 AND tc_cnaacti = "Y" AND tc_cnaconf = "Y" and tc_cna05 <= g_today and tc_cna06 >= g_today) AND tc_cna04 = g_rva.rva05 AND tc_cnaacti = "Y" AND tc_cnaconf = "Y" AND g_today <= tc_cna06   #add tc_cna05 <= g_today and tc_cna06 >= g_today by xiaoyan 15/12/07
         IF STATUS THEN
            CALL cl_err3("sel","tc_cna_file",g_rva.rva05,"",SQLCA.sqlcode,"","select tc_cna",1)
         END IF
      END IF
   END IF
   DISPLAY BY NAME g_rva.ta_rva19

   CASE
      WHEN SQLCA.SQLCODE = 100
         LET g_errno = 'mfg3001' LET l_pmc03 = NULL
      WHEN l_pmcacti='N'
         LET g_errno = '9028'
      #FUN-690024------mod-------
        WHEN l_pmcacti MATCHES '[PH]'       LET g_errno = '9038'
      #FUN-690024------mod-------
      WHEN l_pmc30 = '2'
         LET g_errno = 'mfg3227'
      OTHERWISE
         LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE

   IF cl_null(g_errno) OR p_cmd = 'd' THEN
      DISPLAY l_pmc03 TO FORMONLY.pmc03
   END IF

END FUNCTION
############增加日潤未確認查詢start################
FUNCTION t110_rirunq()
DEFINE l_sql STRING

    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )
    INITIALIZE g_rva.* TO NULL               #No.FUN-6A0162

   CALL cl_opmsg('q')
   MESSAGE ""
   CLEAR FORM
   CALL g_rvb.clear()
   DISPLAY '   ' TO FORMONLY.cnt

   #No.TQC-660097 --start--
   IF g_sma.sma120 = 'Y'  THEN
      LET lg_smy62 = ''
      LET lg_group = ''
      CALL t110_refresh_detail()
   END IF
   #No.TQC-660097 --end-



  CALL t110_cs()


   IF INT_FLAG THEN
      LET INT_FLAG = 0
      INITIALIZE g_rva.* TO NULL
      RETURN
   END IF

   CALL cl_msg(" SEARCHING ! ")

   OPEN t110_cs                           # 從DB產生合乎條件TEMP(0-30秒)
   IF SQLCA.sqlcode THEN
      CALL cl_err('',SQLCA.sqlcode,0)
      INITIALIZE g_rva.* TO NULL
   ELSE
      OPEN t110_count
      FETCH t110_count INTO g_row_count
      DISPLAY g_row_count TO FORMONLY.cnt
      CALL t110_fetch('F')                  # 讀出TEMP第一筆並顯示
   END IF
   CALL cl_msg("")

END FUNCTION


############增加日潤未確認查詢end################
FUNCTION t110_q()

    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )
    INITIALIZE g_rva.* TO NULL               #No.FUN-6A0162

   CALL cl_opmsg('q')
   MESSAGE ""
   CLEAR FORM
   CALL g_rvb.clear()
   DISPLAY '   ' TO FORMONLY.cnt

   #No.TQC-660097 --start--
   IF g_sma.sma120 = 'Y'  THEN
      LET lg_smy62 = ''
      LET lg_group = ''
      CALL t110_refresh_detail()
   END IF
   #No.TQC-660097 --end--

   CALL t110_cs()

   IF INT_FLAG THEN
      LET INT_FLAG = 0
      INITIALIZE g_rva.* TO NULL
      RETURN
   END IF

   CALL cl_msg(" SEARCHING ! ")

   OPEN t110_cs                            # 從DB產生合乎條件TEMP(0-30秒)
   IF SQLCA.sqlcode THEN
      CALL cl_err('',SQLCA.sqlcode,0)
      INITIALIZE g_rva.* TO NULL
   ELSE
      OPEN t110_count
      FETCH t110_count INTO g_row_count
      DISPLAY g_row_count TO FORMONLY.cnt
      CALL t110_fetch('F')                  # 讀出TEMP第一筆並顯示
   END IF
   CALL cl_msg("")

END FUNCTION

FUNCTION t110_fetch(p_flag)
   DEFINE p_flag   LIKE type_file.chr1               #處理方式  #No.FUN-680136 VARCHAR(1)
   DEFINE l_slip   LIKE smy_file.smyslip             #No.FUN-680136 VARCHAR(10)  #TQC-650108

   CASE p_flag
      WHEN 'N' FETCH NEXT     t110_cs INTO g_rva_rowid,g_rva.rva01
      WHEN 'P' FETCH PREVIOUS t110_cs INTO g_rva_rowid,g_rva.rva01
      WHEN 'F' FETCH FIRST    t110_cs INTO g_rva_rowid,g_rva.rva01
      WHEN 'L' FETCH LAST     t110_cs INTO g_rva_rowid,g_rva.rva01
      WHEN '/'
            IF (NOT mi_no_ask) THEN
                CALL cl_getmsg('fetch',g_lang) RETURNING g_msg
                   LET INT_FLAG = 0  ######add for prompt bug
                PROMPT g_msg CLIPPED,': ' FOR g_jump
                   ON IDLE g_idle_seconds
                      CALL cl_on_idle()

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121

                END PROMPT
                IF INT_FLAG THEN
                   LET INT_FLAG = 0
                   EXIT CASE
                END IF
            END IF
            FETCH ABSOLUTE g_jump t110_cs INTO g_rva_rowid,g_rva.rva01
            LET mi_no_ask = FALSE
   END CASE

   IF SQLCA.sqlcode THEN
      CALL cl_err(g_rva.rva01,SQLCA.sqlcode,0)
      INITIALIZE g_rva.* TO NULL  #TQC-6B0105
      LET g_rva_rowid = NULL      #TQC-6B0105
      RETURN
   ELSE
      CASE p_flag
         WHEN 'F' LET g_curs_index = 1
         WHEN 'P' LET g_curs_index = g_curs_index - 1
         WHEN 'N' LET g_curs_index = g_curs_index + 1
         WHEN 'L' LET g_curs_index = g_row_count
         WHEN '/' LET g_curs_index = g_jump
      END CASE

      CALL cl_navigator_setting( g_curs_index, g_row_count )
   END IF

   SELECT * INTO g_rva.* FROM rva_file WHERE ROWID = g_rva_rowid
   IF SQLCA.sqlcode THEN
#     CALL cl_err(g_rva.rva01,SQLCA.sqlcode,0)  #No.FUN-660129
      CALL cl_err3("sel","rva_file",g_rva.rva01,"",SQLCA.sqlcode,"","",1) #No.FUN-660129
      INITIALIZE g_rva.* TO NULL
      RETURN
   END IF
   #TQC-650108
   #在使用Q查詢的情況下得到當前對應的屬性組smy62
   IF g_sma.sma120 = 'Y' AND g_sma.sma907 = 'Y' THEN
      LET l_slip = g_rva.rva01[1,g_doc_len]
      SELECT smy62 INTO lg_smy62 FROM smy_file
         WHERE smyslip = l_slip
   END IF
   #TQC-650108 --end
   LET g_data_owner = g_rva.rvauser      #FUN-4C0056 add
   LET g_data_group = g_rva.rvagrup      #FUN-4C0056 add
   CALL t110_show()

END FUNCTION

#將資料顯示在畫面上
FUNCTION t110_show()
DEFINE l_cnt LIKE type_file.num5
DEFINE l_plant LIKE azp_file.azp01
DEFINE l_tc_cna01 LIKE tc_cna_file.tc_cna01

   LET g_rva_t.* = g_rva.*                #保存單頭舊值
   DISPLAY BY NAME  g_rva.rva01,g_rva.rva05,g_rva.rva06,g_rva.rva02,g_rva.rvaprno,  #  by cjy 09/06/19
                    g_rva.rva99,g_rva.rva10,    #g_rva.rva04  #mark by yinwei 080919
                    g_rva.rva07,g_rva.rva21,
                    g_rva.rva08,g_rva.rva09,
                    g_rva.ta_rva01,g_rva.ta_rva03,g_rva.ta_rva04,       # by cjy 09/01/08 #by cjy 101125 add ta_rva03
                    g_rva.rvaconf,g_rva.rvaspc,g_rva.rvauser,g_rva.rvagrup,  #FUN-680011
                    g_rva.rvamodu,g_rva.rvadate,g_rva.rvaacti,g_rva.ta_rva02   #  by cjy 100723
              #----------by lily add 20141013-----------------------
                    ,g_rva.rvaud01,g_rva.rvaud02,g_rva.rvaud03,g_rva.rvaud04,
                    g_rva.rvaud05,g_rva.rvaud06,g_rva.rvaud07,g_rva.rvaud08,
                    g_rva.rvaud09,g_rva.rvaud10,g_rva.rvaud11,g_rva.rvaud12,
                    g_rva.rvaud13,g_rva.rvaud14,g_rva.rvaud15
          #-----------by lily end----------------------------
                      ,g_rva.ta_rva19
   #CKP
   IF g_rva.rvaconf='X' THEN LET g_chr='Y' ELSE LET g_chr='N' END IF

   CALL cl_set_field_pic(g_rva.rvaconf,"","","",g_chr,"")

   #CALL s_prtype(g_rva.rva10) RETURNING l_str    #by lily modify 20141012
  CALL s_prtype(g_rva.rva10) RETURNING l_str1
  #DISPLAY l_str TO FORMONLY.desc
   CALL t110_rva05('d')



  LET l_plant = g_rva.rva05

  LET l_cnt = 0
  SELECT COUNT(*) INTO l_cnt FROM tc_szp_file
   WHERE tc_szp01 = l_plant
  IF l_cnt > 0 THEN
    #CALL cl_set_comp_visible("g_shr",TRUE)
    CALL t110_shr_show()
   ELSE
    LET g_shr = 'N'
    DISPLAY g_shr TO g_shr
  END IF


   IF cl_null(g_wc2) THEN
      LET g_wc2=' 1=1 '
   END IF
   CALL t110_b_fill(g_wc2)

   #No:FUN-550117
#No.FUN-610018
#  IF g_gec07 = 'Y' THEN                       #No:FUN-560102
#     CALL cl_set_comp_visible("rvb10t,pmm21,pmm43,gec07",TRUE)
#  ELSE
#     CALL cl_set_comp_visible("rvb10t,pmm21,pmm43,gec07",FALSE)
#  END IF
#  #end No:FUN-550117

    CALL cl_show_fld_cont()                     #No:FUN-550037 hmf
END FUNCTION



FUNCTION t110_shr_show()
DEFINE l_plant  LIKE azp_file.azp01  #PLANT營運中 心
DEFINE l_dbs    LIKE azp_file.azp03  #DB
DEFINE l_rva07  LIKE rva_file.rva07  #送貨單號
DEFINE l_sql    LIKE type_file.chr1000
DEFINE l_ogaconf LIKE oga_file.ogaconf
DEFINE l_ogapost LIKE oga_file.ogapost
DEFINE l_cnt     LIKE type_file.num5

 LET g_shr = 'N'
 DISPLAY g_shr TO g_shr


 LET l_plant = g_rva.rva05

 LET l_dbs = ''
 SELECT tc_szp03 INTO l_dbs FROM tc_szp_file WHERE tc_szp01 =l_plant
 IF cl_null(l_dbs) THEN
    LET g_msg ="對應資料庫出錯！"
     CALL cl_err(g_msg,'!',1)
    LET g_shr = 'N'
    RETURN
 END IF

  LET l_sql = "SELECT ogapost,oga09 FROM ",l_dbs CLIPPED,".oga_file WHERE oga01 ='",g_rva.rva07 CLIPPED,"'"
  PREPARE ogapost_p1 FROM l_sql
  DECLARE ogapost_c1 CURSOR FOR ogapost_p1
  OPEN  ogapost_c1
  FETCH ogapost_c1 INTO g_shr,g_oga09
  CLOSE ogapost_c1

  DISPLAY g_shr TO g_shr



END FUNCTION

FUNCTION t110_shr()
DEFINE l_plant  LIKE azp_file.azp01
DEFINE l_dbs    LIKE azp_file.azp03  #DB
DEFINE l_sql    LIKE type_file.chr1000
DEFINE l_oga    RECORD LIKE  oga_file.*
DEFINE l_cnt    LIKE type_file.num5
DEFINE l_cnt1   LIKE type_file.num5
DEFINE sr   RECORD
       ogb04  LIKE ogb_file.ogb04,
       ogb11  LIKE ogb_file.ogb11,
       ogb12  LIKE ogb_file.ogb12
       END RECORD
DEFINE l_img10  LIKE img_file.img10
DEFINE l_rvb07  LIKE rvb_file.rvb07
DEFINE sr1  RECORD
       rvb05  LIKE rvb_file.rvb05,  #料號
       rvb34  LIKE rvb_file.rvb34,  #工單號
       rvb07  LIKE rvb_file.rvb07   #數量
       END RECORD
DEFINE l_obk03  LIKE obk_file.obk01
DEFINE sr2   RECORD                     #add by wenny20151026
       rvb05   LIKE rvb_file.rvb05,
       rvb07   LIKE rvb_file.rvb07
             END RECORD

  LET l_plant = g_rva.rva05

  LET l_dbs = ''
  SELECT tc_szp03 INTO l_dbs FROM tc_szp_file WHERE tc_szp01 = l_plant
  IF cl_null(l_dbs) THEN
    LET g_msg ="對應資料庫出錯！"
    CALL cl_err(g_msg,'!',1)
    LET g_success = 'N'
    RETURN
  END IF

  #############add 121018  判断是否存在重工料件###########################
  LET l_cnt = 0
  SELECT COUNT(*) INTO l_cnt FROM img_file,rvb_file
   WHERE img01 = rvb05
#     AND img02 IN ('WFWIP','WFGWIP')  #by jianwei 20160624
#     AND img02 IN ('YWFWIP','WFWIP','WFGWIP')  #by jianwei 20160624
     AND img02 IN ('YWFWIP','WFGWIP','YMJZXMWIP','YCNCXMWIP')  #by jianwei 20160624 #by jianwei 20160711
     AND img03 = g_rva.rva05
     AND img10 > 0
     AND rvb01 = g_rva.rva01
  IF l_cnt > 0 THEN
     DECLARE rvb_cs CURSOR FOR
     SELECT rvb05,rvb34,SUM(rvb07) FROM rvb_file
      WHERE rvb34 IN (SELECT sfb01 FROM sfb_file,sfa_file
                       WHERE sfb01 = sfa01
                         AND sfa03!=sfb05
                         AND sfb87 != 'X'
                         AND sfb04 !='8'
                         AND sfb01 = rvb34 )
         AND rvb01 = g_rva.rva01
      GROUP BY rvb05,rvb34

      FOREACH rvb_cs INTO sr1.*
         LET l_img10=0
         SELECT sum(img10) INTO l_img10
           FROM img_file
          WHERE img01=sr1.rvb05
#            AND img02 IN ('WFWIP','WFGWIP')  #by jianwei 20160624
#            AND img02 IN ('YWFWIP','WFWIP','WFGWIP')   #by jianwei 20160624
            AND img02 IN ('YWFWIP','WFGWIP','YMJZXMWIP','YCNCXMWIP')  #by jianwei 20160624 #by jianwei 20160711
            AND img03 = g_rva.rva05
          IF cl_null(l_img10) THEN LET l_img10 = 0 END IF

          LET l_rvb07 = 0
          SELECT SUM(rvb07) INTO l_rvb07 FROM rvb_file
           WHERE rvb34 IN (SELECT sfb01 FROM sfb_file,sfa_file
                           WHERE sfb01 = sfa01
                             AND sfa03 = sfb05
                             AND sfb87 != 'X'
                             AND sfb04 !='8'
                             AND sfb01 = rvb34 )
              AND rvb01 = g_rva.rva01
              AND rvb05 = sr1.rvb05
          IF cl_null(l_rvb07) THEN LET l_rvb07 = 0 END IF
          LET l_img10 = l_img10 - l_rvb07
          IF l_img10 != 0 THEN
             LET g_success = 'N'
             CALL cl_err('','cpm-052',1)
             RETURN
          END IF
      END FOREACH
  END IF
  ####################################################################################




  IF cl_null(g_rva.rva07) THEN
    LET g_msg ="送貨單號不能爲空！"
    CALL cl_err(g_msg,'!',1)
    LET g_success = 'N'
    RETURN
  END IF

  LET l_cnt = 0
  SELECT COUNT(*) INTO l_cnt FROM rva_file WHERE rvaconf!='X' AND  rva07 = g_rva.rva07 AND rva05 = g_rva.rva05
  IF l_cnt > 1 THEN
    LET g_msg ="相同送貨單號不能多次收貨！"
    CALL cl_err(g_msg,'!',1)
    LET g_success = 'N'
    RETURN
  END IF

  INITIALIZE l_oga.* TO NULL
  LET l_sql = "SELECT * FROM ",l_dbs CLIPPED,".oga_file WHERE oga01 ='",g_rva.rva07 CLIPPED,"'"
  PREPARE oga_p1 FROM l_sql
  DECLARE oga_c1 CURSOR FOR oga_p1
  OPEN  oga_c1
  FETCH oga_c1 INTO l_oga.*
  CLOSE oga_c1

  IF cl_null(l_oga.oga01) THEN
    LET g_msg ="不存在的送貨單號！"
    CALL cl_err(g_msg,'!',1)
    LET g_success = 'N'
    RETURN
  END IF

#  IF (l_oga.oga69<> g_rva.rva06) OR (l_oga.oga02<>g_rva.rva06) THEN
  IF   (l_oga.oga02<>g_rva.rva06) THEN
    LET g_msg ="送貨單號與收貨單號日期不一致！"
    CALL cl_err(g_msg,'!',1)
    LET g_success = 'N'
    RETURN
  END IF
 {
  LET l_cnt = 0
  LET l_sql = "SELECT COUNT(*) FROM ",l_dbs CLIPPED,".ogb_file WHERE ogb01 ='",g_rva.rva07 CLIPPED,"'"
  PREPARE ogbcount_p1 FROM l_sql
  DECLARE ogbcount_c1 CURSOR FOR ogbcount_p1
  OPEN  ogbcount_c1
  FETCH ogbcount_c1 INTO l_cnt
  CLOSE ogbcount_c1
  SELECT COUNT(*) INTO l_cnt1 FROM rvb_file WHERE rvb01 = g_rva.rva01
  IF l_cnt <> l_cnt1 THEN
    LET g_msg ="出貨單與收貨單資料不一致！"
    CALL cl_err(g_msg,'!',1)
    LET g_success = 'N'
    RETURN
  END IF
 }

  INITIALIZE sr.* TO NULL
  LET l_sql = "SELECT ogb04,ogb11,sum(ogb12) FROM ",l_dbs CLIPPED,".ogb_file WHERE ogb01 ='",g_rva.rva07 CLIPPED,"' GROUP BY ogb04,ogb11"
  PREPARE ogb_p1 FROM l_sql
  DECLARE ogb_c1 CURSOR FOR ogb_p1
  FOREACH ogb_c1 INTO sr.*
    { LET l_obk03 = NULL
         LET l_sql = "SELECT obk03 FROM ",l_dbs CLIPPED,".obk_file WHERE obk02='",g_rva.rva05 CLIPPED,"'",
                  "   AND obk01 = '",sr.ogb04 CLIPPED,"'"
         PREPARE obk_p1 FROM l_sql
     DECLARE obk_c1 CURSOR FOR obk_p1
     OPEN  obk_c1
     FETCH obk_c1 INTO l_obk03
     CLOSE obk_c1}
     IF NOT cl_null(sr.ogb11) THEN
                LET sr.ogb04 = sr.ogb11
     END IF


     LET l_cnt = 0
     SELECT COUNT(*) INTO l_cnt FROM
      (SELECT rvb05,SUM(rvb07) as rvb07 FROM rvb_file
        WHERE rvb01=g_rva.rva01
         GROUP BY rvb05) tmp
      WHERE tmp.rvb05 = sr.ogb04
        AND tmp.rvb07 = sr.ogb12
     IF l_cnt = 0 THEN
        LET g_msg ="出貨單料號:",sr.ogb04 CLIPPED," ,數量：",sr.ogb12," 與收貨單不一致，請檢查！"
        CALL cl_err(g_msg,'!',1)
        LET g_success = 'N'
        RETURN
     END IF
  END FOREACH

  #-----start by wenny20151026--管控收货单料号与出货单料号一致-----
  INITIALIZE sr2.* TO NULL
  LET l_sql = "SELECT rvb05,sum(rvb07) FROM rvb_file WHERE rvb01 ='",g_rva.rva01 CLIPPED,"' GROUP BY rvb05 "
  PREPARE rvb_p1 FROM l_sql
  DECLARE rvb_c1 CURSOR FOR rvb_p1
  FOREACH rvb_c1 INTO sr2.*
     LET l_cnt = 0
     LET l_sql = "SELECT COUNT(*) FROM ",l_dbs,".ogb_file",
                 " WHERE ogb01='",g_rva.rva07 CLIPPED,"'",
                 "   AND ogb04='",sr2.rvb05 CLIPPED,"'"
     PREPARE ogb_p2 FROM l_sql
     EXECUTE ogb_p2 INTO l_cnt
     IF l_cnt = 0 THEN
        LET g_msg ="收貨單料號:",sr2.rvb05 CLIPPED," 在出货单中数量不一致或不存在，请检查！"
        CALL cl_err(g_msg,'!',1)
        LET g_success = 'N'
        RETURN
     END IF
  END FOREACH


  #-----end by wenny20151026--管控收货单料号与出货单料号一致-------

 { IF l_oga.oga09 = '3' THEN  #無訂單出貨不能有單價金額
     LET l_cnt = 0
     SELECT COUNT(*) INTO l_cnt FROM rvb_file
      WHERE (rvb10>0 OR rvb10t>0 OR rvb88>0 OR rvb88t>0)
        AND rvb01 = g_rva.rva01
     IF l_cnt >0 THEN
        LET g_msg ="送貨單類型與收貨單不一致，請確定良品或不良品收貨!"
        CALL cl_err(g_msg,'!',1)
        LET g_success = 'N'
        RETURN
     END IF
  END IF
 }

  IF  g_action_choice = 'confirm' AND l_oga.ogapost <> 'Y' THEN
     LET g_msg ="對應送貨單未過賬，請檢查！"
     CALL cl_err(g_msg,'!',1)
     LET g_success = 'N'
     RETURN
  END IF

END FUNCTION

FUNCTION t110_r()       #刪除
    DEFINE l_chr,l_sure LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(01)
           l_cnt        LIKE type_file.num5,    #No.FUN-680136 SMALLINT
           l_rvb22      LIKE rvb_file.rvb22 #No:7746

    IF s_shut(0) THEN
       RETURN
    END IF

    IF cl_null(g_rva.rva01) THEN
       CALL cl_err('',-400,0)
       RETURN
    END IF

    SELECT * INTO g_rva.* FROM rva_file WHERE rva01=g_rva.rva01

    IF g_rva.rvaconf = 'Y' THEN
       CALL cl_err('','apm-242',0)
       RETURN
    END IF

    IF g_rva.rvaconf = 'X' THEN
       CALL cl_err('',9024,0)
       RETURN
    END IF

    #-->已有入庫單則不可刪除
    SELECT count(*) INTO l_cnt FROM rvu_file
     WHERE rvu02 = g_rva.rva01
       AND rvuconf !='X'

    IF l_cnt > 0  THEN
       CALL cl_err(' ','apm-290',0)
       RETURN
    END IF

    #-->已有品管單則不可刪除
    SELECT count(*) INTO l_cnt FROM qcs_file
     WHERE qcs01 = g_rva.rva01 AND qcs14!='X'  #No:9524
       AND qcs00<'5'   #No.FUN-5C0078
    IF l_cnt > 0 THEN
       CALL cl_err(' ','apm-291',0)
       RETURN
    END IF

    BEGIN WORK

    OPEN t110_cl USING g_rva_rowid
    IF STATUS THEN
       CALL cl_err("OPEN t110_cl:", STATUS, 1)
       CLOSE t110_cl
       ROLLBACK WORK
       RETURN
    END IF

    FETCH t110_cl INTO g_rva.*
    IF SQLCA.sqlcode THEN
       CALL cl_err(g_rva.rva01,SQLCA.sqlcode,0)
       ROLLBACK WORK
       RETURN
    END IF

    CALL t110_show()

    IF cl_delh(20,16) THEN
       MESSAGE "Delete rva,rvb!"
       #No:7746 刪除發票資料
       DECLARE rvb22_cur CURSOR FOR
        SELECT UNIQUE rvb22
          FROM rvb_file
         WHERE rvb01 = g_rva.rva01

       CALL s_showmsg_init()        #No.FUN-710030
       FOREACH rvb22_cur INTO l_rvb22
#No.FUN-710030 -- begin --
          IF g_success="N" THEN
             LET g_totsuccess="N"
             LET g_success="Y"
          END IF
#No.FUN-710030 -- end --
          SELECT COUNT(*) INTO g_cnt
            FROM rvb_file
           WHERE rvb22 = l_rvb22
             AND rvb01 <> g_rva.rva01
          IF g_cnt = 0 THEN
             DELETE FROM rvw_file
              WHERE rvw01 = l_rvb22
             IF SQLCA.sqlcode THEN
             #  CALL cl_err('DEL rvw_filee err!',SQLCA.SQLCODE,0) #No.FUN-660129
#No.FUN-710030 -- begin --
#                CALL cl_err3("del","rvw_file",l_rvb22,"",SQLCA.sqlcode,"","DEL rvw_filee err!",1) #No.FUN-660129
#                ROLLBACK WORK
#                RETURN
                LET g_success = 'N'
                IF g_bgerr THEN
                   CALL s_errmsg("rvw01",l_rvb22,"DEL rvw_filee err!",SQLCA.sqlcode,1)
                   CONTINUE FOREACH
                ELSE
                   CALL cl_err3("del","rvw_file",l_rvb22,"",SQLCA.sqlcode,"","DEL rvw_filee err!",1)
                   EXIT FOREACH
                END IF
#No.FUN-710030 -- end --
             END IF
          END IF
       END FOREACH
#No.FUN-710030 -- begin --
       IF g_totsuccess="N" THEN
          LET g_success="N"
       END IF
#No.FUN-710030 -- end --

       DELETE FROM rva_file WHERE rva01 = g_rva.rva01
       IF SQLCA.SQLERRD[3]=0 THEN
#         CALL cl_err('No rva deleted',SQLCA.SQLCODE,0)  #No.FUN-660129
#No.FUN-710030 -- begin --
#          CALL cl_err3("del","rva_file",g_rva.rva01,"",SQLCA.SQLCODE,"","No rva deleted",1) #No.FUN-660129
#          ROLLBACK WORK
#          RETURN
         LET g_success = 'N'
         IF g_bgerr THEN
            CALL s_errmsg("rva01",g_rva.rva01,"No rva deleted",SQLCA.sqlcode,1)
         ELSE
            CALL cl_err3("del","rva_file",g_rva.rva01,"",SQLCA.SQLCODE,"","No rva deleted",1)
         END IF
#No.FUN-710030 -- end --
       END IF

       DELETE FROM rvb_file WHERE rvb01 = g_rva.rva01
       LET g_msg=TIME

       INSERT INTO azo_file(azo01,azo02,azo03,azo04,azo05,azo06)
                     VALUES('apmt110',g_user,g_today,g_msg,g_rva.rva01,'delete')

       CLEAR FORM
       CALL g_rvb.clear()
       INITIALIZE g_rva.* TO NULL
       MESSAGE ""
       OPEN t110_count
       FETCH t110_count INTO g_row_count
       DISPLAY g_row_count TO FORMONLY.cnt
       OPEN t110_cs
       IF g_curs_index = g_row_count + 1 THEN
          LET g_jump = g_row_count
          CALL t110_fetch('L')
       ELSE
          LET g_jump = g_curs_index
          LET mi_no_ask = TRUE
          CALL t110_fetch('/')
       END IF
    END IF

    CLOSE t110_cl
#No.FUN-710030 -- begin --
#    COMMIT WORK
    CALL s_showmsg()
    IF g_success= 'N' THEN
       ROLLBACK WORK
       LET g_success = 'Y'
       RETURN
    ELSE
       COMMIT WORK
    END IF
#No.FUN-710030 -- end --

    CALL cl_flow_notify(g_rva.rva01,'D')

END FUNCTION

FUNCTION t110_b()
   DEFINE
      l_ac_t          LIKE type_file.num5,                #未取消的ARRAY CNT  #No.FUN-680136 SMALLINT
      l_n             LIKE type_file.num5,                #檢查重複用  #No.FUN-680136 SMALLINT
      l_i,l_t         LIKE type_file.num5,                #No.FUN-680136 SMALLINT
      l_cmd           LIKE type_file.chr50,               #字串  #No.FUN-680136 VARCHAR(30)
      l_lock_sw       LIKE type_file.chr1,                #單身鎖住否  #No.FUN-680136 VARCHAR(1)
      p_cmd           LIKE type_file.chr1,                #處理狀態  #No.FUN-680136 VARCHAR(1)
      l_chr           LIKE type_file.chr1,                #No.FUN-680136 VARCHAR(1)
      l_direct        LIKE type_file.chr1,                #No.FUN-680136 VARCHAR(01)
      l_uflag         LIKE type_file.num5,                #No.FUN-680136 SMALLINT
      l_sfa           RECORD LIKE sfa_file.*,
      l_alb04         LIKE alb_file.alb04,
      l_alb05         LIKE alb_file.alb05,
      l_alb11         LIKE alb_file.alb11,
      l_ale06         LIKE ale_file.ale06,
      l_ale08         LIKE ale_file.ale08,
      l_rvb           RECORD LIKE rvb_file.*,
      l_rvb07         LIKE rvb_file.rvb07,
      l_rvb07_1       LIKE rvb_file.rvb07,
      l_rvb07_2       LIKE rvb_file.rvb07,
      l_rvb07_3       LIKE rvb_file.rvb07,
      l_als05         LIKE als_file.als05,
      l_als21         LIKE als_file.als21,
      l_alt06,t_alt06 LIKE alt_file.alt06,
      l_pmh08         LIKE pmh_file.pmh08,
      g_pmn38         LIKE pmn_file.pmn38,
      g_img07         LIKE img_file.img07,
      g_img10         LIKE img_file.img10,
      g_img09         LIKE img_file.img09,
      g_imf04         LIKE imf_file.imf04,
      g_imf05         LIKE imf_file.imf05,
      l_pmn41         LIKE pmn_file.pmn41,
      l_pmn43         LIKE pmn_file.pmn43,
      l_pmn20         LIKE pmn_file.pmn20,     #No.MOD-830171
      l_pmn87         LIKE pmn_file.pmn87,     #No.MOD-830171
      l_pmm904        LIKE pmm_file.pmm904,
      l_pmm50         LIKE pmm_file.pmm50,
      l_smy57_5       LIKE type_file.chr1,     #No.FUN-680136 VARCHAR(01)
      l_pmm04         LIKE pmm_file.pmm04,
      l_poz011        LIKE poz_file.poz011,
      l_ec_sw         LIKE type_file.chr1,     #No.FUN-680136 VARCHAR(01)
      l_msg           LIKE type_file.chr50,    #No.FUN-680136 VARCHAR(40)
      l_sfb24         LIKE sfb_file.sfb24,
      l_code          LIKE type_file.num5,     #No.FUN-680136 SMALLINT
      l_ima491        LIKE ima_file.ima491,
      s_mod,ss        LIKE type_file.num5,     #No.FUN-680136 SMALLINT
      sn1,sn2,l_cnt   LIKE type_file.num5,     #No.FUN-680136 SMALLINT
      l_num           LIKE type_file.num5,     #No.FUN-680136 SMALLINT
      l_fac           LIKE ima_file.ima31_fac, #No.FUN-680136 DEC(16,8)
      #TQC-650108
      li_i            LIKE type_file.num5,     #No.FUN-680136 SMALLINT
      l_count         LIKE type_file.num5,     #No.FUN-680136 SMALLINT
      l_check_res     LIKE type_file.num5,     #No.FUN-680136 SMALLINT
      l_temp          LIKE ima_file.ima01,
      #TQC-650108 --end
      l_ima55         LIKE ima_file.ima55,
      l_imaag         LIKE ima_file.imaag,
      l_coc10         LIKE coc_file.coc10,     #No:MOD-4B0275
      l_coc04         LIKE coc_file.coc04,     #No:MOD-4B0275
      l_rvb22_old     LIKE rvb_file.rvb22,
      l_min_set       LIKE sfb_file.sfb08,     #No:TQC-670091 add
      l_allow_insert  LIKE type_file.num5,     #可新增否  #No.FUN-680136 SMALLINT
      l_allow_delete  LIKE type_file.num5      #可刪除否  #No.FUN-680136 SMALLINT
  DEFINE  l_ta_ima001  LIKE ima_file.ta_ima001
DEFINE l_th        INTEGER                  #2016-11-04 by dengyu
DEFINE l_ta        LIKE pmn_file.pmn20      #2016-11-04 by dengyu
DEFINE l_rvb07s    LIKE rvb_file.rvb07      #2016-11-04 by dengyu
   LET g_action_choice = ""

   IF s_shut(0) THEN
      RETURN
   END IF

   IF cl_null(g_rva.rva01) THEN
      RETURN
   END IF

   SELECT * INTO g_rva.* FROM rva_file
    WHERE rva01=g_rva.rva01

   IF g_rva.rvaacti ='N' THEN    #檢查資料是否為無效
      CALL cl_err(g_rva.rva01,'aom-000',0)
      RETURN
   END IF

   IF g_rva.rvaconf = 'Y' THEN
      CALL cl_err('','apm-242',0)
      RETURN
   END IF

   IF g_rva.rvaconf = 'X' THEN
      CALL cl_err('',9024,0)
      RETURN
   END IF

   IF g_rva.ta_rva02 = 'Y' THEN CALL cl_err('','cpm-005',0) RETURN END IF  # 日潤已確認
#------------by lily add 20141013-----
   IF g_rva.ta_rva06 = 'Y' AND NOT cl_null(g_rva.ta_rva07) AND
      NOT cl_null(g_rva.ta_rva08) THEN
      ERROR  "集團內交易單據，不充許更改!"
      RETURN
   END IF
#--------------by lilu add 20141013

   CALL cl_opmsg('b')

   #No.FUN-540027  --begin
  #FUN-730068.................begin
  ##------------------No:TQC-660053 modify
  #LET g_forupd_sql = "SELECT rvb02,rvb22,rvb04,rvb03,rvb34,rvb05, ",
  #                   "       '','','','','','','','','','','', ",
  #                   "       '','','','','','','','','','', ",
  #                   "       '','', ",
  ##------------------No:TQC-660053 end
  #                   "       '',0,0,rvb30,rvb29,rvb35,rvb07,rvb83,rvb84,",
  #                   "       rvb85,rvb80,rvb81,rvb82,rvb86,rvb87,rvb10,rvb10t, ",  #No:FUN-550117
  #                   "       rvb36,rvb37,rvb38,rvb25,'',0,rvb930,''  FROM rvb_file ",      #No:FUN-550117 FUN-610018  #FUN-670051
   LET g_forupd_sql = "SELECT * FROM rvb_file ",
  #FUN-730068.................end
                      " WHERE rvb01=? AND rvb02=? FOR UPDATE NOWAIT"
   DECLARE t110_bcl CURSOR FROM g_forupd_sql      # LOCK CURSOR
   #No.FUN-540027  --end

   LET l_allow_insert = cl_detail_input_auth("insert")
   LET l_allow_delete = cl_detail_input_auth("delete")
    LET l_ac = 1       #MOD-530431

   INPUT ARRAY g_rvb WITHOUT DEFAULTS FROM s_rvb.*
         ATTRIBUTE(COUNT=g_rec_b,MAXCOUNT=g_max_rec,UNBUFFERED,
                   INSERT ROW=l_allow_insert,DELETE ROW=l_allow_delete,APPEND ROW=l_allow_insert)

         BEFORE INPUT
            IF g_rec_b != 0 THEN
               CALL fgl_set_arr_curr(l_ac)
            END IF

            LET g_before_input_done = FALSE
            CALL t110_set_entry_b('a')
            CALL t110_set_no_entry_b('a')
            LET g_before_input_done = TRUE

         BEFORE ROW
             INITIALIZE g_rvb2.* TO NULL #MOD-550195
            LET p_cmd = ''
            LET l_ac = ARR_CURR()
            LET l_n  = ARR_COUNT()
            LET l_lock_sw = 'N'            #DEFAULT
            LET g_success = 'Y'

            BEGIN WORK
            OPEN t110_cl USING g_rva_rowid
            IF STATUS THEN
               CALL cl_err("OPEN t110_cl:", STATUS, 1)
               CLOSE t110_cl
               ROLLBACK WORK
               RETURN
            END IF
            FETCH t110_cl INTO g_rva.*  #鎖住將被更改或取消的資料
            IF SQLCA.sqlcode THEN
               CALL cl_err("fetch t110_cl_b",SQLCA.sqlcode,0)      #資料被他人LOCK
               CLOSE t110_cl
               ROLLBACK WORK
               RETURN
            END IF
            IF g_rec_b >= l_ac THEN
               LET p_cmd='u'

               LET g_rvb_t.* = g_rvb[l_ac].*  #BACKUP
               OPEN t110_bcl USING g_rva.rva01,g_rvb_t.rvb02
               IF STATUS THEN
                  CALL cl_err("OPEN t110_bcl:", STATUS, 1)
                  LET l_lock_sw = "Y"
               ELSE
                  #FETCH t110_bcl INTO g_rvb[l_ac].* #FUN-730068
                  FETCH t110_bcl INTO g_rvb2.*  #FUN-730068
                  IF SQLCA.sqlcode THEN
                      CALL cl_err(g_rvb_t.rvb02,SQLCA.sqlcode,1)
                      LET l_lock_sw = "Y"
                  ELSE
                     #No.MOD-490173 利用 p_perright 隱藏即可
                    #IF NOT cl_chk_act_auth() THEN
                    #   LET g_rvb[l_ac].rvb10=NULL
                    #END IF
                     CALL t110_b_move_to() #FUN-730068
                     SELECT ima021 INTO g_rvb[l_ac].ima021 FROM ima_file
                       WHERE ima01=g_rvb[l_ac].rvb05
                     CALL t110_set_rvb930(g_rvb[l_ac].rvb930) RETURNING g_rvb[l_ac].gem02a #FUN-670051
                     #No.FUN-540027  --begin
                     LET g_rvb05_t = g_rvb[l_ac].rvb05
                     #No.FUN-540027  --end
                     CALL t110_rvb03('d',g_rvb[l_ac].rvb04,g_rvb[l_ac].rvb03)
                     #No.FUN-610018
                     LET g_before_input_done = FALSE
                     CALL t110_set_entry_b(p_cmd)
                     CALL t110_set_no_entry_b(p_cmd)
                     LET g_before_input_done = TRUE
                     #FUN-730068...........begin
                     # #MOD-550195 add
                     #SELECT * INTO g_rvb2.*
                     #  FROM rvb_file
                     # WHERE rvb01=g_rva.rva01
                     #   AND rvb02=g_rvb_t.rvb02
                     # #MOD-550195(end)
                     #FUN-730068...........end
                  END IF
               END IF
               CALL cl_show_fld_cont()     #FUN-550037(smin)
            END IF

         BEFORE INSERT
            LET l_n = ARR_COUNT()
            LET p_cmd='a'
            INITIALIZE g_rvb[l_ac].* TO NULL      #900423
            INITIALIZE arr_detail[l_ac].* TO NULL #TQC-650108
            LET g_rvb[l_ac].rvb04 = g_rva.rva02  #Body default
            LET g_rvb[l_ac].rvb35 = 'N'
            LET g_rvb[l_ac].rvb07 = 0
            #No.FUN-540027  --begin
            LET g_rvb[l_ac].rvb82 = 0
            LET g_rvb[l_ac].rvb85 = 0
            LET g_rvb[l_ac].rvb87 = 0
            #No.FUN-540027  --end
            IF l_ac > 1  THEN
               LET g_rvb[l_ac].rvb22 = g_rvb[l_ac-1].rvb22
            END IF
            LET g_rvb2.rvb06  = 0     #已請數量
            LET g_rvb2.rvb07  = 0
            LET g_rvb2.rvb08  = 0     #收貨量
            LET g_rvb2.rvb09  = 0     #允請數量
            LET g_rvb2.rvb10  = 0     #
            LET g_rvb2.rvb10t = 0     #No:FUN-550117
            IF cl_null(g_rvb2.rvb15) THEN
               LET g_rvb2.rvb15  = 0     #容器數量
            END IF
            IF cl_null(g_rvb2.rvb16) THEN
               LET g_rvb2.rvb16  = 0     #容器數目
            END IF
            LET g_rvb2.rvb18  = '10'  #收貨狀況
            LET g_rvb2.rvb27  = 0     #NO USE
            LET g_rvb2.rvb28  = 0     #NO USE
            LET g_rvb2.rvb29  = 0     #退補量
            LET g_rvb2.rvb32  = 0     #NO USE
            LET g_rvb2.rvb31  = 0     #
            LET g_rvb2.rvb30  = 0     #入庫量
            LET g_rvb2.rvb33  = 0     #入庫量
            #No.FUN-580115  --begin
            LET g_rvb2.rvb331  = 0    #允收量
            LET g_rvb2.rvb332  = 0    #允收量
            #No.FUN-580115  --end
            LET g_rvb2.rvb35  = 'N'   #樣品否
            LET g_rvb2.rvb40  = ''    #檢驗日期 no.7143

            LET g_rvb2.rvbplant=g_plant     #by lily add 20141217
            LET g_rvb2.rvblegal=g_legal     #by lily add 20141217
            LET g_rvb2.rvb42=' '            #by lily add 20141217

            #No.FUN-540027  --begin
            LET g_rvb05_t = NULL
            #No.FUN-540027  --end
            CALL t110_set_entry_b(p_cmd)          #No.FUN-610018
            LET g_rvb_t.* = g_rvb[l_ac].*         #新輸入資料
            CALL cl_show_fld_cont()     #FUN-550037(smin)
            NEXT FIELD rvb02

         AFTER INSERT
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
            #No.FUN-540027  --begin
            IF g_sma.sma115 = 'Y' THEN
               CALL s_chk_va_setting(g_rvb[l_ac].rvb05)
                    RETURNING g_flag,g_ima906,g_ima907
               IF g_flag=1 THEN
                  NEXT FIELD rvb05
               END IF

               CALL s_chk_va_setting1(g_rvb[l_ac].rvb05)
                    RETURNING g_flag,g_ima908
               IF g_flag=1 THEN
                  NEXT FIELD rvb05
               END IF

               CALL t110_du_data_to_correct()

               CALL t110_set_origin_field()
            END IF

            IF cl_null(g_rvb[l_ac].rvb86) THEN
               LET g_rvb[l_ac].rvb86 = g_rvb[l_ac].pmn07
               LET g_rvb[l_ac].rvb87 = g_rvb[l_ac].rvb07
            END IF
            #No.FUN-540027  --end
            # 當為製程委外時不寫 tlf,不 update ima,img 所以可不key 倉庫
            LET l_ec_sw = 'N'
            IF g_argv2_2 ='SUB' THEN
               LET l_sfb24=''
               SELECT sfb24 INTO l_sfb24
                FROM sfb_file
                WHERE sfb01 = g_rvb[l_ac].rvb34
               IF l_sfb24 IS NOT NULL AND l_sfb24='Y' THEN
                  LET l_ec_sw='Y'
               END IF
               IF l_ec_sw='Y' THEN
                  LET g_rvb[l_ac].rvb36=' '
                  LET g_rvb[l_ac].rvb37=' '
                  LET g_rvb[l_ac].rvb38=' '
               END IF
            END IF

            #備註:AFTER FIELD rvb22有寫到-------------------------------begin
            #modi in 00/01/18 若為LC收貨，則須檢查數貨不可大於提單數量
            #IF g_sma.sma41 = 'Y' AND g_rva.rva04='Y' THEN
            #   SELECT als05,als21 INTO l_als05,l_als21 FROM als_file
            #    WHERE als01=g_rvb[l_ac].rvb22
            #   IF SQLCA.sqlcode=100 THEN
#           #      CALL cl_err(g_rvb[l_ac].rvb22,'aap-762',1)  #No.FUN-660129
            #      CALL cl_err3("sel","als_file",g_rvb[l_ac].rvb22,"","aap-762","","",1) #No.FUN-660129
            #      CALL g_rvb.deleteElement(l_ac)
            #      NEXT FIELD rvb22
            #     #CANCEL INSERT       #MOD-680004 mark
            #   END IF
            #   IF l_als05 <> g_rva.rva05 THEN
            #      CALL cl_err('','apm-303',1)
            #      CALL g_rvb.deleteElement(l_ac)
            #      NEXT FIELD rvb22
            #     #CANCEL INSERT       #MOD-680004 mark
            #   END IF
            #備註:AFTER FIELD rvb22有寫到------------------------------end

            #備註:AFTER FIELD rvb07有寫到------------------------------begin
            #   IF NOT cl_null(l_als21) THEN
            #      LET g_rva.rva08 = l_als21
            #      DISPLAY BY NAME g_rva.rva08
            #   END IF
            #   SELECT alt06 INTO l_alt06 FROM alt_file
            #    WHERE alt01=g_rvb[l_ac].rvb22
            #      AND alt14=g_rvb[l_ac].rvb04
            #      AND alt15=g_rvb[l_ac].rvb03
            #   IF cl_null(l_alt06) THEN
            #      LET l_alt06 = 0
            #   END IF
            #   SELECT SUM(rvb07) INTO t_alt06 FROM rvb_file
            #    WHERE rvb22=g_rvb[l_ac].rvb22
            #      AND rvb04=g_rvb[l_ac].rvb04
            #      AND rvb03=g_rvb[l_ac].rvb03
            #      AND rvb01!=g_rva.rva01 AND rvb35='N'
            #   IF cl_null(t_alt06) THEN
            #      LET t_alt06 = 0
            #   END IF
            #   IF g_rvb[l_ac].rvb07 > (l_alt06-t_alt06) THEN
            #      CALL cl_err('','apm-305',0)
            #      CALL g_rvb.deleteElement(l_ac)
            #      #No.FUN-540027  --begin
            #      IF g_sma.sma115 = 'Y' THEN
            #         IF g_ima906 MATCHES '[23]' THEN
            #            NEXT FIELD rvb85
            #         ELSE
            #            NEXT FIELD rvb82
            #         END IF
            #      ELSE
            #         NEXT FIELD rvb07
            #      END IF
            #     #CANCEL INSERT       #MOD-680004 mark
            #      #No.FUN-540027  --end
            #   END IF
            #END IF
            #備註:AFTER FIELD rvb07有寫到-----------------------------end

            #備註:在確認段會卡,所以若料/倉/儲/批不存在不能確認
            #所以不需在此重覆判斷
            #---再判斷一次倉儲批是否存在
            #IF NOT cl_null(g_rvb[l_ac].rvb36) THEN
            #   IF g_rvb[l_ac].rvb37 IS NULL THEN
            #      LET g_rvb[l_ac].rvb37=' '
            #   END IF
            #   IF g_rvb[l_ac].rvb38 IS NULL THEN
            #      LET g_rvb[l_ac].rvb38=' '
            #   END IF
            #   SELECT img07,img10,img09 INTO g_img07,g_img10,g_img09
            #     FROM img_file   #採購單位,庫存數,庫存單位
            #    WHERE img01=g_rvb[l_ac].rvb05 AND img02=g_rvb[l_ac].rvb36
            #      AND img03=g_rvb[l_ac].rvb37 AND img04=g_rvb[l_ac].rvb38
            #   IF STATUS=100 AND (g_rvb[l_ac].rvb36 IS NOT NULL AND g_rvb[l_ac].rvb36 <> ' ') THEN
            #      IF g_sma.sma892[3,3] ='Y' THEN
            #         IF NOT cl_confirm('mfg1401') THEN
            #            CALL g_rvb.deleteElement(l_ac)
            #            NEXT FIELD rvb38
            #           #CANCEL INSERT       #MOD-680004 mark
            #         END IF
            #      END IF
            #      CALL s_add_img(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
            #                     g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
            #                     g_rva.rva01,g_rvb[l_ac].rvb02,g_rva.rva06)
            #   END IF
            #   SELECT img07,img10,img09 INTO g_img07,g_img10,g_img09
            #     FROM img_file
            #    WHERE img01=g_rvb[l_ac].rvb05 AND img02=g_rvb[l_ac].rvb36
            #      AND img03=g_rvb[l_ac].rvb37 AND img04=g_rvb[l_ac].rvb38
            #END IF
            CALL t110_b_move_back() #FUN-730068
            #CHI-7B0023..............begin #本段移到move_back內
            #LET g_rvb2.rvb01 = g_rva.rva01
            #LET g_rvb2.rvb02 = g_rvb[l_ac].rvb02
            #LET g_rvb2.rvb03 = g_rvb[l_ac].rvb03
            #LET g_rvb2.rvb04 = g_rvb[l_ac].rvb04
            #LET g_rvb2.rvb05 = g_rvb[l_ac].rvb05
            #LET g_rvb2.rvb06 = 0
            #LET g_rvb2.rvb07 = g_rvb[l_ac].rvb07
            ##No.FUN-540027  --begin
            #LET g_rvb2.rvb80 = g_rvb[l_ac].rvb80
            #LET g_rvb2.rvb81 = g_rvb[l_ac].rvb81
            #LET g_rvb2.rvb82 = g_rvb[l_ac].rvb82
            #LET g_rvb2.rvb83 = g_rvb[l_ac].rvb83
            #LET g_rvb2.rvb84 = g_rvb[l_ac].rvb84
            #LET g_rvb2.rvb85 = g_rvb[l_ac].rvb85
            #LET g_rvb2.rvb86 = g_rvb[l_ac].rvb86
            #LET g_rvb2.rvb87 = g_rvb[l_ac].rvb87
            ##No.FUN-540027  --end
            #CHI-7B0023..............end
            #No.MOD-490173 一律讓 rvb10 有值，只須依p_perright隱藏
           #IF cl_chk_act_auth() THEN
               IF cl_null(g_rvb[l_ac].rvb10) THEN
                  LET g_rvb[l_ac].rvb10 = 0
               END IF
               LET g_rvb2.rvb10 = g_rvb[l_ac].rvb10
           #ELSE
           #   IF cl_null(g_pmn31) THEN LET g_pmn31 = 0 END IF
           #   LET g_rvb2.rvb10 = g_pmn31
           #END IF
            #No:FUN-550117
            IF cl_null(g_rvb[l_ac].rvb10t) THEN LET g_rvb[l_ac].rvb10t = 0 END IF
            LET g_rvb2.rvb10t = g_rvb[l_ac].rvb10t
            #end No:FUN-550117
            LET g_rvb2.rvb22 = g_rvb[l_ac].rvb22
            LET g_rvb2.rvb26 = NULL
            LET g_rvb2.rvb31 = g_rvb2.rvb07        #可入庫量
            LET g_rvb2.rvb34 = g_rvb[l_ac].rvb34
            LET g_rvb2.rvb35 = g_rvb[l_ac].rvb35
            LET g_rvb2.rvb36 = g_rvb[l_ac].rvb36
            LET g_rvb2.rvb37 = g_rvb[l_ac].rvb37
            LET g_rvb2.rvb38 = g_rvb[l_ac].rvb38
            LET g_rvb2.rvb930= g_rvb[l_ac].rvb930  #FUN-670051
          #----------No:MOD-650095 modify
           #IF cl_null(g_rvb2.rvb08) THEN
            IF cl_null(g_rvb2.rvb08) OR g_rvb2.rvb08 = 0 THEN
          #----------No:MOD-650095 end
               LET g_rvb2.rvb08 = g_rvb2.rvb07
            END IF
            LET g_rvb2.rvb11 = 0
            LET g_rvb2.rvb25 = g_rvb[l_ac].rvb25
            SELECT ima491 INTO l_ima491 FROM ima_file
             WHERE ima01 = g_rvb2.rvb05
            IF cl_null(l_ima491) THEN
               LET l_ima491 = 0
            END IF
            IF l_ima491 > 0 THEN
               CALL s_getdate(g_rva.rva06,l_ima491) RETURNING g_rvb2.rvb12
            ELSE
               IF cl_null(g_rvb2.rvb12) THEN
                  LET g_rvb2.rvb12 = g_rva.rva06
               END IF
            END IF
             #FUN-850022 --begin
            # CALL t110_get_rvb39(g_rvb2.rvb04,g_rvb2.rvb05,g_rvb2.rvb19,g_rva.rva05,g_sma.sma886)   #by lily modify 20141012
             CALL t110_get_rvb39(g_rvb2.rvb03,g_rvb2.rvb04,g_rvb2.rvb05,g_rvb2.rvb19,g_rva.rva05,g_sma.sma886)
                  RETURNING g_rvb2.rvb39 #MOD-530415
                       # cjy by 09/05/18 收货单别为PPB,PPF,KBP,KPF则檢查項目設置為免檢，使倉庫可直接生成入庫單
              IF g_rva.rva10='SUB' AND (g_rva.rva01 MATCHES 'PPB*' OR g_rva.rva01 MATCHES 'PPF*' OR g_rva.rva01 MATCHES 'KPF*' OR g_rva.rva01 MATCHES 'KPB*' OR g_rva.rva01 MATCHES '271*') THEN   #add 271 by wenny20160318
                 LET g_rvb2.rvb39='N'
               END IF
               #end  cjy  by 09/05/18


             #FUN-850022 --end
            #No.FUN-540027  --begin
            LET g_rvb2.rvb88 =g_rvb2.rvb87 * g_rvb2.rvb10
            LET g_rvb2.rvb88t=g_rvb2.rvb87 * g_rvb2.rvb10t
            #No.FUN-540027  --end
            #CHI-830033-begin-add
            #不使用單價*數量=金額, 改以金額回推稅率, 以避免小數位差的問題
            SELECT gec07 INTO g_gec07 FROM gec_file,pmm_file
             WHERE gec01 = pmm21
               AND pmm01 = g_rvb2.rvb04
            IF SQLCA.SQLCODE = 100 THEN
               CALL cl_err('','mfg3192',0)
               NEXT FIELD rvb04
            END IF
            SELECT azi04 INTO t_azi04
              FROM pmm_file,azi_file
             WHERE pmm22=azi01
               AND pmm01=g_rvb2.rvb04
            IF g_gec07='Y' THEN
               LET g_rvb2.rvb88 = g_rvb2.rvb88t / ( 1 + g_rvb[l_ac].pmm43/100)
               LET g_rvb2.rvb88 = cl_digcut(g_rvb2.rvb88 , t_azi04)
            ELSE
               LET g_rvb2.rvb88t = g_rvb2.rvb88 * ( 1 + g_rvb[l_ac].pmm43/100)
               LET g_rvb2.rvb88t = cl_digcut( g_rvb2.rvb88t , t_azi04)
            END IF
            #CHI-830033-end-add
            #MOD-810137-begin-add
             # cjy by 08/12/01 收货单别为PPB,PPF,KPB,KPF则收货单价,金额为0
              IF g_rva.rva10='SUB' AND (g_rva.rva01 MATCHES 'PPB*' OR g_rva.rva01 MATCHES 'PPF*' OR g_rva.rva01 MATCHES 'KPF*' OR g_rva.rva01 MATCHES 'KPB*' OR g_rva.rva01 MATCHES '271*') THEN
                 LET g_rvb2.rvb88=0
                 LET g_rvb2.rvb88t=0
                 LET g_rvb2.rvb10t=0
                 LET g_rvb2.rvb10=0

             END IF
             IF g_rvb2.rvb04[1,3]='WWC'  THEN
                 LET g_rvb2.rvb88=0
                 LET g_rvb2.rvb88t=0
                 LET g_rvb2.rvb10t=0
                 LET g_rvb2.rvb10=0
             END IF
               #end  cjy  by 08/12/01
            IF g_rvb2.rvb36 IS NULL THEN LET g_rvb2.rvb36=' ' END IF
            IF g_rvb2.rvb37 IS NULL THEN LET g_rvb2.rvb37=' ' END IF
            IF g_rvb2.rvb38 IS NULL THEN LET g_rvb2.rvb38=' ' END IF
            IF g_rvb2.rvb42 IS NULL THEN LET g_rvb2.rvb42=' ' END IF   #by lily add 20141217

            #MOD-810137-end-add
            INSERT INTO rvb_file VALUES (g_rvb2.*)
            IF SQLCA.sqlcode THEN
#              CALL cl_err(g_rvb[l_ac].rvb02,SQLCA.sqlcode,0) #No.FUN-660129
               CALL cl_err3("ins","rvb_file",g_rvb2.rvb01,g_rvb2.rvb02,SQLCA.sqlcode,"","",1) #No.FUN-660129
               CANCEL INSERT
            ELSE
               MESSAGE 'INSERT O.K'
               LET g_rec_b=g_rec_b+1
               DISPLAY g_rec_b TO FORMONLY.cn2
               IF g_success='Y' THEN
                  COMMIT WORK
               ELSE
                  ROLLBACK WORK
               END IF
            END IF

         BEFORE FIELD rvb02                        #default 序號
            IF cl_null(g_rvb[l_ac].rvb02) OR g_rvb[l_ac].rvb02 = 0 THEN
               SELECT max(rvb02)+1
                 INTO g_rvb[l_ac].rvb02
                 FROM rvb_file
                WHERE rvb01 = g_rva.rva01
               IF g_rvb[l_ac].rvb02 IS NULL THEN
                  LET g_rvb[l_ac].rvb02 = 1
               END IF
            END IF

         AFTER FIELD rvb02                        #check 序號是否重複
            IF g_rvb[l_ac].rvb02 != g_rvb_t.rvb02 OR g_rvb_t.rvb02 IS NULL THEN
               SELECT COUNT(*) INTO g_cnt FROM rvb_file
                WHERE rvb01 = g_rva.rva01
                  AND rvb02 = g_rvb[l_ac].rvb02
               IF g_cnt > 0 THEN
                  CALL cl_err('',-239,0)
                  LET g_rvb[l_ac].rvb02 = g_rvb_t.rvb02
                  NEXT FIELD rvb02
               END IF
            END IF
            LET l_direct = 'D'

         BEFORE FIELD rvb22
            LET l_rvb22_old = g_rvb[l_ac].rvb22

         AFTER FIELD rvb22
            IF g_sma.sma41 = 'Y' AND g_rva.rva04='Y' THEN
               SELECT als05,als21 INTO l_als05,l_als21 FROM als_file
                WHERE als01=g_rvb[l_ac].rvb22
               IF SQLCA.sqlcode=100 THEN
#                 CALL cl_err(g_rvb[l_ac].rvb22,'aap-762',0)  #No.FUN-660129
                  CALL cl_err3("sel","als_file",g_rvb[l_ac].rvb22,"","aap-762","","",1) #No.FUN-660129
                  NEXT FIELD rvb22
               END IF
               IF l_als05 <> g_rva.rva05 THEN
                  CALL cl_err('','apm-303',0)
                  NEXT FIELD rvb22
               END IF
               IF NOT cl_null(l_als21) THEN
                  LET g_rva.rva08 = l_als21
                  DISPLAY BY NAME g_rva.rva08
               END IF
            END IF
            #No:7746
            #(1)原本有發票資料,後來清空發票資料,
            #(2)原本有發票資料,後來更新發票資料,
            # 符合以上,則要將rvw_file中原有的發票資料刪除
            IF NOT cl_null(l_rvb22_old) THEN
               IF cl_null(g_rvb[l_ac].rvb22) OR
                  (l_rvb22_old <> g_rvb[l_ac].rvb22) THEN
                  IF g_aza.aza26 = '2' THEN #大陸版
                     DELETE FROM rvw_file
                      WHERE rvw01 = l_rvb22_old
                        AND rvw08 = g_rva.rva01
                        AND rvw09 = g_rvb[l_ac].rvb02
                  ELSE
                     #避免刪到別張資料
                     SELECT COUNT(*) INTO g_cnt
                       FROM rvb_file
                      WHERE rvb22 = l_rvb22_old
                        AND (rvb01 <> g_rva.rva01 OR
                             rvb02 <> g_rvb[l_ac].rvb02)
                     IF g_cnt = 0 THEN
                        DELETE FROM rvw_file
                         WHERE rvw01 = l_rvb22_old
                     END IF
                  END IF
                  IF SQLCA.sqlcode THEN
                     CALL cl_err('DEL rvw_filee err!',SQLCA.SQLCODE,0)
                     NEXT FIELD rvb22
                  END IF
               END IF
            END IF
            #大陸版, 發票統一在入庫單發票維護作業輸入
            IF NOT cl_null(g_rvb[l_ac].rvb22) AND g_aza.aza26 != '2' AND
               g_sma.sma886[3,3] = 'Y' AND
              (g_rva.rva04 ='N' OR g_rva.rva04 IS NULL) THEN
               SELECT COUNT(*) INTO l_n FROM rvw_file
                WHERE rvw01=g_rvb[l_ac].rvb22
               IF l_n = 0 OR g_rvb[l_ac].rvb22 != g_rvb_t.rvb22 THEN
                  CALL sapmt114(g_rvb[l_ac].rvb22,g_rva.rva01)
                                RETURNING g_rvb[l_ac].rvb22
                 #MOD-810208-begin-modify
                  IF INT_FLAG THEN
                     LET g_rvb[l_ac].rvb22 = ''
                     DISPLAY BY NAME g_rvb[l_ac].rvb22
                  ELSE
                     DISPLAY g_rvb[l_ac].rvb22 TO rvb22  #No.MOD-480094
                  END IF
                 #MOD-810208-end-modify
                  LET INT_FLAG=0

                 #-----MOD-830210
                 #判斷單身是否有發票號碼為空白的，
                 #若有則詢問是否一起UPDATE成相同的發票號碼
                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt FROM rvb_file
                                  WHERE rvb01 = g_rva.rva01
                                    AND rvb02 != g_rvb[l_ac].rvb02
                                    AND (rvb22 = ' ' OR rvb22 IS NULL)

                 #發現單身發票欄位有空白的資料，詢問是否一起UPDATE
                  IF l_cnt > 0 THEN
                     IF cl_confirm('aap-267') THEN
                        UPDATE rvb_file
                           SET rvb22=g_rvb[l_ac].rvb22
                         WHERE rvb01=g_rva.rva01
                           AND (rvb22 = ' ' OR rvb22 IS NULL)

                        IF SQLCA.sqlcode THEN
                            CALL cl_err3("upd","rvb_file",g_rva.rva01,"",SQLCA.sqlcode,"","",1) #No.FUN-660129
                        ELSE
                            FOR l_i = 1 TO g_rec_b
                                IF cl_null(g_rvb[l_i].rvb22) THEN
                                   LET g_rvb[l_i].rvb22 = g_rvb[l_ac].rvb22
                                END IF
                            END FOR
                        END IF
                     END IF
                 END IF
                 #-----END MOD-830210

               END IF
            END IF
            #-----MOD-760141---------
            IF NOT cl_null(g_rvb[l_ac].rvb22) THEN
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt FROM rvw_file,rva_file,rvb_file
                  WHERE rvw01 = g_rvb[l_ac].rvb22 AND
                        rvb22 = rvw01 AND
                        rvb01 = rva01 AND
                        rva05 <> g_rva.rva05
               IF l_cnt > 0 THEN
                  CALL cl_err(g_rvb[l_ac].rvb22,'apm-435',0)
                  NEXT FIELD rvb22
               END IF
            END IF
            #-----END MOD-760141-----


         AFTER FIELD rvb05
            #TQC-650108
            #AFTER FIELD 處理邏輯修改為使用下面的函數來進行判斷，請參考相關代碼
            CALL t110_check_rvb05('rvb05',l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
            IF NOT l_check_res THEN NEXT FIELD rvb05 END IF
            SELECT imaag INTO l_imaag FROM ima_file
             WHERE ima01 = g_rvb[l_ac].rvb05
            IF NOT cl_null(l_imaag) AND l_imaag <> '@CHILD' THEN
               DISPLAY BY NAME g_rvb[l_ac].*
               CALL cl_err(g_rvb[l_ac].rvb05,'aim1004',0)
               NEXT FIELD rvb05
            END IF
            #by stevie ---start---141212單頭保稅否管控
            IF NOT cs_check_item_type(g_rva.rva01[1,3],g_rvb[l_ac].rvb05) THEN  #單頭保稅否管控 add by cathree 20140329
                LET g_msg='料件與單別保稅信息不符，請核對'
                CALL cl_err(g_msg,'!',1)
                NEXT FIELD rvb05
            END IF
            #by stevie ---end---

            #TQC-650108 --end

         #TQC-650108
         #對于采用料件多屬性新機制(與單據性質綁定)的分支來說,各個明細屬性欄位都
         #變NOENTRY的, 只能通過在母料件欄位開窗來選擇子料件,并且母料件本身也不允許
         #接受輸入,而只能開窗,所以這里要進行一個特殊的處理,就是一進att00母料件
         #欄位的時候就auto開窗,開完窗之后直接NEXT FIELD以避免用戶亂動
         #其他分支就不需要這么麻煩了
         BEFORE FIELD att00
#           IF g_sma.sma908 <> 'Y' THEN
#              #否則開窗選的是子料件并且要回寫各個明細屬性到各個列中
#              CALL cl_init_qry_var()
#              LET g_qryparam.form ="q_ima_q"
#               LET g_qryparam.default1 = g_rvb[l_ac].att00
#              LET g_qryparam.arg1 = lg_group
#              CALL cl_create_qry() RETURNING g_rvb[l_ac].rvb05
#               CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].att00 )
#              DISPLAY BY NAME g_rvb[l_ac].att00        #No:MOD-490371

               #根據子料件找到母料件及各個屬性
               SELECT imx00,imx01,imx02,imx03,imx04,imx05,
                      imx06,imx07,imx08,imx09,imx10
               INTO g_rvb[l_ac].att00, g_rvb[l_ac].att01, g_rvb[l_ac].att02,
                    g_rvb[l_ac].att03, g_rvb[l_ac].att04, g_rvb[l_ac].att05,
                    g_rvb[l_ac].att06, g_rvb[l_ac].att07, g_rvb[l_ac].att08,
                    g_rvb[l_ac].att09, g_rvb[l_ac].att10
               FROM imx_file
               WHERE imx000 = g_rvb[l_ac].rvb05
               #賦值所有屬性
               LET g_rvb[l_ac].att01_c = g_rvb[l_ac].att01
               LET g_rvb[l_ac].att02_c = g_rvb[l_ac].att02
               LET g_rvb[l_ac].att03_c = g_rvb[l_ac].att03
               LET g_rvb[l_ac].att04_c = g_rvb[l_ac].att04
               LET g_rvb[l_ac].att05_c = g_rvb[l_ac].att05
               LET g_rvb[l_ac].att06_c = g_rvb[l_ac].att06
               LET g_rvb[l_ac].att07_c = g_rvb[l_ac].att07
               LET g_rvb[l_ac].att08_c = g_rvb[l_ac].att08
               LET g_rvb[l_ac].att09_c = g_rvb[l_ac].att09
               LET g_rvb[l_ac].att10_c = g_rvb[l_ac].att10
               #顯示所有屬性
               DISPLAY BY NAME
                 g_rvb[l_ac].att01, g_rvb[l_ac].att01_c,
                 g_rvb[l_ac].att02, g_rvb[l_ac].att02_c,
                 g_rvb[l_ac].att03, g_rvb[l_ac].att03_c,
                 g_rvb[l_ac].att04, g_rvb[l_ac].att04_c,
                 g_rvb[l_ac].att05, g_rvb[l_ac].att05_c,
                 g_rvb[l_ac].att06, g_rvb[l_ac].att06_c,
                 g_rvb[l_ac].att07, g_rvb[l_ac].att07_c,
                 g_rvb[l_ac].att08, g_rvb[l_ac].att08_c,
                 g_rvb[l_ac].att09, g_rvb[l_ac].att09_c,
                 g_rvb[l_ac].att10, g_rvb[l_ac].att10_c

#              NEXT FIELD rvb906
#           END IF

         #FUN-640013 Add,以下是為料件多屬性機制新增的20個屬性欄位的AFTER FIELD代碼
         #下面是十個輸入型屬性欄位的判斷語句
         AFTER FIELD att00
             #檢查att00里面輸入的母料件是否是符合對應屬性組的母料件
             SELECT COUNT(ima01) INTO l_count FROM ima_file
               WHERE ima01 = g_rvb[l_ac].att00 AND imaag = lg_smy62
             IF l_count = 0 THEN
                CALL cl_err_msg('','aim-909',lg_smy62,0)
                NEXT FIELD att00
             END IF

             #如果設置為不允許新增
             IF g_sma.sma908 <> 'Y' THEN
                CALL t110_check_rvb05('imx00',l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
                IF NOT l_check_res THEN NEXT FIELD att00 END IF
             END IF

         AFTER FIELD att01
             CALL t110_check_att0x(g_rvb[l_ac].att01,1,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att01 END IF
         AFTER FIELD att02
             CALL t110_check_att0x(g_rvb[l_ac].att02,2,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att02 END IF
         AFTER FIELD att03
             CALL t110_check_att0x(g_rvb[l_ac].att03,3,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att03 END IF
         AFTER FIELD att04
             CALL t110_check_att0x(g_rvb[l_ac].att04,4,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att04 END IF
         AFTER FIELD att05
             CALL t110_check_att0x(g_rvb[l_ac].att05,5,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att05 END IF
         AFTER FIELD att06
             CALL t110_check_att0x(g_rvb[l_ac].att06,6,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att06 END IF
         AFTER FIELD att07
             CALL t110_check_att0x(g_rvb[l_ac].att07,7,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att07 END IF
         AFTER FIELD att08
             CALL t110_check_att0x(g_rvb[l_ac].att08,8,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att08 END IF
         AFTER FIELD att09
             CALL t110_check_att0x(g_rvb[l_ac].att09,9,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att09 END IF
         AFTER FIELD att10
             CALL t110_check_att0x(g_rvb[l_ac].att10,10,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att10 END IF
         #下面是十個輸入型屬性欄位的判斷語句
         AFTER FIELD att01_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att01_c,1,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att01_c END IF
         AFTER FIELD att02_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att02_c,2,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att02_c END IF
         AFTER FIELD att03_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att03_c,3,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att03_c END IF
         AFTER FIELD att04_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att04_c,4,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att04_c END IF
         AFTER FIELD att05_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att05_c,5,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att05_c END IF
         AFTER FIELD att06_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att06_c,6,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att06_c END IF
         AFTER FIELD att07_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att07_c,7,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att07_c END IF
         AFTER FIELD att08_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att08_c,8,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att08_c END IF
         AFTER FIELD att09_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att09_c,9,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att09_c END IF
         AFTER FIELD att10_c
             CALL t110_check_att0x_c(g_rvb[l_ac].att10_c,10,l_ac,p_cmd) RETURNING #No.MOD-660090
                  l_check_res
             IF NOT l_check_res THEN NEXT FIELD att10_c END IF
         #TQC-650108 --end

#no.TQC-7C0108 --begin
         BEFORE FIELD rvb04     #採購單號
           CALL t110_set_entry_b('s')  #TQC-7C0131
              #TQC-7C0131 mark
              # IF g_sma.sma120 ="Y" THEN
              #    CALL cl_set_comp_entry("att00,att01,att02,att03,att04,att05,att06,att07,att08,att09,att10,att01_c,att02_c,att03_c,att04_c,att05_c,att06_c,att07_c,att08_c,att09_c,att10_c",TRUE)
              # END IF
              #TQC-7C0131 mark
#no.TQC-7C0108 --end
         AFTER FIELD rvb04     #採購單號
            IF NOT cl_null(g_rvb[l_ac].rvb04) THEN




               CALL t110_po(g_rvb[l_ac].rvb04,'b')
               IF NOT cl_null(g_errno) THEN
                  CALL cl_err(g_rvb[l_ac].rvb04,g_errno,0)
                  NEXT FIELD rvb04
               END IF
                #-----No:MOD-570144-----
               IF (g_rvb[l_ac].rvb04 != g_rvb_t.rvb04 OR
                  #MOD-810248-begin-modify
                  #g_rvb[l_ac].rvb03 != g_rvb_t.rvb03) THEN
                   g_rvb[l_ac].rvb03 != g_rvb_t.rvb03) AND
                   NOT cl_null(g_rvb[l_ac].rvb03) THEN
                  #MOD-810248-end-modiy
                  CALL t110_rvb03('a',g_rvb[l_ac].rvb04,g_rvb[l_ac].rvb03)
                  IF cl_null(g_pmm42) THEN LET g_pmm42=0 END IF

                  LET g_rvb2.rvb10 = g_pmn31
                  LET g_rvb2.rvb10t = g_pmn31t #add by endy 151124 更新含税单价
                  LET g_rvb[l_ac].rvb10 = g_pmn31
                  LET g_rvb[l_ac].rvb10t = g_pmn31t #add by endy 151124 更新含税单价
                  DISPLAY g_rvb[l_ac].rvb10 TO rvb10
                  DISPLAY g_rvb[l_ac].rvb10t TO rvb10t #add by endy 151124 更新含税单价
                  IF NOT cl_null(g_errno) THEN
                     IF g_errno = 'mfg0159' THEN
                        NEXT FIELD rvb04
                     ELSE
                        CALL cl_err(g_rvb[l_ac].rvb04,g_errno,0)
                        NEXT FIELD rvb04
                     END IF
                  END IF
                  #不能部份交貨且已有交貨量則不允許通過
                  IF g_pmn50_55 > 0 AND g_pmn14 = 'N' THEN
                     CALL cl_err('','mfg3339',0)
                     NEXT FIELD rvb04
                  END IF
                  #---modi in 99/12/22 若為L/C收貨則輸入之PO及項次必須存在提單檔
                  IF g_sma.sma41 = 'Y' AND g_rva.rva04='Y' THEN
                     SELECT * FROM alt_file
                      WHERE alt01=g_rvb[l_ac].rvb22
                        AND alt14=g_rvb[l_ac].rvb04
                        AND alt15=g_rvb[l_ac].rvb03
                     IF SQLCA.sqlcode=100 THEN
#                       CALL cl_err('','apm-304',0) #No.FUN-660129
                        CALL cl_err3("sel","alt_file",g_rvb[l_ac].rvb22,"","apm-304","","",1) #No.FUN-660129
                        NEXT FIELD rvb04
                     END IF
                  END IF
               END IF
                #-----No:MOD-570144 END-----

               ###### 01/11/18 Tommy 避免三角收貨到一般採購或逆拋三角
               IF g_argv2_2 = 'TAP' THEN
                  SELECT poz011 INTO l_poz011
                    FROM pmm_file,poz_file
                   WHERE pmm904 = poz01
                     AND pmm01 = g_rvb[l_ac].rvb04
                     AND pmm901 = 'Y'         #三角貿易否
                     AND pmm905 = 'Y'         #已拋轉
                     AND pmm02  = 'TAP'       #代採買性質
                     AND pmm906 = 'Y'         #來源單據
                  IF SQLCA.sqlcode THEN
                     LET l_poz011 = ''
                  END IF
                  IF cl_null(l_poz011) OR l_poz011 <> '1' THEN
                     CALL cl_err(g_rva.rva02,'apm-014',0)
                     NEXT FIELD rvb04  #No.9525
                  END IF
                  #-----modi 02/01/31 no.4061 必須同一流程代碼 ----
                  LET l_num =0
                  DECLARE t110_chk1 CURSOR FOR
                      SELECT pmm904 , pmm50
                        FROM rvb_file,pmm_file
                       WHERE rvb04 = pmm01
                         AND rvb01 = g_rva.rva01
                  FOREACH t110_chk1 INTO l_pmm904,l_pmm50
                     IF SQLCA.SQLCODE <> 0 THEN EXIT FOREACH END IF
                     LET l_num = l_num+1
                     IF NOT cl_null(l_pmm904) THEN
                        EXIT FOREACH
                     END IF
                  END FOREACH
                  IF cl_null(l_pmm50) THEN LET l_pmm50=' ' END IF  #MOD-850093 add
                  IF l_pmm904 <> g_pmm904 AND l_num > 0 THEN
                     CALL cl_err('','axm-501',0)
                     NEXT FIELD rvb04
                  END IF
                  IF l_pmm50  <> g_pmm50 AND l_num > 0 THEN #no.6113
                     CALL cl_err('','apm-993',0)
                     NEXT FIELD rvb04
                  END IF
               END IF
            END IF
            NEXT FIELD rvb03 #add by endy 151124

         BEFORE FIELD rvb03     #採購項次
            CALL t110_set_entry_b(p_cmd)

         AFTER FIELD rvb03     #採購項次
            IF NOT cl_null(g_rvb[l_ac].rvb03) THEN
                #No:MOD-4B0275
               IF p_cmd = 'a' OR (p_cmd ='u' AND
                                 (g_rvb[l_ac].rvb04 != g_rvb_t.rvb04 OR
                                  g_rvb[l_ac].rvb03 != g_rvb_t.rvb03)) THEN
                  CALL t110_rvb03('a',g_rvb[l_ac].rvb04,g_rvb[l_ac].rvb03)
                  CALL t110_set_rvb87()     #No:TQC-6C0131 add
                  #MOD-830171-begin-add
                  LET l_pmn20 = 0
                  SELECT pmn20,pmn87 INTO l_pmn20,l_pmn87 FROM pmn_file
                   WHERE pmn01=g_rvb[l_ac].rvb04
                     AND pmn02=g_rvb[l_ac].rvb03
                  IF l_pmn20 = g_rvb[l_ac].rvb07  THEN
                     LET g_rvb[l_ac].rvb87 = l_pmn87
                  END IF
                  #MOD-830171-end-add
                  #-------No:CHI-820010 add
                   IF g_sma.sma116 MATCHES '[02]' THEN
                      LET g_rvb[l_ac].rvb87 = g_rvb[l_ac].rvb07
                   END IF
                  #-------No:CHI-820010 end
                  CALL t110_set_no_entry_b(p_cmd)   #No.FUN-610018
                END IF  #No:MOD-4B0275 end
#no.TQC-7C0108 --begin
                #TQC-7C0131.....begin
                CALL t110_set_no_entry_b('s')
               #IF NOT cl_null(g_rvb[l_ac].rvb04) THEN
               #   CALL cl_set_comp_entry("att00,att01,att02,att03,att04,att05,att06,att07,att08,att09,att10,att01_c,att02_c,att03_c,att04_c,att05_c,att06_c,att07_c,att08_c,att09_c,att10_c",FALSE)
               #END IF
                #TQC-7C0131.....end
#no.TQC-7C0108 --end
               IF cl_null(g_pmm42) THEN LET g_pmm42=0 END IF

               LET g_rvb2.rvb10 = g_pmn31
               LET g_rvb2.rvb10t= g_pmn31t     #No:FUN-550117
               #No.MOD-490173
              #IF cl_chk_act_auth() THEN
                  LET g_rvb[l_ac].rvb10 = g_pmn31
                  LET g_rvb[l_ac].rvb10t= g_pmn31t     #No:FUN-550117
                   DISPLAY g_rvb[l_ac].rvb10  TO rvb10  #MOD-570294 重show一次避免沒跑ON ROW CHANGE
                   DISPLAY g_rvb[l_ac].rvb10t TO rvb10t #MOD-570294 重show一次避免沒跑ON ROW CHANGE
              #END IF
               IF NOT cl_null(g_errno) THEN
                  IF g_errno = 'mfg0159' THEN
                     NEXT FIELD rvb03
                  ELSE
                     CALL cl_err(g_rvb[l_ac].rvb03,g_errno,0)
                     NEXT FIELD rvb03
                  END IF
               END IF
               #不能部份交貨且已有交貨量則不允許通過
               IF g_pmn50_55 > 0 AND g_pmn14 = 'N' THEN
                  CALL cl_err('','mfg3339',0)
                  NEXT FIELD rvb03
               END IF
               #---modi in 99/12/22 若為L/C收貨則輸入之PO及項次必須存在提單檔
               IF g_sma.sma41 = 'Y' AND g_rva.rva04='Y' THEN
                  SELECT * FROM alt_file
                   WHERE alt01=g_rvb[l_ac].rvb22
                     AND alt14=g_rvb[l_ac].rvb04
                     AND alt15=g_rvb[l_ac].rvb03
                  IF SQLCA.sqlcode=100 THEN
#                    CALL cl_err('','apm-304',0)  #No.FUN-660129
                     CALL cl_err3("sel","alt_file",g_rvb[l_ac].rvb22,"","apm-304","","",1) #No.FUN-660129
                     NEXT FIELD rvb04
                  END IF
               END IF
            END IF
            LET l_direct = 'U'

        #BEFORE FIELD rvb36            #若 MISC 則不須輸入倉儲批
            # 當為製程委外時不寫 tlf,不 update ima,img 所以可不key 倉庫
            LET l_ec_sw = 'N'
            IF g_argv2_2 ='SUB' THEN
               LET l_sfb24=''
               SELECT sfb24 INTO l_sfb24
                 FROM sfb_file
                WHERE sfb01 = g_rvb[l_ac].rvb34
               IF l_sfb24 IS NOT NULL AND l_sfb24='Y' THEN
                  LET l_ec_sw='Y'
               END IF
            END IF
            IF l_ec_sw='Y' THEN
               LET g_rvb[l_ac].rvb36=' '
               LET g_rvb[l_ac].rvb37=' '
               LET g_rvb[l_ac].rvb38=' '
               #------MOD-5A0095 START----------
               DISPLAY BY NAME g_rvb[l_ac].rvb36
               DISPLAY BY NAME g_rvb[l_ac].rvb37
               DISPLAY BY NAME g_rvb[l_ac].rvb38
               #------MOD-5A0095 END------------
               CALL cl_err('','mfg-021',0)
            END IF
            #No.FUN-540027  --begin
            LET g_ima906 = NULL
            SELECT ima906 INTO g_ima906 FROM ima_file
             WHERE ima01=g_rvb[l_ac].rvb05
            #No.FUN-540027  --end
            CALL t110_set_no_entry_b(p_cmd)

         AFTER FIELD rvb35     #樣品否
            IF NOT cl_null(g_rvb[l_ac].rvb35) THEN
               IF g_rvb[l_ac].rvb35 NOT MATCHES '[YN]'THEN
                  NEXT FIELD rvb35
               END IF
            END IF

         # ---- check 最小套數(以防未發料卻可入庫) ----#
         BEFORE FIELD rvb07    #收貨量
            SELECT sfb05,sfb39,sfb93 INTO l_sfb05,l_sfb39,l_sfb93 FROM sfb_file       #No:FUN-610101 add sfb93
             WHERE sfb01 = g_rvb[l_ac].rvb34
            IF l_sfb39 != '2' THEN   #工單完工方式為'2' pull 不check min_set
               IF g_argv2_2 ='SUB' AND g_rvb[l_ac].rvb05=l_sfb05 THEN   # 委外
                  LET g_min_set = 0
          #        CALL s_minp(g_rvb[l_ac].rvb34,g_sma.sma73,g_sma.sma74,'')
          #              RETURNING g_cnt,g_min_set
         #                         CALL s_minp(g_rvb[l_ac].rvb34,'N',g_sma.sma74,'')  #by lily modify 20141012
                                   CALL s_minp(g_rvb[l_ac].rvb34,'N',g_sma.sma74,'','','',g_rva.rva06)
 #                                CALL s_minp(g_rvb[l_ac].rvb34,g_sma.sma73,g_sma.sma74,'')
                        RETURNING g_cnt,g_min_set

                   SELECT ta_ima001 INTO l_ta_ima001
                   FROM ima_file
                   WHERE ima01 = g_rvb[l_ac].rvb05
                  IF cl_null(l_ta_ima001) THEN
                  LET l_ta_ima001 = 0
                  END IF
                 IF g_sma.sma899 = 'Y' THEN LET g_min_set = g_min_set * (1+l_ta_ima001/100) END IF
                  SELECT ima55 INTO l_ima55
                    FROM ima_file
                   WHERE ima01 = g_rvb[l_ac].rvb05
                  CALL s_umfchk(g_rvb[l_ac].rvb05,g_rvb[l_ac].pmn07,l_ima55)
                       RETURNING g_i,l_fac
                  IF g_i = 1 THEN
                     #採購單位無法與料件的生產單位做換算,預設轉換率為1
                     CALL cl_err(g_rvb[l_ac].rvb05,'apm-120',1)
                     LET l_fac = 1
                  END IF
                  LET g_min_set = g_min_set / l_fac

                  IF g_cnt !=0  THEN
                     CALL cl_err('s_minp()','asf-549',0)
                     NEXT FIELD rvb34
                  END IF
                  # 確認之(收貨-退貨)
                  SELECT SUM(rvb07-rvb29) INTO conf_qty FROM rvb_file,rva_file
                   WHERE rvb34 = g_rvb[l_ac].rvb34
                     AND rvb01 = rva01 AND rvaconf<>'X'    #MOD-790062 modify 排除作廢單據
                     AND rvb05 = g_rvb[l_ac].rvb05 AND rvb35='N'
                     AND NOT (rvb02=g_rvb[l_ac].rvb02 AND rvb01=g_rva.rva01)  #MOD-790062 排除本張單正在輸入的項次

                  IF conf_qty IS NULL THEN LET conf_qty=0 END IF
                  LET g_min_set=g_min_set-conf_qty
                  #ERROR "最小套數:",g_min_set        #MOD-530700
                   CALL cl_err(g_min_set,'aqc-426',0) #MOD-530700
               END IF

               ## 委外採購若有部分交貨應以QPA計算實收數量
               IF g_argv2_2 = 'SUB' AND g_pmn14 = 'Y' THEN
                  IF NOT cl_null(g_rvb[l_ac].rvb34) THEN  #委外工單
                     INITIALIZE l_sfa.* TO NULL
                     SELECT sfa_file.* INTO l_sfa.* FROM sfa_file,pmn_file
                      WHERE pmn01 = g_rvb[l_ac].rvb04
                        AND pmn02 = g_rvb[l_ac].rvb03
                        AND sfa01 = g_rvb[l_ac].rvb34
                        AND sfa03 = g_rvb[l_ac].rvb05
                        AND pmn65 = '2'  #代買
                  END IF
               END IF
            END IF

         AFTER FIELD rvb07     #實收數量
            IF NOT cl_null(g_rvb[l_ac].rvb07) THEN
               IF g_rvb[l_ac].rvb07 <=0 THEN
                  NEXT FIELD rvb07
               END IF

############2016-11-04 by dengyu
            SELECT (pmn20-pmn50+pmn55) INTO l_th FROM pmn_file WHERE pmn01 = g_rva.rva02  AND pmn16='2'

            SELECT SUM(rvb07)  INTO l_rvb07s FROM rva_file,rvb_file
               WHERE rvb04=g_rvb[l_ac].rvb04 AND rvb03=g_rvb[l_ac].rvb03
               AND rva01=rvb01 AND rvaconf='N' AND rvb35='N'
               AND rva02=g_rva.rva02 AND rva01<>g_rva.rva01

            IF cl_null(l_rvb07s) THEN LET l_rvb07s=0 END IF

            SELECT ta_ima001 INTO l_ta_ima001 FROM ima_file WHERE ima01=g_rvb[l_ac].rvb05

            IF cl_null(l_ta_ima001) THEN LET l_ta_ima001=0 END IF
            LET l_ta=g_rvb[l_ac].pmn20 * l_ta_ima001 /100
            LET l_th=l_th-l_rvb07s + l_ta

            IF g_rvb[l_ac].rvb07 >l_th THEN
               #實收數量為零的資料不用再產生
               CALL cl_err('收货数量大于采购量','aaz-200',1)   #2016-11-04 by dengyu
               NEXT FIELD rvb07
            END IF
###########
           ##############bycjy 20101126發料單產生后，不允許更改發料單數量########################
               LET l_cnt=0
               SELECT count(*) INTO l_cnt FROM sfp_file WHERE sfp01=g_rva.ta_rva01 AND sfp04='Y'
               IF l_cnt>0 THEN
               CALL cl_err('','cpm-010',1)
               NEXT FIELD rvb07
               END IF




           #########################################################################################

           #############add caroline   20110518  判断是否存在重工料件###########################

           #130424IF g_rva.rva05 <> 'RT0597' THEN
           LET l_cnt = 0
           SELECT COUNT(*) INTO l_cnt FROM tc_szp_file WHERE tc_szp01 = g_rva.rva05 AND tc_szp04 = 'Y'
           IF l_cnt = 0 THEN
              LET l_cnt=0
              SELECT sum(img10) INTO l_cnt FROM img_file WHERE img01=g_rvb[l_ac].rvb05 and  img02 in
#              ('WFWIP','WFGWIP')  and img03 = g_rva.rva05   #by jianwei 20160624
#              ('YWFWIP','WFWIP','WFGWIP')  and img03 = g_rva.rva05     #by jianwei 20160624
              ('YWFWIP','WFGWIP','YMJZXMWIP','YCNCXMWIP')  and img03 = g_rva.rva05   #by jianwei 20160624 #by jianwei 20160711
              IF l_cnt > 0 THEN
                   LET l_cnt = 0
                   SELECT COUNT(*) INTO l_cnt FROM sfa_file,sfb_file WHERE sfb01=sfa01 and sfb01=g_rvb[l_ac].rvb34
                   and sfb05=g_rvb[l_ac].rvb05   and sfa03!=sfb05  and sfb87 != 'X' and sfb04 !='8'
                   IF l_cnt > 0 THEN
                     LET g_rvb[l_ac].rvb07 = 0
                     CALL cl_err('','cpm-052',1)
                     NEXT FIELD rvb07
                   END IF
             END IF
           END IF
           ####################################################################################

               LET g_rvb2.rvb08=g_rvb[l_ac].rvb07
               IF p_cmd = 'a' THEN  #FUN-550195 add if 判斷 避免在修改狀態時,若原本的rvb08已輸入其它數量了,則又被復原跟rvb07一樣
                   LET g_rvb2.rvb08=g_rvb[l_ac].rvb07
               END IF

               IF cl_null(g_pmn13) THEN   #超交率
                  LET g_pmn13 = 0
               END IF
               IF cl_null(g_pmn50_55) THEN
                  LET g_pmn50_55 = 0
               END IF
               LET g_pmn20 = g_rvb[l_ac].pmn20

               SELECT SUM(rvb07) INTO l_rvb07_3 FROM rvb_file,rva_file
                WHERE rvb04=g_rvb[l_ac].rvb04
                  AND rvb03=g_rvb[l_ac].rvb03
                  AND rvaconf='N'
                  AND rva01=rvb01
                  AND rvb35='N'
                  AND NOT (rvb01=g_rva.rva01 AND rvb02=g_rvb[l_ac].rvb02)
               IF cl_null(l_rvb07_3) THEN
                  LET l_rvb07_3 = 0
               END IF

               #計算已交量
               LET l_rvb07=g_pmn50_55-g_pmn58+l_rvb07_3+g_rvb[l_ac].rvb07
               LET l_rvb07_1=(g_pmn20*(100+g_pmn13))/100   #可交貨量
               #LET l_rvb07_2=l_rvb07-l_rvb07_1               #MOD-530021 MARK
                LET l_rvb07_2=(g_pmn20*(100-g_pmn13))/100     #MOD-530021 #最少可交貨量


               #modi in 99/12/22 若為LC收貨，則須檢查數貨不可大於提單數量
               IF g_sma.sma41 = 'Y' AND g_rva.rva04='Y' THEN
                  SELECT alt06 INTO l_alt06 FROM alt_file
                   WHERE alt01=g_rvb[l_ac].rvb22
                     AND alt14=g_rvb[l_ac].rvb04
                     AND alt15=g_rvb[l_ac].rvb03
                  IF cl_null(l_alt06) THEN
                     LET l_alt06 = 0
                  END IF
                  SELECT SUM(rvb07) INTO t_alt06 FROM rvb_file
                   WHERE rvb22=g_rvb[l_ac].rvb22
                     AND rvb04=g_rvb[l_ac].rvb04
                     AND rvb03=g_rvb[l_ac].rvb03
                     AND rvb01!=g_rva.rva01
                     AND rvb35='N'
                  IF cl_null(t_alt06) THEN
                     LET t_alt06 = 0
                  END IF
                  IF g_rvb[l_ac].rvb07 > (l_alt06-t_alt06) THEN
                     CALL cl_err('','apm-305',0)
                     NEXT FIELD rvb07
                  END IF
               END IF

               IF g_pmn13 >= 0 THEN    #MODIFY 超短交控制 by Keith
                  IF g_pmn14 = 'N' THEN   #不能部份交貨, 超短交都控制
                     #IF l_rvb07_1 > l_rvb07 THEN #短交 #MOD-530021
                      IF l_rvb07_2 > l_rvb07 THEN #短交 #MOD-530021
                        IF g_sma.sma85 MATCHES '[Rr]' THEN
                           CALL cl_err(l_rvb07_2,'mfg3038',0)
                           NEXT FIELD rvb07
                        ELSE
                           CALL cl_err(l_rvb07_2,'mfg9120',1)
                        END IF
                     END IF
                     ###### 01/10/23 Tommy 樣品不檢查
                     IF g_rvb[l_ac].rvb35 = 'N' AND g_rva.rva10 != 'SUB' THEN  #CHI-6B0019委外不檢查超交
                        IF l_rvb07_1 < l_rvb07 THEN #超交
                           IF g_sma.sma85 MATCHES '[Rr]'  THEN
                               CALL cl_err(l_rvb07_1,'mfg3037',1) #MOD-530021 #將show l_rvb07_2,改成l_rvb07_1  #No.TQC-6C0091 0->1
                              NEXT FIELD rvb07
                           ELSE
                               CALL cl_err(l_rvb07_1,'mfg9121',1) #MOD-530021 #將show l_rvb07_2,改成l_rvb07_1
                           END IF
                        END IF
                     END IF
                     ###### End Tommy
                  END IF
                  IF g_pmn14 = "Y" THEN    #可部份交貨, 則僅控制超交
                     ###### 01/10/23 Tommy 樣品不檢查
                     IF g_rvb[l_ac].rvb35 = 'N' AND g_rva.rva10 != 'SUB' THEN #CHI-6B0019委外不檢查超交
                        IF l_rvb07_1 < l_rvb07 THEN #超交
                           IF g_sma.sma85 MATCHES '[Rr]' THEN
                               CALL cl_err(l_rvb07_1,'mfg3037',1) #MOD-530021 #將show l_rvb07_2,改成l_rvb07_1  #No.TQC-6C0091 0->1
                              NEXT FIELD rvb07
                           ELSE
                               CALL cl_err(l_rvb07_1,'mfg9121',1) #MOD-530021 #將show l_rvb07_2,改成l_rvb07_1
                           END IF
                        END IF
                     END IF
                     ###### End Tommy
                  END IF
               END IF

               IF g_pmn13 < 0 THEN    #控制超短交
                  IF g_pmn14 = 'N' THEN   #不能部份交貨
                     IF l_rvb07 - g_pmn20 < 0 THEN      #須>= 訂購量
                        CALL cl_err(l_rvb07,'mfg3335',0)
                        NEXT FIELD rvb07
                     END IF
                  END IF
               END IF

               #NO:4669-->確認之(收貨-退貨)
               IF l_sfb39 != '2' THEN   #工單完工方式為'2' pull 不check min_set
                 IF g_argv2_2 ='SUB' AND g_rvb[l_ac].rvb05=l_sfb05 THEN
                  #-----------No:TQC-670091 modify
                   #AND l_sfb93 != 'Y' THEN  #No:FUN-610101 add判斷走製程時不控管最小發料套數
                    IF l_sfb93 != 'Y' THEN   #CHI-840066 modify add ! 製程委外不控管最小發料套數
#wujie 080810 --begin
#                      CALL t110_minp(g_rvb[l_ac].rvb03,g_rvb[l_ac].rvb04,
#                                     g_rvb[l_ac].rvb34) RETURNING l_min_set

#                     #--------------No:TQC-730059 add
#                      CALL s_umfchk(g_rvb[l_ac].rvb05,g_rvb[l_ac].pmn07,l_ima55)
#                           RETURNING g_i,l_fac
#                      IF g_i = 1 THEN
#                         #採購單位無法與料件的生產單位做換算,預設轉換率為1
#                         CALL cl_err(g_rvb[l_ac].rvb05,'apm-120',1)
#                         LET l_fac = 1
#                      END IF
#                      LET l_min_set = l_min_set / l_fac
#                     #--------------No:TQC-730059 end

#                      IF g_rvb[l_ac].rvb07 > l_min_set THEN
#                         CALL cl_err(g_rvb[l_ac].rvb07,'apm-307',1)
#                         NEXT FIELD rvb07
#                      END IF
                       IF g_rvb[l_ac].rvb07 > g_min_set THEN
                          CALL cl_err(g_rvb[l_ac].rvb07,'apm-307',1)
                          NEXT FIELD rvb07
                       END IF
#wujie 080810 --end
                    ELSE
#wujie 080810 --begin
                       IF g_rvb[l_ac].rvb07>g_rvb[l_ac].pmn20 -conf_qty THEN
                          CALL cl_err(g_rvb[l_ac].rvb07,'apm-070',1)
                          NEXT FIELD rvb07
                       END IF
#                      IF g_rvb[l_ac].rvb07>g_min_set THEN
#                         #委外實收數不可大於發料最小套數!
#                         CALL cl_err(g_rvb[l_ac].rvb07,'apm-307',1)
#                         NEXT FIELD rvb07
#                      END IF
#wujie 080810 --end
                    END IF
                  #-----------No:TQC-670091 modify
                 END IF
               END IF
            END IF
           #No.080829--begin-- move here
            IF cl_null(g_rvb[l_ac].rvb86) THEN
               LET g_rvb[l_ac].rvb86=g_rvb[l_ac].pmn07
               LET g_rvb[l_ac].rvb87=g_rvb[l_ac].rvb07
            END IF
           #No.080829---end---
         #No.FUN-540027  --begin

           #No.080829--begin-- modify
           #IF cl_null(g_rvb_t.rvb07) AND g_rvb[l_ac].rvb07 IS NOT NULL OR
           #   NOT cl_null(g_rvb_t.rvb07) AND cl_null(g_rvb[l_ac].rvb07) OR
           #   g_rvb_t.rvb07 <> g_rvb[l_ac].rvb07 THEN
            ON CHANGE rvb07
           #No.080829---end--- modify
               CALL t110_set_rvb87()
               #-------No:CHI-820010 add
                IF g_sma.sma116 MATCHES '[02]' THEN
                   LET g_rvb[l_ac].rvb87 = g_rvb[l_ac].rvb07
                END IF
               #-------No:CHI-820010 end
               #MOD-830171-begin-add
               LET l_pmn20 = 0
               SELECT pmn20,pmn87 INTO l_pmn20,l_pmn87 FROM pmn_file
                WHERE pmn01=g_rvb[l_ac].rvb04
                  AND pmn02=g_rvb[l_ac].rvb03
               IF l_pmn20 = g_rvb[l_ac].rvb07  THEN
                  LET g_rvb[l_ac].rvb87 = l_pmn87
               END IF
               #MOD-830171-end-add
           #END IF   #No.080829 mark

         BEFORE FIELD rvb85
            IF cl_null(g_rvb[l_ac].rvb83) THEN
               LET g_rvb[l_ac].rvb85= NULL
            END IF

         AFTER FIELD rvb85     #第二數量
            IF NOT cl_null(g_rvb[l_ac].rvb85) THEN
               IF g_rvb[l_ac].rvb85 <0 THEN
                  NEXT FIELD rvb85
               END IF
               IF cl_null(g_rvb[l_ac].rvb83) THEN
                  LET g_rvb[l_ac].rvb85= NULL
               END IF
            END IF
           #IF p_cmd = 'a' OR  p_cmd = 'u' AND #mark by MOD-660155
           #   g_rvb_t.rvb85 <> g_rvb[l_ac].rvb85 THEN #mark by MOD-660155
               IF g_ima906='3' THEN
                  LET g_tot=g_rvb[l_ac].rvb85*g_rvb[l_ac].rvb84
                  LET g_rvb[l_ac].rvb82=g_tot*g_rvb[l_ac].rvb81
               END IF
           #END IF #mark by MOD-660155
            IF cl_null(g_rvb_t.rvb85) AND g_rvb[l_ac].rvb85 IS NOT NULL OR
               NOT cl_null(g_rvb_t.rvb85) AND cl_null(g_rvb[l_ac].rvb85) THEN
              #OR g_rvb_t.rvb85 <> g_rvb[l_ac].rvb85 THEN #MOD-660155
               CALL t110_set_rvb87()
            END IF
           CALL cl_show_fld_cont()                   #No:FUN-550037 hmf

        #MOD-660155...............begin
        #BEFORE FIELD rvb82
        #   IF cl_null(g_rvb[l_ac].rvb80) THEN
        #      LET g_rvb[l_ac].rvb82= NULL
        #   END IF
        #MOD-660155...............end

         AFTER FIELD rvb82     #第一數量
            IF NOT cl_null(g_rvb[l_ac].rvb82) THEN
               IF g_rvb[l_ac].rvb82 <0 THEN
                  NEXT FIELD rvb82
               END IF
               IF cl_null(g_rvb[l_ac].rvb80) THEN
                  LET g_rvb[l_ac].rvb82= NULL
               END IF
            END IF
            IF cl_null(g_rvb[l_ac].rvb85) AND cl_null(g_rvb[l_ac].rvb82) THEN
               NEXT FIELD rvb82
            END IF
            IF g_rvb[l_ac].rvb85=0 AND g_rvb[l_ac].rvb82=0 THEN
               IF g_ima906 MATCHES '[23]' THEN
                  NEXT FIELD rvb85
               ELSE
                  NEXT FIELD rvb82
               END IF
            END IF
            CALL t110_set_origin_field()
            # ---- check 最小套數(以防未發料卻可入庫) ----#
            #BEFORE FIELD rvb07    #收貨量
            SELECT sfb05,sfb39,sfb93 INTO l_sfb05,l_sfb39,l_sfb93 FROM sfb_file    #NO:TQC-670091 add sfb93
             WHERE sfb01 = g_rvb[l_ac].rvb34
            IF l_sfb39 != '2' THEN   #工單完工方式為'2' pull 不check min_set
               IF g_argv2_2 ='SUB' AND g_rvb[l_ac].rvb05=l_sfb05 THEN   # 委外
                  LET g_min_set = 0
     #             CALL s_minp(g_rvb[l_ac].rvb34,g_sma.sma73,g_sma.sma74,'')
     #                   RETURNING g_cnt,g_min_set
      #     CALL s_minp(g_rvb[l_ac].rvb34,'N',g_sma.sma74,'')#by lily modify 20141012
         CALL s_minp(g_rvb[l_ac].rvb34,'N',g_sma.sma74,'','','',g_rva.rva06)
                       RETURNING g_cnt,g_min_set
#          CALL s_minp(g_rvb[l_ac].rvb34,g_sma.sma73,g_sma.sma74,'')
 #                       RETURNING g_cnt,g_min_set
                  SELECT ima55 INTO l_ima55
                    FROM ima_file
                   WHERE ima01 = g_rvb[l_ac].rvb05
                   SELECT ta_ima001 INTO l_ta_ima001
                   FROM ima_file
                   WHERE ima01 = g_rvb[l_ac].rvb05
                  IF cl_null(l_ta_ima001) THEN
                  LET l_ta_ima001 = 0
                  END IF
                 IF g_sma.sma899 = 'Y' THEN LET g_min_set = g_min_set * (1+l_ta_ima001/100) END IF
                  CALL s_umfchk(g_rvb[l_ac].rvb05,g_rvb[l_ac].pmn07,l_ima55)
                       RETURNING g_i,l_fac
                  IF g_i = 1 THEN
                     #採購單位無法與料件的生產單位做換算,預設轉換率為1
                     CALL cl_err(g_rvb[l_ac].rvb05,'apm-120',1)
                     LET l_fac = 1
                  END IF
                  LET g_min_set = g_min_set / l_fac

                  IF g_cnt !=0  THEN
                     CALL cl_err('s_minp()','asf-549',0)
                     NEXT FIELD rvb34
                  END IF
                  # 確認之(收貨-退貨)
                  SELECT SUM(rvb07-rvb29) INTO conf_qty FROM rvb_file,rva_file
                   WHERE rvb34 = g_rvb[l_ac].rvb34
                     AND rvb01 = rva01 AND rvaconf<>'X'    #MOD-790062 modify 排除作廢單據
                     AND rvb05 = g_rvb[l_ac].rvb05 AND rvb35='N'
                     AND NOT (rvb02=g_rvb[l_ac].rvb02 AND rvb01=g_rva.rva01)  #MOD-790062 排除本張單正在輸入的項次

                  IF conf_qty IS NULL THEN LET conf_qty=0 END IF
                  LET g_min_set=g_min_set-conf_qty
                  #ERROR "最小套數:",g_min_set        #MOD-530700
                   CALL cl_err(g_min_set,'aqc-426',0) #MOD-530700
               END IF

               ## 委外採購若有部分交貨應以QPA計算實收數量
               IF g_argv2_2 = 'SUB' AND g_pmn14 = 'Y' THEN
                  IF NOT cl_null(g_rvb[l_ac].rvb34) THEN  #委外工單
                     INITIALIZE l_sfa.* TO NULL
                     SELECT sfa_file.* INTO l_sfa.* FROM sfa_file,pmn_file
                      WHERE pmn01 = g_rvb[l_ac].rvb04
                        AND pmn02 = g_rvb[l_ac].rvb03
                        AND sfa01 = g_rvb[l_ac].rvb34
                        AND sfa03 = g_rvb[l_ac].rvb05
                        AND pmn65 = '2'  #代買
                  END IF
               END IF
            END IF
            IF NOT cl_null(g_rvb[l_ac].rvb07) THEN
               IF g_rvb[l_ac].rvb07 <=0 THEN
                  IF g_ima906 MATCHES '[23]' THEN
                     NEXT FIELD rvb85
                  ELSE
                     NEXT FIELD rvb82
                  END IF
               END IF
               LET g_rvb2.rvb08=g_rvb[l_ac].rvb07

               IF cl_null(g_pmn13) THEN   #超交率
                  LET g_pmn13 = 0
               END IF
               IF cl_null(g_pmn50_55) THEN
                  LET g_pmn50_55 = 0
               END IF
               LET g_pmn20 = g_rvb[l_ac].pmn20

               SELECT SUM(rvb07) INTO l_rvb07_3 FROM rvb_file,rva_file
                WHERE rvb04=g_rvb[l_ac].rvb04
                  AND rvb03=g_rvb[l_ac].rvb03
                  AND rvaconf='N'
                  AND rva01=rvb01
                  AND rvb35='N'
                  AND NOT (rvb01=g_rva.rva01 AND rvb02=g_rvb[l_ac].rvb02)
               IF cl_null(l_rvb07_3) THEN
                  LET l_rvb07_3 = 0
               END IF

               #計算已交量
               LET l_rvb07=g_pmn50_55-g_pmn58+l_rvb07_3+g_rvb[l_ac].rvb07
               LET l_rvb07_1=(g_pmn20*(100+g_pmn13))/100   #可交貨量
               LET l_rvb07_2=l_rvb07-l_rvb07_1

               #modi in 99/12/22 若為LC收貨，則須檢查數貨不可大於提單數量
               IF g_sma.sma41 = 'Y' AND g_rva.rva04='Y' THEN
                  SELECT alt06 INTO l_alt06 FROM alt_file
                   WHERE alt01=g_rvb[l_ac].rvb22
                     AND alt14=g_rvb[l_ac].rvb04
                     AND alt15=g_rvb[l_ac].rvb03
                  IF cl_null(l_alt06) THEN
                     LET l_alt06 = 0
                  END IF
                  SELECT SUM(rvb07) INTO t_alt06 FROM rvb_file
                   WHERE rvb22=g_rvb[l_ac].rvb22
                     AND rvb04=g_rvb[l_ac].rvb04
                     AND rvb03=g_rvb[l_ac].rvb03
                     AND rvb01!=g_rva.rva01
                     AND rvb35='N'
                  IF cl_null(t_alt06) THEN
                     LET t_alt06 = 0
                  END IF
                  IF g_rvb[l_ac].rvb07 > (l_alt06-t_alt06) THEN
                     CALL cl_err('','apm-305',0)
                     IF g_ima906 MATCHES '[23]' THEN
                        NEXT FIELD rvb85
                     ELSE
                        NEXT FIELD rvb82
                     END IF
                  END IF
               END IF

               IF g_pmn13 >= 0 THEN    #MODIFY 超短交控制 by Keith
                  IF g_pmn14 = 'N' THEN   #不能部份交貨, 超短交都控制
                     IF l_rvb07_1 > l_rvb07 THEN #短交
                        IF g_sma.sma85 MATCHES '[Rr]' THEN
                           CALL cl_err(l_rvb07_2,'mfg3038',0)
                           NEXT FIELD rvb07
                        ELSE
                           CALL cl_err(l_rvb07_2,'mfg9120',1)
                        END IF
                     END IF
                     ###### 01/10/23 Tommy 樣品不檢查
                     IF g_rvb[l_ac].rvb35 = 'N' AND g_rva.rva10 != 'SUB' THEN  #CHI-6B0019委外不檢查超交
                        IF l_rvb07_1 < l_rvb07 THEN #超交
                           IF g_sma.sma85 MATCHES '[Rr]' THEN
                              CALL cl_err(l_rvb07_2,'mfg3037',1)  #No.TQC-6C0091 0->1
                              IF g_ima906 MATCHES '[23]' THEN
                                 NEXT FIELD rvb85
                              ELSE
                                 NEXT FIELD rvb82
                              END IF
                           ELSE
                              CALL cl_err(l_rvb07_2,'mfg9121',1)
                           END IF
                        END IF
                     END IF
                     ###### End Tommy
                  END IF
                  IF g_pmn14 = "Y" THEN    #可部份交貨, 則僅控制超交
                     ###### 01/10/23 Tommy 樣品不檢查
                     IF g_rvb[l_ac].rvb35 = 'N' AND g_rva.rva10 != 'SUB' THEN  #CHI-6B0019 委外不檢查超交
                        IF l_rvb07_1 < l_rvb07 THEN #超交
                           IF g_sma.sma85 MATCHES '[Rr]' THEN
                              CALL cl_err(l_rvb07_2,'mfg3037',1)  #No.TQC-6C0091 0->1
                              IF g_ima906 MATCHES '[23]' THEN
                                 NEXT FIELD rvb85
                              ELSE
                                 NEXT FIELD rvb82
                              END IF
                           ELSE
                              CALL cl_err(l_rvb07_2,'mfg9121',1)
                           END IF
                        END IF
                     END IF
                     ###### End Tommy
                  END IF
               END IF

               IF g_pmn13 < 0 THEN    #控制超短交
                  IF g_pmn14 = 'N' THEN   #不能部份交貨
                     IF l_rvb07 - g_pmn20 < 0 THEN      #須>= 訂購量
                        CALL cl_err(l_rvb07,'mfg3335',0)
                        IF g_ima906 MATCHES '[23]' THEN
                           NEXT FIELD rvb85
                        ELSE
                           NEXT FIELD rvb82
                        END IF
                     END IF
                  END IF
               END IF

               #NO:4669-->確認之(收貨-退貨)
               IF l_sfb39 != '2' THEN   #工單完工方式為'2' pull 不check min_set
                 IF g_argv2_2 ='SUB' AND g_rvb[l_ac].rvb05=l_sfb05 THEN
                  #-----------No:TQC-670091 modify
                    IF l_sfb93 != 'Y' THEN   #CHI-840066 modify add ! 製程委外不控管最小發料套數
                       CALL t110_minp(g_rvb[l_ac].rvb03,g_rvb[l_ac].rvb04,
                                      g_rvb[l_ac].rvb34) RETURNING l_min_set

                      #--------------No:TQC-730059 add
                       CALL s_umfchk(g_rvb[l_ac].rvb05,g_rvb[l_ac].pmn07,l_ima55)
                            RETURNING g_i,l_fac
                       IF g_i = 1 THEN
                          #採購單位無法與料件的生產單位做換算,預設轉換率為1
                          CALL cl_err(g_rvb[l_ac].rvb05,'apm-120',1)
                          LET l_fac = 1
                       END IF
                       LET l_min_set = l_min_set / l_fac
                      #--------------No:TQC-730059 end

                       IF g_rvb[l_ac].rvb07 > l_min_set THEN
                          CALL cl_err(g_rvb[l_ac].rvb07,'apm-307',1)
                          IF g_ima906 MATCHES '[23]' THEN
                             NEXT FIELD rvb85
                          ELSE
                             NEXT FIELD rvb82
                          END IF
                       END IF
                    ELSE
                       IF g_rvb[l_ac].rvb07>g_min_set THEN
                          #委外實收數不可大於發料最小套數!
                          CALL cl_err(g_rvb[l_ac].rvb07,'apm-307',1)
                          IF g_ima906 MATCHES '[23]' THEN
                             NEXT FIELD rvb85
                          ELSE
                             NEXT FIELD rvb82
                          END IF
                       END IF
                    END IF
                  #-----------No:TQC-670091 modify
                 END IF
               END IF
            END IF
            IF cl_null(g_rvb_t.rvb82) AND g_rvb[l_ac].rvb82 IS NOT NULL OR
               NOT cl_null(g_rvb_t.rvb82) AND cl_null(g_rvb[l_ac].rvb82) OR
               g_rvb_t.rvb82 <> g_rvb[l_ac].rvb82 THEN
               CALL t110_du_data_to_correct()
               CALL t110_set_rvb87()
            END IF
           CALL cl_show_fld_cont()                   #No:FUN-550037 hmf

         BEFORE FIELD rvb87
            IF cl_null(g_rvb_t.rvb85) AND g_rvb[l_ac].rvb85 IS NOT NULL OR
               NOT cl_null(g_rvb_t.rvb85) AND cl_null(g_rvb[l_ac].rvb85) OR
               g_rvb_t.rvb85 <> g_rvb[l_ac].rvb85 OR
               cl_null(g_rvb_t.rvb82) AND g_rvb[l_ac].rvb82 IS NOT NULL OR
               NOT cl_null(g_rvb_t.rvb82) AND cl_null(g_rvb[l_ac].rvb82) OR
               g_rvb_t.rvb82 <> g_rvb[l_ac].rvb82 THEN
               CALL t110_du_data_to_correct()
               CALL t110_set_rvb87()
            END IF

        AFTER FIELD rvb87  #計價數量
           IF NOT cl_null(g_rvb[l_ac].rvb87) THEN
              IF g_rvb[l_ac].rvb87 < 0 THEN
                 CALL cl_err('','aim-391',0)  #
                 NEXT FIELD rvb87
              END IF
           END IF

         #No.FUN-540027  --end


#        BEFORE FIELD rvb36            #若 MISC 則不須輸入倉儲批
#           # 當為製程委外時不寫 tlf,不 update ima,img 所以可不key 倉庫
#           LET l_ec_sw = 'N'
#           IF g_argv2_2 ='SUB' THEN
#              LET l_sfb24=''
#              SELECT sfb24 INTO l_sfb24
#                FROM sfb_file
#               WHERE sfb01 = g_rvb[l_ac].rvb34
#              IF l_sfb24 IS NOT NULL AND l_sfb24='Y' THEN
#                 LET l_ec_sw='Y'
#              END IF
#           END IF
#           IF l_ec_sw='Y' THEN
#              LET g_rvb[l_ac].rvb36=' '
#              LET g_rvb[l_ac].rvb37=' '
#              LET g_rvb[l_ac].rvb38=' '
#              CALL cl_err('','mfg-021',0)
#              #------MOD-5A0095 START----------
#              DISPLAY BY NAME g_rvb[l_ac].rvb36
#              DISPLAY BY NAME g_rvb[l_ac].rvb37
#              DISPLAY BY NAME g_rvb[l_ac].rvb38
#              #------MOD-5A0095 END------------
#           END IF


#MOD-7A0203-add
         BEFORE FIELD rvb36
            CALL t110_set_entry_b(p_cmd)
            CALL t110_set_no_entry_b(p_cmd)
#MOD-7A0203-add-end

         AFTER FIELD rvb36
            CALL t110_ec_sw() RETURNING l_ec_sw    #MOD-770082 add
            IF cl_null(g_rvb[l_ac].rvb36) AND l_ec_sw='N' AND g_rvb[l_ac].rvb05[1,4] <> 'MISC' THEN      #No.TQC-740313    #CHI-7A0003 remark   #MOD-7A0132 modify MISC
#           IF cl_null(g_rvb[l_ac].rvb36) AND l_ec_sw='N' AND g_sma.sma886[7,7] = 'Y'  THEN     #CHI-7A0003 mark
               NEXT FIELD rvb36
            END IF
            IF NOT cl_null(g_rvb[l_ac].rvb36) AND l_ec_sw='N'  THEN
               #------>check-1  檢查該料是否可收至該倉
               IF NOT s_imfchk1(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36) THEN
                  CALL cl_err('s_imfchk1:','mfg9036',0)
                  NEXT FIELD rvb36
               END IF
               #------>check-2  檢查倉庫須存在否
               CALL s_stkchk(g_rvb[l_ac].rvb36,'A') RETURNING l_code
               IF NOT l_code THEN
                  CALL cl_err('s_stkchk:','mfg1100',0)
                  NEXT FIELD rvb36
               END IF
               #------>check-3  檢查是否為可用倉
               CALL s_swyn(g_rvb[l_ac].rvb36) RETURNING sn1,sn2
               IF sn1=1 AND g_rvb[l_ac].rvb36 != g_rvb_t.rvb36 THEN
                  LET g_rvb_t.rvb36=g_rvb[l_ac].rvb36
                  CALL cl_err(g_rvb[l_ac].rvb36,'mfg6080',0)
                  NEXT FIELD rvb36
               ELSE
                  IF sn2=2 AND g_rvb[l_ac].rvb36 != g_rvb_t.rvb36 THEN
                     CALL cl_err(g_rvb[l_ac].rvb36,'mfg6085',0)
                     LET g_rvb_t.rvb36=g_rvb[l_ac].rvb36
                     NEXT FIELD rvb36
                  END IF
               END IF
               LET sn1=0 LET sn2=0
            END IF

         AFTER FIELD rvb37              #儲位
            #BugNo:5626 控管是否為全型空白
            IF g_rvb[l_ac].rvb37 = '　' THEN #全型空白
                LET g_rvb[l_ac].rvb37 = ' '
            END IF
            IF g_rvb[l_ac].rvb37 IS NULL THEN
               LET g_rvb[l_ac].rvb37=' '
            END IF
            #IF NOT cl_null(g_rvb[l_ac].rvb37) AND l_ec_sw='N' THEN
            IF NOT cl_null(g_rvb[l_ac].rvb36) AND l_ec_sw='N' THEN  #NO.MOD-590530
               #------------------------------------ 檢查料號預設倉儲及單別預設倉儲
               IF NOT s_chksmz(g_rvb[l_ac].rvb05, g_rva.rva01,
                               g_rvb[l_ac].rvb36, g_rvb[l_ac].rvb37) THEN
                  NEXT FIELD rvb36
               END IF
               #------>check-1  檢查該料是否可收至該倉/儲位
               IF NOT s_imfchk(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                               g_rvb[l_ac].rvb37) THEN
                  CALL cl_err(g_rvb[l_ac].rvb37,'mfg6095',0)
                  NEXT FIELD rvb37
               END IF
               #------>check-2  檢查該倉庫/儲位是否存在
               IF g_rvb[l_ac].rvb37 IS NOT NULL THEN
                  CALL s_hqty(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                              g_rvb[l_ac].rvb37)
                       RETURNING g_cnt,g_imf04,g_imf05
                  IF g_imf04 IS NULL THEN
                     LET g_imf04 = 0
                  END IF
                  CALL s_lwyn(g_rvb[l_ac].rvb36,g_rvb[l_ac].rvb37)
                       RETURNING sn1,sn2    #可用否
                  SELECT pmn38 INTO g_pmn38 FROM pmn_file
                   WHERE pmn01=g_rvb[l_ac].rvb04
                     AND pmn02=g_rvb[l_ac].rvb03
                  IF sn2 = 2 THEN
                     IF g_pmn38 = 'Y' THEN
                        CALL cl_err('','mfg9132',0)
                     END IF
                  ELSE
                     IF g_pmn38 = 'N' THEN
                        CALL cl_err('','mfg9131',0)
                     END IF
                  END IF
                  LET sn1=0 LET sn2=0
               END IF
               IF g_rvb[l_ac].rvb37 IS NULL THEN
                  LET g_rvb[l_ac].rvb37=' '
               END IF
            END IF

         BEFORE FIELD rvb38              #批號
            IF NOT cl_null(g_rvb[l_ac].rvb38) THEN
               SELECT COUNT(*) INTO l_cnt FROM pmn_file
                WHERE pmn01=g_rvb[l_ac].rvb04
                  AND pmn02=g_rvb[l_ac].rvb03
                  AND pmn122=g_rvb[l_ac].rvb38
               IF l_cnt > 0 THEN NEXT FIELD NEXT END IF
            END IF

         AFTER FIELD rvb38              #批號
            #BugNo:5626 控管是否為全型空白
            IF g_rvb[l_ac].rvb38 = '　' THEN #全型空白
               LET g_rvb[l_ac].rvb38 = ' '
            END IF
            IF g_rvb[l_ac].rvb38 IS NULL THEN
               LET g_rvb[l_ac].rvb38=' '
            END IF

            IF NOT cl_null(g_rvb[l_ac].rvb36)  AND l_ec_sw='N' THEN
#              IF g_sma.sma886[7,7] ='Y' THEN      #No.TQC-740313     #CHI-7A0003 mark
                  SELECT img07,img10,img09 INTO g_img07,g_img10,g_img09
                    FROM img_file   #採購單位,庫存數量,庫存單位
                   WHERE img01=g_rvb[l_ac].rvb05 AND img02=g_rvb[l_ac].rvb36
                     AND img03=g_rvb[l_ac].rvb37 AND img04=g_rvb[l_ac].rvb38
                  IF STATUS=100 AND (g_rvb[l_ac].rvb36 IS NOT NULL AND g_rvb[l_ac].rvb36 <> ' ') THEN
                     IF g_sma.sma892[3,3] ='Y' THEN
                        IF NOT cl_confirm('mfg1401') THEN
                           NEXT FIELD rvb38
                        END IF
                     END IF
                     CALL s_add_img(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                                    g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
                                    g_rva.rva01,g_rvb[l_ac].rvb02,g_rva.rva06)
                     SELECT img07,img10,img09 INTO g_img07,g_img10,g_img09
                       FROM img_file
                      WHERE img01 = g_rvb[l_ac].rvb05
                        AND img02 = g_rvb[l_ac].rvb36
                        AND img03 = g_rvb[l_ac].rvb37
                        AND img04 = g_rvb[l_ac].rvb38
                  END IF
                  #No.FUN-540027  --begin
                  SELECT ima906 INTO g_ima906 FROM ima_file
                   WHERE ima01=g_rvb[l_ac].rvb05
                  IF g_ima906 = '2' THEN
                     IF NOT cl_null(g_rvb[l_ac].rvb83) THEN
                        CALL s_chk_imgg(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                                        g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
                                        g_rvb[l_ac].rvb83) RETURNING g_flag
                        IF g_flag = 1 THEN
                           IF g_sma.sma892[3,3] ='Y' THEN
                              IF NOT cl_confirm('aim-995') THEN
                                 NEXT FIELD rvb36
                              END IF
                           END IF
                           CALL s_add_imgg(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                                           g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
                                           g_rvb[l_ac].rvb83,g_rvb[l_ac].rvb84,
                                           g_rva.rva01,
                                           g_rvb[l_ac].rvb02,0) RETURNING g_flag
                           IF g_flag = 1 THEN
                              NEXT FIELD rvb36
                           END IF
                        END IF
                     END IF
                     IF NOT cl_null(g_rvb[l_ac].rvb80) THEN
                        CALL s_chk_imgg(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                                        g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
                                        g_rvb[l_ac].rvb80) RETURNING g_flag
                        IF g_flag = 1 THEN
                           IF g_sma.sma892[3,3] ='Y' THEN
                              IF NOT cl_confirm('aim-995') THEN
                                 NEXT FIELD rvb36
                              END IF
                           END IF
                           CALL s_add_imgg(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                                           g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
                                           g_rvb[l_ac].rvb80,g_rvb[l_ac].rvb81,
                                           g_rva.rva01,
                                           g_rvb[l_ac].rvb02,0) RETURNING g_flag
                           IF g_flag = 1 THEN
                              NEXT FIELD rvb36
                           END IF
                        END IF
                     END IF
                  END IF
                  IF g_ima906 = '3' THEN
                     IF NOT cl_null(g_rvb[l_ac].rvb83) THEN
                        CALL s_chk_imgg(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                                        g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
                                        g_rvb[l_ac].rvb83) RETURNING g_flag
                        IF g_flag = 1 THEN
                           IF g_sma.sma892[3,3] ='Y' THEN
                              IF NOT cl_confirm('aim-995') THEN
                                 NEXT FIELD rvb36
                              END IF
                           END IF
                           CALL s_add_imgg(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                                           g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
                                           g_rvb[l_ac].rvb83,g_rvb[l_ac].rvb84,
                                           g_rva.rva01,
                                           g_rvb[l_ac].rvb02,0) RETURNING g_flag
                           IF g_flag = 1 THEN
                              NEXT FIELD rvb36
                           END IF
                        END IF
                     END IF
                  END IF
               #No.FUN-540027  --end
#              END IF      #No.TQC-740313   #CHI-7A0003 mark
            END IF

         AFTER FIELD rvb25
            IF NOT cl_null(g_rvb[l_ac].rvb25) THEN
                #No:MOD-4B0275
               SELECT coc10 INTO l_coc10 FROM coc_file
                WHERE coc03 = g_rvb[l_ac].rvb25
               IF STATUS THEN
#                 CALL cl_err(g_rvb[l_ac].rvb25,'aco-062',0) #No.FUN-660129
                  CALL cl_err3("sel","coc_file",g_rvb[l_ac].rvb25,"","aco-062","","",1) #No.FUN-660129
                  NEXT FIELD rvb25
               END IF
               SELECT COUNT(*) INTO l_cnt FROM coc_file,coe_file,coa_file
                WHERE coc01 = coe01
                  AND coe03 = coa03
                  AND coa05 = l_coc10
                  AND coa01 = g_rvb[l_ac].rvb05
                  AND coc03 = g_rvb[l_ac].rvb25
                #No:MOD-4B0275 end
               IF l_cnt = 0 THEN
                  CALL cl_err(g_rvb[l_ac].rvb25,'aco-073',0)
                  NEXT FIELD rvb25
               END IF
            END IF

         #No:FUN-550117
         AFTER FIELD rvb10   #採購單價
            IF NOT cl_null(g_rvb[l_ac].rvb10) THEN
               #IF g_rvb[l_ac].rvb10 <= 0 THEN  #NO.TQC-660145 MARK
               IF g_rvb[l_ac].rvb10 < 0 THEN
                  LET g_rvb[l_ac].rvb10 = g_rvb_t.rvb10
                  NEXT FIELD rvb10
               END IF
               LET g_rvb[l_ac].rvb10 = cl_digcut(g_rvb[l_ac].rvb10,t_azi03)  #No.CHI-6A0004
               LET g_rvb[l_ac].rvb10t =
                   g_rvb[l_ac].rvb10 * ( 1 + g_rvb[l_ac].pmm43 /100)
               LET g_rvb[l_ac].rvb10t = cl_digcut(g_rvb[l_ac].rvb10t,t_azi03)  #No.CHI-6A0004
               DISPLAY g_rvb[l_ac].rvb10  TO rvb10  # FUN-610018
               DISPLAY g_rvb[l_ac].rvb10t TO rvb10t # FUN-610018
            END IF

         AFTER FIELD rvb10t   #含稅單價
            IF NOT cl_null(g_rvb[l_ac].rvb10t) THEN
               LET g_rvb[l_ac].rvb10t = cl_digcut(g_rvb[l_ac].rvb10t,t_azi03)  #No.CHI-6A0004
               LET g_rvb[l_ac].rvb10 =
                   g_rvb[l_ac].rvb10t / ( 1 + g_rvb[l_ac].pmm43 / 100)
               LET g_rvb[l_ac].rvb10 = cl_digcut(g_rvb[l_ac].rvb10,t_azi03)  #No.CHI-6A0004
               DISPLAY g_rvb[l_ac].rvb10  TO rvb10  # FUN-610018
               DISPLAY g_rvb[l_ac].rvb10t TO rvb10t # FUN-610018
            END IF
         #end No:FUN-550117

        #FUN-670051...............begin
        AFTER FIELD rvb930
            IF NOT cl_null(g_rvb[l_ac].rvb930) THEN
                LET l_cnt=0
                SELECT COUNT(*) INTO l_cnt FROM gem_file
                                          WHERE gem01=g_rvb[l_ac].rvb930
                                            AND gem09 IN ('1','2')
                                            AND gemacti='Y'
                IF l_cnt=0 THEN
                   CALL cl_err3("sel","gem_file",g_rvb[l_ac].rvb930,"",100,"","",1)
                   LET g_rvb[l_ac].rvb930=g_rvb_t.rvb930
                   LET g_rvb[l_ac].gem02a=g_rvb_t.gem02a
                   DISPLAY BY NAME g_rvb[l_ac].rvb930,g_rvb[l_ac].gem02a
                   NEXT FIELD rvb930
                END IF
                CALL t110_set_rvb930(g_rvb[l_ac].rvb930) RETURNING g_rvb[l_ac].gem02a
                DISPLAY BY NAME g_rvb[l_ac].gem02a
            ELSE
                LET g_rvb[l_ac].gem02a=NULL
                DISPLAY BY NAME g_rvb[l_ac].gem02a
            END IF
            LET g_rvb2.rvb930  = g_rvb[l_ac].rvb930

        #FUN-670051...............end

         BEFORE DELETE                            #是否取消單身
            IF g_rvb_t.rvb02 > 0 AND g_rvb_t.rvb02 IS NOT NULL THEN
               IF NOT cl_delb(0,0) THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  CALL cl_err("", -263, 1)
                  CANCEL DELETE
               END IF
               DELETE FROM rvb_file
                WHERE rvb01 = g_rva.rva01 AND rvb02 = g_rvb_t.rvb02
               IF SQLCA.sqlcode THEN
#                 CALL cl_err('del rvb:',SQLCA.sqlcode,0) #No.FUN-660129
                  CALL cl_err3("del","rvb_file",g_rva.rva01,g_rvb_t.rvb02,SQLCA.sqlcode,"","del rvb",1) #No.FUN-660129
                  ROLLBACK WORK
                  CANCEL DELETE
               END IF
               LET g_rec_b=g_rec_b-1
               DISPLAY g_rec_b TO FORMONLY.cn2
               SELECT COUNT(*) INTO g_cnt
                 FROM rvb_file
                WHERE rvb22 = g_rvb[l_ac].rvb22
                  AND (rvb01 <> g_rva.rva01 OR rvb02 <> g_rvb[l_ac].rvb02)
               IF g_cnt = 0 THEN
                  DELETE FROM rvw_file
                   WHERE rvw01 = g_rvb[l_ac].rvb22
                  IF SQLCA.sqlcode THEN
#                    CALL cl_err('del rvw_file err!',SQLCA.sqlcode,0) #No.FUN-660129
                     CALL cl_err3("del","rvw_file",g_rvb[l_ac].rvb22,"",SQLCA.sqlcode,"","del rvw_file err!",1) #No.FUN-660129
                     ROLLBACK WORK
                     CANCEL DELETE
                  END IF
               END IF
               IF g_success='Y' THEN
                  COMMIT WORK
               ELSE
                  ROLLBACK WORK
               END IF
            END IF

         ON ROW CHANGE
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               LET g_rvb[l_ac].* = g_rvb_t.*
               CLOSE t110_bcl
               ROLLBACK WORK
               EXIT INPUT
            END IF
            IF l_lock_sw = 'Y' THEN
               CALL cl_err(g_rvb[l_ac].rvb02,-263,1)
               LET g_rvb[l_ac].* = g_rvb_t.*
            ELSE
               #No.FUN-540027  --begin
               IF g_sma.sma115 = 'Y' THEN
                  CALL s_chk_va_setting(g_rvb[l_ac].rvb05)
                       RETURNING g_flag,g_ima906,g_ima907
                  IF g_flag=1 THEN
                     NEXT FIELD rvb05
                  END IF

                  CALL s_chk_va_setting1(g_rvb[l_ac].rvb05)
                       RETURNING g_flag,g_ima908
                  IF g_flag=1 THEN
                     NEXT FIELD rvb05
                  END IF
                  CALL t110_du_data_to_correct()

                  CALL t110_set_origin_field()
               END IF

               IF cl_null(g_rvb[l_ac].rvb86) THEN
                  LET g_rvb[l_ac].rvb86 = g_rvb[l_ac].pmn07
                  LET g_rvb[l_ac].rvb87 = g_rvb[l_ac].rvb07
               END IF
               #No.FUN-540027  --end

               # 當為製程委外時不寫 tlf,不 update ima,img 所以可不key 倉庫
               LET l_ec_sw = 'N'
               IF g_argv2_2 ='SUB' THEN
                  LET l_sfb24=''
                  SELECT sfb24 INTO l_sfb24
                   FROM sfb_file
                   WHERE sfb01 = g_rvb[l_ac].rvb34
                  IF l_sfb24 IS NOT NULL AND l_sfb24='Y' THEN
                     LET l_ec_sw='Y'
                  END IF
                  IF l_ec_sw='Y' THEN
                     LET g_rvb[l_ac].rvb36=' '
                     LET g_rvb[l_ac].rvb37=' '
                     LET g_rvb[l_ac].rvb38=' '
                  END IF
               END IF
               #modi in 00/01/18 若為LC收貨，則須檢查數貨不可大於提單數量
               IF g_sma.sma41 = 'Y' AND g_rva.rva04='Y' THEN
                  SELECT als05,als21 INTO l_als05,l_als21 FROM als_file
                   WHERE als01=g_rvb[l_ac].rvb22
                  IF SQLCA.sqlcode=100 THEN
#                    CALL cl_err(g_rvb[l_ac].rvb22,'aap-762',0) #No.FUN-660129
                     CALL cl_err3("sel","als_file",g_rvb[l_ac].rvb22,"","aap-762","","",1) #No.FUN-660129
                     NEXT FIELD rvb22
                  END IF
                  IF l_als05 <> g_rva.rva05 THEN
                     CALL cl_err('','apm-303',0)
                     NEXT FIELD rvb22
                  END IF
                  IF NOT cl_null(l_als21) THEN
                     LET g_rva.rva08 = l_als21
                     DISPLAY BY NAME g_rva.rva08
                  END IF
                  SELECT alt06 INTO l_alt06 FROM alt_file
                   WHERE alt01=g_rvb[l_ac].rvb22
                     AND alt14=g_rvb[l_ac].rvb04
                     AND alt15=g_rvb[l_ac].rvb03
                  IF cl_null(l_alt06) THEN
                     LET l_alt06 = 0
                  END IF
                  SELECT SUM(rvb07) INTO t_alt06 FROM rvb_file
                   WHERE rvb22=g_rvb[l_ac].rvb22
                     AND rvb04=g_rvb[l_ac].rvb04
                     AND rvb03=g_rvb[l_ac].rvb03
                     AND rvb01!=g_rva.rva01 AND rvb35='N'
                  IF cl_null(t_alt06) THEN
                     LET t_alt06 = 0
                  END IF
                  IF g_rvb[l_ac].rvb07 > (l_alt06-t_alt06) THEN
                     CALL cl_err('','apm-305',0)
                     #No.FUN-540027  --begin
                     IF g_sma.sma115 = 'Y' THEN
                        IF g_ima906 MATCHES '[23]' THEN
                           NEXT FIELD rvb85
                        ELSE
                           NEXT FIELD rvb82
                        END IF
                     ELSE
                        NEXT FIELD rvb07
                     END IF
                     #No.FUN-540027  --end
                  END IF
               END IF
               #---再判斷一次倉儲批是否存在
#              IF g_sma.sma886[7,7] ='Y' THEN      #No.TQC-740313   #CHI-7A0003 mark
                  IF NOT cl_null(g_rvb[l_ac].rvb36) THEN
                     IF g_rvb[l_ac].rvb37 IS NULL THEN
                        LET g_rvb[l_ac].rvb37=' '
                     END IF
                     IF g_rvb[l_ac].rvb38 IS NULL THEN
                        LET g_rvb[l_ac].rvb38=' '
                     END IF
                     SELECT img07,img10,img09 INTO g_img07,g_img10,g_img09
                       FROM img_file   #採購單位,庫存數量,庫存單位
                      WHERE img01=g_rvb[l_ac].rvb05 AND img02=g_rvb[l_ac].rvb36
                        AND img03=g_rvb[l_ac].rvb37 AND img04=g_rvb[l_ac].rvb38
                     IF STATUS=100 AND (g_rvb[l_ac].rvb36 IS NOT NULL AND g_rvb[l_ac].rvb36 <> ' ') THEN
                        IF g_sma.sma892[3,3] ='Y' THEN
                           IF NOT cl_confirm('mfg1401') THEN
                              NEXT FIELD rvb38
                           END IF
                        END IF
                        CALL s_add_img(g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,
                                       g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,
                                       g_rva.rva01,g_rvb[l_ac].rvb02,g_rva.rva06)
                     END IF
                     SELECT img07,img10,img09 INTO g_img07,g_img10,g_img09
                       FROM img_file
                      WHERE img01=g_rvb[l_ac].rvb05 AND img02=g_rvb[l_ac].rvb36
                        AND img03=g_rvb[l_ac].rvb37 AND img04=g_rvb[l_ac].rvb38
                  END IF
#              END IF      #No.TQC-740313    #CHI-7A0003 mark
               CALL t110_b_move_back() #FUN-730068
               #CHI-7B0023..............begin #本段移到move_back中
               #LET g_rvb2.rvb01 = g_rva.rva01
               #LET g_rvb2.rvb02 = g_rvb[l_ac].rvb02
               #LET g_rvb2.rvb03 = g_rvb[l_ac].rvb03
               #LET g_rvb2.rvb04 = g_rvb[l_ac].rvb04
               #LET g_rvb2.rvb05 = g_rvb[l_ac].rvb05
               #LET g_rvb2.rvb07 = g_rvb[l_ac].rvb07
               #LET g_rvb2.rvb06 = 0
               #CHI-7B0023..............end
                #No.MOD-490173
              #IF cl_chk_act_auth() THEN
                  IF cl_null(g_rvb[l_ac].rvb10) THEN
                     LET g_rvb[l_ac].rvb10 = 0
                  END IF
                  LET g_rvb2.rvb10 = g_rvb[l_ac].rvb10
              #ELSE
              #   IF cl_null(g_pmn31) THEN LET g_pmn31 = 0 END IF
              #   LET g_rvb2.rvb10 = g_pmn31
              #END IF
              #No:FUN-550117
              IF cl_null(g_rvb[l_ac].rvb10t) THEN LET g_rvb[l_ac].rvb10t = 0 END IF
              LET g_rvb2.rvb10t = g_rvb[l_ac].rvb10t
              #end No:FUN-550117
               LET g_rvb2.rvb22 = g_rvb[l_ac].rvb22
               LET g_rvb2.rvb26 = NULL
               LET g_rvb2.rvb31 = g_rvb2.rvb07        #可入庫量
               LET g_rvb2.rvb34 = g_rvb[l_ac].rvb34
               LET g_rvb2.rvb35 = g_rvb[l_ac].rvb35
               LET g_rvb2.rvb36 = g_rvb[l_ac].rvb36
               LET g_rvb2.rvb37 = g_rvb[l_ac].rvb37
               LET g_rvb2.rvb38 = g_rvb[l_ac].rvb38
               IF cl_null(g_rvb2.rvb08) THEN
                  LET g_rvb2.rvb08 = g_rvb2.rvb07
               END IF
               LET g_rvb2.rvb11 = 0
               LET g_rvb2.rvb25 = g_rvb[l_ac].rvb25
               SELECT ima491 INTO l_ima491 FROM ima_file
                WHERE ima01 = g_rvb2.rvb05
               IF cl_null(l_ima491) THEN
                  LET l_ima491 = 0
               END IF
               IF l_ima491 > 0 THEN
                  CALL s_getdate(g_rva.rva06,l_ima491) RETURNING g_rvb2.rvb12
               ELSE
                  IF cl_null(g_rvb2.rvb12) THEN
                     LET g_rvb2.rvb12 = g_rva.rva06
                  END IF
               END IF
                #FUN-850022 --begin
                # CALL t110_get_rvb39(g_rvb2.rvb04,g_rvb2.rvb05,g_rvb2.rvb19,g_rva.rva05,g_sma.sma886)  #by lily modify 20141012
                 CALL t110_get_rvb39(g_rvb2.rvb03,g_rvb2.rvb04,g_rvb2.rvb05,g_rvb2.rvb19,g_rva.rva05,g_sma.sma886)
                      RETURNING g_rvb2.rvb39 #MOD-530415
                #FUN-850022 --end
               #No.FUN-540027  --begin
                # cjy by 09/05/18 收货单别为PPB,PPF,KPB,KPF则檢查項目設置為免檢，使倉庫可直接生成入庫單
              IF g_rva.rva10='SUB' AND (g_rva.rva01 MATCHES 'PPB*' OR g_rva.rva01 MATCHES 'PPF*' OR g_rva.rva01 MATCHES 'KPF*' OR g_rva.rva01 MATCHES 'KPB*' OR g_rva.rva01 MATCHES '271*') THEN
                 LET g_rvb2.rvb39='N'
               END IF
               #end  cjy  by 09/05/18
               LET g_rvb2.rvb80 = g_rvb[l_ac].rvb80
               LET g_rvb2.rvb81 = g_rvb[l_ac].rvb81
               LET g_rvb2.rvb82 = g_rvb[l_ac].rvb82
               LET g_rvb2.rvb83 = g_rvb[l_ac].rvb83
               LET g_rvb2.rvb84 = g_rvb[l_ac].rvb84
               LET g_rvb2.rvb85 = g_rvb[l_ac].rvb85
               LET g_rvb2.rvb86 = g_rvb[l_ac].rvb86
               LET g_rvb2.rvb87 = g_rvb[l_ac].rvb87
               LET g_rvb2.rvb88 = g_rvb2.rvb87*g_rvb2.rvb10
               LET g_rvb2.rvb88t= g_rvb2.rvb87*g_rvb2.rvb10t
               #CHI-830033-begin-add
               #不使用單價*數量=金額, 改以金額回推稅率, 以避免小數位差的問題
               SELECT gec07 INTO g_gec07 FROM gec_file,pmm_file
                WHERE gec01 = pmm21
                  AND pmm01 = g_rvb2.rvb04
               IF SQLCA.SQLCODE = 100 THEN
                  CALL cl_err('','mfg3192',0)
                  NEXT FIELD rvb04
               END IF
               SELECT azi04 INTO t_azi04
                 FROM pmm_file,azi_file
                WHERE pmm22=azi01
                  AND pmm01=g_rvb2.rvb04
               IF g_gec07='Y' THEN
                  LET g_rvb2.rvb88 = g_rvb2.rvb88t / ( 1 + g_rvb[l_ac].pmm43/100)
                  LET g_rvb2.rvb88 = cl_digcut(g_rvb2.rvb88 , t_azi04)
               ELSE
                  LET g_rvb2.rvb88t = g_rvb2.rvb88 * ( 1 + g_rvb[l_ac].pmm43/100)
                  LET g_rvb2.rvb88t = cl_digcut( g_rvb2.rvb88t , t_azi04)
               END IF
               #CHI-830033-end-add
               LET g_rvb2.rvb930= g_rvb[l_ac].rvb930 #FUN-670051
               #No.FUN-540027  --end
              #FUN-730068.............begin
              #UPDATE rvb_file SET rvb02=g_rvb2.rvb02,
              #                    rvb03=g_rvb2.rvb03,
              #                    rvb04=g_rvb2.rvb04,
              #                    rvb05=g_rvb2.rvb05,
              #                    rvb06=g_rvb2.rvb06,
              #                    rvb07=g_rvb2.rvb07,
              #                    #No.FUN-540027  --begin
              #                    rvb80=g_rvb2.rvb80,
              #                    rvb81=g_rvb2.rvb81,
              #                    rvb82=g_rvb2.rvb82,
              #                    rvb83=g_rvb2.rvb83,
              #                    rvb84=g_rvb2.rvb84,
              #                    rvb85=g_rvb2.rvb85,
              #                    rvb86=g_rvb2.rvb86,
              #                    rvb87=g_rvb2.rvb87,
              #                    rvb88=g_rvb2.rvb88,
              #                    rvb88t=g_rvb2.rvb88t,
              #                    #No.FUN-540027  --end
              #                    rvb10=g_rvb2.rvb10,
              #                    rvb10t=g_rvb2.rvb10t,  #No:FUN-550117
              #                    rvb12=g_rvb2.rvb12,
              #                    rvb22=g_rvb2.rvb22,
              #                    rvb31=g_rvb2.rvb31,
              #                    rvb08=g_rvb2.rvb08,
              #                    rvb11=g_rvb2.rvb11,
              #                    rvb19=g_rvb2.rvb19,
              #                    rvb13=g_rvb2.rvb13,
              #                    rvb17=g_rvb2.rvb17,
              #                    rvb14=g_rvb2.rvb14,
              #                    rvb15=g_rvb2.rvb15,
              #                    rvb16=g_rvb2.rvb16,
              #                    rvb25=g_rvb2.rvb25,
              #                    rvb34=g_rvb2.rvb34,
              #                    rvb35=g_rvb2.rvb35,
              #                    rvb36=g_rvb2.rvb36,
              #                    rvb37=g_rvb2.rvb37,
              #                    rvb38=g_rvb2.rvb38,
              #                    rvb39=g_rvb2.rvb39, #MOD-530415
              #                    rvb930=g_rvb2.rvb930 #FUN-670051
                 # cjy by 08/12/01 收货单别为PPB,PPF,KPB,KPF则收货单价,金额为0
              IF g_rva.rva10='SUB' AND (g_rva.rva01 MATCHES 'PPB*' OR g_rva.rva01 MATCHES 'PPF*' OR g_rva.rva01 MATCHES 'KPF*' OR g_rva.rva01 MATCHES 'KPB*' OR g_rva.rva01 MATCHES '271*') THEN
                 LET g_rvb2.rvb88=0
                 LET g_rvb2.rvb88t=0
                 LET g_rvb2.rvb10t=0
                 LET g_rvb2.rvb10=0
           END IF
               #end  cjy  by 08/12/01
              IF g_rvb2.rvb04[1,3]='WWC'  THEN #add by endy 151026 WWC单头为0单价
                  LET g_rvb2.rvb88=0
                  LET g_rvb2.rvb88t=0
                  LET g_rvb2.rvb10t=0
                  LET g_rvb2.rvb10=0
              END IF
              UPDATE rvb_file SET * = g_rvb2.*
              #FUN-730068.............end
                WHERE rvb01=g_rva.rva01
                  AND rvb02=g_rvb_t.rvb02
               IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0  THEN
#                 CALL cl_err('upd rvb_file',SQLCA.sqlcode,0) #No.FUN-660129
                  CALL cl_err3("upd","rvb_file",g_rva.rva01,g_rvb_t.rvb02,SQLCA.sqlcode,"","upd rvb_file",1) #No.FUN-660129
                  LET g_rvb[l_ac].* = g_rvb_t.*
               ELSE
                  MESSAGE 'UPDATE O.K'
                  IF g_success='Y' THEN
                     COMMIT WORK
                  ELSE
                     ROLLBACK WORK
                  END IF
               END IF
            END IF

         AFTER ROW
            LET l_ac = ARR_CURR()
            LET l_ac_t = l_ac
#CHI-7A0003 mark
#          #MOD-770082-begin-add
#           LET l_ec_sw = 'N'
#           CALL t110_ec_sw() RETURNING l_ec_sw    #MOD-770082 add
#           IF l_ec_sw = 'N' AND g_sma.sma886[7,7]='Y'  THEN
#              IF cl_null(g_rvb[l_ac].rvb36) AND  cl_null(g_rvb[l_ac].rvb34) THEN
#                 CALL cl_err('','aap-099',0)
#                 NEXT FIELD rvb36
#              END IF
#           END IF
#          #MOD-770082-end-add
#CHI-7A0003 mark-end
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               IF p_cmd = 'u' THEN
                  LET g_rvb[l_ac].* = g_rvb_t.*
               END IF
               CLOSE t110_bcl
               ROLLBACK WORK
               EXIT INPUT
            END IF
            CLOSE t110_bcl
            COMMIT WORK

         ON ACTION qry_warehouse        #MOD-490328
                   #MOD-480604查詢倉庫
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     = "q_imd"
                  LET g_qryparam.default1 = g_rvb[l_ac].rvb36
                 #LET g_qryparam.arg1     = "A" #BUB-4A0213
                   LET g_qryparam.arg1     = 'SW'        #倉庫類別 #MOD-4A0213
                  CALL cl_create_qry() RETURNING g_rvb[l_ac].rvb36
#                 CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].rvb36 )
                  DISPLAY BY NAME g_rvb[l_ac].rvb36
                  NEXT FIELD rvb36

        ON ACTION qry_loc_warehouse        # 遇不可空白欄位可 cursor up
           CALL cl_init_qry_var()
           LET g_qryparam.form ="q_ime"
           LET g_qryparam.default1 = g_rvb[l_ac].rvb37
            LET g_qryparam.arg1     = g_rvb[l_ac].rvb36 #倉庫編號 #MOD-4A0063
            LET g_qryparam.arg2     = 'SW'              #倉庫類別 #MOD-4A0063
           CALL cl_create_qry() RETURNING g_rvb[l_ac].rvb37
#           CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].rvb37 )
           NEXT FIELD rvb37

       ON ACTION controlp
          CASE
             #TQC-650108
             #這里只需要處理g_sma.sma908='Y'的情況,因為不允許單身新增子料件則在前面
             #BEFORE FIELD att00來做開窗了
             #需注意的是其條件限制是要開多屬性母料件且母料件的屬性組等于當前屬性組
             WHEN INFIELD(att00)
                #可以新增子料件,開窗是單純的選取母料件
                CALL cl_init_qry_var()
                LET g_qryparam.form ="q_ima_p"
#               LET g_qryparam.default1 = g_rvb[l_ac].att00
                LET g_qryparam.arg1 = lg_group
                CALL cl_create_qry() RETURNING g_rvb[l_ac].att00
#               CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].att00 )
                DISPLAY BY NAME g_rvb[l_ac].att00        #No:MOD-490371
                NEXT FIELD att00
             #TQC-650108 --end

             WHEN INFIELD(rvb04) #查詢採購單號
              #  CALL q_pmm5(FALSE,TRUE,'',g_rva.rva05,'2',g_argv2_2)  #by lily modify 20141012
                 CALL q_pmm5(FALSE,TRUE,'',g_rva.rva05,'2',g_argv2_2,g_rva.rva02)
                             RETURNING g_rvb[l_ac].rvb04
#                CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].rvb04 )
                  DISPLAY BY NAME g_rvb[l_ac].rvb04              #No:MOD-490371
                NEXT FIELD rvb04
             WHEN INFIELD(rvb03) #P/O項次
                 CALL cl_init_qry_var()
                 LET g_qryparam.form ="q_pmn1"
                 LET g_qryparam.default1 = g_rvb[l_ac].rvb03
                #LET g_qryparam.where = "pmn01 ='",g_rvb[l_ac].rvb04,"' "
                 LET g_qryparam.arg1 = g_rvb[l_ac].rvb04
                 LET g_qryparam.construct='N'
                 CALL cl_create_qry() RETURNING g_rvb[l_ac].rvb03
#                 CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].rvb03 )
                  DISPLAY BY NAME g_rvb[l_ac].rvb03              #No:MOD-490371
                NEXT FIELD rvb03
             WHEN INFIELD(rvb36) OR INFIELD(rvb37) OR INFIELD(rvb38)
                 CALL cl_init_qry_var()
               ##CALL q_img4(FALSE,FALSE,g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36, ##NO:FUN-660085
                 CALL q_img4(FALSE,TRUE,g_rvb[l_ac].rvb05,g_rvb[l_ac].rvb36,  ##NO:FUN-660085
                                  g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38,'A')
                 RETURNING g_rvb[l_ac].rvb36,g_rvb[l_ac].rvb37,g_rvb[l_ac].rvb38
                  #No.MOD-490028
                 DISPLAY g_rvb[l_ac].rvb36 TO rvb36
                 DISPLAY g_rvb[l_ac].rvb37 TO rvb37
                 DISPLAY g_rvb[l_ac].rvb38 TO rvb38
                  #No.MOD-490028(end)
                 IF INFIELD(rvb36) THEN NEXT FIELD rvb36 END IF
                 IF INFIELD(rvb37) THEN NEXT FIELD rvb37 END IF
                 IF INFIELD(rvb38) THEN NEXT FIELD rvb38 END IF
              #No:MOD-4B0275
             WHEN INFIELD(rvb25)
                 SELECT pmm04 INTO l_pmm04 FROM pmm_file
                  WHERE pmm01 = g_rvb[l_ac].rvb04
                 CALL q_coc2(FALSE,FALSE,g_rvb[l_ac].rvb25,'',l_pmm04,'1',
                             '',g_rvb[l_ac].rvb05)
                 RETURNING g_rvb[l_ac].rvb25,l_coc04
#                 CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].rvb25 )
                  DISPLAY BY NAME g_rvb[l_ac].rvb25              #No:MOD-490371
                 NEXT FIELD rvb25
              #No:MOD-4B0275 end
             #FUN-670051...............begin
             WHEN INFIELD(rvb930)
                CALL cl_init_qry_var()
                LET g_qryparam.form ="q_gem4"
                CALL cl_create_qry() RETURNING g_rvb[l_ac].rvb930
                DISPLAY BY NAME g_rvb[l_ac].rvb930
                NEXT FIELD rvb930
             #FUN-670051...............end
             OTHERWISE EXIT CASE

          END CASE

        ON ACTION invoice_data
           #大陸版, 發票統一在入庫單發票維護作業輸入
           IF g_aza.aza26 != '2' THEN
              CALL sapmt114(g_rvb[l_ac].rvb22,g_rva.rva01)
                            RETURNING g_rvb[l_ac].rvb22
               DISPLAY g_rvb[l_ac].rvb22 TO rvb22 #No.MOD-480094
              IF INT_FLAG THEN LET INT_FLAG=0 END IF
             #--------------------No:MOD-720103 modify
             #判斷單身是否有發票號碼為空白的，
             #若有則詢問是否一起UPDATE成相同的發票號碼
              LET l_cnt = 0
              SELECT COUNT(*) INTO l_cnt FROM rvb_file
                              WHERE rvb01 = g_rva.rva01
                                AND rvb02 != g_rvb[l_ac].rvb02
                                AND (rvb22 = ' ' OR rvb22 IS NULL)

             #發現單身發票欄位有空白的資料，詢問是否一起UPDATE
              IF l_cnt > 0 THEN
                 IF cl_confirm('aap-267') THEN
                    UPDATE rvb_file
                       SET rvb22=g_rvb[l_ac].rvb22
                     WHERE rvb01=g_rva.rva01
                       AND (rvb22 = ' ' OR rvb22 IS NULL)

                    IF SQLCA.sqlcode THEN
                        CALL cl_err('',SQLCA.sqlcode,0)
                    ELSE
                        FOR l_i = 1 TO g_rec_b
                            IF cl_null(g_rvb[l_i].rvb22) THEN
                               LET g_rvb[l_i].rvb22 = g_rvb[l_ac].rvb22
                            END IF
                        END FOR
                    END IF
                 END IF
              END IF

             #UPDATE滑鼠所指向單身項次所對應的發票號碼
              UPDATE rvb_file
                 SET rvb22=g_rvb[l_ac].rvb22
               WHERE rvb01=g_rva.rva01
                 AND rvb02 = g_rvb[l_ac].rvb02

              DISPLAY BY NAME g_rvb[l_ac].rvb22 #No.MOD-480094
             #--------------------No:MOD-720103 end
           END IF

        ON ACTION maintain_other_data
           CALL t110_b_more()

        ON ACTION maintain_warehouse
           LET l_cmd = 'aimi200 ' CLIPPED
           CALL cl_cmdrun(l_cmd)

        ON ACTION maintain_loc_warehouse
           LET l_cmd = "aimi201 '",g_rvb[l_ac].rvb36,"'" #BugNo:6598
           CALL cl_cmdrun(l_cmd)

       ON ACTION default_loc_w_h
          CALL cl_init_qry_var()
          LET g_qryparam.form ="q_imf"
          LET g_qryparam.construct="N"
          LET g_qryparam.default1 = g_rvb[l_ac].rvb36
          CALL cl_create_qry() RETURNING g_rvb[l_ac].rvb36,g_rvb[l_ac].rvb37
#          CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].rvb36 )
#          CALL FGL_DIALOG_SETBUFFER( g_rvb[l_ac].rvb37 )
          NEXT FIELD rvb36

       ON ACTION CONTROLZ
          CALL cl_show_req_fields()

       ON ACTION CONTROLG
          CALL cl_cmdask()

       ON ACTION CONTROLF
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE INPUT

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121

      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121

      ON ACTION controls                           #No.FUN-6B0032
         CALL cl_set_head_visible("","AUTO")       #No.FUN-6B0032


   END INPUT
   UPDATE rva_file SET rvamodu=g_user,rvadate=g_today
    WHERE rva01=g_rva.rva01
   SELECT COUNT(*) INTO g_cnt FROM rvb_file WHERE rvb01=g_rva.rva01
   IF g_cnt > g_sma.sma110 THEN
      CALL cl_err('','axm-156',0)
   END IF
   COMMIT WORK  #NO.9728

   #No:FUN-550117
#No.FUN-610018
#  LET g_gec07 = 'N'
#  FOR l_i = 1 TO g_rec_b
#      IF g_rvb[l_i].gec07 = 'Y' THEN LET g_gec07 = 'Y' END IF
#  END FOR
#  IF g_gec07 = 'Y' THEN            #No:FUN-560102
#     CALL cl_set_comp_visible("rvb10t,pmm21,pmm43,gec07",TRUE)
#  ELSE
#     CALL cl_set_comp_visible("rvb10t,pmm21,pmm43,gec07",FALSE)
#  END IF
   #end No:FUN-550117
END FUNCTION

FUNCTION t110_g_b()        #自動由採購單產生收料單
   DEFINE l_pmh08  LIKE pmh_file.pmh08
   DEFINE l_pmm22  LIKE pmm_file.pmm22
   DEFINE l_rvb07s LIKE rvb_file.rvb07
   DEFINE l_ima491 LIKE ima_file.ima491
   DEFINE l_sfb05  LIKE sfb_file.sfb05
   DEFINE l_sfb39  LIKE sfb_file.sfb39
   DEFINE l_pmn122 LIKE pmn_file.pmn122
   DEFINE l_ima906 LIKE ima_file.ima906   #No.FUN-540027
   DEFINE l_pmn88  LIKE pmn_file.pmn88    #No.FUN-540027
   DEFINE l_pmn88t LIKE pmn_file.pmn88t   #No.FUN-540027
   DEFINE l_rvb82  LIKE rvb_file.rvb82    #No.MOD-6B0162
   DEFINE l_rvb85  LIKE rvb_file.rvb85    #No.MOD-6B0162
   DEFINE i        LIKE type_file.num5    #No.FUN-680136 SMALLINT
   DEFINE l_pmn65  LIKE pmn_file.pmn65
   DEFINE l_msg    LIKE type_file.chr1000 #No.FUN-680136 VARCHAR(100)    #No:MOD-570411
   DEFINE l_rvb87_o LIKE rvb_file.rvb87   #No.MOD-830171
   DEFINE l_ta_ima001  LIKE ima_file.ta_ima001
   DEFINE l_ta     LIKE pmn_file.pmn20
   DEFINE l_cnt    LIKE type_file.num5      #add caroline
   LET g_rec_b = 0
   IF g_rva.rva01 IS NULL THEN RETURN END IF
   IF NOT cl_confirm('apm-252') THEN RETURN END IF
   IF INT_FLAG THEN LET INT_FLAG = 0 RETURN END IF

   CALL g_rvb.clear()
   #No.FUN-540027  --begin
 #-----------No:TQC-660053 modify
   LET g_sql = "SELECT '','',pmn01,pmn02,pmn41,pmn04, ",
               "       '','','','','','','','','','','', ",
               "       '','','','','','','','','','', ",
               "       pmn041,'',pmn07,",
 #-----------No:TQC-660053 end
               "       pmn20,(pmn50-pmn55),0,0,'N',(pmn20-pmn50+pmn55),",
               "  '',     pmn83,pmn84,pmn85,pmn80,pmn81,pmn82,pmn86,pmn87,",   #by lily modify 20141013,加一空欄位
              #MOD-690012-begin
              #"       pmn31,pmn31t,pmn52,pmn54,pmn56,pmn71,'',0,'',pmn930,'',pmn122,pmn65,", #No:FUN-550117 #FUN-670051 #TQC-670089 rvb930->pmn930
              #"       pmn31,pmn31t,pmn52,pmn54,pmn56,pmn71,'',0,pmn930,'',pmn122,pmn65,", #No:FUN-550117 #FUN-670051 #TQC-670089 rvb930->pmn930  #MOD-7B0097 mark
              #MOD-690012-end
              #MOD-7B0097-begin-modify
               "       pmn31,pmn31t,pmn52,pmn54,pmn56,pmn71,'',0,pmn930,'',pmn122,pmn65,", #No:FUN-550117 #FUN-670051 #TQC-670089 rvb930->pmn930

               ##MOD-7B0097-begin-add
               #因行業別加欄位故需對應之後欄位取消了不用改
               #"       pmn31,pmn31t,pmn52,pmn54,pmn56,pmn71,'',0,pmn930,'',", #No:FUN-550117 #FUN-670051 #TQC-670089 rvb930->pmn930
               #"       '','','','','','','','','','','','','', ",
               #"       '','','','','','','','','','','','','', ",
               #"       '','','','','','','','','','','','','', ",
               #"       '','','','','','','','','','','','','', ",
               #"       '','','','','','','','', ",
               #"       pmn122,pmn65,",
               ##MOD-7B0097-end-add
              #MOD-7B0097-end-modify
               "       pmn88,pmn88t ", #No:FUN-550117
               "  FROM pmn_file,pmm_file ",
               " WHERE pmn01 = '",g_rva.rva02 CLIPPED,"' AND pmm18 <> 'X' ",
#               "   AND (pmn20-pmn50+pmn55>0)  AND pmm01=pmn01 AND pmn16='2' "
               "     AND pmm01=pmn01 AND pmn16='2' "
   #No.FUN-540027  --end
   PREPARE t110_g_b_p1 FROM g_sql
   DECLARE t110_g_b_c1 CURSOR WITH HOLD FOR t110_g_b_p1
   DISPLAY "G_SQL=",g_sql
   LET l_ac = 1
   FOREACH t110_g_b_c1 INTO g_rvb[l_ac].*,l_pmn122,l_pmn65,l_pmn88,l_pmn88t #No.FUN-540027
      IF SQLCA.SQLCODE THEN CALL cl_err('for pmn',SQLCA.SQLCODE,1) EXIT FOREACH END IF
      LET g_rvb[l_ac].rvb22=null
      INITIALIZE g_rvb2.* TO NULL
      LET l_rvb07s=0
      SELECT SUM(rvb07)  INTO l_rvb07s FROM rva_file,rvb_file
       WHERE rvb04=g_rvb[l_ac].rvb04 AND rvb03=g_rvb[l_ac].rvb03
         AND rva01=rvb01 AND rvaconf='N' AND rvb35='N'
         AND rva02=g_rva.rva02   #2016-11-04 by dengyu
      IF cl_null(l_rvb07s) THEN LET l_rvb07s=0 END IF
# by cjy 09/03/10 start 增加委外超入率
      SELECT ta_ima001 INTO l_ta_ima001 FROM ima_file WHERE ima01=g_rvb[l_ac].rvb05
      IF cl_null(l_ta_ima001) THEN LET l_ta_ima001=0 END IF
      LET l_ta=g_rvb[l_ac].pmn20 * l_ta_ima001 /100
      LET g_rvb2.rvb07=g_rvb[l_ac].rvb07-l_rvb07s + l_ta
# by cjy 09/03/10 start 增加委外超入率

     IF g_rvb2.rvb07 <=0 THEN
          #實收數量為零的資料不用再產生
          CALL cl_err('收货数量大于采购量','aaz-200',1)   #2016-11-04 by dengyu
          CONTINUE FOREACH
      END IF

      #############add caroline   20110518  判断是否存在重工料件###########################
      #130424IF g_rva.rva05 <> 'RT0597' THEN
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt FROM tc_szp_file WHERE tc_szp01 = g_rva.rva05 AND tc_szp04 = 'Y'
      IF l_cnt = 0 THEN
              LET l_cnt=0
              SELECT sum(img10) INTO l_cnt FROM img_file WHERE img01=g_rvb[l_ac].rvb05 and  img02 in
#              ('WFWIP','WFGWIP')  and img03 = g_rva.rva05    #by jianwei 20160624
#              ('YWFWIP','WFWIP','WFGWIP')  and img03 = g_rva.rva05      #by jianwei 20160624
              ('YWFWIP','WFGWIP','YMJZXMWIP','YCNCXMWIP')  and img03 = g_rva.rva05   #by jianwei 20160624 #by jianwei 20160711
              IF l_cnt > 0 THEN

                  LET l_cnt = 0
                  SELECT COUNT(*) INTO l_cnt FROM sfa_file,sfb_file WHERE sfb01=sfa01 and sfb01=g_rvb[l_ac].rvb34
                  and sfb05=g_rvb[l_ac].rvb05   and sfa03!=sfb05  and sfb87 != 'X' and sfb04 !='8'
                IF l_cnt > 0 THEN
                   CALL cl_err('','cpm-052',1)
                  LET g_rvb2.rvb07 = 0
                END IF

           END IF
      END IF
      ####################################################################################
      #MOD-830171-begin-add
      #若採購量=實收量, 其計價數量應直接帶入採購單資料
      IF g_rvb2.rvb07 = g_rvb[l_ac].pmn20  THEN
         LET l_rvb87_o = g_rvb[l_ac].rvb87
      END IF
      #MOD-830171-end-add

      #No.FUN-540027  --begin
      IF l_rvb07s <> 0 THEN
         LET g_rvb[l_ac].rvb85=0
         LET g_rvb[l_ac].rvb82=0
         LET g_rvb[l_ac].rvb87=0
      END IF
      #No.FUN-540027  --end
      IF l_ac > g_sma.sma110 THEN
         #xxxx筆==>收貨單身儲存最大筆數,其餘資料請再開一張收貨單
         CALL cl_err(g_sma.sma110,'apm-125',0)
         EXIT FOREACH
      END IF
      SELECT max(rvb02)+1 INTO g_rvb[l_ac].rvb02 FROM rvb_file
       WHERE rvb01 = g_rva.rva01
      IF g_rvb[l_ac].rvb02 IS NULL THEN LET g_rvb[l_ac].rvb02 = 1 END IF
      #採購單有輸入專案代號則批號用來記錄專案代號之值
      IF NOT cl_null(l_pmn122) THEN LET g_rvb[l_ac].rvb38=l_pmn122 END IF
      LET g_rvb2.rvb01=g_rva.rva01
      LET g_rvb2.rvb02=g_rvb[l_ac].rvb02
      LET g_rvb2.rvb03=g_rvb[l_ac].rvb03
      LET g_rvb2.rvb04=g_rvb[l_ac].rvb04
      LET g_rvb2.rvb05=g_rvb[l_ac].rvb05     #料號
      LET g_rvb2.rvb36=g_rvb[l_ac].rvb36     #倉庫
      LET g_rvb2.rvb37=g_rvb[l_ac].rvb37     #儲位
      LET g_rvb2.rvb38=g_rvb[l_ac].rvb38     #批號
      LET l_pmh08 = NULL
      IF cl_null(g_rvb2.rvb36) THEN
         SELECT pmm22 INTO l_pmm22 FROM pmm_file
          WHERE pmm01=g_rvb[l_ac].rvb04
         SELECT pmh08 INTO l_pmh08 FROM pmh_file            #判斷是否可直接入庫
          WHERE pmh01=g_rvb[l_ac].rvb05 AND pmh02=g_rva.rva05
            AND pmh13=l_pmm22
         IF STATUS THEN LET l_pmh08=NULL END IF     #00/0828modify
         IF l_pmh08 IS NOT NULL AND g_rvb2.rvb05[1,4]!='MISC' THEN
            SELECT ima35,ima36 INTO g_rvb[l_ac].rvb36,g_rvb[l_ac].rvb37
            FROM ima_file
            WHERE ima01=g_rvb[l_ac].rvb05
            LET g_rvb2.rvb36=g_rvb[l_ac].rvb36
            LET g_rvb2.rvb37=g_rvb[l_ac].rvb37
         END IF
      END IF
      IF g_rvb2.rvb05[1,4]='MISC' THEN
         LET g_rvb2.rvb35=NULL LET g_rvb[l_ac].rvb35=NULL
         LET g_rvb2.rvb36=NULL LET g_rvb[l_ac].rvb36=NULL
         LET g_rvb2.rvb37=NULL LET g_rvb[l_ac].rvb37=NULL
      END IF
      LET g_rvb2.rvb06=0
      LET g_rvb2.rvb08=g_rvb2.rvb07
      #No.FUN-540027  --begin
      IF g_sma.sma115 = 'Y' THEN
         SELECT ima906 INTO l_ima906 FROM ima_file WHERE ima01=g_rvb2.rvb05
         IF g_sma.sma115 = 'N' OR cl_null(l_ima906) OR l_ima906 = '1' THEN
            LET g_rvb[l_ac].rvb80=g_rvb[l_ac].pmn07
            LET g_rvb[l_ac].rvb82=g_rvb2.rvb07
         END IF
        #IF g_sma.sma116 MATCHES '[02]' THEN    #No:FUN-610076
        #   LET g_rvb[l_ac].rvb86=g_rvb[l_ac].pmn07
        #   LET g_rvb[l_ac].rvb87=g_rvb2.rvb07
        #END IF
         LET g_rvb2.rvb80 = g_rvb[l_ac].rvb80
         LET g_rvb2.rvb81 = g_rvb[l_ac].rvb81
         LET g_rvb2.rvb82 = g_rvb[l_ac].rvb82
#No.MOD-6B0162 --begin
         SELECT SUM(rvb82),SUM(rvb85) INTO l_rvb82,l_rvb85 FROM rvb_file,rva_file
          WHERE rvb04 = g_rvb[l_ac].rvb04
            AND rvb03 = g_rvb[l_ac].rvb03
            AND rva01 = rvb01
            AND rvaconf = 'Y'
         IF NOT cl_null(l_rvb82) AND l_rvb82 > 0 THEN
            LET g_rvb2.rvb82 =g_rvb[l_ac].rvb82 - l_rvb82
            LET g_rvb[l_ac].rvb82 = g_rvb2.rvb82
         END IF
#No.MOD-6B0162 --end
         LET g_rvb2.rvb83 = g_rvb[l_ac].rvb83
         LET g_rvb2.rvb84 = g_rvb[l_ac].rvb84
         LET g_rvb2.rvb85 = g_rvb[l_ac].rvb85   #No:MOD-5A0297 Mark #TQC-5C0012 Unmark 應是筆誤,應要mark rvb87才對
#No.MOD-6B0162 --begin
         IF NOT cl_null(l_rvb85) AND l_rvb85 > 0 THEN
            LET g_rvb2.rvb85 =g_rvb[l_ac].rvb85 - l_rvb85
            LET g_rvb[l_ac].rvb85 = g_rvb2.rvb85
         END IF
#No.MOD-6B0162 --end
        #LET g_rvb2.rvb86 = g_rvb[l_ac].rvb86   #No:MOD-5A0297 Mark
        #LET g_rvb2.rvb87 = g_rvb[l_ac].rvb87   #No:TQC-5C0012 Mark
        #LET g_rvb2.rvb88 = l_pmn88             #No:TQC-6B0124 mark
        #LET g_rvb2.rvb88t= l_pmn88t            #No:TQC-6B0124 mark
      END IF
     #------------------No:TQC-6B0124 modify
     #若收貨單自動產生單身時，即表示收貨單身的"計價單位"與
     #"計價數量"是由採購單帶過來，故不應在去判斷是否使用
     #計價單位，才來決定"計價單位"與"計價數量的值
      #-----No:MOD-5A0297-----
      #IF g_sma.sma116 MATCHES '[02]' THEN    #No:FUN-610076
      #   LET g_rvb[l_ac].rvb86=g_rvb[l_ac].pmn07
      #   LET g_rvb[l_ac].rvb87=g_rvb2.rvb07
      #ELSE
      #   LET g_rvb2.rvb86 = g_rvb[l_ac].rvb86
      #   LET g_rvb2.rvb87 = g_rvb[l_ac].rvb87
      #END IF
      ##-----No:MOD-5A0297 END-----
      #IF cl_null(g_rvb[l_ac].rvb86) THEN
      #   LET g_rvb[l_ac].rvb86=g_rvb[l_ac].pmn07
      #   LET g_rvb[l_ac].rvb87=g_rvb2.rvb07
      #   LET g_rvb2.rvb86 = g_rvb[l_ac].rvb86
      #   LET g_rvb2.rvb87 = g_rvb[l_ac].rvb87
      #END IF

       LET g_rvb[l_ac].rvb07 = g_rvb2.rvb07    #No:TQC-6C0131 add
       IF cl_null(g_rvb[l_ac].rvb86) THEN
          LET g_rvb[l_ac].rvb86=g_rvb[l_ac].pmn07
          LET g_rvb[l_ac].rvb87=g_rvb2.rvb07
       END IF
       LET g_rvb2.rvb86 = g_rvb[l_ac].rvb86
       CALL t110_set_rvb87()     #No.MOD-6B0162
       #-------No:CHI-820010 add
        IF g_sma.sma116 MATCHES '[02]' THEN
           LET g_rvb[l_ac].rvb87 = g_rvb2.rvb07
        END IF
       #-------No:CHI-820010 end
       #MOD-830171-begin-add
       #若採購量=實收量, 其計價數量應直接帶入採購單資料
        IF g_sma.sma116 MATCHES '[13]' THEN
           LET g_rvb[l_ac].rvb87 = l_rvb87_o
        END IF
       #MOD-830171-end-add
       LET g_rvb2.rvb87 = g_rvb[l_ac].rvb87
       LET g_rvb2.rvb88 = l_pmn88
       LET g_rvb2.rvb88t= l_pmn88t
     #------------------No:TQC-6B0124 end
      #No.FUN-540027  --end
      LET g_rvb2.rvb09=0
      LET g_rvb2.rvb10=g_rvb[l_ac].rvb10
      LET g_rvb2.rvb10t=g_rvb[l_ac].rvb10t          #No:FUN-550117
      LET g_rvb2.rvb11=0
      SELECT ima491 INTO l_ima491 FROM ima_file
       WHERE ima01 = g_rvb2.rvb05
      IF cl_null(l_ima491) THEN LET l_ima491 = 0 END IF
      IF l_ima491 > 0 THEN
         CALL s_getdate(g_rva.rva06,l_ima491) RETURNING g_rvb2.rvb12
      ELSE
         IF cl_null(g_rvb2.rvb12) THEN
            LET g_rvb2.rvb12 = g_rva.rva06
         END IF
      END IF
      # cjy by 08/12/01 收货单别为PPB,PPF,KPB,KPF则收货单价,金额为0
      IF g_rva.rva10='SUB' AND (g_rva.rva01 MATCHES 'PPB*' OR g_rva.rva01 MATCHES 'PPF*'OR g_rva.rva01 MATCHES 'KPF*' OR g_rva.rva01 MATCHES 'KPB*' OR g_rva.rva01 MATCHES '271*') THEN
      LET g_rvb2.rvb88=0
      LET g_rvb2.rvb88t=0
      LET g_rvb2.rvb10t=0
      LET g_rvb2.rvb10=0
      END IF
      #end  cjy  by 08/12/01
      IF g_rvb2.rvb04[1,3]='WWC'  THEN #add by endy 150901 WWC單頭管控0單價
          LET g_rvb2.rvb88=0
          LET g_rvb2.rvb88t=0
          LET g_rvb2.rvb10t=0
          LET g_rvb2.rvb10=0
      END IF
      LET g_rvb2.rvb13=NULL
      LET g_rvb2.rvb14=NULL
      LET g_rvb2.rvb15=0
      LET g_rvb2.rvb16=0
      LET g_rvb2.rvb17=NULL
      LET g_rvb2.rvb18='10'
      LET g_rvb2.rvb19=l_pmn65  #No:8114
      LET g_rvb2.rvb20=NULL
      LET g_rvb2.rvb21=NULL
      LET g_rvb2.rvb22=g_rvb[l_ac].rvb22
      LET g_rvb2.rvb25=g_rvb[l_ac].rvb25
      LET g_rvb2.rvb26=NULL
      LET g_rvb2.rvb27=0
      LET g_rvb2.rvb28=0
      LET g_rvb2.rvb29=0
      LET g_rvb2.rvb30=0
      LET g_rvb2.rvb31=g_rvb[l_ac].rvb07
      LET g_rvb2.rvb32=0
      LET g_rvb2.rvb33=0
      #No.FUN-580115  --begin
      LET g_rvb2.rvb331=0
      LET g_rvb2.rvb332=0
      #No.FUN-580115  --end
      LET g_rvb2.rvb34=g_rvb[l_ac].rvb34
      LET g_rvb2.rvb35='N'
      LET g_rvb2.rvb40= ''  #no.7143
      LET g_rvb2.rvb930=g_rvb[l_ac].rvb930 #FUN-670051
      LET g_rvb2.rvbplant=g_plant     #by lily add 20141013
      LET g_rvb2.rvblegal=g_legal     #by lily add 20141013
      LET g_rvb2.rvb42=' '            #by lily add 20141013
      CALL t110_set_rvb930(g_rvb[l_ac].rvb930) RETURNING g_rvb[l_ac].gem02a #FUN-670051
      IF g_rvb2.rvb36 IS NULL THEN LET g_rvb2.rvb36=' ' END IF
      IF g_rvb2.rvb37 IS NULL THEN LET g_rvb2.rvb37=' ' END IF
      IF g_rvb2.rvb38 IS NULL THEN LET g_rvb2.rvb38=' ' END IF
       #FUN-850022 --begin
      # CALL t110_get_rvb39(g_rvb2.rvb04,g_rvb2.rvb05,g_rvb2.rvb19,g_rva.rva05,g_sma.sma886)  #by lily 20141012
       CALL t110_get_rvb39(g_rvb2.rvb03,g_rvb2.rvb04,g_rvb2.rvb05,g_rvb2.rvb19,g_rva.rva05,g_sma.sma886)
           RETURNING g_rvb2.rvb39 #MOD-530415
                  # cjy by 09/05/18 收货单别为PPB,PPF,KPB,KPF则檢查項目設置為免檢，使倉庫可直接生成入庫單
              IF g_rva.rva10='SUB' AND (g_rva.rva01 MATCHES 'PPB*' OR g_rva.rva01 MATCHES 'PPF*' OR g_rva.rva01 MATCHES 'KPF*' OR g_rva.rva01 MATCHES 'KPB*' OR g_rva.rva01 MATCHES '271*') THEN
                 LET g_rvb2.rvb39='N'
               END IF
               #end  cjy  by 09/05/18
       #FUN-850022 --end
      BEGIN WORK
      LET g_success = 'Y'
      INSERT INTO rvb_file VALUES(g_rvb2.*)
      IF SQLCA.sqlcode THEN
#        CALL cl_err(g_rvb[l_ac].rvb02,SQLCA.sqlcode,1) #No.FUN-660129
         CALL cl_err3("ins","rvb_file",g_rvb2.rvb01,g_rvb2.rvb02,SQLCA.sqlcode,"","",1) #No.FUN-660129
         ROLLBACK WORK
         CONTINUE FOREACH
       #-----No:MOD-570411-----
      ELSE
         SELECT COUNT(*) INTO l_n FROM img_file
          WHERE img01 = g_rvb2.rvb05
            AND img02 = g_rvb2.rvb36
            AND img03 = g_rvb2.rvb37
            AND img04 = g_rvb2.rvb38
         IF l_n = 0 AND (g_rvb[l_ac].rvb36 IS NOT NULL
                         AND g_rvb[l_ac].rvb36 <> ' ') THEN
            LET l_msg ="(",g_rvb2.rvb05 CLIPPED,"-",
                           g_rvb2.rvb36 CLIPPED,'-',
                           g_rvb2.rvb37 CLIPPED,'-',
                           g_rvb2.rvb38 CLIPPED,")"

            IF cl_confirm2('mfg1401',l_msg) THEN
               CALL s_add_img(g_rvb2.rvb05,g_rvb2.rvb36,g_rvb2.rvb37,
                              g_rvb2.rvb38,g_rva.rva01,g_rvb2.rvb02,
                              g_rva.rva06)
            END IF
         END IF
       #-----No:MOD-570411 END-----
      END IF
      IF g_success='Y' THEN
         COMMIT WORK
      ELSE
         ROLLBACK WORK
      END IF
      LET l_ac = l_ac + 1
   END FOREACH

   CALL g_rvb.deleteElement(l_ac)
   LET l_ac=l_ac - 1

   CALL t110_b_fill(' 1=1')

END FUNCTION

# BY CJY 09/01/08 START
FUNCTION t110_sfs()        #自動由委外採購單產生发料單
DEFINE  tm_iss_no LIKE sfp_file.sfp01
DEFINE l_sfa        RECORD LIKE sfa_file.*
DEFINE   li_result,l_cnt     LIKE type_file.num5
DEFINE   l_sfb02     LIKE sfb_file.sfb02
DEFINE   l_sql,l_subsql   string
 DEFINE l_qpa         LIKE sfa_file.sfa161
DEFINE  l_rvb34  LIKE rvb_file.rvb34,
        l_rvb07  LIKE rvb_file.rvb07,
        l_sfb08  LIKE sfb_file.sfb08,
        l_sfb081 LIKE sfb_file.sfb081,
        l_bmb08  LIKE bmb_file.bmb08,
        l_sfs05_z LIKE sfs_file.sfs05 #替代料发料量换算成的被替代料量
 #       l_sfsbmb LIKE sfs_file.sfs05
 DEFINE l_qty         LIKE sfs_file.sfs05

 DEFINE l_sfb05       LIKE sfb_file.sfb05     #by jianwei 20160711

 Define l_ima06       Like ima_file.ima06     #by jianwei 20160711

 LET g_sfp_1.sfp01=''

 SELECT  * INTO g_sfp_1.*  FROM SFP_FILE
 WHERE sfp08=g_rva.rva01 AND sfp06 in ( 1,2,3,4 ) AND sfpconf<>'X'

 IF cl_null(g_sfp_1.sfp01) THEN

LET p_row = 7 LET p_col = 22
   OPEN WINDOW t110_sfs AT p_row,p_col WITH FORM "csf/42f/csfp504"
      ATTRIBUTE (STYLE = g_win_style CLIPPED) #No:FUN-580092 HCN

    CALL cl_ui_locale("csfp540")

 WHILE TRUE
 LET INT_FLAG = 0

 INPUT BY NAME  tm_iss_no    WITHOUT DEFAULTS



         AFTER FIELD tm_iss_no
            IF tm_iss_no IS NULL THEN
               NEXT FIELD tm_iss_no
            END IF

            LET g_t1=tm_iss_no[1,g_doc_len]
            CALL s_check_no("asf",g_t1,"","3","","","")
            RETURNING li_result,tm_iss_no

            LET tm_iss_no = s_get_doc_no(tm_iss_no)
            DISPLAY BY NAME tm_iss_no
            IF (NOT li_result) THEN
               NEXT FIELD tm_iss_no
            END IF


        DISPLAY BY NAME tm_iss_no



         ON ACTION CONTROLP
            CASE
               WHEN INFIELD(tm_iss_no)

                  LET g_t1 = s_get_doc_no(tm_iss_no)     #No.FUN-550067

                  CALL q_smy(FALSE,FALSE,g_t1,'ASF','3') RETURNING g_t1   #TQC-670008

                   LET tm_iss_no = g_t1          #No.FUN-550067
                  DISPLAY tm_iss_no TO tm_iss_no
                  NEXT FIELD tm_iss_no
               OTHERWISE EXIT CASE
            END CASE


         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE INPUT

        AFTER INPUT

        IF tm_iss_no IS NULL THEN

               NEXT FIELD tm_iss_no
        END IF

      END INPUT
   IF NOT INT_FLAG THEN
      LET INT_FLAG = 0
      CLOSE WINDOW t110_sfs              #FUN-570151
  EXIT WHILE
   END IF
 END WHILE

    CALL s_auto_assign_no("asf",tm_iss_no,g_rva.rva06,"","sfp_file","sfp01","","","")   #TQC-680048
        RETURNING li_result,tm_iss_no
      IF (NOT li_result) THEN
    LET g_success='N' RETURN END IF

   LET g_sfp_1.sfp01=tm_iss_no
   LET g_sfp_1.sfp02=g_rva.rva06
   LET g_sfp_1.sfp03=g_rva.rva06
   LET g_sfp_1.sfp04='N'
   LET g_sfp_1.sfpconf='Y' #FUN-660106
   LET g_sfp_1.sfp05='N'
   IF l_cnt<>0 THEN
   LET g_sfp_1.sfp06='3'
   ELSE
   LET g_sfp_1.sfp06='1'
   END IF
   LET g_sfp_1.sfp07=g_grup
   LET g_sfp_1.sfp08=g_rva.rva01
   LET g_sfp_1.sfpuser=g_user
   LET g_sfp_1.sfpdate=g_today
   LET g_sfp_1.sfpgrup=g_grup          #No:MOD-770102 add
   LET g_sfp_1.sfpplant=g_plant    #by lily add 20141013
   LET g_sfp_1.sfplegal=g_legal    #by lily add 20141013
   LET g_sfp_1.sfp15='0'           #by lily add 20141013
   LET g_sfp_1.sfpmksg='N'         #by lily add 20141013

##
   INSERT INTO sfp_file VALUES(g_sfp_1.*)
      IF STATUS THEN
      CALL s_errmsg('sfp01',g_sfp_1.sfp01,'ins sfp:',STATUS,1)                 #NO.FUN-710026
      LET g_success='N' RETURN
   END IF
  END IF
    UPDATE sfp_file SET sfpconf='Y' WHERE sfp01=g_sfp_1.sfp01
             DELETE FROM sfs_file where sfs01=g_sfp_1.sfp01
             DELETE FROM sfq_file where sfq01=g_sfp_1.sfp01

 INITIALIZE g_sfq_1.* TO NULL
  INITIALIZE g_sfs_1.* TO NULL



 LET  l_sql="SELECT  rvb34,rvb07  FROM  rvb_file  WHERE rvb01='",g_rva.rva01,"' "
 PREPARE t110_p1 FROM l_sql
 DECLARE t110_c1 CURSOR FOR t110_p1
  FOREACH t110_c1 INTO l_rvb34,l_rvb07
  LET g_sfq_1.sfq01=g_sfp_1.sfp01
  LET g_sfq_1.sfq02=l_rvb34
  LET g_sfq_1.sfqplant=g_plant    #by lily add 20141013
  LET g_sfq_1.sfqlegal=g_legal    #by lily add 20141013
  LET g_sfq_1.sfq012=' '          #by lily add 20141013
  LET g_sfq_1.sfq014=' '          #by lily add 20141013

  #IF l_cnt=0 THEN
     SELECT  sfb08,sfb081 INTO l_sfb08,l_sfb081 FROM sfb_file WHERE sfb01=l_rvb34
     IF l_sfb08 = l_sfb081 THEN
         LET g_sfq_1.sfq03=0
     ELSE
         IF l_rvb07<=l_sfb08-l_sfb081 THEN
            LET g_sfq_1.sfq03=l_rvb07
          ELSE
            LET g_sfq_1.sfq03=l_sfb08-l_sfb081
          END IF
     END IF

  #   LET g_sfq_1.sfq03=0
  #END IF
{   #120906
   SELECT sfa08 INTO g_sfq_1.sfq04 FROM sfa_file WHERE sfa01 = g_sfq_1.sfq02
}
   SELECT max(sfa08) INTO g_sfq_1.sfq04 FROM sfa_file WHERE sfa01 = g_sfq_1.sfq02
  IF cl_null(g_sfq_1.sfq04) THEN LET g_sfq_1.sfq04 = ' ' END IF
  IF cl_null(g_sfq_1.sfq05) THEN LET g_sfq_1.sfq05 = g_today END IF


  INSERT INTO sfq_file VALUES(g_sfq_1.*)
        IF STATUS THEN
      CALL s_errmsg('sfq02',g_sfq_1.sfq02,'ins sfq:',STATUS,1)                 #NO.FUN-710026
      DELETE FROM sfp_file where sfp01=g_sfp_1.sfp01
      DELETE FROM sfq_file where sfq01=g_sfp_1.sfp01 #add by endy 150916 之前录入的发料单单身也要删除
      DELETE FROM sfs_file where sfs01=g_sfp_1.sfp01 #add by endy 150916 之前录入的发料单单身也要冀 除
      LET g_success='N' RETURN
       END IF


  DROP TABLE tmp #mod by endy 150912 在使用前先删除临时表

  CREATE TEMP TABLE tmp( #mod by endy 150912 在使用前先建立临时表
    a          VARCHAR(16),
    b          VARCHAR(40),
    c          DECIMAL(13,3),
    d          VARCHAR(6)); #add by endy 160109 增加作业编号
   SELECT  COUNT(*) INTO l_cnt FROM sfb_file where sfb08=sfb081
    AND sfb01 in ( SELECT  rvb34 FROM rvb_file WHERE rvb01=g_rva.rva01 )

  LET l_subsql = "SELECT sfa_file.*  FROM   sfa_file ",
           " WHERE sfa01 = '",g_sfq_1.sfq02,"' ", " ORDER BY sfa26 "

  PREPARE t110_p2 FROM l_subsql
  DECLARE t110_c2 CURSOR FOR t110_p2
######mod by endy 150912 修改foreach部分，修正有替代料时的情况 start #####
#   FOREACH t110_c2 INTO l_sfa.*
#    LET g_sfs_1.sfs01=g_sfq_1.sfq01
#         IF cl_null(g_sfs_1.sfs02) THEN LET g_sfs_1.sfs02=0 END IF
#         LET g_sfs_1.sfs02=g_sfs_1.sfs02+1
#         LET g_sfs_1.sfs03=l_sfa.sfa01
#          LET g_sfs_1.sfs04=l_sfa.sfa03
#          SELECT SUM(rvb07) INTO l_rvb07 FROM rvb_file WHERE rvb01=g_rva.rva01 AND rvb34=l_sfa.sfa01
#          IF cl_null(l_rvb07) THEN LET l_rvb07=0 END IF
#           LET g_sfs_1.sfs05=l_rvb07*l_sfa.sfa161                 #No:MOD-640013 add
#          LET l_bmb08=0
#
#           SELECT  bmb08 into l_bmb08 FROM bmb_file
#           where bmb01=l_sfa.sfa29 and bmb03=l_sfa.sfa27 and  bmb09=l_sfa.sfa08
#          IF cl_null(l_bmb08) THEN LET l_bmb08=0 END IF
##         LET  l_sfsbmb= l_rvb07*l_bmb08/100
#
#
#         LET g_sfs_1.sfs06=l_sfa.sfa12
#
#         LET g_sfs_1.sfs26 = l_sfa.sfa26
#         LET g_sfs_1.sfs27 = l_sfa.sfa27
#         LET g_sfs_1.sfs28 = l_sfa.sfa28
#         IF l_sfa.sfa26 MATCHES '[SUT]' THEN    #MODNO:7111 add 'T'
# #           SELECT (sfa161 * sfa28) INTO l_qpa FROM sfa_file  by cjy 100204 替代料QPA有問題
#            SELECT (sfa161 * l_sfa.sfa28) INTO l_qpa FROM sfa_file
#               WHERE sfa01 = l_sfa.sfa01 AND sfa03 = l_sfa.sfa27
# #           LET g_sfs_1.sfs05 = g_sfq_1.sfq03*l_qpa
#             LET g_sfs_1.sfs05 = l_rvb07*l_qpa
#            SELECT SUM(c) INTO l_qty FROM tmp WHERE a = l_sfa.sfa01
#               AND b = l_sfa.sfa27
#            IF cl_null(l_qty) THEN  LET  l_qty=0   END IF
#            IF g_sfs_1.sfs05 < l_qty THEN
#               LET g_sfs_1.sfs05 = 0
#            ELSE
#               LET g_sfs_1.sfs05 = g_sfs_1.sfs05 - l_qty
#            END IF
#         END IF
#         #判斷發料是否大於可發料數(sfa05-sfa06)
#         IF g_sfs_1.sfs05 > (l_sfa.sfa05+ l_sfa.sfa05*l_bmb08/100 - l_sfa.sfa06) THEN
#            LET g_sfs_1.sfs05 = l_sfa.sfa05 + l_sfa.sfa05*l_bmb08/100- l_sfa.sfa06
#         END IF
#
#         INSERT INTO tmp
#           VALUES(l_sfa.sfa01,l_sfa.sfa27,g_sfs_1.sfs05)
#         select  sfb02 into l_sfb02 FROM sfb_file where sfb01=l_sfa.sfa01
#         LET g_sfs_1.sfs08 = g_rva.rva05
#         #  BY CJY 090708 增加日騰在制倉
#         IF l_sfa.sfa01 MATCHES 'WRT*'       THEN
#         LET g_sfs_1.sfs07 ='RTWIP'
#          ELSE
#         IF l_sfb02='8' THEN
#            LET g_sfs_1.sfs07 ='WFGWIP'
#         ELSE
#            LET g_sfs_1.sfs07='WFWIP'
#         END IF
#         END IF
#         LET g_sfs_1.sfs10=l_sfa.sfa08
#         LET g_sfs_1.sfs09=' '           #No.MOD-840136
#         LET g_sfs_1.sfsplant=g_plant    #by lily add 20141013
#         LET g_sfs_1.sfslegal=g_legal    #by lily add 20141013
#         LET g_sfs_1.sfs014=' '          #by lily add 20141013
#      #---------------by lily add 20141210 ---------str
#         LET g_sfs_1.sfs012=' '
#         LET g_sfs_1.sfs013=0
##         IF cl_null(g_sfs_1.sfs27) THEN #del by endy 20150309
##            LET g_sfs_1.sfs27=g_sfs_1.sfs04
##         END IF
#      #-------------------by lily end-----------------------
#         INSERT INTO sfs_file VALUES(g_sfs_1.*)
#         IF SQLCA.SQLCODE THEN
#           CALL cl_err('i sfs:',STATUS,1)  #No:FUN-660128
#           CALL cl_err3("ins","sfs_file",g_sfs_1.sfs01,g_sfs_1.sfs02,STATUS,"","i sfs:",1)    #No:FUN-660128
#            DELETE FROM sfp_file where sfp01=g_sfp_1.sfp01
#             DELETE FROM sfq_file where sfq01=g_sfp_1.sfp01
#           LET g_success='N'
#           RETURN
#            END IF
#
#      END FOREACH

######mod by endy 150912 修改foreach部分，修正有替代料时的情况 start #####
   FOREACH t110_c2 INTO l_sfa.*
    LET g_sfs_1.sfs01=g_sfq_1.sfq01
         IF cl_null(g_sfs_1.sfs02) THEN LET g_sfs_1.sfs02=0 END IF
         LET g_sfs_1.sfs02=g_sfs_1.sfs02+1
         LET g_sfs_1.sfs03=l_sfa.sfa01
          LET g_sfs_1.sfs04=l_sfa.sfa03
          SELECT SUM(rvb07) INTO l_rvb07 FROM rvb_file WHERE rvb01=g_rva.rva01 AND rvb34=l_sfa.sfa01
          IF cl_null(l_rvb07) THEN LET l_rvb07=0 END IF
           LET g_sfs_1.sfs05=l_rvb07*l_sfa.sfa161 #主料QPA，替代料QPA后面会重新计算 #No:MOD-640013 add
          LET l_bmb08=0

           SELECT  bmb08 into l_bmb08 FROM bmb_file
           where bmb01=l_sfa.sfa29 and bmb03=l_sfa.sfa27 and  bmb09=l_sfa.sfa08
          IF cl_null(l_bmb08) THEN LET l_bmb08=0 END IF
#         LET  l_sfsbmb= l_rvb07*l_bmb08/100


         LET g_sfs_1.sfs06=l_sfa.sfa12

         LET g_sfs_1.sfs26 = l_sfa.sfa26
         LET g_sfs_1.sfs27 = l_sfa.sfa27
         LET g_sfs_1.sfs28 = l_sfa.sfa28
         IF l_sfa.sfa26 MATCHES '[SUT]' THEN    #MODNO:7111 add 'T'
            SELECT sfa161 INTO l_qpa FROM sfa_file #这里只算被替代料QPA
               WHERE sfa01 = l_sfa.sfa01 AND sfa03 = l_sfa.sfa27
                 AND sfa08 = l_sfa.sfa08 #add by endy 160109 增加作业编号
             LET l_sfs05_z = l_rvb07*l_qpa #换算成的主料发料量
            SELECT SUM(c) INTO l_qty FROM tmp WHERE a = l_sfa.sfa01
               AND b = l_sfa.sfa27 AND d = l_sfa.sfa08 #add by endy 160109 增加作业编号
            IF cl_null(l_qty) THEN  LET  l_qty=0   END IF
            IF l_sfs05_z < l_qty THEN
               LET l_sfs05_z = 0
            ELSE
               LET l_sfs05_z = l_sfs05_z - l_qty
            END IF
            LET g_sfs_1.sfs05 = l_sfs05_z*l_sfa.sfa28 #替代料发料量
         END IF
         #判斷發料是否大於可發料數(sfa05-sfa06)
         IF g_sfs_1.sfs05 > (l_sfa.sfa05 - l_sfa.sfa06) THEN
            LET g_sfs_1.sfs05 = l_sfa.sfa05 - l_sfa.sfa06
            LET l_sfs05_z = g_sfs_1.sfs05/l_sfa.sfa28 #重新计算换算的被替代料发料量
         ELSE
            IF l_sfa.sfa26 NOT MATCHES '[SUT]' THEN
               LET l_sfs05_z = g_sfs_1.sfs05
            END IF
         END IF

         INSERT INTO tmp
           VALUES(l_sfa.sfa01,l_sfa.sfa27,l_sfs05_z,l_sfa.sfa08)
         select  sfb02 into l_sfb02 FROM sfb_file where sfb01=l_sfa.sfa01
         LET g_sfs_1.sfs08 = g_rva.rva05
         #  BY CJY 090708 增加日騰在制倉
         IF l_sfa.sfa01 MATCHES 'WRT*'       THEN
         LET g_sfs_1.sfs07 ='RTWIP'
          ELSE
        { IF l_sfb02='8' THEN			#20161105 by lucy
            LET g_sfs_1.sfs07 ='WFGWIP'
         ELSE
#            LET g_sfs_1.sfs07='WFWIP'  #by jianwei 20160624
            LET g_sfs_1.sfs07='YWFWIP'  #by jianwei 20160624 #by jianwei 20160711}
################by jianwei 20160711   根据发料号的分群码来设定仓库
            Select sfb05 Into l_sfb05 From sfb_file Where sfb01=g_sfq_1.sfq02
#            Select ima06 Into l_ima06 From ima_file Where ima01=l_sfb05   #2016-11-28 by jianwei
            Select ima06,ima35 Into l_ima06,g_sfs_1.sfs07 From ima_file Where ima01=l_sfb05   #2016-11-28 by jianwei 默认料件的主要仓库
           If g_plant='KAIJIA' Then             #2016-11-28 by jianwei
               If l_ima06='531N' Or l_ima06='541N'  Then
                  LET g_sfs_1.sfs07='YMJZXMWIP'           #鎧嘉模檢治具委外修模在制倉
               End If
               If l_ima06='804N'  Then
                  LET g_sfs_1.sfs07='YCNCXMWIP'           #鎧嘉刀具修模在製倉
               End If
               If l_ima06='102' Or l_ima06='102N' Or l_ima06='202' Or l_ima06='202N' Or l_ima06='222' Or l_ima06='222N'  Then
                  LET g_sfs_1.sfs07='YWFWIP'           #鎧嘉半品、成品委外在制倉
               End If
            End If
################by jianwei 20160711
         #END IF		#20161105 by lucy
         END IF
         LET g_sfs_1.sfs10=l_sfa.sfa08
         LET g_sfs_1.sfs09=' '           #No.MOD-840136
         LET g_sfs_1.sfsplant=g_plant    #by lily add 20141013
         LET g_sfs_1.sfslegal=g_legal    #by lily add 20141013
         LET g_sfs_1.sfs014=' '          #by lily add 20141013
      #---------------by lily add 20141210 ---------str
         LET g_sfs_1.sfs012=' '
         LET g_sfs_1.sfs013=0
#         IF cl_null(g_sfs_1.sfs27) THEN #del by endy 20150309
#            LET g_sfs_1.sfs27=g_sfs_1.sfs04
#         END IF
      #-------------------by lily end-----------------------
         INSERT INTO sfs_file VALUES(g_sfs_1.*)
         IF SQLCA.SQLCODE THEN
           CALL cl_err('i sfs:',STATUS,1)  #No:FUN-660128
           CALL cl_err3("ins","sfs_file",g_sfs_1.sfs01,g_sfs_1.sfs02,STATUS,"","i sfs:",1)    #No:FUN-660128
            DELETE FROM sfp_file where sfp01=g_sfp_1.sfp01
             DELETE FROM sfq_file where sfq01=g_sfp_1.sfp01
             DELETE FROM sfs_file where sfq01=g_sfp_1.sfp01  #add by endy 150916 之前录入的发料单单身也要删除
           LET g_success='N'
           RETURN
            END IF

      END FOREACH
   END FOREACH




 IF g_sfp_1.sfp06='1' THEN
   LET l_sql="asfi511 '",g_sfp_1.sfp01 CLIPPED ,"'"
 ELSE
   LET l_sql="asfi513 '",g_sfp_1.sfp01 CLIPPED ,"'"
 END IF
 CALL cl_cmdrun_wait(l_sql)

  SELECT  sfp04 INTO g_sfp_1.sfp04  FROM sfp_file WHERE sfp01=g_sfp_1.sfp01

  IF cl_null(g_sfp_1.sfp04) OR g_sfp_1.sfp04<>'Y' THEN
  LET g_success='N'
  RETURN
  END IF
  UPDATE rva_file SET  ta_rva01=g_sfp_1.sfp01 where rva01=g_rva.rva01
    LET g_rva.ta_rva01=g_sfp_1.sfp01
    DISPLAY BY NAME g_rva.ta_rva01

END FUNCTION

# BY CJY 09/01/08 END

# BY CJY 101125 ADD 增加自動產生退料單start


FUNCTION t110_sfs_yt(tm_iss_no,l_rva01,l_ta_rva01)        #自動由委外採購單產生退料單
DEFINE  tm_iss_no LIKE sfp_file.sfp01
DEFINE l_sfe        RECORD LIKE sfe_file.*
DEFINE   li_result,l_cnt     LIKE type_file.num5
DEFINE   l_sfb02     LIKE sfb_file.sfb02,
         l_rva01     LIKE rva_file.rva01,
        l_ta_rva01      LIKE sfp_file.sfp01
DEFINE   l_sql,l_subsql   string
 DEFINE l_qpa         LIKE sfa_file.sfa161
DEFINE  l_rvb34  LIKE rvb_file.rvb34,
        l_rvb07  LIKE rvb_file.rvb07,
        l_img10  LIKE img_file.img10,
        l_sfb08  LIKE sfb_file.sfb08,
        l_sfb081 LIKE sfb_file.sfb081,
        l_bmb08  LIKE bmb_file.bmb08 ,
        l_rva06    LIKE rva_file.rva06,  # by 110130 add
        l_tc_rva03 LIKE rva_file.ta_rva03
 #       l_sfsbmb LIKE sfs_file.sfs05
 DEFINE l_qty         LIKE sfs_file.sfs05

    SELECT ta_rva03,rva06 INTO l_tc_rva03,l_rva06  FROM rva_file WHERE rva01=l_rva01
   LET l_tc_rva03=''
   IF NOT cl_null(l_tc_rva03) THEN
   LET l_cnt=0
     SELECT  count(*) INTO l_cnt FROM sfp_file WHERE sfp01=l_tc_rva03 AND sfp04='Y'
     IF l_cnt>0 THEN
     CALL cl_err(l_tc_rva03,'cpm-012',1)
     LET g_success='N'
     RETURN
     END IF
   END IF

   BEGIN WORK

  IF  cl_null(l_tc_rva03) THEN



   LET g_t1= s_get_doc_no(tm_iss_no)
   CALL  s_check_no("asf",g_t1,"","4","","","") RETURNING li_result,tm_iss_no

    CALL s_auto_assign_no("asf",tm_iss_no,l_rva06,"","sfp_file","sfp01","","","")   #TQC-680048
        RETURNING li_result,tm_iss_no
      IF (NOT li_result) THEN
    LET g_success='N' RETURN END IF



   LET g_sfp_1.sfp01=tm_iss_no
   LET g_sfp_1.sfp02=l_rva06
   LET g_sfp_1.sfp03=l_rva06
   LET g_sfp_1.sfp04='N'
   LET g_sfp_1.sfpconf='Y' #FUN-660106
   LET g_sfp_1.sfp05='N'

   LET g_sfp_1.sfp06='6'

   LET g_sfp_1.sfp07=g_grup
   LET g_sfp_1.sfp08=l_rva01
   LET g_sfp_1.sfpuser=g_user
   LET g_sfp_1.sfpdate=g_today
   LET g_sfp_1.sfpgrup=g_grup          #No:MOD-770102 add
   LET g_sfp_1.sfpplant=g_plant    #by lily add 20141013
   LET g_sfp_1.sfplegal=g_legal    #by lily add 20141013
   LET g_sfp_1.sfp15='0'           #by lily add 20141013
   LET g_sfp_1.sfpmksg='N'         #by lily add 20141013
##
   INSERT INTO sfp_file VALUES(g_sfp_1.*)
      IF STATUS THEN
      CALL s_errmsg('sfp01',g_sfp_1.sfp01,'ins sfp:',STATUS,1)
      ROLLBACK WORK                #NO.FUN-710026
      LET g_success='N' RETURN
   END IF

  ELSE
  UPDATE sfp_file SET sfpconf='Y' WHERE sfp01=l_tc_rva03
  select * INTO g_sfp_1.* FROM sfp_file WHERE sfp01=l_tc_rva03
  DELETE FROM sfq_file WHERE sfq01=l_tc_rva03
  DELETE FROM sfs_file WHERE sfs01=l_tc_rva03

  END IF

 INITIALIZE g_sfq_1.* TO NULL
  INITIALIZE g_sfs_1.* TO NULL

 LET  l_sql="SELECT  sfq02,sfq03,sfq04  FROM  sfq_file  WHERE sfq01='",l_ta_rva01,"' "
 PREPARE t110_p1_yt FROM l_sql
 DECLARE t110_c1_yt CURSOR FOR t110_p1_yt
  FOREACH t110_c1_yt INTO l_rvb34,g_sfq_1.sfq03,g_sfq_1.sfq04
  LET g_sfq_1.sfq01=g_sfp_1.sfp01
  LET g_sfq_1.sfq02=l_rvb34
  LET g_sfq_1.sfqplant=g_plant    #by lily add 20141013
  LET g_sfq_1.sfqlegal=g_legal    #by lily add 20141013
  LET g_sfq_1.sfq012=' '          #by lily add 20141013
  LET g_sfq_1.sfq014=' '          #by lily add 20141013


   SELECT max(sfa08) INTO g_sfq_1.sfq04 FROM sfa_file WHERE sfa01 = g_sfq_1.sfq02

  IF cl_null(g_sfq_1.sfq04) THEN LET g_sfq_1.sfq04 = ' ' END IF
  IF cl_null(g_sfq_1.sfq05) THEN LET g_sfq_1.sfq05 = g_today END IF

  INSERT INTO sfq_file VALUES(g_sfq_1.*)
        IF STATUS THEN
      CALL s_errmsg('sfq02',g_sfq_1.sfq02,'ins sfq:',STATUS,1)                 #NO.FUN-710026
       ROLLBACK WORK
      LET g_success='N'
      RETURN
       END IF

   END FOREACH

    LET l_subsql = "SELECT sfe_file.*  FROM   sfe_file ",
           " WHERE sfe02 = '",l_ta_rva01,"' ", " ORDER BY sfE28 "

  PREPARE t110_p2_yt FROM l_subsql
  DECLARE t110_c2_yt CURSOR FOR t110_p2_yt
   FOREACH t110_c2_yt INTO l_sfe.*
         LET g_sfs_1.sfs01=g_sfq_1.sfq01
         IF cl_null(g_sfs_1.sfs02) THEN LET g_sfs_1.sfs02=0 END IF
         LET g_sfs_1.sfs02=l_sfe.sfe28
         LET g_sfs_1.sfs03=l_sfe.sfe01
          LET g_sfs_1.sfs04=l_sfe.sfe07

           LET g_sfs_1.sfs05=l_sfe.sfe16                 #No:MOD-640013 add


         LET g_sfs_1.sfs06=l_sfe.sfe17

        SELECT rvb36,rvb37,rvb38 INTO g_sfs_1.sfs07,g_sfs_1.sfs08,g_sfs_1.sfs09  FROM rvb_file WHERE rvb01=g_rva.rva01 AND rvb34=l_sfe.sfe01


         LET g_sfs_1.sfs10=l_sfe.sfe14

                 SELECT  img10  INTO l_img10
                    FROM img_file   #採購單位,庫存數量,庫存單位
                   WHERE img01=g_sfs_1.sfs04 AND img02=g_sfs_1.sfs07
                     AND img03=g_sfs_1.sfs08 AND img04=g_sfs_1.sfs09

                  IF STATUS=100 AND (g_sfs_1.sfs07 IS NOT NULL AND g_sfs_1.sfs07 <> ' ') THEN
                     IF g_sma.sma892[3,3] ='Y' THEN
                        IF NOT cl_confirm('mfg1401') THEN
                        ROLLBACK WORK
                         LET g_success='N'
                         RETURN
                        END IF
                     END IF
                     CALL s_add_img(g_sfs_1.sfs04,g_sfs_1.sfs07,
                                    g_sfs_1.sfs08,g_sfs_1.sfs09,
                                    g_sfs_1.sfs01,g_sfs_1.sfs02,g_sfp_1.sfp02)

                  END IF
         LET g_sfs_1.sfsplant=g_plant    #by lily add 20141013
         LET g_sfs_1.sfslegal=g_legal    #by lily add 20141013
         LET g_sfs_1.sfs014=' '          #by lily add 20141013

         LET g_sfs_1.sfs27 = l_sfe.sfe27
         LET g_sfs_1.sfs012 = l_sfe.sfe012
         LET g_sfs_1.sfs013 = l_sfe.sfe013

         INSERT INTO sfs_file VALUES(g_sfs_1.*)
         IF SQLCA.SQLCODE THEN
           CALL cl_err('i sfs:',STATUS,1)  #No:FUN-660128
           CALL cl_err3("ins","sfs_file",g_sfs_1.sfs01,g_sfs_1.sfs02,STATUS,"","i sfs:",1)    #No:FUN-660128
           ROLLBACK WORK
           LET g_success='N'
           RETURN
        END IF

      END FOREACH

   COMMIT WORK

   CALL i501('2','6',g_sfp_1.sfp01,'SUB')
  SELECT  sfp04 INTO g_sfp_1.sfp04  FROM sfp_file WHERE sfp01=g_sfp_1.sfp01

  IF cl_null(g_sfp_1.sfp04) OR g_sfp_1.sfp04<>'Y' THEN
  LET g_success='N'
  RETURN
  END IF
  UPDATE rva_file SET  ta_rva03=g_sfp_1.sfp01 where rva01=l_rva01
    LET g_rva.ta_rva03=g_sfp_1.sfp01




 IF g_sfp_1.sfp06='6' THEN
   LET l_sql="asfi526 '",g_sfp_1.sfp01 CLIPPED ,"'"
 ELSE
   LET l_sql="asfi528 '",g_sfp_1.sfp01 CLIPPED ,"'"
 END IF
 CALL cl_cmdrun_wait(l_sql)


    DISPLAY BY NAME g_rva.ta_rva03

END FUNCTION

# BY CJY 101125 ADD 增加自動產生退料單end

FUNCTION t110_b_more()
  DEFINE  l_flag   LIKE type_file.chr1    #No.FUN-680136 VARCHAR(1)

   LET p_row = 7 LET p_col = 22
   OPEN WINDOW t110y_w AT p_row,p_col WITH FORM "apm/42f/apmt110_y"
      ATTRIBUTE (STYLE = g_win_style CLIPPED) #No:FUN-580092 HCN

    CALL cl_ui_locale("apmt110_y")


   SELECT rvb08,rvb12,rvb13,rvb17,rvb14,rvb16,rvb15
    INTO g_rvb2.rvb08,g_rvb2.rvb12,g_rvb2.rvb13,g_rvb2.rvb17,g_rvb2.rvb14,
         g_rvb2.rvb16,g_rvb2.rvb15
     FROM rvb_file
    WHERE rvb01=g_rva.rva01 AND rvb02=g_rvb[l_ac].rvb02
   IF status=100 THEN LET g_rvb2.rvb08=0   LET g_rvb2.rvb12=NULL
                      LET g_rvb2.rvb13=' ' LET g_rvb2.rvb17=NULL
                      LET g_rvb2.rvb14=' ' LET g_rvb2.rvb16=0
                      LET g_rvb2.rvb15=0
   END IF
   INPUT BY NAME g_rvb2.rvb08,g_rvb2.rvb12,g_rvb2.rvb13,g_rvb2.rvb17,
                 g_rvb2.rvb14,g_rvb2.rvb16,g_rvb2.rvb15
                 WITHOUT DEFAULTS

      AFTER FIELD rvb08                      #會計科目
         IF cl_null(g_rvb2.rvb08) THEN
            NEXT FIELD rvb08
         END IF

      AFTER FIELD rvb12       #應完成日
         IF cl_null(g_rvb2.rvb12) THEN
            NEXT FIELD rvb12
         END IF

      ON ACTION CONTROLZ
         CALL cl_show_req_fields()

      ON ACTION CONTROLG
         CALL cl_cmdask()

      AFTER INPUT
         IF INT_FLAG THEN                         # 若按了DEL鍵
            LET INT_FLAG = 0
            EXIT INPUT
         END IF
         LET l_flag = 'N'
         IF cl_null(g_rvb2.rvb08) THEN
            LET l_flag = 'Y'
            DISPLAY BY NAME g_rvb2.rvb08
         END IF
         IF cl_null(g_rvb2.rvb12) THEN
            LET l_flag = 'Y'
            DISPLAY BY NAME g_rvb2.rvb12
         END IF
         IF l_flag = 'Y' THEN
            CALL cl_err('','9033',0)
            NEXT FIELD pmn40
         END IF
      ON IDLE g_idle_seconds
         CONTINUE INPUT

   END INPUT

   UPDATE rvb_file
      SET rvb08 = g_rvb2.rvb08,
          rvb12 = g_rvb2.rvb12,
          rvb13 = g_rvb2.rvb13,
          rvb14 = g_rvb2.rvb14,
          rvb15 = g_rvb2.rvb15,
          rvb16 = g_rvb2.rvb16,
          rvb17 = g_rvb2.rvb17
    WHERE rvb01 = g_rva.rva01
      AND rvb02 = g_rvb[l_ac].rvb02

   CLOSE WINDOW t110y_w                 #結束畫面
   IF INT_FLAG THEN LET INT_FLAG=0 RETURN END IF

END FUNCTION

FUNCTION t110_rvb03(p_cmd,p_po,p_item)
   DEFINE
      p_cmd    LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(1)
      p_po     LIKE pmn_file.pmn01,
      l_pmn04  LIKE pmn_file.pmn04,
      l_no     LIKE ade_file.ade04,    #No.FUN-680136 VARCHAR(04)
      l_cnt    LIKE type_file.num5,    #No.FUN-680136 SMALLINT
      p_item   LIKE pmn_file.pmn02,
      l_pmn122 LIKE pmn_file.pmn122,
      l_pmn16  LIKE pmn_file.pmn16,
      l_pmn15  LIKE pmn_file.pmn15,
      l_pmn34  LIKE pmn_file.pmn34,
      l_pmn37  LIKE pmn_file.pmn37,
      l_pmn58  LIKE pmn_file.pmn58,
      l_pmn41  LIKE pmn_file.pmn41,
      l_pmn011 LIKE pmn_file.pmn011,
      l_pmn63  LIKE pmn_file.pmn63,
      l_pmh08  LIKE pmh_file.pmh08,
      l_sfb24  LIKE sfb_file.sfb24,
      l_date   LIKE pmn_file.pmn37,
      l_rvb07  LIKE rvb_file.rvb07,
      l_rvb07s LIKE rvb_file.rvb07,
      l_pmn52  LIKE pmn_file.pmn52,
      l_pmn54  LIKE pmn_file.pmn54,
      l_pmn56  LIKE pmn_file.pmn56,
      l_pmm22  LIKE pmm_file.pmm22,
      l_rvb25  LIKE rvb_file.rvb25,           #No:MOD-4B0275
      l_alt06,t_alt06 LIKE alt_file.alt06,    #MOD-680004 add
      l_msg    LIKE type_file.chr50,          #No.FUN-680136 VARCHAR(40)
      l_sw,l_sw1  LIKE type_file.chr1,        #No.FUN-680136 VARCHAR(01)
      #No.FUN-540027  --begin
      l_rvb80  LIKE rvb_file.rvb80,
      l_rvb81  LIKE rvb_file.rvb81,
      l_rvb82  LIKE rvb_file.rvb82,
      l_rvb83  LIKE rvb_file.rvb83,
      l_rvb84  LIKE rvb_file.rvb84,
      l_rvb85  LIKE rvb_file.rvb85,
      l_rvb86  LIKE rvb_file.rvb86,
      l_rvb87  LIKE rvb_file.rvb87
      #No.FUN-540027  --end

   LET g_errno = " "
   #No.FUN-540027  --begin
   SELECT pmn04,pmn07,pmn20,(pmn50-pmn55),pmn041,pmn16,pmn13,pmn011,
          pmn14,pmn15,pmn34,pmn37,pmn44,pmn09,pmn31,pmn31t,pmm42,pmn41,                 #No:FUN-550117
          pmn20-pmn50+pmn55,pmn63,pmn52,pmn54,pmn56,pmn122,pmn71,pmn65,#No.9893
          pmn80,pmn81,pmn82,pmn83,pmn84,pmn85,pmn86,pmn87,pmm21,pmm43,pmm22,gec07,   #No:FUN-550017  FUN-610018
          pmn930,pmn58  #FUN-670051 #add "pmn58" by lichaob 080728
     INTO g_rvb[l_ac].rvb05,g_rvb[l_ac].pmn07,g_rvb[l_ac].pmn20,
          g_rvb[l_ac].pmn50_55,g_rvb[l_ac].pmn041,l_pmn16,g_pmn13,l_pmn011,
          g_pmn14,l_pmn15,l_pmn34,l_pmn37,g_pmn44,g_pmn09,g_pmn31,g_pmn31t,g_pmm42,     #No:FUN-550117
          g_rvb[l_ac].rvb34,l_rvb07,l_pmn63,l_pmn52,l_pmn54,l_pmn56,l_pmn122,
           l_rvb25,g_rvb2.rvb19,  #No:8114        #No:MOD-4B0275
          l_rvb80,l_rvb81,l_rvb82,l_rvb83,l_rvb84,l_rvb85,l_rvb86,l_rvb87,
          g_rvb[l_ac].pmm21,g_rvb[l_ac].pmm43,l_pmm22,g_gec07,  #No:FUN-550117
          g_rvb[l_ac].rvb930,g_pmn58  #FUN-670051
      FROM pmn_file,pmm_file,OUTER gec_file    #No:FUN-550117
     WHERE pmn01 = p_po
       AND pmn02 = p_item
       AND pmn01=pmm01
       AND pmm18 <> 'X'
       AND pmm21 = gec_file.gec01       #No:FUN-550117
       AND gec011='1'   #MOD-740504

   CASE
      WHEN SQLCA.SQLCODE = 100
         LET g_errno = 'mfg3192'
         LET g_rvb[l_ac].pmn07 = NULL
         LET g_rvb[l_ac].pmn20 = NULL
         LET g_rvb[l_ac].pmn50_55 = NULL
         LET g_rvb[l_ac].pmn041= NULL
         #No.FUN-540027  --begin
         LET g_rvb[l_ac].rvb83 = NULL
         LET g_rvb[l_ac].rvb84 = NULL
         LET g_rvb[l_ac].rvb85 = NULL
         LET g_rvb[l_ac].rvb80 = NULL
         LET g_rvb[l_ac].rvb81 = NULL
         LET g_rvb[l_ac].rvb82 = NULL
         LET g_rvb[l_ac].rvb86 = NULL
         LET g_rvb[l_ac].rvb87 = NULL
         #No.FUN-540027  --end
      WHEN l_pmn16 != '2'
         LET g_errno = 'mfg3166'
      OTHERWISE
         LET g_errno = SQLCA.SQLCODE USING '-------'
    END CASE
    #add by mb 080811 bug modify pmn58
    IF cl_null(g_pmn58) THEN
       LET g_pmn58=0
    END IF
    #end
    IF g_sma.sma120 = 'Y' AND g_sma.sma907 = 'Y' THEN
       SELECT imx00,imx01,imx02,imx03,imx04,imx05,
              imx06,imx07,imx08,imx09,imx10
        INTO g_rvb[l_ac].att00, g_rvb[l_ac].att01, g_rvb[l_ac].att02,
             g_rvb[l_ac].att03, g_rvb[l_ac].att04, g_rvb[l_ac].att05,
             g_rvb[l_ac].att06, g_rvb[l_ac].att07, g_rvb[l_ac].att08,
             g_rvb[l_ac].att09, g_rvb[l_ac].att10
        FROM imx_file
         WHERE imx000 = g_rvb[l_ac].rvb05
       #賦值所有屬性
       LET g_rvb[l_ac].att01_c = g_rvb[l_ac].att01
       LET g_rvb[l_ac].att02_c = g_rvb[l_ac].att02
       LET g_rvb[l_ac].att03_c = g_rvb[l_ac].att03
       LET g_rvb[l_ac].att04_c = g_rvb[l_ac].att04
       LET g_rvb[l_ac].att05_c = g_rvb[l_ac].att05
       LET g_rvb[l_ac].att06_c = g_rvb[l_ac].att06
       LET g_rvb[l_ac].att07_c = g_rvb[l_ac].att07
       LET g_rvb[l_ac].att08_c = g_rvb[l_ac].att08
       LET g_rvb[l_ac].att09_c = g_rvb[l_ac].att09
       LET g_rvb[l_ac].att10_c = g_rvb[l_ac].att10
    END IF
    IF l_pmn011!=g_rva.rva10 THEN
       LET g_errno='apm-251'
       RETURN
    END IF

    IF l_pmn011='SUB' AND g_rva.rva04='Y' THEN
       LET g_errno='apm-249'
       RETURN
    END IF

    LET g_pmn50_55=g_rvb[l_ac].pmn50_55
    LET l_pmn04 =  g_rvb[l_ac].rvb05
    IF l_pmn15 = 'N' THEN
       IF cl_null(l_pmn37) THEN
          LET l_date = l_pmn34
       ELSE LET l_date = l_pmn37
       END IF
       IF g_rva.rva06 < l_date THEN LET g_errno = 'mfg3039' RETURN  END IF
    END IF
    IF p_cmd = 'a' THEN
       LET g_pmn20 = g_rvb[l_ac].pmn20
       LET l_rvb07s=0
       SELECT SUM(rvb07) INTO l_rvb07s FROM rva_file,rvb_file   #未確認也計入
        WHERE rva01=rvb01 AND rvb04=g_rvb[l_ac].rvb04
          AND rvb03=g_rvb[l_ac].rvb03 AND rvaconf='N' AND rvb35='N'
          AND rva02=g_rva.rva02    #2016-11-04 by dengyu
        # AND rva01 != g_rva.rva01   #No:TQC-5B0070
       IF cl_null(l_rvb07s) THEN LET l_rvb07s=0 END IF
       LET g_rvb[l_ac].rvb07=l_rvb07-l_rvb07s
        LET g_rvb[l_ac].rvb25 = l_rvb25        #No:MOD-4B0275
      #MOD-680004-begin-add
       #若為LC收貨，則須檢查數貨不可大於提單數量
       IF g_rva.rva04='Y' AND NOT cl_null(g_rvb[l_ac].rvb22) THEN
          SELECT alt06 INTO l_alt06 FROM alt_file
           WHERE alt01=g_rvb[l_ac].rvb22
             AND alt14=g_rvb[l_ac].rvb04
             AND alt15=g_rvb[l_ac].rvb03
          IF cl_null(l_alt06) THEN
             LET l_alt06 = 0
          END IF
          SELECT SUM(rvb07) INTO t_alt06 FROM rvb_file
           WHERE rvb22=g_rvb[l_ac].rvb22
             AND rvb04=g_rvb[l_ac].rvb04
             AND rvb03=g_rvb[l_ac].rvb03
             AND rvb01!=g_rva.rva01
             AND rvb35='N'
          IF cl_null(t_alt06) THEN
             LET t_alt06 = 0
          END IF
          LET g_rvb[l_ac].rvb07 = (l_alt06-t_alt06)
       END IF
      #MOD-680004-end-add
    END IF
    IF l_pmn63='Y' THEN              #急料
       CALL cl_getmsg('apm-253',g_lang) RETURNING g_msg
       MESSAGE g_msg
    END IF

    # 當為製程委外時不寫 tlf,不 update ima,img 所以可不key 倉庫
    LET l_ec_sw = 'N'
    IF g_argv2_2 ='SUB' THEN
       LET l_sfb24=''
       SELECT sfb24 INTO l_sfb24
         FROM sfb_file
        WHERE sfb01 = g_rvb[l_ac].rvb34
       IF l_sfb24 IS NOT NULL AND l_sfb24='Y' THEN
          LET l_ec_sw='Y'
       END IF
    END IF
    IF l_ec_sw='N' THEN
       IF cl_null(g_rvb[l_ac].rvb36) THEN LET g_rvb[l_ac].rvb36=l_pmn52 END IF
       IF cl_null(g_rvb[l_ac].rvb37) THEN LET g_rvb[l_ac].rvb37=l_pmn54 END IF
    END IF

    IF NOT cl_null(l_pmn122) THEN
       LET g_rvb[l_ac].rvb38=l_pmn122  #for專案代號->批號欄位
    ELSE
       IF cl_null(g_rvb[l_ac].rvb38) AND l_ec_sw='N' THEN   #No.B454
          LET g_rvb[l_ac].rvb38=l_pmn56
       END IF
    END IF
    IF cl_null(g_rvb[l_ac].rvb36) THEN
       SELECT pmm22 INTO l_pmm22 FROM pmm_file
        WHERE pmm01=g_rvb[l_ac].rvb04
       SELECT pmh08 INTO l_pmh08 FROM pmh_file
        WHERE pmh01=g_rvb[l_ac].rvb05 AND pmh02=g_rva.rva05
          AND pmh13=l_pmm22
       IF status THEN LET l_pmh08='N' END IF
      #IF l_pmh08='Y' AND g_rvb[l_ac].rvb05[1,4] !='MISC' AND l_ec_sw='N' THEN
        IF g_rvb[l_ac].rvb05[1,4] !='MISC' AND l_ec_sw='N' THEN   #No:MOD-580087
          SELECT ima35,ima36 INTO g_rvb[l_ac].rvb36,g_rvb[l_ac].rvb37
            FROM ima_file
           WHERE ima01=g_rvb[l_ac].rvb05
          IF cl_null(g_rvb[l_ac].rvb38) THEN LET g_rvb[l_ac].rvb38=' ' END IF  #TQC-810048 add
       END IF
    END IF
    IF g_rvb[l_ac].rvb05[1,4]='MISC' OR l_ec_sw='Y' THEN
       LET g_rvb2.rvb36=NULL LET g_rvb[l_ac].rvb36=NULL
       LET g_rvb2.rvb37=NULL LET g_rvb[l_ac].rvb37=NULL
       LET g_rvb2.rvb38=NULL LET g_rvb[l_ac].rvb38=NULL
    END IF

    SELECT ima021 INTO g_rvb[l_ac].ima021 FROM ima_file
     WHERE ima01=g_rvb[l_ac].rvb05
     #------MOD-5A0095 START----------
     DISPLAY BY NAME g_rvb[l_ac].rvb05
     DISPLAY BY NAME g_rvb[l_ac].pmn07
     DISPLAY BY NAME g_rvb[l_ac].pmn20
     DISPLAY BY NAME g_rvb[l_ac].pmn50_55
     DISPLAY BY NAME g_rvb[l_ac].pmn041
     DISPLAY BY NAME g_rvb[l_ac].rvb34
     DISPLAY BY NAME g_rvb[l_ac].rvb07
     DISPLAY BY NAME g_rvb[l_ac].rvb25
     DISPLAY BY NAME g_rvb[l_ac].rvb36
     DISPLAY BY NAME g_rvb[l_ac].rvb37
     DISPLAY BY NAME g_rvb[l_ac].rvb38
     DISPLAY BY NAME g_rvb[l_ac].ima021
     #------MOD-5A0095 END------------
     #FUN-670051...............begin
     CALL t110_set_rvb930(g_rvb[l_ac].rvb930) RETURNING g_rvb[l_ac].gem02a #FUN-670051
     LET g_rvb2.rvb930=g_rvb[l_ac].rvb930
     DISPLAY BY NAME g_rvb[l_ac].rvb930,g_rvb[l_ac].gem02a
     #FUN-670051...............end
     DISPLAY BY NAME
       g_rvb[l_ac].att01, g_rvb[l_ac].att01_c,
       g_rvb[l_ac].att02, g_rvb[l_ac].att02_c,
       g_rvb[l_ac].att03, g_rvb[l_ac].att03_c,
       g_rvb[l_ac].att04, g_rvb[l_ac].att04_c,
       g_rvb[l_ac].att05, g_rvb[l_ac].att05_c,
       g_rvb[l_ac].att06, g_rvb[l_ac].att06_c,
       g_rvb[l_ac].att07, g_rvb[l_ac].att07_c,
       g_rvb[l_ac].att08, g_rvb[l_ac].att08_c,
       g_rvb[l_ac].att09, g_rvb[l_ac].att09_c,
       g_rvb[l_ac].att10, g_rvb[l_ac].att10_c

  #------------No:TQC-6B0124 modify
   #IF g_sma.sma115 = 'Y' THEN
   #   IF p_cmd = 'a' OR g_rvb_t.rvb05 IS NULL OR
   #      g_rvb_t.rvb05 <> g_rvb[l_ac].rvb05 THEN
   #      LET g_rvb[l_ac].rvb80 = l_rvb80
   #      LET g_rvb[l_ac].rvb81 = l_rvb81
   #      LET g_rvb[l_ac].rvb82 = l_rvb82
   #      LET g_rvb[l_ac].rvb83 = l_rvb83
   #      LET g_rvb[l_ac].rvb84 = l_rvb84
   #      LET g_rvb[l_ac].rvb85 = l_rvb85
   #      LET g_rvb[l_ac].rvb86 = l_rvb86
   #      LET g_rvb[l_ac].rvb87 = l_rvb87
   #      IF l_rvb07s <> 0 THEN
   #         LET g_rvb[l_ac].rvb82=0
   #         LET g_rvb[l_ac].rvb85=0
   #         LET g_rvb[l_ac].rvb87=0
   #      END IF
   #   END IF
   #END IF

    IF p_cmd = 'a' OR g_rvb_t.rvb05 IS NULL OR
       g_rvb_t.rvb05 <> g_rvb[l_ac].rvb05 THEN

       IF g_sma.sma115 = 'Y' THEN
          LET g_rvb[l_ac].rvb80 = l_rvb80
          LET g_rvb[l_ac].rvb81 = l_rvb81
          LET g_rvb[l_ac].rvb82 = l_rvb82
          LET g_rvb[l_ac].rvb83 = l_rvb83
          LET g_rvb[l_ac].rvb84 = l_rvb84
          LET g_rvb[l_ac].rvb85 = l_rvb85
          IF l_rvb07s <> 0 THEN
             LET g_rvb[l_ac].rvb82=0
             LET g_rvb[l_ac].rvb85=0
          END IF
       END IF
          LET g_rvb[l_ac].rvb86 = l_rvb86
          LET g_rvb[l_ac].rvb87 = l_rvb87
          IF l_rvb07s <> 0 THEN
             LET g_rvb[l_ac].rvb87=0
          END IF
      #END IF   #TQC-770117 mark
      #TQC-770117-begin-mark
      # IF g_sma.sma116 MATCHES '[02]' THEN
      #    LET g_rvb[l_ac].rvb86 = NULL
      #    LET g_rvb[l_ac].rvb87 = 0
      # ELSE
      #TQC-770117-end-mark
          LET g_rvb[l_ac].rvb86 = l_rvb86
          LET g_rvb[l_ac].rvb87 = l_rvb87
          IF l_rvb07s <> 0 THEN
             LET g_rvb[l_ac].rvb87=0
          END IF
      #END IF   #TQC-770117 mark
    END IF
  #------------No:TQC-6B0124 end

    #No.FUN-540027  --end

    #No:FUN-550117
#No.FUN-610018
#   IF g_rvb[l_ac].gec07 = 'Y' THEN                 #No:FUN-560102
#      CALL cl_set_comp_visible("rvb10t,pmm21,pmm43,gec07",TRUE)
#   ELSE
#      CALL cl_set_comp_visible("rvb10t,pmm21,pmm43,gec07",FALSE)
#   END IF

    SELECT azi03 INTO t_azi03 FROM azi_file WHERE azi01 = l_pmm22   #No.CHI-6A0004
    #end No:FUN-550117
END FUNCTION

FUNCTION t110_b_fill(p_wc2)              #BODY FILL UP
   DEFINE p_wc2           LIKE type_file.chr1000 #No.FUN-680136 VARCHAR(200)
   DEFINE l_cnt           LIKE type_file.num5
   #No.FUN-540027  --begin
   LET g_sql = "SELECT rvb02,rvb22,rvb04,rvb03,rvb34,rvb05,",
               " '','','','','','','','','','','','','','','','','','','','','',",   #TQC-650108
               " pmn041,ima021,",
             #  " pmn07,pmn20,(pmn50-pmn55),rvb30,rvb29,rvb35,rvb07, ",#by lily modify 20141013
               " pmn07,pmn20,(pmn50-pmn55),rvb30,rvb29,rvb35,rvb07,'',",
               " rvb83,rvb84,rvb85,rvb80,rvb81,rvb82,rvb86,rvb87,",
               " rvb10,rvb10t,rvb36,rvb37,rvb38,rvb25,pmm21,pmm43,rvb930,''  ",     #No:FUN-550117  FUN-610018 #FUN-670051
               " FROM rvb_file,OUTER pmn_file,OUTER ima_file,OUTER pmm_file" ,
               " WHERE rvb01 ='",g_rva.rva01,"' ",
               "   AND rvb04 = pmn_file.pmn01 AND rvb03 = pmn_file.pmn02 ",
               "   AND rvb05=ima_file.ima01 AND ",p_wc2 CLIPPED,
               "   AND rvb04 = pmm_file.pmm01 ",            #No:FUN-550117
               " ORDER BY rvb02"   #No:MOD-5A0448

   #No.FUN-540027  --end
#genero mark
#  IF g_argv2_2 = 'SUB' THEN
#     LET g_sql = g_sql CLIPPED," AND rvb19 = '2'"," ORDER BY 1"
#  ELSE
#     LET g_sql = g_sql CLIPPED," AND rvb19 = '1'"," ORDER BY 1"
#  END IF

   PREPARE t110_pb FROM g_sql
   DISPLAY "G_SQL=",g_sql

   IF STATUS THEN CALL cl_err('prep:',STATUS,1) RETURN END IF
   DECLARE rvb_curs  CURSOR FOR t110_pb

    CALL g_rvb.clear() #MOD-4B0039

   LET g_cnt = 1
   LET g_rec_b = 0
   LET g_gec07 = 'N'       #No:FUN-550117
   FOREACH rvb_curs INTO g_rvb[g_cnt].*   #單身 ARRAY 填充
      IF STATUS THEN CALL cl_err('foreach:',STATUS,1) EXIT FOREACH END IF



      #TQC-650108
      #如果進行料件多屬性管理并選擇新機制則要對單身顯示的東東進行更改
      IF g_sma.sma120 = 'Y' AND g_sma.sma907 = 'Y' THEN
         #得到該料件對應的父料件和所有屬性
         SELECT imx00,imx01,imx02,imx03,imx04,imx05,imx06,
                imx07,imx08,imx09,imx10 INTO
                g_rvb[g_cnt].att00,g_rvb[g_cnt].att01,g_rvb[g_cnt].att02,
                g_rvb[g_cnt].att03,g_rvb[g_cnt].att04,g_rvb[g_cnt].att05,
                g_rvb[g_cnt].att06,g_rvb[g_cnt].att07,g_rvb[g_cnt].att08,
                g_rvb[g_cnt].att09,g_rvb[g_cnt].att10
         FROM imx_file WHERE imx000 = g_rvb[g_cnt].rvb05

         LET g_rvb[g_cnt].att01_c = g_rvb[g_cnt].att01
         LET g_rvb[g_cnt].att02_c = g_rvb[g_cnt].att02
         LET g_rvb[g_cnt].att03_c = g_rvb[g_cnt].att03
         LET g_rvb[g_cnt].att04_c = g_rvb[g_cnt].att04
         LET g_rvb[g_cnt].att05_c = g_rvb[g_cnt].att05
         LET g_rvb[g_cnt].att06_c = g_rvb[g_cnt].att06
         LET g_rvb[g_cnt].att07_c = g_rvb[g_cnt].att07
         LET g_rvb[g_cnt].att08_c = g_rvb[g_cnt].att08
         LET g_rvb[g_cnt].att09_c = g_rvb[g_cnt].att09
         LET g_rvb[g_cnt].att10_c = g_rvb[g_cnt].att10

      END IF
      #TQC-650108 --end
      #No.MOD-490173 mark
     #IF NOT cl_chk_act_auth() THEN LET g_rvb[g_cnt].rvb10=NULL END IF
      #No.FUN-540027  --begin
      IF cl_null(g_rvb[g_cnt].rvb83) THEN
         LET g_rvb[g_cnt].rvb84=NULL
         LET g_rvb[g_cnt].rvb85=NULL
      END IF
      IF cl_null(g_rvb[g_cnt].rvb80) THEN
         LET g_rvb[g_cnt].rvb81=NULL
         LET g_rvb[g_cnt].rvb82=NULL
      END IF
       IF cl_null(g_rvb[g_cnt].rvb86) THEN
         LET g_rvb[g_cnt].rvb87=NULL
      END IF
       #No.FUN-540027  --end
      CALL t110_set_rvb930(g_rvb[g_cnt].rvb930) RETURNING g_rvb[g_cnt].gem02a #FUN-670051
#No.FUN-610018      #No:FUN-550117
#     IF NOT cl_null(g_rvb[g_cnt].pmm21) THEN      #No:FUN-560102
#        SELECT gec07 INTO g_rvb[g_cnt].gec07 FROM gec_file
#         WHERE gec01 = g_rvb[g_cnt].pmm21
#        IF g_rvb[g_cnt].gec07 = 'Y' THEN LET g_gec07 = 'Y' END IF
#     END IF
      #end No:FUN-550117


      LET g_cnt = g_cnt + 1
      IF g_cnt > g_max_rec THEN
         CALL cl_err( '', 9035, 0 )
     EXIT FOREACH
      END IF
   END FOREACH
   CALL g_rvb.deleteElement(g_cnt)

   IF STATUS THEN CALL cl_err('foreach:',STATUS,1) END IF

   LET g_rec_b=g_cnt-1
   DISPLAY g_rec_b TO FORMONLY.cn2
   LET g_cnt = 0

   CALL t110_refresh_detail()   #TQC-650108

END FUNCTION

FUNCTION t110_bp(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1    #No.FUN-680136 VARCHAR(1)


   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   #FUN-680011---start---
   IF g_aza.aza64 matches '[ Nn]' OR g_aza.aza64 IS NULL THEN
      CALL cl_set_act_visible("trans_spc",FALSE)
      CALL cl_set_comp_visible("rvaspc",FALSE)
   END IF
   #FUN-680011---end---
   CALL cl_set_act_visible("accept,cancel", FALSE)
   DISPLAY ARRAY g_rvb TO s_rvb.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)

      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )

      BEFORE ROW
         LET l_ac = ARR_CURR()
      CALL cl_show_fld_cont()                   #No:FUN-550037 hmf

      #-------by lily add 20141013-----------
      ON ACTION page_list
         LET g_action_flag = "page_list"
         EXIT DISPLAY
      #---------by lily end-----------
      ON ACTION insert
         LET g_action_choice="insert"
         EXIT DISPLAY


      ON ACTION    rirunquery
         LET g_action_choice="rirunquery"
         EXIT DISPLAY
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY
      ON ACTION delete
         LET g_action_choice="delete"
         EXIT DISPLAY
############加入日潤確認按鈕start 100723##########
      ON ACTION  rirunconfirm
         LET g_action_choice="rirunconfirm"
         EXIT DISPLAY
      ON ACTION  rirunnoconfirm
         LET g_action_choice="rirunnoconfirm"
         EXIT DISPLAY
############加入日潤確認按鈕start end##########
    #@ON ACTION 勝瑞過賬
      ON ACTION sr_post
         LET g_action_choice="sr_post"
         EXIT DISPLAY

      ON ACTION modify
         LET g_action_choice="modify"
         EXIT DISPLAY




      ON ACTION first
         CALL t110_fetch('F')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
           ACCEPT DISPLAY                   #No:FUN-530067 HCN TEST


      ON ACTION previous
         CALL t110_fetch('P')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
    ACCEPT DISPLAY                   #No:FUN-530067 HCN TEST


      ON ACTION jump
         CALL t110_fetch('/')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
    ACCEPT DISPLAY                   #No:FUN-530067 HCN TEST


      ON ACTION next
         CALL t110_fetch('N')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
    ACCEPT DISPLAY                   #No:FUN-530067 HCN TEST


      ON ACTION last
         CALL t110_fetch('L')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
    ACCEPT DISPLAY                   #No:FUN-530067 HCN TEST


      ON ACTION detail
         LET g_action_choice="detail"
         LET l_ac = 1
         EXIT DISPLAY
      ON ACTION output
         LET g_action_choice="output"
         EXIT DISPLAY
      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()                   #No:FUN-550037 hmf
         CALL t110_mu_ui()   #TQC-710032
         #No:FUN-6C0055 --start--
         IF g_aza.aza71 MATCHES '[Yy]' THEN
            CALL aws_gpmcli_toolbar()
            CALL cl_set_act_visible("gpm_show,gpm_query", TRUE)
         ELSE
            CALL cl_set_act_visible("gpm_show,gpm_query", FALSE)  #N0.TQC-710042
         END IF
         #No:FUN-6C0055 --end--
         #CKP
         IF g_rva.rvaconf='X' THEN LET g_chr='Y' ELSE LET g_chr='N' END IF
         CALL cl_set_field_pic(g_rva.rvaconf,"","","",g_chr,"")

      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ##########################################################################
      # Special 4ad ACTION
      ##########################################################################
      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY
#@    ON ACTION 補登發票
      ON ACTION add_invoice
         LET g_action_choice="add_invoice"
         EXIT DISPLAY
#@    ON ACTION 作廢
      ON ACTION void
         LET g_action_choice="void"
         EXIT DISPLAY
#@    ON ACTION 確認
      ON ACTION confirm
         LET g_action_choice="confirm"
         EXIT DISPLAY
#@    ON ACTION 取消確認
      ON ACTION undo_confirm
         LET g_action_choice="undo_confirm"
         EXIT DISPLAY
#@    ON ACTION 檢驗狀況
      ON ACTION qc_status
         LET g_action_choice="qc_status"
         EXIT DISPLAY
#@    ON ACTION 產生入庫/驗退
      ON ACTION generate_st_in_qc_return
         LET g_action_choice="generate_st_in_qc_return"
         EXIT DISPLAY
# by  cjy 09/01/08
#     ON ACTION generate_sfs
#         LET g_action_choice="generate_sfs"
 #        EXIT DISPLAY
#@    ON ACTION 查詢入庫
      ON ACTION qry_st_in
         LET g_action_choice="qry_st_in"
         EXIT DISPLAY
#@    ON ACTION 查詢驗退
      ON ACTION qry_qc_return
         LET g_action_choice="qry_qc_return"
         EXIT DISPLAY
#@    ON ACTION 驗收狀況
      ON ACTION receiving
         LET g_action_choice="receiving"
         EXIT DISPLAY

#@    ON ACTION 查詢發料          # steven_yue add  20110130
      ON ACTION qry_st_dev
         LET g_action_choice="qry_st_dev"
         EXIT DISPLAY

#@    ON ACTION 查詢退料          # steven_yue add  20101208
      ON ACTION qry_st_out
         LET g_action_choice="qry_st_out"
         EXIT DISPLAY

#@    ON ACTION 查詢退料          # steven_yue add  20101208
      ON ACTION callina4
         LET g_action_choice="callina4"
         EXIT DISPLAY


#@    ON ACTION 拋轉至SPC
      ON ACTION trans_spc                      #FUN-680011
         LET g_action_choice="trans_spc"
         EXIT DISPLAY

      ON ACTION accept
         LET g_action_choice="detail"
         LET l_ac = ARR_CURR()
         EXIT DISPLAY

      ON ACTION cancel
             LET INT_FLAG=FALSE         #MOD-570244 mars
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121


      ON ACTION exporttoexcel       #FUN-4B0025
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY

      # No:FUN-530067 --start--
      AFTER DISPLAY
         CONTINUE DISPLAY
      # No:FUN-530067 ---end---

      ON ACTION controls                           #No.FUN-6B0032
         CALL cl_set_head_visible("","AUTO")       #No.FUN-6B0032

      ON ACTION related_document                #No:FUN-6A0162  相關文件
         LET g_action_choice="related_document"
         EXIT DISPLAY

      #No:FUN-6C0055 --start--
      ON ACTION gpm_show
         LET g_action_choice="gpm_show"
         EXIT DISPLAY

      ON ACTION gpm_query
         LET g_action_choice="gpm_query"
         EXIT DISPLAY
      #No:FUN-6C0055 --end--

   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)

END FUNCTION


FUNCTION t110_log(p_stdc,p_reason,p_rvb,
                  p_pmn011,p_pmn07,p_pmn40,p_ima86,p_pmn122)
   DEFINE
      p_stdc          LIKE type_file.num5,        #No.FUN-680136 SMALLINT #是否需取得標準成本
      p_reason        LIKE type_file.num5,        #No.FUN-680136 SMALLINT #是否需取得異動原因
      p_code          LIKE type_file.chr4,          #No.FUN-680136 VARCHAR(04)
      p_qty           LIKE img_file.img10,        #No.FUN-680136 DECIMAL(13,3) #異動數量
      p_rvb           RECORD LIKE rvb_file.*,
      p_pmn011        LIKE pmn_file.pmn011,
      p_pmn40         LIKE pmn_file.pmn40,        #會計科目
      p_pmn07         LIKE pmn_file.pmn07,
      p_ima86         LIKE ima_file.ima86,        #成本單位
      p_pmn122        LIKE pmn_file.pmn122,       #專案號碼
      p_ac,l_sta      LIKE type_file.num5,        #No.FUN-680136 SMALLINT
      x_sfb24         LIKE sfb_file.sfb24,  #MOD-790007 add
      l_pmn65         LIKE pmn_file.pmn65         #No:7692
  #----------------No:TQC-750014 add
   DEFINE
        l_img09       LIKE img_file.img01,
        l_pmn09       LIKE pmn_file.pmn09,
        l_cnt         LIKE type_file.num5
  #----------------No:TQC-750014 end

   IF cl_null(g_pmn09) OR g_pmn09 = 0 THEN
      LET g_pmn09 = 1
   END IF
  #----------------No:TQC-750014 add
  #MOD-790007-begin-add
   LET l_ec_sw = 'N'
   IF g_argv2_2 ='SUB' THEN
      LET x_sfb24=''
      SELECT sfb24 INTO x_sfb24
        FROM sfb_file
       WHERE sfb01 = p_rvb.rvb34
      IF x_sfb24 IS NOT NULL AND x_sfb24='Y' THEN
         LET l_ec_sw='Y'
      END IF
   END IF
#CHI-7A0003-modify
# IF NOT cl_null(p_rvb.rvb36)  AND l_ec_sw='N' AND g_sma.sma886[7,7] = 'Y' THEN
  IF NOT cl_null(p_rvb.rvb36)  AND l_ec_sw='N' THEN
#CHI-7A0003-modify-end
  #MOD-790007-end-add
    SELECT img09 INTO l_img09 FROM img_file
          WHERE img01 = p_rvb.rvb05 AND img02 = p_rvb.rvb36
            AND img03 = p_rvb.rvb37 AND img04 = p_rvb.rvb38

    CALL s_umfchk(p_rvb.rvb05,p_pmn07,l_img09)
              RETURNING l_cnt,l_pmn09
    IF l_cnt = 1 THEN
       CALL cl_err(p_rvb.rvb05,'mfg3075',1)
       LET l_pmn09 = g_pmn09
    END IF
  END IF  #MOD-790007 add
  #----------------No:TQC-750014 end
   LET g_tlf.tlf01=p_rvb.rvb05          #異動料件編號
   CASE p_pmn011
      WHEN 'REG ' LET g_tlf.tlf02=11    #資料來源
      WHEN 'EXP ' LET g_tlf.tlf02=14
      WHEN 'CAP ' LET g_tlf.tlf02=16
      WHEN 'SUB '
           #No:7692
           SELECT pmn65 INTO l_pmn65
             FROM pmn_file
            WHERE pmn01 = p_rvb.rvb04
              AND pmn02 = p_rvb.rvb03
           IF l_pmn65 = '2' THEN
               LET g_tlf.tlf02=18      #委外代買
           ELSE
               LET g_tlf.tlf02=60
           END IF
           #No:7692(end)
      OTHERWISE LET g_tlf.tlf02 = 10
   END CASE
   LET g_tlf.tlf020=g_plant             #工廠編號
   LET g_tlf.tlf021=''                  #倉庫別
   LET g_tlf.tlf022=''                  #儲位別
   LET g_tlf.tlf023=''
   LET g_tlf.tlf024=''
   LET g_tlf.tlf025=''
   IF p_pmn011='SUB' THEN
      LET g_tlf.tlf026=p_rvb.rvb34
      LET g_tlf.tlf027=p_rvb.rvb03
      LET g_tlf.tlf03=25                 #F.Q.C.
      LET g_tlf.tlf13='asft6001'            #異動命令代號
   ELSE
      LET g_tlf.tlf026=p_rvb.rvb04        #單據編號(採購單)
      LET g_tlf.tlf027=p_rvb.rvb03        #項次(採購項次)
      LET g_tlf.tlf03 =20                  #資料目的為檢驗區
      LET g_tlf.tlf13='apmt1101'           #異動命令代號
   END IF
   LET g_tlf.tlf030=g_plant             #工廠編號
   LET g_tlf.tlf031=p_rvb.rvb36         #倉庫別
   LET g_tlf.tlf032=p_rvb.rvb37         #儲位別
   LET g_tlf.tlf033=p_rvb.rvb38         #入庫批號
   LET g_tlf.tlf034=''                  #庫存數量
   LET g_tlf.tlf035=''                  #異動後庫存單位
   LET g_tlf.tlf036=p_rvb.rvb01         #驗收單單據編號
   LET g_tlf.tlf037=p_rvb.rvb02         #單據項次
   LET g_tlf.tlf04=''                   #工作中心
   LET g_tlf.tlf05=' '                  #作業編號
   LET g_tlf.tlf06=g_rva.rva06          #異動日期=驗收單之收貨日期
   LET g_tlf.tlf07=g_today              #異動數量=驗收單之實收數量
   LET g_tlf.tlf08=TIME                 #異動資料產生時:分:秒
   LET g_tlf.tlf09=g_user               #產生人
   LET g_tlf.tlf10=p_rvb.rvb07          #異動數量=驗收單之實收數量
   LET g_tlf.tlf11=p_pmn07              #異動單位=採購單位
  #---------No:TQC-750014 modify
  #LET g_tlf.tlf12=g_pmn09              #收料單位/料件庫存轉換率
   LET g_tlf.tlf12=l_pmn09              #收料單位/料件庫存轉換率
  #---------No:TQC-750014 end
   LET g_tlf.tlf14=' '                  #異動原因代碼
   LET g_tlf.tlf17=''                   #非庫存性料件編號
   CALL s_imaQOH(p_rvb.rvb05) RETURNING g_tlf.tlf18 #異動後總庫存量
   LET g_tlf.tlf19=g_rva.rva05          #廠商編號
   LET g_tlf.tlf20=p_pmn122             #專案號碼
   LET g_tlf.tlf61=p_ima86              #成本單位
   LET g_tlf.tlf62=p_rvb.rvb04          #單據編號(採購單)
   LET g_tlf.tlf63=p_rvb.rvb03          #項次(採購項次)
   LET g_tlf.tlf64=p_rvb.rvb25          #手冊 no.A050
   LET g_tlf.tlf930=p_rvb.rvb930        #成本中心 #FUN-670051
   CALL s_tlf(p_stdc,p_reason)

END FUNCTION

FUNCTION t110_x()
    DEFINE  l_rvb22      LIKE rvb_file.rvb22   #No:MOD-580086
    DEFINE  l_dbs        LIKE azp_file.azp03  #DB
    DEFINE  l_sql        STRING
    DEFINE  l_cnt        LIKE type_file.num5

   IF s_shut(0) THEN RETURN END IF
   SELECT * INTO g_rva.* FROM rva_file WHERE rva01=g_rva.rva01
   IF g_rva.rva01 IS NULL THEN CALL cl_err('',-400,0) RETURN END IF
   IF g_rva.rvaconf = 'Y' THEN CALL cl_err('',9023,0) RETURN END IF
   IF g_rva.ta_rva02 = 'Y' THEN CALL cl_err('','cpm-005',0) RETURN END IF  # 日潤已確認，不可作廢
########add by endy 160126 单身有资料不可作废 start ###################
   SELECT COUNT(1) INTO l_cnt FROM rvb_file WHERE rvb01 = g_rva.rva01
   IF l_cnt > 0 THEN
      CALL cl_err('','aap-328',1)
      RETURN
   END IF
########add by endy 160126 单身有资料不可作废 end #####################
#######add by endy 20150513 如果是集团内交易，出貨單已過帳，则不允许作废 start ########
   SELECT tc_szp03 INTO l_dbs FROM tc_szp_file WHERE tc_szp01 = g_rva.rva05
   IF NOT cl_null(l_dbs) AND NOT cl_null(g_rva.rva07) THEN
      LET l_sql = "SELECT * FROM ",l_dbs CLIPPED,".oga_file WHERE ogapost = 'Y' AND oga01 = ? "
      PREPARE t100_oga_pre FROM l_sql
      EXECUTE t100_oga_pre USING g_rva.rva07
      IF NOT SQLCA.sqlcode THEN
         CALL cl_err('','cpm-077',0)
         RETURN
      END IF
   END IF
#######add by endy 20150513 如果是集团内交易，出貨單已過帳，则不允许作废 end #########
   BEGIN WORK
   LET g_success='Y'
   OPEN t110_cl USING g_rva_rowid
   IF STATUS THEN
      CALL cl_err("OPEN t110_cl:", STATUS, 1)
      CLOSE t110_cl
      ROLLBACK WORK
      RETURN
   END IF
   FETCH t110_cl INTO g_rva.*          #鎖住將被更改或取消的資料
   IF SQLCA.sqlcode THEN
      CALL cl_err(g_rva.rva01,SQLCA.sqlcode,0)      #資料被他人LOCK
      CLOSE t110_cl
      ROLLBACK WORK
      RETURN
   END IF
   IF cl_void(0,0,g_rva.rvaconf) THEN
      LET g_chr=g_rva.rvaconf
      IF g_rva.rvaconf ='N' THEN
         LET g_rva.rvaconf='X'
      ELSE
         LET g_rva.rvaconf='N'
      END IF
      UPDATE rva_file SET rvaconf = g_rva.rvaconf,
                          rvamodu = g_user,
                          rvadate = TODAY
       WHERE rva01 = g_rva.rva01
      IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
#        CALL cl_err('upd rvaconf:',STATUS,1)  #No.FUN-660129
         CALL cl_err3("upd","rva_file",g_rva.rva01,"",STATUS,"","upd rvaconf:",1) #No.FUN-660129
         LET g_success='N'
       #-----No:MOD-580086-----
      ELSE
         DECLARE rvb22_curx CURSOR FOR
          SELECT UNIQUE rvb22
            FROM rvb_file
           WHERE rvb01 = g_rva.rva01

         CALL s_showmsg_init()        #No.FUN-710030
         FOREACH rvb22_curx INTO l_rvb22
#No.FUN-710030 -- begin --
            IF g_success="N" THEN
               LET g_totsuccess="N"
               LET g_success="Y"
            END IF
#No.FUN-710030 -- end --
            SELECT COUNT(*) INTO g_cnt
              FROM rvb_file
             WHERE rvb22 = l_rvb22
               AND rvb01 <> g_rva.rva01
            IF g_cnt = 0 THEN
               DELETE FROM rvw_file
                WHERE rvw01 = l_rvb22
               IF SQLCA.sqlcode THEN
#                 CALL cl_err('DEL rvw_filee err!',SQLCA.SQLCODE,0) #No.FUN-660129
#No.FUN-710030 -- begin --
#                  CALL cl_err3("del","rvw_file",l_rvb22,"",SQLCA.SQLCODE,"","DEL rvw_file err!",1) #No.FUN-660129
                  IF g_bgerr THEN
                     CALL s_errmsg("rvw01",l_rvb22,"DEL rvw_filee err!",SQLCA.sqlcode,1)
                  ELSE
                     CALL cl_err3("del","rvw_file",l_rvb22,"",SQLCA.SQLCODE,"","DEL rvw_file err!",1)
                  END IF
#No.FUN-710030 -- end --
                  LET g_success ="N"
               END IF
            END IF
         END FOREACH
#No.FUN-710030 -- begin --
         IF g_totsuccess="N" THEN
            LET g_success="N"
         END IF
#No.FUN-710030 -- end --

       #-----No:MOD-580086-----
      END IF
   END IF
   CLOSE t110_cl
   CALL s_showmsg()       #No.FUN-710030
   IF g_success='Y' THEN
      COMMIT WORK
      CALL cl_flow_notify(g_rva.rva01,'V')
   ELSE
      ROLLBACK WORK
   END IF
   SELECT rvaconf INTO g_rva.rvaconf FROM rva_file WHERE rva01 = g_rva.rva01
   DISPLAY BY NAME g_rva.rvaconf
   #CKP
   IF g_rva.rvaconf='X' THEN LET g_chr='Y' ELSE LET g_chr='N' END IF
   CALL cl_set_field_pic(g_rva.rvaconf,"","","",g_chr,"")

END FUNCTION

FUNCTION t110_y()     #確認
   DEFINE l_code   LIKE type_file.num5,     #No.FUN-680136 SMALLINT
          l_msg    LIKE type_file.chr50     #No.FUN-680136 VARCHAR(12)
   DEFINE l_cnt,l_cnt1,l_cnt2,l_smycount    LIKE type_file.num5      #No.FUN-680136 SMALLINT
   #No.TQC-7C0086 --start--
   DEFINE l_sql    LIKE type_file.chr1000,
          l_t1    LIKE smy_file.smyslip

   DEFINE l_rvb22  LIKE rvb_file.rvb22
   DEFINE l_als05  LIKE als_file.als05
   DEFINE l_als21  LIKE als_file.als21
   DEFINE l_rvb34 LIKE rvb_file.rvb34,
          l_rvb07 LIKE rvb_file.rvb07,
          l_rvb02 LIKE rvb_file.rvb02,
          l_rvb05 LIKE rvb_file.rvb05,
          l_sfb39 LIKE sfb_file.sfb39,
          l_sfb05 LIKE sfb_file.sfb05
   #No.TQC-7C0086 --end--
  DEFINE l_ina01   LIKE ina_file.ina01
  DEFINE l_sfb01   LIKE sfb_file.sfb01
  DEFINE l_plant   LIKE azp_file.azp01

DEFINE l_ima06     LIKE ima_file.ima06
DEFINE l_ta_azf08  LIKE azf_file.ta_azf08
DEFINE l_rvb36     LIKE rvb_file.rvb36
DEFINE l_imd09     LIKE imd_file.imd09
DEFINE l_ta_rva06  LIKE rva_file.ta_rva06
DEFINE l_ta_rva09  LIKE rva_file.ta_rva09
DEFINE l_ta_ima001 LIKE ima_file.ta_ima001  #2016-11-04 by dengyu
DEFINE l_ta        LIKE pmn_file.pmn20      #2016-11-04 by dengyu
DEFINE l_th        INTEGER                  #2016-11-04 by dengyu
DEFINE l_rvb07s    LIKE rvb_file.rvb07      #2016-11-04 by dengyu
   IF cl_null(g_rva.rva01) THEN RETURN END IF
   SELECT * INTO g_rva.* FROM rva_file WHERE rva01=g_rva.rva01
   IF g_rva.rvaconf = 'Y' THEN CALL cl_err('',9023,0) RETURN END IF
   IF g_rva.rvaconf = 'X' THEN CALL cl_err('',9024,0) RETURN END IF
#by stevie 14/11/25 ---start---
  LET g_smyslip = g_rva.rva01[1,3]
  SELECT ta_smy01 INTO g_ta_smy01 FROM smy_file WHERE smyslip=g_smyslip
  IF g_coz01 = "Y" AND g_ta_smy01 = "1" THEN
   IF g_rva.ta_rva19 IS NULL THEN
    #LET g_success = 'N'
    CALL cl_err('缺少委外申請表號','!',1)
    RETURN
   END IF
   SELECT count(*) INTO l_cnt FROM tc_cna_file WHERE tc_cna01 = g_rva.ta_rva19 AND (tc_cnaacti = 'N' OR tc_cnaconf = 'N')
   IF l_cnt > 0 THEN
    #LET g_success = 'N'
    CALL cl_err('委外申请表号未確認或已失效','!',1)
    RETURN
   END IF
  END IF
############2016-11-04 by dengyu
            SELECT (pmn20-pmn50+pmn55) INTO l_th FROM pmn_file WHERE pmn01 = g_rva.rva02  AND pmn16='2'

   {         SELECT SUM(rvb07)  INTO l_rvb07s FROM rva_file,rvb_file
               WHERE rvb04=g_rvb[l_ac].rvb04 AND rvb03=g_rvb[l_ac].rvb03
               AND rva01=rvb01 AND rvaconf='N' AND rvb35='N'
               AND rva02=g_rva.rva02

            IF cl_null(l_rvb07s) THEN LET l_rvb07s=0 END IF

            SELECT ta_ima001 INTO l_ta_ima001 FROM ima_file WHERE ima01=g_rvb[l_ac].rvb05

            IF cl_null(l_ta_ima001) THEN LET l_ta_ima001=0 END IF
            LET l_ta=g_rvb[l_ac].pmn20 * l_ta_ima001 /100
            LET l_th=l_th-l_rvb07s + l_ta
}
            IF g_rvb[l_ac].rvb07 >l_th THEN
               #實收數量為零的資料不用再產生
               CALL cl_err('收货数量大于采购量','aaz-200',1)   #2016-11-04 by dengyu
               RETURN
            END IF
###########
#by stevie 14/11/25 ---end---

#by stevie ---start---141212
       FOR l_cnt2=1 TO g_rvb.getLength()
            IF NOT cs_check_item_type(g_rva.rva01[1,3],g_rvb[l_cnt2].rvb05) THEN  #單頭保稅否管控
                LET g_msg='料件與單別保稅信息不符，請核對'
                CALL cl_err(g_msg,'!',1)
                RETURN

            END IF
       END FOR
#by stevie ---end---
   SELECT COUNT(*) INTO g_cnt FROM rvb_file WHERE rvb01=g_rva.rva01
   IF g_cnt > g_sma.sma110 THEN
      CALL cl_err('','axm-156',0)
      RETURN
   END IF

   #---BUGNO:7379---無單身資料不可確認
   LET l_cnt=0
   SELECT COUNT(*) INTO l_cnt
     FROM rvb_file
    WHERE rvb01=g_rva.rva01
   IF l_cnt=0 OR l_cnt IS NULL THEN
      CALL cl_err('','mfg-009',0)
      RETURN
   END IF
   #---BUGNO:7379 END---------------
   LET l_cnt=0
   SELECT MAX(COUNT(1)) INTO l_cnt FROM rvb_file WHERE rvb01 = g_rva.rva01 GROUP BY rvb34
   IF l_cnt > 1 THEN
      CALL cl_err('','cpm-912',1)
      RETURN
   END IF


   IF g_argv5<>'1' THEN  #FUN-840012
      #No.TQC-7C0086 --start--
      IF g_sma.sma41 = 'Y' AND g_rva.rva04='Y' THEN
         LET l_sql = "SELECT rvb22 FROM rvb_file",
                     " WHERE rvb01 = '",g_rva.rva01,"'"
         PREPARE t110_rvb_pre FROM l_sql
         DECLARE t110_rvb_cs CURSOR FOR t110_rvb_pre
         FOREACH t110_rvb_cs INTO l_rvb22
            SELECT als05,als21 INTO l_als05,l_als21 FROM als_file
             WHERE als01=l_rvb22
            IF SQLCA.sqlcode=100 THEN
               CALL cl_err3("sel","als_file",g_rvb[l_ac].rvb22,"","aap-762","","",1)
               RETURN
            END IF
            IF l_als05 <> g_rva.rva05 THEN
               CALL cl_err('','apm-303',0)
               RETURN
            END IF
         END FOREACH
      END IF
      #No.TQC-7C0086 --end--
      IF NOT cl_confirm('axm-108') THEN RETURN END IF
   END IF
   LET g_success = 'Y'
         # by cjy 090724 控制防止計價數量與退貨數量不一致的情況
   LET l_cnt1=0
   SELECT COUNT(*) INTO l_cnt1 FROM rvb_file WHERE rvb01=g_rva.rva01 and rvb07<>rvb87
   IF l_cnt1>0 THEN
      CALL cl_err('','cxm-015',0)
      LET g_success = 'N'   #FUN-580113
        RETURN
   END IF



 #130418#############aooi312設置是否只能入成本倉或非成本倉
   DECLARE t110_azf_cs CURSOR FOR
   SELECT imz12,rvb36 FROM rvb_file,ima_file,imz_file
    WHERE ima01 = rvb05
      AND ima06 = imz01
      AND rvb01 = g_rva.rva01
   FOREACH t110_azf_cs INTO l_ima06,l_rvb36
     LET l_ta_azf08 = NULL
     SELECT ta_azf08 INTO l_ta_azf08 FROM azf_file
      WHERE azf01 = l_ima06
        AND azf02 = 'G'

     LET l_imd09 = NULL
     SELECT imd09 INTO l_imd09 FROM imd_file WHERE imd01 = l_rvb36

     IF l_ta_azf08 = '1' THEN
        IF l_imd09 !='Y' THEN
           LET g_msg = "料件成本分群",l_ima06 CLIPPED,"只能錄入成本倉!"
           CALL cl_err(g_msg,'!',1)
           LET g_success = 'N'
           RETURN
        END IF
     END IF
     IF l_ta_azf08 = '2' THEN
        IF l_imd09 !='N' THEN
           LET g_msg = "料件成本分群",l_ima06 CLIPPED,"只能錄入非成本倉!"
           CALL cl_err(g_msg,'!',1)
           LET g_success = 'N'
           RETURN
        END IF
     END IF
   END FOREACH

    LET l_cnt = 0
    SELECT COUNT(*) INTO l_cnt FROM rvb_file WHERE rvb01 = g_rva.rva01
    IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF

    LET l_cnt1 = 0
    SELECT COUNT(*) INTO l_cnt1 FROM pmm_file,rvb_file
      WHERE pmm01=rvb04
        AND ta_pmm07 IS NOT NULL
        AND ta_pmm08 = 'Y'
        AND rvb01 = g_rva.rva01
    IF cl_null(l_cnt1) THEN LET l_cnt1 = 0 END IF

    IF (l_cnt != l_cnt1) AND l_cnt1 > 0  THEN
       LET g_msg = "集團交易送貨地點不統一，請確認!"
       CALL cl_err(g_msg,'!',1)
       LET g_success = 'N'
       RETURN
    END IF

    IF l_cnt1 > 0 THEN
       LET l_sql = " SELECT  DISTINCT ta_pmm08,ta_pmm07 FROM pmm_file,rvb_file ",
                "   WHERE rvb04 = pmm01 ",
                "     AND rvb01 = '",g_rva.rva01,"'"

       PREPARE t110_pmm_pp1 FROM l_sql
       DECLARE t110_pmm_cc1 CURSOR FOR t110_pmm_pp1
       LET l_cnt = 0
       LET l_ta_rva06 = NULL
       LET l_ta_rva09 = NULL
       FOREACH t110_pmm_cc1 INTO l_ta_rva06,l_ta_rva09
        LET l_cnt = l_cnt + 1
       END FOREACH
       IF l_cnt > 1 THEN
          LET g_msg = "集團交易送貨地點不統一，請確認!"
          CALL cl_err(g_msg,'!',1)
          LET g_success = 'N'
          RETURN
       END IF
    END IF
   { IF NOT cl_null(l_ta_rva06) AND NOT cl_null(l_ta_rva09) THEN
       LET g_rva.ta_rva06 = l_ta_rva06
       LET g_rva.ta_rva09 = l_ta_rva09
       UPDATE rva_file SET ta_rva06 = l_ta_rva06,ta_rva09 = l_ta_rva09
        WHERE rva01 = g_rva.rva01

       DISPLAY BY NAME g_rva.ta_rva06,g_rva.ta_rva09
    END IF}

   LET l_plant = g_rva.rva05
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM tc_szp_file WHERE tc_szp01 = l_plant
   IF l_cnt >0 THEN
      CALL t110_shr()
      IF g_success = 'N' THEN RETURN END IF
   END IF

   LET l_cnt1=0
    # by cjy 090724 控制防止計價數量與退貨數量不一致的情況
    # BY CJY 09/01/08 START
   SELECT  COUNT(*) INTO g_cnt  FROM SFP_FILE WHERE sfp08=g_rva.rva01 AND sfp06 in ( 1,2,3,4 ) AND sfp04='Y'
   IF cl_null(g_cnt) THEN LET g_cnt=0 END IF
   IF g_cnt=0 THEN
    CALL t110_sfs()
    IF g_success='N' THEN RETURN  END IF
   ELSE
      SELECT sfp01 INTO g_rva.ta_rva01 FROM SFP_FILE WHERE sfp08=g_rva.rva01 AND sfp06 in ( 1,2,3,4 ) AND sfp04='Y' #add by endy 150825 如果發料單已过帐，則更新收貨單上的發料單號
      UPDATE rva_file SET ta_rva01 = g_rva.ta_rva01 WHERE rva01 = g_rva.rva01
   END IF
   DECLARE rvb34_cs CURSOR FOR
   SELECT DISTINCT rvb34 FROM rvb_file WHERE rvb01 = g_rva.rva01
   FOREACH rvb34_cs INTO l_sfb01
   LET l_cnt1=0
   # 確保委外收貨單與系統自動產生的發料單之 采購單號 保持一致
   SELECT count(*) INTO l_cnt1  FROM SFE_FILE WHERE SFE01=l_sfb01 AND sfe02=g_rva.ta_rva01
   IF l_cnt1=0 THEN
       CALL cl_err(g_rva.rva02,'apm1019',1)
   LET g_success='N'
    RETURN
   END IF
   END FOREACH



# BY CJY 09/01/08 END

     LET l_sql = "SELECT rvb34,rvb07,rvb05,rvb02 FROM rvb_file",
                     " WHERE rvb01 = '",g_rva.rva01,"'"
         PREPARE t110_rvbs_min FROM l_sql
         DECLARE t110_rvb_min CURSOR FOR t110_rvbs_min
         FOREACH t110_rvb_min INTO l_rvb34,l_rvb07,l_rvb05,l_rvb02
          SELECT sfb05,sfb39  INTO l_sfb05,l_sfb39 FROM sfb_file       #No:FUN-610101 add sfb93
             WHERE sfb01 = l_rvb34
            IF l_sfb39 != '2' THEN   #工單完工方式為'2' pull 不check min_set
               IF g_argv2_2 ='SUB' AND l_rvb05=l_sfb05 THEN   # 委外
                  LET g_min_set = 0
            #   CALL s_minp(l_rvb34,g_sma.sma73,g_sma.sma74,'')  #by lily modify 20141012
         CALL s_minp(l_rvb34,g_sma.sma73,g_sma.sma74,'','','',g_rva.rva06)
                   RETURNING g_cnt,g_min_set

 #                 SELECT ima55 INTO l_ima55
 #                   FROM ima_file
 #                  WHERE ima01 = g_rvb[l_ac].rvb05
 #                 CALL s_umfchk(g_rvb[l_ac].rvb05,g_rvb[l_ac].pmn07,l_ima55)
 #                      RETURNING g_i,l_fac
 #                 IF g_i = 1 THEN
 #                    #採購單位無法與料件的生產單位做換算,預設轉換率為1
 #                    CALL cl_err(g_rvb[l_ac].rvb05,'apm-120',1)
 #                    LET l_fac = 1
 #                 END IF
 #                 LET g_min_set = g_min_set / l_fac

                  IF g_cnt !=0  THEN
                     CALL cl_err('s_minp()','asf-549',0)
                   RETURN
                  END IF
                  # 確認之(收貨-退貨)
                  SELECT SUM(rvb07-rvb29) INTO conf_qty FROM rvb_file,rva_file
                   WHERE rvb34 = l_rvb34
                     #AND rvb01 = rva01 AND rvaconf<>'X'    #MOD-790062 modify 排除作廢單據
                     AND rvb01 = rva01 AND rvaconf='Y'    #MOD-790062 modify 排除作廢單據
                     AND rvb05 = l_rvb05 AND rvb35='N'
                     AND NOT (rvb02=l_rvb02 AND rvb01=g_rva.rva01)  #MOD-790062 排除本張單正在輸入的項次

                  IF conf_qty IS NULL THEN LET conf_qty=0 END IF
                  LET g_min_set=g_min_set-conf_qty
                  CALL cl_err(g_min_set,'aqc-426',0)
               END IF
            END IF


                    IF l_rvb07 > g_min_set THEN
                          CALL cl_err(l_rvb34,'apm-307',1)
                         RETURN
                       END IF
          END FOREACH


   #-->確認時 check 超短交 & 可否提前交貨
   CALL t110_chk_over()
   IF g_success = 'N' THEN CALL cl_rbmsg(4) RETURN END IF

   BEGIN WORK

   OPEN t110_cl USING g_rva_rowid
   IF STATUS THEN
      CALL cl_err("OPEN t110_cl:", STATUS, 1)
      CLOSE t110_cl
      ROLLBACK WORK
      RETURN
   END IF
   FETCH t110_cl INTO g_rva.*          #鎖住將被更改或取消的資料
   IF SQLCA.sqlcode THEN
      CALL cl_err(g_rva.rva01,SQLCA.sqlcode,0)      #資料被他人LOCK
      CLOSE t110_cl
      ROLLBACK WORK
      RETURN
   END IF



   #-->更新單頭確認碼
   UPDATE rva_file SET rvaconf = 'Y' WHERE rva01 = g_rva.rva01
   IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
      LET g_success = 'N'
   END IF

   CALL t110_y1()
   IF g_success ='Y' THEN  #TQC-750097
      CALL t110_upd_pmn()
   END IF #TQC-750097
   #MESSAGE ""  #FUN-840012
   CALL cl_msg("")   #FUN-840012


{ ####################################by beamon 120924 add 增加自動產生已過帳邊角料雜收單start#####################
 #130506 啓用
  IF g_success = 'Y' THEN #1
   LET l_cnt=0
    SELECT COUNT(*) INTO l_cnt FROM rvb_file,sfb_file,ima_file
     WHERE rvb01=g_rva.rva01 and rvb34=sfb01 and sfb02='7' and rvb05=ima01  and ta_ima003='Y'
     AND rvb33 > 0 #130506

    IF cl_null(l_cnt) THEN LET l_cnt=0 END IF
    IF l_cnt>0 THEN #2

      LET l_cnt=0
        SELECT COUNT(*) INTO l_cnt FROM ina_file WHERE ina10 = g_rva.rva01 and inaconf <> 'X'
           AND ta_ina003='E'

      IF l_cnt>0 THEN #3
         CALL cl_err(g_rva.rva01,'csf024',0 )
         LET g_success='N'
       ELSE

       CALL gen_inainfo('SCI', g_rva.rva01,'E','4','', g_rva.rvauser,g_rva.rvagrup,g_rva.rva06)
            RETURNING l_ina01  # by cjy 110120
       IF g_success = 'Y' THEN  #4
         CALL gen_inbinfo(l_ina01, g_rva.rva01,'X03','SCWIP',g_rva.rva05)
         IF g_success='Y' THEN
            CALL t370('4' ,l_ina01,'stock_post')
            LET g_rva.ta_rva04 = l_ina01
            UPDATE rva_file SET ta_rva04=g_rva.ta_rva04 WHERE rva01=g_rva.rva01    # by cjy 101207

         END IF

       END IF  #4
     END IF #3
   END IF #2

  END IF #1

###########################################################################end #####################################

  }

   IF g_success = 'Y' THEN
      LET g_rva.rvaconf='Y'
      DISPLAY BY NAME g_rva.ta_rva04
      COMMIT WORK

  ################by cjy 101123 add 當不良品收貨時直接產生驗退單#########################

    LET l_smycount =0
         SELECT COUNT(*) INTO l_smycount FROM tc_smy_file WHERE tc_smy02='11' and tc_smy01=substr(g_rva.rva01,1,3)
   IF  l_smycount>0  THEN
    SELECT tc_smz02 into l_t1 FROM tc_smz_file WHERE tc_smz03=g_prog and tc_smz01=substr(g_rva.ta_rva01,1,3)



     CALL t110_g_yt()
     IF NOT cl_null(l_t1) THEN
      LET g_success='Y'
     CALL t110_sfs_yt(l_t1,g_rva.rva01,g_rva.ta_rva01 )
       IF g_success='N' THEN
       CALL  cl_err('','cpm-009',0)
       RETURN
       END IF
     END IF

       END IF




   ############################################ END ############################################

      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt FROM rvu_file
       WHERE rvu02 = g_rva.rva01
      IF l_cnt > 0  THEN
      IF g_rva.rva10='SUB' THEN

         IF l_smycount>0 THEN
         CALL t720('7', g_rva.rva01 ,'SUB','5')
         ELSE
         LET g_cmd = "cpmt731 "," '",g_rva.rva01 CLIPPED,"' '' '5' "
          CALL cl_cmdrun_wait(g_cmd)
         END IF

      ELSE
         LET g_cmd = "apmt720 "," '",g_rva.rva01 CLIPPED,"' '' '5'"
      CALL cl_cmdrun_wait(g_cmd)
      END IF

      END IF
      #MOD-740519-end-add
      CALL cl_flow_notify(g_rva.rva01,'Y')
      CALL cl_cmmsg(4)
   ELSE
      LET g_rva.rvaconf='N'
      ROLLBACK WORK
      CALL s_showmsg()       #No.TQC-760055
      CALL cl_rbmsg(4)
   END IF
   DISPLAY BY NAME g_rva.rvaconf
   CALL t110_show()
   #CKP
   IF g_rva.rvaconf='X' THEN LET g_chr='Y' ELSE LET g_chr='N' END IF
   CALL cl_set_field_pic(g_rva.rvaconf,"","","",g_chr,"")

END FUNCTION


FUNCTION gen_inainfo(l_no1, l_rva01,l_ta_ina003,l_ina00,l_ta_ina001,l_rvauser,l_rvagrup ,l_rva06 )
  DEFINE l_no1         LIKE ina_file.ina01,
         l_rva01       LIKE rva_file.rva01,
         l_ta_ina003   LIKE ina_file.ta_ina003,
         l_ina  RECORD LIKE ina_file.*,
         li_result     LIKE type_file.num5,
         l_rva06       LIKE rva_file.rva06,
         l_ina00       LIKE ina_file.ina00,
         l_ta_ina001   LIKE ina_file.ta_ina001,
         l_rvauser     LIKE rva_file.rvauser,  #  by cjy 100120
         l_rvagrup     LIKE rva_file.rvagrup   # by cjy 100120

          INITIALIZE l_ina.* TO NULL
          LET l_ina.ina00   = l_ina00
          LET l_ina.ina02   = l_rva06
          LET l_ina.ina03   = l_rva06
          LET l_ina.ina04   = l_rvagrup

           LET l_ina.ina10   = l_rva01
           LET l_ina.ina08   = '1'              #No:MOD-760148 add
           LET l_ina.ina11   = l_rvauser
           LET l_ina.inaprsw = 0
           LET l_ina.inaconf='Y'
           LET l_ina.inapost = 'N'
           LET l_ina.inauser = g_user
           LET l_ina.inagrup = g_grup
           LET l_ina.inamodu = ''
           LET l_ina.inadate = g_today
           LET l_ina.inamksg = g_smy.smyapr     #No:MOD-760148 add
           LET l_ina.ta_ina003=l_ta_ina003
           LET l_ina.ta_ina001=l_ta_ina001
           LET l_ina.ta_ina004='1'
              LET l_no1= s_get_doc_no(l_no1)
                CALL s_check_no("aim",l_no1,'','2',"ina_file","ina01","")
                 RETURNING li_result,l_no1

           CALL s_auto_assign_no("aim",l_no1,l_ina.ina03,'2',"ina_file","ina01","","","")
               RETURNING li_result,l_ina.ina01

           INSERT INTO ina_file VALUES(l_ina.*)

           IF SQLCA.sqlcode THEN
            CALL cl_err3("ins","ina_file",l_ina.ina01,"",SQLCA.sqlcode,"","ins ina:",1)  #No.FUN-660128
              LET g_success='N'
              RETURN
           END IF
    RETURN  l_ina.ina01

END FUNCTION

FUNCTION gen_inbinfo(l_ina01, l_rva01,l_inb15,l_inb05,l_inb06)
DEFINE  l_ina01 LIKE ina_file.ina01,
        l_rva01 LIKE rva_file.rva01,
        l_inb05 LIKE inb_file.inb05,
        l_inb06 LIKE inb_file.inb06,
        l_inb15 LIKE inb_file.inb15,
        l_inb  RECORD LIKE inb_file.*,
        l_sql   STRING,
        l_gfe03 LIKE gfe_file.gfe03
 DEFINE l_err        STRING
 DEFINE l_ima18      LIKE ima_file.ima18
 DEFINE l_ta_ima004  LIKE ima_file.ta_ima004

            LET l_inb.inb01=l_ina01
            LET l_inb.inb05=l_inb05
            LET l_inb.inb06=l_inb06
            LET l_inb.inb07  = ' '
            LET l_inb.inb15=l_inb15

            LET l_sql =
             "SELECT  rvb02,ta_azf02,rvb33*(nvl(ta_ima004,0)-nvl(ima18,0) -nvl(ta_ima009,0)-nvl(ta_ima011,0) )/1000,rvb34,ima18,ta_ima004 ",
             "  from rvb_file,ima_file,azf_file,sfb_file   ",
             " where rvb33>0 and rvb34=sfb01 and sfb02='7' and rvb01='",l_rva01,"' AND rvb05=ima01 ",       # steven_yue add ta_ima011 同時也減去中心料單重 20110320
             " and nvl(ta_ima004,0)-nvl(ima18,0) -nvl(ta_ima009,0)  >0 and (ima10 is not null) and ta_ima003='Y' and ima10=azf01 and azf02='E' "

           PREPARE inbinfo_pb2 FROM l_sql
           DECLARE inbinfo_curs2 CURSOR FOR inbinfo_pb2
           FOREACH inbinfo_curs2 INTO l_inb.inb03,l_inb.inb04,l_inb.inb09,l_inb.inb12,l_ima18,l_ta_ima004

                IF cl_null(l_ima18) OR cl_null(l_ta_ima004) THEN
                   LET g_success = 'N'
                   LET g_msg = "料件單位淨重：",l_ima18," 或單位毛重:",l_ta_ima004,"沒有維護，請檢查！"
                   CALL cl_err(g_msg,'!',1)
                   RETURN
                END IF


                LET l_inb.inb08=''
                LET l_inb.inb08_fac=0
                SELECT img09,img20 INTO l_inb.inb08,l_inb.inb08_fac  FROM img_file
                  WHERE img01 = l_inb.inb04 AND img02 = l_inb.inb05
                    AND img03 = l_inb.inb06 AND img04 = l_inb.inb07
                 IF STATUS=100 AND (l_inb.inb05 IS NOT NULL AND l_inb.inb05 <> ' ') THEN
                     IF g_sma.sma892[3,3] ='Y' THEN
                        IF NOT cl_confirm('mfg1401') THEN
                        ROLLBACK WORK
                         LET g_success='N'
                         RETURN
                        END IF
                     END IF
                     SELECT ima25,1   INTO l_inb.inb08,l_inb.inb08_fac  FROM ima_file
                     WHERE ima01=l_inb.inb04

                     CALL s_add_img(l_inb.inb04,l_inb.inb05,
                                    l_inb.inb06,l_inb.inb07,
                                    l_inb.inb01,l_inb.inb03,g_today)

                  END IF

                SELECT gfe03 INTO l_gfe03 FROM gfe_file
              WHERE gfe01=l_inb.inb08

             LET l_inb.inb09= cl_digcut(l_inb.inb09,l_gfe03)



               LET l_inb.inb10  = ''
               LET l_inb.inb11  = ''

               LET l_inb.inb13  = 0
               LET l_inb.inb14  = 0

               LET l_inb.inb901 = ''
               LET l_inb.inb902 = l_inb.inb08
               LET l_inb.inb903 = l_inb.inb08_fac
               LET l_inb.inb904 = l_inb.inb09
               LET l_inb.inb905 = ''
               LET l_inb.inb906 = ''
               LET l_inb.inb907 = ''
               LET l_inb.inb930 = l_inb06 #FUN-670103

               LET l_inb.inblegal = g_legal
               LET l_inb.inbplant = g_plant
               LET l_inb.inb16 = l_inb.inb09

               INSERT INTO inb_file VALUES(l_inb.*)


               IF SQLCA.sqlcode THEN
                  LET l_err = SQLCA.sqlcode

                  CALL cl_err3("ins","inb_file",l_inb.inb01,l_inb.inb03,l_err,"","ins inb:",1)  #No.FUN-660128
                 LET g_success='N'
                RETURN

               END IF
           END FOREACH


END FUNCTION


FUNCTION t110_y1()
 DEFINE  l_rvb   RECORD LIKE rvb_file.*,
         l_factor1       LIKE ima_file.ima31_fac, #No.FUN-680136 DECIMAL(16,8)
         l_pmnrowid      LIKE type_file.chr18,   #No.FUN-680136 INTEGER
         l_imarowid      LIKE type_file.chr18,   #No.FUN-680136 INTEGER
         l_cnt,l_smycount           LIKE type_file.num5,    #No.FUN-680136 SMALLINT
         l_sfa05         LIKE sfa_file.sfa05,
         l_sfa065        LIKE sfa_file.sfa065,
         l_rvb07         LIKE rvb_file.rvb07,
         l_sfb04         LIKE sfb_file.sfb04,    #
         l_sfb24         LIKE sfb_file.sfb24,    #No.B415 add
         l_pmh08         LIKE pmh_file.pmh08,    #
         l_pmn07         LIKE pmn_file.pmn07,    #採購單號
         l_pmn51         LIKE pmn_file.pmn51,
         l_pmn01         LIKE pmn_file.pmn01,    #採購單號
         l_pmn02         LIKE pmn_file.pmn02,    #項次
         l_pmn122        LIKE pmn_file.pmn122,   #專案號碼
         l_pmn09         LIKE pmn_file.pmn09,    #轉換因子
         l_pmn40         LIKE pmn_file.pmn40,    #會計科目
         l_pmn011        LIKE pmn_file.pmn011,   #性質
         l_pmm22         LIKE pmm_file.pmm22 ,   #
         l_ima25         LIKE ima_file.ima25,    #庫存單位
         l_ima86         LIKE ima_file.ima86,    #成本單位
         l_ima906        LIKE ima_file.ima906,   #No.FUN-540027
         l_code          LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(01)
         l_qc            LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(01)
         l_ins_rvu       LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(01) #有免驗料,可直接入庫的資料設'Y' NO:7143
         l_fac           LIKE ima_file.ima31_fac, #No.FUN-680136 DEC(16,8)
         l_ima44         LIKE ima_file.ima44,
         l_ima55         LIKE ima_file.ima55
 DEFINE  l_msg           LIKE type_file.chr1000  #No.FUN-680136 VARCHAR(100)
 DEFINE  l_pmm04         LIKE pmm_file.pmm04     #FUN-610040
 DEFINE  l_ima915        LIKE ima_file.ima915    #FUN-710060 add

   LET l_qc = 'N'
   LET l_ins_rvu='N' #default可直接入庫碼設為'Y'
   DECLARE t110_y CURSOR FOR
     SELECT * FROM rvb_file WHERE rvb01=g_rva.rva01
   DECLARE t110_y_n CURSOR FOR  #NO:7143
     SELECT * FROM rvb_file
      WHERE rvb01=g_rva.rva01
        AND rvb39='N' #檢驗否='N'

   CALL s_showmsg_init()        #No.FUN-710030
   FOREACH t110_y INTO l_rvb.*
      IF STATUS THEN
#No.FUN-710030 -- begin --
#         CALL cl_err('foreach:',STATUS,0)
         IF g_bgerr THEN
            CALL s_errmsg("","","foreach",STATUS,1)
         ELSE
            CALL cl_err3("","","","",STATUS,"","foreach",1)
         END IF
#No.FUN-710030 -- end --
         EXIT FOREACH
      END IF
#No.FUN-710030 -- begin --
      IF g_success="N" THEN
         LET g_totsuccess="N"
         LET g_success="Y"
      END IF
#No.FUN-710030 -- end --

     #start FUN-610040
      LET l_pmm04 =''
      IF NOT cl_null(l_rvb.rvb04) THEN
         SELECT pmm04 INTO l_pmm04 FROM pmm_file   #採購單據日期
          WHERE pmm01 = l_rvb.rvb04
         IF STATUS OR l_pmm04 > g_rva.rva06 THEN
            #收貨日期不可小於採購單據日期
#No.FUN-710030 -- begin --
#            CALL cl_err(l_rvb.rvb04,'apm-413',1)
#            LET g_success = 'N'
#            EXIT FOREACH
            LET g_success = 'N'
            IF g_bgerr THEN
               CALL s_errmsg("","",l_rvb.rvb04,"apm-413",1)
               CONTINUE FOREACH
            ELSE
               CALL cl_err3("","","","","apm-413","",l_rvb.rvb04,1)
               EXIT FOREACH
            END IF
#No.FUN-710030 -- end --
         END IF
      END IF
     #end FUN-610040

      #-----委外處理
      IF g_rva.rva10='SUB' THEN
#------------No:MOD-790176 mark
#MOD-7A0090-add
#        SELECT sfb24 INTO l_sfb24 FROM sfb_file
#         WHERE sfb01 = l_rvb.rvb34
#        IF l_sfb24='N' OR cl_null(l_sfb24) THEN
#           CALL cl_err('','mfg6097',1)
#                 LET g_success='N'
#                 RETURN
#        END IF
#        IF cl_null(l_rvb.rvb34) THEN
#           CALL cl_err('','asf-967',1)
#           LET g_success='N'
#           RETURN
#        END IF
#MOD-7A0090-add-end
#------------No:MOD-790176 end

         SELECT COUNT(*) INTO l_cnt
           FROM sfa_file
          WHERE sfa01=l_rvb.rvb34 AND sfa05!=sfa065
         IF l_cnt>0 THEN
            SELECT COUNT(*) INTO l_cnt FROM sfp_file,sfq_file
             WHERE sfp01 = sfq01
               AND sfq02 = l_rvb.rvb34
               AND sfp06 = '1'
               AND sfp04 = 'Y'
            IF l_cnt = 0 AND g_argv5<>'1' THEN  #FUN-840012
              #--------------------No:MOD-730078 modify
              #FUN-640123...............begin
               CALL cl_getmsg('apm-002',g_lang) RETURNING g_msg
               LET g_msg = l_rvb.rvb34 CLIPPED,g_msg
               IF NOT cl_prompt(17,5,g_msg) THEN
                  LET g_success='N'
                  RETURN
               END IF
              #CALL cl_err(l_rvb.rvb34,'apm-046',1)
              #LET g_success='N'  #MOD-6A0131
              #RETURN
              #FUN-640123...............end
              #--------------------No:MOD-730078 end
             #--------------No:MOD-7B0203 mark
             #LET g_success='N'  #MOD-6A0131
             #RETURN
             ##FUN-640123...............end
             #--------------No:MOD-7B0203 end
            END IF
         END IF
         #-----No:MOD-5C0039-----
         SELECT sfb04 INTO l_sfb04 FROM sfb_file   #工單
          WHERE sfb01 = l_rvb.rvb34
         IF l_sfb04 = "8" THEN
#No.FUN-710030 -- begin --
#            CALL cl_err(l_rvb.rvb34,"asf-070",0)
            IF g_bgerr THEN
               CALL s_errmsg("","",l_rvb.rvb34,"asf-070",1)
            ELSE
               CALL cl_err3("","","","","asf-070","",l_rvb.rvb34,1)
            END IF
#No.FUN-710030 -- end --
            LET g_success = 'N'
            RETURN
         END IF
         #-----No:MOD-5C0039 END-----
         IF l_sfb24 ='N' OR l_sfb24 IS NULL THEN   #No.B415 add
            SELECT sfb04,sfb05 INTO l_sfb04,g_sfb05 FROM sfb_file   #工單
             WHERE sfb01 = l_rvb.rvb34
            IF l_sfb04 < '6' THEN
               #MESSAGE "Update sfb_file ..." #FUN-840012
               CALL cl_msg ("Update sfb_file ...") #FUN-840012
               UPDATE sfb_file SET sfb04 = '6'  #工單已完工,進入F.Q.C
                WHERE sfb01 = l_rvb.rvb34
               IF SQLCA.sqlcode OR SQLCA.SQLERRD[3] = 0 THEN
#                 CALL cl_err('1.UPDATE fail sfb_file :',SQLCA.sqlcode,1) #No.FUN-660129
#No.FUN-710030 -- begin --
#                  CALL cl_err3("upde","sfb_file",l_rvb.rvb34,"",SQLCA.sqlcode,"","1.UPDATE fail sfb_file :",1) #No.FUN-660129
                  IF g_bgerr THEN
                     CALL s_errmsg("sfb01",l_rvb.rvb34,"1.UPDATE fail sfb_file :",SQLCA.sqlcode,1)
                  ELSE
                     CALL cl_err3("upd","sfb_file",l_rvb.rvb34,"",SQLCA.sqlcode,"","1.UPDATE fail sfb_file :",1)
                  END IF
#No.FUN-710030 -- end --
                  LET g_success = 'N'
                  RETURN
               END IF
            END IF
            CALL s_updsfb117(l_rvb.rvb34)
            IF g_success='N' THEN
#No.FUN-710030 -- begin --
#               CALL cl_err('2.UPDATE fail sfb_file :',SQLCA.sqlcode,1)
               IF g_bgerr THEN
                  CALL s_errmsg("","","2.UPDATE fail sfb_file :",SQLCA.sqlcode,1)
               ELSE
                  CALL cl_err3("","","","",SQLCA.sqlcode,"","2.UPDATE fail sfb_file :",1)
               END IF
#No.FUN-710030 -- end --
               RETURN
            END IF
         END IF
      END IF

      #-->取採購單位(pmn07)與庫存單位(ima25)的轉換,且LOCK 此筆資料
      LET g_forupd_sql = "SELECT pmn_file.rowid,pmn09,pmn011,pmn40,pmn07",
                         "  FROM pmn_file",
                         " WHERE pmn01=? AND pmn02=? FOR UPDATE NOWAIT"
      DECLARE t110_pmn1 CURSOR FROM g_forupd_sql                 # LOCK CURSOR

      OPEN t110_pmn1 USING l_rvb.rvb04,l_rvb.rvb03
      IF STATUS THEN
#No.FUN-710030 -- begin --
#         CALL cl_err("OPEN t110_pmn1:", STATUS, 1)
         IF g_bgerr THEN
            CALL s_errmsg("","","OPEN t110_pmn1:",STATUS,1)
         ELSE
            CALL cl_err3("","","","",STATUS,"","OPEN t110_pmn1:",1)
         END IF
#No.FUN-710030 -- end --
         CLOSE t110_pmn1
        #ROLLBACK WORK                                  #CHI-840071
         LET g_success = 'N'                            #CHI-840071
         RETURN
      END IF
      FETCH t110_pmn1 INTO l_pmnrowid,l_pmn09,l_pmn011,l_pmn40,l_pmn07
      IF SQLCA.sqlcode THEN
#No.FUN-710030 -- begin --
#         CALL cl_err('fetch t110_pmn1:',SQLCA.sqlcode,0)
         IF g_bgerr THEN
            CALL s_errmsg("","","fetch t110_pmn1:",SQLCA.sqlcode,1)
         ELSE
            CALL cl_err3("","","","",SQLCA.sqlcode,"","fetch t110_pmn1:",1)
         END IF
#No.FUN-710030 -- end --
         LET g_success = 'N'
         RETURN
      END IF
      IF l_rvb.rvb05[1,4] != 'MISC' THEN
         LET g_forupd_sql = "SELECT rowid,ima25,ima86 FROM ima_file",
                            " WHERE ima01=? FOR UPDATE NOWAIT"
         DECLARE t110_ima1  CURSOR FROM g_forupd_sql              # LOCK CURSOR

         OPEN t110_ima1 USING l_rvb.rvb05
         IF STATUS THEN
#No.FUN-710030 -- begin --
#            CALL cl_err("OPEN t110_ima1:", STATUS, 1)
         IF g_bgerr THEN
            CALL s_errmsg("","","OPEN t110_ima1:",STATUS,1)
         ELSE
            CALL cl_err3("","","","",STATUS,"","OPEN t110_ima1:",1)
         END IF
#No.FUN-710030 -- end --
            CLOSE t110_ima1
           #ROLLBACK WORK                                  #CHI-840071
            LET g_success = 'N'                            #CHI-840071
            RETURN
         END IF

         FETCH t110_ima1 INTO l_imarowid,l_ima25,l_ima86
         IF SQLCA.sqlcode THEN
#No.FUN-710030 -- begin --
#            CALL cl_err('fetch:',SQLCA.sqlcode,0)
            IF g_bgerr THEN
               CALL s_errmsg("","","fetch:",SQLCA.sqlcode,1)
            ELSE
               CALL cl_err3("","","","",SQLCA.sqlcode,"","fetch:",1)
            END IF
#No.FUN-710030 -- end --
            LET g_success = 'N'
            RETURN
         END IF

         CALL s_umfchk(l_rvb.rvb05,l_pmn07,l_ima25) RETURNING l_cnt,l_factor1
         IF l_cnt = 1 THEN
#No.FUN-710030 -- begin --
#            CALL cl_err('pmn07/ima25: ','abm-731',1)
            IF g_bgerr THEN
               CALL s_errmsg("","","pmn07/ima25: ","abm-731",1)
            ELSE
               CALL cl_err3("","","","","abm-731","","pmn07/ima25: ",1)
            END IF
#No.FUN-710030 -- end --
            LET g_success ='N'
            RETURN
         END IF
      END IF

      #-->取專案編號
      SELECT pmn122 INTO l_pmn122 FROM pmn_file
       WHERE pmn01 = l_rvb.rvb04
         AND pmn02 = l_rvb.rvb03

      #-->樣品不更新PO上的數量
      IF l_rvb.rvb35='N' THEN
         #-->(1-2)更新超短交量
         CALL s_udpmn57(l_rvb.rvb04,l_rvb.rvb03)

         #-->(1-3)產生tlf_file
         IF l_rvb.rvb05[1,4] != 'MISC' THEN
            #MESSAGE "Insert tlf_file ..."  #FUN-840012
            CALL cl_msg("Insert tlf_file ...")  #FUN-840012
            CALL t110_log(1,0,l_rvb.*,l_pmn011,l_pmn07,l_pmn40,l_ima86,l_pmn122)

            #No.FUN-540027  --begin
            SELECT ima906 INTO l_ima906 FROM ima_file WHERE ima01=l_rvb.rvb05
            IF g_sma.sma115 = 'Y' AND l_ima906 MATCHES '[23]' THEN
               IF NOT cl_null(l_rvb.rvb83) THEN
                  IF NOT cl_null(l_rvb.rvb85) AND l_rvb.rvb85 <> 0 THEN
                     CALL t110_tlff(l_pmn011,l_ima86,l_pmn122,l_rvb.*,l_rvb.rvb83,l_rvb.rvb84,l_rvb.rvb85,'2')
                  END IF
               END IF
               #No.CHI-770019  --Begin
               IF l_ima906 <> '3' THEN
                  IF NOT cl_null(l_rvb.rvb80) THEN
                     IF NOT cl_null(l_rvb.rvb82) AND l_rvb.rvb82 <> 0 THEN
                        CALL t110_tlff(l_pmn011,l_ima86,l_pmn122,l_rvb.*,l_rvb.rvb80,l_rvb.rvb81,l_rvb.rvb82,'1')
                     END IF
                  END IF
               END IF
               #No.CHI-770019  --End
            END IF
            #No.FUN-540027  --end
         END IF
      END IF

     #FUN-710060---mod---str---
     #IF g_sma.sma63='1' THEN #料件供應商控制方式,1: 需作料件供應商管制
     #                        #                   2: 不作料件供應商管制
     #料件供應商控制方式: 0.不管制、1.請購單需管制、2.採購單需管制、3.二者皆需管制
      SELECT ima915 INTO l_ima915 FROM ima_file
       WHERE ima01=l_rvb.rvb05
      IF l_ima915='2' OR l_ima915='3' THEN
     #FUN-710060---mod---end---
         SELECT pmm22 INTO l_pmm22 FROM pmm_file
          WHERE pmm01=l_rvb.rvb04

         SELECT pmh08 INTO l_pmh08 FROM pmh_file
          WHERE pmh01=l_rvb.rvb05
            AND pmh02=g_rva.rva05
            AND pmh13=l_pmm22

         IF cl_null(l_pmh08) THEN
            LET l_pmh08 = 'N'
         END IF

         IF l_rvb.rvb05[1,4] = 'MISC' THEN
            LET l_pmh08='N'
         END IF
      ELSE
         SELECT ima24 INTO l_pmh08 FROM ima_file
          WHERE ima01=l_rvb.rvb05
         IF cl_null(l_pmh08) THEN
            LET l_pmh08 = 'N'
         END IF

         IF l_rvb.rvb05[1,4] = 'MISC' THEN
            LET l_pmh08='N'
         END IF
      END IF
            # cjy by 09/05/18 收货单别为PPB,PPF,KPB,KPF则檢查項目設置為免檢，使倉庫可直接生成入庫單
           #   IF g_rva.rva10='SUB' AND (g_rva.rva01 MATCHES 'PPB*' OR g_rva.rva01 MATCHES 'PPF*' OR g_rva.rva01 MATCHES 'KPF*' OR g_rva.rva01 MATCHES 'KPB*') THEN
             #    LET l_pmh08='N'
            #   END IF
               LET l_smycount =0
         SELECT COUNT(*) INTO l_smycount FROM tc_smy_file WHERE tc_smy02='11' and tc_smy01=substr(g_rva.rva01,1,3)
         IF l_smycount>0 THEN
         LET l_pmh08='N'
         END IF



               #end  cjy  by 09/05/18


      IF l_pmh08='N' OR     #免驗料
         (g_sma.sma886[6,6]='N' AND g_sma.sma886[8,8]='N') OR #視同免驗
         l_rvb.rvb19='2' THEN #委外代買料

         IF l_smycount=0 THEN

         UPDATE rvb_file SET rvb33 = l_rvb.rvb07, #實收數量
                            #No.FUN-580115  --begin
                             rvb331 = l_rvb.rvb82, #實收數量
                             rvb332 = l_rvb.rvb85, #實收數量
                            #No.FUN-580115  --end
                             #rvb39 = 'N',         #檢驗否    #No:BUG-490363  #MOD-530415 MARK 改在單身產生時即應將是否檢驗的資料帶入，不需等到確認後再帶出。
                             rvb40 = g_today,     #檢驗日期
                             rvb41 = 'OK'         #檢驗結果
          WHERE rvb01 = l_rvb.rvb01
            AND rvb02 = l_rvb.rvb02
        #######################BY CJY 101123 委外不良品收貨設定為驗退 start ############################

        ELSE

         UPDATE rvb_file SET rvb33 = 0, #實收數量
                            #No.FUN-580115  --begin
                             rvb331 = 0, #實收數量
                             rvb332 = 0, #實收數量
                            #No.FUN-580115  --end
                             #rvb39 = 'N',         #檢驗否    #No:BUG-490363  #MOD-530415 MARK 改在單身產生時即應將是否檢驗的資料帶入，不需等到確認後再帶出。
                             rvb40 = g_today,     #檢驗日期
                             rvb41 = 'OK'         #檢驗結果
          WHERE rvb01 = l_rvb.rvb01
            AND rvb02 = l_rvb.rvb02



        END IF

          #######################BY CJY 101123 委外不良品收貨設定為驗退 start ############################
         IF SQLCA.sqlcode THEN
#           CALL cl_err('UPDATE rvb_file',SQLCA.sqlcode,0)  #No.FUN-660129
#No.FUN-710030 -- begin --
#            CALL cl_err3("upd","rvb_file",l_rvb.rvb01,l_rvb.rvb02,SQLCA.sqlcode,"","UPDATE rvb_file",1) #No.FUN-660129
            IF g_bgerr THEN
               LET g_showmsg = l_rvb.rvb01,"/",l_rvb.rvb02
               CALL s_errmsg("rvb01,rvb02",g_showmsg,"UPDATE rvb_file",SQLCA.sqlcode,1)
            ELSE
               CALL cl_err3("upd","rvb_file",l_rvb.rvb01,l_rvb.rvb02,SQLCA.sqlcode,"","UPDATE rvb_file",1)
            END IF
#No.FUN-710030 -- end --
            LET g_success = 'N'
            RETURN
         END IF



         LET l_ins_rvu='Y' #因為免驗料,所以可直接入庫碼設為'Y'
      #MOD-530415 MARK 改在單身產生時即應將是否檢驗的資料帶入，不需等到確認後再帶出。
     #ELSE
     #   UPDATE rvb_file SET rvb39 = 'Y'
     #    WHERE rvb01 = l_rvb.rvb01
     #      AND rvb02 = l_rvb.rvb02
     #   IF SQLCA.sqlcode THEN
     #      CALL cl_err('UPDATE rvb_file',SQLCA.sqlcode,0)
     #      LET g_success = 'N'
     #      RETURN
     #   END IF
      END IF
      #check收貨和品管是否要檢查承認文號
      #No:7631 要驗料件才需check
      IF l_pmh08 = 'Y' THEN
         CALL s_chk_apprl(l_rvb.rvb05,g_rva.rva05,l_rvb.rvb04)
         RETURNING l_code,l_msg #No:7625 所傳的參數寫顛倒
         #需依照參數『收貨單無承認文號時0.不處理　1.警告　2.拒絕』的設定處理
         CASE l_code
            WHEN 1      #警告
               CALL cl_err('',l_msg,1)
            WHEN 2      #拒
               CALL cl_err('',l_msg,1)
               LET g_success = 'N'
               RETURN
            OTHERWISE
               EXIT CASE
         END CASE
      END IF

      CLOSE t110_pmn1
      CLOSE t110_ima1
   END FOREACH
#No.FUN-710030 -- begin --
   IF g_totsuccess="N" THEN
      LET g_success="N"
   END IF
#No.FUN-710030 -- end --

   #-->不為 'MISC' 且 為免檢者須check img_file(因免檢可直接入庫)
   IF l_ins_rvu='Y' THEN
      FOREACH t110_y_n INTO l_rvb.*
#No.FUN-710030 -- begin --
         IF g_success="N" THEN
            LET g_totsuccess="N"
            LET g_success="Y"
         END IF
#No.FUN-710030 -- end --
#CHI-7A0003-modify
#MOD-790167-add
#       IF NOT cl_null(l_rvb.rvb36) AND g_sma.sma886[7,7] = 'Y' THEN
        IF NOT cl_null(l_rvb.rvb36) THEN
#MOD-790167-add -end
#CHI-7A0003-modify-end
         IF l_rvb.rvb05[1,4] <>'MISC' THEN
            SELECT COUNT(*) INTO g_cnt
              FROM img_file
             WHERE img01 = l_rvb.rvb05
               AND img02 = l_rvb.rvb36
               AND img03 = l_rvb.rvb37
               AND img04 = l_rvb.rvb38
            IF g_cnt=0 AND ((g_rva.rva10<>'SUB') OR (g_rva.rva10='SUB' AND l_sfb24='N')) THEN
               LET g_success='N'
#No.FUN-710030 -- begin --
#               CALL cl_err(l_rvb.rvb05,'apm-259',1)
               IF g_bgerr THEN
                  CALL s_errmsg("","",l_rvb.rvb05,"apm-259",1)
               ELSE
                  CALL cl_err3("","","","","apm-259","",l_rvb.rvb05,1)
               END IF
#No.FUN-710030 -- end --
               RETURN
            END IF
         END IF
       END IF                 #MOD-790167-add
      END FOREACH
#No.FUN-710030 -- begin --
      IF g_totsuccess="N" THEN
         LET g_success="N"
      END IF
#No.FUN-710030 -- end --

      IF STATUS THEN
         LET g_success='N'
#No.FUN-710030 -- begin --
#         CALL cl_err('foreach:',STATUS,0)
         IF g_bgerr THEN
            CALL s_errmsg("","","foreach:",STATUS,1)
         ELSE
            CALL cl_err3("","","","",STATUS,"","foreach:",1)
         END IF
#No.FUN-710030 -- end --
         RETURN
      END IF
   END IF

   #-->免檢驗表示全部可直接入庫
   IF l_ins_rvu = 'Y' AND g_sma.sma886[7]='Y' THEN
      CALL t110_insrvu()
      IF g_success='N' THEN
         RETURN
      END IF
    #No.TQC-740078--begin-- mark
    ##FUN-730068................begin
    ##IF g_rva.rva10='SUB' THEN
    ##   CALL t720('5',g_rva.rva01,'SUB','') #No:FUN-630010
    ##ELSE
    ##   CALL t720('5',g_rva.rva01,' ','') #No:FUN-630010
    ##END IF
    #IF g_rva.rva10='SUB' THEN
    #   LET g_cmd = "apmt730 ","'",g_rva.rva01 CLIPPED,"' '' ",
    #               "'1' 'SUB'"
    #ELSE
    #   LET g_cmd = "apmt720 ","'",g_rva.rva01 CLIPPED,"' '' '1'"
    #END IF
    #CALL cl_cmdrun_wait(g_cmd) #FUN-660216 add
    ##FUN-730068................end
    #No.TQC-740078--end-- mark
   END IF


END FUNCTION

FUNCTION t110_ins_rvu()
   DEFINE g_qcz       RECORD LIKE qcz_file.*
   DEFINE l_rvu       RECORD LIKE rvu_file.*,
          l_smy57     LIKE type_file.chr1,     #No.FUN-680136 VARCHAR(01)   #MOD-740033 modify
          l_t         LIKE smy_file.smyslip    #No.FUN-680136 VARCHAR(5)  #No.FUN-540027
   DEFINE li_result,l_smycount   LIKE type_file.num5      #No.FUN-540027  #No.FUN-680136 SMALLINT

   DEFINE l_ta_pmm08  LIKE pmm_file.ta_pmm08
   DEFINE l_ta_pmm07  LIKE pmm_file.ta_pmm07
   DEFINE l_cnt,l_cnt1 LIKE type_file.num5
   DEFINE l_sql   LIKE type_file.chr1000

   LET g_success='Y'
   IF b_rvb.rvb33 = 0 THEN
      #判斷此驗收單是否已產生驗退單
      SELECT COUNT(*) INTO g_i FROM rvv_file,rvu_file   #防止重覆過帳
       WHERE rvv04=b_rvb.rvb01 #收貨單號
         AND rvv05=b_rvb.rvb02 #收貨項次
         AND rvu00='2'         #驗退
         AND rvuconf <> 'X'
         AND rvu01 = rvv01
   ELSE
      #判斷此驗收單是否已產生入庫單
      SELECT COUNT(*) INTO g_i FROM rvv_file,rvu_file   #防止重覆過帳
       WHERE rvv04=b_rvb.rvb01 #收貨單號
         AND rvv05=b_rvb.rvb02 #收貨項次
         AND rvu00='1'         #入庫
         AND rvuconf <> 'X'
         AND rvu01 = rvv01
   END IF

   IF g_i>0 THEN
      LET g_success = 'N'
      RETURN
   END IF

   #----單頭
   INITIALIZE l_rvu.* TO NULL
   IF b_rvb.rvb33 = 0 THEN  #異動類別
      LET l_rvu.rvu00='2'   #驗退
   ELSE
      LET l_rvu.rvu00='1'   #入庫
   END IF
   LET l_rvu.rvu02=g_rva.rva01   #驗收單號
  #121206 LET l_rvu.rvu03=g_today       #異動日期
   LET l_rvu.rvu03=g_rva.rva06       #異動日期

   #日期<=關帳日期
   IF NOT cl_null(g_sma.sma53) AND l_rvu.rvu03 <= g_sma.sma53  AND l_rvu.rvu03>= g_rva.rva06 THEN  # by cjy 110131
#No.FUN-710030 -- begin --
#      CALL cl_err(l_rvu.rvu03,'mfg9999',1)
      IF g_bgerr THEN
         CALL s_errmsg("","",l_rvu.rvu03,"mfg9999",1)
      ELSE
         CALL cl_err3("","","","","mfg9999","",l_rvu.rvu03,1)
      END IF
#No.FUN-710030 -- end --
      LET g_success = 'N'
      RETURN
   END IF

   CALL s_yp(l_rvu.rvu03) RETURNING g_yy,g_mm
   IF (g_yy*12+g_mm)>(g_sma.sma51*12+g_sma.sma52)THEN #不可大於現行年月
#No.FUN-710030 -- begin --
#      CALL cl_err(l_rvu.rvu03,'mfg6091',1)
      IF g_bgerr THEN
         CALL s_errmsg("","",l_rvu.rvu03,"mfg6091",1)
      ELSE
         CALL cl_err3("","","","","mfg6091","",l_rvu.rvu03,1)
      END IF
#No.FUN-710030 -- end --
      LET g_success = 'N'
      RETURN
   END IF

   LET l_t = s_get_doc_no(g_rva.rva01)       #No.FUN-540027
   IF b_rvb.rvb33 = 0 THEN
      SELECT smy51,smy57[3,3] INTO l_rvu.rvu01,l_smy57 FROM smy_file
       WHERE smyslip=l_t
   ELSE
      SELECT smy52,smy57[3,3] INTO l_rvu.rvu01,l_smy57 FROM smy_file
       WHERE smyslip=l_t
   END IF

   IF l_rvu.rvu01 IS NULL THEN
#No.FUN-710030 -- begin --
#      CALL cl_err('smy52=NULL','apm-272',1)
      IF g_bgerr THEN
         CALL s_errmsg("","","smy52=NULL","apm-272",1)
      ELSE
         CALL cl_err3("","","","","apm-272","","smy52=NULL",1)
      END IF
#No.FUN-710030 -- end --
      LET g_success = 'N'
      RETURN
   END IF

   IF (l_rvu.rvu00='1' AND cl_null(g_rvu01_1)) OR
      (l_rvu.rvu00='2' AND cl_null(g_rvu01_2)) THEN
      IF l_smy57='Y' THEN
#        LET l_rvu.rvu01[4,10]=g_rva.rva01[4,10]   #入庫/驗收單號
         LET l_rvu.rvu01[g_no_sp-1,g_no_ep]=g_rva.rva01[g_no_sp-1,g_no_ep] #No.FUN-540027

         SELECT COUNT(*) INTO g_cnt
           FROM rvu_file
          WHERE rvu01=l_rvu.rvu01
            AND rvuconf !='X'
         IF g_cnt > 0 THEN   # OR MONTH(g_rva.rva08) <> MONTH(g_today)
                             #原有考慮收貨月份不等於入庫月份時應以 g_today產生單號
                             #此狀況改以原收貨月份產生單號)

#No.FUN-540027 --start--
            LET l_t = l_rvu.rvu01[1,g_doc_len]        #No.FUN-560060
            CALL s_auto_assign_no("apm",l_t,g_rva.rva06,"","","","","","")
                 RETURNING li_result,l_rvu.rvu01
            IF (NOT li_result) THEN
                LET g_success='N'
            END IF
#           CALL s_smyauno(l_t,g_rva.rva06) RETURNING g_i,l_rvu.rvu01
#           IF g_i THEN LET g_success='N' RETURN END IF
         END IF
      ELSE
         LET l_t = l_rvu.rvu01[1,g_doc_len]        #No.FUN-560060
         CALL s_auto_assign_no("apm",l_t,l_rvu.rvu03,"","","","","","")
              RETURNING li_result,l_rvu.rvu01
         IF (NOT li_result) THEN
             LET g_success='N'
         END IF
#        CALL s_smyauno(l_t,l_rvu.rvu03) RETURNING g_i,l_rvu.rvu01
#        IF g_i THEN LET g_success='N' RETURN END IF
      END IF
#No.FUN-540027 ---end--
   END IF

   IF (l_rvu.rvu00='1' AND cl_null(g_rvu01_1)) THEN #入庫
      LET g_rvu01_1 = l_rvu.rvu01
   END IF

   IF (l_rvu.rvu00='2' AND cl_null(g_rvu01_2)) THEN #驗退
      LET g_rvu01_2 = l_rvu.rvu01
   END IF

   IF l_rvu.rvu00 = '1' THEN
      LET l_rvu.rvu01 = g_rvu01_1 #入庫
   ELSE
      LET l_rvu.rvu01 = g_rvu01_2 #驗退
   END IF

   LET g_cnt = 0
   SELECT COUNT(*) INTO g_cnt FROM rvu_file
    WHERE rvu01 = l_rvu.rvu01
      AND rvuconf !='X'

   IF g_cnt >=1 THEN
      CALL t110_ins_rvv(l_rvu.rvu01) #NO:7143單身
   ELSE
      LET l_rvu.rvu04=g_rva.rva05   #廠商編號
      SELECT pmc03 INTO l_rvu.rvu05 FROM pmc_file  #簡稱
       WHERE pmc01=g_rva.rva05
      LET l_rvu.rvu06=g_grup        #部門
      LET l_rvu.rvu07=g_user        #人員
      LET l_rvu.rvu08=g_rva.rva10   #性質
      LET l_rvu.rvu09=NULL
      LET l_rvu.rvu20='N'           #三角貿易拋轉否no.4475
      LET l_rvu.rvuconf='N'         #確認碼
      LET l_rvu.rvuacti='Y'
      LET l_rvu.rvuuser=g_rva.rvauser
      LET l_rvu.rvugrup=g_rva.rvagrup
      LET l_rvu.rvumodu=' '
      LET l_rvu.rvudate=g_today
      LET l_rvu.rvuplant=g_plant    #by lily add 20141212
      LET l_rvu.rvulegal=g_legal    #by lily add 20141212
      LET l_rvu.rvu21=' '           #by lily add 20141212
      LET l_rvu.rvu900=0            #by lily add 20141212
      LET l_rvu.rvumksg=' '         #by lily add 20141212
      LET l_rvu.rvupos='1'          #by lily add 20141212
      LET l_rvu.rvu17=0             #by lily add 20141212
      LET l_rvu.rvu27=' '           #by lily add 20141212


      IF l_rvu.rvu00 = '1' THEN #入庫時帶出送貨地點 130705
        LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt FROM rvb_file WHERE rvb01 = g_rva.rva01
        IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF

        LET l_cnt1 = 0
        SELECT COUNT(*) INTO l_cnt1 FROM pmm_file,rvb_file
         WHERE pmm01=rvb04
           AND ta_pmm07 IS NOT NULL
           AND ta_pmm08 = 'Y'
          AND rvb01 = g_rva.rva01
        IF cl_null(l_cnt1) THEN LET l_cnt1 = 0 END IF

        IF (l_cnt != l_cnt1) AND l_cnt1 > 0 THEN
           LET g_msg = "集團交易送貨地點不統一，請確認!"
           CALL cl_err(g_msg,'!',1)
           LET g_success = 'N'
           RETURN
        END IF

        IF l_cnt1 > 0 THEN
          LET l_sql = " SELECT  DISTINCT ta_pmm08,ta_pmm07 FROM pmm_file,rvb_file ",
                    "   WHERE rvb04 = pmm01 ",
                    "     AND rvb01 = '",g_rva.rva01,"'"

          PREPARE t110_pmm_pp2 FROM l_sql
          DECLARE t110_pmm_cc2 CURSOR FOR t110_pmm_pp2
          LET l_cnt = 0
          LET l_ta_pmm08 = NULL
          LET l_ta_pmm07 = NULL
          FOREACH t110_pmm_cc2 INTO l_ta_pmm08,l_ta_pmm07
           LET l_cnt = l_cnt + 1
          END FOREACH
          IF l_cnt > 1 THEN
             LET g_msg = "集團交易送貨地點不統一，請確認!"
             CALL cl_err(g_msg,'!',1)
             LET g_success = 'N'
             RETURN
          END IF
        END IF
       IF NOT cl_null(l_ta_pmm08) AND NOT cl_null(l_ta_pmm07) THEN
          LET l_rvu.ta_rvu02 = l_ta_pmm08
          LET l_rvu.ta_rvu03 = l_ta_pmm07
       END IF
      END IF


      INSERT INTO rvu_file VALUES (l_rvu.*)
      IF STATUS THEN
#        CALL cl_err('ins rvu:1',STATUS,1) #No.FUN-660129
#No.FUN-710030 -- begin --
#         CALL cl_err3("ins","rvu_file",l_rvu.rvu01,"",STATUS,"","ins rvu:1",1) #No.FUN-660129
         IF g_bgerr THEN
            CALL s_errmsg("rvu01",l_rvu.rvu01,"ins rvu:1",STATUS,1)
         ELSE
            CALL cl_err3("ins","rvu_file",l_rvu.rvu01,"",STATUS,"","ins rvu:1",1)
         END IF
#No.FUN-710030 -- end --
         LET g_success='N'
      ELSE
         IF l_rvu.rvu00 = '1' THEN
            #產生的入庫異動單
#TQC-740117 begin
            CALL cl_err(l_rvu.rvu01,'apm-112',1)
##No.FUN-710030 -- begin --
##            CALL cl_err(l_rvu.rvu01,'apm-112',1)
#            IF g_bgerr THEN
#               CALL s_errmsg("","",l_rvu.rvu01,"apm-112",1)
#            ELSE
#               CALL cl_err3("","","","","apm-112","",l_rvu.rvu01,1)
#            END IF
##No.FUN-710030 -- end --
#TQC-740117 end
         ELSE
            #產生的驗退異動單

#TQC-740117 begin

################by cjy 101123 add 當不良品收貨時直接產生驗退單#########################

    LET l_smycount =0
         SELECT COUNT(*) INTO l_smycount FROM tc_smy_file WHERE tc_smy02='11' and tc_smy01=substr(g_rva.rva01,1,3)

     IF  l_smycount=0  THEN


            CALL cl_err(l_rvu.rvu01,'apm-124',1)

       END IF




   ############################################ END ############################################


##No.FUN-710030 -- begin --
##            CALL cl_err(l_rvu.rvu01,'apm-124',1)
#      IF g_bgerr THEN
#         CALL s_errmsg("","",l_rvu.rvu01,"apm-124",1)
#      ELSE
#         CALL cl_err3("","","","","apm-124","",l_rvu.rvu01,1)
#      END IF
##No.FUN-710030 -- end --
#TQC-740117 end
         END IF
      END IF
      CALL t110_ins_rvv(l_rvu.rvu01) #NO:7143單身
   END IF

END FUNCTION

FUNCTION t110_ins_rvv(p_rvv01)
 DEFINE g_qcz     RECORD LIKE qcz_file.*
 DEFINE l_ima44   LIKE ima_file.ima44   #No.FUN-540027
 DEFINE l_rvv     RECORD LIKE rvv_file.*,
        l_rvuconf LIKE rvu_file.rvuconf,
        l_smy57   LIKE type_file.chr1,         #MOD-740033 add
        l_t       LIKE smy_file.smyslip,       #MOD-740033 add
        p_rvv01   LIKE rvv_file.rvv01
 DEFINE l_pmm43   LIKE pmm_file.pmm43     #CHI-830033
  DEFINE l_tc_soa43 LIKE tc_soa_file.tc_soa43
 DEFINE l_cnt LIKE type_file.num5
  DEFINE l_ta_imd20 LIKE imd_file.ta_imd20
 DEFINE l_ta_imd21 LIKE imd_file.ta_imd21
 DEFINE l_ta_imz01 LIKE imz_file.ta_imz01 #140801

   LET l_rvv.rvv01 = p_rvv01 #NO:7143

   SELECT * INTO g_qcz.* FROM qcz_file WHERE qcz00='0'

  #MOD-740033-begin-add
   LET l_t = s_get_doc_no(g_rva.rva01)

   SELECT smy57[3,3] INTO l_smy57 FROM smy_file
    WHERE smyslip=l_t

  IF l_smy57='N' THEN
     #----單身
     SELECT COUNT(*) INTO g_i FROM rvv_file,rvu_file     #防止重覆過帳
      WHERE rvv04=g_rva.rva01  #收貨單號
        AND rvv05=b_rvb.rvb02  #收貨項次
        AND rvu01=rvv01
        AND rvuconf != 'X'                               #排除已作廢之倉退單
  ELSE
  #MOD-740033-end-add
   #----單身
    SELECT COUNT(*) INTO g_i FROM rvv_file
    WHERE rvv04=g_rva.rva01  #收貨單號
      AND rvv05=b_rvb.rvb02  #收貨項次
  END IF   #MOD-740033 add
   IF g_i > 0 THEN
      LET g_success = 'N'
      RETURN
   END IF

   IF b_rvb.rvb33=0 THEN
      SELECT rvuconf INTO l_rvuconf FROM rvu_file
       WHERE rvu01=l_rvv.rvv01 #入庫單號/退貨單號
         AND rvu02=g_rva.rva01 #收貨單號
         AND rvu00='2'         #2.驗退
         AND rvuconf !='X'

      IF l_rvuconf = 'Y' THEN
         LET g_success = 'N'
         RETURN
      END IF

      SELECT MAX(rvv02)+1 INTO l_rvv.rvv02 FROM rvv_file   #序號
       WHERE rvv01=l_rvv.rvv01

      LET l_rvv.rvv03='2'                                  #異動類別
      LET l_rvv.rvv17=b_rvb.rvb07

      #No.FUN-540027  --begin
      IF g_sma.sma115 = 'Y' THEN
         LET l_rvv.rvv80=b_rvb.rvb80
         LET l_rvv.rvv81=b_rvb.rvb81
         LET l_rvv.rvv82=b_rvb.rvb82
         LET l_rvv.rvv83=b_rvb.rvb83
         LET l_rvv.rvv84=b_rvb.rvb84
         LET l_rvv.rvv85=b_rvb.rvb85
      END IF

      LET l_rvv.rvv86=b_rvb.rvb86
      LET l_rvv.rvv87=b_rvb.rvb87
      #No.FUN-540027  --end
   ELSE
      SELECT rvuconf INTO l_rvuconf FROM rvu_file
       WHERE rvu01 = l_rvv.rvv01 #入庫單號/退貨單號
         AND rvu02 = g_rva.rva01 #收貨單號
         AND rvu00 = '1'         #1.入庫
         AND rvuconf != 'X'

      IF l_rvuconf = 'Y' THEN
         LET g_success = 'N'
         RETURN
      END IF

      SELECT MAX(rvv02)+1 INTO l_rvv.rvv02 FROM rvv_file   #序號
       WHERE rvv01=l_rvv.rvv01
      LET l_rvv.rvv03='1'                                  #異動類別
      LET l_rvv.rvv17=b_rvb.rvb07     #數量

      #No.FUN-540027  --begin
      IF g_sma.sma115 = 'Y' THEN
         LET l_rvv.rvv80=b_rvb.rvb80
         LET l_rvv.rvv81=b_rvb.rvb81
         LET l_rvv.rvv82=b_rvb.rvb82
         LET l_rvv.rvv83=b_rvb.rvb83
         LET l_rvv.rvv84=b_rvb.rvb84
         LET l_rvv.rvv85=b_rvb.rvb85
      END IF
      LET l_rvv.rvv86=b_rvb.rvb86
      LET l_rvv.rvv87=b_rvb.rvb87
      #No.FUN-540027  --end
      IF NOT cl_null(b_rvb.rvb33) THEN LET l_rvv.rvv17=b_rvb.rvb33 END IF
      #No.FUN-580115  --begin
      IF NOT cl_null(b_rvb.rvb331) THEN LET l_rvv.rvv82=b_rvb.rvb331 END IF
      IF NOT cl_null(b_rvb.rvb332) THEN LET l_rvv.rvv85=b_rvb.rvb332 END IF
      #No.FUN-580115  --end
   END IF

   IF cl_null(l_rvv.rvv02) THEN LET l_rvv.rvv02=1 END IF
   LET l_rvv.rvv04=g_rva.rva01     #驗收單號
   LET l_rvv.rvv05=b_rvb.rvb02     #驗收項次
   LET l_rvv.rvv06=g_rva.rva05     #廠商
   #130902bm LET l_rvv.rvv09=g_today         #異動日
   LET l_rvv.rvv09= g_rva.rva06
   LET l_rvv.rvv18=b_rvb.rvb34     #工單編號
   LET l_rvv.rvv23=0               #已請款匹配數量
   LET l_rvv.rvv88=0               #No.TQC-7B0083
   LET l_rvv.rvv24=NULL
   LET l_rvv.rvv25=b_rvb.rvb35     #樣品
   LET l_rvv.rvv26=NULL
   LET l_rvv.rvv31=b_rvb.rvb05     #料號
   LET l_rvv.rvvplant=g_plant      #by lily add 20141212
   LET l_rvv.rvvlegal=g_legal      #by lily add 20141212
   LET l_rvv.rvv10=' '             #by lily add 20141212


   #No.FUN-540027  --begin
   SELECT ima44 INTO l_ima44 FROM ima_file WHERE ima01=l_rvv.rvv31
   #No.FUN-540027  --end

   IF b_rvb.rvb05[1,4]='MISC' THEN      #品名
      SELECT pmn041 INTO l_rvv.rvv031 FROM pmn_file
       WHERE pmn01=b_rvb.rvb04 AND pmn02=b_rvb.rvb03
   ELSE
      SELECT ima02 INTO l_rvv.rvv031 FROM ima_file
       WHERE ima01=b_rvb.rvb05
   END IF

   LET l_rvv.rvv32=b_rvb.rvb36     #倉庫
   LET l_rvv.rvv33=b_rvb.rvb37     #儲位
   LET l_rvv.rvv34=b_rvb.rvb38     #批號
   IF cl_null(l_rvv.rvv32) THEN LET l_rvv.rvv32=' ' END IF
   IF cl_null(l_rvv.rvv33) THEN LET l_rvv.rvv33=' ' END IF
   IF cl_null(l_rvv.rvv34) THEN LET l_rvv.rvv34=' ' END IF

   SELECT pmn07,pmn09 INTO l_rvv.rvv35,l_rvv.rvv35_fac
     FROM pmn_file                 #單位,轉換率
    WHERE pmn01 = b_rvb.rvb04
      AND pmn02 = b_rvb.rvb03

#MOD-790167-modify
#MOD-790167-add sma886[7,7]的check因免驗不直接入庫(sma886[7]='N')時
#不須檢查img_file的合理性
   IF NOT cl_null(l_rvv.rvv32) AND g_sma.sma886[7,7] = 'Y' THEN
#MOD-790167-modify-end
      SELECT img09 INTO g_img09_t FROM img_file
       WHERE img01 = l_rvv.rvv31
         AND img02 = l_rvv.rvv32
         AND img03 = l_rvv.rvv33
         AND img04 = l_rvv.rvv34
      CALL s_umfchk(l_rvv.rvv31,l_rvv.rvv35,g_img09_t)
           RETURNING g_i,l_rvv.rvv35_fac
      IF g_i = 1 THEN
         ### ------單位無法轉換--------####
#No.FUN-710030 -- begin --
#         CALL cl_err('rvv35/img09: ','abm-731',1)
         IF g_bgerr THEN
            CALL s_errmsg("","","rvv35/img09: ","abm-731",1)
         ELSE
            CALL cl_err3("","","","","abm-731","","rvv35/img09: ",1)
         END IF
#No.FUN-710030 -- end --
         LET g_success ='N'
         RETURN
      END IF

      #No.FUN-540027  --begin
      LET g_ima906 = NULL
      LET g_ima907 = NULL
      SELECT ima906,ima907 INTO g_ima906,g_ima907 FROM ima_file
       WHERE ima01=l_rvv.rvv31

      IF g_sma.sma115 = 'Y' AND g_ima906 MATCHES '[23]' THEN
         IF NOT cl_null(l_rvv.rvv83) THEN
            CALL s_chk_imgg(l_rvv.rvv31,l_rvv.rvv32,l_rvv.rvv33,l_rvv.rvv34,
                            l_rvv.rvv83) RETURNING g_flag
            IF g_flag = 1 THEN
               CALL s_add_imgg(l_rvv.rvv31,l_rvv.rvv32,
                               l_rvv.rvv33,l_rvv.rvv34,
                               l_rvv.rvv83,l_rvv.rvv84,
                               l_rvv.rvv01,l_rvv.rvv02,0) RETURNING g_flag
               IF g_flag = 1 THEN
                  LET g_success = 'N'
                  RETURN
               END IF
            END IF

            #No.FUN-580115  --begin
            CALL s_du_umfchk(l_rvv.rvv31,'','','',l_ima44,l_rvv.rvv83,g_ima906)
                 RETURNING g_errno,l_rvv.rvv84
            #No.FUN-580115  --end

            IF NOT cl_null(g_errno) THEN
#No.FUN-710030 -- begin --
#               CALL cl_err('rvv83/ima44: ','abm-731',1)
               IF g_bgerr THEN
                  CALL s_errmsg("","","rvv83/ima44: ","abm-731",1)
               ELSE
                  CALL cl_err3("","","","","abm-731","","rvv83/ima44: ",1)
               END IF
#No.FUN-710030 -- end --
               LET g_success = 'N' RETURN
            END IF
         END IF

         IF NOT cl_null(l_rvv.rvv80) AND g_ima906 = '2' THEN
            CALL s_chk_imgg(l_rvv.rvv31,l_rvv.rvv32,l_rvv.rvv33,l_rvv.rvv34,
                            l_rvv.rvv80) RETURNING g_flag
            IF g_flag = 1 THEN
               CALL s_add_imgg(l_rvv.rvv31,l_rvv.rvv32,
                               l_rvv.rvv33,l_rvv.rvv34,
                               l_rvv.rvv80,l_rvv.rvv81,
                               l_rvv.rvv01,l_rvv.rvv02,0) RETURNING g_flag
               IF g_flag = 1 THEN
                  LET g_success = 'N'
                  RETURN
               END IF
            END IF

            CALL s_umfchk(l_rvv.rvv31,l_rvv.rvv80,l_ima44)
                 RETURNING g_i,l_rvv.rvv81
            IF g_i = 1 THEN
#No.FUN-710030 -- begin --
#               CALL cl_err('rvv80/ima44: ','abm-731',1)
               IF g_bgerr THEN
                  CALL s_errmsg("","","rvv80/ima44: ","abm-731",1)
               ELSE
                  CALL cl_err3("","","","","abm-731","","rvv80/ima44: ",1)
               END IF
#No.FUN-710030 -- end --
               LET g_success = 'N' RETURN
            END IF
         END IF

         #No.FUN-580115  --begin
         IF g_ima906 = '3' THEN
            IF l_rvv.rvv85 <> 0 THEN
               LET l_rvv.rvv84=l_rvv.rvv82/l_rvv.rvv85
            ELSE
               LET l_rvv.rvv84=0
            END IF
         END IF
         #No.FUN-580115  --end
      END IF
      #No.FUN-540027  ---end

      #No.FUN-580115  --begin
      #IF g_sma.sma116 MATCHES '[13]' THEN    #No:FUN-610076  #TQC-770117 mark
         IF g_sma.sma115='Y' THEN
            CALL t110_set_rvv87(l_rvv.rvv31,l_rvv.rvv84,l_rvv.rvv85,
                                l_rvv.rvv81,l_rvv.rvv82,l_rvv.rvv86,0,'')
                 RETURNING l_rvv.rvv87
         ELSE
            CALL t110_set_rvv87(l_rvv.rvv31,1,0,1,l_rvv.rvv17,
                                l_rvv.rvv86,1,l_rvv.rvv35)
                 RETURNING l_rvv.rvv87
         END IF
      #END IF      #TQC-770117 mark
      #No.FUN-580115  --end
   END IF

   #No.FUN-540027  --begin
   IF cl_null(l_rvv.rvv86) THEN
      LET l_rvv.rvv86 = l_rvv.rvv35
      LET l_rvv.rvv87 = l_rvv.rvv17
   #MOD-840130-begin-add
   ELSE
   #入庫量=實收量,收貨計價數量給予入庫數量,避免計價數量在來源是調整後的值
   #而在入庫時又重推值
    IF l_rvv.rvv17=b_rvb.rvb07  THEN
       LET l_rvv.rvv87=b_rvb.rvb87
    END IF
   #MOD-840130-end-add
   END IF
   #No.FUN-540027  --end

   LET l_rvv.rvv36=b_rvb.rvb04     #採購單號
   LET l_rvv.rvv37=b_rvb.rvb03     #採購單序號
   LET l_rvv.rvv38=b_rvb.rvb10
   LET l_rvv.rvv38t=b_rvb.rvb10t   #No:FUN-550117
   #No.FUN-540027  --begin
  #LET l_rvv.rvv39=l_rvv.rvv17*l_rvv.rvv38
  #LET l_rvv.rvv39t=l_rvv.rvv17*l_rvv.rvv38t   #No.FUN-540027
   LET l_rvv.rvv39=l_rvv.rvv87*l_rvv.rvv38
   LET l_rvv.rvv39t=l_rvv.rvv87*l_rvv.rvv38t   #No.FUN-540027
   #No.FUN-540027  --end
   LET l_rvv.rvv41=b_rvb.rvb25     #手冊編號 no.A050
   LET l_rvv.rvv930=b_rvb.rvb930  #成本中心 #FUN-670051

   LET t_azi04=''            #No.CHI-6A0004
   SELECT azi04 INTO t_azi04  #No.CHI-6A0004
     FROM pmm_file,azi_file
    WHERE pmm22=azi01
      AND pmm01 = l_rvv.rvv36 #採購單號
      AND pmm18 <> 'X'

   IF cl_null(t_azi04) THEN  #No.CHI-6A0004
      LET t_azi04=0   #No.CHI-6A0004
   END IF

   CALL cl_digcut(l_rvv.rvv39,t_azi04) RETURNING l_rvv.rvv39   #No.CHI-6A0004

   #CHI-830033-begin-add
   #不使用單價*數量=金額, 改以金額回推稅率, 以避免小數位差的問題
   SELECT gec07,pmm43 INTO g_gec07,l_pmm43 FROM gec_file,pmm_file
    WHERE gec01 = pmm21
      AND pmm01 = l_rvv.rvv36
   IF SQLCA.SQLCODE = 100 THEN
      CALL cl_err('','mfg3192',0)
      LET g_success = 'N'
      RETURN
   END IF
   IF g_gec07='Y' THEN
      LET l_rvv.rvv39 = l_rvv.rvv39t / ( 1 + l_pmm43/100)
      LET l_rvv.rvv39 = cl_digcut(l_rvv.rvv39 , t_azi04)
   ELSE
      LET l_rvv.rvv39t = l_rvv.rvv39 * ( 1 + l_pmm43/100)
      LET l_rvv.rvv39t = cl_digcut( l_rvv.rvv39t , t_azi04)
   END IF
   #CHI-830033-end-add


   LET l_rvv.rvv40 = 'N'
   #no.TQC-790003 start---
   IF cl_null(l_rvv.rvv02) THEN LET l_rvv.rvv02 = 1 END IF
   #no.TQC-790003 end-----

   LET l_rvv.rvv88 = 0  #No.TQC-7B0083
   IF cl_null(l_rvv.rvv89) THEN LET l_rvv.rvv89 = 'N' END IF #by stevie 150327

  ######140716bm begin 增加刀具寿命栏位############################
    LET l_ta_imz01 = NULL
   SELECT ta_imz01 INTO l_ta_imz01 FROM ima_file,imz_file
    WHERE imz01 = ima06
      AND ima01 = l_rvv.rvv31
   IF cl_null(l_ta_imz01) THEN LET l_ta_imz01 = 'N' END IF
   IF l_ta_imz01 = 'Y' THEN
     LET l_tc_soa43 = NULL
     SELECT tc_soa43 INTO l_tc_soa43 FROM tc_soa_file WHERE tc_soa00 = '0'
     IF l_tc_soa43 = 'Y' THEN
         LET l_ta_imd20 = NULL
         LET l_ta_imd21 = NULL
         SELECT ta_imd20,ta_imd21 INTO l_ta_imd20,l_ta_imd21 FROM imd_file
          WHERE imd01 = l_rvv.rvv32
         IF NOT cl_null(l_ta_imd21) THEN
            LET l_rvv.ta_rvv02 = l_rvv.rvv17
         END IF
         IF NOT cl_null(l_ta_imd20) THEN
            LET l_rvv.ta_rvv03 = l_ta_imd20
         END IF
     END IF
   END IF
   ########140716 end ###########################################

   INSERT INTO rvv_file VALUES (l_rvv.*)
   IF STATUS THEN
#     CALL cl_err('i rvv:',STATUS,1)  #No.FUN-660129
#No.FUN-710030 -- begin --
#      CALL cl_err3("ins","rvv_file",l_rvv.rvv01,l_rvv.rvv02,STATUS,"","i rvv:",1) #No.FUN-660129
      IF g_bgerr THEN
         LET g_showmsg = l_rvv.rvv01,"/",l_rvv.rvv02
         CALL s_errmsg("rvv01,rvv02",g_showmsg,"i rvv:",SQLCA.sqlcode,1)
      ELSE
         CALL cl_err3("ins","rvv_file",l_rvv.rvv01,l_rvv.rvv02,STATUS,"","i rvv:",1)
      END IF
#No.FUN-710030 -- end --
      LET g_success='N'
   END IF

END FUNCTION

FUNCTION t110_insrvu()
  DEFINE l_rvb   RECORD LIKE rvb_file.*,
         l_rvu   RECORD LIKE rvu_file.*,
         l_rvv   RECORD LIKE rvv_file.*,
         l_smy57 LIKE type_file.chr1,       #No.FUN-680136 VARCHAR(01)
         l_t     LIKE smy_file.smyslip      #No.FUN-680136 VARCHAR(5)  #No.FUN-540027
  DEFINE li_result LIKE type_file.num5      #No.FUN-540027 #No.FUN-680136 SMALLINT
  DEFINE l_ima44   LIKE ima_file.ima44      #No.FUN-540027
  DEFINE l_pmm43   LIKE pmm_file.pmm43     #CHI-830033

   #-->判斷此驗收單是否已產生入庫
   SELECT COUNT(*) INTO g_i FROM rvu_file WHERE rvu02=g_rva.rva01
      AND rvuconf !='X'
   IF g_i>0 THEN LET g_success = 'N' RETURN END IF
   INITIALIZE l_rvu.* TO NULL
   LET l_rvu.rvu00='1'                          #異動類別
   LET l_rvu.rvu02=g_rva.rva01                  #驗收單號
  #121206 LET l_rvu.rvu03=g_today                      #異動日期
   LET l_rvu.rvu03= g_rva.rva06                      #異動日期

   #日期<=關帳日期
   IF NOT cl_null(g_sma.sma53) AND l_rvu.rvu03 <= g_sma.sma53 THEN
#No.FUN-710030 -- begin --
#      CALL cl_err(l_rvu.rvu03,'mfg9999',1)
      IF g_bgerr THEN
         CALL s_errmsg("","",l_rvu.rvu03,"mfg9999",1)
      ELSE
         CALL cl_err3("","","","","mfg9999","",l_rvu.rvu03,1)
      END IF
#No.FUN-710030 -- end --
      LET g_success='N'
      RETURN
   END IF
   CALL s_yp(l_rvu.rvu03) RETURNING g_yy,g_mm
   IF (g_yy*12+g_mm)>(g_sma.sma51*12+g_sma.sma52)THEN #不可大於現行年月
      CALL cl_err(l_rvu.rvu03,'mfg6091',1)
      LET g_success='N'
      RETURN
   END IF

   LET l_t = s_get_doc_no(g_rva.rva01)       #No.FUN-540027
   SELECT smy52,smy57[3,3] INTO l_rvu.rvu01,l_smy57
     FROM smy_file WHERE smyslip=l_t
   IF l_rvu.rvu01 IS NULL THEN
#No.FUN-710030 -- begin --
#      CALL cl_err('smy52=NULL','apm-272',1)
      IF g_bgerr THEN
         CALL s_errmsg("","","smy52=NULL","apm-272",1)
      ELSE
         CALL cl_err3("","","","","apm-272","","smy52=NULL",1)
      END IF
#No.FUN-710030 -- end --
      LET g_success = 'N'
      RETURN
   END IF
   IF l_smy57='Y' THEN
#No.FUN-560060--begin
#     LET l_rvu.rvu01[4,10]=g_rva.rva01[4,10]      #入庫單號
      LET l_rvu.rvu01[g_no_sp-1,g_no_ep]=g_rva.rva01[g_no_sp-1,g_no_ep]      #入庫單號
#No.FUN-560060--end
      SELECT COUNT(*) INTO g_cnt FROM rvu_file WHERE rvu01=l_rvu.rvu01
         AND rvuconf != 'X'
      IF g_cnt > 0 THEN
#No.FUN-540027 --start--
        LET l_t = l_rvu.rvu01[1,g_doc_len]         #No.FUN-560060
        CALL s_auto_assign_no("apm",l_t,g_rva.rva06,"","","","","","")
             RETURNING li_result,l_rvu.rvu01
        IF (NOT li_result) THEN
            LET g_success='N'
            RETURN #TQC-750097
        END IF
#        DISPLAY BY NAME g_rva.rva01
#         CALL s_smyauno(l_t,g_rva.rva06) RETURNING g_i,l_rvu.rvu01
#         IF g_i THEN LET g_success='N' RETURN END IF
      END IF
   ELSE
         LET l_t = l_rvu.rvu01[1,g_doc_len]        #No.FUN-560060
         CALL s_auto_assign_no("apm",l_t,l_rvu.rvu03,"","","","","","")
              RETURNING li_result,l_rvu.rvu01
         IF (NOT li_result) THEN
             LET g_success='N'
             RETURN #TQC-750097
         END IF
#      CALL s_smyauno(l_t,l_rvu.rvu03) RETURNING g_i,l_rvu.rvu01
#      IF g_i THEN LET g_success='N' RETURN END IF
   END IF
#No.FUN-540027 --end-

   LET l_rvu.rvu04=g_rva.rva05                  #廠商編號
   SELECT pmc03 INTO l_rvu.rvu05 FROM pmc_file  #簡稱
   WHERE pmc01=g_rva.rva05
   LET l_rvu.rvu06=g_grup        #部門
   LET l_rvu.rvu07=g_user        #人員
   LET l_rvu.rvu08=g_rva.rva10   #性質
   LET l_rvu.rvu09=NULL
   LET l_rvu.rvuconf='N'         #確認碼
   LET l_rvu.rvuacti='Y'
   LET l_rvu.rvu20='N'           #三角貿易拋轉否 no.4475
   LET l_rvu.rvuuser=g_rva.rvauser
   LET l_rvu.rvugrup=g_rva.rvagrup
   LET l_rvu.rvumodu=' '
   LET l_rvu.rvudate=g_today
   INSERT INTO rvu_file VALUES (l_rvu.*)
   IF STATUS THEN
#     CALL cl_err('ins rvu:2',STATUS,1)  #No.FUN-660129
#No.FUN-710030 -- begin --
#      CALL cl_err3("ins","rvu_file",l_rvu.rvu01,"",STATUS,"","ins rvu:2",1) #No.FUN-660129
      IF g_bgerr THEN
         CALL s_errmsg("rvu01",l_rvu.rvu01,"ins rvu:2",STATUS,1)
      ELSE
         CALL cl_err3("ins","rvu_file",l_rvu.rvu01,"",STATUS,"","ins rvu:2",1)
      END IF
#No.FUN-710030 -- end --
      LET g_success='N'
      RETURN #TQC-750097
   END IF
   #-->單身
   DECLARE t110_y1 CURSOR WITH HOLD FOR
      SELECT * FROM rvb_file
       WHERE rvb01=g_rva.rva01
         AND rvb39='N' #檢驗否為'N' #NO:7143

   FOREACH t110_y1 INTO l_rvb.*
      LET l_rvv.rvv01=l_rvu.rvu01     #單號
      SELECT MAX(rvv02)+1 INTO l_rvv.rvv02 FROM rvv_file   #序號
       WHERE rvv01=l_rvu.rvu01
      IF cl_null(l_rvv.rvv02) THEN LET l_rvv.rvv02=1 END IF
      LET l_rvv.rvv03='1'             #異動類別
      LET l_rvv.rvv04=g_rva.rva01     #驗收單號
      LET l_rvv.rvv05=l_rvb.rvb02     #驗收項次
      LET l_rvv.rvv06=g_rva.rva05     #廠商
      #130902LET l_rvv.rvv09=g_today         #異動日
      LET l_rvv.rvv09= g_rva.rva06
      LET l_rvv.rvv17=l_rvb.rvb07     #數量
      IF NOT cl_null(l_rvb.rvb33) THEN LET l_rvv.rvv17=l_rvb.rvb33 END IF
      #No.FUN-580115  --begin
      IF NOT cl_null(l_rvb.rvb331) THEN LET l_rvv.rvv82=l_rvb.rvb331 END IF
      IF NOT cl_null(l_rvb.rvb332) THEN LET l_rvv.rvv85=l_rvb.rvb332 END IF
      #No.FUN-580115  --end
      #if rvv33 <> rvv07 ,it will occur errors
      #No.FUN-540027  --begin
      IF g_sma.sma115 = 'Y' THEN
         LET l_rvv.rvv80=l_rvb.rvb80
         LET l_rvv.rvv81=l_rvb.rvb81
         LET l_rvv.rvv82=l_rvb.rvb82
         LET l_rvv.rvv83=l_rvb.rvb83
         LET l_rvv.rvv84=l_rvb.rvb84
         LET l_rvv.rvv85=l_rvb.rvb85
      END IF
      LET l_rvv.rvv86=l_rvb.rvb86
      LET l_rvv.rvv87=l_rvb.rvb87
      #No.FUN-540027  --end
      LET l_rvv.rvv18=l_rvb.rvb34     #工單編號
      LET l_rvv.rvv23=0               #已請款匹配數量
      LET l_rvv.rvv88=0               #No.TQC-7B0083
      LET l_rvv.rvv24=NULL
      LET l_rvv.rvv25=l_rvb.rvb35     #樣品
      LET l_rvv.rvv26=NULL
      LET l_rvv.rvv31=l_rvb.rvb05     #料號
      IF l_rvb.rvb05[1,4]='MISC' THEN      #品名
         SELECT pmn041 INTO l_rvv.rvv031 FROM pmn_file
          WHERE pmn01=l_rvb.rvb04 AND pmn02=l_rvb.rvb03
      ELSE
         SELECT ima02 INTO l_rvv.rvv031 FROM ima_file
          WHERE ima01=l_rvb.rvb05
      END IF
      #No.FUN-540027  --begin
      SELECT ima44 INTO l_ima44 FROM ima_file WHERE ima01=l_rvv.rvv31
      #No.FUN-540027  --end
      LET l_rvv.rvv32=l_rvb.rvb36     #倉庫
      LET l_rvv.rvv33=l_rvb.rvb37     #儲位
      LET l_rvv.rvv34=l_rvb.rvb38     #批號
      IF cl_null(l_rvv.rvv32) THEN LET l_rvv.rvv32=' ' END IF
      IF cl_null(l_rvv.rvv33) THEN LET l_rvv.rvv33=' ' END IF
      IF cl_null(l_rvv.rvv34) THEN LET l_rvv.rvv34=' ' END IF

      # 重取換算
      SELECT pmn07,pmn09 INTO l_rvv.rvv35,l_rvv.rvv35_fac
        FROM pmn_file                 #單位,轉換率
       WHERE pmn01=l_rvb.rvb04 AND pmn02=l_rvb.rvb03
      IF NOT cl_null(l_rvv.rvv32) THEN
         SELECT img09 INTO g_img09_t FROM img_file
          WHERE img01=l_rvv.rvv31 AND img02=l_rvv.rvv32
            AND img03=l_rvv.rvv33 AND img04=l_rvv.rvv34

         CALL s_umfchk(l_rvv.rvv31,l_rvv.rvv35,g_img09_t)
              RETURNING g_i,l_rvv.rvv35_fac

         IF g_i = 1 THEN
            ### ------單位無法轉換--------####
#No.FUN-710030 -- begin --
#            CALL cl_err('rvv35/img09: ','abm-731',1)
            IF g_bgerr THEN
               CALL s_errmsg("","","rvv35/img09: ","abm-731",1)
            ELSE
               CALL cl_err3("","","","","abm-731","","rvv35/img09: ",1)
            END IF
#No.FUN-710030 -- end --
            LET g_success ='N'
            RETURN
         END IF
         #No.FUN-540027  --begin
         LET g_ima906 = NULL
         LET g_ima907 = NULL

         SELECT ima906,ima907 INTO g_ima906,g_ima907 FROM ima_file
          WHERE ima01=l_rvv.rvv31

         IF g_sma.sma115 = 'Y' AND g_ima906 MATCHES '[23]' THEN
            IF NOT cl_null(l_rvv.rvv83) THEN
               CALL s_chk_imgg(l_rvv.rvv31,l_rvv.rvv32,l_rvv.rvv33,l_rvv.rvv34,
                               l_rvv.rvv83) RETURNING g_flag

               IF g_flag = 1 THEN
                  CALL s_add_imgg(l_rvv.rvv31,l_rvv.rvv32,
                                  l_rvv.rvv33,l_rvv.rvv34,
                                  l_rvv.rvv83,l_rvv.rvv84,
                                  l_rvv.rvv01,l_rvv.rvv02,0) RETURNING g_flag
                  IF g_flag = 1 THEN
                     LET g_success = 'N'
                     RETURN
                  END IF
               END IF
               #No.FUN-580115  --begin
               CALL s_du_umfchk(l_rvv.rvv31,'','','',
                                l_ima44,l_rvv.rvv83,g_ima906)
               #No.FUN-580115  --end
                    RETURNING g_errno,l_rvv.rvv84
               IF NOT cl_null(g_errno) THEN
#No.FUN-710030 -- begin --
#                  CALL cl_err('rvv83/ima44: ','abm-731',1)
                  IF g_bgerr THEN
                     CALL s_errmsg("","","rvv83/ima44: ","abm-731",1)
                  ELSE
                     CALL cl_err3("","","","","abm-731","","rvv83/ima44: ",1)
                  END IF
#No.FUN-710030 -- end --
                  LET g_success = 'N'
                  RETURN
               END IF
            END IF

            IF NOT cl_null(l_rvv.rvv80) AND g_ima906 = '2' THEN
               CALL s_chk_imgg(l_rvv.rvv31,l_rvv.rvv32,l_rvv.rvv33,l_rvv.rvv34,
                               l_rvv.rvv80) RETURNING g_flag
               IF g_flag = 1 THEN
                  CALL s_add_imgg(l_rvv.rvv31,l_rvv.rvv32,
                                  l_rvv.rvv33,l_rvv.rvv34,
                                  l_rvv.rvv80,l_rvv.rvv81,
                                  l_rvv.rvv01,l_rvv.rvv02,0) RETURNING g_flag
                  IF g_flag = 1 THEN
                     LET g_success = 'N'
                     RETURN
                  END IF
               END IF
               CALL s_umfchk(l_rvv.rvv31,l_rvv.rvv80,l_ima44)
                    RETURNING g_i,l_rvv.rvv81
               IF g_i = 1 THEN
#No.FUN-710030 -- begin --
#                  CALL cl_err('rvv80/ima44: ','abm-731',1)
                  IF g_bgerr THEN
                     CALL s_errmsg("","","rvv80/ima44: ","abm-731",1)
                  ELSE
                     CALL cl_err3("","","","",SQLCA.sqlcode,"","rvv80/ima44: ",1)
                  END IF
#No.FUN-710030 -- end --
                  LET g_success = 'N'
                  RETURN
               END IF
            END IF

            #No.FUN-580115  --begin
            IF g_ima906 = '3' THEN
               IF l_rvv.rvv85 <> 0 THEN
                  LET l_rvv.rvv84=l_rvv.rvv82/l_rvv.rvv85
               ELSE
                  LET l_rvv.rvv84=0
               END IF
            END IF
            #No.FUN-540027  --end
         END IF

         #No.FUN-580115  --begin
         #IF g_sma.sma116 MATCHES '[13]' THEN    #No:FUN-610076  #TQC-770117 mark
            IF g_sma.sma115='Y' THEN
               CALL t110_set_rvv87(l_rvv.rvv31,l_rvv.rvv84,l_rvv.rvv85,
                                   l_rvv.rvv81,l_rvv.rvv82,l_rvv.rvv86,0,'')
                    RETURNING l_rvv.rvv87
            ELSE
               CALL t110_set_rvv87(l_rvv.rvv31,1,0,1,l_rvv.rvv17,
                                   l_rvv.rvv86,1,l_rvv.rvv35)
                    RETURNING l_rvv.rvv87
            END IF
         #END IF      #TQC-770117 mark
         #No.FUN-580115  --end
      END IF
      LET l_rvv.rvv36=l_rvb.rvb04     #採購單號
      LET l_rvv.rvv37=l_rvb.rvb03     #採購單序號
      LET l_rvv.rvv38=l_rvb.rvb10
      LET l_rvv.rvv38t=l_rvb.rvb10t   #No:FUN-550117

      #No.FUN-540027  --begin
      IF cl_null(l_rvv.rvv86) THEN
         LET l_rvv.rvv86 = l_rvv.rvv35
         LET l_rvv.rvv87 = l_rvv.rvv17
     #MOD-840130-begin-add
     ELSE
     #入庫量=實收量,收貨計價數量給予入庫數量,避免計價數量在來源是調整後的值
     #而在入庫時又重推值
      IF l_rvv.rvv17=l_rvb.rvb07  THEN
         LET l_rvv.rvv87=l_rvb.rvb87
      END IF
     #MOD-840130-end-add
      END IF

     #LET l_rvv.rvv39=l_rvv.rvv17*l_rvv.rvv38
     #LET l_rvv.rvv39t=l_rvv.rvv17*l_rvv.rvv38t  #No.FUN-540027
      LET l_rvv.rvv39=l_rvv.rvv87*l_rvv.rvv38
      LET l_rvv.rvv39t=l_rvv.rvv87*l_rvv.rvv38t  #No.FUN-540027
      #No.FUN-540027  --end
      LET l_rvv.rvv41=l_rvb.rvb25     #手冊編號 A050
      LET t_azi04=''   #No.CHI-6A0004

      SELECT azi04 INTO t_azi04  #No.CHI-6A0004
        FROM pmm_file,azi_file
       WHERE pmm22=azi01
         AND pmm01 = l_rvv.rvv36 #採購單號
         AND pmm18 <> 'X'

      IF cl_null(t_azi04) THEN  #No.CHI-6A0004
         LET t_azi04=0          #No.CHI-6A0004
      END IF

      CALL cl_digcut(l_rvv.rvv39,t_azi04) RETURNING l_rvv.rvv39   #No.CHI-6A0004

       #CHI-830033-begin-add
       #不使用單價*數量=金額, 改以金額回推稅率, 以避免小數位差的問題
       SELECT gec07,pmm43 INTO g_gec07,l_pmm43 FROM gec_file,pmm_file
        WHERE gec01 = pmm21
          AND pmm01 = l_rvv.rvv36
       IF SQLCA.SQLCODE = 100 THEN
          CALL cl_err('','mfg3192',0)
          LET g_success = 'N'
          RETURN
       END IF
       IF g_gec07='Y' THEN
          LET l_rvv.rvv39 = l_rvv.rvv39t / ( 1 + l_pmm43/100)
          LET l_rvv.rvv39 = cl_digcut(l_rvv.rvv39 , t_azi04)
       ELSE
          LET l_rvv.rvv39t = l_rvv.rvv39 * ( 1 + l_pmm43/100)
          LET l_rvv.rvv39t = cl_digcut( l_rvv.rvv39t , t_azi04)
       END IF
       #CHI-830033-end-add

      LET l_rvv.rvv40 = 'N'      #no.5748 (default 為非沖暫估)
      LET l_rvv.rvv930=l_rvb.rvb930  #FUN-670051
      #no.TQC-790003 start---
      IF cl_null(l_rvv.rvv02) THEN LET l_rvv.rvv02 = 1 END IF
      #no.TQC-790003 end-----
      LET l_rvv.rvv88 = 0  #No.TQC-7B0083
      IF cl_null(l_rvv.rvv89) THEN LET l_rvv.rvv89 = 'N' END IF #by stevie 150327
      INSERT INTO rvv_file VALUES (l_rvv.*)
      IF STATUS THEN
#        CALL cl_err('i rvv:',STATUS,1)  #No.FUN-660129
#No.FUN-710030 -- begin --
#         CALL cl_err3("ins","rvv_file",l_rvv.rvv01,l_rvv.rvv02,STATUS,"","i rvv:",1) #No.FUN-660129
         IF g_bgerr THEN
            LET g_showmsg = l_rvv.rvv01,"/",l_rvv.rvv02
            CALL s_errmsg("rvv01,rvv02",g_showmsg,"i rvv:",SQLCA.sqlcode,1)
         ELSE
            CALL cl_err3("ins","rvv_file",l_rvv.rvv01,l_rvv.rvv02,STATUS,"","i rvv:",1)
         END IF
#No.FUN-710030 -- end --
         LET g_success = 'N'
         RETURN #TQC-750097
      END IF
   END FOREACH

END FUNCTION

FUNCTION t110_z()     #取消確認
   DEFINE l_cnt    LIKE type_file.num5    #No.FUN-680136 SMALLINT
   DEFINE l_rvb04  LIKE rvb_file.rvb04
   DEFINE l_poz011 LIKE poz_file.poz011
   DEFINE l_rvb    RECORD LIKE rvb_file.*
   DEFINE l_pmm25  LIKE pmm_file.pmm25,
          l_sfp04  LIKE sfp_file.sfp04

   IF cl_null(g_rva.rva01) THEN
      RETURN
   END IF

   SELECT * INTO g_rva.* FROM rva_file
    WHERE rva01=g_rva.rva01


   IF g_rva.rvaconf = 'N' THEN
      CALl cl_err('',9002,0)
      RETURN
   END IF

   IF g_rva.rvaconf = 'X' THEN
      CALl cl_err('',9024,0)
      RETURN
   END IF
   IF g_rva.ta_rva02 = 'Y' THEN CALL cl_err('','cpm-005',0) RETURN END IF  # 日潤已確認，不可作廢

#FUN-5A0090 add--start 已結案的採購單不可取消確認
   LET l_pmm25 = ''
   SELECT pmm25 INTO l_pmm25 FROM pmm_file
    WHERE pmm01 = g_rva.rva02
   IF l_pmm25 = '6' THEN
     CALL cl_err(g_rva.rva02,'apm-056',0)
     RETURN
   END IF
#FUN-5A0090 add--end
   # BY CJY 09/07/08 start
   IF NOT cl_null(g_rva.ta_rva01) THEN
   SELECT SFP04 INTO l_sfp04  FROM SFP_FILE WHERE SFP01=g_rva.ta_rva01
   IF cl_null(l_sfp04) THEN LET l_sfp04='N' END IF
   IF l_sfp04='Y' THEN
     CALL cl_err(g_rva.ta_rva01,'cpm-001',0)
   RETURN
   END IF
   END IF

  ###############如存在未作廢邊角料雜收單，不允許反過帳入庫單##################
  IF NOT cl_null(g_rva.ta_rva04) THEN
     LET l_cnt=0
     SELECT COUNT(*) INTO l_cnt FROM ina_file WHERE ina10=g_rva.rva01 AND inaconf<>'X'
     IF cl_null(l_cnt) THEN LET l_cnt=0 END IF
     IF l_cnt>0 THEN
        CALL cl_err(g_rva.rva01,'cim007',1)
        RETURN
     END IF
  END IF

   # BY CJY 09/07/08 end
   #-- 若為三角貿易單據則非來源單據不可取消確認  no.4061
   IF g_rva.rva10 ='TAP' THEN
      DECLARE rvb04_cs CURSOR FOR SELECT UNIQUE(rvb04)
                                    FROM rvb_file
                                   WHERE rvb01 = g_rva.rva01

      FOREACH rvb04_cs INTO l_rvb04
         IF NOT cl_null(l_rvb04) THEN
            EXIT FOREACH
         END IF
      END FOREACH

      SELECT poz011 INTO l_poz011
        FROM pmm_file,poz_file
       WHERE pmm904 = poz01
         AND pmm01 = l_rvb04
         AND pmm901 = 'Y'         #三角貿易否
         AND pmm905 = 'Y'         #已拋轉
         AND pmm02  = 'TAP'       #代採買性質
         AND pmm906 = 'Y'         #來源單據

      IF SQLCA.sqlcode THEN
         LET l_poz011 = ''
      END IF

      IF cl_null(l_poz011) OR l_poz011 <> '1' THEN
         CALL cl_err('','apm-015',1)
         RETURN
      END IF
   END IF

   IF g_rva.rva10 = 'TRI' THEN
      CALL cl_err('','apm-015',1)
      RETURN
   END IF

   IF NOT cl_confirm('axm-109') THEN
      RETURN
   END IF

   #-----判斷是否有已確認之入庫資料
   SELECT COUNT(*) INTO l_cnt FROM rvu_file
    WHERE rvu02 = g_rva.rva01
      AND rvuconf != 'X'

   IF l_cnt > 0 THEN
      CALL cl_err(g_rva.rva01,'apm-248',0)
      RETURN
   END IF

   #-----若為委外,須判斷是否為生產系統產生之單據
   IF g_rva.rva10 = 'SUB' THEN
      SELECT COUNT(*) INTO l_cnt FROM sfu_file
       WHERE sfu01 = g_rva.rva01
      IF l_cnt > 0 THEN
         CALL cl_err(g_rva.rva01,'apm-263',0)
         RETURN
      END IF
   END IF

   #..品管檢驗已輸入單據(qcs_file),則不可取消確認
   SELECT COUNT(*) INTO l_cnt FROM qcs_file
    WHERE qcs01 = g_rva.rva01
      AND qcs14! = 'X'  #No:9524
      AND qcs00<'5'   #No.FUN-5C0078
   IF l_cnt>0 THEN
      CALL cl_err(g_rva.rva01,'apm-913',0)
      RETURN
   END IF

   BEGIN WORK
   LET g_success = 'Y'

   OPEN t110_cl USING g_rva_rowid
   IF STATUS THEN
      CALL cl_err("OPEN t110_cl:", STATUS, 1)
      CLOSE t110_cl
      ROLLBACK WORK
      RETURN
   END IF

   FETCH t110_cl INTO g_rva.*          #鎖住將被更改或取消的資料
   IF SQLCA.sqlcode THEN
      CALL cl_err(g_rva.rva01,SQLCA.sqlcode,0)      #資料被他人LOCK
      CLOSE t110_cl
      ROLLBACK WORK
      RETURN
   END IF

   DECLARE t110_za CURSOR FOR
     SELECT * FROM rvb_file WHERE rvb01=g_rva.rva01

   CALL s_showmsg_init()        #No.FUN-710030
   FOREACH t110_za INTO l_rvb.*
#No.FUN-710030 -- begin --
      IF g_success="N" THEN
         LET g_totsuccess="N"
         LET g_success="Y"
      END IF
#No.FUN-710030 -- end --
      UPDATE rvb_file
         SET rvb33 = 0   ,#允收數量
             #No.FUN-580115  --begin
             rvb331=0,
             rvb332=0,
             #No.FUN-580115  --end
             #rvb39 = NULL,#檢驗否   #MOD-530415
             rvb40 = NULL,#檢驗日期
             rvb41 = NULL #檢驗結果
       WHERE rvb01 = l_rvb.rvb01
         AND rvb02 = l_rvb.rvb02

      IF SQLCA.sqlcode THEN
#        CALL cl_err('UPDATE rvb_file',SQLCA.sqlcode,0) #No.FUN-660129
#No.FUN-710030 -- begin --
#         CALL cl_err3("upd","rvb_file",l_rvb.rvb01,l_rvb.rvb02,SQLCA.sqlcode,"","UPDATE rvb_file",1) #No.FUN-660129
         IF g_bgerr THEN
            LET g_showmsg = l_rvb.rvb01,"/",l_rvb.rvb02
            CALL s_errmsg("rvb01,rvb02",g_showmsg,"UPDATE rvb_file",SQLCA.sqlcode,1)
         ELSE
            CALL cl_err3("upd","rvb_file",l_rvb.rvb01,l_rvb.rvb02,SQLCA.sqlcode,"","UPDATE rvb_file",1)
         END IF
#No.FUN-710030 -- end --
         LET g_success = 'N'
         ROLLBACK WORK   #MOD-810073 add
         RETURN
      END IF
   END FOREACH
#No.FUN-710030 -- begin --
   IF g_totsuccess="N" THEN
      LET g_success="N"
   END IF
#No.FUN-710030 -- end --

   #-----更新單頭確認碼
   LET g_rva.ta_rva01 = ''
   UPDATE rva_file SET rvaconf = 'N',ta_rva01 = g_rva.ta_rva01 #add by endy 150916 清除关联的发料单号
    WHERE rva01 = g_rva.rva01
   IF STATUS THEN LET g_success = 'N' END IF

   CALL t110_z1()

   #MESSAGE ""  #FUN-840012
   CALL cl_msg("")  #FUN-840012
   CALL s_showmsg()       #No.FUN-710030
   IF g_success = 'Y' THEN
      LET g_rva.rvaconf='N'
      COMMIT WORK
   ELSE
      LET g_rva.rvaconf='Y'
      ROLLBACK WORK
   END IF

   DISPLAY BY NAME g_rva.rvaconf
   DISPLAY BY NAME g_rva.ta_rva01 #add by endy 150916 关联的发料单号刷新

   CALL t110_show()

   IF g_rva.rvaconf='X' THEN
      LET g_chr='Y'
   ELSE
      LET g_chr='N'
   END IF

   CALL cl_set_field_pic(g_rva.rvaconf,"","","",g_chr,"")

END FUNCTION

FUNCTION t110_z1()
   DEFINE l_rvb   RECORD  LIKE rvb_file.*,
          l_factor1       LIKE ima_file.ima31_fac,#No.FUN-680136 DECIMAL(16,8)
          l_pmnrowid      LIKE type_file.chr18,   #No.FUN-680136 INT
          l_imarowid      LIKE type_file.chr18,   #No.FUN-680136 INT
          l_cnt           LIKE type_file.num5,    #No.FUN-680136 SMALLINT
          l_rvv17         LIKE rvv_file.rvv17,    #
          l_rvb07         LIKE rvb_file.rvb07,    #實收舊值
          l_sfb04         LIKE sfb_file.sfb04,    #No:MOD-610034 add
          l_pmn07         LIKE pmn_file.pmn07,    #採購單號
          l_pmn51         LIKE pmn_file.pmn51,
          l_pmn01         LIKE pmn_file.pmn01,    #採購單號
          l_pmn02         LIKE pmn_file.pmn02,    #項次
          l_pmn122        LIKE pmn_file.pmn122,   #專案號碼
          l_pmn09         LIKE pmn_file.pmn09,    #轉換因子
          l_pmn40         LIKE pmn_file.pmn40,    #會計科目
          l_pmn011        LIKE pmn_file.pmn011,   #性質
          l_ima25         LIKE ima_file.ima25,    #庫存單位
          l_ima906        LIKE ima_file.ima906,   #No.FUN-540027
          l_ima86         LIKE ima_file.ima86     #成本單位

   DECLARE t110_z CURSOR WITH HOLD FOR
     SELECT * FROM rvb_file WHERE rvb01=g_rva.rva01

   CALL s_showmsg_init()        #No.FUN-710030
   FOREACH t110_z INTO l_rvb.*
      IF STATUS THEN
#No.FUN-710030 -- begin --
#         CALL cl_err('foreach:',STATUS,0)
         IF g_bgerr THEN
            CALL s_errmsg("","","foreach",STATUS,1)
         ELSE
            CALL cl_err3("","","","",STATUS,"","foreach",1)
         END IF
#No.FUN-710030 -- end --
         EXIT FOREACH
      END IF
     #-----No:MOD-610034-----
      SELECT sfb04 INTO l_sfb04 FROM sfb_file   #工單
       WHERE sfb01 = l_rvb.rvb34
      IF l_sfb04 = "8" THEN
#No.FUN-710030 -- begin --
#         CALL cl_err(l_rvb.rvb34,"asf-070",1)
         IF g_bgerr THEN
            CALL s_errmsg("","",l_rvb.rvb34,"asf-070",1)
         ELSE
            CALL cl_err3("","","","","asf-070","",l_rvb.rvb34,1)
         END IF
#No.FUN-710030 -- end --
         LET g_success = 'N'
         RETURN
      END IF
     #-----No:MOD-610034 END-----


      LET l_rvb07=l_rvb.rvb07 # backup old value

      #捉出採購/庫存轉換因子,在途量，且LOCK 此筆資料

      LET g_forupd_sql = "SELECT pmn_file.rowid,pmn09,pmn011,pmn40,pmn07",
                         "  FROM pmn_file",
                         " WHERE pmn01=? AND pmn02=? FOR UPDATE NOWAIT"
      DECLARE t110_pmn2  CURSOR FROM g_forupd_sql              # LOCK CURSOR

      OPEN t110_pmn2 USING l_rvb.rvb04,l_rvb.rvb03
      IF STATUS THEN
#No.FUN-710030 -- begin --
#         CALL cl_err("OPEN t110_pmn2:", STATUS, 1)
         IF g_bgerr THEN
            CALL s_errmsg("","","OPEN t110_pmn2:",STATUS,1)
         ELSE
            CALL cl_err3("","","","",STATUS,"","OPEN t110_pmn2:",1)
         END IF
#No.FUN-710030 -- end --
         CLOSE t110_pmn2
        #ROLLBACK WORK                                  #CHI-840071
         LET g_success = 'N'                            #CHI-840071
         RETURN
      END IF
      FETCH t110_pmn2 INTO l_pmnrowid,l_pmn09,l_pmn011,l_pmn40,l_pmn07

      SELECT pmn122 INTO l_pmn122 FROM pmn_file  #讀取專案代號
       WHERE pmn01 = l_rvb.rvb04
         AND pmn02 = l_rvb.rvb03

      #捉出料件主檔中的 在外量/在途量，且LOCK 此筆資料
      IF l_rvb.rvb05[1,4] != 'MISC' THEN
         LET g_forupd_sql = "SELECT rowid,ima25,ima86 FROM ima_file",
                            " WHERE ima01=? FOR UPDATE NOWAIT"
         DECLARE t110_ima2  CURSOR FROM g_forupd_sql              # LOCK CURSOR


         OPEN t110_ima2 USING l_rvb.rvb05
         IF STATUS THEN
#No.FUN-710030 -- begin --
#            CALL cl_err("OPEN t110_ima2:", STATUS, 1)
            IF g_bgerr THEN
               CALL s_errmsg("","","OPEN t110_ima2:",STATUS,1)
            ELSE
               CALL cl_err3("","","","",STATUS,"","OPEN t110_ima2:",1)
            END IF
#No.FUN-710030 -- end --
            CLOSE t110_ima2
           #ROLLBACK WORK                                  #CHI-840071
            LET g_success = 'N'                            #CHI-840071
            RETURN
         END IF

         FETCH t110_ima2 INTO l_imarowid,l_ima25,l_ima86
         IF SQLCA.sqlcode THEN
#No.FUN-710030 -- begin --
#            CALL cl_err('fetch:',SQLCA.sqlcode,0)
            IF g_bgerr THEN
               CALL s_errmsg("","","fetch:",SQLCA.sqlcode,1)
            ELSE
               CALL cl_err3("","","","",SQLCA.sqlcode,"","fetch:",1)
            END IF
#No.FUN-710030 -- end --
            LET g_success = 'N'
            RETURN
         END IF

         CALL s_umfchk(l_rvb.rvb05,l_pmn07,l_ima25) RETURNING l_cnt,l_factor1

         IF l_cnt = 1 THEN
#No.FUN-710030 -- begin --
#            CALL cl_err('pmn07/ima25: ','abm-731',1)
            IF g_bgerr THEN
               CALL s_errmsg("","","pmn07/ima25: ","abm-731",1)
            ELSE
               CALL cl_err3("","","","","abm-731","","pmn07/ima25: ",1)
            END IF
#No.FUN-710030 -- end --
            LET g_success ='N'
         END IF
      END IF

      IF l_rvb.rvb35 = 'N' THEN
         SELECT SUM(rvb07) INTO l_rvb.rvb07     #計算此採購單已收量
           FROM rva_file,rvb_file
          WHERE rvb04 = l_rvb.rvb04
            AND rvb03 = l_rvb.rvb03
            AND rvb35 = 'N'
            AND rvaconf = 'Y'
            AND rva01 = rvb01

         IF cl_null(l_rvb.rvb07) THEN
            LET l_rvb.rvb07 = 0
         END IF

         SELECT SUM(rvb07-rvb29-rvb30) INTO l_pmn51     #計算此採購單已收量
           FROM rva_file,rvb_file
          WHERE rvb04 = l_rvb.rvb04
            AND rvb03 = l_rvb.rvb03
            AND rvb35 = 'N'
            AND rvaconf = 'Y'
            AND rva01 = rvb01

         IF cl_null(l_pmn51) THEN
            LET l_pmn51 = 0
         END IF

         SELECT SUM(rvv17) INTO l_rvv17     #計算此採購單對應之倉退量
           FROM rvv_file,rvu_file
          WHERE rvv37 = l_rvb.rvb03
            AND rvv36 = l_rvb.rvb04
            AND rvv25 = 'N'
            AND rvuconf = 'Y'
            AND rvu01 = rvv01
            AND rvu00 = '3'  #倉退

         IF cl_null(l_rvv17) THEN LET l_rvv17=0 END IF
         MESSAGE "Update pmn_file ..."

         UPDATE pmn_file SET pmn50 = l_rvb.rvb07,  #收貨量
                             pmn51 = l_pmn51       #IQC #No.B185 010423 mod by lina
          WHERE pmn01 = l_rvb.rvb04
            AND pmn02 = l_rvb.rvb03

         IF SQLCA.sqlcode OR SQLCA.SQLERRD[3]=0 THEN
            LET g_success = 'N'
#           CALL cl_err('upd pmn:',SQLCA.sqlcode,1) #No.FUN-660129
#No.FUN-710030 -- begin --
#            CALL cl_err3("upd","pmn_file",l_rvb.rvb04,l_rvb.rvb03,SQLCA.sqlcode,"","upd pmn",1) #No.FUN-660129
           IF g_bgerr THEN
              LET g_showmsg = l_rvb.rvb04,l_rvb.rvb03
              CALL s_errmsg("pmn01,pmn02",g_showmsg,"upd pmn:",SQLCA.sqlcode,1)
           ELSE
              CALL cl_err3("upd","pmn_file",l_rvb.rvb04,l_rvb.rvb03,SQLCA.sqlcode,"","upd pmn",1)
           END IF
#No.FUN-710030 -- end --
            RETURN
         END IF

         SELECT pmn01,pmn02 INTO l_pmn01,l_pmn02 FROM pmn_file
          WHERE pmn01=l_rvb.rvb04 AND pmn02=l_rvb.rvb03

         CALL s_udpmn57(l_pmn01,l_pmn02)  #更新超短交量 = 收貨量 - 訂購量

         #----刪除 tlf_file 之雜收部份
         IF l_rvb.rvb05[1,4] != 'MISC' THEN
            MESSAGE "Delete tlf_file ..."
            IF g_rva.rva10='SUB' THEN
               DELETE FROM tlf_file
                WHERE tlf026 = l_rvb.rvb34
                  AND tlf027 = l_rvb.rvb03
                  AND tlf036 = l_rvb.rvb01
                  AND tlf037 = l_rvb.rvb02
                  AND tlf01  = l_rvb.rvb05

               #No.FUN-540027  --begin
               IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
#                 CALL cl_err('del tlf',STATUS,0) #No.FUN-660129
#No.FUN-710030 -- begin --
#                  CALL cl_err3("del","tlf_file",l_rvb.rvb34,"",STATUS,"","del tlf",1) #No.FUN-660129
                  IF g_bgerr THEN
                     LET g_showmsg = l_rvb.rvb34,"/",l_rvb.rvb03,"/",l_rvb.rvb01,"/",l_rvb.rvb02,"/",l_rvb.rvb05
                     CALL s_errmsg("tlf026,tlf027,tlf036,tlf037,tlf01",g_showmsg,"del tlf",STATUS,1)
                  ELSE
                     CALL cl_err3("del","tlf_file",l_rvb.rvb34,"",STATUS,"","del tlf",1)
                  END IF
#No.FUN-710030 -- end --
                  LET g_success = 'N'
                  RETURN
               END IF

               IF g_sma.sma115 = 'Y' THEN
                  SELECT ima906 INTO l_ima906 FROM ima_file
                   WHERE ima01=l_rvb.rvb05

                  IF l_ima906 MATCHES '[23]' THEN
                     DELETE FROM tlff_file WHERE tlff026 = l_rvb.rvb34
                                             AND tlff027 = l_rvb.rvb03
                                             AND tlff036 = l_rvb.rvb01
                                             AND tlff037 = l_rvb.rvb02
                                             AND tlff01  = l_rvb.rvb05
                     IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
#                       CALL cl_err('del tlff',STATUS,0)  #No.FUN-660129
#No.FUN-710030 -- begin --
#                        CALL cl_err3("del","tlff_file",l_rvb.rvb34,"",STATUS,"","del tlff",1) #No.FUN-660129
                        IF g_bgerr THEN
                           LET g_showmsg = l_rvb.rvb34,"/",l_rvb.rvb03,"/",l_rvb.rvb01,"/",l_rvb.rvb02,"/",l_rvb.rvb05
                           CALL s_errmsg("tlff026,tlff027,tlff036,tlff037,tlff01",g_showmsg,"del tlff",STATUS,1)
                        ELSE
                           CALL cl_err3("del","tlff_file",l_rvb.rvb34,"",STATUS,"","del tlff",1)
                        END IF
#No.FUN-710030 -- end --
                        LET g_success = 'N'
                        RETURN
                     END IF
                  END IF
               END IF
               #No.FUN-540027  --end
            ELSE
               DELETE FROM tlf_file
                WHERE tlf026 = l_rvb.rvb04
                  AND tlf027 = l_rvb.rvb03
                  AND tlf036 = l_rvb.rvb01
                  AND tlf037 = l_rvb.rvb02
                  AND tlf01  = l_rvb.rvb05

               #No.FUN-540027  --begin
               IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
#                 CALL cl_err('del tlf',STATUS,0)  #No.FUN-660129
#No.FUN-710030 -- begin --
#                  CALL cl_err3("del","tlf_file",l_rvb.rvb04,l_rvb.rvb03,STATUS,"","del tlf",1) #No.FUN-660129
                  IF g_bgerr THEN
                     LET g_showmsg = l_rvb.rvb04,"/",l_rvb.rvb03,"/",l_rvb.rvb01,"/",l_rvb.rvb02,"/",l_rvb.rvb05
                     CALL s_errmsg("tlf026,tlf027,tlf036,tlf037,tlf01",g_showmsg,"del tlf",SQLCA.sqlcode,1)
                  ELSE
                     CALL cl_err3("del","tlf_file",l_rvb.rvb04,l_rvb.rvb03,STATUS,"","del tlf",1)
                  END IF
#No.FUN-710030 -- end --
                  LET g_success = 'N'
                  RETURN
               END IF

               IF g_sma.sma115 = 'Y' THEN
                  SELECT ima906 INTO l_ima906 FROM ima_file
                   WHERE ima01=l_rvb.rvb05

                  IF l_ima906 MATCHES '[23]' THEN
                     DELETE FROM tlff_file
                      WHERE tlff026 = l_rvb.rvb04
                        AND tlff027 = l_rvb.rvb03
                        AND tlff036 = l_rvb.rvb01
                        AND tlff037 = l_rvb.rvb02
                        AND tlff01  = l_rvb.rvb05
                     IF SQLCA.sqlcode OR SQLCA.sqlerrd[3]=0 THEN
#                       CALL cl_err('del tlff',STATUS,0)  #No.FUN-660129
#No.FUN-710030 -- begin --
#                        CALL cl_err3("del","tlff_file",l_rvb.rvb04,l_rvb.rvb03,STATUS,"","del tlff",1) #No.FUN-660129
                        IF g_bgerr THEN
                           LET g_showmsg = l_rvb.rvb04,"/",l_rvb.rvb03,"/",l_rvb.rvb01,"/",l_rvb.rvb02,"/",l_rvb.rvb05
                           CALL s_errmsg("tlff026,tlff027,tlff036,tlff037,tlff01",g_showmsg,"del tlff",STATUS,1)
                        ELSE
                           CALL cl_err3("del","tlff_file",l_rvb.rvb04,l_rvb.rvb03,STATUS,"","del tlff",1)
                        END IF
#No.FUN-710030 -- end --
                        LET g_success = 'N'
                        RETURN
                     END IF
                  END IF
               END IF
               #No.FUN-540027  --end
            END IF
         END IF

         IF g_rva.rva10='SUB' THEN
            MESSAGE "Update sfb_file ..."
            #FUN-5C0055..............begin
            LET l_cnt=0
            SELECT COUNT(DISTINCT sfp01) INTO l_cnt
              FROM sfp_file,sfe_file
             WHERE sfe01 = l_rvb.rvb34
               AND sfp01 = sfe02
               AND sfpconf !='X'  #FUN-660106
            IF l_cnt>0 THEN
               UPDATE sfb_file SET sfb04='4'
                 WHERE sfb01 = l_rvb.rvb34
            ELSE
               UPDATE sfb_file SET sfb04='2'
                 WHERE sfb01 = l_rvb.rvb34
            END IF
            #FUN-5C0055..............end
            IF SQLCA.sqlcode OR SQLCA.SQLERRD[3] = 0 THEN
#              CALL cl_err('upd sfb04:',SQLCA.sqlcode,1) #No.FUN-660129
#No.FUN-710030 -- begin --
#               CALL cl_err3("upd","sfb_file",l_rvb.rvb34,"",SQLCA.sqlcode,"","upd sfb04",1) #No.FUN-660129
               IF g_bgerr THEN
                  CALL s_errmsg("sfb01",g_showmsg,"upd sfb04:",SQLCA.sqlcode,1)
               ELSE
                  CALL cl_err3("upd","sfb_file",l_rvb.rvb34,"",SQLCA.sqlcode,"","upd sfb04",1)
               END IF
#No.FUN-710030 -- end --
               LET g_success = 'N'
               RETURN
            END IF

            CALL s_updsfb117(l_rvb.rvb34)

            IF g_success='N' THEN
#No.FUN-710030 -- begin --
#               CALL cl_err('upd sfb11:',SQLCA.sqlcode,1)
               IF g_bgerr THEN
                  CALL s_errmsg("","","upd sfb11:",SQLCA.sqlcode,1)
               ELSE
                  CALL cl_err3("","","","",SQLCA.sqlcode,"","upd sfb11:",1)
               END IF
#No.FUN-710030 -- end --
               LET g_success = 'N'
               RETURN
            END IF
         END IF
      END IF

      CLOSE t110_pmn2
      CLOSE t110_ima2
   END FOREACH
#No.FUN-710030 -- begin --
   IF g_totsuccess="N" THEN
      LET g_success="N"
   END IF
#No.FUN-710030 -- end --


END FUNCTION

FUNCTION t110_out()
   DEFINE l_cmd       LIKE type_file.chr1000, #No.FUN-680136 VARCHAR(200)
          l_wc,l_wc2  LIKE type_file.chr50,   #No.FUN-680136 VARCHAR(50)
          l_prtway    LIKE type_file.chr1     #No.FUN-680136 VARCHAR(1)

   IF g_rva.rvaprsw = 'Y' THEN
      CALL cl_wait()
      # by cjy 09/06/19 增加打印次數 start
     LET  g_rva.rvaprno=g_rva.rvaprno+1
      UPDATE rva_file SET rvaprno=g_rva.rvaprno    WHERE rva01=g_rva.rva01

   DISPLAY BY NAME g_rva.rvaprno
      # by cjy 09/06/19 增加打印次數 end
      LET l_wc='rva01="',g_rva.rva01,'"'

      SELECT zz21,zz22 INTO l_wc2,l_prtway FROM zz_file WHERE zz01 = 'apmr920'

      IF SQLCA.sqlcode OR l_wc2 IS NULL THEN
         LET l_wc2 = " 'N' '3' '123' "
      END IF

      LET l_cmd = "apmr920",
                  " '",g_today CLIPPED,"' ''",
                  " '",g_lang CLIPPED,"' 'Y' '",l_prtway,"' '1'",
                  " '",l_wc CLIPPED,"' "    #,l_wc2     #No:TQC-610085 mark

      CALL cl_cmdrun(l_cmd)
   END IF

   ERROR ' '

END FUNCTION

## 確認時 check 超短交 & 可否提前交貨-----------------------------------
FUNCTION t110_chk_over()
   DEFINE  l_pmn34    LIKE pmn_file.pmn34,
           l_pmn37    LIKE pmn_file.pmn37,
           l_date     LIKE type_file.dat,     #No.FUN-680136 DATE
           l_pmn15    LIKE pmn_file.pmn15

   IF g_rec_b <= 0 OR cl_null(g_rec_b) THEN
      RETURN
   END IF

   #MOD-820073-begin-add
   LET g_cnt = 0
   SELECT COUNT(*) INTO g_cnt
     FROM rvb_file
    WHERE rvb01=g_rva.rva01
   IF g_cnt > g_rec_b THEN
      LET g_success = 'N'
      RETURN
   END IF
   #MOD-820073-end-add
   FOR g_i=1 TO g_rec_b
      SELECT pmn13,pmn14,pmn15, pmn34,pmn37,pmn20,(pmn50-pmn55)
        INTO g_pmn13,g_pmn14,l_pmn15,l_pmn34,l_pmn37,g_pmn20,g_pmn50_55
        FROM pmn_file,pmm_file
       WHERE pmn01 = g_rvb[g_i].rvb04
         AND pmn02 = g_rvb[g_i].rvb03
         AND pmn01 = pmm01

      IF g_rvb[g_i].rvb35 = 'N' THEN
         CALL t110_chk_over_sub(g_i)
      END IF

      IF g_success='N' THEN  #MOD-530700
         EXIT FOR
      END IF

      IF l_pmn15 = 'N'  THEN  #可否提前交貨(Y/N)
         IF cl_null(l_pmn37)  THEN
            LET l_date = l_pmn34
         ELSE
            LET l_date = l_pmn37
         END IF

         IF g_rva.rva06 < l_date   THEN
            CALL cl_err(g_rvb[g_i].rvb04,'apm-285',1)
            LET g_success = 'N'
            EXIT FOR
         END IF
      END IF
    END FOR

END FUNCTION

FUNCTION t110_chk_over_sub(p_i)
DEFINE p_i        LIKE type_file.num5,    #No.FUN-680136 SMALLINT
       l_sfb39    LIKE sfb_file.sfb39,    #MOD-530700
       l_sfb05    LIKE sfb_file.sfb05,    #MOD-530700
       l_sfb93    LIKE sfb_file.sfb93,    #No:FUN-610101 add
       l_min_set  LIKE sfb_file.sfb08,    #No:TQC-670091 add
       l_rvb07_1  LIKE rvb_file.rvb07,
       l_rvb07_2  LIKE rvb_file.rvb07,
       l_rvb07_3  LIKE rvb_file.rvb07,
       l_fac      LIKE ima_file.ima31_fac,#No:TQC-730059 add
       l_i        LIKE type_file.num5,    #No:TQC-730059 add
       l_ima55    LIKE ima_file.ima55,    #No:TQC-730059 add
       l_rvb07    LIKE rvb_file.rvb07

   IF cl_null(g_pmn13) THEN  #超交率
      LET g_pmn13 = 0
   END IF

   IF cl_null(g_pmn50_55) THEN
      LET g_pmn50_55 = 0
   END IF

   LET g_pmn20 = g_rvb[p_i].pmn20

   SELECT SUM(rvb07) INTO l_rvb07_3 FROM rvb_file,rva_file
    WHERE rvb04 = g_rvb[p_i].rvb04
      AND rvb03 = g_rvb[p_i].rvb03
      AND rvaconf = 'N'
      AND rva01 = rvb01
      AND rvb35 = 'N'
      AND NOT (rvb01 = g_rva.rva01
      AND rvb02 = g_rvb[p_i].rvb02)

   IF cl_null(l_rvb07_3) THEN
      LET l_rvb07_3 = 0
   END IF

   #計算已交量
   LET l_rvb07=g_pmn50_55-g_pmn58+l_rvb07_3+g_rvb[p_i].rvb07
   LET l_rvb07_1=(g_pmn20*(100+g_pmn13))/100   #可交貨量
  #LET l_rvb07_2=l_rvb07-l_rvb07_1               #MOD-530021 MARK
   LET l_rvb07_2=(g_pmn20*(100-g_pmn13))/100     #MOD-530021 #最少可交貨量

   IF g_pmn13 >= 0 THEN    #MODIFY 超短交控制 by Keith
      IF g_pmn14 = 'N' THEN   #不能部份交貨, 超短交都控制
        #IF l_rvb07_1 > l_rvb07 THEN #短交 #MOD-530021 MARK
         IF l_rvb07_2 > l_rvb07 THEN #短交 #MOD-530021
            IF g_sma.sma85 MATCHES '[Rr]' THEN
               CALL cl_err(l_rvb07_2,'mfg3038',0)
               LET g_success='N'
               RETURN
            ELSE
               CALL cl_err(l_rvb07_2,'mfg9120',1)
            END IF
         END IF

         IF l_rvb07_1 < l_rvb07 THEN #超交
            IF g_sma.sma85 MATCHES '[Rr]' THEN
               CALL cl_err(l_rvb07_1,'mfg3037',1) #MOD-530021 #將show l_rvb07_2,改成l_rvb07_1  #No.TQC-6C0091 0->1
               LET g_success='N'
               RETURN
            ELSE
               CALL cl_err(l_rvb07_1,'mfg9121',1) #MOD-530021 #將show l_rvb07_2,改成l_rvb07_1
            END IF
         END IF
      END IF

      IF g_pmn14 = "Y" THEN    #可部份交貨, 則僅控制超交
         IF l_rvb07_1 < l_rvb07 THEN #超交
            IF g_sma.sma85 MATCHES '[Rr]' THEN
               CALL cl_err(l_rvb07_1,'mfg3037',1) #MOD-530021 #將show l_rvb07_2,改成l_rvb07_1  #No.TQC-6C0091 0->1
               LET g_success='N'
               RETURN
            ELSE
               CALL cl_err(l_rvb07_1,'mfg9121',1) #MOD-530021 #將show l_rvb07_2,改成l_rvb07_1
            END IF
         END IF
      END IF
   END IF

   IF g_pmn13 < 0 THEN    #控制超短交
      IF g_pmn14 = 'N' THEN   #不能部份交貨
         IF l_rvb07 - g_pmn20 < 0 THEN      #須>= 訂購量
            CALL cl_err(l_rvb07,'mfg3335',0)
            LET g_success='N'
            RETURN
         END IF
      END IF
   END IF

   #MOD-530700 ADD
   SELECT sfb05,sfb39,sfb93 INTO l_sfb05,l_sfb39,l_sfb93  #No:FUN-610101 add sfb93
     FROM sfb_file
    WHERE sfb01 = g_rvb[p_i].rvb34

   IF l_sfb39 != '2' THEN   #工單完工方式為'2' pull 不check min_set
      IF g_argv2_2 ='SUB' AND g_rvb[p_i].rvb05=l_sfb05 THEN
      #---------No:TQC-670091 modify
       #AND l_sfb93 != 'Y' THEN  #No:FUN-610101 add判斷走製程時不控管最小發料套數
        IF l_sfb93 != 'Y' THEN   #CHI-840066 modify add ! 製程委外不控管最小發料套數
           CALL t110_minp(g_rvb[p_i].rvb03,g_rvb[p_i].rvb04,
                          g_rvb[p_i].rvb34) RETURNING l_min_set
            LET l_min_set=l_min_set+0.49
            LET  l_min_set=cl_digcut(l_min_set,0)
  #        CALL cl_set_num_value(l_min_set,0) RETURNING l_min_set   # by cjy 09/02/13
          #--------------No:TQC-730059 add
           SELECT ima55 INTO l_ima55
             FROM ima_file
            WHERE ima01 = g_rvb[p_i].rvb05                          #MOD-790074 modif l_ac->p_i
           CALL s_umfchk(g_rvb[p_i].rvb05,g_rvb[p_i].pmn07,l_ima55) #MOD-790074 modif l_ac->p_i
                RETURNING l_i,l_fac
           IF l_i = 1 THEN
              #採購單位無法與料件的生產單位做換算,預設轉換率為1
              CALL cl_err(g_rvb[p_i].rvb05,'apm-120',1)   #MOD-790074 modify l_ac->p_i
              LET l_fac = 1
           END IF
           LET l_min_set = l_min_set / l_fac
          #--------------No:TQC-730059 end

           IF g_rvb[p_i].rvb07 > l_min_set THEN     #MOD-790074 modify l_ac->p_i
              CALL cl_err(g_rvb[p_i].rvb07,'apm-307',1)  #MOD-790074 modify l_ac->p_i
              LET g_success = 'N'
              RETURN
           END IF
         ELSE
           CALL t110_get_min_set(p_i) #取得g_min_set的值
           IF g_rvb[p_i].rvb07>g_min_set THEN
              #委外實收數不可大於發料最小套數!
              CALL cl_err(g_rvb[p_i].rvb07,'apm-307',1)
              LET g_success='N'
              RETURN
           END IF
        END IF
      #---------No:TQC-670091 end
      END IF
   END IF
   #MOD-530700(end)

END FUNCTION

FUNCTION t110_upd_pmn()
DEFINE l_rvb03    LIKE rvb_file.rvb03,
       l_rvb04    LIKE rvb_file.rvb04,
       l_rvb35    LIKE rvb_file.rvb35,
       l_rvb07    LIKE rvb_file.rvb07,
       l_rvb30    LIKE rvb_file.rvb30,
       l_rvv17    LIKE rvv_file.rvv17,    #
       l_pmn51    LIKE pmn_file.pmn51

   #-->計算採購單之已交量/在驗量(已交量-退貨量-入庫量)
   DECLARE t110_upd_pmn CURSOR WITH HOLD FOR
     SELECT rvb03,rvb04,rvb35 FROM rvb_file WHERE rvb01 = g_rva.rva01

   FOREACH t110_upd_pmn INTO l_rvb03,l_rvb04,l_rvb35
      #-->樣品不更新PO上的數量
      IF l_rvb35 <> 'N' THEN
         CONTINUE FOREACH
      END IF

      SELECT SUM(rvb30),SUM(rvb07),SUM(rvb07-rvb29-rvb30)
        INTO l_rvb30,l_rvb07,l_pmn51
        FROM rva_file,rvb_file
       WHERE rvb04 = l_rvb04
         AND rvb03 = l_rvb03
         AND rvb35 = 'N'
         AND rvaconf = 'Y'
         AND rva01 = rvb01

      IF cl_null(l_rvb07) THEN LET l_rvb07=0 END IF
      IF cl_null(l_rvb30) THEN LET l_rvb30=0 END IF
      IF cl_null(l_pmn51) THEN LET l_pmn51=0 END IF

      SELECT SUM(rvv17) INTO l_rvv17     #計算此採購單對應之倉退量
        FROM rvv_file,rvu_file
       WHERE rvv37 = l_rvb03
         AND rvv36 = l_rvb04
         AND rvv25 = 'N'
         AND rvuconf = 'Y'
         AND rvu01 = rvv01
         AND rvu00 = '3'  #倉退
      IF cl_null(l_rvv17) THEN LET l_rvv17=0 END IF

      #-->(1-1)更新採購單已交量/在驗量
      MESSAGE "Update pmn_file ..."
      UPDATE pmn_file SET pmn50 = l_rvb07,            #已交量
                          pmn51 = l_pmn51,    #在驗量        #No.B185 010423 by linda mod
                          pmn53 = l_rvb30             #入庫量
       WHERE pmn01 = l_rvb04
         AND pmn02 = l_rvb03
      IF STATUS OR SQLCA.SQLERRD[3]=0 THEN
         LET g_success = 'N'
#        CALL cl_err('upd pmn50:',SQLCA.sqlcode,1)  #No.FUN-660129
#No.FUN-710030 -- begin --
#         CALL cl_err3("upd","pmn_file",l_rvb04,l_rvb03,SQLCA.sqlcode,"","upd pmn50:",1) #No.FUN-660129
      IF g_bgerr THEN
         LET g_showmsg = l_rvb04,"/",l_rvb03
         CALL s_errmsg("pmn01,pmn02",g_showmsg,"upd pmn50:",SQLCA.sqlcode,1)
      ELSE
         CALL cl_err3("upd","pmn_file",l_rvb04,l_rvb03,SQLCA.sqlcode,"","upd pmn50:",1)
      END IF
#No.FUN-710030 -- end --
         RETURN
      END IF
   END FOREACH

   IF STATUS THEN
#No.FUN-710030 -- begin --
#      CALL cl_err('foreach ',STATUS,0)
      IF g_bgerr THEN
         CALL s_errmsg("","","foreach",STATUS,1)
      ELSE
         CALL cl_err3("","","","",STATUS,"","foreach",1)
      END IF
#No.FUN-710030 -- end --
      LET g_success = 'N'
   END IF

END FUNCTION

FUNCTION t110_g()
   #FUN-5C0022----add
   DEFINE l_rvb33  LIKE rvb_file.rvb33
   DEFINE l_flag   LIKE type_file.num5     #No.FUN-680136 SMALLINT
   DEFINE l_factor LIKE qcs_file.qcs31
   DEFINE l_ima906 LIKE ima_file.ima906
   #FUN-5C0022----add
   DEFINE l_g_already LIKE type_file.chr1    #No.FUN-680136 VARCHAR(1)
   DEFINE l_smy57     LIKE type_file.chr1,   #MOD-740033 add  #MOD-7B0145 modify
          l_t         LIKE smy_file.smyslip  #MOD-740033 add

   IF g_rva.rvaconf !='Y' THEN
      CALL cl_err('','aap-717',0)
      RETURN
   END IF

   IF cl_null(g_rva.rva01) THEN
      CALL cl_err('',-400,0)
      RETURN
   END IF

   IF NOT cl_confirm('apm-113') THEN
      RETURN
   END IF

   #----NO:2504 若允收數量=0則不產生入庫單，而產生驗退單(modi in 98/10/9)--------#
   #....NO.3196 若IQC單未確認則不可產生驗收入庫資料(modi in 01/08/06).........
  #IF g_rva.rva10  !='SUB' THEN  #委外不檢查QC
      IF g_sma.sma886[6,6]='Y' THEN
         SELECT COUNT(*) INTO g_cnt
           FROM rvb_file
          WHERE rvb01 = g_rva.rva01
            AND rvb39 = 'Y'
            AND (rvb40 IS NULL OR rvb40 = '') #No:7607
         IF g_cnt >=1 THEN
            #(asms250)須檢驗收料需由品管確認才可入庫,但是本收貨單尚有料件未經品管確認
            CALL cl_err('','apm-126',1)
            RETURN
         END IF
      END IF
  #END IF

   BEGIN WORK

   DECLARE t110_irvu CURSOR FOR SELECT * FROM rvb_file
                                 WHERE rvb01=g_rva.rva01
                                 ORDER BY rvb02

   LET l_g_already = 'Y'
   LET g_rvu01_1 = NULL
   LET g_rvu01_2 = NULL

   CALL s_showmsg_init()        #No.FUN-710030
   FOREACH t110_irvu INTO b_rvb.*
#No.FUN-710030 -- begin --
      IF g_success="N" THEN
         LET g_totsuccess="N"
         LET g_success="Y"
      END IF
#No.FUN-710030 -- end --
      LET l_n = 0
     #MOD-740033-begin-add
      LET l_t = s_get_doc_no(b_rvb.rvb01)

      SELECT smy57[3,3] INTO l_smy57 FROM smy_file
       WHERE smyslip=l_t

     IF l_smy57='N' THEN
        #----單身
        SELECT COUNT(*) INTO l_n FROM rvv_file,rvu_file     #防止重覆過帳
         WHERE rvv04=b_rvb.rvb01  #收貨單號
           AND rvv05=b_rvb.rvb02  #收貨項次
           AND rvu01=rvv01
           AND rvuconf != 'X'                               #排除已作廢之倉退單
     ELSE
     #MOD-740033-end-add
      #----單身
      SELECT COUNT(*) INTO l_n FROM rvv_file
       WHERE rvv04=b_rvb.rvb01  #收貨單號
         AND rvv05=b_rvb.rvb02  #收貨項次

     END IF   #MOD-740033 add
      IF l_n >= 1 THEN
         CONTINUE FOREACH
      END IF

      LET l_g_already = 'N' #是否所有的收貨資料,早已產生入庫/驗退單完畢
      #FUN-5C0022-----add
      #母子單位時,自動產生入庫時,需check 以下
      #(允收數二+允收數一)經過換算<= IQC合格量才可自動產生
      #(rvb332*l_factor+rvb331)   <= rvb33
       IF g_sma.sma115 = 'Y' THEN #使用雙單位
           SELECT ima906 INTO l_ima906
             FROM ima_file
            WHERE ima01=b_rvb.rvb05
           IF l_ima906 = '2' THEN #母子單位
             #  CALL s_umfchk(b_rvb.rvb05,b_rvb.rvb83,b_rvb.rvb80)
             #        RETURNING l_flag,l_factor
             #  IF l_flag=0 THEN
             #      #==>有換算率
             #      LET l_rvb33  = b_rvb.rvb332 * l_factor + b_rvb.rvb331
             #  ELSE
             #      LET g_msg=b_rvb.rvb05 CLIPPED,'==>',b_rvb.rvb83,' & ',b_rvb.rvb80
             #      CALL cl_err(g_msg,'aqc-500',1) #add aqc-500
             #      LET g_success='N'
             #      EXIT FOREACH
             #  END IF
               # MOD-640530 -----start
               LET l_rvb33  = b_rvb.rvb332 * b_rvb.rvb84 + b_rvb.rvb331 * b_rvb.rvb81
               # MOD-640530 -----end
               IF l_rvb33 > b_rvb.rvb33 THEN
                   LET g_msg=b_rvb.rvb05 CLIPPED,'==>',b_rvb.rvb332,'*',l_factor,'+',b_rvb.rvb331,'>',b_rvb.rvb33
#No.FUN-710030 -- begin --
#                   CALL cl_err(g_msg,'aqc-501',1) #add aqc-501
#                   LET g_success='N'
#                   EXIT FOREACH
                  IF g_bgerr THEN
                     CALL s_errmsg("","",g_msg,"aqc-501",1)
                     CONTINUE FOREACH
                  ELSE
                     CALL cl_err3("","","","","aqc-501","",g_msg,1)
                     EXIT FOREACH
                  END IF
#No.FUN-710030 -- end --
               END IF
           END IF
       END IF
      #FUN-5C0022-----end

      #若IQC單未審核則不可生成驗收入庫信息
      IF b_rvb.rvb39 = 'Y'   AND  #檢驗否='Y'
         g_sma.sma886[8]='Y' AND  #採購收貨允收數量是否與IQC量勾稽='Y'
         b_rvb.rvb35='N'     AND  #不是樣品
         b_rvb.rvb19 !='2'   THEN #不為委外代買
         LET l_n = 0
         SELECT COUNT(*) INTO l_n FROM qcs_file
          WHERE qcs01=b_rvb.rvb01
            AND qcs02=b_rvb.rvb02
            AND qcs14='Y'
            AND qcs00<'5'   #No.FUN-5C0078
         IF l_n = 0 THEN
            LET g_success='N'
            LET g_msg=b_rvb.rvb01,'+',b_rvb.rvb02 USING '&&' CLIPPED
            #此收貨單之IQC品質記錄資料未確認,不可產生入庫單 !!
#No.FUN-710030 -- begin --
#            CALL cl_err(g_msg,'aqc-026',1)
#            EXIT FOREACH
            IF g_bgerr THEN
               CALL s_errmsg("","",g_msg,"aqc-026",1)
               CONTINUE FOREACH
            ELSE
               CALL cl_err3("","","","","aqc-026","",g_msg,1)
               EXIT FOREACH
            END IF
#No.FUN-710030 -- end --
         END IF
      END IF

      CALL t110_ins_rvu()

      IF g_success = 'N' THEN
#No.FUN-710030 -- begin --
#         EXIT FOREACH
         IF g_bgerr THEN
            CONTINUE FOREACH
         ELSE
            EXIT FOREACH
         END IF
#No.FUN-710030 -- end --
      END IF
   END FOREACH
#No.FUN-710030 -- begin --
   IF g_totsuccess="N" THEN
      LET g_success="N"
   END IF
#No.FUN-710030 -- end --


   IF l_g_already = 'Y' THEN
      #所有的收貨資料,早已產生入庫/驗退單完畢,不可重覆產生!
#No.FUN-710030 -- begin --
#      CALL cl_err(g_rva.rva01,'apm-111',1)
      IF g_bgerr THEN
         CALL s_errmsg("","",g_rva.rva01,"apm-111",1)
      ELSE
         CALL cl_err3("","","","","apm-111","",g_rva.rva01,1)
      END IF
#No.FUN-710030 -- end --
      LET g_success = 'N'
   END IF
   MESSAGE ""

   CALL s_showmsg()       #No.FUN-710030
   IF g_success = 'Y' THEN
      CALL cl_cmmsg(1)
      COMMIT WORK
   ELSE
      CALL cl_rbmsg(1)
      ROLLBACK WORK
   END IF

END FUNCTION


#########################自動產生驗退單start by cjy 101123###################################

FUNCTION t110_g_yt()
   #FUN-5C0022----add
   DEFINE l_rvb33  LIKE rvb_file.rvb33
   DEFINE l_flag   LIKE type_file.num5     #No.FUN-680136 SMALLINT
   DEFINE l_factor LIKE qcs_file.qcs31
   DEFINE l_ima906 LIKE ima_file.ima906
   #FUN-5C0022----add
   DEFINE l_g_already LIKE type_file.chr1    #No.FUN-680136 VARCHAR(1)
   DEFINE l_smy57     LIKE type_file.chr1,   #MOD-740033 add  #MOD-7B0145 modify
          l_t         LIKE smy_file.smyslip  #MOD-740033 add

   IF g_rva.rvaconf !='Y' THEN
      CALL cl_err('','aap-717',0)
      RETURN
   END IF

   IF cl_null(g_rva.rva01) THEN
      CALL cl_err('',-400,0)
      RETURN
   END IF

 #  IF NOT cl_confirm('apm-113') THEN
 #     RETURN
#   END IF

   #----NO:2504 若允收數量=0則不產生入庫單，而產生驗退單(modi in 98/10/9)--------#
   #....NO.3196 若IQC單未確認則不可產生驗收入庫資料(modi in 01/08/06).........
  #IF g_rva.rva10  !='SUB' THEN  #委外不檢查QC
      IF g_sma.sma886[6,6]='Y' THEN
         SELECT COUNT(*) INTO g_cnt
           FROM rvb_file
          WHERE rvb01 = g_rva.rva01
            AND rvb39 = 'Y'
            AND (rvb40 IS NULL OR rvb40 = '') #No:7607
         IF g_cnt >=1 THEN
            #(asms250)須檢驗收料需由品管確認才可入庫,但是本收貨單尚有料件未經品管確認
            CALL cl_err('','apm-126',1)
            RETURN
         END IF
      END IF
  #END IF

   BEGIN WORK

   DECLARE t110_irvu_yt CURSOR FOR SELECT * FROM rvb_file
                                 WHERE rvb01=g_rva.rva01
                                 ORDER BY rvb02

   LET l_g_already = 'Y'
   LET g_rvu01_1 = NULL
   LET g_rvu01_2 = NULL

   CALL s_showmsg_init()        #No.FUN-710030
   FOREACH t110_irvu_yt INTO b_rvb.*
#No.FUN-710030 -- begin --
      IF g_success="N" THEN
         LET g_totsuccess="N"
         LET g_success="Y"
      END IF
#No.FUN-710030 -- end --
      LET l_n = 0
     #MOD-740033-begin-add
      LET l_t = s_get_doc_no(b_rvb.rvb01)

      SELECT smy57[3,3] INTO l_smy57 FROM smy_file
       WHERE smyslip=l_t

     IF l_smy57='N' THEN
        #----單身
        SELECT COUNT(*) INTO l_n FROM rvv_file,rvu_file     #防止重覆過帳
         WHERE rvv04=b_rvb.rvb01  #收貨單號
           AND rvv05=b_rvb.rvb02  #收貨項次
           AND rvu01=rvv01
           AND rvuconf != 'X'                               #排除已作廢之倉退單
     ELSE
     #MOD-740033-end-add
      #----單身
      SELECT COUNT(*) INTO l_n FROM rvv_file
       WHERE rvv04=b_rvb.rvb01  #收貨單號
         AND rvv05=b_rvb.rvb02  #收貨項次

     END IF   #MOD-740033 add
      IF l_n >= 1 THEN
         CONTINUE FOREACH
      END IF

      LET l_g_already = 'N' #是否所有的收貨資料,早已產生入庫/驗退單完畢
      #FUN-5C0022-----add
      #母子單位時,自動產生入庫時,需check 以下
      #(允收數二+允收數一)經過換算<= IQC合格量才可自動產生
      #(rvb332*l_factor+rvb331)   <= rvb33
       IF g_sma.sma115 = 'Y' THEN #使用雙單位
           SELECT ima906 INTO l_ima906
             FROM ima_file
            WHERE ima01=b_rvb.rvb05
           IF l_ima906 = '2' THEN #母子單位
             #  CALL s_umfchk(b_rvb.rvb05,b_rvb.rvb83,b_rvb.rvb80)
             #        RETURNING l_flag,l_factor
             #  IF l_flag=0 THEN
             #      #==>有換算率
             #      LET l_rvb33  = b_rvb.rvb332 * l_factor + b_rvb.rvb331
             #  ELSE
             #      LET g_msg=b_rvb.rvb05 CLIPPED,'==>',b_rvb.rvb83,' & ',b_rvb.rvb80
             #      CALL cl_err(g_msg,'aqc-500',1) #add aqc-500
             #      LET g_success='N'
             #      EXIT FOREACH
             #  END IF
               # MOD-640530 -----start
               LET l_rvb33  = b_rvb.rvb332 * b_rvb.rvb84 + b_rvb.rvb331 * b_rvb.rvb81
               # MOD-640530 -----end
               IF l_rvb33 > b_rvb.rvb33 THEN
                   LET g_msg=b_rvb.rvb05 CLIPPED,'==>',b_rvb.rvb332,'*',l_factor,'+',b_rvb.rvb331,'>',b_rvb.rvb33
#No.FUN-710030 -- begin --
#                   CALL cl_err(g_msg,'aqc-501',1) #add aqc-501
#                   LET g_success='N'
#                   EXIT FOREACH
                  IF g_bgerr THEN
                     CALL s_errmsg("","",g_msg,"aqc-501",1)
                     CONTINUE FOREACH
                  ELSE
                     CALL cl_err3("","","","","aqc-501","",g_msg,1)
                     EXIT FOREACH
                  END IF
#No.FUN-710030 -- end --
               END IF
           END IF
       END IF
      #FUN-5C0022-----end

      #若IQC單未審核則不可生成驗收入庫信息
      IF b_rvb.rvb39 = 'Y'   AND  #檢驗否='Y'
         g_sma.sma886[8]='Y' AND  #採購收貨允收數量是否與IQC量勾稽='Y'
         b_rvb.rvb35='N'     AND  #不是樣品
         b_rvb.rvb19 !='2'   THEN #不為委外代買
         LET l_n = 0
         SELECT COUNT(*) INTO l_n FROM qcs_file
          WHERE qcs01=b_rvb.rvb01
            AND qcs02=b_rvb.rvb02
            AND qcs14='Y'
            AND qcs00<'5'   #No.FUN-5C0078
         IF l_n = 0 THEN
            LET g_success='N'
            LET g_msg=b_rvb.rvb01,'+',b_rvb.rvb02 USING '&&' CLIPPED
            #此收貨單之IQC品質記錄資料未確認,不可產生入庫單 !!
#No.FUN-710030 -- begin --
#            CALL cl_err(g_msg,'aqc-026',1)
#            EXIT FOREACH
            IF g_bgerr THEN
               CALL s_errmsg("","",g_msg,"aqc-026",1)
               CONTINUE FOREACH
            ELSE
               CALL cl_err3("","","","","aqc-026","",g_msg,1)
               EXIT FOREACH
            END IF
#No.FUN-710030 -- end --
         END IF
      END IF

      CALL t110_ins_rvu()

      IF g_success = 'N' THEN
#No.FUN-710030 -- begin --
#         EXIT FOREACH
         IF g_bgerr THEN
            CONTINUE FOREACH
         ELSE
            EXIT FOREACH
         END IF
#No.FUN-710030 -- end --
      END IF
   END FOREACH
#No.FUN-710030 -- begin --
   IF g_totsuccess="N" THEN
      LET g_success="N"
   END IF
#No.FUN-710030 -- end --


   IF l_g_already = 'Y' THEN
      #所有的收貨資料,早已產生入庫/驗退單完畢,不可重覆產生!
#No.FUN-710030 -- begin --
#      CALL cl_err(g_rva.rva01,'apm-111',1)
      IF g_bgerr THEN
         CALL s_errmsg("","",g_rva.rva01,"apm-111",1)
      ELSE
         CALL cl_err3("","","","","apm-111","",g_rva.rva01,1)
      END IF
#No.FUN-710030 -- end --
      LET g_success = 'N'
   END IF
   MESSAGE ""

   CALL s_showmsg()       #No.FUN-710030
   IF g_success = 'Y' THEN
      CALL cl_cmmsg(1)
      COMMIT WORK
   ELSE
      CALL cl_rbmsg(1)
      ROLLBACK WORK
   END IF

END FUNCTION






######################################################################################################

FUNCTION t110_set_entry(p_cmd)
   DEFINE p_cmd   LIKE type_file.chr1    #No.FUN-680136 VARCHAR(1)

   IF p_cmd = 'a' AND ( NOT g_before_input_done ) THEN
      CALL cl_set_comp_entry("rva01",TRUE)
   END IF

   IF INFIELD(rva02) OR ( NOT g_before_input_done ) THEN
      CALL cl_set_comp_entry("rva05,rva10",TRUE)
   END IF

   IF INFIELD(rva10) OR ( NOT g_before_input_done ) THEN
      CALL cl_set_comp_entry("rva04",TRUE)
   END IF

END FUNCTION

FUNCTION t110_set_no_entry(p_cmd)
   DEFINE p_cmd   LIKE type_file.chr1    #No.FUN-680136 VARCHAR(1)

   IF p_cmd = 'u' AND ( NOT g_before_input_done ) AND g_chkey='N' THEN
      CALL cl_set_comp_entry("rva01",FALSE)
   END IF

   IF INFIELD(rva02) OR  ( NOT g_before_input_done ) THEN
      IF NOT cl_null(g_rva.rva02) THEN
         CALL cl_set_comp_entry("rva05,rva10",FALSE)
      END IF
   END IF

   IF INFIELD(rva10)  OR  (NOT g_before_input_done ) THEN
      IF g_rva.rva10='SUB' THEN
         CALL cl_set_comp_entry("rva04",FALSE)
      END IF
   END IF

END FUNCTION

FUNCTION t110_set_entry_b(p_cmd)
   DEFINE p_cmd   LIKE type_file.chr1    #No.FUN-680136 VARCHAR(1)

   CALL cl_set_comp_entry("rvb22,rvb10,rvb10t",TRUE)   #No:FUN-550117

   CALL cl_set_comp_entry("rvb36,rvb37,rvb38",TRUE)

   CALL cl_set_comp_entry("rvb25",TRUE)

   #No.FUN-540027  --begin
   CALL cl_set_comp_entry("rvb85,rvb87",TRUE)
   #No.FUN-540027  --end
   #TQC-7C0131.....begin
   IF p_cmd ='s' AND g_sma.sma120 ="Y" THEN
      CALL cl_set_comp_entry("att00,att01,att02,att03,att04,att05,att06,att07,att08,att09,att10,att01_c,att02_c,att03_c,att04_c,att05_c,att06_c,att07_c,att08_c,att09_c,att10_c",TRUE)
   END IF
   #TQC-7C0131.....end

END FUNCTION

FUNCTION t110_set_no_entry_b(p_cmd)
   DEFINE p_cmd      LIKE type_file.chr1    #No.FUN-680136 VARCHAR(1)
   DEFINE l_tmp      LIKE rvb_file.rvb04    #No.FUN-680136 VARCHAR(05)  #No.FUN-540027
   DEFINE l_smy57_5  LIKE type_file.chr1    #No.FUN-680136 VARCHAR(01)
   DEFINE l_sfb24    LIKE sfb_file.sfb24    #MOD-740504

   IF g_aza.aza26 = '2' AND g_rva.rva04 != "Y" THEN
      CALL cl_set_comp_entry("rvb22",FALSE)
   END IF

   #NO.FUN-610018 --start--
   IF cl_null(g_gec07) THEN LET g_gec07 = 'N' END IF
   IF g_gec07 = 'N' THEN
      CALL cl_set_comp_entry("rvb10t",FALSE)
   ELSE
      CALL cl_set_comp_entry("rvb10",FALSE)
   END IF
   #NO.FUN-610018 --end--
   #TQC-7C0131.....begin
   #MOD-810024-begin-modify
   #IF p_cmd ='s' AND g_sma.sma120 ="Y" AND NOT cl_null(g_rvb[l_ac].rvb04)
   #   AND NOT cl_null(g_rvb[l_ac].rvb03) THEN
   IF p_cmd ='s' AND g_sma.sma120 ="Y" THEN
      IF  NOT cl_null(g_rvb[l_ac].rvb04)
      AND NOT cl_null(g_rvb[l_ac].rvb03) THEN
   #MOD-810024-end-modify
      CALL cl_set_comp_entry("att00,att01,att02,att03,att04,att05,att06,att07,att08,att09,att10,att01_c,att02_c,att03_c,att04_c,att05_c,att06_c,att07_c,att08_c,att09_c,att10_c",FALSE)
      END IF
   END IF  #MOD-810024 add
   #TQC-7C0131.....end

#MOD-7A0203-mark
#  IF INFIELD(rvb03) OR NOT g_before_input_done THEN  #MOD-7A0132 modify g_before_input_done
##No.FUN-610018      #No:FUN-550117
##     IF g_rvb[l_ac].gec07 = 'Y' THEN                        #No:FUN-560102
##        CALL cl_set_comp_entry("rvb10",FALSE)
##     END IF
#      #end No:FUN-550117
#MOD-7A0203-mark-end

#MOD-7A0203-modify
    IF INFIELD(rvb02) OR INFIELD(rvb03) OR INFIELD(rvb04) OR INFIELD(rvb36) THEN
       IF NOT cl_null(g_rvb[l_ac].rvb05) THEN
          CALL t110_ec_sw()  RETURNING l_ec_sw
          IF g_rvb[l_ac].rvb05[1,4]='MISC' OR l_ec_sw='Y' THEN
             CALL cl_set_comp_entry("rvb36,rvb37,rvb38",FALSE)
          END IF
       END IF
    END IF

   IF INFIELD(rvb04) THEN
      IF NOT cl_null(g_rvb[l_ac].rvb04) THEN
         LET l_tmp=g_rvb[l_ac].rvb04
         SELECT smy57[5,5] INTO l_smy57_5 FROM smy_file WHERE smyslip=l_tmp
         IF g_aza.aza27 != 'Y' OR l_smy57_5 != 'Y' THEN
            CALL cl_set_comp_entry("rvb25",FALSE)
         END IF
      END IF
#MOD-7A0203-modify-end
   END IF

   #No.FUN-540027  --begin
   IF g_ima906 = '1' THEN
      CALL cl_set_comp_entry("rvb83,rvb84,rvb85",FALSE)
   END IF

   IF g_ima906 = '1' THEN
      CALL cl_set_comp_entry("rvb81,rvb84",FALSE)
   END IF

   IF g_ima906 = '3' THEN
      CALL cl_set_comp_entry("rvb83",FALSE)
   END IF

   IF g_sma.sma116 MATCHES '[02]' THEN    #No:FUN-610076
      CALL cl_set_comp_entry("rvb87",FALSE)
   END IF
   #No.FUN-540027  --end

   #MOD-740504...........begin
   IF g_argv2_2='SUB' AND g_rec_b > 0 THEN   #MOD-7A0030 modify g_rec_b
      IF NOT cl_null(g_rvb[l_ac].rvb34) THEN
         LET l_sfb24=''
         SELECT sfb24 INTO l_sfb24
           FROM sfb_file
          WHERE sfb01 = g_rvb[l_ac].rvb34
         IF l_sfb24='Y' THEN
            CALL cl_set_comp_entry("rvb36,rvb37,rvb38",FALSE)
         END IF
      END IF
   END IF
   #MOD-740504...........end

   CALL cl_set_comp_entry("rvb35",FALSE)   #樣品否欄位設為不可修改(默認值為'N') #add 20150408 by yinghui

END FUNCTION

#NO.FUN-640151 start--
FUNCTION t110_set_required()
    #TQC-810048-begin-mark
     #IF g_argv2_2='TAP' THEN
     #   CALL cl_set_comp_required("rva02",TRUE)
     #END IF
    #TQC-810048-end-mark

     #MOD-740504...........begin
     IF g_argv2_2<>'SUB' THEN
        CALL cl_set_comp_required("rvb36",TRUE)
     END IF
     #MOD-740504...........end
END FUNCTION
#NO.FUN-640151 end---

#MOD-530415 add
#FUN-850022 --start--
{FUNCTION t110_get_rvb39(p_rvb04,p_rvb05,p_rvb19)
   DEFINE l_pmh08   LIKE pmh_file.pmh08,    #
          l_pmm22   LIKE pmm_file.pmm22,
          p_rvb04   LIKE rvb_file.rvb04,
          p_rvb05   LIKE rvb_file.rvb05,
          p_rvb19   LIKE rvb_file.rvb19,
          l_rvb39   LIKE rvb_file.rvb39
   DEFINE l_ima915  LIKE ima_file.ima915   #FUN-710060 add

  #FUN-710060---mod---str---
  #IF g_sma.sma63='1' THEN #料件供應商控制方式,1: 需作料件供應商管制
  #                        #                   2: 不作料件供應商管制
  #料件供應商控制方式: 0.不管制、1.請購單需管制、2.採購單需管制、3.二者皆需管制
   SELECT ima915 INTO l_ima915 FROM ima_file
    WHERE ima01=p_rvb05

   IF l_ima915='2' OR l_ima915='3' THEN
  #FUN-710060---mod---end---
      SELECT pmm22 INTO l_pmm22 FROM pmm_file
       WHERE pmm01=p_rvb04

      SELECT pmh08 INTO l_pmh08 FROM pmh_file
       WHERE pmh01=p_rvb05
         AND pmh02=g_rva.rva05
         AND pmh13=l_pmm22

      IF cl_null(l_pmh08) THEN
         LET l_pmh08 = 'N'
      END IF

      IF p_rvb05[1,4] = 'MISC' THEN
         LET l_pmh08='N'
      END IF
   ELSE
      SELECT ima24 INTO l_pmh08 FROM ima_file
       WHERE ima01=p_rvb05

      IF cl_null(l_pmh08) THEN
         LET l_pmh08 = 'N'
      END IF

      IF p_rvb05[1,4] = 'MISC' THEN
         LET l_pmh08='N'
      END IF
   END IF

   IF l_pmh08='N' OR     #免驗料
      (g_sma.sma886[6,6]='N' AND g_sma.sma886[8,8]='N') OR #視同免驗
      p_rvb19='2' THEN #委外代買料
      LET l_rvb39 = 'N'
   ELSE
      LET l_rvb39 = 'Y'
   END IF

   RETURN l_rvb39

END FUNCTION
}
#FUN-850022 --end
 #MOD-530700 ADD
FUNCTION t110_get_min_set(p_ac)
   DEFINE p_ac         LIKE type_file.num5,     #No.FUN-680136 SMALLINT
          l_ima55      LIKE ima_file.ima55,
          l_fac        LIKE ima_file.ima31_fac, #No.FUN-680136 DEC(16,8)
          l_i          LIKE type_file.num5,      #No.FUN-680136 SMALLINT
          l_ta_ima001  LIKE ima_file.ta_ima001
   LET g_min_set = 0

#   CALL s_minp(g_rvb[p_ac].rvb34,g_sma.sma73,g_sma.sma74,'')
#         RETURNING g_cnt,g_min_set
 #   CALL s_minp(g_rvb[p_ac].rvb34,'N',g_sma.sma74,'')  #by lily modify 20141012
         CALL s_minp(g_rvb[p_ac].rvb34,'N',g_sma.sma74,'','','',g_rva.rva06)
 #         RETURNING g_cnt,g_min_set
 #  CALL s_minp(g_rvb[p_ac].rvb34,g_sma.sma73,g_sma.sma74,'')
          RETURNING g_cnt,g_min_set
   SELECT ima55 INTO l_ima55
     FROM ima_file
    WHERE ima01 = g_rvb[p_ac].rvb05
                   SELECT ta_ima001 INTO l_ta_ima001
                   FROM ima_file
                   WHERE ima01 = g_rvb[p_ac].rvb05
                  IF cl_null(l_ta_ima001) THEN
                  LET l_ta_ima001 = 0
                  END IF
                 IF g_sma.sma899 = 'Y' THEN LET g_min_set = g_min_set * (1+l_ta_ima001/100) END IF
   CALL s_umfchk(g_rvb[p_ac].rvb05,g_rvb[p_ac].pmn07,l_ima55)
        RETURNING l_i,l_fac

   IF l_i = 1 THEN
      #採購單位無法與料件的生產單位做換算,預設轉換率為1
      CALL cl_err(g_rvb[p_ac].rvb05,'apm-120',1)
      LET l_fac = 1
   END IF

   LET g_min_set = g_min_set / l_fac

   # 確認之(收貨-退貨)
   SELECT SUM(rvb07-rvb29) INTO conf_qty FROM rvb_file,rva_file
    WHERE rvb34 = g_rvb[p_ac].rvb34
      AND rvb01 = rva01
      AND rvaconf<>'X'               #MOD-790062 modify 排除作廢單據
      AND rvb05 = g_rvb[p_ac].rvb05  #MOD-830023 modify
      AND rvb35='N'
      AND NOT (rvb02=g_rvb[p_ac].rvb02 AND rvb01=g_rva.rva01)  #MOD-790062 排除本張單正在輸入的項次  #MOD-830023 modify

   IF conf_qty IS NULL THEN
      LET conf_qty = 0
   END IF

   LET g_min_set = g_min_set - conf_qty

END FUNCTION
 #MOD-530700(end)

#No.FUN-540027  --begin
FUNCTION t110_tlff(p_pmn011,p_ima86,p_pmn122,p_rvb,p_unit,p_fac,p_qty,p_flag)
   DEFINE
      p_rvb           RECORD LIKE rvb_file.*,
      p_unit          LIKE img_file.img09,
      p_fac           LIKE img_file.img21,
      p_qty           LIKE img_file.img10,
      p_pmn011        LIKE pmn_file.pmn011,
      p_ima86         LIKE ima_file.ima86,    #成本單位
      p_pmn122        LIKE pmn_file.pmn122,   #專案號碼
      p_flag          LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(1)
      p_ac,l_sta      LIKE type_file.num5,    #No.FUN-680136 SMALLINT
      l_pmn65         LIKE pmn_file.pmn65     #No:7692

   LET g_tlff.tlff01=p_rvb.rvb05          #異動料件編號
   CASE p_pmn011
      WHEN 'REG ' LET g_tlff.tlff02=11    #資料來源
      WHEN 'EXP ' LET g_tlff.tlff02=14
      WHEN 'CAP ' LET g_tlff.tlff02=16
      WHEN 'SUB '
           #No:7692
           SELECT pmn65 INTO l_pmn65
             FROM pmn_file
            WHERE pmn01 = p_rvb.rvb04
              AND pmn02 = p_rvb.rvb03
           IF l_pmn65 = '2' THEN
               LET g_tlff.tlff02=18      #委外代買
           ELSE
               LET g_tlff.tlff02=60
           END IF
           #No:7692(end)
      OTHERWISE LET g_tlff.tlff02 = 10
   END CASE
   LET g_tlff.tlff020=g_plant             #工廠編號
   LET g_tlff.tlff021=''                  #倉庫別
   LET g_tlff.tlff022=''                  #儲位別
   LET g_tlff.tlff023=''
   LET g_tlff.tlff024=''
   LET g_tlff.tlff025=''

   IF p_pmn011='SUB' THEN
      LET g_tlff.tlff026=p_rvb.rvb34
      LET g_tlff.tlff027=p_rvb.rvb03
      LET g_tlff.tlff03=25                 #F.Q.C.
      LET g_tlff.tlff13='asft6001'            #異動命令代號
   ELSE
      LET g_tlff.tlff026=p_rvb.rvb04        #單據編號(採購單)
      LET g_tlff.tlff027=p_rvb.rvb03        #項次(採購項次)
      LET g_tlff.tlff03 =20                  #資料目的為檢驗區
      LET g_tlff.tlff13='apmt1101'           #異動命令代號
   END IF

   LET g_tlff.tlff030=g_plant             #工廠編號
   LET g_tlff.tlff031=p_rvb.rvb36         #倉庫別
   LET g_tlff.tlff032=p_rvb.rvb37         #儲位別
   LET g_tlff.tlff033=p_rvb.rvb38         #入庫批號
   LET g_tlff.tlff034=''                  #庫存數量
   LET g_tlff.tlff035=''                  #異動後庫存單位
   LET g_tlff.tlff036=p_rvb.rvb01         #驗收單單據編號
   LET g_tlff.tlff037=p_rvb.rvb02         #單據項次
   LET g_tlff.tlff04=''                   #工作中心
   LET g_tlff.tlff05=' '                  #作業編號
   LET g_tlff.tlff06=g_rva.rva06          #異動日期=驗收單之收貨日期
   LET g_tlff.tlff07=g_today              #異動數量=驗收單之實收數量
   LET g_tlff.tlff08=TIME                 #異動資料產生時:分:秒
   LET g_tlff.tlff09=g_user               #產生人
   LET g_tlff.tlff10=p_qty                #異動數量=驗收單之實收數量
   LET g_tlff.tlff11=p_unit               #異動單位=採購單位
   LET g_tlff.tlff12=p_fac                #收料單位/料件庫存轉換率
   LET g_tlff.tlff14=' '                  #異動原因代碼
   LET g_tlff.tlff17=''                   #非庫存性料件編號

   CALL s_imaQOH(p_rvb.rvb05) RETURNING g_tlff.tlff18 #異動後總庫存量

   LET g_tlff.tlff19=g_rva.rva05          #廠商編號
   LET g_tlff.tlff20=p_pmn122             #專案號碼
   LET g_tlff.tlff61=p_ima86              #成本單位
   LET g_tlff.tlff62=p_rvb.rvb04          #單據編號(採購單)
   LET g_tlff.tlff63=p_rvb.rvb03          #項次(採購項次)
   LET g_tlff.tlff64=p_rvb.rvb25          #手冊 no.A050
   LET g_tlff.tlff930=p_rvb.rvb930        #成本中心 #FUN-670051

   IF cl_null(p_rvb.rvb85) OR p_rvb.rvb85 = 0 THEN
     CALL s_tlff(p_flag,NULL)
   ELSE
     CALL s_tlff(p_flag,p_rvb.rvb83)
   END IF

END FUNCTION

#對原來數量/換算率/單位的賦值
FUNCTION t110_set_origin_field()
 DEFINE    l_ima906 LIKE ima_file.ima906,
           l_ima907 LIKE ima_file.ima907,
           l_img09  LIKE img_file.img09,     #img單位
           l_tot    LIKE img_file.img10,
           l_fac2   LIKE rvb_file.rvb84,
           l_qty2   LIKE rvb_file.rvb85,
           l_fac1   LIKE rvb_file.rvb81,
           l_qty1   LIKE rvb_file.rvb82,
           l_factor LIKE ima_file.ima31_fac, #No.FUN-680136 DECIMAL(16,8)
           l_ima25  LIKE ima_file.ima25,
           l_ima44  LIKE ima_file.ima44,
           l_pmn07  LIKE pmn_file.pmn07,
           l_pmn31  LIKE pmn_file.pmn31,
           l_pmn31t LIKE pmn_file.pmn31t

   #No.MOD-590119  --begin
   IF g_sma.sma115='N' THEN RETURN END IF
   #No.MOD-590119  --end

   SELECT ima25,ima44,ima906 INTO l_ima25,l_ima44,l_ima906
     FROM ima_file
    WHERE ima01=g_rvb[l_ac].rvb05
   IF SQLCA.sqlcode = 100 THEN
      IF g_rvb[l_ac].rvb05 MATCHES 'MISC*' THEN
         SELECT ima25,ima44,ima906 INTO l_ima25,l_ima44,l_ima906
           FROM ima_file
          WHERE ima01='MISC'
      END IF
   END IF

   IF cl_null(l_ima44) THEN LET l_ima44=l_ima25 END IF

   SELECT pmn07,pmn31,pmn31t INTO l_pmn07,l_pmn31,l_pmn31t FROM pmn_file
    WHERE pmn01=g_rvb[l_ac].rvb04
      AND pmn02=g_rvb[l_ac].rvb03

   IF cl_null(l_pmn07) THEN LET l_pmn07 = l_ima44 END IF
   IF cl_null(l_pmn31) THEN LET l_pmn07 = 0 END IF

   LET l_fac2=g_rvb[l_ac].rvb84
   LET l_qty2=g_rvb[l_ac].rvb85
   LET l_fac1=g_rvb[l_ac].rvb81
   LET l_qty1=g_rvb[l_ac].rvb82

   IF cl_null(l_fac1) THEN LET l_fac1=1 END IF
   IF cl_null(l_qty1) THEN LET l_qty1=0 END IF
   IF cl_null(l_fac2) THEN LET l_fac2=1 END IF
   IF cl_null(l_qty2) THEN LET l_qty2=0 END IF

   IF g_sma.sma115 = 'Y' THEN
      CASE l_ima906
         WHEN '1' LET l_tot=l_qty1
         WHEN '2' LET l_tot=l_fac1*l_qty1+l_fac2*l_qty2
         WHEN '3' LET l_tot=l_qty1
                  IF l_qty2 <> 0 THEN
                     LET g_rvb[l_ac].rvb84=l_qty1/l_qty2
                  ELSE
                     LET g_rvb[l_ac].rvb84=0
                  END IF
      END CASE
   #No.MOD-590119  --begin
   #ELSE  #不使用雙單位
   #   LET l_tot=l_qty1
   #No.MOD-590119  --end
   END IF

   LET g_factor = 1
   CALL s_umfchk(g_rvb[l_ac].rvb05,l_pmn07,l_ima44)
         RETURNING g_cnt,g_factor
   IF g_cnt = 1 THEN
      LET g_factor = 1
   END IF
   LET g_rvb[l_ac].rvb07 = l_tot * g_factor
   LET g_rvb2.rvb07 = g_rvb[l_ac].rvb07

   #TQC-770117-begin-modify
   #IF g_sma.sma116 MATCHES '[13]' THEN    #No:FUN-610076
      LET g_rvb2.rvb88 = g_rvb[l_ac].rvb10 * g_rvb[l_ac].rvb87
      LET g_rvb2.rvb88t= g_rvb[l_ac].rvb10t* g_rvb[l_ac].rvb87
   #ELSE
   #   LET g_rvb2.rvb88 = g_rvb[l_ac].rvb10 * g_rvb2.rvb07
   #   LET g_rvb2.rvb88t= g_rvb[l_ac].rvb10t* g_rvb2.rvb07
   #END IF
   #TQC-770117-end-modify

END FUNCTION

#兩組雙單位資料不是一定要全部KEY,如果沒有KEY單位,則把換算率/數量清空
FUNCTION t110_du_data_to_correct()

  IF cl_null(g_rvb[l_ac].rvb80) THEN
     LET g_rvb[l_ac].rvb81 = NULL
     LET g_rvb[l_ac].rvb82 = NULL
     LET g_rvb2.rvb80 = NULL
     LET g_rvb2.rvb81 = NULL
     LET g_rvb2.rvb82 = NULL
  END IF

  IF cl_null(g_rvb[l_ac].rvb83) THEN
     LET g_rvb[l_ac].rvb84 = NULL
     LET g_rvb[l_ac].rvb85 = NULL
     LET g_rvb2.rvb83 = NULL
     LET g_rvb2.rvb84 = NULL
     LET g_rvb2.rvb85 = NULL
  END IF

  IF cl_null(g_rvb[l_ac].rvb86) THEN
     LET g_rvb[l_ac].rvb87 = NULL
     LET g_rvb2.rvb86 = NULL
     LET g_rvb2.rvb87 = NULL
  END IF

  DISPLAY BY NAME g_rvb[l_ac].rvb81
  DISPLAY BY NAME g_rvb[l_ac].rvb82
  DISPLAY BY NAME g_rvb[l_ac].rvb84
  DISPLAY BY NAME g_rvb[l_ac].rvb85
  DISPLAY BY NAME g_rvb[l_ac].rvb86
  DISPLAY BY NAME g_rvb[l_ac].rvb87

END FUNCTION
FUNCTION t110_set_rvb87()
 DEFINE    l_item   LIKE img_file.img01,     #料號
           l_ima25  LIKE ima_file.ima25,     #ima單位
           l_ima44  LIKE ima_file.ima44,     #ima單位
           l_ima906 LIKE ima_file.ima906,
           l_fac2   LIKE img_file.img21,     #第二轉換率
           l_qty2   LIKE img_file.img10,     #第二數量
           l_fac1   LIKE img_file.img21,     #第一轉換率
           l_qty1   LIKE img_file.img10,     #第一數量
           l_tot    LIKE img_file.img10,     #計價數量
           l_factor LIKE ima_file.ima31_fac  #No.FUN-680136 DECIMAL(16,8)


   SELECT ima25,ima44,ima906 INTO l_ima25,l_ima44,l_ima906
     FROM ima_file WHERE ima01=g_rvb[l_ac].rvb05
   IF SQLCA.sqlcode = 100 THEN
      IF g_rvb[l_ac].rvb05 MATCHES 'MISC*' THEN
         SELECT ima25,ima44,ima906 INTO l_ima25,l_ima44,l_ima906
           FROM ima_file WHERE ima01='MISC'
      END IF
   END IF
   IF cl_null(l_ima44) THEN LET l_ima44=l_ima25 END IF

   LET l_fac2=g_rvb[l_ac].rvb84
   LET l_qty2=g_rvb[l_ac].rvb85
   IF g_sma.sma115 = 'Y' THEN
      LET l_fac1=g_rvb[l_ac].rvb81
      LET l_qty1=g_rvb[l_ac].rvb82
   ELSE
      LET l_fac1=1
      LET l_qty1=g_rvb[l_ac].rvb07
#     CALL s_umfchk(g_rvb[l_ac].rvb04,g_rvb[l_ac].rvb07,l_ima44)     #No.MOD-6B0162
      CALL s_umfchk(g_rvb[l_ac].rvb05,g_rvb[l_ac].pmn07,l_ima44)     #No.MOD-6B0162
            RETURNING g_cnt,l_fac1
      IF g_cnt = 1 THEN
         LET l_fac1 = 1
      END IF
   END IF
   IF cl_null(l_fac1) THEN LET l_fac1=1 END IF
   IF cl_null(l_qty1) THEN LET l_qty1=0 END IF
   IF cl_null(l_fac2) THEN LET l_fac2=1 END IF
   IF cl_null(l_qty2) THEN LET l_qty2=0 END IF

   IF g_sma.sma115 = 'Y' THEN
      CASE l_ima906
         WHEN '1' LET l_tot=l_qty1*l_fac1
         WHEN '2' LET l_tot=l_qty1*l_fac1+l_qty2*l_fac2
         WHEN '3' LET l_tot=l_qty1*l_fac1
      END CASE
   ELSE  #不使用雙單位
      LET l_tot=l_qty1*l_fac1
   END IF
   IF cl_null(l_tot) THEN LET l_tot = 0 END IF
   LET l_factor = 1
   CALL s_umfchk(g_rvb[l_ac].rvb05,l_ima44,g_rvb[l_ac].rvb86)
         RETURNING g_cnt,l_factor
   IF g_cnt = 1 THEN
      LET l_factor = 1
   END IF
   LET l_tot = l_tot * l_factor

   LET g_rvb[l_ac].rvb87 = l_tot
END FUNCTION

#No.FUN-580115  --begin
FUNCTION t110_set_rvv87(p_item,p_fac2,p_qty2,p_fac1,p_qty1,p_rvv86,p_flag,p_unit)
   DEFINE p_item    LIKE img_file.img01,     #料號
          l_ima25   LIKE ima_file.ima25,     #ima單位
          l_ima44   LIKE ima_file.ima44,     #ima單位
          l_ima906  LIKE ima_file.ima906,
          p_fac2    LIKE img_file.img21,     #第二轉換率
          p_qty2    LIKE img_file.img10,     #第二數量
          p_fac1    LIKE img_file.img21,     #第一轉換率
          p_qty1    LIKE img_file.img10,     #第一數量
          p_rvv86   LIKE ima_file.ima25,     #第一數量
          p_unit    LIKE ima_file.ima25,
          l_tot     LIKE img_file.img10,     #計價數量
          p_flag    LIKE type_file.num5,     #No.FUN-680136 SMALLINT
          l_factor  LIKE ima_file.ima31_fac  #No.FUN-680136 DECIMAL(16,8)


   SELECT ima25,ima44,ima906 INTO l_ima25,l_ima44,l_ima906
     FROM ima_file WHERE ima01=p_item
   IF SQLCA.sqlcode = 100 THEN
      IF p_item MATCHES 'MISC*' THEN
         SELECT ima25,ima44,ima906 INTO l_ima25,l_ima44,l_ima906
           FROM ima_file WHERE ima01='MISC'
      END IF
   END IF

   IF cl_null(l_ima44) THEN
      LET l_ima44 = l_ima25
   END IF

   IF p_flag=1 THEN
      LET l_factor =1
      CALL s_umfchk(p_item,p_unit,l_ima44) RETURNING g_cnt,l_factor
      IF g_cnt = 1 THEN
         LET l_factor = 1
      END IF
      LET p_fac1=l_factor
   END IF

   IF cl_null(p_fac1) THEN LET p_fac1=1 END IF
   IF cl_null(p_qty1) THEN LET p_qty1=0 END IF
   IF cl_null(p_fac2) THEN LET p_fac2=1 END IF
   IF cl_null(p_qty2) THEN LET p_qty2=0 END IF

   IF g_sma.sma115 = 'Y' THEN
      CASE l_ima906
         WHEN '1' LET l_tot=p_qty1*p_fac1
         WHEN '2' LET l_tot=p_qty1*p_fac1+p_qty2*p_fac2
         WHEN '3' LET l_tot=p_qty1*p_fac1
      END CASE
   ELSE  #不使用雙單位
      LET l_tot=p_qty1*p_fac1
   END IF

   IF cl_null(l_tot) THEN LET l_tot = 0 END IF
   LET l_factor = 1

   CALL s_umfchk(p_item,l_ima44,p_rvv86) RETURNING g_cnt,l_factor

   IF g_cnt = 1 THEN
      LET l_factor = 1
   END IF
   LET l_tot = l_tot * l_factor

   RETURN l_tot

END FUNCTION
#No.FUN-580115  --end
#No.FUN-540027  --end

#TQC-650108
FUNCTION t110_refresh_detail()
  DEFINE l_compare          LIKE smy_file.smy62
  DEFINE li_col_count       LIKE type_file.num5      #No.FUN-680136 SMALLINT
  DEFINE li_i, li_j         LIKE type_file.num5      #No.FUN-680136 SMALLINT
  DEFINE lc_agb03           LIKE agb_file.agb03
  DEFINE lr_agd             RECORD LIKE agd_file.*
  DEFINE lc_index           STRING
  DEFINE ls_combo_vals      STRING
  DEFINE ls_combo_txts      STRING
  DEFINE ls_sql             STRING
  DEFINE ls_show,ls_hide    STRING
  DEFINE l_gae04            LIKE gae_file.gae04

  #判斷是否進行料件多屬性新機制管理以及是否傳入了屬性群組
  IF ( g_sma.sma120 = 'Y' )AND( g_sma.sma907 = 'Y' ) THEN
     #首先判斷有無單身記錄，如果單身根本沒有東東，則按照默認的lg_smy62來決定
     #顯示什么組別的信息，如果有單身，則進行下面的邏輯判斷
     IF g_rvb.getLength() = 0 THEN
        LET lg_group = lg_smy62
     ELSE
       #讀取當前單身所有的料件資料，如果它們都屬于多屬性子料件，并且擁有一致的
       #屬性群組，則以該屬性群組作為顯示單身明細屬性的依據，如果有不統一的狀況
       #則返回一個NULL，下面將不顯示任明細屬性列
       FOR li_i = 1 TO g_rvb.getLength()
         #如果某一個料件沒有對應的母料件(已經在前面的b_fill中取出來放在imx00中了)
         #則不進行下面判斷直接退出了
         IF  cl_null(g_rvb[li_i].att00) THEN
            LET lg_group = ''
            EXIT FOR
         END IF
         SELECT imaag INTO l_compare FROM ima_file WHERE ima01 = g_rvb[li_i].att00
         #第一次是賦值
         IF cl_null(lg_group) THEN
            LET lg_group = l_compare
         #以后是比較
         ELSE
           #如果在單身料件屬于不同的屬性組則直接退出（不顯示這些東東)
           IF l_compare <> lg_group THEN
              LET lg_group = ''
              EXIT FOR
           END IF
         END IF
         IF lg_group <> lg_smy62 THEN
            LET lg_group = ''
            EXIT FOR
         END IF
       END FOR
     END IF

     #到這里時lg_group中存放的已經是應該顯示的組別了，該變量是一個全局變量
     #在單身INPUT或開窗時都會用到，因為refresh函數被執行的時機較早，所以能保証在需要的時候有值
     SELECT COUNT(*) INTO li_col_count FROM agb_file WHERE agb01 = lg_group

     #走到這個分支說明是采用新機制，那么使用att00父料件編號代替rvb05子料件編號來顯示
     #得到當前語言別下rvb05的欄位標題
     SELECT gae04 INTO l_gae04 FROM gae_file
       WHERE gae01 = g_prog AND gae02 = 'rvb05' AND gae03 = g_lang
     CALL cl_set_comp_att_text("att00",l_gae04)

     #為了提高效率，把需要顯示和隱藏的欄位都放到各自的變量里，然后在結尾的地方一次性顯示或隱藏
     IF NOT cl_null(lg_group) THEN
        LET ls_hide = 'rvb05,pmn041'
        LET ls_show = 'att00'
     ELSE
        LET ls_hide = 'att00'
        LET ls_show = 'rvb05,pmn041'
     END IF

     #顯現該有的欄位,置換欄位格式
     CALL lr_agc.clear()  #因為這個過程可能會被執行多次，作為一個公共變量，每次執行之前必須要初始化
     FOR li_i = 1 TO li_col_count
         SELECT agb03 INTO lc_agb03 FROM agb_file
           WHERE agb01 = lg_group AND agb02 = li_i

         LET lc_agb03 = lc_agb03 CLIPPED
         SELECT * INTO lr_agc[li_i].* FROM agc_file
           WHERE agc01 = lc_agb03

         LET lc_index = li_i USING '&&'

         CASE lr_agc[li_i].agc04
           WHEN '1'
             LET ls_show = ls_show || ",att" || lc_index
             LET ls_hide = ls_hide || ",att" || lc_index || "_c"
             CALL cl_set_comp_att_text("att" || lc_index,lr_agc[li_i].agc02)

             CALL cl_chg_comp_att("formonly.att" || lc_index,"NOENTRY|SCROLL","1|1")
           WHEN '2'
             LET ls_show = ls_show || ",att" || lc_index || "_c"
             LET ls_hide = ls_hide || ",att" || lc_index
             CALL cl_set_comp_att_text("att" || lc_index || "_c",lr_agc[li_i].agc02)
             LET ls_sql = "SELECT * FROM agd_file WHERE agd01 = '",lr_agc[li_i].agc01,"'"
             DECLARE agd_curs CURSOR FROM ls_sql
             LET ls_combo_vals = ""
             LET ls_combo_txts = ""
             FOREACH agd_curs INTO lr_agd.*
                IF SQLCA.sqlcode THEN
                   EXIT FOREACH
                END IF
                IF ls_combo_vals IS NULL THEN
                   LET ls_combo_vals = lr_agd.agd02 CLIPPED
                ELSE
                   LET ls_combo_vals = ls_combo_vals,",",lr_agd.agd02 CLIPPED
                END IF
                IF ls_combo_txts IS NULL THEN
                   LET ls_combo_txts = lr_agd.agd02 CLIPPED,":",lr_agd.agd03 CLIPPED
                ELSE
                   LET ls_combo_txts = ls_combo_txts,",",lr_agd.agd02 CLIPPED,":",lr_agd.agd03 CLIPPED
                END IF
             END FOREACH
             CALL cl_set_combo_items("formonly.att" || lc_index || "_c",ls_combo_vals,ls_combo_txts)
             CALL cl_chg_comp_att("formonly.att" || lc_index || "_c","NOENTRY|SCROLL","1|1")
          WHEN '3'
             LET ls_show = ls_show || ",att" || lc_index
             LET ls_hide = ls_hide || ",att" || lc_index || "_c"
             CALL cl_set_comp_att_text("att" || lc_index,lr_agc[li_i].agc02)
             CALL cl_chg_comp_att("formonly.att" || lc_index,"NOENTRY|SCROLL","1|1")
       END CASE
     END FOR

  ELSE
    #否則什么也不做(不顯示任何屬性列)
    LET li_i = 1
    #為了提高效率，把需要顯示和隱藏的欄位都放到各自的變量里，然后在結尾的地方一次性顯示或隱藏
    LET ls_hide = 'att00'
    LET ls_show = 'rvb05'
  END IF

  #下面開始隱藏其他明細屬性欄位(從li_i開始)
  FOR li_j = li_i TO 10
      LET lc_index = li_j USING '&&'
      #注意att0x和att0x_c都要隱藏，別忘了_c的
      LET ls_hide = ls_hide || ",att" || lc_index || ",att" || lc_index || "_c"
  END FOR

  #這樣只用調兩次公共函數就可以解決問題了，效率應該會高一些
  CALL cl_set_comp_visible(ls_show, TRUE)
  CALL cl_set_comp_visible(ls_hide, FALSE)

END FUNCTION

#--------------------在修改下面的代碼前請讀一下注釋先，謝了! -----------------------

#下面代碼是從單身INPUT ARRAY語句中的AFTER FIELD段中拷貝來的，因為在多屬性新模式下原來的oea04料件編號
#欄位是要被隱藏起來，并由新增加的imx00（母料件編號）+各個明細屬性欄位來取代，所以原來的AFTER FIELD
#代碼是不會被執行到，需要執行的判斷應該放新增加的几個欄位的AFTER FIELD中來進行，因為要用多次嘛，所以
#單獨用一個FUNCTION來放，順便把rvb05的AFTER FIELD也移過來，免得將來維護的時候遺漏了
#下標g_rvb[l_ac]都被改成g_rvb[p_ac]，請注意

#本函數返回TRUE/FALSE,表示檢核過程是否通過，一般說來，在使用過程中應該是如下方式□
#    AFTER FIELD XXX
#        IF NOT t110_check_rvb05(.....)  THEN NEXT FIELD XXX END IF
FUNCTION t110_check_rvb05(p_field,p_ac,p_cmd) #No.MOD-660090
DEFINE
  p_field                     STRING,    #當前是在哪個欄位中觸發了AFTER FIELD事件
  p_ac                        LIKE type_file.num5,     #No.FUN-680136 SMALLINT  #g_rvb數組中的當前記錄下標

  l_ps                        LIKE sma_file.sma46,
  l_str_tok                   base.stringTokenizer,
  l_tmp, ls_sql               STRING,
  l_param_list                STRING,
  l_cnt, li_i                 LIKE type_file.num5,     #No.FUN-680136 SMALLINT
  ls_value                    STRING,
  ls_pid,ls_value_fld         LIKE ima_file.ima01,
  ls_name, ls_spec            STRING,
  lc_agb03                    LIKE agb_file.agb03,
  lc_agd03                    LIKE agd_file.agd03,
  ls_pname                    LIKE ima_file.ima02,
  l_misc                      LIKE type_file.chr4,     #No.FUN-680136 VARCHAR(04)
  l_multi                     LIKE type_file.chr1,     #No.FUN-680136 VARCHAR(01)
  l_n                         LIKE type_file.num5,     #No.FUN-680136 SMALLINT
  l_b2                        LIKE ima_file.ima31,
  l_ima130                    LIKE ima_file.ima130,
  l_ima131                    LIKE ima_file.ima131,
  l_ima25                     LIKE ima_file.ima25,
  l_imaacti                   LIKE ima_file.imaacti,
  l_qty                       LIKE type_file.num10,  #No.FUN-680136 INTEGER
# p_cmd                       STRING   #No.MOD-660090 MARK
  p_cmd                       LIKE type_file.chr1   #No.MOD-660090  #No.FUN-680136 VARCHAR(1)


  #如果當前欄位是新增欄位（母料件編號以及十個明細屬性欄位）的時候，如果全部輸了值則合成出一個
  #新的子料件編號并把值填入到已經隱藏起來的rvb05中（如果imxXX能夠顯示，rvb05一定是隱藏的）
  #下面就可以直接沿用rvb05的檢核邏輯了
  #如果不是，則看看是不是rvb05自己觸發了，如果還不是則什么也不做(無聊)，返回一個FALSE
  IF ( p_field = 'imx00' )OR( p_field = 'imx01' )OR( p_field = 'imx02' )OR
     ( p_field = 'imx03' )OR( p_field = 'imx04' )OR( p_field = 'imx05' )OR
     ( p_field = 'imx06' )OR( p_field = 'imx07' )OR( p_field = 'imx08' )OR
     ( p_field = 'imx09' )OR( p_field = 'imx10' ) THEN

     #首先判斷需要的欄位是否全部完成了輸入（只有母料件編號+被顯示出來的所有明細屬性
     #全部被輸入完成了才進行后續的操作
     LET ls_pid = g_rvb[p_ac].att00   # ls_pid 父料件編號
     LET ls_value = g_rvb[p_ac].att00   # ls_value 子料件編號
     IF cl_null(ls_pid) THEN
        #MOD-640107 Add ,所有要返回TRUE的分支都要加這兩句話,原來下面的會被
        #注釋掉
        CALL t110_set_no_entry_b(p_cmd)
        #FUN-540049  --begin
        CALL t110_set_required()
        #FUN-540049  --end

        RETURN TRUE
     END IF  #注意這里沒有錯，所以返回TRUE

     #取出當前母料件包含的明細屬性的個數
     SELECT COUNT(*) INTO l_cnt FROM agb_file WHERE agb01 =
        (SELECT imaag FROM ima_file WHERE ima01 = ls_pid)
     IF l_cnt = 0 THEN
        #MOD-640107 Add ,所有要返回TRUE的分支都要加這兩句話,原來下面的會被
        #注釋掉
        CALL t110_set_no_entry_b(p_cmd)
        #FUN-540049  --begin
        CALL t110_set_required()
        #FUN-540049  --end

         RETURN TRUE
     END IF

     FOR li_i = 1 TO l_cnt
         #如果有任何一個明細屬性應該輸而沒有輸的則退出
         IF cl_null(arr_detail[p_ac].imx[li_i]) THEN
            #MOD-640107 Add ,所有要返回TRUE的分支都要加這兩句話,原來下面的會被
            #注釋掉
            CALL t110_set_no_entry_b(p_cmd)
            #FUN-540049  --begin
            CALL t110_set_required()
            #FUN-540049  --end

            RETURN TRUE
         END IF
     END FOR

     #得到系統定義的標准分隔符sma46
     SELECT sma46 INTO l_ps FROM sma_file

     #合成子料件的名稱
     SELECT ima02 INTO ls_pname FROM ima_file   # ls_name 父料件名稱
       WHERE ima01 = ls_pid
     LET ls_spec = ls_pname  # ls_spec 子料件名稱
     #方法□循環在agd_file中找有沒有對應記錄，如果有，就用該記錄的名稱來
     #替換初始名稱，如果找不到則就用原來的名稱
     FOR li_i = 1 TO l_cnt
         LET lc_agd03 = ""
         LET ls_value = ls_value.trim(), l_ps, arr_detail[p_ac].imx[li_i]
         SELECT agd03 INTO lc_agd03 FROM agd_file
          WHERE agd01 = lr_agc[li_i].agc01 AND agd02 = arr_detail[p_ac].imx[li_i]
         IF cl_null(lc_agd03) THEN
            LET ls_spec = ls_spec.trim(),l_ps,arr_detail[p_ac].imx[li_i]
         ELSE
            LET ls_spec = ls_spec.trim(),l_ps,lc_agd03
         END IF
     END FOR

     #解析ls_value生成要傳給cl_copy_bom的那個l_param_list
     LET l_str_tok = base.StringTokenizer.create(ls_value,l_ps)
     LET l_tmp = l_str_tok.nextToken()   #先把第一個部分--名稱去掉

     LET ls_sql = "SELECT agb03 FROM agb_file,ima_file WHERE ",
                  "ima01 = '",ls_pid CLIPPED,"' AND agb01 = imaag ",
                  "ORDER BY agb02"
     DECLARE param_curs CURSOR FROM ls_sql
     FOREACH param_curs INTO lc_agb03
       #l_str_tok中的Tokens數量應該和param_curs中的記錄數量完全一致
       IF cl_null(l_param_list) THEN
          LET l_param_list = '#',lc_agb03,'#|',l_str_tok.nextToken()
       ELSE
          LET l_param_list = l_param_list,'|#',lc_agb03,'#|',l_str_tok.nextToken()
       END IF
     END FOREACH

     #調用cl_copy_ima將新生成的子料件插入到數據庫中
     IF cl_copy_ima(ls_pid,ls_value,ls_spec,l_param_list) = TRUE THEN
        #如果向其中成功插入記錄則同步插入屬性記錄到imx_file中去
        LET ls_value_fld = ls_value
        INSERT INTO imx_file VALUES(ls_value_fld,ls_pid,arr_detail[p_ac].imx[1],
          arr_detail[p_ac].imx[2],arr_detail[p_ac].imx[3],arr_detail[p_ac].imx[4],
          arr_detail[p_ac].imx[5],arr_detail[p_ac].imx[6],arr_detail[p_ac].imx[7],
          arr_detail[p_ac].imx[8],arr_detail[p_ac].imx[9],arr_detail[p_ac].imx[10])
        #如果向imx_file中插入記錄失敗則也應將ima_file中已經建立的紀錄刪除以保証兩邊
        #記錄的完全同步
        IF SQLCA.sqlcode THEN
#          CALL cl_err('Failure to insert imx_file , rollback insert to ima_file !','',1)  #No.FUN-660129
           CALL cl_err3("ins","imx_file",ls_value_fld,"",SQLCA.sqlcode,"","Failure to insert imx_file , rollback insert to ima_file !",1) #No.FUN-660129
           DELETE FROM ima_file WHERE ima01 = ls_value_fld
           RETURN FALSE
        END IF
     END IF
     #把生成的子料件賦給rvb05，否則下面的檢查就沒有意義了
     LET g_rvb[p_ac].rvb05 = ls_value
  ELSE
    IF ( p_field <> 'rvb05' )AND( p_field <> 'imx00' ) THEN
       RETURN FALSE
    END IF
  END IF

  #到這里已經完成了以前在cl_itemno_multi_att()中做的所有准備工作，在系統資料庫
  #中已經有了對應的子料件的名稱，下面可以按照rvb05進行判斷了

  #--------重要 !!!!!!!!!!!-------------------------
  #下面的代碼都是從原INPUT ARRAY中的AFTER FIELD rvb05段拷貝來的，唯一做的修改
  #是將原來的NEXT FIELD 語句都改成了RETURN FALSE, xxx,xxx ... ，因為NEXE FIELD
  #語句要交給調用方來做，這里只需要返回一個FALSE告訴它有錯誤就可以了，同時一起
  #返回的還有一些CHECK過程中要從ima_file中取得的欄位信息，其他的比如判斷邏輯和
  #錯誤提示都沒有改，如果你需要在里面添加代碼請注意上面的那個要點就可以了
  IF NOT cl_null(g_rvb[l_ac].rvb05) THEN
     IF g_sma.sma120 = 'Y' THEN
        LET l_multi = '4'
        CALL cl_itemno_multi_att("rvb05",g_rvb[l_ac].rvb05,"","1","a") RETURNING l_multi,g_rvb[l_ac].rvb05,g_rvb[l_ac].pmn041
        DISPLAY g_rvb[l_ac].rvb05 TO rvb05
        DISPLAY g_rvb[l_ac].pmn041 TO pmn041
     END IF
     CALL t110_set_no_entry_b('a')
     CALL t110_set_required()
     LET g_rvb_t.rvb05=g_rvb[l_ac].rvb05
     RETURN TRUE
  ELSE
     IF ( p_field = 'rvb05' )OR( p_field = 'imx00' ) THEN
        CALL t110_set_no_entry_b('a')
        CALL t110_set_required()
        RETURN TRUE
     ELSE
        RETURN FALSE
     END IF
  END IF
END FUNCTION

#用于att01~att10這十個輸入型屬性欄位的AFTER FIELD事件的判斷函數
#傳入參數:p_value 要比較的欄位內容,p_index當前欄位的索引號(從1~10表示att01~att10)
#         p_row是當前行索引,傳入INPUT ARRAY中使用的l_ac即可
#與t110_check_rvb05相同,如果檢查過程中如果發現錯誤,則報錯并返回一個FALSE
#而AFTER FIELD的時候檢測到這個返回值則會做NEXT FIELD
FUNCTION t110_check_att0x(p_value,p_index,p_row,p_cmd) #No.MOD-660090
DEFINE
  p_value      LIKE imx_file.imx01,
  p_index      LIKE type_file.num5,    #No.FUN-680136 SMALLINT
  p_row        LIKE type_file.num5,    #No.FUN-680136 SMALLINT
  li_min_num   LIKE agc_file.agc05,
  li_max_num   LIKE agc_file.agc06,
  l_index      STRING,
  p_cmd        LIKE type_file.chr1,    #No.MOD-660090 #No.FUN-680136 VARCHAR(1)
  l_check_res  LIKE type_file.num5,    #No.FUN-680136 SMALLINT
  l_b2         LIKE type_file.chr50,   #No.FUN-680136 VARCHAR(30)
  l_imaacti    LIKE ima_file.imaacti,
  l_ima130     LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(1)
  l_ima131     LIKE ima_file.ima131,   #No.FUN-680136 VARCHAR(10)
  l_ima25      LIKE ima_file.ima25

  #這個欄位一旦進入了就不能忽略，因為要保証在輸入其他欄位之前必須要生成rvb05料件編號
  IF cl_null(p_value) THEN
     RETURN FALSE
  END IF

  #這里使用到了一個用于存放當前屬性組包含的所有屬性信息的全局數組lr_agc
  #該數組會由t110_refresh_detail()函數在較早的時候填充

  #判斷長度與定義的使用位數是否相等
  IF LENGTH(p_value CLIPPED) <> lr_agc[p_index].agc03 THEN
     CALL cl_err_msg("","aim-911",lr_agc[p_index].agc03,1)
     RETURN FALSE
  END IF
  #比較大小是否在合理范圍之內
  LET li_min_num = lr_agc[p_index].agc05
  LET li_max_num = lr_agc[p_index].agc06
  IF (lr_agc[p_index].agc05 IS NOT NULL) AND
     (p_value < li_min_num) THEN
     CALL cl_err_msg("","lib-232",lr_agc[p_index].agc05 || "|" || lr_agc[p_index].agc06,1)
     RETURN FALSE
  END IF
  IF (lr_agc[p_index].agc06 IS NOT NULL) AND
     (p_value > li_max_num) THEN
     CALL cl_err_msg("","lib-232",lr_agc[p_index].agc05 || "|" || lr_agc[p_index].agc06,1)
     RETURN FALSE
  END IF
  #通過了欄位檢查則可以下面的合成子料件代碼以及相應的檢核操作了
  LET arr_detail[p_row].imx[p_index] = p_value
  LET l_index = p_index USING '&&'
  CALL t110_check_rvb05('imx' || l_index ,p_row,p_cmd)  #No.MOD-660090
    RETURNING l_check_res
    RETURN l_check_res
END FUNCTION

#用于att01_c~att10_c這十個選擇型屬性欄位的AFTER FIELD事件的判斷函數
#傳入參數:p_value 要比較的欄位內容,p_index當前欄位的索引號(從1~10表示att01~att10)
#         p_row是當前行索引,傳入INPUT ARRAY中使用的l_ac即可
#與t110_check_rvb05相同,如果檢查過程中如果發現錯誤,則報錯并返回一個FALSE
#而AFTER FIELD的時候檢測到這個返回值則會做NEXT FIELD
FUNCTION t110_check_att0x_c(p_value,p_index,p_row,p_cmd) #No.MOD-660090
DEFINE
  p_value        LIKE imx_file.imx01,
  p_index        LIKE type_file.num5,    #No.FUN-680136 SMALLINT
  p_row          LIKE type_file.num5,    #No.FUN-680136 SMALLINT
  l_index        STRING,
  p_cmd          LIKE type_file.chr1,    #No.MOD-660090 #No.FUN-680136 VARCHAR(1)
  l_check_res    LIKE type_file.num5,    #No.FUN-680136 SMALLINT
  l_b2           LIKE type_file.chr50,   #No.FUN-680136 VARCHAR(30)
  l_imaacti      LIKE ima_file.imaacti,
  l_ima130       LIKE type_file.chr1,    #No.FUN-680136 VARCHAR(1)
  l_ima131       LIKE ima_file.ima131,   #No.FUN-680136 VARCHAR(10)
  l_ima25        LIKE ima_file.ima25


  #這個欄位一旦進入了就不能忽略，因為要保証在輸入其他欄位之前必須要生成rvb05料件編號
  IF cl_null(p_value) THEN
     RETURN FALSE
  END IF
  #下拉框選擇項相當簡單，不需要進行范圍和長度的判斷，因為肯定是符合要求的了
  LET arr_detail[p_row].imx[p_index] = p_value
  LET l_index = p_index USING '&&'
  CALL t110_check_rvb05('imx'||l_index,p_row,p_cmd) #No.MOD-660090
    RETURNING l_check_res
  RETURN l_check_res
END FUNCTION
#TQC-650108 --end
#FUN-670051...............begin
FUNCTION t110_set_rvb930(p_rvb930)
DEFINE p_rvb930 LIKE rvb_file.rvb930
DEFINE l_gem02  LIKE gem_file.gem02

   SELECT gem02 INTO l_gem02 FROM gem_file
                            WHERE gem01=p_rvb930
   IF SQLCA.sqlcode THEN
      LET l_gem02=NULL
   END IF
   RETURN l_gem02
END FUNCTION
#FUN-670051...............end

#-------No:TQC-670091 add
FUNCTION t110_minp(p_rvb03,p_rvb04,p_rvb34)
   DEFINE l_pmn43      LIKE pmn_file.pmn43
   DEFINE l_ecm04      LIKE ecm_file.ecm04
   DEFINE l_sfa06      LIKE sfa_file.sfa06
   DEFINE l_sfa161     LIKE sfa_file.sfa161
  #-----------No:TQC-6A0057 add
   DEFINE l_sfb08      LIKE sfb_file.sfb05
   DEFINE l_sfa05      LIKE sfa_file.sfa05
   DEFINE l_sfa062     LIKE sfa_file.sfa062
   DEFINE l_sfa063     LIKE sfa_file.sfa063
   DEFINE l_sfa        RECORD LIKE sfa_file.*
  #-----------No:TQC-6A0057 end
   DEFINE l_min_set    LIKE sfb_file.sfb08,
          l_min_set_t  LIKE sfb_file.sfb08
   DEFINE p_rvb03      LIKE rvb_file.rvb03,
          p_rvb04      LIKE rvb_file.rvb04,
          p_rvb34      LIKE rvb_file.rvb34,
          l_sql        LIKE type_file.chr1000,#No.FUN-680136 VARCHAR(1000)
          l_cnt        LIKE type_file.num5    #No.FUN-680136 SMALLINT
   DEFINE l_over_qty   LIKE sfb_file.sfb08
   DEFINE l_pmn18      LIKE pmn_file.pmn18 #TQC-750166

   LET l_pmn43 = NULL
   LET l_ecm04 = NULL
   LET l_sfa06 = 0
   LET l_sfa161= 0
   LET l_min_set = 0
   LET l_min_set_t=0

   #抓取採購單上的製程序號
    SELECT pmn43,pmn18 INTO l_pmn43,l_pmn18 FROM pmn_file #TQC-750166
       WHERE pmn01 = p_rvb04 AND pmn02 = p_rvb03
    IF STATUS THEN
       LET l_pmn43 = NULL
       LET l_pmn18 = NULL #TQC-750166
    END IF

   #抓取工單製程作業編號
    IF cl_null(l_pmn18) THEN #TQC-750166 不走runcard
       SELECT ecm04 INTO l_ecm04 FROM ecm_file
          WHERE ecm01 = p_rvb34 AND ecm03 = l_pmn43
       IF STATUS THEN
          LET l_ecm04 = NULL
       END IF
    #TQC-750166...............begin
    ELSE
       SELECT sgm04 INTO l_ecm04 FROM sgm_file
        WHERE sgm01=l_pmn18 AND sgm03=l_pmn43
       IF STATUS THEN
          LET l_ecm04 = NULL
       END IF
    END IF
    #TQC-750166...............end
   #--------------No:TQC-6A0057 modify
   #抓取公工單生產數量
    SELECT sfb08 INTO l_sfb08 FROM sfb_file WHERE sfb01 = p_rvb34
      IF cl_null(l_sfb08) THEN LET l_sfb08 = 0 END IF

   #LET l_sql = " SELECT sfa06,sfa161 FROM sfa_file ",
   #            " WHERE sfa01 ='",p_rvb34 CLIPPED,"' ",
   #            "   AND sfa08 ='",l_ecm04 CLIPPED,"' "

    LET l_sql = " SELECT * FROM sfa_file ",
                " WHERE sfa01 ='",p_rvb34 CLIPPED,"' ",
#               "   AND (sfa08 ='",l_ecm04 CLIPPED,"' ",    #wujie 080717
#               "        OR sfa08 = ' ') ",                 #wujie 080717
                "   AND sfa065 = 0 ",          #No:MOD-780060 add
                "   AND sfa11 <> 'E' AND (sfa05>0  or sfa26 in ('3','4'))"         #No:MOD-730032 add
   #--------------No:TQC-6A0057 end
   PREPARE t110_min_p1 FROM l_sql
   DECLARE t110_min_c1 CURSOR WITH HOLD FOR t110_min_p1
   LET l_cnt = 0
  #-------------No:TQC-6A0057 modify
  #FOREACH t110_min_c1 INTO l_sfa06,l_sfa161
   FOREACH t110_min_c1 INTO l_sfa.*
     #LET l_cnt = l_cnt + 1    #TQC-810094
      IF l_sfa.sfa26 MATCHES '[34]' THEN
         SELECT SUM(sfa06/sfa28),SUM(sfa05/sfa28),SUM(sfa062/sfa28),SUM(sfa063/sfa28)
            INTO l_sfa06,l_sfa05,l_sfa062,l_sfa063 FROM sfa_file
            WHERE sfa01=l_sfa.sfa01
             AND sfa27=l_sfa.sfa03
             AND sfa08=l_sfa.sfa08
             AND sfa12=l_sfa.sfa12
#TQC-810094--start---
        # LET l_sfa.sfa06  = l_sfa.sfa06  + l_sfa06
        # LET l_sfa.sfa05  = l_sfa.sfa05  + l_sfa05
        # LET l_sfa.sfa062 = l_sfa.sfa062 + l_sfa062
        # LET l_sfa.sfa063 = l_sfa.sfa063 + l_sfa063
          LET l_sfa.sfa06  = l_sfa06
          LET l_sfa.sfa05  = l_sfa05
          LET l_sfa.sfa062 = l_sfa062
          LET l_sfa.sfa063 = l_sfa063
       END IF
      IF l_sfa.sfa26 MATCHES '[US]' THEN
         CONTINUE FOREACH
      END IF
      LET l_cnt = l_cnt + 1
#TQC-810094--end-----
      IF l_cnt = 1 THEN
        #LET l_min_set = l_sfa06 / l_sfa161
         LET l_min_set=((l_sfa.sfa06-l_sfa.sfa063+l_sfa.sfa062)/l_sfa.sfa05)*l_sfb08
         LET l_min_set_t = l_min_set
      ELSE
        #LET l_min_set = l_sfa06 / l_sfa161
         LET l_min_set=((l_sfa.sfa06-l_sfa.sfa063+l_sfa.sfa062)/l_sfa.sfa05)*l_sfb08
         IF l_min_set < l_min_set_t THEN
            LET l_min_set_t = l_min_set
         END IF
      END IF
   END FOREACH
  #-------------No:TQC-6A0057 end
  #CHI-6B0019--begin
  # sma73 工單完工數量是否檢查發料最小套數
  # sma74 工單完工量容許差異百分比
   LET l_over_qty = 0
   IF g_sma.sma73='Y' THEN  #
      LET l_over_qty=((l_min_set_t*g_sma.sma74)/100)
   ELSE
      LET l_over_qty=0
   END IF
   IF l_over_qty IS NULL THEN LET l_over_qty=0 END IF
   LET l_min_set_t = l_min_set_t + l_over_qty
  #CHI-6B0019--end
   RETURN l_min_set_t
END FUNCTION
#-------No:TQC-670091 end

#FUN-680011
FUNCTION t110_spc()
DEFINE l_gaz03        LIKE gaz_file.gaz03
DEFINE l_cnt          LIKE type_file.num10    #No.FUN-680136 INTEGER
DEFINE l_qc_cnt       LIKE type_file.num10    #No.FUN-680136 INTEGER
DEFINE l_rvb02        LIKE rvb_file.rvb02
DEFINE l_qcs          DYNAMIC ARRAY OF RECORD LIKE qcs_file.*
DEFINE l_qc_prog      LIKE zz_file.zz01       #No.FUN-680136 VARCHAR(10)
DEFINE l_i            LIKE type_file.num10    #No.FUN-680136 INTEGER
DEFINE l_cmd          STRING
DEFINE l_sql          STRING
DEFINE l_err          STRING

   LET g_success = 'Y'

   #檢查資料是否可拋轉至 SPC
   #CALL aws_spccli_check('單號','SPC拋轉碼','確認碼','有效碼')
   CALL aws_spccli_check(g_rva.rva01,g_rva.rvaspc,g_rva.rvaconf,'')
   IF g_success = 'N' THEN
       RETURN
   END IF

   LET l_qc_prog = "aqct110"               #設定QC單的程式代號

   #若在 QC 單已有此單號相關資料，則取消拋轉至 SPC
   SELECT COUNT(*) INTO l_cnt FROM qcs_file WHERE qcs01 = g_rva.rva01
   IF l_cnt > 0 THEN
     CALL cl_get_progname(l_qc_prog,g_lang) RETURNING l_gaz03
     CALL cl_err_msg(g_rva.rva01,'aqc-115', l_gaz03 CLIPPED || "|" || l_qc_prog CLIPPED,'1')
     LET g_success='N'
     RETURN
   END IF

   #需要 QC 檢驗的筆數
   SELECT COUNT(*) INTO l_qc_cnt FROM rvb_file
       WHERE rvb01 = g_rva.rva01 AND rvb39 = 'Y' AND rvb19 = '1'
   IF l_qc_cnt = 0 THEN
      SELECT COUNT(*) INTO l_cnt FROM rvb_file
      WHERE rvb01 = g_rva.rva01 AND rvb19 = '2'
      IF l_cnt > 0 THEN
         #委外代買料件免驗!
         LET l_err = 'aqc-110'
      ELSE
         #免驗料!
         LET l_err = 'aqc-113'
      END IF
      CALL cl_err(g_rva.rva01,l_err,0)
      LET g_success='N'
      RETURN
   END IF

   #需檢驗的資料，自動新增資料至 QC 單 ,功能參數為「SPC」
   LET l_sql  = "SELECT rvb02 FROM rvb_file
        WHERE rvb01 = '",g_rva.rva01,"' AND rvb39='Y' AND rvb19 = '1'"
   PREPARE t110_rvb_p FROM l_sql
   DECLARE t110_rvb_c CURSOR WITH HOLD FOR t110_rvb_p
   FOREACH t110_rvb_c INTO l_rvb02
       LET l_cmd = l_qc_prog CLIPPED," '",g_rva.rva01,"' '",l_rvb02,"' '1' 'SPC'"
       CALL aws_spccli_qc(l_qc_prog,l_cmd)
   END FOREACH

   #判斷產生的 QC 單筆數是否正確
   SELECT COUNT(*) INTO l_cnt FROM qcs_file WHERE qcs01 = g_rva.rva01
   IF l_cnt <> l_qc_cnt THEN
     CALL t110_qcs_del()
     LET g_success='N'
     RETURN
   END IF

   LET l_sql  = "SELECT *  FROM qcs_file WHERE qcs01 = '",g_rva.rva01,"'"
   PREPARE t110_qc_p FROM l_sql
   DECLARE t110_qc_c CURSOR WITH HOLD FOR t110_qc_p
   LET l_cnt = 1
   FOREACH t110_qc_c INTO l_qcs[l_cnt].*
       LET l_cnt = l_cnt + 1
   END FOREACH
   CALL l_qcs.deleteElement(l_cnt)

   # CALL aws_spccli()
   #功能: 傳送此單號所有的 QC 單至 SPC 端
   # 傳入參數: (1) QC 程式代號, (2) QC 單頭資料,(3)功能選項：insert(新增),delete(刪除)
   # 回傳值  : 0 傳送失敗; 1 傳送成功
   IF aws_spccli(l_qc_prog,base.TypeInfo.create(l_qcs),"insert")
   THEN
         LET g_rva.rvaspc = '1'
   ELSE
         LET g_rva.rvaspc = '2'
         CALL t110_qcs_del()
   END IF

   UPDATE rva_file set rvaspc = g_rva.rvaspc WHERE rva01 = g_rva.rva01
   IF STATUS OR SQLCA.sqlerrd[3] = 0 THEN
      CALL cl_err3("upd","rva_file",g_rva.rva01,"",STATUS,"","upd rvaspc",1)
      IF g_rva.rvaspc = '1' THEN
          CALL t110_qcs_del()
      END IF
      LET g_success = 'N'
   END IF
   DISPLAY BY NAME g_rva.rvaspc

END FUNCTION

FUNCTION t110_qcs_del()

      DELETE FROM qcs_file WHERE qcs01 = g_rva.rva01
      IF SQLCA.sqlcode THEN
         CALL cl_err3("del","qcs_file",g_rva.rva01,"",SQLCA.sqlcode,"","DEL qcs_filee err!",0)
      END IF

      DELETE FROM qct_file WHERE qct01 = g_rva.rva01
      IF SQLCA.sqlcode THEN
         CALL cl_err3("del","qct_file",g_rva.rva01,"",SQLCA.sqlcode,"","DEL qct_filee err!",0)
      END IF

      DELETE FROM qcu_file WHERE qcu01 = g_rva.rva01
      IF SQLCA.sqlcode THEN
         CALL cl_err3("del","qcu_file",g_rva.rva01,"",SQLCA.sqlcode,"","DEL qcu_filee err!",0)
      END IF

      DELETE FROM qctt_file WHERE qctt01 = g_rva.rva01
      IF SQLCA.sqlcode THEN
         CALL cl_err3("del","qctt_file",g_rva.rva01,"",SQLCA.sqlcode,"","DEL qcstt_filee err!",0)
      END IF

      DELETE FROM qcv_file WHERE qcv01 = g_rva.rva01
      IF SQLCA.sqlcode THEN
         CALL cl_err3("del","qcv_file",g_rva.rva01,"",SQLCA.sqlcode,"","DEL qcv_filee err!",0)
      END IF

END FUNCTION
#END FUN-680011

#-----TQC-710032---------
FUNCTION t110_mu_ui()
   CALL cl_set_comp_visible("rvb84,rvb81,rvb10,rvb10t",FALSE)  #FUN-6A0139 add rvb10,rvb10t
   IF g_sma.sma115='Y' THEN
      CALL cl_set_comp_visible("rvb07",FALSE)
   ELSE
       CALL cl_set_comp_visible("rvb83,rvb84,rvb85",FALSE)
       CALL cl_set_comp_visible("rvb80,rvb81,rvb82",FALSE)
   END IF
   IF g_sma.sma116 MATCHES '[02]' THEN    #No:FUN-610076
       CALL cl_set_comp_visible("rvb86,rvb87",FALSE)
   END IF
   IF g_sma.sma122 ='1' THEN
      CALL cl_getmsg('asm-302',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("rvb83",g_msg CLIPPED)
      CALL cl_getmsg('asm-306',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("rvb85",g_msg CLIPPED)
      CALL cl_getmsg('asm-303',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("rvb80",g_msg CLIPPED)
      CALL cl_getmsg('asm-307',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("rvb82",g_msg CLIPPED)
   END IF
   IF g_sma.sma122 ='2' THEN
      CALL cl_getmsg('asm-304',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("rvb83",g_msg CLIPPED)
      CALL cl_getmsg('asm-308',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("rvb85",g_msg CLIPPED)
      CALL cl_getmsg('asm-362',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("rvb80",g_msg CLIPPED)
      CALL cl_getmsg('asm-363',g_lang) RETURNING g_msg
      CALL cl_set_comp_att_text("rvb82",g_msg CLIPPED)
   END IF
END FUNCTION
#-----END TQC-710032-----
#FUN-730068............begin
FUNCTION t110_b_move_to()
   LET g_rvb[l_ac].rvb02  = g_rvb2.rvb02
   LET g_rvb[l_ac].rvb22  = g_rvb2.rvb22
   LET g_rvb[l_ac].rvb04  = g_rvb2.rvb04
   LET g_rvb[l_ac].rvb03  = g_rvb2.rvb03
   LET g_rvb[l_ac].rvb34  = g_rvb2.rvb34
   LET g_rvb[l_ac].rvb05  = g_rvb2.rvb05
   LET g_rvb[l_ac].rvb30  = g_rvb2.rvb30
   LET g_rvb[l_ac].rvb29  = g_rvb2.rvb29
   LET g_rvb[l_ac].rvb35  = g_rvb2.rvb35
   LET g_rvb[l_ac].rvb07  = g_rvb2.rvb07
   LET g_rvb[l_ac].rvb83  = g_rvb2.rvb83
   LET g_rvb[l_ac].rvb84  = g_rvb2.rvb84
   LET g_rvb[l_ac].rvb85  = g_rvb2.rvb85
   LET g_rvb[l_ac].rvb80  = g_rvb2.rvb80
   LET g_rvb[l_ac].rvb81  = g_rvb2.rvb81
   LET g_rvb[l_ac].rvb82  = g_rvb2.rvb82
   LET g_rvb[l_ac].rvb86  = g_rvb2.rvb86
   LET g_rvb[l_ac].rvb87  = g_rvb2.rvb87
   LET g_rvb[l_ac].rvb10  = g_rvb2.rvb10
   LET g_rvb[l_ac].rvb10t = g_rvb2.rvb10t
   LET g_rvb[l_ac].rvb36  = g_rvb2.rvb36
   LET g_rvb[l_ac].rvb37  = g_rvb2.rvb37
   LET g_rvb[l_ac].rvb38  = g_rvb2.rvb38
   LET g_rvb[l_ac].rvb25  = g_rvb2.rvb25
   LET g_rvb[l_ac].rvb930 = g_rvb2.rvb930
END FUNCTION

FUNCTION t110_b_move_back()
   LET g_rvb2.rvb01  = g_rva.rva01
   LET g_rvb2.rvb02  = g_rvb[l_ac].rvb02
   LET g_rvb2.rvb22  = g_rvb[l_ac].rvb22
   LET g_rvb2.rvb04  = g_rvb[l_ac].rvb04
   LET g_rvb2.rvb03  = g_rvb[l_ac].rvb03
   LET g_rvb2.rvb34  = g_rvb[l_ac].rvb34
   LET g_rvb2.rvb05  = g_rvb[l_ac].rvb05
   LET g_rvb2.rvb30  = g_rvb[l_ac].rvb30
   LET g_rvb2.rvb29  = g_rvb[l_ac].rvb29
   LET g_rvb2.rvb35  = g_rvb[l_ac].rvb35
   LET g_rvb2.rvb07  = g_rvb[l_ac].rvb07
   LET g_rvb2.rvb83  = g_rvb[l_ac].rvb83
   LET g_rvb2.rvb84  = g_rvb[l_ac].rvb84
   LET g_rvb2.rvb85  = g_rvb[l_ac].rvb85
   LET g_rvb2.rvb80  = g_rvb[l_ac].rvb80
   LET g_rvb2.rvb81  = g_rvb[l_ac].rvb81
   LET g_rvb2.rvb82  = g_rvb[l_ac].rvb82
   LET g_rvb2.rvb86  = g_rvb[l_ac].rvb86
   LET g_rvb2.rvb87  = g_rvb[l_ac].rvb87
   LET g_rvb2.rvb10  = g_rvb[l_ac].rvb10
   LET g_rvb2.rvb10t = g_rvb[l_ac].rvb10t
   LET g_rvb2.rvb36  = g_rvb[l_ac].rvb36
   LET g_rvb2.rvb37  = g_rvb[l_ac].rvb37
   LET g_rvb2.rvb38  = g_rvb[l_ac].rvb38
   LET g_rvb2.rvb25  = g_rvb[l_ac].rvb25
   LET g_rvb2.rvb930 = g_rvb[l_ac].rvb930
   IF cl_null(g_rvb2.rvb06) THEN LET g_rvb2.rvb06=0 END IF #CHI-7B0023
   IF cl_null(g_rvb2.rvb07) THEN LET g_rvb2.rvb07=0 END IF #CHI-7B0023
   IF cl_null(g_rvb2.rvb08) THEN LET g_rvb2.rvb08=0 END IF #CHI-7B0023
   IF cl_null(g_rvb2.rvb09) THEN LET g_rvb2.rvb09=0 END IF #CHI-7B0023
   IF cl_null(g_rvb2.rvb10) THEN LET g_rvb2.rvb10=0 END IF #CHI-7B0023
   IF cl_null(g_rvb2.rvb29) THEN LET g_rvb2.rvb29=0 END IF #CHI-7B0023
   IF cl_null(g_rvb2.rvb30) THEN LET g_rvb2.rvb30=0 END IF #CHI-7B0023
   IF cl_null(g_rvb2.rvb31) THEN LET g_rvb2.rvb31=0 END IF #CHI-7B0023
END FUNCTION
#FUN-730068............end
#MOD-770082-begin-add
#確認是否為製程委外工單
FUNCTION t110_ec_sw()
DEFINE     l_flag       LIKE type_file.chr1,
           x_sfb24        LIKE sfb_file.sfb24
 LET l_flag = 'N'
 IF g_argv2_2 ='SUB' THEN
    LET x_sfb24=''
    SELECT sfb24 INTO x_sfb24
      FROM sfb_file
     WHERE sfb01 = g_rvb[l_ac].rvb34
    IF x_sfb24 IS NOT NULL AND x_sfb24='Y' THEN
       LET l_flag='Y'
    END IF
 END IF
   RETURN l_flag
END FUNCTION
#MOD-770082-end-add
#Patch....NO:MOD-5A0095 <003,001,002> #
#Patch....NO:TQC-610036 <001> #

#---------by lily add 20141013 start ---------------------
FUNCTION t110_list_fill()
  DEFINE l_rva01         LIKE rva_file.rva01
  DEFINE l_rowid         LIKE type_file.chr18
  DEFINE l_i             LIKE type_file.num10

    CALL g_rva_l.clear()
    LET l_i = 1
    FOREACH t110_fill_cs INTO l_rowid,l_rva01
       IF SQLCA.sqlcode THEN
          CALL cl_err('foreach item_cur',SQLCA.sqlcode,1)
          CONTINUE FOREACH
       END IF
       SELECT rva01,rva06,rva02,rva05,pmc03,rva04,rva21,rva08,
              rva09,rva10,rvaconf,rvacond,rvaconu,'',rva29,
              rva33,'',rvamksg,rva32
         INTO g_rva_l[l_i].*
         FROM rva_file
              LEFT OUTER JOIN pmc_file ON rva05 = pmc01
        WHERE rva01=l_rva01
       SELECT gen02 INTO  g_rva_l[l_i].rvaconu_desc
         FROM gen_file
        WHERE gen01 = g_rva_l[l_i].rvaconu
       SELECT gen02 INTO  g_rva_l[l_i].gen02
         FROM gen_file
        WHERE gen01 = g_rva_l[l_i].rva33
       LET l_i = l_i + 1
       IF l_i > g_max_rec THEN
          IF g_action_choice ="query"  THEN
            CALL cl_err( '', 9035, 0 )
          END IF
          EXIT FOREACH
       END IF
    END FOREACH
    LET g_rec_b4 = l_i - 1
    DISPLAY ARRAY g_rva_l TO s_rva_l.* ATTRIBUTE(COUNT=g_rec_b4,UNBUFFERED)
       BEFORE DISPLAY
          EXIT DISPLAY
    END DISPLAY

END FUNCTION

FUNCTION t110_bp2(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1

   IF p_ud <> "G" THEN
      RETURN
   END IF

   LET g_action_choice = " "

   IF g_aza.aza64 matches '[ Nn]' OR g_aza.aza64 IS NULL THEN
      CALL cl_set_act_visible("trans_spc",FALSE)
      CALL cl_set_comp_visible("rvaspc",FALSE)
   END IF
   CALL cl_set_act_visible("accept,cancel", FALSE)

   DISPLAY ARRAY g_rva_l TO s_rva_l.* ATTRIBUTE(COUNT=g_rec_b4,UNBUFFERED)
      BEFORE DISPLAY
          CALL fgl_set_arr_curr(g_curs_index)
          CALL cl_navigator_setting( g_curs_index, g_row_count )
       BEFORE ROW
          LET l_ac4 = ARR_CURR()
          LET g_curs_index = l_ac4
          CALL cl_show_fld_cont()

      ON ACTION page_main
         LET g_action_flag = "page_main"
         LET l_ac4 = ARR_CURR()
         LET g_jump = l_ac4
         LET mi_no_ask = TRUE
         IF g_rec_b4 > 0 THEN
             CALL t110_fetch('/')
         END IF
         CALL cl_set_comp_visible("page_list", FALSE)
         CALL cl_set_comp_visible("info,userdefined_field", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page_list", TRUE)
        #MOD-D30148 add start -----
         CALL cl_set_comp_visible("info,userdefined_field", TRUE)
        #MOD-D30148 add end   -----
         EXIT DISPLAY

      ON ACTION ACCEPT
         LET g_action_flag = "page_main"
         LET l_ac4 = ARR_CURR()
         LET g_jump = l_ac4
         LET mi_no_ask = TRUE
         CALL t110_fetch('/')
         CALL cl_set_comp_visible("info,userdefined_field", FALSE)
        #MOD-D30148 add start -----
         CALL cl_set_comp_visible("info,userdefined_field", TRUE)
        #MOD-D30148 add end   -----
         CALL cl_set_comp_visible("page_list", FALSE)
         CALL ui.interface.refresh()
         CALL cl_set_comp_visible("page_list", TRUE)
         EXIT DISPLAY


      ON ACTION insert
         LET g_action_choice="insert"
         EXIT DISPLAY
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY
      ON ACTION delete
         LET g_action_choice="delete"
         EXIT DISPLAY
      ON ACTION modify
         LET g_action_choice="modify"
         EXIT DISPLAY
      ON ACTION first
         CALL t110_fetch('F')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
         IF g_rec_b != 0 THEN
            CALL fgl_set_arr_curr(g_curs_index)
         END IF
         ACCEPT DISPLAY

      ON ACTION previous
         CALL t110_fetch('P')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(g_curs_index)
           END IF
        ACCEPT DISPLAY


      ON ACTION jump
         CALL t110_fetch('/')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(g_curs_index)
           END IF
        ACCEPT DISPLAY


      ON ACTION next
         CALL t110_fetch('N')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
            IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(g_curs_index)
           END IF
        ACCEPT DISPLAY


      ON ACTION last
         CALL t110_fetch('L')
         CALL cl_navigator_setting(g_curs_index, g_row_count)
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(g_curs_index)
           END IF
        ACCEPT DISPLAY

#TQC-D10084---mark---str----
#     ON ACTION detail
#        LET g_action_choice="detail"
#        LET l_ac = 1
#        EXIT DISPLAY
#TQC-D10084---mark---end----
      ON ACTION output
         LET g_action_choice="output"
         EXIT DISPLAY
      ON ACTION help
         LET g_action_choice="help"
         EXIT DISPLAY

      ON ACTION qc
         LET g_action_choice="qc"
         EXIT DISPLAY

      ON ACTION qry_qc #查詢QC單
         LET g_action_choice="qry_qc"
         EXIT DISPLAY

      ON ACTION locale
         CALL cl_dynamic_locale()
         CALL cl_show_fld_cont()
         CALL t110_mu_ui()
         IF g_aza.aza71 MATCHES '[Yy]' THEN
            CALL aws_gpmcli_toolbar()
            CALL cl_set_act_visible("gpm_show,gpm_query", TRUE)
         ELSE
            CALL cl_set_act_visible("gpm_show,gpm_query", FALSE)
         END IF


      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY

#@    ON ACTION 補登發票
      ON ACTION add_invoice
         LET g_action_choice="add_invoice"
         EXIT DISPLAY
#@    ON ACTION 作廢
      ON ACTION void
         LET g_action_choice="void"
         EXIT DISPLAY
#FUN-D20025 add
#@    ON ACTION 取消作廢
      ON ACTION undo_void
         LET g_action_choice="undo_void"
         EXIT DISPLAY
#FUN-D20025 add
#@    ON ACTION 確認
      ON ACTION confirm
         LET g_action_choice="confirm"
         EXIT DISPLAY
#@    ON ACTION 取消確認
      ON ACTION undo_confirm
         LET g_action_choice="undo_confirm"
         EXIT DISPLAY
#@    ON ACTION 檢驗狀況
      ON ACTION qc_status
         LET g_action_choice="qc_status"
         EXIT DISPLAY

##FUN-BC0104 ------add----str---------------
##@    ON ACTION QC料件判定產生入庫單
#      ON ACTION qc_item_tran_store
#         LET g_action_choice="qc_item_tran_store"
#         EXIT DISPLAY
##FUN-BC0104 ------add----end---------------

#@    ON ACTION 產生入庫/驗退
      ON ACTION generate_st_in_qc_return
         IF t110_qc_ck() THEN
            LET g_action_choice="qc_item_tran_store"
         ELSE
            LET g_action_choice="generate_st_in_qc_return"
         END IF
         EXIT DISPLAY
#@    ON ACTION 查詢入庫
      ON ACTION qry_st_in
         LET g_action_choice="qry_st_in"
         EXIT DISPLAY
#@    ON ACTION 查詢驗退
      ON ACTION qry_qc_return
         LET g_action_choice="qry_qc_return"
         EXIT DISPLAY
#@    ON ACTION 驗收狀況
      ON ACTION receiving
         LET g_action_choice="receiving"
         EXIT DISPLAY

    #FUN-9C0076 add str ---
    #@ON ACTION 簽核狀況
      ON ACTION approval_status
         LET g_action_choice="approval_status"
         EXIT DISPLAY

    #@ON ACTION easyflow送簽
      ON ACTION easyflow_approval
         LET g_action_choice = "easyflow_approval"
         EXIT DISPLAY
    #FUN-9C0076 add end ---


#@    ON ACTION 拋轉至SPC
      ON ACTION trans_spc
         LET g_action_choice="trans_spc"
         EXIT DISPLAY

      ON ACTION cancel
             LET INT_FLAG=FALSE
         LET g_action_choice="exit"
         EXIT DISPLAY

      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY

      ON ACTION about
         CALL cl_about()


      ON ACTION exporttoexcel
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY

      ON ACTION e_proc_require
         LET g_action_choice = 'e_proc_require'
         EXIT DISPLAY

      ON ACTION agree
         LET g_action_choice = 'agree'
         EXIT DISPLAY

      ON ACTION deny
         LET g_action_choice = 'deny'
         EXIT DISPLAY

      ON ACTION modify_flow
         LET g_action_choice = 'modify_flow'
         EXIT DISPLAY

      ON ACTION withdraw
         LET g_action_choice = 'withdraw'
         EXIT DISPLAY

      ON ACTION org_withdraw
         LET g_action_choice = 'org_withdraw'
         EXIT DISPLAY

      ON ACTION phrase
         LET g_action_choice = 'phrase'
         EXIT DISPLAY

      ON ACTION controls
         CALL cl_set_head_visible("","AUTO")

      ON ACTION related_document              #  相關文件
         LET g_action_choice="related_document"
         EXIT DISPLAY

      ON ACTION gpm_show
         LET g_action_choice="gpm_show"
         EXIT DISPLAY

      ON ACTION gpm_query
         LET g_action_choice="gpm_query"
         EXIT DISPLAY

      ON ACTION qry_lot
         LET g_action_choice="qry_lot"
         EXIT DISPLAY

      #DEV-D30045--add--begin
      ON ACTION barcode_gen
         LET g_action_choice="barcode_gen"
         EXIT DISPLAY

      ON ACTION barcode_query
         LET g_action_choice="barcode_query"
         EXIT DISPLAY

      ON ACTION barcode_output
         LET g_action_choice="barcode_output"
         EXIT DISPLAY
      #DEV-D30045--add--end

      &include "qry_string.4gl"
   END DISPLAY

   CALL cl_set_act_visible("accept,cancel", TRUE)

END FUNCTION


FUNCTION t110_qc_ck()
   DEFINE l_cnt LIKE type_file.num5

   IF g_qcz.qcz14 = 'Y' THEN
     #MOD-D20137 add start -----
      SELECT COUNT(*) INTO l_cnt
        FROM rvb_file
       WHERE rvb01 = g_rva.rva01
         AND rvb39 = 'Y'
         AND (rvb40 IS NULL OR rvb40 = '')
      IF l_cnt = 0 THEN
         RETURN FALSE
      ELSE
     #MOD-D20137 add end   -----
         RETURN TRUE
      END IF #MOD-D20137 add
   ELSE
      IF cl_null(g_rva.rva01) THEN
         CALL cl_err('','aqc-334',1)
         RETURN
      END IF

      SELECT COUNT(*) INTO l_cnt FROM qco_file WHERE qco01 = g_rva.rva01

      IF l_cnt = 0 THEN
         RETURN FALSE
      ELSE
         RETURN TRUE
      END IF

   END IF
END FUNCTION
#---------------by lily end---------------
#by stevie ---start---141210
FUNCTION t110_coz01()
 DEFINE l_count LIKE type_file.num5
 SELECT coz01 INTO g_coz01 FROM coz_file
 IF g_coz01 = "Y" THEN
  SELECT count(*) INTO l_count FROM tc_pop_file WHERE tc_pop01 = 'cpmt200' AND tc_pop02 = g_plant
  IF l_count = 0 THEN
    LET g_coz01 = "N"
  END IF
 END IF

 IF g_coz01 = "Y" THEN
    CALL cl_set_comp_visible("ta_rva19",TRUE)
 ELSE
    CALL cl_set_comp_visible("ta_rva19",FALSE)
 END IF
END FUNCTION
#by stevie ---end---
