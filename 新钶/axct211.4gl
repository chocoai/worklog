# Prog. Version..: '5.30.27-19.04.12(00010)'     #
#
# Pattern name...: axct211.4gl
# Descriptions...: 人工/製費收集
# Date & Author..: 01/08/31 By Payton
# Modify.........: 02/01/15 By faith add 總帳所在工廠
# Modify.........: No.8726 03/11/27 By Apple axct211_w WHEN '3' #預算本期單價 程式中無處理拿掉
# Modify.........: 04/07/19 By Wiky Bugno.MOD-470041 修改INSERT INTO...
# Modify.........: No.FUN-4B0015 04/11/09 By Pengu 新增Array轉Excel檔功能
# Modify.........: No.FUN-4C0005 04/12/02 By Carol 單價/金額欄位放大(20),位數改為dec(20,6)
# Modify.........: No.FUN-550025 05/05/16 By vivien 單據編號格式放大
# Modify.........: No.FUN-590106 05/09/27 By Sarah 替換inb902-->inb908,inb903-->inb909,inb904-->inb910
# Modify.........: No.FUN-5A0043 05/10/13 By day  調整報表位置
# Modify.........: No.MOD-5A0178 05/10/18 By Sarah t211_w()段忘記寫FINISH REPORT t211_w_rep
# Modify.........: No.MOD-620006 06/02/08 By Claire 會科為EXP,MISC部門給空白值
# Modify.........: No.MOD-610146 06/02/20 By Kevin 將變數歸零
# Modify.........: No.MOD-650015 06/05/05 By rainy 取消輸入時的"預設上筆"功能monster代
# Modify.........: No.TQC-650043 06/05/12 By CoCo cl_outnam需在assign g_len之前
# Modify.........: No.FUN-660127 06/06/23 By Czl cl_err --> cl_err3
# Modify.........: No.FUN-670067 06/07/21 By Johnray voucher型報表轉template1
# Modify.........: No.MOD-680018 06/08/04 By Carol fetch()-- FETCH ABSOLUT xxxx變數修正
# Modify.........: No.FUN-640096 06/08/29 By Sarah 單身部門欄位應判斷agli102此會科是否做部門管理決定是否要輸入部門
# Modify.........: No.FUN-680122 06/09/05 By zdyllq 類型轉換
# Modify.........: No.FUN-6A0019 06/10/25 By jamie 1.FUNCTION _q() 一開始應清空key值
#                                                  2.新增action"相關文件"
# Modify.........: No.FUN-6A0146 06/10/27 By bnlent l_time轉g_time
# Modify.........: No.FUN-6A0092 06/11/10 By Jackho 新增動態切換單頭隱藏的功能
# Modify.........: No.MOD-6B0015 06/12/08 By Claire 調整報表 
# Modify.........: No.FUN-710027 07/02/01 By hongmei 錯誤訊息匯總顯示修改
# Modify.........: No.TQC-720019 07/03/01 By carrier 連續刪除2筆翻頁不正確
# Modify.........: No.TQC-6B0105 07/03/07 By carrier 連續兩次查詢,第二次查不到資料,做修改等操作會將當前筆停在上次查詢到的資料上
# Modify.........: No.FUN-730057 07/03/27 By hongmei 會計科目加帳套
# Modify.........: No.MOD-710128 07/04/09 By pengu 擷取當期費用成本, 應包含 tlf13 in(aimt303, aimt313)
# Modify.........: No.TQC-740340 07/04/29 By mike 調整打印格式
# Modify.........: No.FUN-750051 07/05/22 By johnray 連續二次查詢key值時,若第二次查詢不到key值時,會顯示錯誤key值
# Modify.........: No.FUN-7C0101 08/01/10 By ChenMoyan 新增cmi04
# Modify.........: No.FUN-7C0050 08/01/15 By johnray 串查程序代碼添加共用 ACTION 的引用
# Modify.........: No.FUN-840047 08/05/08 By sherry 報表改由CR輸出  
# Modify.........: NO.MOD-860078 08/06/06 BY Yiting ON IDLE 處理
# Modify.........: No.MOD-910177 09/01/15 By Pengu 點選"擷取當期費用成本"程式會當掉,點都點不掉
# Modify.........: No.FUN-920010 09/02/05 By jan 新增'依分攤設置產生人工制費'action
# Modify.........: No.CHI-920036 09/03/04 By jan 點選"擷取當期費用成本",無產生資料在cmi08當期異動金額
# Modify.........: No.TQC-940184 09/05/13 By mike 跨庫的SQL語句一律使用s_dbstring()的寫法 
# Modify.........: No.MOD-940048 09/05/20 By Pengu 擷取當期費用時，單價未依據UI畫面設定取哪一期單價
# Modify.........: No.MOD-940076 09/05/20 By Pengu 抓取已確認傳票資料，應調整為已確認且[過帳]之傳票資料
# Modify.........: No.MOD-940148 09/05/20 By Pengu 抓取傳票金額時應是cay06(會科)抓取而不是cay10
# Modify.........: No.CHI-930046 09/05/20 By Pengu 若有多筆雜發單時費用無法累加
# Modify.........: No.MOD-940345 09/05/20 By Pengu 執行依分攤設置產生人工製費時應先刪除在做insert
# Modify.........: No.MOD-940353 09/05/20 By Pengu 擷取當期費用產生單身後,按單身會把部門清空
# Modify.........: No.MOD-950078 09/05/20 By Pengu 執行"一分攤設置產生人工製費時須先刪除該月份的cmi_file
# Modify.........: No.MOD-950204 09/05/20 By Pengu 調整l_tot變數的資料型態
# Modify.........: No.CHI-950030 09/06/16 By kim 當多部門時,金額乘上分攤系數會造成尾差
# Modify.........: No.TQC-970033 09/07/02 by hongmei UPDATE時,如為數值欄位,資料不能給''(空字串)需給0
# Modify.........: No.TQC-970398 09/08/07 By liuxqa 修改SQL語法錯誤。
# Modify.........: No.TQC-970203 09/07/24 By dxfwo 列印：無效的物件名稱 'cmi_file' (top 30也有錯誤)
# Modify.........: No.FUN-980030 09/08/31 By Hiko 加上GP5.2的相關設定
# Mofify.........: No.FUN-980020 09/09/03 By douzh 集團架構調整
# Modify.........: No.TQC-990027 09/09/08 By sherry 單身“當期異動金額”欄位對負數資料沒有控管   
# Modify.........: No:MOD-9A0008 09/10/27 By sabrina  再調整尾差時會造成金額異常
# Modify.........: No:MOD-9A0121 09/10/27 By sabrina  再調整尾差時會造成金額異常
# Modify.........: No.FUN-990068 09/09/23 By Carrier 单身部门字段默认单头的成本中心
# Modify.........: No.TQC-990029 09/11/09 By Carrier 成本中心字段规格化
# Modify.........: No.FUN-9B0118 09/11/27 By Carrier add cmi00字段
# Modify.........: No.FUN-9C0118 09/12/21 By Carrier 去掉和axci041相关的action menu
# Modify.........: No.FUN-9C0112 09/12/22 By Carrier cay05比率变权数,相关计算逻辑更新
# Modify.........: No:MOD-9C0025 09/12/25 By Pengu 在輸入期別時，若小於axcs010設定的期別應回到期別欄位
# Modify.........: No.FUN-9C0073 10/01/13 By chenls 程序精簡
# Modify.........: No.FUN-9B0098 10/02/24 by tommas delete cl_doc
# Modify.........: No.FUN-A50075 10/05/24 By lutingting GP5.2 AXC模组table重新分类
# Modify.........: No.FUN-A50102 10/06/11 By lixia 跨庫寫法統一改為用cl_get_target_table()來實現
# Modify.........: No.FUN-AA0025 10/11/03 By elva 语法修正
# Modify.........: No:MOD-AC0138 10/12/25 By sabrina (1)產生的EXP金額不正確
# Modify.........: No:MOD-B10066 11/01/10 By sabrina 當cmi05='EXP'時，cmi08要可輸入負數
# Modify.........: No:FUN-B10052 11/01/27 By lilingyu 科目查詢自動過濾
# Modify.........: No.FUN-B50064 11/06/03 By xianghui BUG修改，刪除時提取資料報400錯誤
# Modify.........: No.MOD-B80095 11/08/09 By johung 會計科目查詢可查到獨立科目aag07=3及明細科目aag07=2
# Modify.........: No.MOD-C30598 12/03/21 By tanxc cmiori要改為cmiorig
# Modify.........: No.MOD-C40097 12/04/13 By yinhy 當月某類型下的科目金額為0，就不產生到cmi_file
# Modify.........: No:FUN-C80046 12/08/14 By bart 複製後停在新料號畫面
# Modify.........: No.CHI-CA0076 12/11/30 By Elise 若修改資料,show警告執行axcp306產生新的axct311
# Modify.........: No.FUN-C80092 12/12/05 By fengrui 增加寫入日誌功能
# Modify.........: No.MOD-D20129 13/02/22 By wujie 没有考虑尾差处理
# Modify.........: No.MOD-D20052 13/02/25 By yinhy 增加默認值
# Modify.........: No.MOD-D30094 13/03/11 By wujie 抓取aeh时，应该抓余额，而不是当月发生额
# Modify.........: No.MOD-D30157 13/03/15 By wujie 接上一修改，改为大陆版且是制费时才取余额
# Modify.........: No:FUN-D40030 13/04/09 by lixiang 修正單身新增時按下放棄鍵未執行AFTER INSERT的問題											
# Modify.........: No.TQC-D40043 13/04/18 By bart 取消FUN-9C0118的修改，回復t211_s()功能
# Modify.........: No.MOD-D50170 13/05/21 By wujie 查询时增加cmi05，cmi06的开窗
# Modify.........: No.FUN-D80058 13/08/16 By lujh 將制費分攤按核算項進行結轉
# Modify.........: No.MOD-DB0069 13/11/11 By bart 移除t211_s3的cda01欄位抓取
# Modify.........: No.MOD-DB0167 13/11/26 By suncx DELETE時，判斷axcq310是否已拋轉憑證
# Modify.........: No.MOD-E30074 14/03/13 By Alberti 將l_tot,l_tot1,l_tot2，塞值之前先清空，以防重複塞入
# Modify.........: No.MOD-E40165 14/04/29 By Alberti sql的欄位寫錯(ahe37->aeh37)，導致無法撈到資料
# Modify.........: No.MOD-E80049 14/08/11 By Alberti 還原FUN-D80058所修改的部分，因此張單作法有誤,一併Mark MOD-E30074 
# Modify.........: No.FUN-E90020 14/09/09 By Alberti 以核算項餘額結轉
# Modify.........: No.MOD-EB0023 14/11/05 By Alberti 修正FUN-E90020之BUG
# Modify.........: No.MOD-EB0027 14/11/06 By Alberti 修正 1.依分攤設置產生功能(axci041)產生金額，貸方的錢沒有產生出來
#                                                        2.如果是只有貸方的金額，卻沒有借方，會造成金額錯誤
# Modify.........: No.MOD-EC0039 14/12/05 By Alberti 修正 依分攤設置產生功能(axci041)產生金額有誤
# Modify.........: No.FUN-E40053 15/04/16 By Alberti 依人工製費分攤權數，不看國別，產生畫面新開欄位，選擇是否要納入上期金額
# Modify.........: No.MOD-G80028 16/08/08 By catmoon 接續處理MOD-EB0023修正FUN-E90020之BUG

DATABASE ds
 
GLOBALS "../../config/top.global"
 
#模組變數(Module Variables)
DEFINE
    g_cmi_o         RECORD LIKE cmi_file.*,       #細部品名碼 (舊值)
    g_cmia          RECORD LIKE cmi_file.*,       #細部品名碼 (舊值)
    g_cmia_t        RECORD LIKE cmi_file.*,       #細部品名碼 (舊值)
    g_cmi01         LIKE cmi_file.cmi01,
    g_cmi01_t       LIKE cmi_file.cmi01,   #細部品名碼 (舊值)
    g_cmi00         LIKE cmi_file.cmi00,          #No.FUN-9B0118
    g_cmi00_t       LIKE cmi_file.cmi00,          #No.FUN-9B0118
    g_cmi12         LIKE cmi_file.cmi12,          #No.FUN-9B0118
    g_cmi12_t       LIKE cmi_file.cmi12,          #No.FUN-9B0118
    g_cmi02         LIKE cmi_file.cmi02,
    g_cmi03         LIKE cmi_file.cmi03,
    g_cmi04         LIKE cmi_file.cmi04,
    g_cmi02_t       LIKE cmi_file.cmi02,
    g_cmi03_t       LIKE cmi_file.cmi03,
    g_cmi04_t       LIKE cmi_file.cmi04,
    g_cmi08_tot     LIKE cmi_file.cmi08,
    g_cmi           DYNAMIC ARRAY OF RECORD    #程式變數(Program Variables)
        cmi05       LIKE cmi_file.cmi05,   #科目編號
        cmi06       LIKE cmi_file.cmi06,   #部門
        cmi07       LIKE cmi_file.cmi07,   #名稱/說明
        cmi08       LIKE cmi_file.cmi08    #當期異動金額
       #MOD-E80049-Start-Mark 
       ##FUN-D80058--add--str--
       #cmi35       LIKE cmi_file.cmi35,
       #cmi13       LIKE cmi_file.cmi13,   
       #cmi14       LIKE cmi_file.cmi14,
       #cmi15       LIKE cmi_file.cmi15,
       #cmi16       LIKE cmi_file.cmi16,
       #cmi17       LIKE cmi_file.cmi17,
       #cmi18       LIKE cmi_file.cmi18,
       #cmi19       LIKE cmi_file.cmi19,
       #cmi20       LIKE cmi_file.cmi20,
       #cmi21       LIKE cmi_file.cmi21,
       #cmi22       LIKE cmi_file.cmi22,
       #cmi23       LIKE cmi_file.cmi23,
       #cmi24       LIKE cmi_file.cmi24,
       #cmi25       LIKE cmi_file.cmi25,
       #cmi26       LIKE cmi_file.cmi26,
       #cmi27       LIKE cmi_file.cmi27,
       #cmi28       LIKE cmi_file.cmi28,
       #cmi29       LIKE cmi_file.cmi29,
       #cmi30       LIKE cmi_file.cmi30,
       #cmi31       LIKE cmi_file.cmi31,
       #cmi32       LIKE cmi_file.cmi32,
       #cmi33       LIKE cmi_file.cmi33,
       #cmi34       LIKE cmi_file.cmi34
       ##FUN-D80058--add--end--
       #MOD-E80049-End-Mark 
                    END RECORD,
    g_cmi_t         RECORD                 #程式變數 (舊值)
        cmi05       LIKE cmi_file.cmi05,   #科目編號
        cmi06       LIKE cmi_file.cmi06,   #部門
        cmi07       LIKE cmi_file.cmi07,   #名稱/說明
        cmi08       LIKE cmi_file.cmi08    #當期異動金額
       #MOD-E80049-Start-Mark 
       ##FUN-D80058--add--str--
       #cmi35       LIKE cmi_file.cmi35,
       #cmi13       LIKE cmi_file.cmi13,
       #cmi14       LIKE cmi_file.cmi14,
       #cmi15       LIKE cmi_file.cmi15,
       #cmi16       LIKE cmi_file.cmi16,
       #cmi17       LIKE cmi_file.cmi17,
       #cmi18       LIKE cmi_file.cmi18,
       #cmi19       LIKE cmi_file.cmi19,
       #cmi20       LIKE cmi_file.cmi20,
       #cmi21       LIKE cmi_file.cmi21,
       #cmi22       LIKE cmi_file.cmi22,
       #cmi23       LIKE cmi_file.cmi23,
       #cmi24       LIKE cmi_file.cmi24,
       #cmi25       LIKE cmi_file.cmi25,
       #cmi26       LIKE cmi_file.cmi26,
       #cmi27       LIKE cmi_file.cmi27,
       #cmi28       LIKE cmi_file.cmi28,
       #cmi29       LIKE cmi_file.cmi29,
       #cmi30       LIKE cmi_file.cmi30,
       #cmi31       LIKE cmi_file.cmi31,
       #cmi32       LIKE cmi_file.cmi32,
       #cmi33       LIKE cmi_file.cmi33,
       #cmi34       LIKE cmi_file.cmi34
       ##FUN-D80058--add--end--
       #MOD-E80049-End-Mark 
                    END RECORD,
     g_wc,g_wc2,g_sql    string,  #No.FUN-580092 HCN
    g_rec_b         LIKE type_file.num5,           #No.FUN-680122 SMALLINT             #單身筆數
    l_ac            LIKE type_file.num5,           #No.FUN-680122 SMALLINT             #目前處理的ARRAY CNT
    g_y             LIKE type_file.num5,           #No.FUN-680122 SMALLINT
    g_m             LIKE type_file.num5,           #No.FUN-680122 SMALLINT
    l_ccz12         LIKE ccz_file.ccz12,
    l_aag02         LIKE aag_file.aag02,
    l_aag05         LIKE aag_file.aag05,
    l_aag06         LIKE aag_file.aag06,
    l_aag07         LIKE aag_file.aag07,
    l_aaz72         LIKE aaz_file.aaz72,
    l_aao01         LIKE aao_file.aao01,
    l_aao02         LIKE aao_file.aao02,
    l_aao05         LIKE aao_file.aao05,
    l_aao06         LIKE aao_file.aao06,
   #MOD-E80049-Start-Mark 
   ##FUN-D80058--add--str--
   #m_aag05         LIKE aag_file.aag05,
   #m_aag06         LIKE aag_file.aag06,  #借餘或貸餘
   #m_aag15         LIKE aag_file.aag15,
   #m_aag16         LIKE aag_file.aag16,
   #m_aag17         LIKE aag_file.aag17,
   #m_aag18         LIKE aag_file.aag18,
   #m_aag151        LIKE aag_file.aag151,
   #m_aag161        LIKE aag_file.aag161,
   #m_aag171        LIKE aag_file.aag171,
   #m_aag181        LIKE aag_file.aag181,
 
   #m_aag31         LIKE aag_file.aag31,
   #m_aag32         LIKE aag_file.aag32,
   #m_aag33         LIKE aag_file.aag33,
   #m_aag34         LIKE aag_file.aag34,
   #m_aag35         LIKE aag_file.aag35,
   #m_aag36         LIKE aag_file.aag36,
   #m_aag37         LIKE aag_file.aag37,
   #m_aag311        LIKE aag_file.aag311,
   #m_aag321        LIKE aag_file.aag321,
   #m_aag331        LIKE aag_file.aag331,
   #m_aag341        LIKE aag_file.aag341,
   #m_aag351        LIKE aag_file.aag351,
   #m_aag361        LIKE aag_file.aag361,
   #m_aag371        LIKE aag_file.aag371,
   #m_aag21         LIKE aag_file.aag21,
   #m_aag23         LIKE aag_file.aag23,
   #m_aag222        LIKE aag_file.aag222,
   #m_aag20         LIKE aag_file.aag20,
   #g_afb07         LIKE afb_file.afb07,
   ##FUN-D80058--add--end--
   #MOD-E80049-End-Mark 
    g_dash1_1       LIKE type_file.chr1000,        #No.FUN-680122CHAR(400)
    g_argv1         LIKE type_file.chr20           #No.FUN-680122 VARCHAR(10)
 
#主程式開始
DEFINE g_forupd_sql STRING   #SELECT ... FOR UPDATE SQL
DEFINE g_sql_tmp    STRING   #No.TQC-720019
DEFINE g_before_input_done LIKE type_file.num5           #No.FUN-680122 SMALLINT
DEFINE g_cnt           LIKE type_file.num10          #No.FUN-680122 INTEGER
DEFINE g_i             LIKE type_file.num5           #No.FUN-680122 SMALLINT  #count/index for any purpose
DEFINE g_msg           LIKE ze_file.ze03             #No.FUN-680122CHAR(72)
DEFINE g_row_count     LIKE type_file.num10          #No.FUN-680122 INTEGER
DEFINE g_curs_index    LIKE type_file.num10          #No.FUN-680122 INTEGER
DEFINE g_jump          LIKE type_file.num10          #No.FUN-680122 INTEGER
DEFINE mi_no_ask       LIKE type_file.num5           #No.FUN-680122 SMALLINT
DEFINE g_flag          LIKE type_file.chr1           #No.FUN-730057
DEFINE l_table         STRING                                                   
DEFINE l_table1        STRING                        #No.TQC-970203 
DEFINE g_str           STRING                                                   
DEFINE g_cka00         LIKE cka_file.cka00           #No.FUN-C80092
 
MAIN
DEFINE
    p_row,p_col   LIKE type_file.num5           #No.FUN-680122 SMALLINT
 
    OPTIONS                                #改變一些系統預設值
        INPUT NO WRAP
    DEFER INTERRUPT                        #擷取中斷鍵, 由程式處理
 
    IF (NOT cl_user()) THEN
       EXIT PROGRAM
    END IF
 
    WHENEVER ERROR CALL cl_err_msg_log
 
    IF (NOT cl_setup("AXC")) THEN
       EXIT PROGRAM
    END IF
 
      CALL  cl_used(g_prog,g_time,1)       #計算使用時間 (進入時間) #No.MOD-580088  HCN 20050818  #No.FUN-6A0146
         RETURNING g_time    #No.FUN-6A0146
 
    LET g_sql = "tlf01.tlf_file.tlf01,",                                        
                "tlf905.tlf_file.tlf905,",                                      
                "tlf906.tlf_file.tlf906,",                                      
                "tlf21.tlf_file.tlf21,",                                        
                "tlf19.tlf_file.tlf19"                                          
                                                                                
   LET l_table = cl_prt_temptable('axct2111',g_sql) CLIPPED                      
   IF l_table = -1 THEN EXIT PROGRAM END IF                                     
   LET g_sql = "INSERT INTO ",g_cr_db_str CLIPPED,l_table CLIPPED,              
               " VALUES(?,?,?,?,?)"                                             
   PREPARE insert_prep FROM g_sql                                               
   IF STATUS THEN                                                               
      CALL cl_err('insert_prep:',status,1) EXIT PROGRAM                         
   END IF                                                                       
 
    LET g_argv1 = ARG_VAL(1)
    LET g_cmi01= NULL
    LET g_cmi01_t= NULL
    LET p_row = 4 LET p_col = 15
    OPEN WINDOW t211_w AT p_row,p_col              #顯示畫面
      WITH FORM "axc/42f/axct211"
       ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
 
    CALL cl_ui_init()

   #MOD-E80049-Start-Mark  
   ##FUN-D80058--add--str--
   #IF g_aaz.aaz119 ='N' THEN 
   #   CALL cl_set_comp_visible("cmi14,cmi16,cmi18,cmi20,cmi22,cmi24,cmi26,cmi28,cmi30,cmi32,cmi34",FALSE)
   #ELSE
   #   CALL cl_set_comp_visible("cmi14,cmi16,cmi18,cmi20,cmi22,cmi24,cmi26,cmi28,cmi30,cmi32,cmi34",TRUE)   
   #END IF 
   ##FUN-D80058--add--end--
   #MOD-E80049-End-Mark
 
    IF NOT cl_null(g_argv1) THEN CALL t211_q() END IF
    CALL t211_menu()
    CLOSE WINDOW t211_w                 #結束畫面
      CALL  cl_used(g_prog,g_time,2)       #計算使用時間 (退出使間) #No.MOD-580088  HCN 20050818  #No.FUN-6A0146
         RETURNING g_time    #No.FUN-6A0146
END MAIN
 
FUNCTION t211_cs()
    DEFINE l_cmi01 LIKE cmi_file.cmi01
    DEFINE l_cmi02 LIKE cmi_file.cmi02
    DEFINE l_cmi03 LIKE cmi_file.cmi03
    DEFINE l_cmi04 LIKE cmi_file.cmi04
    IF cl_null(g_argv1) THEN
       CLEAR FORM                             #清除畫面
       CALL g_cmi.clear()
       CALL cl_set_head_visible("","YES")       #No.FUN-6A0092
 
   INITIALIZE g_cmi01 TO NULL    #No.FUN-750051
   INITIALIZE g_cmi02 TO NULL    #No.FUN-750051
   INITIALIZE g_cmi03 TO NULL    #No.FUN-750051
   INITIALIZE g_cmi04 TO NULL    #No.FUN-750051
   INITIALIZE g_cmi00 TO NULL    #No.FUN-9B0118
   INITIALIZE g_cmi12 TO NULL    #No.FUN-9B0118
       CONSTRUCT g_wc ON cmi04,cmi00,cmi01,cmi02,cmi03,cmi12,cmi05,cmi06,cmi07,cmi08   #No.FUN-9B0118
                        #MOD-E80049-Start-Mark
                        #cmi35,cmi13,cmi15,cmi17,cmi19,cmi21,cmi23,cmi25,cmi27,cmi29,  #FUN-D80058 add
                        #cmi31,cmi33                                                   #FUN-D80058 add
                        #MOD-E80049-End-Mark 
           FROM cmi04,cmi00,cmi01,cmi02,cmi03,cmi12,s_cmi[1].cmi05,s_cmi[1].cmi06,    #No.FUN-9B0118
                s_cmi[1].cmi07,s_cmi[1].cmi08
               #MOD-E80049-Start-Mark 
               ##FUN-D80058--add--str--
               #s_cmi[1].cmi35,s_cmi[1].cmi13,
               #s_cmi[1].cmi15,s_cmi[1].cmi17,
               #s_cmi[1].cmi19,s_cmi[1].cmi21,
               #s_cmi[1].cmi23,s_cmi[1].cmi25,
               #s_cmi[1].cmi27,s_cmi[1].cmi29,
               #s_cmi[1].cmi31,s_cmi[1].cmi33
               ##FUN-D80058--add--end--
               #MOD-E80049-End-Mark 
              BEFORE CONSTRUCT
                #MOD-E80049-Start-Mark
                ##FUN-D80058--add--str--
                #CALL cl_set_comp_visible("cmi13,cmi14,cmi15,cmi16,cmi17,cmi18",TRUE)
                #CALL cl_set_comp_visible("cmi19,cmi20,cmi21,cmi22,cmi23,cmi24",TRUE)
                #CALL cl_set_comp_visible("cmi25,cmi26,cmi27,cmi28,cmi29,cmi30",TRUE)
                #CALL cl_set_comp_visible("cmi31,cmi32,cmi33,cmi34",TRUE)
                ##FUN-D80058--add--end--
                #MOD-E80049-End-Mark 
                 CALL cl_qbe_init()
                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()
 
          ON ACTION controlp
             CASE
                WHEN INFIELD(cmi00)       #帐套
                     CALL cl_init_qry_var()
                     LET g_qryparam.form  = "q_aaa"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                 DISPLAY g_qryparam.multiret TO cmi00
#No.MOD-D50170 --begin
                WHEN INFIELD(cmi05) #科目
                     CALL cl_init_qry_var()
                     LET g_qryparam.form     ="q_aag"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO cmi05
                WHEN INFIELD(cmi06) #部門
                     CALL cl_init_qry_var()
                     LET g_qryparam.form     = "q_gem"
                     LET g_qryparam.state = "c"
                     CALL cl_create_qry() RETURNING g_qryparam.multiret
                     DISPLAY g_qryparam.multiret TO cmi06
               #MOD-E80049-Start-Mark      
               ##FUN-D80058--add--str--
               #WHEN INFIELD(cmi35)    #查詢專案編號
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.form ="q_pja"    
               #     LET g_qryparam.state = "c"
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #      DISPLAY g_qryparam.multiret TO cmi35
               #WHEN INFIELD(cmi13)    #查詢異動碼-1
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi13
               #     LET g_qryparam.arg2 = 1
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi13
               #WHEN INFIELD(cmi15)    #查詢異動碼-2
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi15
               #     LET g_qryparam.arg2 = 2
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi15
               #WHEN INFIELD(cmi17)    #查詢異動碼-3
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi15
               #     LET g_qryparam.arg2 = 3
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi15
               #WHEN INFIELD(cmi19)    #查詢異動碼-4
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi19
               #     LET g_qryparam.arg2 = 4
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi19
               #WHEN INFIELD(cmi21)    #查詢異動碼-5
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi21
               #     LET g_qryparam.arg2 = 5
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi21
               #WHEN INFIELD(cmi23)    #查詢異動碼-6
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi23
               #     LET g_qryparam.arg2 = 6
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi23
               #WHEN INFIELD(cmi25)    #查詢異動碼-7
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi25
               #     LET g_qryparam.arg2 = 7
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi25
               #WHEN INFIELD(cmi27)    #查詢異動碼-8
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi27
               #     LET g_qryparam.arg2 = 8
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi27
               #WHEN INFIELD(cmi29)    #查詢異動碼-9-WBS
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_pjb4"   
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi29
               #WHEN INFIELD(cmi31)    #查詢異動碼-10-預算項目
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_azf01a"                 
               #     LET g_qryparam.arg1 = '7'                    
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi31
               #WHEN INFIELD(cmi33)    #查詢關係人異動碼
               #     CALL cl_init_qry_var()
               #     LET g_qryparam.state = "c"
               #     LET g_qryparam.form ="q_aee"
               #     LET g_qryparam.arg1 = g_cmi[1].cmi33
               #     LET g_qryparam.arg2 = 99
               #     CALL cl_create_qry() RETURNING g_qryparam.multiret
               #     DISPLAY g_qryparam.multiret TO cmi33 
               ##FUN-D80058--add--end--
               #MOD-E80049-End-Mark
               
#No.MOD-D50170 --end
            OTHERWISE EXIT CASE
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
 
       END CONSTRUCT
       LET g_wc = g_wc CLIPPED,cl_get_extra_cond('cmiuser', 'cmigrup') #FUN-980030
 
 
       IF INT_FLAG THEN RETURN END IF
    ELSE
       LET g_wc=" cmi01='",g_argv1,"'"
    END IF
    LET g_sql= "SELECT UNIQUE cmi01,cmi02,cmi03,cmi04,cmi00 FROM cmi_file",  #No.FUN-9B0118
               " WHERE ", g_wc CLIPPED,
               " ORDER BY cmi04,cmi00,cmi01,cmi02,cmi03"                     #No.FUN-9B0118
    PREPARE t211_prepare FROM g_sql      #預備一下
    DECLARE t211_b_cs                  #宣告成可捲動的
        SCROLL CURSOR WITH HOLD FOR t211_prepare
    LET g_sql_tmp= "SELECT UNIQUE cmi01,cmi02,cmi03,cmi04,cmi00 FROM cmi_file",  #No.TQC-720019  #No.FUN-9B0118
               " WHERE ", g_wc CLIPPED,
               " INTO TEMP x"
    DROP TABLE x
    PREPARE t211_precount_x FROM g_sql_tmp  #No.TQC-720019
    EXECUTE t211_precount_x
 
    LET g_sql="SELECT COUNT(*) FROM x "
 
    PREPARE t211_precount FROM g_sql
    DECLARE t211_cnt   CURSOR FOR t211_precount
END FUNCTION
 
FUNCTION t211_menu()
 
   WHILE TRUE
      CALL t211_bp("G")
      CASE g_action_choice
         WHEN "insert"
            IF cl_chk_act_auth() THEN
               CALL t211_a()
            END IF
         WHEN "query"
            IF cl_chk_act_auth() THEN
               CALL t211_q()
            END IF
         WHEN "delete"
            IF cl_chk_act_auth() THEN
              CALL t211_r()
            END IF
         WHEN "reproduce"
            IF cl_chk_act_auth() THEN
               CALL t211_copy()
            END IF
         WHEN "detail"
            IF cl_chk_act_auth() THEN
               CALL t211_b()
            ELSE
               LET g_action_choice = NULL
            END IF
         WHEN "output"
            IF cl_chk_act_auth() THEN
               CALL t211_out()
            END IF
         WHEN "help"
            CALL cl_show_help()
         WHEN "exit"
            EXIT WHILE
         WHEN "controlg"
            CALL cl_cmdask()
         WHEN "generate"
            IF cl_chk_act_auth() THEN
               CALL t211_t()
            END IF
         WHEN "retrieve"
            IF cl_chk_act_auth() THEN
               CALL t211_g()
            END IF
         WHEN "access_current_period_overhe"
            IF cl_chk_act_auth() THEN
               CALL t211_w()
            END IF
        #TQC-D40043---BEGIN--
         WHEN "produce_manmade_cost"
           IF cl_chk_act_auth() THEN
             #CALL t211_s()  #FUN-E90020 mark
              CALL t211_s1() #FUN-E90020 add
           END IF
        #TQC-D40043---end--
         WHEN "by_setting"
           IF cl_chk_act_auth() THEN
             #CALL t211_aeh()    #FUN-E90020 mark
              CALL t211_aeh1()   #FUN-E90020 add
           END IF
         WHEN "exporttoexcel" #FUN-4B0015
            CALL cl_export_to_excel(ui.Interface.getRootNode(),base.TypeInfo.create(g_cmi),'','')
         WHEN "related_document"           #相關文件
          IF cl_chk_act_auth() THEN
             IF g_cmi01 IS NOT NULL THEN
                LET g_doc.column1 = "cmi01"
                LET g_doc.column2 = "cmi02"
                LET g_doc.column3 = "cmi03"
                LET g_doc.column4 = "cmi04" 
                LET g_doc.column5 = "cmi00"    #No.FUN-9B0118
                LET g_doc.value1 = g_cmi01
                LET g_doc.value2 = g_cmi02
                LET g_doc.value3 = g_cmi03
                LET g_doc.value4 = g_cmi04
                LET g_doc.value5 = g_cmi00     #No.FUN-9B0118
                CALL cl_doc()
             END IF 
          END IF
      END CASE
   END WHILE
END FUNCTION
 
#Add  輸入
FUNCTION t211_a()
    IF s_shut(0) THEN RETURN END IF
    MESSAGE ""
    CLEAR FORM
    CALL g_cmi.clear()
    INITIALIZE g_cmi01 LIKE cmi_file.cmi01
    INITIALIZE g_cmi02 LIKE cmi_file.cmi02
    INITIALIZE g_cmi03 LIKE cmi_file.cmi03
    INITIALIZE g_cmi04 LIKE cmi_file.cmi04
    INITIALIZE g_cmi00 LIKE cmi_file.cmi00          #No.FUN-9B0118
    INITIALIZE g_cmi12 LIKE cmi_file.cmi12          #No.FUN-9B0118
    INITIALIZE g_cmia.* LIKE cmi_file.*             #DEFAULT 設定
    LET g_cmi01_t = NULL
    LET g_cmi02_t = NULL
    LET g_cmi03_t = NULL
    LET g_cmi04_t = NULL
    LET g_cmi00_t = NULL
    LET g_cmi12_t = NULL
    #預設值及將數值類變數清成零
    LET g_cmi_o.* = g_cmia.*
    CALL cl_opmsg('a')
    CALL s_log_ins(g_prog,'','','','') RETURNING g_cka00  #FUN-C80092 add
    WHILE TRUE
        CALL t211_i("a")                #輸入單頭
        IF INT_FLAG THEN                   #使用者不玩了
            INITIALIZE g_cmia.* TO NULL
            LET INT_FLAG = 0
            CALL cl_err('',9001,0)
            CALL s_log_upd(g_cka00,'N')          #更新日誌  #FUN-C80092
            EXIT WHILE
        END IF
        IF g_cmia.cmi01 IS NULL OR g_cmia.cmi02 IS NULL OR g_cmia.cmi03 IS NULL OR           #No.FUN-9B0118
           g_cmia.cmi04 IS NULL OR g_cmia.cmi00 IS NULL OR g_cmia.cmi12 IS NULL THEN         # KEY 不可空白   #No.FUN-9B0118
            CONTINUE WHILE
        END IF
        LET g_rec_b=0
        LET g_cmi01=g_cmia.cmi01
        LET g_cmi02=g_cmia.cmi02
        LET g_cmi03=g_cmia.cmi03
        LET g_cmi04=g_cmia.cmi04
        LET g_cmi00=g_cmia.cmi00
        LET g_cmi12=g_cmia.cmi12
        CALL t211_b_fill(' 1=1')        #單身
        CALL t211_b()                   #輸入單身
        LET g_cmi01_t=g_cmi01
        LET g_cmi02_t=g_cmi02
        LET g_cmi03_t=g_cmi03
        LET g_cmi04_t=g_cmi04
        LET g_cmi00_t=g_cmi00
        LET g_cmi12_t=g_cmi12
        CALL s_log_upd(g_cka00,'Y')              #更新日誌  #FUN-C80092
        EXIT WHILE
    END WHILE
END FUNCTION
 
#處理INPUT
FUNCTION t211_i(p_cmd)
DEFINE
    l_flag          LIKE type_file.chr1,           # Prog. Version..: '5.30.27-19.04.12(01)              #判斷必要欄位是否有輸入
    p_cmd           LIKE type_file.chr1            # Prog. Version..: '5.30.27-19.04.12(01)            #a:輸入 u:更改
    CALL cl_set_head_visible("","YES")       #No.FUN-6A0092
 
    INPUT BY NAME g_cmia.cmi04,g_cmia.cmi00,                                      #No.FUN-9B0118
        g_cmia.cmi01,g_cmia.cmi02,g_cmia.cmi03,g_cmia.cmi12 WITHOUT DEFAULTS      #No.FUN-9B0118
 
        BEFORE INPUT
           LET g_before_input_done = FALSE
           CALL t211_set_entry(p_cmd)
           CALL t211_set_no_entry(p_cmd)
           LET g_before_input_done = TRUE
        AFTER FIELD cmi01
        IF NOT cl_null(g_cmia.cmi01) THEN
           LET g_cmi01=g_cmia.cmi01
           IF g_cmia.cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(g_cmia.cmi01,'axc-095',0)
              NEXT FIELD cmi01
           END IF
        END IF
 
        AFTER FIELD cmi02                  #月份
        IF NOT cl_null(g_cmia.cmi02) THEN
           IF g_cmia.cmi01 = g_ccz.ccz01 AND g_cmia.cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(g_cmia.cmi02,'axc-095',0)    #No:MOD-9C0025 modify
              NEXT FIELD cmi02     #No:MOD-9C0025 modify
           END IF
 
           IF g_cmia.cmi02 <0 OR g_cmia.cmi02 > 12 THEN
              CALL cl_err(g_cmia.cmi02,'mfg6032',0)
              LET g_cmia.cmi02=g_cmi_o.cmi02
              DISPLAY BY NAME g_cmia.cmi02
              NEXT FIELD cmi02
           END IF
           LET g_cmi_o.cmi02=g_cmia.cmi02
           LET g_cmi02=g_cmia.cmi02
        END IF
 
        AFTER FIELD cmi03
            IF cl_null(g_cmia.cmi03) THEN LET g_cmia.cmi03 = ' ' END IF
            IF NOT cl_null(g_cmia.cmi03) THEN                                   
               IF g_aaz.aaz90='Y' THEN                                          
                  IF NOT s_costcenter_chk(g_cmia.cmi03) THEN                    
                     NEXT FIELD cmi03                                           
                  END IF                                                        
               ELSE                                                             
                  CALL t211_cmi03(g_cmia.cmi03)                                 
                  IF NOT cl_null(g_errno) THEN                                  
                     CALL cl_err(g_cmia.cmi03,g_errno,0)                        
                     NEXT FIELD cmi03                                           
                  END IF                                                        
               END IF                                                           
            END IF                                                              
            LET g_cmi03=g_cmia.cmi03
        AFTER FIELD cmi04
            IF g_cmia.cmi04 IS NULL OR g_cmia.cmi04 NOT MATCHES "[123456]" THEN                                                                   
               NEXT FIELD cmi04    
            ELSE                                                                                                    
               LET g_cmi04=g_cmia.cmi04
            END IF

        AFTER FIELD cmi00    #帐套
            IF NOT cl_null(g_cmia.cmi00) THEN
               CALL t211_cmi00(p_cmd,g_cmia.cmi00)
               IF NOT cl_null(g_errno) THEN
                  CALL cl_err(g_cmia.cmi00,g_errno,0)
                  LET g_cmia.cmi00=g_cmia_t.cmi00
                  DISPLAY BY NAME g_cmia.cmi00
                  NEXT FIELD cmi00
               END IF
            END IF

        AFTER INPUT  #判斷必要欄位之值是否有值,若無則反白顯示,並要求重新輸入
            LET l_flag='N'
            IF INT_FLAG THEN
               EXIT INPUT
            END IF
           IF g_cmia.cmi02 IS NULL OR g_cmia.cmi02 <=0 OR g_cmia.cmi02 > 12 THEN
               LET l_flag='Y'
               DISPLAY BY NAME g_cmia.cmi02
            END IF
            IF l_flag='Y' THEN
                CALL cl_err('','9033',0)
                NEXT FIELD cmi01
            END IF
 
        ON ACTION CONTROLF                  #欄位說明
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913

        ON ACTION controlp
           CASE
              WHEN INFIELD(cmi00)   #帐套
                   CALL cl_init_qry_var()
                   LET g_qryparam.form  = "q_aaa"
                   CALL cl_create_qry() RETURNING g_cmia.cmi00
                   DISPLAY BY NAME g_cmia.cmi00
                   NEXT FIELD cmi00
              OTHERWISE EXIT CASE
           END CASE

        ON ACTION CONTROLR
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
FUNCTION t211_set_entry(p_cmd)
 DEFINE p_cmd   LIKE type_file.chr1           #No.FUN-680122 VARCHAR(1)
 
    IF p_cmd = 'a' AND ( NOT g_before_input_done ) THEN
        CALL cl_set_comp_entry("cmi01,cmi02,cmi03,cmi04,cmi00",TRUE)  #No.FUN-9B0118
    END IF
 
END FUNCTION
 
FUNCTION t211_set_no_entry(p_cmd)
  DEFINE p_cmd   LIKE type_file.chr1           #No.FUN-680122 VARCHAR(1)
 
    IF p_cmd = 'u' AND g_chkey = 'N' AND ( NOT g_before_input_done ) THEN
       CALL cl_set_comp_entry("cmi01,cmi02,cmi03,cmi04,cmi00",FALSE)  #No.FUN-9B0118
    END IF
 
END FUNCTION
FUNCTION t211_set_entry_b()
 DEFINE p_cmd   LIKE type_file.chr1           #No.FUN-680122 VARCHAR(1)
 
    IF INFIELD(cmi05) THEN
       CALL cl_set_comp_entry("cmi06,cmi07",TRUE)
    END IF
 
END FUNCTION
FUNCTION t211_set_no_entry_b()
  DEFINE p_cmd   LIKE type_file.chr1          #No.FUN-680122 VARCHAR(1)
 
    IF INFIELD(cmi05) THEN
       IF (g_cmi[l_ac].cmi05<>'MISC') THEN
          CALL cl_set_comp_entry("cmi07",FALSE)
       END IF
       IF (g_cmi[l_ac].cmi05='MISC') OR (g_cmi[l_ac].cmi05='EXP') THEN
          LET g_cmi[l_ac].cmi06 = ' '    #No.FUN-990068
          CALL cl_set_comp_entry("cmi06",FALSE)
       END IF
       IF l_aag05 = 'N' THEN
          LET g_cmi[l_ac].cmi06 = ' '    #No.FUN-990068
          CALL cl_set_comp_entry("cmi06",FALSE)
       END IF
    END IF
 
 
END FUNCTION
 
FUNCTION t211_q()
 
    LET g_row_count = 0
    LET g_curs_index = 0
    CALL cl_navigator_setting( g_curs_index, g_row_count )
    INITIALIZE g_cmi01 TO NULL        #No.FUN-6A0019
    CALL cl_opmsg('q')
    MESSAGE ""
    CALL t211_cs()                    #取得查詢條件
    IF INT_FLAG THEN                  #使用者不玩了
        LET INT_FLAG = 0
        RETURN
    END IF
    OPEN t211_b_cs                    #從DB產生合乎條件TEMP(0-30秒)
    IF SQLCA.sqlcode THEN                         #有問題
        CALL cl_err('',SQLCA.sqlcode,0)
        INITIALIZE g_cmi01 TO NULL
    ELSE
        OPEN t211_cnt
        FETCH t211_cnt INTO g_row_count
        DISPLAY g_row_count TO FORMONLY.cnt
        CALL t211_fetch('F')            #讀出TEMP第一筆並顯示
    END IF
END FUNCTION
 
#處理資料的讀取
FUNCTION t211_fetch(p_flag)
DEFINE
    p_flag          LIKE type_file.chr1                  #處理方式        #No.FUN-680122 VARCHAR(1)
 
    CASE p_flag
        WHEN 'N' FETCH NEXT     t211_b_cs INTO g_cmi01,g_cmi02,g_cmi03,g_cmi04,g_cmi00   #No.FUN-9B0118
        WHEN 'P' FETCH PREVIOUS t211_b_cs INTO g_cmi01,g_cmi02,g_cmi03,g_cmi04,g_cmi00   #No.FUN-9B0118
        WHEN 'F' FETCH FIRST    t211_b_cs INTO g_cmi01,g_cmi02,g_cmi03,g_cmi04,g_cmi00   #No.FUN-9B0118
        WHEN 'L' FETCH LAST     t211_b_cs INTO g_cmi01,g_cmi02,g_cmi03,g_cmi04,g_cmi00   #No.FUN-9B0118
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
            FETCH ABSOLUTE g_jump t211_b_cs INTO g_cmi01,g_cmi02,g_cmi03,g_cmi04,g_cmi00    #No.FUN-9B0118
            LET mi_no_ask = FALSE
    END CASE
 
    IF SQLCA.sqlcode THEN
        CALL cl_err(g_cmi01,SQLCA.sqlcode,0)
        INITIALIZE g_cmi01 TO NULL  #TQC-6B0105
        INITIALIZE g_cmi02 TO NULL  #TQC-6B0105
        INITIALIZE g_cmi03 TO NULL  #TQC-6B0105
        INITIALIZE g_cmi04 TO NULL  #TQC-6B0105
        INITIALIZE g_cmi00 TO NULL  #No.FUN-9B0118
    ELSE
    SELECT UNIQUE cmi12 INTO g_cmi12 FROM cmi_file
     WHERE cmi00 = g_cmi00
       AND cmi01 = g_cmi01
       AND cmi02 = g_cmi02
       AND cmi03 = g_cmi03
       AND cmi04 = g_cmi04
 
    CALL t211_show()
       CASE p_flag
          WHEN 'F' LET g_curs_index = 1
          WHEN 'P' LET g_curs_index = g_curs_index - 1
          WHEN 'N' LET g_curs_index = g_curs_index + 1
          WHEN 'L' LET g_curs_index = g_row_count
          WHEN '/' LET g_curs_index = g_jump
       END CASE
 
       CALL cl_navigator_setting( g_curs_index, g_row_count )
    END IF
    
END FUNCTION
 
#將資料顯示在畫面上
FUNCTION t211_show()
    DISPLAY g_cmi01,g_cmi02,g_cmi03,g_cmi04,g_cmi00,g_cmi12     #No.FUN-9B0118
         TO cmi01,cmi02,cmi03,cmi04,cmi00,cmi12                 #No.FUN-9B0118
    CALL t211_b_fill(g_wc)                 #單身
    CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
END FUNCTION
 
#單身
FUNCTION t211_b()
DEFINE
    l_ac_t          LIKE type_file.num5,           #未取消的ARRAY CNT        #No.FUN-680122 SMALLINT
    l_n             LIKE type_file.num5,           #檢查重複用        #No.FUN-680122 SMALLINT
    l_lock_sw       LIKE type_file.chr1,           #單身鎖住否        #No.FUN-680122 VARCHAR(1)
    p_cmd           LIKE type_file.chr1,           #處理狀態        #No.FUN-680122 VARCHAR(1)
    l_length        LIKE type_file.num5,           #No.FUN-680122SMALLINT              #長度
    l_allow_insert  LIKE type_file.num5,           #可新增否        #No.FUN-680122 SMALLINT
    l_allow_delete  LIKE type_file.num5,           #可刪除否        #No.FUN-680122 SMALLINT
    l_flag2         LIKE type_file.chr1            #CHI-CA0076 add
   #MOD-E80049-Start-Mark 
   #l_pmc903        LIKE pmc_file.pmc903,          #FUN-D80058 add
   #i               LIKE type_file.num5,           #FUN-D80058 add
   #l_flag          LIKE type_file.num5,           #FUN-D80058 add
   #l_flag_t        LIKE type_file.num5            #FUN-D80058 add
   #MOD-E80049-End-Mark 
 
    LET g_cmia.cmi01=g_cmi01
    LET g_cmia.cmi02=g_cmi02
    LET g_cmia.cmi03=g_cmi03
    LET g_cmia.cmi04=g_cmi04
    LET g_cmia.cmi00=g_cmi00    #No.FUN-9B0118
    LET g_cmia.cmi12=g_cmi12    #No.FUN-9B0118
    IF g_cmia.cmi01 IS NULL OR g_cmia.cmi01 = 0 THEN
        RETURN
    END IF
    IF g_cmia.cmi01 IS NULL OR g_cmia.cmi02 IS NULL OR g_cmia.cmi03 IS NULL OR
       g_cmia.cmi04 IS NULL OR g_cmia.cmi00 IS NULL THEN
       RETURN
    END IF
    CALL cl_opmsg('b')
 
    LET g_action_choice = ""
    IF NOT t211_chk_q310(g_cmi00,g_cmi01,g_cmi02) THEN RETURN END IF #MOD-DB0167 add
   #MOD-E80049-Start-Mark 
   ##FUN-D80058--add--str-- 
   #CALL cl_set_comp_visible("cmi13,cmi14,cmi15,cmi16,cmi17,cmi18",TRUE)
   #CALL cl_set_comp_visible("cmi19,cmi20,cmi21,cmi22,cmi23,cmi24",TRUE)
   #CALL cl_set_comp_visible("cmi25,cmi26,cmi27,cmi28,cmi29,cmi30",TRUE)
   #CALL cl_set_comp_visible("cmi31,cmi32,cmi33,cmi34",TRUE)
   ##FUN-D80058--add--end--
   #MOD-E80049-End-Mark 
 
    LET g_forupd_sql = " SELECT cmi05,cmi06,cmi07,cmi08 ",
                       " FROM cmi_file ",
                       "  WHERE cmi01=? ",
                       "   AND cmi02=? ",
                       "   AND cmi03=? ",
                       "   AND cmi04=? ",
                       "   AND cmi00=? ",  #No.FUN-9B0118
                       "   AND cmi05=? ",
                       "   AND cmi06=? ",
                       " FOR UPDATE "
    LET g_forupd_sql = cl_forupd_sql(g_forupd_sql)
    DECLARE t211_bcl CURSOR FROM g_forupd_sql      # LOCK CURSOR
 
    LET l_ac_t = 0
        LET l_allow_insert = cl_detail_input_auth("insert")
        LET l_allow_delete = cl_detail_input_auth("delete")
 
        INPUT ARRAY g_cmi WITHOUT DEFAULTS FROM s_cmi.*
              ATTRIBUTE(COUNT=g_rec_b,MAXCOUNT=g_max_rec,UNBUFFERED,
                        INSERT ROW=l_allow_insert,DELETE ROW=l_allow_delete,APPEND ROW=l_allow_insert)
 
        BEFORE INPUT
            IF g_rec_b != 0 THEN
               CALL fgl_set_arr_curr(l_ac)
            END IF
 
        BEFORE ROW
            LET p_cmd = ''
            LET l_ac = ARR_CURR()
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n  = ARR_COUNT()
 
            IF g_rec_b>=l_ac THEN
                LET g_cmi_t.* = g_cmi[l_ac].*  #BACKUP
                LET p_cmd='u'
                BEGIN WORK
                OPEN t211_bcl USING g_cmia.cmi01,g_cmia.cmi02, g_cmia.cmi03,
                                    g_cmia.cmi04,g_cmia.cmi00,                  #No.FUN-9B0118
                                    g_cmi_t.cmi05,g_cmi_t.cmi06
                IF STATUS THEN
                   CALL cl_err("OPEN t211_bcl:", STATUS, 1)
                   CLOSE t211_bcl
                   ROLLBACK WORK
                   RETURN
                ELSE
                   FETCH t211_bcl INTO g_cmi[l_ac].*
                   IF SQLCA.sqlcode THEN
                       CALL cl_err(g_cmi_t.cmi05,SQLCA.sqlcode,1)
                       LET l_lock_sw = "Y"
                   END IF
                  #MOD-E80049-Start-Mark 
                  ##FUN-D80058--add--str--
                  # IF g_aaz.aaz119 ='Y' THEN 
                  #     CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi13,'aag15','1') RETURNING g_cmi[l_ac].cmi14   
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi15,'aag16','2') RETURNING g_cmi[l_ac].cmi16  
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi17,'aag17','3') RETURNING g_cmi[l_ac].cmi18   
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi19,'aag18','4') RETURNING g_cmi[l_ac].cmi20 
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi21,'aag31','5') RETURNING g_cmi[l_ac].cmi22   
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi23,'aag32','6') RETURNING g_cmi[l_ac].cmi24  
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi25,'aag33','7') RETURNING g_cmi[l_ac].cmi26  
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi27,'aag34','8') RETURNING g_cmi[l_ac].cmi28   
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi29,'aag35','9') RETURNING g_cmi[l_ac].cmi30  
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi31,'aag36','10') RETURNING g_cmi[l_ac].cmi32  
                  #    CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi33,'aag37','99') RETURNING g_cmi[l_ac].cmi34  
                  #  END IF
                  # CALL t211_set_required(p_cmd)
                  # CALL t211_set_no_required(p_cmd)
                  # #FUN-D80058--add--end--
                  #MOD-E80049-End-Mark  
                END IF
                CALL cl_show_fld_cont()     #FUN-550037(smin)
             END IF
 
        AFTER INSERT
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
            INSERT INTO cmi_file(cmi01,cmi02,cmi03,cmi04,cmi05,cmi06,cmi07,
                                 cmi08,cmi09,cmi10,
                                #MOD-E80049-Start-Mark 
                                #cmi13,cmi14,cmi15,cmi16,      #FUN-D80058 add cmi13,cmi14,cmi15,cmi16,
                                #cmi17,cmi18,cmi19,cmi20,cmi21,cmi22,cmi23,      #FUN-D80058 add
                                #cmi24,cmi25,cmi26,cmi27,cmi28,cmi29,cmi30,      #FUN-D80058 add
                                #cmi31,cmi32,cmi33,cmi34,cmi35,                  #FUN-D80058 add
                                #MOD-E80049-End-Mark 
                                 cmiacti,cmiuser,cmigrup,
                                 cmimodu,cmidate,cmi00,cmi12,cmioriu,cmiorig,cmilegal
                                 )  #No.MOD-470041   #No.FUN-9B0118  #FUN-A50075 add legal
            VALUES(g_cmia.cmi01,g_cmia.cmi02,g_cmia.cmi03,
                   g_cmia.cmi04,g_cmi[l_ac].cmi05,
                   g_cmi[l_ac].cmi06,g_cmi[l_ac].cmi07,
                   g_cmi[l_ac].cmi08,'','',
                  #MOD-E80049-Start-Mark 
                  ##FUN-D80058--add--str--
                  #g_cmi[l_ac].cmi13,g_cmi[l_ac].cmi14,
                  #g_cmi[l_ac].cmi15,g_cmi[l_ac].cmi16,
                  #g_cmi[l_ac].cmi17,g_cmi[l_ac].cmi18,
                  #g_cmi[l_ac].cmi19,g_cmi[l_ac].cmi20,
                  #g_cmi[l_ac].cmi21,g_cmi[l_ac].cmi22,
                  #g_cmi[l_ac].cmi23,g_cmi[l_ac].cmi24,
                  #g_cmi[l_ac].cmi25,g_cmi[l_ac].cmi26,
                  #g_cmi[l_ac].cmi27,g_cmi[l_ac].cmi28,
                  #g_cmi[l_ac].cmi29,g_cmi[l_ac].cmi30,
                  #g_cmi[l_ac].cmi31,g_cmi[l_ac].cmi32,
                  #g_cmi[l_ac].cmi33,g_cmi[l_ac].cmi34,
                  #g_cmi[l_ac].cmi35,
                  ##FUN-D80058--add--end--
                  #MOD-E80049-End-Mark 
                   'Y',g_user,g_grup,'',
                   g_today,g_cmia.cmi00,g_cmia.cmi12, g_user, g_grup,g_legal)                           #No.FUN-9B0118      #No.FUN-980030 10/01/04  insert columns oriu, orig  #FUN-A50075 add legal
            IF SQLCA.sqlcode THEN
                CALL cl_err3("ins","cmi_file",g_cmia.cmi01,g_cmia.cmi02,SQLCA.sqlcode,"","",1)  #No.FUN-660127
            ELSE
                MESSAGE 'INSERT O.K'
                COMMIT WORK
                LET g_rec_b=g_rec_b+1
                DISPLAY g_rec_b TO FORMONLY.cn2
            END IF
            SELECT SUM(cmi08) INTO g_cmi08_tot FROM cmi_file
                WHERE cmi01=g_cmia.cmi01 AND cmi02=g_cmia.cmi02
                AND cmi03=g_cmia.cmi03 AND cmi04=g_cmia.cmi04
                AND cmi00 = g_cmia.cmi00                          #No.FUN-9B0118
            DISPLAY g_cmi08_tot TO FORMONLY.cmi08_tot
 
        BEFORE INSERT
            LET l_n = ARR_COUNT()
            LET p_cmd='a'
            INITIALIZE g_cmi[l_ac].* TO NULL      #900423
            CALL cl_show_fld_cont()     #FUN-550037(smin)
            LET g_cmi_t.* = g_cmi[l_ac].*         #新輸入資料
            LET g_cmi[l_ac].cmi06 = g_cmia.cmi03  #No.FUN-990068
           #MOD-E80049-Start-Mark 
           #CALL t211_set_required(p_cmd)        #FUN-D80058 add
           #CALL t211_set_no_required(p_cmd)     #FUN-D80058 add
           #MOD-E80049-End-Mark 
 
        BEFORE FIELD cmi05
            CALL t211_set_entry_b()
           #CALL t211_set_no_required(p_cmd)   #FUN-D80058 add  #MOD-E80049 Mark
 
        AFTER FIELD cmi05
            IF NOT cl_null(g_cmi[l_ac].cmi05) THEN
          
               CALL t211_cmi05(g_cmi[l_ac].cmi05,g_cmia.cmi00)   #No.FUN-730057  #No.FUN-9B0118
               IF NOT cl_null(g_errno) AND g_cmi[l_ac].cmi05<>'MISC'
                  AND g_cmi[l_ac].cmi05 <> 'EXP' THEN
                  CALL cl_err('',g_errno,0)
#FUN-B10052 --bgegin--                  
#                 LET g_cmi[l_ac].cmi05=g_cmi_t.cmi05
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     ="q_aag"
                  LET g_qryparam.default1 = g_cmi[l_ac].cmi05
                  LET g_qryparam.arg1     = ""     #carrier check bookno?
                  LET g_qryparam.arg2     = "2"
                  LET g_qryparam.arg3     = ""
                  LET g_qryparam.construct = 'N'
                  IF cl_null(g_qryparam.where) THEN
                     LET g_qryparam.where=" 1=1 "
                  END IF
                  LET g_qryparam.where = g_qryparam.where CLIPPED," AND aag01 LIKE '",g_cmi[l_ac].cmi05 CLIPPED,"%'"
                  IF g_qryparam.arg1 IS NOT NULL AND
                     g_qryparam.arg1 != '' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag03 IN ('",g_qryparam.arg1 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg2 IS NOT NULL AND
                     g_qryparam.arg2 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED ,
                     " AND aag07 IN ('",g_qryparam.arg2 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg3 IS NOT NULL AND
                     g_qryparam.arg3 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag01 IN ('",g_qryparam.arg3,"') "
                  END IF
                  LET g_qryparam.where = g_qryparam.where CLIPPED #," ORDER BY 2 "
                  LET g_qryparam.arg1 =  g_cmia.cmi00   
                  CALL cl_create_qry() RETURNING g_cmi[l_ac].cmi05
                  DISPLAY BY NAME g_cmi[l_ac].cmi05
#FUN-B10052 --end--
                  NEXT FIELD cmi05
               END IF
               IF g_cmi[l_ac].cmi05 !='MISC' AND g_cmi[l_ac].cmi05 <> 'EXP'
               THEN
                  SELECT aag02,aag05,aag06,aag07
                  INTO g_cmi[l_ac].cmi07,l_aag05,l_aag06,l_aag07 FROM aag_file
                         WHERE aag01=g_cmi[l_ac].cmi05
                           AND aag00=g_cmia.cmi00        #NO.FUN-730057   #No.FUN-9B0118
                  IF l_aag07 !='2' AND  l_aag07 !='3' THEN
                     CALL cl_err(g_cmi[l_ac].cmi05,'agl-015',0)                     
                     NEXT FIELD cmi05
                    LET g_cmi[l_ac].cmi05=g_cmi_t.cmi05
                  END IF
                  IF cl_null(g_cmi[l_ac].cmi06) THEN 
                     LET g_cmi[l_ac].cmi06 = ' ' 
                  END IF   
               ELSE
                  LET g_cmi[l_ac].cmi06=' ' #MISC 部門要給空白否則OPEN
                  LET g_cmi[l_ac].cmi06=' ' #MISC 部門要給空白否則FETCH 會有誤
               END IF
            END IF
            CALL t211_set_no_entry_b()
 
        BEFORE FIELD cmi06
            IF g_cmi[l_ac].cmi05 !='MISC' AND g_cmi[l_ac].cmi05 <> 'EXP'  THEN
               SELECT aag02,aag05,aag06,aag07
               INTO g_cmi[l_ac].cmi07,l_aag05,l_aag06,l_aag07 FROM aag_file
                      WHERE aag01=g_cmi[l_ac].cmi05
                        AND aag00=g_cmia.cmi00        #NO.FUN-730057  #No.FUN-9B0118
               IF l_aag07 !='2' AND  l_aag07 !='3' THEN
                  CALL cl_err(g_cmi[l_ac].cmi05,'agl-015',0)
                  NEXT FIELD cmi05
                  LET g_cmi[l_ac].cmi05=g_cmi_t.cmi05
               END IF
            ELSE
               IF g_cmi[l_ac].cmi05='MISC' THEN    # No.MOD-940353 modify
                  LET g_cmi[l_ac].cmi06=' ' #MISC 部門要給空白否則OPEN
                  LET g_cmi[l_ac].cmi06=' ' #MISC 部門要給空白否則FETCH 會有誤
               END IF       # No.MOD-940353 modify
            END IF
            DISPLAY g_cmi[l_ac].cmi07 TO cmi07
 
        AFTER FIELD cmi06                        #check 序號是否重複
            IF NOT cl_null(g_cmi[l_ac].cmi06) THEN
               CALL t211_cmi03(g_cmi[l_ac].cmi06)                               
               IF NOT cl_null(g_errno) THEN                                     
                  CALL cl_err(g_cmi[l_ac].cmi06,g_errno,0)                      
                  NEXT FIELD cmi06                                              
               END IF
               IF g_cmi_t.cmi05 IS NULL  THEN
                   SELECT count(*) INTO g_cnt
                       FROM cmi_file
                       WHERE cmi01 = g_cmia.cmi01 AND
                             cmi02 = g_cmia.cmi02 AND
                             cmi03 = g_cmia.cmi03 AND
                             cmi04 = g_cmia.cmi04 AND
                             cmi00 = g_cmia.cmi00 AND          #No.FUN-9B0118
                             cmi05 = g_cmi[l_ac].cmi05 AND
                             cmi06 = g_cmi[l_ac].cmi06
                   IF g_cnt > 0 THEN
                       CALL cl_err('',-239,0)
                       LET g_cmi[l_ac].cmi05 = g_cmi_t.cmi05
                       LET g_cmi[l_ac].cmi06 = g_cmi_t.cmi06
                       NEXT FIELD cmi05
                   END IF
               END IF
               IF l_aag05='Y' THEN                             #要做部門管理時
                  SELECT aaz72 INTO l_aaz72 FROM aaz_file
                  IF l_aaz72='1' THEN                        #為拒絕部門
                     SELECT COUNT(*) INTO g_cnt FROM aab_file
                     WHERE aab01=g_cmi[l_ac].cmi05 AND aab02=g_cmi[l_ac].cmi06
                                               #   AND aab00=g_bookno1          #No.FUN-730057  #No.FUN-9B0118
                                                   AND aab00=g_cmia.cmi00       #No.FUN-730057  #No.FUN-9B0118
                     IF g_cnt > 0 THEN
                        CALL cl_err('','agl-207',0)
                        NEXT FIELD cmi06
                     END IF
                  ELSE                                        #為允許部門
                     SELECT COUNT(*) INTO g_cnt FROM aab_file
                     WHERE aab01=g_cmi[l_ac].cmi05 AND aab02=g_cmi[l_ac].cmi06
                                               #   AND aab00=g_bookno1          #No.FUN-730057  #No.FUN-9B0118
                                                   AND aab00=g_cmia.cmi00       #No.FUN-730057  #No.FUN-9B0118
                     IF g_cnt = 0 THEN
                        CALL cl_err('','agl-209',0)
                        NEXT FIELD cmi06
                     END IF
                  END IF
               END IF
            ELSE
               IF l_aag05='Y' THEN    #MOD-940353 add      #要做部門管理時
                  CALL cl_err('','aap-287',1)
                  NEXT FIELD cmi06
               END IF                 #MOD-940353 add
            END IF
 
        BEFORE FIELD cmi07
            IF g_cmi_t.cmi05 IS NULL THEN
               SELECT count(*) INTO g_cnt
                   FROM cmi_file
                   WHERE cmi01 = g_cmia.cmi01 AND
                         cmi02 = g_cmia.cmi02 AND
                         cmi03 = g_cmia.cmi03 AND
                         cmi04 = g_cmia.cmi04 AND
                         cmi00 = g_cmia.cmi00 AND         #No.FUN-9B0118
                         cmi05 = g_cmi[l_ac].cmi05 AND
                         cmi06 = g_cmi[l_ac].cmi06
               IF g_cnt > 0 THEN
                  CALL cl_err('',-239,0)
                  LET g_cmi[l_ac].cmi05 = g_cmi_t.cmi05
                  LET g_cmi[l_ac].cmi06 = g_cmi_t.cmi06
                  DISPLAY BY NAME g_cmi[l_ac].cmi05
                  DISPLAY BY NAME g_cmi[l_ac].cmi06
                  NEXT FIELD cmi05
               END IF
            END IF
 
 
        AFTER FIELD cmi08                                                                                                           
          IF NOT cl_null(g_cmi[l_ac].cmi08) THEN                                                                                    
             IF g_cmi[l_ac].cmi05 != 'EXP' THEN         #MOD-B10066 add
                IF g_cmi[l_ac].cmi08 < 0 THEN                                                                                          
                   CALL cl_err(g_cmi[l_ac].cmi08,'axc-207',0)                                                                          
                   NEXT FIELD cmi08                                                                                                    
                END IF                                                                                                                 
             END IF           #MOD-B10066 add                                                                                        
          END IF    

      #MOD-E80049-Start-Mark   
      ##FUN-D80058--add--str--
      #AFTER FIELD cmi35
      #    IF NOT cl_null(g_cmi[l_ac].cmi35) THEN
      #       CALL t211_cmi35(p_cmd)
      #       IF NOT cl_null(g_errno) THEN
      #         CALL cl_err('',g_errno,0)
      #         LET g_cmi[l_ac].cmi35 = g_cmi_t.cmi35
      #         DISPLAY BY NAME g_cmi[l_ac].cmi35
      #         NEXT FIELD cmi35
      #       END IF
      #    END IF
      #    CALL t211_bud(p_cmd,'0',g_cmi[l_ac].*)           
      #    IF NOT cl_null(g_errno) THEN
      #       NEXT FIELD cmi35
      #    END IF  

      #BEFORE FIELD cmi13  #異動碼一
      #   IF cl_null(m_aag151) THEN
      #      LET g_cmi[l_ac].cmi13 = ' '
      #      DISPLAY BY NAME g_cmi[l_ac].cmi13
      #   END IF
      #   CALL t211_error(m_aag15)
      #   IF g_aaz.aaz116 = 'Y' THEN      
      #      IF (m_aag151='2' OR m_aag151='3') AND cl_null(g_cmi[l_ac].cmi13) THEN 
      #          CALL s_ahe_qry(g_cmi[l_ac].cmi05,'1','i',g_cmi[l_ac].cmi13,g_cmi00)  
      #              RETURNING g_cmi[l_ac].cmi13
      #          DISPLAY g_cmi[l_ac].cmi13 TO cmi13
      #      END IF 
      #   END IF                          

      #  AFTER FIELD cmi13
      #     IF NOT cl_null(g_cmi[l_ac].cmi13) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'1',g_cmi[l_ac].cmi13,g_cmi00)  
      #        IF NOT cl_null(g_errno) THEN
      #           CALL cl_err('',g_errno,1)
      #           NEXT FIELD cmi13
      #        END IF
      #        IF g_aza.aza26 = '2' THEN
      #           LET l_pmc903 = NULL
      #           SELECT pmc903 INTO l_pmc903  FROM pmc_file WHERE pmc01 = g_cmi[l_ac].cmi13
      #           IF STATUS THEN
      #              SELECT occ37 INTO l_pmc903  FROM occ_file WHERE occ01 = g_cmi[l_ac].cmi13
      #           END IF
      #           IF l_pmc903='Y' THEN
      #              LET g_cmi[l_ac].cmi33 = g_cmi[l_ac].cmi13
      #              CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi33,'aag37','99') RETURNING g_cmi[l_ac].cmi34
      #           END IF 
      #           IF l_pmc903='N' THEN
      #              LET g_cmi[l_ac].cmi33 = ''
      #           END IF 
      #           DISPLAY g_cmi[l_ac].cmi33 TO cmi33
      #       END IF
      #    ELSE
      #       #異動碼-1控制方式
      #       IF m_aag151='2' OR m_aag151='3' THEN
      #          CALL cl_err('','mfg0037',0)
      #          NEXT FIELD cmi13
      #       END IF
      #    END IF
      #    CALL t211_set_required(p_cmd)
      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi13 <> g_cmi_t.cmi13 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi13,'aag15','1') RETURNING g_cmi[l_ac].cmi14 
      #    END IF 
 
      # BEFORE FIELD cmi15  #異動碼二
      #    IF cl_null(m_aag161) THEN
      #       LET g_cmi[l_ac].cmi15 = ' '
      #       DISPLAY BY NAME g_cmi[l_ac].cmi15
      #    END IF
      #    CALL t211_error(m_aag16)
      #    IF g_aaz.aaz116 = 'Y' THEN       
      #       IF (m_aag161='2' OR m_aag161='3') AND cl_null(g_cmi[l_ac].cmi15) THEN 
      #          CALL s_ahe_qry(g_cmi[l_ac].cmi05,'2','i',g_cmi[l_ac].cmi15,g_cmi00)  
      #               RETURNING g_cmi[l_ac].cmi15
      #          DISPLAY g_cmi[l_ac].cmi15 TO cmi15
      #       END IF 
      #    END IF                            

      # AFTER FIELD cmi15
      #    IF NOT cl_null(g_cmi[l_ac].cmi15) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'2',g_cmi[l_ac].cmi15,g_cmi00)  
      #            IF NOT cl_null(g_errno) THEN
      #               CALL cl_err('',g_errno,1)
      #               NEXT FIELD cmi15
      #            END IF
      #    ELSE
      #       #異動碼-2控制方式
      #       IF m_aag161='2' OR m_aag161='3' THEN
      #          CALL cl_err('','mfg0037',0)
      #          NEXT FIELD cmi15
      #       END IF
      #    END IF
      #    CALL t211_set_required(p_cmd)
      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi15 <> g_cmi_t.cmi15 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi15,'aag16','2') RETURNING g_cmi[l_ac].cmi16 
      #    END IF 
 
      #  BEFORE FIELD cmi17 
      #    IF cl_null(m_aag171) THEN
      #       LET g_cmi[l_ac].cmi17 = ' '
      #       DISPLAY BY NAME g_cmi[l_ac].cmi17
      #    END IF
      #    CALL t211_error(m_aag17)
      #    IF g_aaz.aaz116 = 'Y' THEN      
      #      IF (m_aag171='2' OR m_aag171='3') AND cl_null(g_cmi[l_ac].cmi17) THEN 
      #         CALL s_ahe_qry(g_cmi[l_ac].cmi05,'3','i',g_cmi[l_ac].cmi17,g_cmi00)  
      #              RETURNING g_cmi[l_ac].cmi17
      #         DISPLAY g_cmi[l_ac].cmi17 TO cmi17
      #      END IF 
      #    END IF                        
 
      # AFTER FIELD cmi17
      #    IF NOT cl_null(g_cmi[l_ac].cmi17) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'3',g_cmi[l_ac].cmi17,g_cmi00)  
      #            IF NOT cl_null(g_errno) THEN
      #               CALL cl_err('',g_errno,1)
      #               NEXT FIELD cmi17
      #            END IF
      #    ELSE
      #       #異動碼-3控制方式
      #       IF m_aag171='2' OR m_aag171='3' THEN
      #          CALL cl_err('','mfg0037',0)
      #          NEXT FIELD cmi17
      #       END IF
      #    END IF
      #    CALL t211_set_required(p_cmd)
      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi17 <> g_cmi_t.cmi17 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi17,'aag17','3') RETURNING g_cmi[l_ac].cmi18
      #    END IF 

 
      # BEFORE FIELD cmi19
      #    IF cl_null(m_aag181) THEN
      #       LET g_cmi[l_ac].cmi19 = ' '
      #       DISPLAY BY NAME g_cmi[l_ac].cmi19
      #    END IF
      #    CALL t211_error(m_aag18)
      #    IF g_aaz.aaz116 = 'Y' THEN   
      #      IF (m_aag181='2' OR m_aag181='3') AND cl_null(g_cmi[l_ac].cmi19) THEN 
      #         CALL s_ahe_qry(g_cmi[l_ac].cmi05,'4','i',g_cmi[l_ac].cmi19,g_cmi00)   
      #              RETURNING g_cmi[l_ac].cmi19
      #         DISPLAY g_cmi[l_ac].cmi19 TO cmi19
      #      END IF 
      #    END IF                       
      # AFTER FIELD cmi19
      #     IF NOT cl_null(g_cmi[l_ac].cmi19) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'4',g_cmi[l_ac].cmi19,g_cmi00)   
      #             IF NOT cl_null(g_errno) THEN
      #                CALL cl_err('',g_errno,1)
      #                NEXT FIELD cmi19
      #             END IF
      #      ELSE
      #        #異動碼-4控制方式
      #        IF m_aag181='2' OR m_aag181='3' THEN
      #           CALL cl_err('','mfg0037',0)
      #           NEXT FIELD cmi19
      #        END IF
      #     END IF
      #     CALL t211_set_required(p_cmd)
      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi19 <> g_cmi_t.cmi19 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi19,'aag18','4') RETURNING g_cmi[l_ac].cmi20 
      #    END IF 

 
      # BEFORE FIELD cmi21
      #    IF cl_null(m_aag311) THEN
      #       LET g_cmi[l_ac].cmi21 = ' '
      #    END IF
      #    CALL t211_error(m_aag31)
      #    IF g_aaz.aaz116 = 'Y' THEN     
      #       IF (m_aag311='2' OR m_aag311='3') AND cl_null(g_cmi[l_ac].cmi21) THEN 
      #          CALL s_ahe_qry(g_cmi[l_ac].cmi05,'5','i',g_cmi[l_ac].cmi21,g_cmi00)  
      #               RETURNING g_cmi[l_ac].cmi21
      #          DISPLAY g_cmi[l_ac].cmi21 TO cmi21
      #       END IF 
      #    END IF                        
      # AFTER FIELD cmi21
      #     IF NOT cl_null(g_cmi[l_ac].cmi21) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'5',g_cmi[l_ac].cmi21,g_cmi00) 
      #             IF NOT cl_null(g_errno) THEN
      #                CALL cl_err('',g_errno,1)
      #                NEXT FIELD cmi21
      #             END IF
      #     ELSE
      #        #異動碼-5控制方式
      #        IF m_aag311='2' OR m_aag311='3' THEN
      #           CALL cl_err('','mfg0037',0)
      #           NEXT FIELD cmi21
      #        END IF
      #     END IF
      #     CALL t211_set_required(p_cmd)
      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi21 <> g_cmi_t.cmi21 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi21,'aag31','5') RETURNING g_cmi[l_ac].cmi22 
      #    END IF 

 
      #  BEFORE FIELD cmi23
      #    IF cl_null(m_aag321) THEN
      #       LET g_cmi[l_ac].cmi23 = ' '
      #    END IF
      #    CALL t211_error(m_aag32)
      #    IF g_aaz.aaz116 = 'Y' THEN      
      #        IF (m_aag321='2' OR m_aag321='3') AND cl_null(g_cmi[l_ac].cmi23) THEN 
      #          CALL s_ahe_qry(g_cmi[l_ac].cmi05,'6','i',g_cmi[l_ac].cmi23,g_cmi00) 
      #               RETURNING g_cmi[l_ac].cmi23
      #          DISPLAY g_cmi[l_ac].cmi23 TO cmi23
      #       END IF 
      #     END IF                          
 
      # AFTER FIELD cmi23
      #     IF NOT cl_null(g_cmi[l_ac].cmi23) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'6',g_cmi[l_ac].cmi23,g_cmi00) 
      #             IF NOT cl_null(g_errno) THEN
      #                CALL cl_err('',g_errno,1)
      #                NEXT FIELD cmi23
      #             END IF
      #     ELSE
      #        #異動碼-6控制方式
      #        IF m_aag321='2' OR m_aag321='3' THEN
      #           CALL cl_err('','mfg0037',0)
      #           NEXT FIELD cmi23
      #        END IF
      #     END IF
      #     CALL t211_set_required(p_cmd)
      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi23 <> g_cmi_t.cmi23 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi23,'aag32','6') RETURNING g_cmi[l_ac].cmi24
      #    END IF 

 
      # BEFORE FIELD cmi25
      #    IF cl_null(m_aag331) THEN
      #       LET g_cmi[l_ac].cmi25 = ' '
      #    END IF
      #    CALL t211_error(m_aag33)
      #    IF g_aaz.aaz116 = 'Y' THEN       
      #      IF (m_aag331='2' OR m_aag331='3') AND cl_null(g_cmi[l_ac].cmi25) THEN 
      #         CALL s_ahe_qry(g_cmi[l_ac].cmi05,'7','i',g_cmi[l_ac].cmi25,g_cmi00)    
      #              RETURNING g_cmi[l_ac].cmi25
      #         DISPLAY g_cmi[l_ac].cmi25 TO cmi25
      #      END IF 
      #    END IF                            
 
      # AFTER FIELD cmi25
      #     IF NOT cl_null(g_cmi[l_ac].cmi25) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'7',g_cmi[l_ac].cmi25,g_cmi00)  
      #             IF NOT cl_null(g_errno) THEN
      #                CALL cl_err('',g_errno,1)
      #                NEXT FIELD cmi25
      #             END IF
      #     ELSE
      #        #異動碼-7控制方式
      #        IF m_aag331='2' OR m_aag331='3' THEN
      #           CALL cl_err('','mfg0037',0)
      #           NEXT FIELD cmi25
      #        END IF
      #     END IF
      #     CALL t211_set_required(p_cmd)
      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi25 <> g_cmi_t.cmi25 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi25,'aag33','7') RETURNING g_cmi[l_ac].cmi26 
      #    END IF 

 
      # BEFORE FIELD cmi27
      #    IF cl_null(m_aag341) THEN
      #       LET g_cmi[l_ac].cmi27 = ' '
      #    END IF
      #    CALL t211_error(m_aag34)
      #    IF g_aaz.aaz116 = 'Y' THEN       
      #       IF (m_aag341='2' OR m_aag341='3') AND cl_null(g_cmi[l_ac].cmi27) THEN 
      #          CALL s_ahe_qry(g_cmi[l_ac].cmi05,'8','i',g_cmi[l_ac].cmi27,g_cmi00)    
      #               RETURNING g_cmi[l_ac].cmi27
      #        DISPLAY g_cmi[l_ac].cmi27 TO cmi27
      #       END IF 
      #    END IF                       
      # AFTER FIELD cmi27
      #     IF NOT cl_null(g_cmi[l_ac].cmi27) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'8',g_cmi[l_ac].cmi27,g_cmi00)  
      #             IF NOT cl_null(g_errno) THEN
      #                CALL cl_err('',g_errno,1)
      #                NEXT FIELD cmi27
      #             END IF
      #     ELSE
      #        #異動碼-8控制方式
      #        IF m_aag341='2' OR m_aag341='3' THEN
      #           CALL cl_err('','mfg0037',0)
      #           NEXT FIELD cmi27
      #        END IF
      #     END IF
      #     CALL t211_set_required(p_cmd)
      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi27 <> g_cmi_t.cmi27 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi27,'aag34','8') RETURNING g_cmi[l_ac].cmi28 
      #    END IF 

 
      # AFTER FIELD cmi29
      #   IF g_cmi[l_ac].cmi29 IS NOT NULL THEN
      #      CALL t211_cmi29(p_cmd)
      #      IF NOT cl_null(g_errno) THEN
      #         CALL cl_err('',g_errno,0)
      #         LET g_cmi[l_ac].cmi29 = g_cmi_t.cmi29
      #         DISPLAY BY NAME g_cmi[l_ac].cmi29
      #         NEXT FIELD cmi29
      #      END IF
      #      DISPLAY BY NAME g_cmi[l_ac].cmi29
      #   ELSE
      #      LET g_cmi[l_ac].cmi29=' '
      #   END IF
      #   CALL t211_bud(p_cmd,'0',g_cmi[l_ac].*)          
      #   IF NOT cl_null(g_errno) THEN
      #      NEXT FIELD cmi29
      #   END IF  
      #   IF p_cmd ='a' OR g_cmi[l_ac].cmi29 <> g_cmi_t.cmi29 THEN 
      #      CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi29,'aag35','9') RETURNING g_cmi[l_ac].cmi30 
      #   END IF 
 
         
      # AFTER FIELD cmi31
      #   IF g_cmi[l_ac].cmi31 IS NOT NULL THEN
      #      CALL t211_cmi31(p_cmd)
      #      IF NOT cl_null(g_errno) THEN
      #         CALL cl_err('',g_errno,0)
      #         LET g_cmi[l_ac].cmi31 = g_cmi_t.cmi31
      #         DISPLAY BY NAME g_cmi[l_ac].cmi31
      #         NEXT FIELD cmi31
      #      END IF
      #      DISPLAY BY NAME g_cmi[l_ac].cmi31
      #   END IF
      #   CALL t211_bud(p_cmd,'0',g_cmi[l_ac].*)         
      #   IF NOT cl_null(g_errno) THEN
      #      NEXT FIELD cmi31
      #   END IF  
      #   IF p_cmd ='a' OR g_cmi[l_ac].cmi31 <> g_cmi_t.cmi31 THEN 
      #      CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi31,'aag36','10') RETURNING g_cmi[l_ac].cmi32 
      #   END IF 

 
      # BEFORE FIELD cmi33
      #    IF cl_null(m_aag371) THEN
      #       LET g_cmi[l_ac].cmi33 = ' '
      #    END IF
      #    CALL t211_error(m_aag37)
      #    IF g_aaz.aaz116 = 'Y' THEN     
      #       IF (m_aag371='2' OR m_aag371='3') AND cl_null(g_cmi[l_ac].cmi33) THEN 
      #          CALL s_ahe_qry(g_cmi[l_ac].cmi05,'99','i',g_cmi[l_ac].cmi33,g_cmi00)  
      #               RETURNING g_cmi[l_ac].cmi33
      #          DISPLAY g_cmi[l_ac].cmi33 TO cmi33
      #       END IF 
      #    END IF                           
 
      # AFTER FIELD cmi33
      #     IF g_aza.aza26 = '2' THEN
      #        LET l_pmc903 = NULL
      #        SELECT pmc903 INTO l_pmc903  FROM pmc_file WHERE pmc01 = g_cmi[l_ac].cmi13
      #        IF STATUS THEN
      #          SELECT occ37 INTO l_pmc903  FROM occ_file WHERE occ01 = g_cmi[l_ac].cmi13
      #        END IF
      #     END IF          
      #     IF NOT cl_null(g_cmi[l_ac].cmi33) THEN
      #        CALL s_chk_aee(g_cmi[l_ac].cmi05,'99',g_cmi[l_ac].cmi33,g_cmi00)  
      #             IF NOT cl_null(g_errno) THEN
      #                CALL cl_err('',g_errno,1)
      #                NEXT FIELD cmi33
      #             END IF  
      #        IF m_aag371='4' AND g_aza.aza26 ='2' THEN
      #           IF NOT cl_null(g_cmi[l_ac].cmi13) THEN
      #              IF l_pmc903 = 'Y' THEN     
      #                 IF g_cmi[l_ac].cmi33 <> g_cmi[l_ac].cmi13 THEN
      #                   CALL cl_err('','agl-959',1)
      #                   NEXT FIELD cmi33
      #                 END IF
      #              END IF  
      #              IF l_pmc903 = 'N' THEN
      #                  CALL cl_err('','agl-334',1)
      #                  NEXT FIELD cmi33
      #               END IF                     
      #           END IF 
      #        END IF              
      #     ELSE
      #        #關係人異動碼控制方式
      #        IF m_aag371='2' OR m_aag371='3' THEN  
      #           CALL cl_err('','mfg0037',0)
      #           NEXT FIELD cmi33
      #        END IF
      #        IF m_aag371='4' AND g_aza.aza26 ='2' THEN
      #           IF NOT cl_null(g_cmi[l_ac].cmi13) THEN
      #              IF l_pmc903 = 'Y' THEN
      #                 IF g_cmi[l_ac].cmi33 <> g_cmi[l_ac].cmi13 THEN
      #                   CALL cl_err('','agl-959',1)
      #                   NEXT FIELD cmi33
      #                 END IF
      #              END IF
      #           END IF
      #        END IF
      #     END IF
      #     CALL t211_set_required(p_cmd)

      #    IF p_cmd ='a' OR g_cmi[l_ac].cmi33 <> g_cmi_t.cmi33 THEN 
      #       CALL t211_get_ahe02(g_cmi[l_ac].cmi05,g_cmi[l_ac].cmi33,'aag37','99') RETURNING g_cmi[l_ac].cmi34 
      #    END IF  
      ##FUN-D80058--add--end-- 
      #MOD-E80049-End-Mark 
 
        BEFORE DELETE                            #是否取消單身
            IF g_cmi_t.cmi05 IS NOT NULL THEN
                IF NOT cl_delb(0,0) THEN
                     CANCEL DELETE
                END IF
                IF l_lock_sw = "Y" THEN
                   CALL cl_err("", -263, 1)
                   CANCEL DELETE
                END IF
                DELETE FROM cmi_file
                    WHERE cmi01 = g_cmia.cmi01 AND
                          cmi02 = g_cmia.cmi02 AND
                          cmi03 = g_cmia.cmi03 AND
                          cmi04 = g_cmia.cmi04 AND
                          cmi00 = g_cmia.cmi00 AND      #No.FUN-9B0118
                          cmi05 = g_cmi_t.cmi05 AND
                          cmi06 = g_cmi_t.cmi06 
                         #MOD-E80049-Start-Mark 
                         ##FUN-D80058--add--str--
                         #cmi13 = g_cmi_t.cmi13 AND 
                         #cmi15 = g_cmi_t.cmi15 AND
                         #cmi17 = g_cmi_t.cmi16 AND
                         #cmi19 = g_cmi_t.cmi19 AND
                         #cmi21 = g_cmi_t.cmi21 AND
                         #cmi23 = g_cmi_t.cmi23 AND
                         #cmi25 = g_cmi_t.cmi25 AND
                         #cmi27 = g_cmi_t.cmi27 AND
                         #cmi29 = g_cmi_t.cmi29 AND
                         #cmi31 = g_cmi_t.cmi31 AND
                         #cmi33 = g_cmi_t.cmi33 AND 
                         #cmi35 = g_cmi_t.cmi35
                         ##FUN-D80058--add--end--
                         #MOD-E80049-End-Mark 
                IF SQLCA.sqlcode THEN
                   CALL cl_err3("del","cmi_file",g_cmia.cmi01,g_cmia.cmi02,SQLCA.sqlcode,"","",1)  #No.FUN-660127
                   ROLLBACK WORK
                   CANCEL DELETE
                END IF
                LET g_rec_b=g_rec_b-1
                DISPLAY g_rec_b TO FORMONLY.cn2
                COMMIT WORK
            END IF
            SELECT SUM(cmi08) INTO g_cmi08_tot FROM cmi_file
                WHERE cmi01=g_cmia.cmi01 AND cmi02=g_cmia.cmi02
                AND cmi03=g_cmia.cmi03 AND cmi04=g_cmia.cmi04
                AND cmi00=g_cmia.cmi00                           #No.FUN-9B0118
            DISPLAY g_cmi08_tot TO FORMONLY.cmi08_tot
 
        ON ROW CHANGE
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               LET g_cmi[l_ac].* = g_cmi_t.*
               CLOSE t211_bcl
               ROLLBACK WORK
               EXIT INPUT
            END IF
           #CHI-CA0076---add---S
            LET l_flag2=''
            IF p_cmd = 'u' AND INT_FLAG = 0 THEN
               LET l_flag2='Y'
            END IF
           #CHI-CA0076---add---E
            IF l_lock_sw = 'Y' THEN
               CALL cl_err(g_cmi[l_ac].cmi05,-263,1)
               LET g_cmi[l_ac].* = g_cmi_t.*
            ELSE
               UPDATE cmi_file SET
                      cmi05=g_cmi[l_ac].cmi05,
                      cmi06=g_cmi[l_ac].cmi06,
                      cmi07=g_cmi[l_ac].cmi07,
                      cmi08=g_cmi[l_ac].cmi08,
                     #MOD-E80049-Start-Mark 
                     ##FUN-D80058--add--str--
                     #cmi13=g_cmi[l_ac].cmi13,
                     #cmi14=g_cmi[l_ac].cmi14,
                     #cmi15=g_cmi[l_ac].cmi15,
                     #cmi16=g_cmi[l_ac].cmi16,
                     #cmi17=g_cmi[l_ac].cmi17,
                     #cmi18=g_cmi[l_ac].cmi18,
                     #cmi19=g_cmi[l_ac].cmi19,
                     #cmi20=g_cmi[l_ac].cmi20,
                     #cmi21=g_cmi[l_ac].cmi21,
                     #cmi22=g_cmi[l_ac].cmi22,
                     #cmi23=g_cmi[l_ac].cmi23,
                     #cmi24=g_cmi[l_ac].cmi24,
                     #cmi25=g_cmi[l_ac].cmi25,
                     #cmi26=g_cmi[l_ac].cmi26,
                     #cmi27=g_cmi[l_ac].cmi27,
                     #cmi28=g_cmi[l_ac].cmi28,
                     #cmi29=g_cmi[l_ac].cmi29,
                     #cmi30=g_cmi[l_ac].cmi30,
                     #cmi31=g_cmi[l_ac].cmi31,
                     #cmi32=g_cmi[l_ac].cmi32,
                     #cmi33=g_cmi[l_ac].cmi33,
                     #cmi34=g_cmi[l_ac].cmi34,
                     #cmi35=g_cmi[l_ac].cmi35,
                     ##FUN-D80058--add--end--
                     #MOD-E80049-End-Mark 
                      cmimodu=g_user,
                      cmidate=g_today
                WHERE cmi01 = g_cmia.cmi01
                  AND cmi02 = g_cmia.cmi02
                  AND cmi03 = g_cmia.cmi03
                  AND cmi04 = g_cmia.cmi04
                  AND cmi00 = g_cmia.cmi00          #No.FUN-9B0118
                  AND cmi05 = g_cmi_t.cmi05
                  AND cmi06 = g_cmi_t.cmi06
                 #MOD-E80049-Start-Mark 
                 ##FUN-D80058--add--str--
                 #AND cmi13 = g_cmi_t.cmi13  
                 #AND cmi15 = g_cmi_t.cmi15 
                 #AND cmi17 = g_cmi_t.cmi16 
                 #AND cmi19 = g_cmi_t.cmi19 
                 #AND cmi21 = g_cmi_t.cmi21 
                 #AND cmi23 = g_cmi_t.cmi23 
                 #AND cmi25 = g_cmi_t.cmi25 
                 #AND cmi27 = g_cmi_t.cmi27 
                 #AND cmi29 = g_cmi_t.cmi29 
                 #AND cmi31 = g_cmi_t.cmi31 
                 #AND cmi33 = g_cmi_t.cmi33
                 #AND cmi35 = g_cmi_t.cmi35
                 ##FUN-D80058--add--end--
                 #MOD-E80049-End-Mark
                  
               IF SQLCA.sqlcode THEN
                   CALL cl_err3("upd","cmi_file",g_cmi_t.cmi05,g_cmi_t.cmi06,SQLCA.sqlcode,"","",1)  #No.FUN-660127
                   LET g_cmi[l_ac].* = g_cmi_t.*
               ELSE
                   MESSAGE 'UPDATE O.K'
                   COMMIT WORK
               END IF
            END IF
            SELECT SUM(cmi08) INTO g_cmi08_tot FROM cmi_file
                WHERE cmi01=g_cmia.cmi01 AND cmi02=g_cmia.cmi02
                AND cmi03=g_cmia.cmi03 AND cmi04=g_cmia.cmi04
                AND cmi00=g_cmia.cmi00                              #No.FUN-9B0118
            DISPLAY g_cmi08_tot TO FORMONLY.cmi08_tot
 
 
        AFTER ROW
            LET l_ac = ARR_CURR()
           #LET l_ac_t = l_ac   #FUN-D40030 mark
            IF INT_FLAG THEN
               CALL cl_err('',9001,0)
               LET INT_FLAG = 0
               IF p_cmd = 'u' THEN
                  LET g_cmi[l_ac].* = g_cmi_t.*
               #FUN-D40030--add--begin--					
               ELSE					
                  CALL g_cmi.deleteElement(l_ac)					
                  IF g_rec_b != 0 THEN					
                     LET g_action_choice = "detail"					
                     LET l_ac = l_ac_t					
                  END IF					
               #FUN-D40030--add--end----					
               END IF
               CLOSE t211_bcl
               ROLLBACK WORK
               EXIT INPUT
            END IF
            LET l_ac_t = l_ac  #FUN-D40030 add
            CLOSE t211_bcl
            COMMIT WORK

       #CHI-CA0076---add---S
        AFTER INPUT
            IF l_flag2 ='Y' THEN
                CALL cl_err('','axct002',1)
            END IF
       #CHI-CA0076---add---E
 
        ON ACTION CONTROLO                        #沿用所有欄位
            IF INFIELD(cmi05) AND l_ac > 1 THEN
                LET g_cmi[l_ac].* = g_cmi[l_ac-1].*
                NEXT FIELD cmi05
            END IF
 
        ON ACTION CONTROLR
           CALL cl_show_req_fields()
 
        ON ACTION CONTROLG
           CALL cl_cmdask()
 
        ON ACTION CONTROLF
           CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name #Add on 040913
           CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) #Add on 040913
 
        ON ACTION controls                                            #No.FUN-6A0092
         CALL cl_set_head_visible("","AUTO")                          #No.FUN-6A0092 
 
        ON ACTION controlp
           CASE WHEN INFIELD(cmi05) #科目
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     ="q_aag"
                  LET g_qryparam.default1 = g_cmi[l_ac].cmi05
                  LET g_qryparam.arg1     = ""     #carrier check bookno?
#                 LET g_qryparam.arg2     = "2"       #MOD-B80095 mark
                  LET g_qryparam.arg2     = "2','3"   #MOD-B80095
                  LET g_qryparam.arg3     = ""
                  IF cl_null(g_qryparam.where) THEN
                     LET g_qryparam.where=" 1=1 "
                  END IF
                  IF g_qryparam.arg1 IS NOT NULL AND
                     g_qryparam.arg1 != '' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag03 IN ('",g_qryparam.arg1 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg2 IS NOT NULL AND
                     g_qryparam.arg2 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED ,
                     " AND aag07 IN ('",g_qryparam.arg2 CLIPPED,"') "
                  END IF
                  IF g_qryparam.arg3 IS NOT NULL AND
                     g_qryparam.arg3 != ' ' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                     " AND aag01 IN ('",g_qryparam.arg3,"') "
                  END IF
                  LET g_qryparam.where = g_qryparam.where CLIPPED #," ORDER BY 2 "
                  LET g_qryparam.arg1 =  g_cmia.cmi00   #No.FUN-9B0118
                  CALL cl_create_qry() RETURNING g_cmi[l_ac].cmi05
                  DISPLAY BY NAME g_cmi[l_ac].cmi05
                  NEXT FIELD cmi05
             WHEN INFIELD(cmi06) #部門
                  CALL cl_init_qry_var()
                  LET g_qryparam.form     = "q_gem"
                  LET g_qryparam.default1 = g_cmi[l_ac].cmi06
                  CALL cl_create_qry() RETURNING g_cmi[l_ac].cmi06
                  DISPLAY BY NAME g_cmi[l_ac].cmi06
                  NEXT FIELD cmi06

            #MOD-E80049-Start-Mark      
            ##FUN-D80058--add--str--
            #WHEN INFIELD(cmi35)    #查詢專案編號
            #     CALL cl_init_qry_var()
            #     LET g_qryparam.form ="q_pja"    
            #     LET g_qryparam.default1 = g_cmi[l_ac].cmi35
            #     CALL cl_create_qry() RETURNING g_cmi[l_ac].cmi35
            #     DISPLAY BY NAME g_cmi[l_ac].cmi35       
            #     NEXT FIELD cmi35
            #WHEN INFIELD(cmi13)    #查詢異動碼-1
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'1','i',g_cmi[l_ac].cmi13,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi13
            #     DISPLAY g_cmi[l_ac].cmi13 TO cmi13
            #     NEXT FIELD cmi13

            #  WHEN INFIELD(cmi15)    #查詢異動碼-2
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'2','i',g_cmi[l_ac].cmi15,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi15
            #     DISPLAY g_cmi[l_ac].cmi15 TO cmi15
            #     NEXT FIELD cmi15

            #  WHEN INFIELD(cmi17)    #查詢異動碼-3
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'3','i',g_cmi[l_ac].cmi17,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi17
            #     DISPLAY g_cmi[l_ac].cmi17 TO cmi17
            #     NEXT FIELD cmi17

            #  WHEN INFIELD(cmi19)    #查詢異動碼-4
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'4','i',g_cmi[l_ac].cmi19,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi19
            #     DISPLAY g_cmi[l_ac].cmi16 TO cmi19
            #     NEXT FIELD cmi19

            #  WHEN INFIELD(cmi21)    #查詢異動碼-5
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'5','i',g_cmi[l_ac].cmi21,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi21
            #     DISPLAY g_cmi[l_ac].cmi21 TO cmi21
            #     NEXT FIELD cmi21

            #  WHEN INFIELD(cmi23)    #查詢異動碼-6
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'6','i',g_cmi[l_ac].cmi23,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi23
            #     DISPLAY g_cmi[l_ac].cmi23 TO cmi23
            #     NEXT FIELD cmi23

            #  WHEN INFIELD(cmi25)    #查詢異動碼-7
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'7','i',g_cmi[l_ac].cmi25,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi25
            #     DISPLAY g_cmi[l_ac].cmi25 TO cmi25
            #     NEXT FIELD cmi25

            #  WHEN INFIELD(cmi27)    #查詢異動碼-8
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'8','i',g_cmi[l_ac].cmi27,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi27
            #     DISPLAY g_cmi[l_ac].cmi27 TO cmi27
            #     NEXT FIELD cmi27
            #  WHEN INFIELD(cmi29)    #查詢異動碼-9
            #     CALL cl_init_qry_var()
            #      LET g_qryparam.form ="q_pjb4"  
            #      LET g_qryparam.arg1 = g_cmi[l_ac].cmi35  
            #      LET g_qryparam.default1 = g_cmi[l_ac].cmi29
            #      CALL cl_create_qry() RETURNING g_cmi[l_ac].cmi29
            #      DISPLAY g_cmi[l_ac].cmi29 TO cmi29
            #      NEXT FIELD cmi29
            #  WHEN INFIELD(cmi31)    #查詢異動碼-10
            #     CALL cl_init_qry_var()
            #     LET g_qryparam.form ="q_azf01a"  
            #     LET g_qryparam.arg1 = '7'        
            #     CALL cl_create_qry() RETURNING g_cmi[l_ac].cmi31
            #     DISPLAY g_cmi[l_ac].cmi31 TO cmi31
            #  WHEN INFIELD(cmi33)    #關係人
            #     CALL s_ahe_qry(g_cmi[l_ac].cmi05,'99','i',g_cmi[l_ac].cmi33,g_cmi00)  
            #        RETURNING g_cmi[l_ac].cmi33
            #     DISPLAY g_cmi[l_ac].cmi33 TO cmi33
            #     NEXT FIELD cmi33
            #MOD-E80049-End-Mark      
                  OTHERWISE EXIT CASE
                  
           END CASE
 
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT
 
        ON ACTION about         #MOD-4C0121
           CALL cl_about()      #MOD-4C0121
   
        ON ACTION help          #MOD-4C0121
           CALL cl_show_help()  #MOD-4C0121
 
    END INPUT

   #MOD-E80049-Start-Mark 
   ##FUN-D80058--add--str--
   #LET g_sql =
   #   "SELECT cmi05,cmi06,cmi07,cmi08,",
   #   "       cmi35,cmi13,cmi14,cmi15,",
   #   "       cmi16,cmi17,cmi18,cmi19,",
   #   "       cmi20,cmi21,cmi22,cmi23,",
   #   "       cmi24,cmi25,cmi26,cmi27,",
   #   "       cmi28,cmi29,cmi30,cmi31,",
   #   "       cmi32,cmi33,cmi34",
   #   " FROM cmi_file",
   #   " WHERE cmi01 = '",g_cmi01,"' AND ",
   #   " cmi02='",g_cmi02,"' AND  cmi03='",g_cmi03,"' AND cmi04='",g_cmi04,"'",
   #   " AND cmi00 = '",g_cmi00,"'",                  
   #   " ORDER BY 1"
   #PREPARE t211_pre1 FROM g_sql      #預備一下
   #IF SQLCA.SQLCODE THEN
   # 	CALL cl_err('FILL PREPARE:',SQLCA.SQLCODE,1)
   #    RETURN
   #END IF
   #DECLARE t211_cus1 CURSOR FOR t211_pre1
   #LET l_flag_t = 0
   #LET i = 1
   #FOREACH t211_cus1 INTO g_cmi[i].* 
   #   LET l_flag = 0
   #   IF NOT cl_null(g_cmi[i].cmi13) THEN 
   #      LET l_flag = 1
   #   END IF 
   #   IF NOT cl_null(g_cmi[i].cmi15) THEN 
   #      LET l_flag = 2
   #   END IF 
   #   IF NOT cl_null(g_cmi[i].cmi17) THEN 
   #      LET l_flag = 3
   #   END IF 
   #   IF NOT cl_null(g_cmi[i].cmi19) THEN 
   #      LET l_flag = 4
   #   END IF 
   #   IF NOT cl_null(g_cmi[i].cmi21) THEN 
   #      LET l_flag = 5
   #   END IF 
   #   IF NOT cl_null(g_cmi[i].cmi23) THEN 
   #      LET l_flag = 6
   #   END IF
   #   IF NOT cl_null(g_cmi[i].cmi25) THEN 
   #      LET l_flag = 7
   #   END IF
   #   IF NOT cl_null(g_cmi[i].cmi27) THEN 
   #      LET l_flag = 8
   #   END IF
   #   IF NOT cl_null(g_cmi[i].cmi29) THEN 
   #      LET l_flag = 9
   #   END IF
   #   IF NOT cl_null(g_cmi[i].cmi31) THEN 
   #      LET l_flag = 10
   #   END IF
   #   IF NOT cl_null(g_cmi[i].cmi33) THEN 
   #      LET l_flag = 11
   #   END IF
   #   IF l_flag >= l_flag_t THEN 
   #      LET l_flag_t = l_flag
   #   END IF  
   #   LET i = i + 1
   #END FOREACH  
   #CALL t211_visible(l_flag_t)    #FUN-D80058 add
   ##FUN-D80058--add--end--
   #MOD-E80049-End-Mark 
    CLOSE t211_bcl
    COMMIT WORK
END FUNCTION
 
 FUNCTION t211_cmi05(p_code,p_bookno)             #No.FUN-730057
  DEFINE p_code     LIKE aag_file.aag01
  DEFINE p_bookno   LIKE aag_file.aag00           #No.FUN-730057  
  DEFINE l_aagacti  LIKE aag_file.aagacti
  DEFINE l_aag07    LIKE aag_file.aag07
  DEFINE l_aag09    LIKE aag_file.aag09
  DEFINE l_aag03    LIKE aag_file.aag03

  #MOD-E80049-Start-ReMark
   #FUN-D80058--mark--str--
    SELECT aag03,aag07,aag09,aagacti
      INTO l_aag03,l_aag07,l_aag09,l_aagacti
      FROM aag_file
     WHERE aag01=p_code
       AND aag00=p_bookno      #No.FUN-730057
   #FUN-D80058--mark--end--
  #MOD-E80049-End-ReMark 

  #MOD-E80049-Start-Mark
  ##FUN-D80058--add--str--
  #SELECT aag02,aag03,aag07,aagacti,
  #       aag05,aag15,aag16,aag17,aag18,aag151,
  #       aag161,aag171,aag181,aag06,aag21,aag23,aag222,aag20,
  #       aag31,aag32,aag33,aag34,aag35,aag36,aag37,
  #       aag311,aag321,aag331,aag341,aag351,aag361,aag371
  #  INTO l_aag02,l_aag03,l_aag07,l_aagacti,
  #       m_aag05,m_aag15,m_aag16,m_aag17,m_aag18,
  #       m_aag151,m_aag161,m_aag171,m_aag181,
  #        m_aag06,m_aag21,m_aag23,m_aag222,m_aag20,
  #       m_aag31,m_aag32,m_aag33,m_aag34,m_aag35,m_aag36,m_aag37,
  #       m_aag311,m_aag321,m_aag331,m_aag341,m_aag351,m_aag361,m_aag371
  #  FROM aag_file
  # WHERE aag01 = p_code
  #   AND aag00 = p_bookno 
  # #FUN-D80058--add--end--
  #MOD-E80049-End-Mark
   
   CASE WHEN STATUS=100         LET g_errno='agl-001'  #No.7926
        WHEN l_aagacti='N'      LET g_errno='9028'
         WHEN l_aag07  = '1'      LET g_errno = 'agl-015'
         WHEN l_aag03  = '4'      LET g_errno = 'agl-177'
         WHEN l_aag03 != '2'      LET g_errno = 'agl-201'
         WHEN l_aag09  = 'N'      LET g_errno = 'agl-214'
        OTHERWISE LET g_errno=SQLCA.sqlcode USING '----------'
   END CASE
END FUNCTION
 
FUNCTION t211_b_askkey()
DEFINE
    l_wc            LIKE type_file.chr1000       #No.FUN-680122CHAR(200)
 
    CALL cl_opmsg('q')
	CLEAR cmi03,cmi04,cmi05
    CONSTRUCT l_wc ON cmi05,cmi06,cmi07,cmi08     #螢幕上取條件
       FROM s_cmi[1].cmi05,s_cmi[1].cmi06,s_cmi[1].cmi07,s_cmi[1].cmi08
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE CONSTRUCT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
 
                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()
    END CONSTRUCT
    IF INT_FLAG THEN RETURN END IF
    CALL t211_b_fill(l_wc)
    CALL cl_opmsg('b')
END FUNCTION
 
FUNCTION t211_t()
  DEFINE l_sql LIKE type_file.chr1000       #No.FUN-680122CHAR(600) 
  DEFINE l_sql1 LIKE type_file.chr1000      #No.FUN-680122CHAR(600) 
  DEFINE p_row,p_col LIKE type_file.num5    #No.FUN-680122 SMALLINT
  DEFINE l_tot LIKE aao_file.aao05
  DEFINE l_dbs LIKE azp_file.azp03
  DEFINE l_plant LIKE type_file.chr10       #FUN-980020
 
     LET p_row = 6 LET p_col = 6
 
     OPEN WINDOW t211_w3 AT p_row,p_col WITH FORM
          "axc/42f/axct211_t"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
     CALL cl_ui_locale("axct211_t")
 
     INITIALIZE g_cmia.* TO NULL
     CONSTRUCT BY NAME g_wc ON
         aao01,aao02
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE CONSTRUCT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
 
                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()
     END CONSTRUCT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211_w3 RETURN END IF
     INPUT BY NAME g_cmia.cmi01,g_cmia.cmi02,g_cmia.cmi03,g_cmia.cmi00,g_cmia.cmi12,g_cmia.cmi04   #No.FUN-9B0118
     WITHOUT DEFAULTS
     AFTER FIELD cmi01
        IF NOT cl_null(g_cmia.cmi01) THEN
           IF g_cmia.cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(g_cmia.cmi01,'axc-095',0)
              NEXT FIELD cmi01
           END IF
        END IF
     AFTER FIELD cmi02
        IF NOT cl_null(g_cmia.cmi02) THEN
           IF g_cmia.cmi01 = g_ccz.ccz01 AND g_cmia.cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(g_cmia.cmi02,'axc-095',0)   #No:MOD-9C0025 modify
              NEXT FIELD cmi02    #No:MOD-9C0025 modify
           END IF
        END IF
 
     AFTER FIELD cmi03
        IF cl_null(g_cmia.cmi03) THEN LET g_cmia.cmi03=' ' END IF
        IF NOT cl_null(g_cmia.cmi03) THEN                                       
           IF g_aaz.aaz90='Y' THEN                                              
              IF NOT s_costcenter_chk(g_cmia.cmi03) THEN                        
                 NEXT FIELD cmi03                                               
              END IF                                                            
           ELSE                                                                 
              CALL t211_cmi03(g_cmia.cmi03)                                     
              IF NOT cl_null(g_errno) THEN                                      
                 CALL cl_err(g_cmia.cmi03,g_errno,0)                            
                 NEXT FIELD cmi03                                               
              END IF                                                            
           END IF                                                               
        END IF                                                                  

        AFTER FIELD cmi00    #帐套
            IF NOT cl_null(g_cmia.cmi00) THEN
               CALL t211_cmi00('a',g_cmia.cmi00)
               IF NOT cl_null(g_errno) THEN
                  CALL cl_err(g_cmia.cmi00,g_errno,0)
                  NEXT FIELD cmi00
               END IF
            END IF

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
 
     END INPUT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211_w3 RETURN END IF
     SELECT ccz12 INTO l_ccz12 FROM ccz_file
     IF NOT t211_chk_q310(g_cmia.cmi00,g_cmia.cmi01,g_cmia.cmi02) THEN  #MOD-DB0167 add
        CLOSE WINDOW t211_w3  #MOD-DB0167 add
        RETURN                #MOD-DB0167 add
     END IF                   #MOD-DB0167 add
 
    #取參數設定ccz11,ccz12總帳所在工廠編號,帳別
     LET l_plant = g_ccz.ccz11           #FUN-980020
     #SELECT azp03 INTO l_dbs FROM azp_file where azp01=g_ccz.ccz11   #FUN-A50102
     #LET l_dbs = s_dbstring(l_dbs)                                   #FUN-A50102
     #LET l_dbs=s_dbstring(l_dbs CLIPPED) #TQC-940184                 #FUN-A50102 

     LET l_sql =" SELECT aao01,aao02,aao05,aao06,aag06",
                #"  FROM ",l_dbs CLIPPED,"aao_file, ",
                #          l_dbs CLIPPED,"aag_file ",
                "  FROM ",cl_get_target_table(g_ccz.ccz11,'aao_file'),",",  #FUN-A50102
                          cl_get_target_table(g_ccz.ccz11,'aag_file'),      #FUN-A50102
                " WHERE aao00='",g_cmia.cmi00,"' AND aao03='",g_cmia.cmi01,"'",     #No.FUN-9B0118
                " AND aag01=aao01 AND aag00=aao00  AND aag07 !='1'",   #非統制帳戶       #No.FUN-730057  #No.FUN-9B0118
                " AND aao04='",g_cmia.cmi02,"' AND ",g_wc  CLIPPED

 	 CALL cl_replace_sqldb(l_sql) RETURNING l_sql        #FUN-920032
     CALL cl_parse_qry_sql(l_sql,g_ccz.ccz11) RETURNING l_sql #FUN-A50102
     PREPARE t211_p2 FROM l_sql
     DECLARE t211_cur2 CURSOR FOR t211_p2
     LET l_sql1 =" SELECT COUNT(*)  FROM cmi_file,",
                             #l_dbs CLIPPED,"aao_file ",
                             cl_get_target_table(g_ccz.ccz11,'aao_file'),  #FUN-A50102
                " WHERE cmi01='",g_cmia.cmi01,"' AND cmi02='",g_cmia.cmi02,"'",
                " AND cmi03='",g_cmia.cmi03,"' AND cmi04='",g_cmia.cmi04,"' ",
                " AND cmi00='",g_cmia.cmi00,"' AND aao00 = cmi00 ",           #No.FUN-9B0118
                " AND aao01=cmi05 AND aao02=cmi06 AND aao03=cmi01 AND ",
                " aao04=cmi02 AND ",g_wc
     CALL cl_replace_sqldb(l_sql1) RETURNING l_sql1             #FUN-A50102
     CALL cl_parse_qry_sql(l_sql1,g_ccz.ccz11) RETURNING l_sql1 #FUN-A50102           
     PREPARE t211_count FROM l_sql1
     DECLARE t211_cur3 CURSOR FOR t211_count
     OPEN t211_cur3
     FETCH t211_cur3 INTO g_cnt
     IF g_cnt > 0 THEN
        IF NOT cl_confirm('axc-096') THEN CLOSE WINDOW t211_w3 RETURN END IF
     END IF
     MESSAGE "WORKING !"
     FOREACH t211_cur2 INTO l_aao01,l_aao02,l_aao05,l_aao06,l_aag06   
        DELETE FROM cmi_file WHERE cmi01=g_cmia.cmi01          #先delete 再產生
             AND cmi02=g_cmia.cmi02 AND cmi03=g_cmia.cmi03
             AND cmi04=g_cmia.cmi04 AND cmi05=l_aao01 AND cmi06=l_aao02  
             AND cmi00=g_cmia.cmi00                            #No.FUN-9B0118
        SELECT aag02 INTO l_aag02 FROM aag_file WHERE aag01=l_aao01  
                                                  AND aag00=g_cmia.cmi00  #No.FUN-9B0118
        IF cl_null(l_aao05) THEN LET l_aao05 = 0 END IF    
        IF cl_null(l_aao06) THEN LET l_aao06 = 0 END IF    
        IF l_aag06='1' THEN           #正常餘額為借餘時
           LET l_tot=l_aao05-l_aao06     
        ELSE
           LET l_tot=l_aao06-l_aao05     
        END IF
        #No.MOD-C40097  --Begin
        IF l_tot = 0 THEN
           CONTINUE FOREACH
        END IF
        #No.MOD-C40097  --End
        INSERT INTO cmi_file(cmi01,cmi02,cmi03,cmi04,cmi05,cmi06,cmi07,
                             cmi08,cmi09,cmi10,
                            #MOD-E80049-Start-Mark
                            #cmi13,cmi14,cmi15,cmi16,       #FUN-D80058 add cmi13,cmi14,cmi15,cmi16,
                            #cmi17,cmi18,cmi19,cmi20,cmi21,cmi22,cmi23,       #FUN-D80058 add
                            #cmi24,cmi25,cmi26,cmi27,cmi28,cmi29,cmi30,       #FUN-D80058 add
                            #cmi31,cmi32,cmi33,cmi34,cmi35,                   #FUN-D80058 add
                            #MOD-E80049-End-Mark 
                             cmiacti,cmiuser,cmigrup,
                             cmimodu,cmidate,cmi00,cmi12,cmioriu,cmiorig,cmilegal)   #MOD-C30598 cmiori要改為cmiorig  #No.MOD-470041   #FUN-A50075 add legal
              VALUES (g_cmia.cmi01,g_cmia.cmi02,g_cmia.cmi03,
              g_cmia.cmi04,l_aao01,l_aao02,l_aag02,l_tot,'','','Y',
             #'','','','','','','','','','','','','','','','','','','','','','','',  #FUN-D80058 add #MOD-E80049 Mark
              g_user,g_grup,'',g_today,g_cmia.cmi00,g_cmia.cmi12, g_user, g_grup,g_legal)         #No.FUN-9B0118      #No.FUN-980030 10/01/04  insert columns oriu, orig  #FUN-A50075 add legal
     END FOREACH
     MESSAGE ""
     CLOSE WINDOW t211_w3
END FUNCTION
 
FUNCTION t211_copy()
  DEFINE l_sql LIKE type_file.chr1000       #No.FUN-680122CHAR(600) 
  DEFINE g_cmia_new RECORD LIKE cmi_file.*
  DEFINE l_cmi      RECORD LIKE cmi_file.*
  DEFINE p_row,p_col     LIKE type_file.num5          #No.FUN-680122 SMALLINT
 
     IF g_cmi01 IS NULL THEN RETURN END IF
     IF g_cmi02 IS NULL THEN RETURN END IF
     IF g_cmi03 IS NULL THEN RETURN END IF
     IF g_cmi04 IS NULL THEN RETURN END IF
     IF g_cmi00 IS NULL THEN RETURN END IF    #No.FUN-9B0118
     LET p_row = 6 LET p_col = 6
 
     OPEN WINDOW t211_w5 AT p_row,p_col WITH FORM
         "axc/42f/axct211_c"   ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
     CALL cl_ui_locale("axct211_c")
     INITIALIZE g_cmia_new.* TO NULL
     INPUT BY NAME g_cmia_new.cmi01,g_cmia_new.cmi02,g_cmia_new.cmi03,
                   g_cmia_new.cmi00,g_cmia_new.cmi12,g_cmia_new.cmi04      #No.FUN-9B0118
     WITHOUT DEFAULTS
     AFTER FIELD cmi01
        IF cl_null(g_cmia_new.cmi01) THEN NEXT FIELD cmi01 END IF
        IF g_cmia_new.cmi01 < g_ccz.ccz01 THEN
           CALL cl_err(g_cmia_new.cmi01,'axc-095',0)
           NEXT FIELD cmi01
        END IF
     AFTER FIELD cmi02
        IF cl_null(g_cmia_new.cmi02) THEN NEXT FIELD cmi02 END IF
        IF g_cmia_new.cmi01 = g_ccz.ccz01 AND g_cmia_new.cmi02 < g_ccz.ccz02 THEN
           CALL cl_err(g_cmia_new.cmi02,'axc-095',0) #No:MOD-9C0025 modify
           NEXT FIELD cmi02    #No:MOD-9C0025 modify
        END IF
 
     AFTER FIELD cmi03
        IF cl_null(g_cmia_new.cmi03) THEN LET g_cmia_new.cmi03 = ' ' END IF
        IF NOT cl_null(g_cmia_new.cmi03) THEN                                   
           IF g_aaz.aaz90='Y' THEN                                              
              IF NOT s_costcenter_chk(g_cmia_new.cmi03) THEN                    
                 NEXT FIELD cmi03                                               
              END IF                                                            
           ELSE                                                                 
              CALL t211_cmi03(g_cmia_new.cmi03)                                 
              IF NOT cl_null(g_errno) THEN                                      
                 CALL cl_err(g_cmia_new.cmi03,g_errno,0)                        
                 NEXT FIELD cmi03                                               
              END IF                                                            
           END IF                                                               
        END IF                                                                  

     AFTER FIELD cmi04
        IF cl_null(g_cmia_new.cmi04) OR g_cmia_new.cmi04 NOT MATCHES '[123456]'
           THEN NEXT FIELD cmi04
        END IF

     AFTER FIELD cmi00    #帐套
         IF NOT cl_null(g_cmia_new.cmi00) THEN
            CALL t211_cmi00('a',g_cmia_new.cmi00)
            IF NOT cl_null(g_errno) THEN
               CALL cl_err(g_cmia_new.cmi00,g_errno,0)
               NEXT FIELD cmi00
            END IF
         END IF

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
 
     END INPUT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211_w5 RETURN END IF
     LET l_sql =" SELECT *  FROM cmi_file",
                " WHERE cmi01='",g_cmi01,"' AND cmi02='",g_cmi02,"'",
                " AND cmi03='",g_cmi03,"' AND cmi04='",g_cmi04,"' ",
                " AND cmi00='",g_cmi00,"' "                             #No.FUN-9B0118
 
     PREPARE t211_copy  FROM l_sql
     DECLARE t211_cur5 CURSOR FOR t211_copy
     LET l_sql =" SELECT COUNT(*)  FROM cmi_file ",
                " WHERE cmi01='",g_cmia_new.cmi01,"' AND cmi02='",g_cmia_new.cmi02,"'",
                " AND cmi03='",g_cmia_new.cmi03,"' AND cmi04='",g_cmia_new.cmi04,"' ",
                " AND cmi00='",g_cmia_new.cmi00,"'"                     #No.FUN-9B0118

     PREPARE t211_count1 FROM l_sql
     DECLARE t211_cur6 CURSOR FOR t211_count1
     OPEN t211_cur6
     FETCH t211_cur6 INTO g_cnt
     IF g_cnt > 0 THEN
        IF NOT cl_confirm('axc-096') THEN CLOSE WINDOW t211_w5 RETURN END IF
        IF NOT t211_chk_q310(g_cmia_new.cmi00,g_cmia_new.cmi01,g_cmia_new.cmi02) THEN  #MOD-DB0167 add
           CLOSE WINDOW t211_w5  #MOD-DB0167 add
           RETURN                #MOD-DB0167 add
        END IF                   #MOD-DB0167 add
        DELETE FROM cmi_file WHERE cmi01=g_cmia_new.cmi01    #先delete 再產生
             AND cmi02=g_cmia_new.cmi02 AND cmi03=g_cmia_new.cmi03
             AND cmi04=g_cmia_new.cmi04
             AND cmi00=g_cmia_new.cmi00                      #No.FUN-9B0118
        IF SQLCA.SQLERRD[3] =0 OR STATUS THEN
           CALL cl_err3("del","cmi_file",g_cmia_new.cmi01,g_cmia_new.cmi02,STATUS,"","del cmi",1)  #No.FUN-660127
           CLOSE WINDOW t211_w5
           RETURN
        END IF
     END IF
     MESSAGE "WORKING !"
     FOREACH t211_cur5 INTO l_cmi.*
           LET l_cmi.cmi01=g_cmia_new.cmi01
           LET l_cmi.cmi02=g_cmia_new.cmi02
           LET l_cmi.cmi03=g_cmia_new.cmi03
           LET l_cmi.cmi04=g_cmia_new.cmi04
           LET l_cmi.cmi00=g_cmia_new.cmi00     #No.FUN-9B0118
           LET l_cmi.cmi12=g_cmia_new.cmi12     #No.FUN-9B0118
           LET l_cmi.cmiacti='Y'
           LET l_cmi.cmiuser=g_user
           LET l_cmi.cmigrup=g_grup
           LET l_cmi.cmimodu=''
           LET l_cmi.cmidate=g_today
           LET l_cmi.cmioriu = g_user      #No.FUN-980030 10/01/04
           LET l_cmi.cmiorig = g_grup      #No.FUN-980030 10/01/04
           LET l_cmi.cmilegal = g_legal    #FUN-A50075 
           INSERT INTO cmi_file VALUES (l_cmi.* )
     END FOREACH
     MESSAGE ""
     CLOSE WINDOW t211_w5
     #FUN-C80046---begin
     LET g_cmi01=g_cmia_new.cmi01
     LET g_cmi02=g_cmia_new.cmi02
     LET g_cmi03=g_cmia_new.cmi03
     LET g_cmi04=g_cmia_new.cmi04
     LET g_cmi00=g_cmia_new.cmi00    
     LET g_cmi12=g_cmia_new.cmi12 
     CALL t211_show()
     #FUN-C80046---end
END FUNCTION
 
FUNCTION t211_w()
  DEFINE l_sql LIKE type_file.chr1000       #No.FUN-680122CHAR(600) 
  DEFINE p_row,p_col     LIKE type_file.num5          #No.FUN-680122 SMALLINT
  DEFINE l_tot           LIKE aao_file.aao05
  DEFINE g_type,l_flag   LIKE type_file.chr1          #No.FUN-680122 VARCHAR(1)
  DEFINE bdate,edate     LIKE type_file.dat           #No.FUN-680122 DATE
  DEFINE l_tlf01         LIKE tlf_file.tlf01
  DEFINE l_tlf10         LIKE tlf_file.tlf10
  DEFINE l_tlf19         LIKE tlf_file.tlf19
  DEFINE l_tlf905        LIKE tlf_file.tlf905
  DEFINE l_tlf906        LIKE tlf_file.tlf906
  DEFINE l_tlf21         LIKE tlf_file.tlf21     #FUN-4C0005
  DEFINE l_tlf21_tot     LIKE tlf_file.tlf21     #FUN-4C0005
  DEFINE last_yy,last_mm,this_yy,this_mm LIKE type_file.num5          #No.FUN-680122 SMALLINT
  DEFINE l_cmi           RECORD LIKE cmi_file.*
  DEFINE l_ccc23         LIKE ccc_file.ccc23
  DEFINE l_name          LIKE type_file.chr20         #No.FUN-680122 VARCHAR(20)
  DEFINE sr RECORD
         tlf01  LIKE tlf_file.tlf01,
         tlf19  LIKE tlf_file.tlf19,
         tlf905 LIKE tlf_file.tlf905,
         tlf906 LIKE tlf_file.tlf906,
         tlf10  LIKE tlf_file.tlf10,
         tlf21  LIKE tlf_file.tlf21
         END RECORD
  DEFINE l_tot1,l_tot2   LIKE cmi_file.cmi08   #No.FUN-840047  
 
     LET p_row = 6 LET p_col = 6
 
     OPEN WINDOW t211_w3 AT p_row,p_col WITH FORM
          "axc/42f/axct211_w"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
     CALL cl_ui_locale("axct211_w")
     INITIALIZE g_cmia.* TO NULL
     CONSTRUCT BY NAME g_wc ON tlf01,tlf19
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE CONSTRUCT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()
     END CONSTRUCT
     IF INT_FLAG THEN
        LET INT_FLAG = 0
        CLOSE WINDOW t211_w3
        RETURN
     END IF
     IF cl_null(g_wc) THEN
        LET g_wc = ' 1=1'
     END IF
 
     INPUT BY NAME g_cmia.cmi01,g_cmia.cmi02,g_cmia.cmi03,g_cmia.cmi00,g_cmia.cmi12,g_type  #No.FUN-9B0118
     WITHOUT DEFAULTS
     AFTER FIELD cmi01
        IF NOT cl_null(g_cmia.cmi01) THEN
           IF g_cmia.cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(g_cmia.cmi01,'axc-095',0)
              NEXT FIELD cmi01
           END IF
        END IF
     AFTER FIELD cmi02
        IF NOT cl_null(g_cmia.cmi02) THEN
           IF g_cmia.cmi01 = g_ccz.ccz01 AND g_cmia.cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(g_cmia.cmi02,'axc-095',0)  #No:MOD-9C0025 modify
              NEXT FIELD cmi02   #No:MOD-9C0025 modify
           END IF
        END IF
 
     AFTER FIELD cmi03
        IF cl_null(g_cmia.cmi03) THEN
           LET g_cmia.cmi03 = ' '
        END IF
        IF NOT cl_null(g_cmia.cmi03) THEN                                       
           IF g_aaz.aaz90='Y' THEN                                              
              IF NOT s_costcenter_chk(g_cmia.cmi03) THEN                        
                 NEXT FIELD cmi03                                               
              END IF                                                            
           ELSE                                                                 
              CALL t211_cmi03(g_cmia.cmi03)                                     
              IF NOT cl_null(g_errno) THEN                                      
                 CALL cl_err(g_cmia.cmi03,g_errno,0)                            
                 NEXT FIELD cmi03                                               
              END IF                                                            
           END IF                                                               
        END IF                                                                  

       AFTER FIELD cmi00    #帐套
           IF NOT cl_null(g_cmia.cmi00) THEN
              CALL t211_cmi00('a',g_cmia.cmi00)
              IF NOT cl_null(g_errno) THEN
                 CALL cl_err(g_cmia.cmi00,g_errno,0)
                 NEXT FIELD cmi00
              END IF
           END IF

        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
 
     END INPUT
     IF INT_FLAG THEN
        LET INT_FLAG = 0
        CLOSE WINDOW t211_w3
        RETURN
     END IF
 
     CALL s_azm(g_cmia.cmi01,g_cmia.cmi02)
     RETURNING l_flag, bdate, edate #得出起始日與截止日
 
     LET last_mm = g_cmia.cmi02 - 1
     IF last_mm = 0 THEN
        LET last_yy = g_cmia.cmi01 - 1 LET last_mm = 12
     ELSE
        LET last_yy = g_cmia.cmi01
     END IF
     IF NOT t211_chk_q310(g_cmia.cmi00,g_cmia.cmi01,g_cmia.cmi02) THEN  #MOD-DB0167 add
        CLOSE WINDOW t211_w3  #MOD-DB0167 add
        RETURN                #MOD-DB0167 add
     END IF                   #MOD-DB0167 add
 
     DELETE FROM cmi_file WHERE cmi01 = g_cmia.cmi01
                            AND cmi02 = g_cmia.cmi02
                            AND cmi03 = g_cmia.cmi03
                            AND cmi00 = g_cmia.cmi00     #No.FUN-9B0118
                            AND cmi05 = 'EXP'
    #替換inb902-->inb908,inb903-->inb909,inb904-->inb910
     UPDATE inb_file SET inb908 = 0,  #TQC-970033 add                          
                         inb909 = 0,  #TQC-970033 add
                         inb910 = ''
       WHERE inb908 = g_cmia.cmi01
         AND inb909 = g_cmia.cmi02
         AND inb910 = g_cmia.cmi03
 
     LET l_sql = "SELECT tlf01,tlf19,tlf905,tlf906,(tlf10*tlf907*-1),(tlf21*tlf907*-1)  ",
                " FROM tlf_file,ima_file , smy_file ,inb_file, ",
                " gem_file  ",
                "  WHERE tlf06 BETWEEN '",bdate,"' AND '",edate,"' ",
                "AND (tlf13='aimt301' OR tlf13='aimt311' ",
                "  OR tlf13='aimt303' OR tlf13='aimt313'  ",      #No.MOD-710128 add    
                "  OR tlf13='aimt302' OR tlf13='aimt312') ",
                " AND tlf61 = smyslip  ",
                " AND smydmy1 = 'Y' ",
                " AND inb01 = tlf905 AND inb03 = tlf906 ",
                " AND tlf19 =gem01 AND ima01 = tlf01  ",
                " AND tlf902 NOT IN (SELECT jce02 FROM jce_file) ",
                " AND gem07 = 'P' ",
                " AND ",g_wc,             #MOD-AC0138 add
                " ORDER BY 1 "
 
     PREPARE t211_pre7 FROM l_sql
     DECLARE t211_cur7 CURSOR FOR t211_pre7
     MESSAGE "WORKING !"
     IF g_type = '1' THEN
        LET this_yy = last_yy LET this_mm = last_mm
     END IF
     IF g_type = '2' THEN
        LET this_yy = g_cmia.cmi01
        LET this_mm = g_cmia.cmi02
     END IF
     LET l_tlf21_tot = 0
     LET l_flag = 'N'
     CALL cl_del_data(l_table) 
     SELECT zz05 INTO g_zz05 FROM zz_file WHERE zz01 = 'axct211'     
     SELECT zo02 INTO g_company FROM zo_file WHERE zo01 = g_lang  #No.FUN-670067
  
 
     FOREACH t211_cur7 INTO sr.*
        IF sr.tlf21 IS NULL THEN LET sr.tlf21 = 0 END IF
        LET l_ccc23 = 0     #No.CHI-930046 add
                 SELECT ccc23 INTO l_ccc23 FROM ccc_file
                  WHERE ccc01 = sr.tlf01
                    AND ccc02 = this_yy
                    AND ccc03 = this_mm
                 IF STATUS OR cl_null(l_ccc23) THEN
                    SELECT cca23 INTO l_ccc23 FROM cca_file
                     WHERE cca01 = sr.tlf01
                       AND cca02 = this_yy
                       AND cca03 = this_mm
                 END IF
                 IF cl_null(l_ccc23) THEN LET l_ccc23 = 0 END IF
                 IF sr.tlf21 = 0 THEN
                    LET sr.tlf21 = (sr.tlf10 * l_ccc23)
                 END IF
                 INITIALIZE l_cmi.* TO NULL          # Default condition        
                 LET l_cmi.cmi01 = g_cmia.cmi01                                 
                 LET l_cmi.cmi02 = g_cmia.cmi02                                 
                 LET l_cmi.cmi03 = g_cmia.cmi03                                 
                 LET l_cmi.cmi00 = g_cmia.cmi00           #No.FUN-9B0118
                 LET l_cmi.cmi12 = g_cmia.cmi12           #No.FUN-9B0118
                 LET l_cmi.cmi04 = '2'                                          
                 LET l_cmi.cmi05 = 'EXP'
                 LET l_cmi.cmi06 =  ' '
                 LET l_cmi.cmi07 = cl_getmsg('axc-036',g_lang)                  
                 LET l_cmi.cmi08 = sr.tlf21   #CHI-920036
                 LET l_cmi.cmioriu = g_user      #No.FUN-980030 10/01/04
                 LET l_cmi.cmiorig = g_grup      #No.FUN-980030 10/01/04
                 LET l_cmi.cmilegal = g_legal    #FUN-A50075
                #MOD-E80049-Start-Mark 
                ##FUN-D80058--add--str--
                #LET l_cmi.cmi13 = NULL
                #LET l_cmi.cmi14 = NULL 
                #LET l_cmi.cmi15 = NULL
                #LET l_cmi.cmi16 = NULL
                #LET l_cmi.cmi17 = NULL
                #LET l_cmi.cmi18 = NULL
                #LET l_cmi.cmi19 = NULL
                #LET l_cmi.cmi20 = NULL
                #LET l_cmi.cmi21 = NULL
                #LET l_cmi.cmi22 = NULL
                #LET l_cmi.cmi23 = NULL
                #LET l_cmi.cmi24 = NULL
                #LET l_cmi.cmi25 = NULL
                #LET l_cmi.cmi26 = NULL
                #LET l_cmi.cmi27 = NULL
                #LET l_cmi.cmi28 = NULL
                #LET l_cmi.cmi29 = NULL
                #LET l_cmi.cmi30 = NULL
                #LET l_cmi.cmi31 = NULL
                #LET l_cmi.cmi32 = NULL
                #LET l_cmi.cmi33 = NULL
                #LET l_cmi.cmi34 = NULL
                #LET l_cmi.cmi35 = NULL
                ##FUN-D80058--add--end--
                #MOD-E80049-End-Mark 
                 INSERT INTO cmi_file VALUES(l_cmi.*)                           
                 IF cl_sql_dup_value(SQLCA.SQLCODE) THEN
                    UPDATE cmi_file SET cmi08 = cmi08 + sr.tlf21
                               WHERE cmi01 = g_cmia.cmi01
                                 AND cmi02 = g_cmia.cmi02
                                 AND cmi03 = g_cmia.cmi03
                                 AND cmi00 = g_cmia.cmi00      #No.FUN-9B0118
                                 AND cmi04 = '2'
                                 AND cmi05 = 'EXP'
                    IF STATUS OR SQLCA.SQLERRD[3]=0 THEN
                       MESSAGE " update EXP failure "
                    END IF
                 ELSE
                    IF STATUS OR SQLCA.SQLERRD[3]=0 THEN                           
                       MESSAGE " insert EXP failure "                              
                    END IF   
                 END IF       #No.CHI-930046 add                                                      
                 EXECUTE insert_prep USING sr.tlf01,sr.tlf905,sr.tlf906,        
                                           sr.tlf21,sr.tlf19                    
       #替換inb902-->inb908,inb903-->inb909,inb904-->inb910
        UPDATE inb_file SET inb908 = g_cmia.cmi01,
                            inb909 = g_cmia.cmi02,
                            inb910 = g_cmia.cmi03
         WHERE inb01 = sr.tlf905
           AND inb03 = sr.tlf906
     END FOREACH
 
 
     IF g_zz05 = 'Y' THEN                                                       
        CALL cl_wcchp(g_wc,'tlf01,tlf19')                                       
             RETURNING g_str                                                    
     END IF                                                                     
     LET g_str = g_str                                                          
     LET l_name = 'axct211_1'                                                   
     LET l_sql = "SELECT * FROM ", g_cr_db_str CLIPPED, l_table CLIPPED         
     CALL cl_prt_cs3('axct211',l_name,l_sql,g_str)                              
     CLOSE WINDOW t211_w3   #No.MOD-910177 add
END FUNCTION
 
 
FUNCTION t211_g()
  DEFINE l_sql LIKE type_file.chr1000       #No.FUN-680122CHAR(600) 
  DEFINE p_row,p_col     LIKE type_file.num5          #No.FUN-680122 SMALLINT
  DEFINE l_tot LIKE aao_file.aao05
  DEFINE l_cmi RECORD LIKE cmi_file.*
  DEFINE l_dbs LIKE azp_file.azp03
 
   LET p_row = 6 LET p_col = 6
 
   OPEN WINDOW t211_w4 AT p_row,p_col WITH FORM
         "axc/42f/axct211_g"  ATTRIBUTE (STYLE = g_win_style CLIPPED) #No.FUN-580092 HCN
     CALL cl_ui_locale("axct211_g")
     INITIALIZE g_cmia.* TO NULL
     CONSTRUCT BY NAME g_wc ON
         cmi05,cmi06
              BEFORE CONSTRUCT
                 CALL cl_qbe_init()
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE CONSTRUCT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
 
                 ON ACTION qbe_select
         	   CALL cl_qbe_select()
                 ON ACTION qbe_save
		   CALL cl_qbe_save()
     END CONSTRUCT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211_w4 RETURN END IF
     INPUT BY NAME g_cmia.cmi01,g_cmia.cmi02,g_cmia.cmi03,g_cmia.cmi00,g_cmia.cmi04   #No.FUN-9B0118
     WITHOUT DEFAULTS
     AFTER FIELD cmi01
        IF NOT cl_null(g_cmia.cmi01) THEN
           IF g_cmia.cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(g_cmia.cmi01,'axc-095',0)
              NEXT FIELD cmi01
           END IF
        END IF
     AFTER FIELD cmi02
        IF NOT cl_null(g_cmia.cmi02) THEN
           IF g_cmia.cmi01 = g_ccz.ccz01 AND g_cmia.cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(g_cmia.cmi02,'axc-095',0)   #No:MOD-9C0025 modify
              NEXT FIELD cmi02    #No:MOD-9C0025 modify
           END IF
        END IF
 
     AFTER FIELD cmi03
        IF cl_null(g_cmia.cmi03) THEN LET g_cmia.cmi03 = ' ' END IF
        IF NOT cl_null(g_cmia.cmi03) THEN                                       
           IF g_aaz.aaz90='Y' THEN                                              
              IF NOT s_costcenter_chk(g_cmia.cmi03) THEN                        
                 NEXT FIELD cmi03                                               
              END IF                                                            
           ELSE                                                                 
              CALL t211_cmi03(g_cmia.cmi03)                                     
              IF NOT cl_null(g_errno) THEN                                      
                 CALL cl_err(g_cmia.cmi03,g_errno,0)                            
                 NEXT FIELD cmi03                                               
              END IF                                                            
           END IF                                                               
        END IF                                                                  

       AFTER FIELD cmi00    #帐套
           IF NOT cl_null(g_cmia.cmi00) THEN
              CALL t211_cmi00('a',g_cmia.cmi00)
              IF NOT cl_null(g_errno) THEN
                 CALL cl_err(g_cmia.cmi00,g_errno,0)
                 NEXT FIELD cmi00
              END IF
           END IF
 
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE INPUT
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
 
     END INPUT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211_w4  RETURN END IF
     SELECT ccz12 INTO l_ccz12 FROM ccz_file   #No.TQC-970398 mod 
 
     LET l_sql =" SELECT * FROM cmi_file ",
                " WHERE  cmi01='",g_cmia.cmi01,"'",
                " AND    cmi02='",g_cmia.cmi02,"'",
                " AND    cmi03='",g_cmia.cmi03,"'",
                " AND    cmi00='",g_cmia.cmi00,"'",      #No.FUN-9B0118
                " AND    cmi04='",g_cmia.cmi04,"' AND ", g_wc
     PREPARE t211_g2 FROM l_sql
     DECLARE t211_cur4 CURSOR FOR t211_g2
     MESSAGE "WORKING !"
     BEGIN WORK
     LET g_success='Y'
     CALL s_showmsg_init()   #No.FUN-710027
     FOREACH t211_cur4 INTO l_cmi.*
        IF g_success='N' THEN                                                                                                          
           LET g_totsuccess='N'                                                                                                       
           LET g_success="Y"                                                                                                          
        END IF                    
 
       #取參數設定ccz11,ccz12總帳所在工廠編號,帳別
        #SELECT azp03 INTO l_dbs FROM azp_file where azp01=g_ccz.ccz11 #FUN-A50102
        #LET l_dbs = s_dbstring(l_dbs)                                 #FUN-A50102
        #LET l_dbs=s_dbstring(l_dbs CLIPPED) #TQC-940184               #FUN-A50102   
        #LET l_sql =" SELECT aag06 FROM ",l_dbs CLIPPED,"aag_file",    #FUN-A50102
        LET l_sql =" SELECT aag06 FROM ",cl_get_target_table(g_ccz.ccz11,'aag_file'),  #FUN-A50102
                   "  WHERE aag01='",l_cmi.cmi05,"'   ",
                   "    AND aag00='",l_cmi.cmi00,"'"       #No.FUN-9B0118
 	    CALL cl_replace_sqldb(l_sql) RETURNING l_sql        #FUN-920032
        CALL cl_parse_qry_sql(l_sql,g_ccz.ccz11) RETURNING l_sql #FUN-A50102
        PREPARE t211_aag_pre FROM l_sql
        DECLARE t211_aag_cur CURSOR FOR t211_aag_pre
        OPEN t211_aag_cur
        FETCH t211_aag_cur INTO l_aag06
 
        SELECT ccz12 INTO l_ccz12 FROM ccz_file   #得帳別
        #LET l_sql =" SELECT aao05,aao06 FROM ",l_dbs CLIPPED, "aao_file",
        LET l_sql =" SELECT aao05,aao06 FROM ",cl_get_target_table(g_ccz.ccz11,'aao_file'),  #FUN-A50102
                   " WHERE aao00='",l_cmi.cmi00,"' ",       #No.FUN-9B0118
                   "  AND aao01='",l_cmi.cmi05,"' ",
                   "  AND aao02='",l_cmi.cmi06,"' ",
                   "  AND aao03='",l_cmi.cmi01,"' ",
                   "  AND aao04='",l_cmi.cmi02,"' "       #取借貸方餘額
        LET l_aao05 = 0 #MOD-610146
        LET l_aao06 = 0 #MOD-610146
 	    CALL cl_replace_sqldb(l_sql) RETURNING l_sql        #FUN-920032
        CALL cl_parse_qry_sql(l_sql,g_ccz.ccz11) RETURNING l_sql #FUN-A50102
        PREPARE t211_aao_pre FROM l_sql
        DECLARE t211_aao_cur CURSOR FOR t211_aao_pre
        OPEN t211_aao_cur
        FETCH t211_aao_cur INTO l_aao05,l_aao06
 
 
        IF cl_null(l_aao05) THEN LET l_aao05 = 0 END IF
        IF cl_null(l_aao06) THEN LET l_aao06 = 0 END IF
        IF l_aag06='1' THEN           #正常餘額為借餘時
           LET l_tot=l_aao05-l_aao06
        ELSE
           LET l_tot=l_aao06-l_aao05
        END IF
        UPDATE cmi_file SET cmi08=l_tot WHERE
               cmi01=l_cmi.cmi01 AND
               cmi02=l_cmi.cmi02 AND
               cmi03=l_cmi.cmi03 AND
               cmi04=l_cmi.cmi04 AND
               cmi00=l_cmi.cmi00 AND     #No.FUN-9B0118
               cmi05=l_cmi.cmi05 AND
               cmi06=l_cmi.cmi06  
              #MOD-E80049-Start-Mark 
              ##FUN-D80058--add--str--
              #cmi13 = l_cmi.cmi13 AND 
              #cmi15 = l_cmi.cmi15 AND
              #cmi17 = l_cmi.cmi16 AND
              #cmi19 = l_cmi.cmi19 AND
              #cmi21 = l_cmi.cmi21 AND
              #cmi23 = l_cmi.cmi23 AND
              #cmi25 = l_cmi.cmi25 AND
              #cmi27 = l_cmi.cmi27 AND
              #cmi29 = l_cmi.cmi29 AND
              #cmi31 = l_cmi.cmi31 AND
              #cmi33 = l_cmi.cmi33
              ##FUN-D80058--add--end--
              #MOD-E80049-End-Mark 
        IF STATUS OR sqlca.sqlerrd[3]=0 THEN
           LET g_showmsg=l_cmi.cmi01,"/",l_cmi.cmi02,"/",l_cmi.cmi03,"/",l_cmi.cmi04,"/",l_cmi.cmi05,"/",l_cmi.cmi06         #NO.FUN-710027
           CALL s_errmsg('cmi01,cmi02,cmi03,cmi04,cmi05,cmi06',g_showmsg,'upd cmi08',STATUS,1)                               #NO.FUN-710027
           LET g_success='N'
        END IF
     END FOREACH
     IF g_totsuccess="N" THEN                                                                                                         
        LET g_success="N"                                                                                                             
     END IF
     CALL s_showmsg() 
 
     IF g_success ='Y' THEN COMMIT WORK
     ELSE
         ROLLBACK WORK
     END IF
     MESSAGE ""
     CLOSE WINDOW t211_w4
END FUNCTION
 
FUNCTION t211_b_fill(p_wc)              #BODY FILL UP
DEFINE
    p_wc            LIKE type_file.chr1000       #No.FUN-680122CHAR(310)
   #l_flag          LIKE type_file.num5,          #FUN-D80058 add  #MOD-E80049 Mark
   #l_flag_t        LIKE type_file.num5           #FUN-D80058 add  #MOD-E80049 Mark
 
    LET g_sql =
       "SELECT cmi05,cmi06,cmi07,cmi08",
      #MOD-E80049-Start-Mark 
      ##FUN-D80058--add--str--
      #"       cmi35,cmi13,cmi14,cmi15,",
      #"       cmi16,cmi17,cmi18,cmi19,",
      #"       cmi20,cmi21,cmi22,cmi23,",
      #"       cmi24,cmi25,cmi26,cmi27,",
      #"       cmi28,cmi29,cmi30,cmi31,",
      #"       cmi32,cmi33,cmi34",
      ##FUN-D80058--add--end--
      #MOD-E80049-End-Mark  
       " FROM cmi_file",
       " WHERE cmi01 = '",g_cmi01,"' AND ",
       " cmi02='",g_cmi02,"' AND  cmi03='",g_cmi03,"' AND cmi04='",g_cmi04,"'",
       " AND cmi00 = '",g_cmi00,"'",                  #No.FUN-9B0118
       " AND ",p_wc CLIPPED ,
       " ORDER BY 1"
    PREPARE t211_prepare2 FROM g_sql      #預備一下
    IF SQLCA.SQLCODE THEN
    	CALL cl_err('FILL PREPARE:',SQLCA.SQLCODE,1)
    	RETURN
    END IF
    DECLARE t211_curs1 CURSOR FOR t211_prepare2
    CALL g_cmi.clear()
    LET g_cnt = 1
    LET g_cmi08_tot=0
   #LET l_flag_t = 0     #FUN-D80058 add  #MOD-E80049 Mark
    FOREACH t211_curs1 INTO g_cmi[g_cnt].*   #單身 ARRAY 填充
        IF SQLCA.sqlcode THEN
            CALL cl_err('B_FILL:',SQLCA.sqlcode,1)
            EXIT FOREACH
        END IF
       #MOD-E80049-Start-Mark 
       ##FUN-D80058--add--str--
       #LET l_flag = 0
       #IF NOT cl_null(g_cmi[g_cnt].cmi13) THEN 
       #   LET l_flag = 1
       #END IF 
       #IF NOT cl_null(g_cmi[g_cnt].cmi15) THEN 
       #   LET l_flag = 2
       #END IF 
       #IF NOT cl_null(g_cmi[g_cnt].cmi17) THEN 
       #   LET l_flag = 3
       #END IF 
       #IF NOT cl_null(g_cmi[g_cnt].cmi19) THEN 
       #   LET l_flag = 4
       #END IF 
       #IF NOT cl_null(g_cmi[g_cnt].cmi21) THEN 
       #   LET l_flag = 5
       #END IF 
       #IF NOT cl_null(g_cmi[g_cnt].cmi23) THEN 
       #   LET l_flag = 6
       #END IF
       #IF NOT cl_null(g_cmi[g_cnt].cmi25) THEN 
       #   LET l_flag = 7
       #END IF
       #IF NOT cl_null(g_cmi[g_cnt].cmi27) THEN 
       #   LET l_flag = 8
       #END IF
       #IF NOT cl_null(g_cmi[g_cnt].cmi29) THEN 
       #   LET l_flag = 9
       #END IF
       #IF NOT cl_null(g_cmi[g_cnt].cmi31) THEN 
       #   LET l_flag = 10
       #END IF
       #IF NOT cl_null(g_cmi[g_cnt].cmi33) THEN 
       #   LET l_flag = 11
       #END IF
       #IF l_flag >= l_flag_t THEN 
       #   LET l_flag_t = l_flag
       #END IF 
       ##FUN-D80058--add--end--
       #MOD-E80049-End-Mark 
        LET g_cmi08_tot=g_cmi08_tot+g_cmi[g_cnt].cmi08
        LET g_cnt = g_cnt + 1
        IF g_cnt > g_max_rec THEN
           CALL cl_err( '', 9035, 0 )
           EXIT FOREACH
        END IF
    END FOREACH
   #CALL t211_visible(l_flag_t)    #FUN-D80058 add #MOD-E80049 Mark
    CALL g_cmi.deleteElement(g_cnt)
    MESSAGE ""
    DISPLAY g_cmi08_tot TO FORMONLY.cmi08_tot
    LET g_rec_b=g_cnt-1
    DISPLAY g_rec_b TO FORMONLY.cn2
    LET g_cnt = 0
END FUNCTION
 
FUNCTION t211_bp(p_ud)
   DEFINE   p_ud   LIKE type_file.chr1          #No.FUN-680122 VARCHAR(1)
 
 
   IF p_ud <> "G" OR g_action_choice = "detail" THEN
      RETURN
   END IF
 
   LET g_action_choice = " "
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   CALL cl_set_act_visible("generate,retrieve,access_current_period_overhe", g_aza.aza26 <>'2')  #FUN-AA0025
   DISPLAY ARRAY g_cmi TO s_cmi.* ATTRIBUTE(COUNT=g_rec_b,UNBUFFERED)
 
      BEFORE DISPLAY
         CALL cl_navigator_setting( g_curs_index, g_row_count )
 
      BEFORE ROW
         LET l_ac = ARR_CURR()
      CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
 
      ##########################################################################
      # Standard 4ad ACTION
      ##########################################################################
      ON ACTION insert
         LET g_action_choice="insert"
         EXIT DISPLAY
      ON ACTION query
         LET g_action_choice="query"
         EXIT DISPLAY
      ON ACTION delete
         LET g_action_choice="delete"
         EXIT DISPLAY
      ON ACTION first
         CALL t211_fetch('F')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
           ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST
 
 
      ON ACTION previous
         CALL t211_fetch('P')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
	ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST
 
 
      ON ACTION jump
         CALL t211_fetch('/')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
	ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST
 
 
      ON ACTION next
         CALL t211_fetch('N')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
	ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST
 
 
      ON ACTION last
         CALL t211_fetch('L')
         CALL cl_navigator_setting(g_curs_index, g_row_count)   ###add in 040517
           IF g_rec_b != 0 THEN
         CALL fgl_set_arr_curr(1)  ######add in 040505
           END IF
	ACCEPT DISPLAY                   #No.FUN-530067 HCN TEST
 
 
      ON ACTION reproduce
         LET g_action_choice="reproduce"
         EXIT DISPLAY
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
 
      ON ACTION controls                          #No.FUN-6A0092
         CALL cl_set_head_visible("","AUTO")      #No.FUN-6A0092
 
      ON ACTION locale
         CALL cl_dynamic_locale()
          CALL cl_show_fld_cont()                   #No.FUN-550037 hmf
 
      ON ACTION exit
         LET g_action_choice="exit"
         EXIT DISPLAY
 
      ##########################################################################
      # Special 4ad ACTION
      ##########################################################################
      ON ACTION controlg
         LET g_action_choice="controlg"
         EXIT DISPLAY
 
      #@ON ACTION 產生
      ON ACTION generate
         LET g_action_choice="generate"
         EXIT DISPLAY
      #@ON ACTION 截取
      ON ACTION retrieve
         LET g_action_choice="retrieve"
         EXIT DISPLAY
      #@ON ACTION 擷取當期費用成本
      ON ACTION access_current_period_overhe
         LET g_action_choice="access_current_period_overhe"
         EXIT DISPLAY
     #TQC-D40043---add---start--依分攤設置產生人工制費
      ON ACTION produce_manmade_cost
         LET g_action_choice="produce_manmade_cost"
         EXIT DISPLAY
     #TQC-D40043---add---END--
      ON ACTION by_setting
         LET g_action_choice="by_setting"
         EXIT DISPLAY
 
   ON ACTION accept
      LET g_action_choice="detail"
      LET l_ac = ARR_CURR()
      EXIT DISPLAY
 
   ON ACTION cancel
             LET INT_FLAG=FALSE 		#MOD-570244	mars
      LET g_action_choice="exit"
      EXIT DISPLAY
 
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE DISPLAY
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION exporttoexcel #FUN-4B0015
         LET g_action_choice = 'exporttoexcel'
         EXIT DISPLAY
 
      ON ACTION related_document                #No.FUN-6A0019  相關文件
         LET g_action_choice="related_document"          
         EXIT DISPLAY 
 
      AFTER DISPLAY
         CONTINUE DISPLAY
 
      &include "qry_string.4gl"
 
   END DISPLAY
   CALL cl_set_act_visible("accept,cancel", TRUE)
END FUNCTION
 
 
FUNCTION t211_r()
    IF g_cmi01 IS NULL THEN 
       CALL cl_err("",-400,0)      #No.FUN-6A0019
       RETURN 
    END IF

    IF NOT t211_chk_q310(g_cmi00,g_cmi01,g_cmi02) THEN RETURN END IF #MOD-DB0167 add
 
    IF cl_delh(0,0) THEN                   #確認一下
        INITIALIZE g_doc.* TO NULL           #No.FUN-9B0098 10/02/24
        LET g_doc.column1 = "cmi01"          #No.FUN-9B0098 10/02/24
        LET g_doc.column2 = "cmi02"          #No.FUN-9B0098 10/02/24
        LET g_doc.column3 = "cmi03"          #No.FUN-9B0098 10/02/24
        LET g_doc.column4 = "cmi04"          #No.FUN-9B0098 10/02/24
        LET g_doc.column5 = "cmi00"          #No.FUN-9B0098 10/02/24
        LET g_doc.value1 = g_cmi01           #No.FUN-9B0098 10/02/24
        LET g_doc.value2 = g_cmi02           #No.FUN-9B0098 10/02/24
        LET g_doc.value3 = g_cmi03           #No.FUN-9B0098 10/02/24
        LET g_doc.value4 = g_cmi04           #No.FUN-9B0098 10/02/24
        LET g_doc.value5 = g_cmi00           #No.FUN-9B0098 10/02/24
        CALL cl_del_doc()                #No.FUN-9B0098 10/02/24
        DELETE FROM cmi_file WHERE cmi01 = g_cmi01
                               AND cmi02=  g_cmi02
                               AND cmi03 = g_cmi03
                               AND cmi00 = g_cmi00        #No.FUN-9B0118
                               AND cmi04 = g_cmi04
        IF SQLCA.sqlcode THEN
            CALL cl_err3("del","cmi_file",g_cmi01,g_cmi02,SQLCA.sqlcode,"","BODY DELETE:",1)  #No.FUN-660127
        ELSE
            CLEAR FORM
            CALL g_cmi.clear()
            LET g_cnt=SQLCA.SQLERRD[3]
            MESSAGE 'Remove (',g_cnt USING '####&',') Row(s)'
            DROP TABLE x
            PREPARE t211_precount_x2 FROM g_sql_tmp  #No.TQC-720019
            EXECUTE t211_precount_x2                 #No.TQC-720019
            OPEN t211_cnt
            #FUN-B50064-add-start--
            IF STATUS THEN
               CLOSE t211_b_cs
               CLOSE t211_count
               COMMIT WORK
               RETURN
            END IF
            #FUN-B50064-add-end-- 
            FETCH t211_cnt INTO g_row_count
            #FUN-B50064-add-start--
            IF STATUS OR (cl_null(g_row_count) OR  g_row_count = 0 ) THEN
               CLOSE t211_b_cs
               CLOSE t211_count
               COMMIT WORK
               RETURN
            END IF
            #FUN-B50064-add-end-- 
            DISPLAY g_row_count TO FORMONLY.cnt
            OPEN t211_b_cs
            IF g_curs_index = g_row_count + 1 THEN
               LET g_jump = g_row_count
               CALL t211_fetch('L')
            ELSE
               LET g_jump = g_curs_index
               LET mi_no_ask = TRUE
               CALL t211_fetch('/')
            END IF
        END IF
    END IF
END FUNCTION

 
#TQC-D40043---BEGIN--
FUNCTION t211_s()
DEFINE l_cmi   RECORD LIKE cmi_file.*
DEFINE l_sql   STRING                    
DEFINE tm      RECORD
       cda01   LIKE cda_file.cda01,
       cda02   LIKE cda_file.cda02,
       cda04   LIKE cda_file.cda04,
       cda05   LIKE cda_file.cda05,
       cda10   LIKE cda_file.cda10
               END RECORD,
       sr1     RECORD
       cda01   LIKE cda_file.cda01,
       cda02   LIKE cda_file.cda02,
       cda05   LIKE cda_file.cda05,
       cay03   LIKE cay_file.cay03,
       cay05   LIKE cay_file.cay05,
       cay04   LIKE cay_file.cay04,     #TQC-D40043 add  
       cay12   LIKE cay_file.cay12      #TQC-D40043 add   
               END RECORD,
       l_tot   LIKE cmi_file.cmi08,
       l_tot1  LIKE cmi_file.cmi08,
       l_tot2  LIKE cmi_file.cmi08,
       l_cay03 LIKE cay_file.cay03,       
       l_cay04 LIKE cay_file.cay04,       
       l_aag02 LIKE aag_file.aag02
DEFINE p_row,p_col     LIKE type_file.num5 
DEFINE l_cda06         LIKE cda_file.cda06    
#MOD-E80049-Start-Mark
#FUN-D80058--add--str--
#DEFINE l_abb08         LIKE abb_file.abb08
#DEFINE l_abb11         LIKE abb_file.abb11
#DEFINE l_abb12         LIKE abb_file.abb12
#DEFINE l_abb13         LIKE abb_file.abb13
#DEFINE l_abb14         LIKE abb_file.abb14
#DEFINE l_abb31         LIKE abb_file.abb31
#DEFINE l_abb32         LIKE abb_file.abb32
#DEFINE l_abb33         LIKE abb_file.abb33
#DEFINE l_abb34         LIKE abb_file.abb34
#DEFINE l_abb35         LIKE abb_file.abb35
#DEFINE l_abb36         LIKE abb_file.abb36
#DEFINE l_abb37         LIKE abb_file.abb37
#FUN-D80058--add--end--
#MOD-E80049-End-Mark
 
LET p_row = 6 LET p_col = 6
       
  OPEN WINDOW t211a_w AT p_row,p_col WITH FORM
          "axc/42f/axct211a"  ATTRIBUTE (STYLE = g_win_style CLIPPED) 
     CALL cl_ui_locale("axct211a")
     INITIALIZE l_cmi.* TO NULL
     INPUT BY NAME l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00   
     WITHOUT DEFAULTS

     #No.MOD-D20052  --Begin 
     BEFORE INPUT
        LET g_before_input_done = FALSE
        LET l_cmi.cmi01 = g_ccz.ccz01
        LET l_cmi.cmi02 = g_ccz.ccz02
        LET l_cmi.cmi00 = g_ccz.ccz12
        DISPLAY BY NAME l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00
     #No.MOD-D20052  --End
 
     AFTER FIELD cmi01
        IF NOT cl_null(l_cmi.cmi01) THEN
           IF l_cmi.cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(l_cmi.cmi01,'axc-095',0)
              NEXT FIELD cmi01
           END IF
        END IF
     AFTER FIELD cmi02
        IF NOT cl_null(l_cmi.cmi02) THEN
           IF l_cmi.cmi01 = g_ccz.ccz01 AND l_cmi.cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(l_cmi.cmi01,'axc-095',0)
              NEXT FIELD cmi01
           END IF
        END IF

    AFTER FIELD cmi00
        IF NOT cl_null(l_cmi.cmi00) THEN
           CALL t211_cmi00('a',l_cmi.cmi00)
           IF NOT cl_null(g_errno) THEN
              CALL cl_err(l_cmi.cmi00,g_errno,0)
              NEXT FIELD cmi00
           END IF
        END IF
 
      ON ACTION about         
         CALL cl_about()      
 
      ON ACTION help          
         CALL cl_show_help()  
 
      ON ACTION controlg      
         CALL cl_cmdask()     
 
 
     END INPUT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211a_w RETURN END IF
     IF NOT t211_chk_q310(l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02) THEN  #MOD-DB0167 add
        CLOSE WINDOW t211a_w  #MOD-DB0167 add
        RETURN                #MOD-DB0167 add
     END IF                   #MOD-DB0167 add
     DELETE FROM cmi_file
      WHERE cmi01=l_cmi.cmi01    AND cmi02=l_cmi.cmi02
        AND cmi00= l_cmi.cmi00   
     DECLARE t211_s1 CURSOR FOR
        SELECT cda01,cda02,cda04,cda05,cda10,cda06    
          FROM cda_file
         WHERE cda04= '1'   #單部門,部門可能為一個空格
     BEGIN WORK
     FOREACH t211_s1 INTO tm.cda01,tm.cda02,tm.cda04,tm.cda05,tm.cda10,l_cda06    
     IF SQLCA.sqlcode THEN                                                                                                       
        CALL cl_err('',SQLCA.sqlcode,0)
        ROLLBACK WORK                                                                                  
        EXIT FOREACH                                                                                                            
     END IF
    #MOD-E80049-Start-Mark 
    ##MOD-E30074-Start-Add
    ##先將變數清空，以防重複
    #LET l_tot = NULL
    #LET l_tot1 = NULL LET l_abb08 = NULL   
    #LET l_abb11 = NULL LET l_abb12 = NULL
    #LET l_abb13 = NULL LET l_abb14 = NULL
    #LET l_abb31 = NULL LET l_abb32 = NULL 
    #LET l_abb33 = NULL LET l_abb34 = NULL
    #LET l_abb35 = NULL LET l_abb36 = NULL
    #LET l_abb37 = NULL     
    ##MOD-E30074-End-Add
    #MOD-E80049-End-Mark 
     #借
     IF cl_null(tm.cda10) THEN
       SELECT SUM(abb07)
             #abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add  #MOD-E80049 Mark
         INTO l_tot1 
             #l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   #FUN-D80058 add      #MOD-E80049 Mark
             #l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37    #FUN-D80058 add      #MOD-E80049 Mark
         FROM aba_file,abb_file
        WHERE aba03=l_cmi.cmi01
          AND aba04=l_cmi.cmi02
          AND abb00=aba00
          AND aba00=l_cmi.cmi00   
          AND aba19='Y'
          AND abapost = 'Y'    
          AND abb01=aba01
          AND abb03=tm.cda05
          AND abb06='1'  
       #GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add  #MOD-E80049 Mark
     ELSE
       SELECT SUM(abb07)
             #abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add  #MOD-E80049 Mark
         INTO l_tot1
             #l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,  #FUN-D80058 add  #MOD-E80049 Mark
             #l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37   #FUN-D80058 add  #MOD-E80049 Mark
         FROM aba_file,abb_file
        WHERE aba03=l_cmi.cmi01
          AND aba04=l_cmi.cmi02
          AND abb00=aba00
          AND aba00=l_cmi.cmi00   
          AND aba19='Y'
          AND abapost = 'Y'    
          AND abb01=aba01
          AND abb03=tm.cda05
          AND abb05=tm.cda10
          AND abb06='1'  
       #GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add #MOD-E80049 Mark
     END IF
    #MOD-E80049-Start-Mark
    ##MOD-E30074-Start-Add
    ##先將變數清空，以防重複
    #LET l_tot2 = NULL LET l_abb08 = NULL   
    #LET l_abb11 = NULL LET l_abb12 = NULL
    #LET l_abb13 = NULL LET l_abb14 = NULL
    #LET l_abb31 = NULL LET l_abb32 = NULL 
    #LET l_abb33 = NULL LET l_abb34 = NULL
    #LET l_abb35 = NULL LET l_abb36 = NULL
    #LET l_abb37 = NULL     
    ##MOD-E30074-End-Add 
    #MOD-E80049-End-Mark 
     #貸
     IF cl_null(tm.cda10) THEN
       SELECT SUM(abb07)
             #abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add #MOD-E80049 Mark 
         INTO l_tot2
             #l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   #FUN-D80058 add        #MOD-E80049 Mark 
             #l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37    #FUN-D80058 add        #MOD-E80049 Mark
         FROM aba_file,abb_file
        WHERE aba03=l_cmi.cmi01
          AND aba04=l_cmi.cmi02
          AND abb00=aba00
          AND aba00=l_cmi.cmi00   
          AND aba19='Y'
          AND abapost = 'Y'    
          AND abb01=aba01
          AND abb03=tm.cda05
          AND abb06='2'
       #GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add  #MOD-E80049 Mark  
     ELSE
       SELECT SUM(abb07)
             #abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add  #MOD-E80049 Mark
         INTO l_tot2
             #l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   #FUN-D80058 add          #MOD-E80049 Mark
             #l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37    #FUN-D80058 add          #MOD-E80049 Mark
         FROM aba_file,abb_file
        WHERE aba03=l_cmi.cmi01
          AND aba04=l_cmi.cmi02
          AND abb00=aba00
          AND aba00=l_cmi.cmi00   
          AND aba19='Y'
          AND abapost = 'Y'    
          AND abb01=aba01
          AND abb03=tm.cda05
          AND abb05=tm.cda10
          AND abb06='2'  
       #GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add #MOD-E80049 Mark  
     END IF
  
     IF cl_null(l_tot1) THEN LET l_tot1 = 0 END IF
     IF cl_null(l_tot2) THEN LET l_tot2 = 0 END IF
     LET l_tot=l_tot1-l_tot2
     #No.MOD-C40097  --Begin
     IF l_tot = 0 THEN
        CONTINUE FOREACH
     END IF 
     #No.MOD-C40097  --End
    #MOD-E80049-Start-Mark 
    ##FUN-D80058--add--str--
    #IF NOT cl_null(l_abb11) THEN 
    #   LET l_cmi.cmi13 = l_abb11
    #ELSE
    #   LET l_cmi.cmi13 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb12) THEN 
    #   LET l_cmi.cmi15 = l_abb12
    #ELSE
    #   LET l_cmi.cmi15 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb13) THEN 
    #   LET l_cmi.cmi17 = l_abb13
    #ELSE
    #   LET l_cmi.cmi17 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb14) THEN 
    #   LET l_cmi.cmi19 = l_abb14
    #ELSE
    #   LET l_cmi.cmi19 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb31) THEN 
    #   LET l_cmi.cmi21 = l_abb31
    #ELSE
    #   LET l_cmi.cmi21 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb32) THEN 
    #   LET l_cmi.cmi23 = l_abb32
    #ELSE
    #   LET l_cmi.cmi23 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb33) THEN 
    #   LET l_cmi.cmi25 = l_abb33
    #ELSE
    #   LET l_cmi.cmi25 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb34) THEN 
    #   LET l_cmi.cmi27 = l_abb34
    #ELSE
    #   LET l_cmi.cmi27 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb35) THEN 
    #   LET l_cmi.cmi29 = l_abb35
    # ELSE
    #   LET l_cmi.cmi29 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb36) THEN 
    #   LET l_cmi.cmi31 = l_abb36
    #ELSE
    #   LET l_cmi.cmi31 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb37) THEN 
    #   LET l_cmi.cmi33 = l_abb37
    #ELSE
    #   LET l_cmi.cmi33 = ' ' 
    #END IF 
    #LET l_cmi.cmi35 = l_abb08
    #IF g_aaz.aaz119 ='Y' THEN 
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi13,'aag15','1') RETURNING l_cmi.cmi14
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi15,'aag16','2') RETURNING l_cmi.cmi16
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi17,'aag17','3') RETURNING l_cmi.cmi18
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi19,'aag18','4') RETURNING l_cmi.cmi20
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi21,'aag31','5') RETURNING l_cmi.cmi22
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi23,'aag32','6') RETURNING l_cmi.cmi24
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi25,'aag33','7') RETURNING l_cmi.cmi26
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi27,'aag34','8') RETURNING l_cmi.cmi28
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi29,'aag35','9') RETURNING l_cmi.cmi30
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi31,'aag36','10') RETURNING l_cmi.cmi32
    #   CALL t211_get_ahe02(tm.cda05,l_cmi.cmi33,'aag37','99') RETURNING l_cmi.cmi34
    # END IF
    ##FUN-D80058--add--end--
    #MOD-E80049-End-Mark 
     SELECT aag02 INTO l_aag02 FROM aag_file WHERE aag01=tm.cda05 and aag00 = g_aaz.aaz64
     IF cl_null(tm.cda10) THEN LET tm.cda10 = ' ' END IF
     IF cl_null(l_cda06) THEN LET l_cda06 = '1' END IF     
     INSERT INTO cmi_file(cmi01,cmi02,cmi03,cmi04,cmi05,
                          cmi06,cmi07,cmi08,cmi09,cmi10,
                         #MOD-E80049-Start-Mark 
                         ##FUN-D80058--add--str--
                         #cmi13,cmi14,cmi15,cmi16,cmi17,
                         #cmi18,cmi19,cmi20,cmi21,cmi22,
                         #cmi23,cmi24,cmi25,cmi26,cmi27,
                         #cmi28,cmi29,cmi30,cmi31,cmi32,
                         #cmi33,cmi34,cmi35,
                         ##FUN-D80058--add--end--
                         #MOD-E80049-End-Mark 
                          cmiacti,cmiuser,cmigrup,cmimodu,cmidate,cmi00,cmi12,cmioriu,cmiorig,cmilegal)         
                  VALUES(l_cmi.cmi01,l_cmi.cmi02,tm.cda01,tm.cda02,tm.cda05,     
                         tm.cda10,l_aag02,l_tot,'','',
                        #MOD-E80049-Start-Mark 
                        ##FUN-D80058--add--str--
                        #l_cmi.cmi13,l_cmi.cmi14,l_cmi.cmi15,
                        #l_cmi.cmi16,l_cmi.cmi17,l_cmi.cmi18,
                        #l_cmi.cmi19,l_cmi.cmi20,l_cmi.cmi21,
                        #l_cmi.cmi22,l_cmi.cmi23,l_cmi.cmi24,
                        #l_cmi.cmi25,l_cmi.cmi26,l_cmi.cmi27,
                        #l_cmi.cmi28,l_cmi.cmi29,l_cmi.cmi30,
                        #l_cmi.cmi31,l_cmi.cmi32,l_cmi.cmi33,
                        #l_cmi.cmi34,l_cmi.cmi34,
                        ##FUN-D80058--add--end--
                        #MOD-E80049-End-Mark 
                         'Y',g_user,g_grup,'',g_today,l_cmi.cmi00,l_cda06,g_user,g_grup,g_legal)  
     CASE SQLCA.sqlcode
         WHEN "0" continue foreach
         WHEN "-239" UPDATE cmi_file SET cmi08=cmi08+l_tot 
                      WHERE cmi01=l_cmi.cmi01 AND cmi02=l_cmi.cmi02 AND cmi03=tm.cda01
                        AND cmi04=tm.cda02 AND cmi05=tm.cda05 AND cmi06=tm.cda10
                        AND cmi00=l_cmi.cmi00  
                       #MOD-E80049-Start-Mark 
                       ##FUN-D80058--add--str--
                       #AND cmi13=l_cmi.cmi13
                       #AND cmi15=l_cmi.cmi15 AND cmi17=l_cmi.cmi17
                       #AND cmi19=l_cmi.cmi19 AND cmi21=l_cmi.cmi21
                       #AND cmi23=l_cmi.cmi23 AND cmi25=l_cmi.cmi25
                       #AND cmi27=l_cmi.cmi27 AND cmi13=l_cmi.cmi29
                       #AND cmi31=l_cmi.cmi31 AND cmi33=l_cmi.cmi33
                       #AND cmi35=l_cmi.cmi35
                       ##FUN-D80058--add--end--
                       #MOD-E80049-End-Mark 
         OTHERWISE
            CALL cl_err3("ins","cmi_file",l_cmi.cmi01,l_cmi.cmi02,SQLCA.sqlcode,'','',0)
            ROLLBACK WORK
            EXIT FOREACH
     END CASE
     END FOREACH
     DECLARE t211_s2 CURSOR FOR
       SELECT DISTINCT cda01,cda02,cda05,cay03,cay05,
                       cay04,cay12                      #TQC-D40043 add
         FROM cda_file LEFT OUTER JOIN cay_file
          #ON (cda02=cay00 AND cda01=cay04 AND cda05=cay10    #TQC-D40043 mark 
           ON (cda02=cay00 AND cda01=cay04 AND cda05=cay06    #TQC-D40043 add
              #AND cay11 = cmi00 AND cmi00 = l_cmi.cmi00      #TQC-D40043 mark
               AND cay11 = l_cmi.cmi00                        #TQC-D40043 add 
               AND cay01=l_cmi.cmi01 AND cay02=l_cmi.cmi02)
        WHERE cda04 = '2'
     FOREACH t211_s2 INTO sr1.cda01,sr1.cda02,sr1.cda05,sr1.cay03,sr1.cay05,
                          sr1.cay04,sr1.cay12     #TQC-D40043 add
       IF SQLCA.sqlcode THEN                                                                                                       
          CALL cl_err('',SQLCA.sqlcode,0)
          ROLLBACK WORK                                                                                  
          EXIT FOREACH                                                                                                            
       END IF
       IF sr1.cay03 IS NULL OR sr1.cay05=0 THEN CONTINUE FOREACH END IF  #無設定 axci001/002
       #借
       SELECT SUM(abb07)
             #abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add  #MOD-E80049 Mark
         INTO l_tot1
             #l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   #FUN-D80058 add    #MOD-E80049 Mark
             #l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37    #FUN-D80058 add    #MOD-E80049 Mark 
         FROM aba_file,abb_file
        WHERE aba03=l_cmi.cmi01
          AND aba04=l_cmi.cmi02
          AND abb00=aba00
          AND abb01=aba01
          AND aba00=l_cmi.cmi00  
          AND aba19='Y'
          AND abapost = 'Y'    
          AND abb03=sr1.cda05
          AND abb05=sr1.cay03
          AND abb06='1'
       #GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add  #MOD-E80049 Mark    
       #貸
       SELECT SUM(abb07)
             #abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add     #MOD-E80049 Mark
         INTO l_tot2 
             #l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   #FUN-D80058 add   #MOD-E80049 Mark
             #l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37    #FUN-D80058 add   #MOD-E80049 Mark 
         FROM aba_file,abb_file
        WHERE aba03=l_cmi.cmi01
          AND aba04=l_cmi.cmi02
          AND abb00=aba00
          AND abb01=aba01
          AND aba00=l_cmi.cmi00  
          AND aba19='Y'
          AND abapost = 'Y'    
          AND abb03=sr1.cda05
          AND abb05=sr1.cay03
          AND abb06='2'
       #GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add #MOD-E80049 Mark   
               
     IF cl_null(l_tot1) THEN LET l_tot1 = 0 END IF
     IF cl_null(l_tot2) THEN LET l_tot2 = 0 END IF
     LET l_tot=(l_tot1-l_tot2)*sr1.cay05
     #No.MOD-C40097  --Begin
     IF l_tot = 0 THEN
        CONTINUE FOREACH
     END IF 
    #MOD-E80049-Start-Mark 
    ##FUN-D80058--add--str--
    #IF NOT cl_null(l_abb11) THEN 
    #   LET l_cmi.cmi13 = l_abb11
    #ELSE
    #   LET l_cmi.cmi13 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb12) THEN 
    #   LET l_cmi.cmi15 = l_abb12
    #ELSE
    #   LET l_cmi.cmi15 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb13) THEN 
    #   LET l_cmi.cmi17 = l_abb13
    #ELSE
    #   LET l_cmi.cmi17 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb14) THEN 
    #   LET l_cmi.cmi19 = l_abb14
    #ELSE
    #   LET l_cmi.cmi19 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb31) THEN 
    #   LET l_cmi.cmi21 = l_abb31
    #ELSE
    #   LET l_cmi.cmi21 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb32) THEN 
    #   LET l_cmi.cmi23 = l_abb32
    #ELSE
    #   LET l_cmi.cmi23 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb33) THEN 
    #   LET l_cmi.cmi25 = l_abb33
    #ELSE
    #   LET l_cmi.cmi25 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb34) THEN 
    #   LET l_cmi.cmi27 = l_abb34
    #ELSE
    #   LET l_cmi.cmi27 = ' ' 
    #END IF 
    # IF NOT cl_null(l_abb35) THEN 
    #   LET l_cmi.cmi29 = l_abb35
    #ELSE
    #   LET l_cmi.cmi29 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb36) THEN 
    #   LET l_cmi.cmi31 = l_abb36
    #ELSE
    #   LET l_cmi.cmi31 = ' ' 
    #END IF 
    #IF NOT cl_null(l_abb37) THEN 
    #   LET l_cmi.cmi33 = l_abb37
    #ELSE
    #   LET l_cmi.cmi33 = ' ' 
    #END IF 
    #LET l_cmi.cmi35 = l_abb08
    #IF g_aaz.aaz119 ='Y' THEN 
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi13,'aag15','1') RETURNING l_cmi.cmi14
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi15,'aag16','2') RETURNING l_cmi.cmi16
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi17,'aag17','3') RETURNING l_cmi.cmi18
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi19,'aag18','4') RETURNING l_cmi.cmi20
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi21,'aag31','5') RETURNING l_cmi.cmi22
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi23,'aag32','6') RETURNING l_cmi.cmi24
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi25,'aag33','7') RETURNING l_cmi.cmi26
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi27,'aag34','8') RETURNING l_cmi.cmi28
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi29,'aag35','9') RETURNING l_cmi.cmi30
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi31,'aag36','10') RETURNING l_cmi.cmi32
    #   CALL t211_get_ahe02(sr1.cda05,l_cmi.cmi33,'aag37','99') RETURNING l_cmi.cmi34
    #END IF
    ##FUN-D80058--add--end--
    ##FUN-D80058--add--end--
    #MOD-E80049-End-Mark
    
     #No.MOD-C40097  --End
     LET l_tot  = s_trunc(l_tot,6)  #因為資料庫只能存6位小數,故6位以後無條件捨去,最後在處理尾差
     SELECT aag02 INTO l_aag02 FROM aag_file WHERE aag01=sr1.cda05 AND aag00 = g_aaz.aaz64
     IF cl_null(sr1.cay03) THEN LET sr1.cay03 = ' ' END IF
     INSERT INTO cmi_file(cmi01,cmi02,cmi03,cmi04,cmi05,
                           cmi06,cmi07,cmi08,cmi09,cmi10,
                          #MOD-E80049-Start-Mark 
                          ##FUN-D80058--add--str--
                          #cmi13,cmi14,cmi15,cmi16,cmi17,
                          #cmi18,cmi19,cmi20,cmi21,cmi22,
                          #cmi23,cmi24,cmi25,cmi26,cmi27,
                          #cmi28,cmi29,cmi30,cmi31,cmi32,
                          #cmi33,cmi34,cmi35,
                          ##FUN-D80058--add--end--
                          #MOD-E80049-End-Mark 
                           cmiacti,cmiuser,cmigrup,cmimodu,cmidate,cmi00,cmi12,cmilegal)   #No.FUN-9B0118  #TQC-D40043 add cmi12,cmilegal
                  #VALUES (l_cmi.cmi01,l_cmi.cmi02,sr1.cda01,sr1.cda02,sr1.cda05,    #TQC-D40043 mark
                   VALUES (l_cmi.cmi01,l_cmi.cmi02,sr1.cay04,sr1.cda02,sr1.cda05,    #TQC-D40043 add
                           sr1.cay03,l_aag02,l_tot,'','',
                          #MOD-E80049-Start-Mark
                          ##FUN-D80058--add--str--
                          #l_cmi.cmi13,l_cmi.cmi14,l_cmi.cmi15,
                          #l_cmi.cmi16,l_cmi.cmi17,l_cmi.cmi18,
                          #l_cmi.cmi19,l_cmi.cmi20,l_cmi.cmi21,
                          #l_cmi.cmi22,l_cmi.cmi23,l_cmi.cmi24,
                          #l_cmi.cmi25,l_cmi.cmi26,l_cmi.cmi27,
                          #l_cmi.cmi28,l_cmi.cmi29,l_cmi.cmi30,
                          #l_cmi.cmi31,l_cmi.cmi32,l_cmi.cmi33,
                          #l_cmi.cmi34,l_cmi.cmi35,
                          ##FUN-D80058--add--end--
                          #MOD-E80049-End-Mark 
                           'Y',g_user,g_grup,'',g_today,l_cmi.cmi00,sr1.cay12,g_legal)     #No.FUN-9B0118  #TQC-D40043 add cay12,g_legal
     CASE SQLCA.sqlcode
         WHEN "0" continue foreach
         WHEN "-239" UPDATE cmi_file SET cmi08=cmi08+l_tot 
                      WHERE cmi01=l_cmi.cmi01 AND cmi02=l_cmi.cmi02 AND cmi03=sr1.cda01
                        AND cmi04=sr1.cda02 AND cmi05=sr1.cda05 AND cmi06=sr1.cay03
                        AND cmi00= l_cmi.cmi00    #No.FUN-9B0118
                       #MOD-E80049-Start-Mark 
                       ##FUN-D80058--add--str--
                       #AND cmi13=l_cmi.cmi13
                       #AND cmi15=l_cmi.cmi15 AND cmi17=l_cmi.cmi17
                       #AND cmi19=l_cmi.cmi19 AND cmi21=l_cmi.cmi21
                       #AND cmi23=l_cmi.cmi23 AND cmi25=l_cmi.cmi25
                       #AND cmi27=l_cmi.cmi27 AND cmi13=l_cmi.cmi29
                       #AND cmi31=l_cmi.cmi31 AND cmi33=l_cmi.cmi33
                       #AND cmi35=l_cmi.cmi35
                       ##FUN-D80058--add--end--
                       #MOD-E80049-End-Mark 
         OTHERWISE
            CALL cl_err3("ins","cmi_file",l_cmi.cmi01,l_cmi.cmi02,SQLCA.sqlcode,'','',0)
            ROLLBACK WORK
            EXIT FOREACH
     END CASE
     END FOREACH
 
     #針對多部門,處理尾差的問題 (因為 l_tot=(l_tot1-l_tot2)*sr1.cay05 資料庫的小數點最多6位,可能造成尾差)
     DECLARE t211_s3 CURSOR FOR
      #SELECT DISTINCT cda01,cda02,cda05  #MOD-DB0069
      SELECT DISTINCT cda02,cda05  #MOD-DB0069
        FROM cda_file
       WHERE cda04 = '2'

     LET l_sql ="SELECT cay03 FROM cay_file ",
                " WHERE cay01 = ", l_cmi.cmi01,
                "  AND cay02 = ",l_cmi.cmi02,
                "  AND cay11 = '",l_cmi.cmi00,"'",   
                "  AND cay00 = ? ",
                "  AND cay06 = ? "

     PREPARE t211_cay FROM l_sql
     DECLARE t211_cay_c CURSOR FOR t211_cay
     LET l_cay03 = NULL

     #FOREACH t211_s3 INTO sr1.cda01,sr1.cda02,sr1.cda05  #MOD-DB0069
     FOREACH t211_s3 INTO sr1.cda02,sr1.cda05  #MOD-DB0069
       IF SQLCA.sqlcode THEN
          CALL cl_err('',SQLCA.sqlcode,0)
          ROLLBACK WORK
          EXIT FOREACH
       END IF
       FOREACH t211_cay_c USING sr1.cda02,sr1.cda05 INTO l_cay03   
         #借
         SELECT SUM(abb07)
               #abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add #MOD-E80049 Mark  
           INTO l_tot1 
               #l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   #FUN-D80058 add     #MOD-E80049 Mark
               #l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37    #FUN-D80058 add     #MOD-E80049 Mark 
           FROM aba_file,abb_file
          WHERE aba03=l_cmi.cmi01
            AND aba04=l_cmi.cmi02
            AND abb00=aba00
            AND abb01=aba01
            AND aba00=g_aaz.aaz64  
            AND aba00=l_cmi.cmi00  
            AND aba19='Y'
            AND abapost = 'Y'    
            AND abb03=sr1.cda05
            AND abb05=l_cay03      #取得所有部門的總和  
            AND abb06='1'
         #GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add  #MOD-E80049 Mark     
         #貸
         SELECT SUM(abb07)
               #abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add   #MOD-E80049 Mark 
           INTO l_tot2
               #l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   #FUN-D80058 add   #MOD-E80049 Mark
               #l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37    #FUN-D80058 add   #MOD-E80049 Mark 
           FROM aba_file,abb_file
          WHERE aba03=l_cmi.cmi01
            AND aba04=l_cmi.cmi02
            AND abb00=aba00
            AND abb01=aba01
            AND aba00=g_aaz.aaz64  
            AND aba00=l_cmi.cmi00  
            AND aba19='Y'
            AND abapost = 'Y'    
            AND abb03=sr1.cda05
            AND abb05=l_cay03  #取得所有部門的總和    
            AND abb06='2'
         #GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37   #FUN-D80058 add #MOD-E80049 Mark  
         IF cl_null(l_tot1) THEN LET l_tot1 = 0 END IF
         IF cl_null(l_tot2) THEN LET l_tot2 = 0 END IF
 
         SELECT SUM(cmi08) INTO l_tot FROM cmi_file
                                WHERE cmi01=l_cmi.cmi01
                                  AND cmi02=l_cmi.cmi02
                                  AND cmi00=l_cmi.cmi00    
                                  AND cmi04=sr1.cda02
                                  AND cmi05=sr1.cda05
                                  AND cmi06=l_cay03 #取得所有部門的總和
                                 #MOD-E80049-Start-Mark 
                                 ##FUN-D80058--add-str--
                                 #AND cmi13=l_abb11
                                 #AND cmi15=l_abb12
                                 #AND cmi17=l_abb13
                                 #AND cmi19=l_abb15
                                 #AND cmi21=l_abb31
                                 #AND cmi23=l_abb32
                                 #AND cmi25=l_abb33
                                 #AND cmi27=l_abb34
                                 #AND cmi29=l_abb35
                                 #AND cmi31=l_abb36
                                 #AND cmi33=l_abb37
                                 #AND cmi35=l_abb08
                                 ##FUN-D80058--add-end--
                                 #MOD-E80049-End-Mark 
 
         IF cl_null(l_tot) THEN LET l_tot = 0 END IF
 
         #判斷是否有尾差
         LET l_tot = (l_tot1 - l_tot2) - l_tot
         IF l_tot > 0 THEN
            #將差額加到分攤係數最高的那項
            DECLARE t211_s4 CURSOR FOR
             SELECT cay04           
               FROM cay_file
              WHERE cay01=l_cmi.cmi01
                AND cay02=l_cmi.cmi02
                AND cay11=l_cmi.cmi00     
               #AND cay04=sr1.cda01       
                AND cay03=l_cay03         
                AND cay00=sr1.cda02
                AND cay06=sr1.cda05
              ORDER BY cay05 DESC

            LET l_cay04 = NULL            
            FOREACH t211_s4 INTO l_cay04  
               EXIT FOREACH
            END FOREACH
 
            UPDATE cmi_file SET cmi08=cmi08+l_tot
                          WHERE cmi01=l_cmi.cmi01 AND cmi02=l_cmi.cmi02 AND cmi03=l_cay04      
                            AND cmi00=l_cmi.cmi00   #No.FUN-9B0118
                            AND cmi04=sr1.cda02 AND cmi05=sr1.cda05 AND cmi06=l_cay03 
                           #MOD-E80049-Start-Mark 
                           ##FUN-D80058--add-str--
                           #AND cmi13=l_abb11
                           #AND cmi15=l_abb12
                           #AND cmi17=l_abb13
                           #AND cmi19=l_abb15
                           #AND cmi21=l_abb31
                           #AND cmi23=l_abb32
                           #AND cmi25=l_abb33
                           #AND cmi27=l_abb34
                           #AND cmi29=l_abb35
                           #AND cmi31=l_abb36
                           #AND cmi33=l_abb37
                           #AND cmi35=l_abb08
                           ##FUN-D80058--add-end--
                           #MOD-E80049-End-Mark         

         END IF
       END FOREACH            
     END FOREACH
     CLOSE WINDOW t211a_w
     COMMIT WORK
 
END FUNCTION

#TQC-D40043--END--

FUNCTION t211_out()
DEFINE
    l_i             LIKE type_file.num5,          #No.FUN-680122 SMALLINT
    sr              RECORD                        #No.TQC-970203                                                                    
         cmi01      LIKE cmi_file.cmi01,          #No.TQC-970203                                                                    
         cmi02      LIKE cmi_file.cmi02,          #No.TQC-970203                                                                    
         cmi03      LIKE cmi_file.cmi03,          #No.TQC-970203                                                                    
         cmi04      LIKE cmi_file.cmi04,          #No.TQC-970203                                                                    
         cmi05      LIKE cmi_file.cmi05,          #No.TQC-970203                                                                    
         cmi06      LIKE cmi_file.cmi06,          #No.TQC-970203                                                                    
         cmi07      LIKE cmi_file.cmi07,          #No.TQC-970203                                                                    
         cmi08      LIKE cmi_file.cmi08           #No.TQC-970203                                                                    
       END RECORD,                                #No.TQC-970203 
    l_za05          LIKE za_file.za05,
    l_name          LIKE type_file.chr20          #No.FUN-680122 VARCHAR(20)              #External(Disk) file name

DEFINE l_cmd        STRING                        #No.FUN-9B0118
DEFINE l_wc         STRING                        #No.FUN-9B0118
 
    LET l_wc  = g_wc 
    IF cl_null(g_wc) AND NOT cl_null(g_cmia.cmi04)
                     AND NOT cl_null(g_cmia.cmi00)
                     AND NOT cl_null(g_cmia.cmi01)
                     AND NOT cl_null(g_cmia.cmi02)
                     AND NOT cl_null(g_cmia.cmi03) THEN
       LET g_wc="     cmi04 = '",g_cmia.cmi04,"'",
                " AND cmi00 = '",g_cmia.cmi00,"'",
                " AND cmi01 = '",g_cmia.cmi01,"'",
                " AND cmi02 = '",g_cmia.cmi02,"'",
                " AND cmi03 = '",g_cmia.cmi03,"'"
    END IF
    IF cl_null(g_wc) THEN
       CALL cl_err('','9057',0)
       RETURN
    END IF
    LET l_cmd = 'p_query "axct211" "',g_wc CLIPPED,'"'
    CALL cl_cmdrun(l_cmd)
    LET g_wc  = l_wc   

 
END FUNCTION
 

FUNCTION t211_cmi03(p_cmi03)                                                    
DEFINE p_cmi03         LIKE gem_file.gem01                                      
DEFINE l_gemacti       LIKE gem_file.gemacti                                    
                                                                                
    LET g_errno = ''                                                            
    SELECT gemacti  INTO l_gemacti FROM gem_file                                
     WHERE gem01 = p_cmi03                                                      
                                                                                
    CASE WHEN SQLCA.SQLCODE = 100  LET g_errno = 'mfg1318'                      
                                   LET l_gemacti = NULL                         
         WHEN l_gemacti='N'        LET g_errno = '9028'                         
         OTHERWISE                 LET g_errno = SQLCA.SQLCODE USING '-------'  
    END CASE                                                                    
                                                                                
END FUNCTION                                                                    

FUNCTION t211_cmi00(p_cmd,p_cmi00)
   DEFINE p_cmd           LIKE type_file.chr1
   DEFINE p_cmi00         LIKE cmi_file.cmi00
   DEFINE l_aaaacti       LIKE aaa_file.aaaacti

   LET g_errno = ' '

   SELECT aaaacti INTO l_aaaacti
     FROM aaa_file
    WHERE aaa01 = p_cmi00

   CASE WHEN SQLCA.SQLCODE=100   LET g_errno = 'agl-095'
        WHEN l_aaaacti = 'N'     LET g_errno = '9028'
        OTHERWISE                LET g_errno = SQLCA.sqlcode USING '----------'
   END CASE

END FUNCTION


FUNCTION t211_aeh()
   DEFINE l_cmi           RECORD LIKE cmi_file.*
   DEFINE l_sql           STRING     
   DEFINE l_cay           RECORD LIKE cay_file.*
   DEFINE l_aeh11         LIKE aeh_file.aeh11
   DEFINE l_aeh12         LIKE aeh_file.aeh12
   DEFINE l_sum           LIKE aah_file.aah04
   DEFINE l_aag05         LIKE aag_file.aag05
   DEFINE p_row,p_col     LIKE type_file.num5 
   DEFINE l_rate          LIKE abb_file.abb25    #No.FUN-9C0112
#No.MOD-D20129 --begin
   DEFINE l_cmi03	LIKE cmi_file.cmi03
   DEFINE l_cmi05	LIKE cmi_file.cmi05
   DEFINE l_cmi06	LIKE cmi_file.cmi06
   DEFINE l_cmi08	LIKE cmi_file.cmi08
   DEFINE l_aeh		LIKE cmi_file.cmi08
#No.MOD-D20129 --end
  #MOD-E80049-Start-Mark
  ##FUN-D80058--add--str--
  #DEFINE l_aeh03         LIKE aeh_file.aeh03
  #DEFINE l_aeh04         LIKE aeh_file.aeh04
  #DEFINE l_aeh05         LIKE aeh_file.aeh05
  #DEFINE l_aeh06         LIKE aeh_file.aeh06
  #DEFINE l_aeh07         LIKE aeh_file.aeh07
  #DEFINE l_aeh31         LIKE aeh_file.aeh31
  #DEFINE l_aeh32         LIKE aeh_file.aeh32
  #DEFINE l_aeh33         LIKE aeh_file.aeh33
  #DEFINE l_aeh34         LIKE aeh_file.aeh34
  #DEFINE l_aeh35         LIKE aeh_file.aeh35
  #DEFINE l_aeh36         LIKE aeh_file.aeh36
  #DEFINE l_aeh37         LIKE aeh_file.aeh37
  #DEFINE l_cmi13         LIKE cmi_file.cmi13
  #DEFINE l_cmi15         LIKE cmi_file.cmi15
  #DEFINE l_cmi17         LIKE cmi_file.cmi17
  #DEFINE l_cmi19         LIKE cmi_file.cmi19
  #DEFINE l_cmi21         LIKE cmi_file.cmi21
  #DEFINE l_cmi23         LIKE cmi_file.cmi23
  #DEFINE l_cmi25         LIKE cmi_file.cmi25
  #DEFINE l_cmi27         LIKE cmi_file.cmi27
  #DEFINE l_cmi29         LIKE cmi_file.cmi29
  #DEFINE l_cmi31         LIKE cmi_file.cmi31
  #DEFINE l_cmi33         LIKE cmi_file.cmi33
  #DEFINE l_cmi35         LIKE cmi_file.cmi35
  ##FUN-D80058--add--end--
  #MOD-E80049-End-Mark 
 
   LET p_row = 6 LET p_col = 6
       
   OPEN WINDOW t211a_w AT p_row,p_col WITH FORM "axc/42f/axct211_s"
        ATTRIBUTE (STYLE = g_win_style CLIPPED) 
   CALL cl_ui_locale("axct211_s")
   INITIALIZE l_cmi.* TO NULL
   CALL cl_set_comp_visible('cmi12',FALSE)
   INPUT BY NAME l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00,l_cmi.cmi12
                 WITHOUT DEFAULTS
 
     #No.MOD-D20052  --Begin
     BEFORE INPUT
        LET g_before_input_done = FALSE
        LET l_cmi.cmi01 = g_ccz.ccz01
        LET l_cmi.cmi02 = g_ccz.ccz02
        LET l_cmi.cmi00 = g_ccz.ccz12
        DISPLAY BY NAME l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00
     #No.MOD-D20052  --End
      
      AFTER FIELD cmi01
         IF NOT cl_null(l_cmi.cmi01) THEN
            IF l_cmi.cmi01 < g_ccz.ccz01 THEN
               CALL cl_err(l_cmi.cmi01,'axc-095',0)
               NEXT FIELD cmi01
            END IF
         END IF
      AFTER FIELD cmi02
         IF NOT cl_null(l_cmi.cmi02) THEN
            IF l_cmi.cmi01 = g_ccz.ccz01 AND l_cmi.cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(l_cmi.cmi02,'axc-095',0)     #No:MOD-9C0025 modify
              NEXT FIELD cmi02   #No:MOD-9C0025 modify
            END IF
         END IF
 
      AFTER FIELD cmi00
         IF NOT cl_null(l_cmi.cmi00) THEN
            CALL t211_cmi00('a',l_cmi.cmi00)
            IF NOT cl_null(g_errno) THEN
               CALL cl_err(l_cmi.cmi00,g_errno,0)
               NEXT FIELD cmi00
            END IF
         END IF
 
      ON ACTION about         #MOD-4C0121
         CALL cl_about()      #MOD-4C0121
 
      ON ACTION help          #MOD-4C0121
         CALL cl_show_help()  #MOD-4C0121
 
      ON ACTION controlg      #MOD-4C0121
         CALL cl_cmdask()     #MOD-4C0121
 
   END INPUT
   IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211a_w RETURN END IF
   IF NOT t211_chk_q310(l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02) THEN  #MOD-DB0167 add
      CLOSE WINDOW t211a_w  #MOD-DB0167 add
      RETURN                #MOD-DB0167 add
   END IF                   #MOD-DB0167 add

   DELETE FROM cmi_file
    WHERE cmi01= l_cmi.cmi01 
      AND cmi02= l_cmi.cmi02
      AND cmi00= l_cmi.cmi00   

   DECLARE t211_aeh_cs1 CURSOR FOR
      SELECT * FROM cay_file
       WHERE cay11 = l_cmi.cmi00
         AND cay01 = l_cmi.cmi01
         AND cay02 = l_cmi.cmi02

   BEGIN WORK
   LET g_success = 'Y'    #No.MOD-D20129
   FOREACH t211_aeh_cs1 INTO l_cay.*
      IF SQLCA.sqlcode THEN                                                                                                       
         CALL cl_err('',SQLCA.sqlcode,0)
         ROLLBACK WORK  
         LET g_success = 'N'   #No.MOD-D20129                                                                                
         EXIT FOREACH                                                                                                            
      END IF
      IF cl_null(l_cay.cay06) THEN LET l_cay.cay06 = ' ' END IF
#No.MOD-D30157 --begin
#No.MOD-D30094 --begin
      IF g_aza.aza26 = '2' AND l_cay.cay00 MATCHES '[23456]' THEN 
         SELECT SUM(aeh11),SUM(aeh12)
               #aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37   #FUN-D80058 add  #MOD-E80049 Mark 
           INTO l_aeh11,l_aeh12
               #l_aeh03,l_aeh04,l_aeh05,l_aeh06,l_aeh07,l_aeh31,   #FUN-D80058 add    #MOD-E80049 Mark
               #l_aeh32,l_aeh33,l_aeh34,l_aeh35,l_aeh36,l_aeh37    #FUN-D80058 add    #MOD-E80049 Mark 
           FROM aeh_file
          WHERE aeh00 = l_cay.cay11
            AND aeh01 = l_cay.cay06
            AND aeh02 = l_cay.cay03
            AND aeh09 = l_cay.cay01
            AND aeh10 <= l_cay.cay02 
         #GROUP BY aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,ahe37  #FUN-D80058 add  #MOD-E40165 mark
         #GROUP BY aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37                   #MOD-E40165 add #MOD-E80049 Mark
      ELSE 
         SELECT SUM(aeh11),SUM(aeh12)
               #aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37   #FUN-D80058 add #MOD-E80049 Mark 
           INTO l_aeh11,l_aeh12
               #l_aeh03,l_aeh04,l_aeh05,l_aeh06,l_aeh07,l_aeh31,   #FUN-D80058 add                        #MOD-E80049 Mark
               #l_aeh32,l_aeh33,l_aeh34,l_aeh35,l_aeh36,l_aeh37    #FUN-D80058 add                        #MOD-E80049 Mark
           FROM aeh_file
          WHERE aeh00 = l_cay.cay11
            AND aeh01 = l_cay.cay06
            AND aeh02 = l_cay.cay03
            AND aeh09 = l_cay.cay01
            AND aeh10 = l_cay.cay02 
         #GROUP BY aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,ahe37  #FUN-D80058 add  #MOD-E40165 mark 
         #GROUP BY aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37                   #MOD-E40165 add  #MOD-E80049 Mark
      END IF 
#      IF g_aza.aza26 <> '2' THEN 
#         SELECT SUM(aeh11),SUM(aeh12) INTO l_aeh11,l_aeh12
#           FROM aeh_file
#          WHERE aeh00 = l_cay.cay11
#            AND aeh01 = l_cay.cay06
#            AND aeh02 = l_cay.cay03
#            AND aeh09 = l_cay.cay01
#            AND aeh10 = l_cay.cay02 
#      ELSE 
#         IF l_cay.cay00 = '2' THEN 
#         SELECT SUM(aeh11),SUM(aeh12) INTO l_aeh11,l_aeh12
#           FROM aeh_file
#          WHERE aeh00 = l_cay.cay11
#            AND aeh01 = l_cay.cay06
#            AND aeh02 = l_cay.cay03
#            AND aeh09 = l_cay.cay01
#            AND aeh10 <= l_cay.cay02 
#      END IF 
#No.MOD-D30094 --end
#No.MOD-D30157 --end
      IF cl_null(l_aeh11) THEN LET l_aeh11 = 0 END IF
      IF cl_null(l_aeh12) THEN LET l_aeh12 = 0 END IF
      SELECT aag06,aag02 INTO l_aag06,l_cmi.cmi07 FROM aag_file
       WHERE aag01 = l_cay.cay06 AND aag00 = l_cay.cay11
      IF NOT cl_null(l_aag06) THEN LET l_aag06 = '1' END IF
      IF l_aag06 = '1' THEN  #借余
         LET l_sum = l_aeh11 - l_aeh12
      ELSE
         LET l_sum = l_aeh12 - l_aeh11
      END IF
      CALL s_get_cay05(l_cay.cay01,l_cay.cay02,l_cay.cay11,l_cay.cay06,l_cay.cay03,l_cay.cay05) 
           RETURNING l_rate
      LET l_sum = l_sum * l_rate
      IF cl_null(l_sum) THEN LET l_sum = 0 END IF
      #No.MOD-C40097  --Begin
      IF l_sum = 0 THEN
         CONTINUE FOREACH
      END IF
      #No.MOD-C40097  --End
     #MOD-E80049-Start-Mark 
     ##FUN-D80058--add--str--
     #IF NOT cl_null(l_aeh04) THEN 
     #   LET l_cmi.cmi13 = l_aeh04
     #ELSE
     #   LET l_cmi.cmi13 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh05) THEN 
     #   LET l_cmi.cmi15 = l_aeh05
     #ELSE
     #   LET l_cmi.cmi15 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh06) THEN 
     #   LET l_cmi.cmi17 = l_aeh06
     #ELSE
     #   LET l_cmi.cmi17 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh07) THEN 
     #   LET l_cmi.cmi19 = l_aeh07
     #ELSE
     #   LET l_cmi.cmi19 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh31) THEN 
     #   LET l_cmi.cmi21 = l_aeh31
     #ELSE
     #   LET l_cmi.cmi21 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh32) THEN 
     #   LET l_cmi.cmi23 = l_aeh32
     #ELSE
     #   LET l_cmi.cmi23 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh33) THEN 
     #   LET l_cmi.cmi25 = l_aeh33
     #ELSE
     #   LET l_cmi.cmi25 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh34) THEN 
     #   LET l_cmi.cmi27 = l_aeh34
     #ELSE
     #   LET l_cmi.cmi27 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh35) THEN 
     #   LET l_cmi.cmi29 = l_aeh35
     #ELSE
     #   LET l_cmi.cmi29 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh36) THEN 
     #   LET l_cmi.cmi31 = l_aeh36
     #ELSE
     #   LET l_cmi.cmi31 = ' ' 
     #END IF 
     #IF NOT cl_null(l_aeh37) THEN 
     #   LET l_cmi.cmi33 = l_aeh37
     #ELSE
     #   LET l_cmi.cmi33 = ' ' 
     #END IF 
     #LET l_cmi.cmi35 = l_aeh03
     #IF g_aaz.aaz119 ='Y' THEN 
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi13,'aag15','1') RETURNING l_cmi.cmi14
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi15,'aag16','2') RETURNING l_cmi.cmi16
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi17,'aag17','3') RETURNING l_cmi.cmi18
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi19,'aag18','4') RETURNING l_cmi.cmi20
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi21,'aag31','5') RETURNING l_cmi.cmi22
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi23,'aag32','6') RETURNING l_cmi.cmi24
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi25,'aag33','7') RETURNING l_cmi.cmi26
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi27,'aag34','8') RETURNING l_cmi.cmi28
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi29,'aag35','9') RETURNING l_cmi.cmi30
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi31,'aag36','10') RETURNING l_cmi.cmi32
     #  CALL t211_get_ahe02(l_cay.cay06,l_cmi.cmi33,'aag37','99') RETURNING l_cmi.cmi34
     #END IF
     ##FUN-D80058--add--end--
     #MOD-E80049-End-Mark  
      LET l_sum = cl_digcut(l_sum,g_azi04)     #No.MOD-D20129 
      INSERT INTO cmi_file(cmi01,cmi02,cmi03,cmi04,cmi05,cmi06,cmi07,cmi08,
                           cmi09,cmi10,
                          #MOD-E80049-Start-Mark 
                          ##FUN-D80058--add--str--
                          #cmi13,cmi14,cmi15,cmi16,cmi17,
                          #cmi18,cmi19,cmi20,cmi21,cmi22,
                          #cmi23,cmi24,cmi25,cmi26,cmi27,
                          #cmi28,cmi29,cmi30,cmi31,cmi32,
                          #cmi33,cmi34,cmi35,
                          ##FUN-D80058--add--end--
                          #MOD-E80049-End-Mark 
                           cmiacti,cmiuser,cmigrup,cmimodu,
      #                    cmidate,cmi051,cmiorig,cmioriu,cmi00,cmi12,cmioriu,cmiorig,cmilegal)    #FUN-A50075 add legal #FUN-AA0025
                           cmidate,cmi051,cmiorig,cmioriu,cmi00,cmi12,cmilegal)    #FUN-A50075 add legal #FUN-AA0025
                  VALUES(l_cmi.cmi01,l_cmi.cmi02,l_cay.cay04,l_cay.cay00,
                         l_cay.cay06,l_cay.cay03,l_cmi.cmi07,l_sum,'','',
                        #MOD-E80049-Start-Mark 
                        ##FUN-D80058--add--str--
                        #l_cmi.cmi13,l_cmi.cmi14,l_cmi.cmi15,
                        #l_cmi.cmi16,l_cmi.cmi17,l_cmi.cmi18,
                        #l_cmi.cmi19,l_cmi.cmi20,l_cmi.cmi21,
                        #l_cmi.cmi22,l_cmi.cmi23,l_cmi.cmi24,
                        #l_cmi.cmi25,l_cmi.cmi26,l_cmi.cmi27,
                        #l_cmi.cmi28,l_cmi.cmi29,l_cmi.cmi30,
                        #l_cmi.cmi31,l_cmi.cmi32,l_cmi.cmi33,
                        #l_cmi.cmi34,l_cmi.cmi35,
                        ##FUN-D80058--add--end--
                        #MOD-E80049-End-Mark 
                         'Y',g_user,g_grup,'',g_today,'',g_grup,g_user,
      #                  l_cmi.cmi00,l_cay.cay12, g_user, g_grup,g_legal)      #No.FUN-980030 10/01/04  insert columns oriu, orig   #FUN-A50075 add legal #FUN-AA0025
                         l_cmi.cmi00,l_cay.cay12, g_legal)      #No.FUN-980030 10/01/04  insert columns oriu, orig   #FUN-A50075 add legal #FUN-AA0025
 
      CASE SQLCA.sqlcode
          WHEN "0"    continue foreach
          WHEN "-239" UPDATE cmi_file SET cmi08=l_sum
                       WHERE cmi01=l_cmi.cmi01 AND cmi02=l_cmi.cmi02 
                         AND cmi03=l_cay.cay04 AND cmi04=l_cay.cay00
                         AND cmi05=l_cay.cay06 AND cmi06=l_cay.cay03
                         AND cmi00=l_cmi.cmi00 
                        #MOD-E80049-Start-Mark 
                        ##FUN-D80058--add--str--
                        #AND cmi13=l_cmi.cmi13
                        #AND cmi15=l_cmi.cmi15 AND cmi17=l_cmi.cmi17
                        #AND cmi19=l_cmi.cmi19 AND cmi21=l_cmi.cmi21
                        #AND cmi23=l_cmi.cmi23 AND cmi25=l_cmi.cmi25
                        #AND cmi27=l_cmi.cmi27 AND cmi13=l_cmi.cmi29
                        #AND cmi31=l_cmi.cmi31 AND cmi33=l_cmi.cmi33
                        #AND cmi35=l_cmi.cmi35
                        ##FUN-D80058--add--end--
                        #MOD-E80049-End-Mark 
          OTHERWISE
             CALL cl_err3("ins","cmi_file",l_cmi.cmi01,l_cmi.cmi02,SQLCA.sqlcode,'','',0)
             ROLLBACK WORK
             LET g_success = 'N'   #No.MOD-D20129 
             EXIT FOREACH
      END CASE
   END FOREACH

#No.MOD-D20129 --begin
   IF g_success = 'Y' THEN
   
#No.MOD-D30094 --begin
   IF g_aza.aza26 <> '2' THEN 
      LET g_sql = "SELECT cmi05,cmi06,s_cmi08,s_aeh ",                               #FUN-D80058 mark       #MOD-E80049 ReMark
                 #"SELECT cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,cmi21,",         #FUN-D80058 add        #MOD-E80049 Mark
                 #"       cmi23,cmi25,cmi27,cmi29,cmi31,cmi33,s_cmi08,s_aeh ",       #FUN-D80058 add        #MOD-E80049 Mark
                  "  FROM (select cmi05,cmi06,sum(cmi08) s_cmi08 from cmi_file ",    #FUN-D80058 mark       #MOD-E80049 ReMark
                 #"  FROM (select cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,cmi21,", #FUN-D80058 add        #MOD-E80049 Mark
                 #"               cmi23,cmi25,cmi27,cmi29,cmi31,cmi33,",             #FUN-D80058 add        #MOD-E80049 Mark 
                 #"               sum(cmi08) s_cmi08 from cmi_file ",                #FUN-D80058 add        #MOD-E80049 Mark 
                  "         where cmi00 = '",l_cmi.cmi00,"' and cmi01 = ",l_cmi.cmi01," and cmi02= ",l_cmi.cmi02,
                  "         group by cmi05,cmi06 ),",
                 #"         group by cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,",    #FUN-D80058 add                    #MOD-E80049 Mark
                 #"                  cmi21,cmi23,cmi25,cmi27,cmi29,cmi31,cmi33),",   #FUN-D80058 add                    #MOD-E80049 Mark
                  "       (select aeh01,aeh02, ",                                    #FUN-D80058 mark                   #MOD-E80049 ReMark 
                 #"       (select aeh01,aeh02,aeh03,aeh04,aeh05,aeh06,aeh07, ",      #FUN-D80058 add                    #MOD-E80049 Mark
                 #"               aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,ahe37, ",      #FUN-D80058 add #MOD-E40165 mark   
                 #"               aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37, ",                      #MOD-E40165 add    #MOD-E80049 Mark
                  "       SUM((CASE WHEN aag06 ='1' THEN 1 ELSE -1 END)*(aeh11-aeh12)) s_aeh from aeh_file,aag_file ",
                  "         where aeh00 = aag00 and aeh01 = aag01 and aeh00 = '",l_cmi.cmi00,"'",
                  "           and aeh09 = ",l_cmi.cmi01," and aeh10 = ",l_cmi.cmi02,
                  "         group by aeh01,aeh02 )",                                 #FUN-D80058 mark                   #MOD-E80049 ReMark
                 #"         group by aeh01,aeh02,aeh03,aeh04,aeh05,aeh06,aeh07,",    #FUN-D80058 add                    #MOD-E80049 Mark
                 #"                  aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,ahe37)",    #FUN-D80058 add #MOD-E40165 mark
                 #"                  aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37)",                    #MOD-E40165 add    #MOD-E80049 Mark
                  " WHERE cmi05 = aeh01 AND cmi06 = aeh02 AND s_cmi08 <> s_aeh "
   ELSE 
      LET g_sql = "SELECT cmi05,cmi06,s_cmi08,s_aeh ",                               #FUN-D80058 mark                   #MOD-E80049 ReMark
                 #"SELECT cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,cmi21,",         #FUN-D80058 add                    #MOD-E80049 Mark
                 #"       cmi23,cmi25,cmi27,cmi29,cmi31,cmi33,s_cmi08,s_aeh ",       #FUN-D80058 add                    #MOD-E80049 Mark
                  "  FROM (select cmi05,cmi06,sum(cmi08) s_cmi08 from cmi_file ",    #FUN-D80058 mark                   #MOD-E80049 ReMark
                 #"  FROM (select cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,cmi21,", #FUN-D80058 add                    #MOD-E80049 Mark
                 #"               cmi23,cmi25,cmi27,cmi29,cmi31,cmi33,",             #FUN-D80058 add                    #MOD-E80049 Mark
                 #"               sum(cmi08) s_cmi08 from cmi_file ",                #FUN-D80058 add                    #MOD-E80049 Mark                              
                  "         where cmi00 = '",l_cmi.cmi00,"' and cmi01 = ",l_cmi.cmi01," and cmi02= ",l_cmi.cmi02,
                  "           and cmi04 ='1' ",
                  "         group by cmi05,cmi06 ),",                                #FUN-D80058 mark                   #MOD-E80049 ReMark               
                 #"         group by cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,",    #FUN-D80058 add                    #MOD-E80049 Mark
                 #"                  cmi21,cmi23,cmi25,cmi27,cmi29,cmi31,cmi33),",   #FUN-D80058 add                    #MOD-E80049 Mark 
                  "       (select aeh01,aeh02, ",                                    #FUN-D80058 mark                   #MOD-E80049 ReMark
                 #"       (select aeh01,aeh02,aeh03,aeh04,aeh05,aeh06,aeh07, ",      #FUN-D80058 add                    #MOD-E80049 Mark
                 #"               aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,ahe37, ",      #FUN-D80058 add  #MOD-E40165 mark
                 #"               aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37, ",                       #MOD-E40165 add   #MOD-E80049 Mark
                  "       SUM((CASE WHEN aag06 ='1' THEN 1 ELSE -1 END)*(aeh11-aeh12)) s_aeh from aag_file,aeh_file ",  
                  "         where aeh00 = aag00 and aeh01 = aag01 and aeh00 = '",l_cmi.cmi00,"'",
                  "           and aeh09 = ",l_cmi.cmi01," and aeh10 = ",l_cmi.cmi02,
                  "         group by aeh01,aeh02 )",                                 #FUN-D80058 mark                   #MOD-E80049 ReMark
                 #"         group by aeh01,aeh02,aeh03,aeh04,aeh05,aeh06,aeh07,",    #FUN-D80058 add                    #MOD-E80049 Mark
                 #"                  aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,ahe37)",    #FUN-D80058 add #MOD-E40165 mark 
                 #"                  aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37)",                    #MOD-E40165 add    #MOD-E80049 Mark
                  " WHERE cmi05 = aeh01 AND cmi06 = aeh02 AND s_cmi08 <> s_aeh",
                  " UNION ",
                  "SELECT cmi05,cmi06,s_cmi08,s_aeh ",                               #FUN-D80058 mark                   #MOD-E80049 ReMark  
                 #"SELECT cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,cmi21,",         #FUN-D80058 add                    #MOD-E80049 Mark  
                 #"       cmi23,cmi25,cmi27,cmi29,cmi31,cmi33,s_cmi08,s_aeh ",       #FUN-D80058 add                    #MOD-E80049 Mark
                  "  FROM (select cmi05,cmi06,sum(cmi08) s_cmi08 from cmi_file ",    #FUN-D80058 mark                   #MOD-E80049 REMark
                 #"  FROM (select cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,cmi21,", #FUN-D80058 add                    #MOD-E80049 Mark
                 #"               cmi23,cmi25,cmi27,cmi29,cmi31,cmi33,",             #FUN-D80058 add                    #MOD-E80049 Mark
                 #"               sum(cmi08) s_cmi08 from cmi_file ",                #FUN-D80058 add                    #MOD-E80049 Mark        
                  "         where cmi00 = '",l_cmi.cmi00,"' and cmi01 = ",l_cmi.cmi01," and cmi02= ",l_cmi.cmi02,
                  "           and (cmi04 ='2' or cmi04 ='3' or cmi04 ='4' or cmi04 ='5' or cmi04 ='6')",
                  "         group by cmi05,cmi06 ),",                                #FUN-D80058 mark                   #MOD-E80049 ReMark
                 #"         group by cmi05,cmi06,cmi35,cmi13,cmi15,cmi17,cmi19,",    #FUN-D80058 add                    #MOD-E80049 Mark 
                 #"                  cmi21,cmi23,cmi25,cmi27,cmi29,cmi31,cmi33),",   #FUN-D80058 add                    #MOD-E80049 Mark  
                  "       (select aeh01,aeh02, ",                                    #FUN-D80058 mark                   #MOD-E80049 ReMark
                 #"       (select aeh01,aeh02,aeh03,aeh04,aeh05,aeh06,aeh07, ",      #FUN-D80058 add                    #MOD-E80049 Mark
                 #"               aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,ahe37, ",      #FUN-D80058 add #MOD-E40165 mark
                 #"               aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37, ",                      #MOD-E40165 add    #MOD-E80049 Mark
                  "       SUM((CASE WHEN aag06 ='1' THEN 1 ELSE -1 END)*(aeh11-aeh12)) s_aeh from aag_file,aeh_file ",  
                  "         where aeh00 = aag00 and aeh01 = aag01 and aeh00 = '",l_cmi.cmi00,"'",
                  "           and aeh09 = ",l_cmi.cmi01," and aeh10 <= ",l_cmi.cmi02,
                  "         group by aeh01,aeh02 )",                                #FUN-D80058 mark                   #MOD-E80049 ReMark      
                 #"         group by aeh01,aeh02,aeh03,aeh04,aeh05,aeh06,aeh07,",    #FUN-D80058 add                    #MOD-E80049 Mark  
                 #"                  aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,ahe37)",    #FUN-D80058 add #MOD-E40165 mark
                 #"                  aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37)",                    #MOD-E40165 add    #MOD-E80049 Mark
                  " WHERE cmi05 = aeh01 AND cmi06 = aeh02 AND s_cmi08 <> s_aeh"
   END IF 
#No.MOD-D30094 --end
   PREPARE t211_pre_wc FROM g_sql 
   IF SQLCA.SQLCODE THEN
      CALL cl_err('t211_pre_wc:',SQLCA.SQLCODE,1)
      ROLLBACK WORK
      RETURN
   END IF
   DECLARE t211_wc CURSOR FOR t211_pre_wc

   LET g_sql = " SELECT cmi03 FROM ",
               "  (select cmi03 from cmi_file where cmi00 = '",l_cmi.cmi00,"' AND cmi01 = ",l_cmi.cmi01," and cmi02 = ",l_cmi.cmi02,
               "                                and cmi05 = ? and cmi06 = ?  order by cmi08 desc) ",
               "  WHERE rownum = 1 "
   PREPARE t211_max_cmi03 FROM g_sql
   
   FOREACH t211_wc INTO l_cmi05,l_cmi06,
                       #MOD-E80049-Start-Mark
                       #l_cmi35,l_cmi13,l_cmi15,        #FUN-D80058 add l_cmi35,l_cmi13,l_cmi15
                       #l_cmi17,l_cmi19,l_cmi21,l_cmi23,l_cmi25,        #FUN-D80058 add
                       #l_cmi27,l_cmi29,l_cmi31,l_cmi33,
                       #MOD-E80049-End-Mark
                        l_cmi08,l_aeh   #FUN-D80058 add l_cmi27,l_cmi29,l_cmi31,l_cmi33
      IF SQLCA.sqlcode THEN
         CALL cl_err('t211_wc:',SQLCA.sqlcode,1)
         LET g_success = 'N'
         EXIT FOREACH
      END IF
      IF cl_null(l_cmi08) THEN LET l_cmi08 = 0 END IF
      IF cl_null(l_aeh) THEN LET l_aeh = 0 END IF

      EXECUTE t211_max_cmi03 USING l_cmi05,l_cmi06 INTO l_cmi03
      IF SQLCA.SQLCODE <> 0 THEN
         LET g_success = 'N'
         EXIT FOREACH
      END IF

      UPDATE cmi_file 
         SET cmi08 = cmi08 - (l_cmi08 - l_aeh) 
       WHERE cmi00 = l_cmi.cmi00
         AND cmi01 = l_cmi.cmi01
         AND cmi02 = l_cmi.cmi02
         AND cmi03 = l_cmi03
         AND cmi05 = l_cmi05
         AND cmi06 = l_cmi06
        #MOD-E80049-Start-Mark 
        ##FUN-D80058--add--str--
        #AND cmi13 = l_cmi13
        #AND cmi15 = l_cmi15
        #AND cmi17 = l_cmi17
        #AND cmi19 = l_cmi19
        #AND cmi21 = l_cmi21
        #AND cmi23 = l_cmi23
        #AND cmi25 = l_cmi25
        #AND cmi27 = l_cmi27
        #AND cmi29 = l_cmi29
        #AND cmi31 = l_cmi31
        #AND cmi33 = l_cmi33
        #AND cmi35 = l_cmi35
        ##FUN-D80058--add--end--
        #MOD-E80049-End-Mark 
      IF SQLCA.SQLCODE <> 0 THEN
         LET g_success = 'N'
         EXIT FOREACH
      END IF
   END FOREACH
   END IF
   IF g_success = 'Y' THEN
      CALL cl_err('','aic-059',1)
      COMMIT WORK
   ELSE
      CALL cl_err('','abm-020',1)
      ROLLBACK WORK
   END IF
#No.MOD-D20129 --end

   CLOSE WINDOW t211a_w
   COMMIT WORK

END FUNCTION


#MOD-E80049-Start-Mark
##FUN-D80058--add--str--
#FUNCTION t211_cmi35(p_cmd)
# DEFINE p_cmd      LIKE type_file.chr1,   
#        l_pja02    LIKE pja_file.pja02,   
#        l_pjaacti  LIKE pja_file.pjaacti  
#       ,l_pjaclose LIKE pja_file.pjaclose 
#       ,l_pjaconf  LIKE pja_file.pjaconf  
 
#  LET g_errno = ' '
#    SELECT pja02,pjaacti,pjaclose,pjaconf INTO l_pja02,l_pjaacti,l_pjaclose,l_pjaconf   
#            FROM pja_file WHERE pja01 = g_cmi[l_ac].cmi35
#    CASE WHEN SQLCA.SQLCODE=100   LET g_errno = 'agl-007'
#         WHEN l_pjaacti = 'N'     LET g_errno = '9028'    
#         WHEN l_pjaclose = 'Y'    LET g_errno = 'abg-503' 
#         WHEN l_pjaconf = 'N'     LET g_errno = 'apj-601' 
#         OTHERWISE           LET g_errno = SQLCA.sqlcode USING '----------'
#    END CASE
#END FUNCTION

#FUNCTION t211_error(p_code)
# DEFINE p_code   LIKE aag_file.aag15,
#        l_str    LIKE ze_file.ze03,   
#        l_ahe02  LIKE ahe_file.ahe02  
 
#    SELECT ahe02 INTO l_ahe02 FROM ahe_file WHERE ahe01 = p_code 
 
#    #-->顯示狀況
#    IF p_code IS NOT NULL AND p_code != ' ' THEN
#      CALL cl_getmsg('agl-098',g_lang) RETURNING l_str
#      LET l_str = l_str CLIPPED,l_ahe02,'!' 
#       ERROR l_str
#   END IF
#END FUNCTION

#FUNCTION t211_get_ahe02(p_aag01,p_aed02,p_gaq01,p_aee02) 
#  DEFINE p_aag01         LIKE type_file.chr50
#  DEFINE p_aed02         LIKE aed_file.aed02
#  DEFINE p_gaq01         LIKE gaq_file.gaq01  
#  DEFINE l_ahe01         LIKE ahe_file.ahe01
#  DEFINE l_ahe03         LIKE ahe_file.ahe03   
#  DEFINE l_ahe04         LIKE ahe_file.ahe04
#  DEFINE l_ahe05         LIKE ahe_file.ahe05
#  DEFINE l_ahe07         LIKE ahe_file.ahe07
#  DEFINE l_sql1          STRING              
#  DEFINE l_ahe02_d       LIKE ze_file.ze03
#  DEFINE p_aee02         LIKE aee_file.aee02    

#     IF g_aaz.aaz119 ='N' THEN RETURN ' ' END IF 
#     #查找異動碼(核算項)值
#     LET l_sql1 = " SELECT ",p_gaq01 CLIPPED," FROM aag_file ",
#                  "  WHERE aag00 = '",g_cmi00,"'",
#                  "    AND aag01 LIKE ? ",
#                  "    AND aag07 IN ('2','3') ",
#                  "    AND ",p_gaq01 CLIPPED," IS NOT NULL"
#     PREPARE t211_gaq01_p FROM l_sql1
#     IF SQLCA.sqlcode != 0 THEN
#        CALL cl_err('prepare:',SQLCA.sqlcode,1)
#     END IF
#     DECLARE t211_gaq01_cs SCROLL CURSOR FOR t211_gaq01_p  

#     #取異動碼(核算項)名稱
#     LET l_ahe01 = NULL
#     OPEN t211_gaq01_cs USING p_aag01
#     IF SQLCA.sqlcode THEN
#        CLOSE t211_gaq01_cs
#        RETURN NULL
#     END IF
#     FETCH FIRST t211_gaq01_cs INTO l_ahe01
#     IF SQLCA.sqlcode THEN
#        CLOSE t211_gaq01_cs
#        RETURN NULL
#     END IF
#     CLOSE t211_gaq01_cs
#     IF NOT cl_null(l_ahe01) THEN
#        LET l_ahe03 = ''   
#        LET l_ahe04 = ''    
#        LET l_ahe05 = ''     
#        LET l_ahe07 = ''     
#        SELECT ahe03,ahe04,ahe05,ahe07 INTO l_ahe03,l_ahe04,l_ahe05,l_ahe07 
#          FROM ahe_file
#         WHERE ahe01 = l_ahe01
#        IF NOT cl_null(l_ahe04) AND NOT cl_null(l_ahe05) AND
#           NOT cl_null(l_ahe07) AND (l_ahe03 = '1' OR l_ahe03 = '4') THEN  
#           LET l_ahe02_d = ''                           
#           LET l_sql1 = "SELECT UNIQUE ",l_ahe07 CLIPPED,
#                        "  FROM ",l_ahe04 CLIPPED,
#                        " WHERE ",l_ahe05 CLIPPED," = '",p_aed02,"'"
#           PREPARE ahe_p1 FROM l_sql1
#           EXECUTE ahe_p1 INTO l_ahe02_d
#        END IF
#        IF l_ahe03 = '2' THEN
#           LET l_ahe02_d = '' 
#           SELECT aee04 INTO l_ahe02_d
#             FROM aee_file
#            WHERE aee00 = g_cmi00
#              AND aee01 = p_aag01
#              AND aee02 = p_aee02
#              AND aee03 = p_aed02 
#        END IF
#        IF l_ahe03 = '3' THEN
#           LET l_ahe02_d = p_aed02
#        END IF
#     END IF

#     RETURN l_ahe02_d
#END FUNCTION

#FUNCTION t211_set_required(p_cmd)
#   DEFINE p_cmd       LIKE type_file.chr1   
#   DEFINE l_occ37     LIKE occ_file.occ37   
#   DEFINE l_pmc903    LIKE pmc_file.pmc903  
# 
#   IF INFIELD(cmi05) OR NOT g_before_input_done THEN
 
#      #是否作線上預算控制(Y/N)
#     IF m_aag21 = 'Y' THEN
#         CALL cl_set_comp_required("cmi31",TRUE)
#      END IF
 
#      #是否作專案管理(Y/N)
#      IF m_aag23 = 'Y' THEN
#         CALL cl_set_comp_required("cmi29",TRUE)  
#      END IF
 
#     #異動碼-1控制方式
#       IF m_aag151='2' OR m_aag151='3' THEN   
#         CALL cl_set_comp_required("cmi14",TRUE)
#      END IF
 
#      #異動碼-2控制方式
#       IF m_aag161='2' OR m_aag161='3' THEN   
#         CALL cl_set_comp_required("cmi15",TRUE)
#      END IF
 
#      #異動碼-3控制方式
#       IF m_aag171='2' OR m_aag171='3' THEN    
#         CALL cl_set_comp_required("cmi17",TRUE)
#     END IF
 
#      #異動碼-4控制方式
#       IF m_aag181='2' OR m_aag181='3' THEN    
#         CALL cl_set_comp_required("cmi19",TRUE)
#      END IF
 
#      #異動碼-5控制方式
#      IF m_aag311='2' OR m_aag311='3' THEN
#         CALL cl_set_comp_required("cmi21",TRUE)
#      END IF
#      #異動碼-6控制方式
#       IF m_aag321='2' OR m_aag321='3' THEN
#         CALL cl_set_comp_required("cmi23",TRUE)
#      END IF
#      #異動碼-7控制方式
#       IF m_aag331='2' OR m_aag331='3' THEN
#         CALL cl_set_comp_required("cmi25",TRUE)
#      END IF
#      #異動碼-8控制方式
#       IF m_aag341='2' OR m_aag341='3' THEN
#         CALL cl_set_comp_required("cmi27",TRUE)
#      END IF
#      #關係人異動碼控制方式
#       IF m_aag371='2' OR m_aag371='3' THEN  
#         CALL cl_set_comp_required("cmi33",TRUE)
#      END IF
#   END IF
#END FUNCTION

#FUNCTION t211_set_no_required(p_cmd)
#   DEFINE p_cmd   LIKE type_file.chr1   
 
#   CALL cl_set_comp_required("cmi13,cmi15,cmi17,cmi19",FALSE)          
 
#   CALL cl_set_comp_required("cmi21,cmi23,cmi25,cmi27,cmi31,cmi33",FALSE)     
#   IF m_aag23 = 'N' AND cl_null(m_aag23) THEN
#      CALL cl_set_comp_required("cmi35,cmi29",FALSE)  
#   END IF
 
#END FUNCTION

#FUNCTION t211_cmi29(p_cmd)
# DEFINE p_cmd      LIKE type_file.chr1, 
#        l_pjb01    LIKE pjb_file.pjb01,  
#        l_pjbacti  LIKE pjb_file.pjbacti,  
#        l_pjb25    LIKE pjb_file.pjb25
#DEFINE  l_pjb09    LIKE pjb_file.pjb09                     
#DEFINE  l_pjb11    LIKE pjb_file.pjb11                  
 
#    LET g_errno = ' '
#    SELECT pjb01,pjbacti,pjb09,pjb11,pjb25                 
#      INTO l_pjb01,l_pjbacti,l_pjb09,l_pjb11,l_pjb25      
#      FROM pjb_file
#     WHERE pjb02 = g_cmi[l_ac].cmi29
#       AND pjb01 = g_cmi[l_ac].cmi35   
#    CASE WHEN SQLCA.SQLCODE=100   LET g_errno = 'apj-060'
#         WHEN l_pjbacti = 'N'     LET g_errno = '9028' 
#         WHEN l_pjb09 ! = 'Y'     LET g_errno = 'apj-090'  
#         WHEN l_pjb11 ! = 'Y'     LET g_errno = 'apj-090'  
#         OTHERWISE           LET g_errno = SQLCA.sqlcode USING '----------'
#    END CASE
#END FUNCTION

#FUNCTION t211_cmi31(p_cmd)
# DEFINE p_cmd      LIKE type_file.chr1, 
#        l_azf02    LIKE azf_file.azf02,  
#        l_azf03    LIKE azf_file.azf03,
#        l_azfacti  LIKE azf_file.azfacti   
#DEFINE  l_azf09    LIKE azf_file.azf09        
 
#    LET g_errno = ' '
#    SELECT azf02,azf03,azfacti,azf09 INTO l_azf02,l_azf03,l_azfacti,l_azf09     
#            FROM azf_file WHERE azf01 = g_cmi[l_ac].cmi31
#             AND azf02 ='2'                                                     
#    CASE WHEN SQLCA.SQLCODE=100   LET g_errno = 'mfg3088'
#         WHEN l_azfacti = 'N'     LET g_errno = '9028' 
#         WHEN l_azf02 ! = '2'     LET g_errno = 'mfg3088' 
#         WHEN l_azf09 !='7'       LET g_errno='aoo-406'                            
#         OTHERWISE           LET g_errno = SQLCA.sqlcode USING '----------'
#    END CASE
#END FUNCTION

#FUNCTION t211_bud(p_cmd,p_flag,p_cmi)                
#   DEFINE p_cmd      LIKE type_file.chr1
#   DEFINE p_flag     LIKE type_file.chr1
#   DEFINE l_msg      LIKE ze_file.ze03
#   DEFINE l_tol      LIKE abb_file.abb07
#   DEFINE l_tol1     LIKE abb_file.abb07
#   DEFINE total_t    LIKE abb_file.abb07 
#   DEFINE l_flag     LIKE type_file.num5
#   DEFINE l_afb07    LIKE afb_file.afb07
#   DEFINE l_amt      LIKE afc_file.afc07
#   DEFINE l_abb05    LIKE abb_file.abb05
#   DEFINE l_buf      LIKE ze_file.ze03
#   DEFINE l_buf1     LIKE ze_file.ze03
#   DEFINE l_flag1    LIKE type_file.chr1
#   DEFINE l_bookno1  LIKE aaa_file.aaa01
#   DEFINE l_bookno2  LIKE aaa_file.aaa01
#   DEFINE l_fac      LIKE type_file.num5  
#   DEFINE l_aag04    LIKE aag_file.aag04     
#   DEFINE p_cmi      RECORD 
#                     cmi05       LIKE cmi_file.cmi05,   #科目編號
#                     cmi06       LIKE cmi_file.cmi06,   #部門
#                     cmi07       LIKE cmi_file.cmi07,   #名稱/說明
#                     cmi08       LIKE cmi_file.cmi08,   #當期異動金額
#                     cmi35       LIKE cmi_file.cmi35,
#                     cmi13       LIKE cmi_file.cmi13,   
#                     cmi14       LIKE cmi_file.cmi14,
#                     cmi15       LIKE cmi_file.cmi15,
#                     cmi16       LIKE cmi_file.cmi16,
#                     cmi17       LIKE cmi_file.cmi17,
#                     cmi18       LIKE cmi_file.cmi18,
#                     cmi19       LIKE cmi_file.cmi19,
#                     cmi20       LIKE cmi_file.cmi20,
#                     cmi21       LIKE cmi_file.cmi21,
#                     cmi22       LIKE cmi_file.cmi22,
#                     cmi23       LIKE cmi_file.cmi23,
#                     cmi24       LIKE cmi_file.cmi24,
#                     cmi25       LIKE cmi_file.cmi25,
#                     cmi26       LIKE cmi_file.cmi26,
#                     cmi27       LIKE cmi_file.cmi27,
#                     cmi28       LIKE cmi_file.cmi28,
#                     cmi29       LIKE cmi_file.cmi29,
#                     cmi30       LIKE cmi_file.cmi30,
#                     cmi31       LIKE cmi_file.cmi31,
#                     cmi32       LIKE cmi_file.cmi32,
#                     cmi33       LIKE cmi_file.cmi33,
#                     cmi34       LIKE cmi_file.cmi34
#                     END RECORD
   
#   IF g_cmi.getLength() = 0 THEN RETURN END IF 
#   LET g_errno = ''
#   SELECT aag21,aag04 INTO m_aag21,l_aag04                 
#     FROM aag_file                                       
#    WHERE aag01 = p_cmi.cmi05                         
#      AND aag00 = g_cmi00                             
#   IF m_aag21 <> 'Y' THEN
#      RETURN
#   END IF
                                              
#   IF g_aza.aza08 = 'N' THEN    
#      LET p_cmi.cmi35 = ' '   
#      LET p_cmi.cmi29 = ' '           
#   END IF
   
#   IF g_cmi00 IS NULL OR g_cmi01 IS NULL OR
#      g_cmi02 IS NULL OR p_cmi.cmi05 IS NULL OR
#      p_cmi.cmi06 IS NULL OR p_cmi.cmi35 IS NULL OR 
#      p_cmi.cmi29 IS NULL OR p_cmi.cmi31 IS NULL THEN
#      RETURN
#   END IF
                                                    
#    SELECT aag06                                                                
#        INTO m_aag06                                                            
#        FROM aag_file                                                           
#        WHERE aag01 = p_cmi.cmi05           
#          AND aag00 = g_cmi00                                                          
#   CALL s_get_bookno(g_cmi01) RETURNING l_flag1,l_bookno1,l_bookno2
#   IF l_flag1 = '1' THEN
#      CALL s_errmsg("",'',g_cmi01,'aoo-081',1)  
#      LET g_errno = 'aoo-081'
#   END IF
 
#   IF g_cmi00 = l_bookno1 THEN
#      LET p_flag = '0'
#   ELSE
#     LET p_flag = '1'
#  END IF
   
#  CALL s_getbug1(g_cmi00,p_cmi.cmi31,p_cmi.cmi05,
#                 g_cmi01,p_cmi.cmi29,p_cmi.cmi06,
#                 p_cmi.cmi35,g_cmi02,p_flag)     
#       RETURNING l_flag,l_afb07,l_amt
   
#  IF l_flag = TRUE THEN
#     LET l_msg = g_cmi00,'/',p_cmi.cmi31,'/',p_cmi.cmi05,'/',
#                 g_cmi01,'/',p_cmi.cmi29,'/',p_cmi.cmi06,'/',
#                 p_cmi.cmi35,'/',g_cmi02,'/',p_flag,'/',l_amt

#     CALL s_errmsg("",'',l_msg,'aoo-081',1) 
#  ELSE
#     IF l_afb07 = '2' AND l_amt < 0 THEN
#        LET l_msg = g_cmi00,'/',p_cmi.cmi31,'/',p_cmi.cmi05,'/',
#                    g_cmi01,'/',p_cmi.cmi29,'/',p_cmi.cmi06,'/',
#                    p_cmi.cmi35,'/',g_cmi02,'/',p_flag,'/',l_amt
#        LET g_errno =' '
#     END IF
#  END IF     
   
#  LET g_afb07 = l_afb07                      
#  #-->不做超限控制
#   IF l_afb07  != '1' THEN
#      SELECT SUM(abb07) INTO l_tol 
#        FROM abb_file,aba_file
#       WHERE abb00 = aba00 
#         AND aba01 = abb01
#         AND aba00 = g_cmi00
#         AND aba03 = g_cmi01
#         AND aba04 = g_cmi02
#         AND abb03 = p_cmi.cmi05
#         AND abb08 = p_cmi.cmi35
#         AND abb35 = p_cmi.cmi29
#         AND abb36 = p_cmi.cmi31
#         AND abb05 = p_cmi.cmi06
#         AND abb06 = '1'                     #借方
#         AND abapost <> 'Y'                  
#         AND aba19 <> 'X' 
#      IF SQLCA.sqlcode OR l_tol IS NULL THEN
#         LET l_tol = 0
#      END IF
 
#      SELECT SUM(abb07) INTO l_tol1 FROM abb_file,aba_file
#      WHERE abb00 = aba00 
#         AND aba01 = abb01
#         AND aba00 = g_cmi00
#         AND aba03 = g_cmi01
#         AND aba04 = g_cmi02
#         AND abb03 = p_cmi.cmi05
#         AND abb08 = p_cmi.cmi35
#         AND abb35 = p_cmi.cmi29
#         AND abb36 = p_cmi.cmi31
#         AND abb05 = p_cmi.cmi06
#         AND abb06 = '2'                     #貸方
#         AND abapost <> 'Y'                
#         AND aba19 <> 'X'
#      IF SQLCA.sqlcode OR l_tol1 IS NULL THEN
#         LET l_tol1 = 0
#      END IF
 
#      LET l_fac = 1   
#      IF m_aag06 = '1' THEN                     #借餘
#         LET total_t = l_tol - l_tol1           #借減貸
#      ELSE                                      #貸餘
#         LET total_t = l_tol1 - l_tol           #貸減借
#      END IF
      
#   IF g_action_choice != 'confirm' OR cl_null(g_action_choice) THEN  
#      IF p_cmd = 'a' THEN                       #若本筆資料為新增則加上本次輸入的值
#         LET total_t = total_t + p_cmi.cmi08 * l_fac                
#      ELSE                                      #若為更改則減掉舊值再加上新值
#         LET total_t = total_t - g_cmi_t.cmi08 * l_fac + p_cmi.cmi08 * l_fac       
#      END IF
#   END IF    
      
#      IF p_cmd = 'u' THEN                        
#         LET l_amt = l_amt + p_cmi.cmi08         
#      END IF                                    
#      IF p_cmi.cmi08 > l_amt THEN               
#         CASE l_afb07
#            WHEN '2'
#               CALL cl_getmsg('agl-140',0) RETURNING l_buf
#               CALL cl_getmsg('agl-141',0) RETURNING l_buf1
#               LET g_sql = l_buf CLIPPED,' ',total_t,
#                           l_buf1 CLIPPED,' ',l_amt
#               LET g_errno = ''
#               CALL s_errmsg('cmi31',p_cmi.cmi05,g_sql,'agl-233',1)  
#            WHEN '3'
#               CALL cl_getmsg('agl-142',0) RETURNING l_buf
#               CALL cl_getmsg('agl-143',0) RETURNING l_buf1
#               LET g_sql = l_buf CLIPPED,' ',total_t,
#                           l_buf1 CLIPPED,' ',l_amt
#               LET g_errno = 'agl-233'
#               CALL s_errmsg('cmi31',p_cmi.cmi05,g_sql,'agl-233',1)  
#         END CASE
#      END IF
#   END IF
#END FUNCTION

#FUNCTION t211_visible(p_code)
#   DEFINE p_code    LIKE type_file.num5

#   CALL cl_set_comp_visible("cmi13,cmi14,cmi15,cmi16,cmi17,cmi18",TRUE)
#   CALL cl_set_comp_visible("cmi19,cmi20,cmi21,cmi22,cmi23,cmi24",TRUE)
#   CALL cl_set_comp_visible("cmi25,cmi26,cmi27,cmi28,cmi29,cmi30",TRUE)
#   CALL cl_set_comp_visible("cmi31,cmi32,cmi33,cmi34",TRUE)
#   CASE p_code 
#      WHEN  1   
#         CALL cl_set_comp_visible("cmi15,cmi16,cmi17,cmi18,cmi19,cmi20",FALSE)
#         CALL cl_set_comp_visible("cmi21,cmi22,cmi23,cmi24,cmi25,cmi26",FALSE)
#         CALL cl_set_comp_visible("cmi27,cmi28,cmi29,cmi30,cmi31,cmi32",FALSE)
#         CALL cl_set_comp_visible("cmi33,cmi34",FALSE)
#      WHEN  2
#         CALL cl_set_comp_visible("cmi17,cmi18,cmi19,cmi20,cmi21,cmi22",FALSE)
#         CALL cl_set_comp_visible("cmi23,cmi24,cmi25,cmi26,cmi27,cmi28",FALSE)
#         CALL cl_set_comp_visible("cmi29,cmi30,cmi31,cmi32,cmi33,cmi34",FALSE)
#      WHEN 3
#         CALL cl_set_comp_visible("cmi19,cmi20,cmi21,cmi22,cmi23,cmi24",FALSE)
#         CALL cl_set_comp_visible("cmi25,cmi26,cmi27,cmi28,cmi29,cmi30",FALSE)
#         CALL cl_set_comp_visible("cmi31,cmi32,cmi33,cmi34",FALSE)
#      WHEN 4
#         CALL cl_set_comp_visible("cmi21,cmi22,cmi23,cmi24,cmi25,cmi26",FALSE)
#         CALL cl_set_comp_visible("cmi27,cmi28,cmi29,cmi30,cmi31,cmi32",FALSE)
#         CALL cl_set_comp_visible("cmi33,cmi34",FALSE)
#      WHEN 5
#         CALL cl_set_comp_visible("cmi23,cmi24,cmi25,cmi26,cmi27,cmi28",FALSE)
#         CALL cl_set_comp_visible("cmi29,cmi30,cmi31,cmi32,cmi33,cmi34",FALSE)
#      WHEN 6
#         CALL cl_set_comp_visible("cmi25,cmi26,cmi27,cmi28,cmi29,cmi30",FALSE)
#         CALL cl_set_comp_visible("cmi31,cmi32,cmi33,cmi34",FALSE)
#      WHEN 7
#         CALL cl_set_comp_visible("cmi27,cmi28,cmi29,cmi30,cmi31,cmi32",FALSE)
#         CALL cl_set_comp_visible("cmi33,cmi34",FALSE)
#      WHEN 8
#         CALL cl_set_comp_visible("cmi29,cmi30,cmi31,cmi32,cmi33,cmi34",FALSE)
#      WHEN 9
#         CALL cl_set_comp_visible("cmi31,cmi32,cmi33,cmi34",FALSE) 
#      WHEN 10
#         CALL cl_set_comp_visible("cmi33,cmi34",FALSE)
#      WHEN 0
#         CALL cl_set_comp_visible("cmi13,cmi14,cmi15,cmi16,cmi17,cmi18",FALSE)
#         CALL cl_set_comp_visible("cmi19,cmi20,cmi21,cmi22,cmi23,cmi24",FALSE)
#         CALL cl_set_comp_visible("cmi25,cmi26,cmi27,cmi28,cmi29,cmi30",FALSE)
#         CALL cl_set_comp_visible("cmi31,cmi32,cmi33,cmi34",FALSE)
#   END CASE 
#END FUNCTION 
#FUN-D80058--add--end--
#MOD-E80049-End-Mark

#No.FUN-9C0073 -----------------By chenls 10/01/13
#MOD-DB0167 add begin------------------
FUNCTION t211_chk_q310(p_cmi00,p_cmi01,p_cmi02)
DEFINE p_cmi00     LIKE cmi_file.cmi00,
       p_cmi01     LIKE cmi_file.cmi01,
       p_cmi02     LIKE cmi_file.cmi02
DEFINE l_nppglno   LIKE npp_file.nppglno,
       l_cdb13     LIKE cdb_file.cdb13,
       l_err       STRING
   SELECT DISTINCT cdb13 INTO l_cdb13
     FROM cdb_file,cmi_file
    WHERE cdb00 = p_cmi00 AND cdb01 = p_cmi01
      AND cdb02 = p_cmi02 AND cdb00 = cmi00
      AND cdb01 = cmi01 AND cdb02 = cmi02
      AND cmi04 <> '1'
   IF NOT cl_null(l_cdb13) THEN
      SELECT nppglno INTO l_nppglno FROM npp_file WHERE npp01 = l_cdb13 AND nppsys ='CA' AND npp00 = 8 AND npp011 = 1
      IF NOT cl_null(l_nppglno) THEN
         LET l_err = cl_get_feldname("cmi00",g_lang),":",p_cmi00,
                     cl_get_feldname("cmi01",g_lang),":",p_cmi01,
                     cl_get_feldname("cmi02",g_lang),":",p_cmi02
         CALL cl_err(l_err,'axc-994',1)
         RETURN FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION
#MOD-DB0167 add end--------------------


#FUN-E90020-Start-Add
FUNCTION t211_aeh1()
   DEFINE l_cmi           RECORD LIKE cmi_file.*
   DEFINE l_sql           STRING     
   DEFINE l_cay           RECORD LIKE cay_file.*
   DEFINE l_cmii          RECORD LIKE cmii_file.*
   DEFINE l_cmii_1        RECORD LIKE cmii_file.*
   DEFINE l_sum_aeh11     LIKE aeh_file.aeh11
   DEFINE l_sum_aeh12     LIKE aeh_file.aeh12
   DEFINE l_cnt           LIKE type_file.num5
   DEFINE l_aeh11         LIKE aeh_file.aeh11
   DEFINE l_aeh12         LIKE aeh_file.aeh12
   DEFINE l_diff          LIKE aah_file.aah04 
   DEFINE l_tot_sum       LIKE aah_file.aah04
   DEFINE l_sum           LIKE aah_file.aah04
   DEFINE l_aag05         LIKE aag_file.aag05
   DEFINE p_row,p_col     LIKE type_file.num5 
   DEFINE l_rate          LIKE abb_file.abb25   
   DEFINE l_cmi03	LIKE cmi_file.cmi03
   DEFINE l_cmi05	LIKE cmi_file.cmi05
   DEFINE l_cmi06	LIKE cmi_file.cmi06
   DEFINE l_cmi08	LIKE cmi_file.cmi08
   DEFINE l_aeh		LIKE cmi_file.cmi08
   DEFINE l_aeh03         LIKE aeh_file.aeh03
   DEFINE l_aeh04         LIKE aeh_file.aeh04
   DEFINE l_aeh05         LIKE aeh_file.aeh05
   DEFINE l_aeh06         LIKE aeh_file.aeh06
   DEFINE l_aeh07         LIKE aeh_file.aeh07
   DEFINE l_aeh31         LIKE aeh_file.aeh31
   DEFINE l_aeh32         LIKE aeh_file.aeh32
   DEFINE l_aeh33         LIKE aeh_file.aeh33
   DEFINE l_aeh34         LIKE aeh_file.aeh34
   DEFINE l_aeh35         LIKE aeh_file.aeh35
   DEFINE l_aeh36         LIKE aeh_file.aeh36
   DEFINE l_aeh37         LIKE aeh_file.aeh37
   DEFINE l_cmi13         LIKE cmi_file.cmi13
   DEFINE l_cmi15         LIKE cmi_file.cmi15
   DEFINE l_cmi17         LIKE cmi_file.cmi17
   DEFINE l_cmi19         LIKE cmi_file.cmi19
   DEFINE l_cmi21         LIKE cmi_file.cmi21
   DEFINE l_cmi23         LIKE cmi_file.cmi23
   DEFINE l_cmi25         LIKE cmi_file.cmi25
   DEFINE l_cmi27         LIKE cmi_file.cmi27
   DEFINE l_cmi29         LIKE cmi_file.cmi29
   DEFINE l_cmi31         LIKE cmi_file.cmi31
   DEFINE l_cmi33         LIKE cmi_file.cmi33
   DEFINE l_cmi35         LIKE cmi_file.cmi35
   DEFINE l_cmii00        LIKE cmii_file.cmii00
   DEFINE l_cmii01        LIKE cmii_file.cmii01
   DEFINE l_cmii02        LIKE cmii_file.cmii02
   DEFINE l_cmii03        LIKE cmii_file.cmii03
   DEFINE l_cmii04        LIKE cmii_file.cmii04
   DEFINE l_cmii05        LIKE cmii_file.cmii05
   DEFINE l_cmii06        LIKE cmii_file.cmii06
   DEFINE l_cmii07        LIKE cmii_file.cmii07
   DEFINE l_cmii08        LIKE cmii_file.cmii08
   DEFINE l_cmii09        LIKE cmii_file.cmii09
   DEFINE last_period     LIKE type_file.chr1    #FUN-E40053 add
 
   LET p_row = 6 LET p_col = 6
       
   OPEN WINDOW t211a_w AT p_row,p_col WITH FORM "axc/42f/axct211_s"
        ATTRIBUTE (STYLE = g_win_style CLIPPED) 
   CALL cl_ui_locale("axct211_s")
   INITIALIZE l_cmi.* TO NULL
   CALL cl_set_comp_visible('cmi12',FALSE)
   INPUT BY NAME l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00,l_cmi.cmi12
                ,last_period    #FUN-E40053 add
                 WITHOUT DEFAULTS
 
   
     BEFORE INPUT
        LET g_before_input_done = FALSE
        LET l_cmi.cmi01 = g_ccz.ccz01
        LET l_cmi.cmi02 = g_ccz.ccz02
        LET l_cmi.cmi00 = g_ccz.ccz12
        LET last_period = 'N'           #FUN-E40053 add
        DISPLAY BY NAME last_period     #FUN-E40053 add
        DISPLAY BY NAME l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00
        
    
      
      AFTER FIELD cmi01
         IF NOT cl_null(l_cmi.cmi01) THEN
            IF l_cmi.cmi01 < g_ccz.ccz01 THEN
               CALL cl_err(l_cmi.cmi01,'axc-095',0)
               NEXT FIELD cmi01
            END IF
         END IF
      AFTER FIELD cmi02
         IF NOT cl_null(l_cmi.cmi02) THEN
            IF l_cmi.cmi01 = g_ccz.ccz01 AND l_cmi.cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(l_cmi.cmi02,'axc-095',0)   
              NEXT FIELD cmi02   
            END IF
         END IF
 
      AFTER FIELD cmi00
         IF NOT cl_null(l_cmi.cmi00) THEN
            CALL t211_cmi00('a',l_cmi.cmi00)
            IF NOT cl_null(g_errno) THEN
               CALL cl_err(l_cmi.cmi00,g_errno,0)
               NEXT FIELD cmi00
            END IF
         END IF
 
      ON ACTION about         
         CALL cl_about()      
 
      ON ACTION help          
         CALL cl_show_help()  
 
      ON ACTION controlg      
         CALL cl_cmdask()     
 
   END INPUT
   IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211a_w RETURN END IF
   IF NOT t211_chk_q310(l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02) THEN  
      CLOSE WINDOW t211a_w  
      RETURN                
   END IF                   

   DELETE FROM cmi_file
    WHERE cmi01= l_cmi.cmi01 
      AND cmi02= l_cmi.cmi02
      AND cmi00= l_cmi.cmi00
      

   DELETE FROM cmii_file
    WHERE cmii01 = l_cmi.cmi01 
      AND cmii02 = l_cmi.cmi02
      AND cmii00 = l_cmi.cmi00 


   LET l_cnt = 1

   #將該科目所攤到的錢，再依核算值1~10來算錢的細項，塞到cmii_file
   LET l_sql = " SELECT SUM(aeh11),SUM(aeh12),",		
               "            aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37 ", 		
               "   FROM aeh_file ", 		
               "  WHERE aeh00 = ? ",	
               "    AND aeh01 = ? ",	
               "    AND aeh02 = ? ", 		
               "    AND aeh09 = ? "

  #IF g_aza.aza26 = '2' AND l_cay.cay00 MATCHES '[23456]' THEN  #FUN-E40053 mark 
   IF last_period = 'Y' AND l_cay.cay00 MATCHES '[23456]' THEN  #FUN-E40053 add
       LET l_sql = l_sql CLIPPED, " AND aeh10 <= ?"
   ELSE 
       LET l_sql = l_sql CLIPPED, " AND aeh10 = ?"
   END IF 

   LET l_sql = l_sql CLIPPED , " GROUP BY aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37 ",                      
                               " ORDER BY aeh03,aeh04,aeh05,aeh06,aeh07,aeh31,aeh32,aeh33,aeh34,aeh35,aeh36,aeh37 " 	
   PREPARE sum_aeh01 FROM l_sql
   IF SQLCA.sqlcode THEN
      CALL cl_err('sum_aeh01:',STATUS,1) 
      LET g_success = 'N'   
   END IF
   DECLARE sum_c_aeh01 CURSOR FOR sum_aeh01
 

    

   DECLARE t211_aeh_cs2 CURSOR FOR
      SELECT * FROM cay_file
       WHERE cay11 = l_cmi.cmi00
         AND cay01 = l_cmi.cmi01
         AND cay02 = l_cmi.cmi02

   BEGIN WORK
   LET g_success = 'Y'    
   FOREACH t211_aeh_cs2 INTO l_cay.*
      IF SQLCA.sqlcode THEN                                                                                                       
         CALL cl_err('',SQLCA.sqlcode,0)
         ROLLBACK WORK  
         LET g_success = 'N'                                                                                
         EXIT FOREACH                                                                                                            
      END IF
      IF cl_null(l_cay.cay06) THEN LET l_cay.cay06 = ' ' END IF
      
      
      FOREACH sum_c_aeh01 USING l_cay.cay11,l_cay.cay06,l_cay.cay03,l_cay.cay01,l_cay.cay02 
                           INTO l_aeh11,l_aeh12,l_aeh03,l_aeh04,l_aeh05,l_aeh06,l_aeh07,
                                l_aeh31,l_aeh32,l_aeh33,l_aeh34,l_aeh35,l_aeh36,l_aeh37
         IF SQLCA.sqlcode THEN                                                                                                       
            CALL cl_err('',SQLCA.sqlcode,0)
            ROLLBACK WORK  
            LET g_success = 'N'                                                                               
            EXIT FOREACH                                                                                                            
         END IF
         LET l_sum = 0           
         IF cl_null(l_aeh11) THEN LET l_aeh11 = 0 END IF
         IF cl_null(l_aeh12) THEN LET l_aeh12 = 0 END IF
         SELECT aag06,aag02 INTO l_aag06,l_cmi.cmi07 FROM aag_file
          WHERE aag01 = l_cay.cay06 AND aag00 = l_cay.cay11
         IF NOT cl_null(l_aag06) THEN LET l_aag06 = '1' END IF
         IF l_aag06 = '1' THEN  #借余
            LET l_sum = l_aeh11 - l_aeh12
         ELSE
            LET l_sum = l_aeh12 - l_aeh11
         END IF
         CALL s_get_cay05(l_cay.cay01,l_cay.cay02,l_cay.cay11,l_cay.cay06,l_cay.cay03,l_cay.cay05) 
              RETURNING l_rate
         #當期異動金額     
         LET l_sum = l_sum * l_rate
         IF cl_null(l_sum) THEN LET l_sum = 0 END IF
      
      
         IF l_sum = 0 THEN
             CONTINUE FOREACH
         END IF                 
         LET l_sum = cl_digcut(l_sum,g_azi04)

        
       
         #異動碼-1
         IF NOT cl_null(l_aeh04) THEN 
            LET l_cmii.cmii11 = l_aeh04
         ELSE
            LET l_cmii.cmii11 = ' ' 
         END IF    

         #異動碼-2
         IF NOT cl_null(l_aeh05) THEN 
            LET l_cmii.cmii12 = l_aeh05
         ELSE
            LET l_cmii.cmii12 = ' ' 
         END IF 

         #異動碼-3
         IF NOT cl_null(l_aeh06) THEN 
            LET l_cmii.cmii13 = l_aeh06
         ELSE
            LET l_cmii.cmii13 = ' ' 
         END IF 

         #異動碼-4
         IF NOT cl_null(l_aeh07) THEN 
            LET l_cmii.cmii14 = l_aeh07
         ELSE
            LET l_cmii.cmii14 = ' ' 
         END IF 

         #異動碼-5
         IF NOT cl_null(l_aeh31) THEN 
            LET l_cmii.cmii15 = l_aeh31
         ELSE
            LET l_cmii.cmii15 = ' ' 
         END IF 

         #異動碼-6
         IF NOT cl_null(l_aeh32) THEN 
            LET l_cmii.cmii16 = l_aeh32
         ELSE
            LET l_cmii.cmii16 = ' ' 
         END IF 

         #異動碼-7
         IF NOT cl_null(l_aeh33) THEN 
            LET l_cmii.cmii17 = l_aeh33
         ELSE
            LET l_cmii.cmii17 = ' ' 
         END IF 

         #異動碼-8
         IF NOT cl_null(l_aeh34) THEN 
            LET l_cmii.cmii18 = l_aeh34
         ELSE
            LET l_cmii.cmii18 = ' ' 
         END IF 

         #異動碼-9
         IF NOT cl_null(l_aeh35) THEN 
            LET l_cmii.cmii19 = l_aeh35
         ELSE
            LET l_cmii.cmii19 = ' ' 
         END IF 

         #異動碼-10
         IF NOT cl_null(l_aeh36) THEN 
            LET l_cmii.cmii20 = l_aeh36
         ELSE
            LET l_cmii.cmii20 = ' ' 
         END IF 

         #異動碼-關係人
         IF NOT cl_null(l_aeh37) THEN 
            LET l_cmii.cmii21 = l_aeh37
         ELSE
            LET l_cmii.cmii21 = ' ' 
         END IF 

         #專案編號
         LET l_cmii.cmii10 = l_aeh03
   
      
         #INSERT cmii(細項)
         INSERT INTO cmii_file(cmii00,cmii01,cmii02,cmii03,cmii04,
                               cmii05,cmii06,cmii07,cmii08,cmii09,
                               cmii10,cmii11,cmii12,cmii13,cmii14,
                               cmii15,cmii16,cmii17,cmii18,cmii19,
                               cmii20,cmii21,cmiiacti,cmiidate,cmiigrup,
                               cmiilegal,cmiimodu,cmiiorig,cmiioriu,cmiiuser)
                            
                        VALUES(l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02,l_cay.cay04,l_cay.cay00,
                               l_cay.cay06,l_cay.cay03,l_cay.cay12,l_cnt,l_sum,
                               l_cmii.cmii10,l_cmii.cmii11,l_cmii.cmii12,l_cmii.cmii13,l_cmii.cmii14,
                               l_cmii.cmii15,l_cmii.cmii16,l_cmii.cmii17,l_cmii.cmii18,l_cmii.cmii19,
                               l_cmii.cmii20,l_cmii.cmii21,'Y',g_today,g_grup,
                               g_legal,'',g_grup,g_user,g_user  ) 
         CASE SQLCA.sqlcode
             WHEN "0"    LET l_cnt = l_cnt + 1 #項次
                         CONTINUE FOREACH 
                      
             WHEN "-239" UPDATE cmii_file SET cmii09 = l_sum
                          WHERE cmii00 = l_cmi.cmi00   AND cmii01 = l_cmi.cmi01
                            AND cmii02 = l_cmi.cmi02   AND cmii03 = l_cay.cay04
                            AND cmii04 = l_cay.cay00   AND cmii05 = l_cay.cay06
                            AND cmii06 = l_cay.cay03   AND cmii08 = l_cnt
                         
                            AND cmii10 = l_cmii.cmii10 AND cmii11 = l_cmii.cmii11
                            AND cmii12 = l_cmii.cmii12 AND cmii13 = l_cmii.cmii13
                            AND cmii14 = l_cmii.cmii14 AND cmii14 = l_cmii.cmii14
                            AND cmii15 = l_cmii.cmii15 AND cmii16 = l_cmii.cmii16
                            AND cmii17 = l_cmii.cmii17 AND cmii18 = l_cmii.cmii18
                            AND cmii19 = l_cmii.cmii19 AND cmii20 = l_cmii.cmii20
                            AND cmii21 = l_cmii.cmii21
                         
                          LET l_cnt = l_cnt + 1 #項次  
             OTHERWISE
                CALL cl_err3("ins","cmii_file",l_cmi.cmi01,l_cmi.cmi02,SQLCA.sqlcode,'','',0)
                ROLLBACK WORK
                LET g_success = 'N'   
                EXIT FOREACH
         END CASE
      END FOREACH    
   END FOREACH  


   LET l_sql = " SELECT SUM(cmii09),cmii10,cmii11,cmii12,cmii13,cmii14,cmii15, ",
               "            cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06 ",
               "   FROM cmii_file ",
               "  WHERE cmii00 = ? ",
               "    AND cmii01 = ? ",
               "    AND cmii02 = ? ",
               "  GROUP BY cmii10,cmii11,cmii12,cmii13,cmii14,cmii15,cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06 ",
               "  ORDER BY cmii10,cmii11,cmii12,cmii13,cmii14,cmii15,cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06 "
   PREPARE sum_cmii09 FROM l_sql
   IF SQLCA.sqlcode THEN
      CALL cl_err('sum_cmii09:',STATUS,1) 
      LET g_success = 'N'   
      RETURN 
   END IF
   DECLARE sum_c_cmii09 CURSOR FOR sum_cmii09

   LET l_sql = "SELECT SUM(aeh11),SUM(aeh12)",
               "  FROM aeh_file ", 		
               " WHERE aeh00 = ?",	
               "   AND aeh01 = ?",	
               "   AND aeh02 = ?", 		
               "   AND aeh09 = ?",
               "   AND aeh03 = ?",
               "   AND aeh04 = ?",
               "   AND aeh05 = ?",
               "   AND aeh06 = ?",
               "   AND aeh07 = ?",
               "   AND aeh31 = ?",
               "   AND aeh32 = ?",
               "   AND aeh33 = ?",
               "   AND aeh34 = ?",
               "   AND aeh35 = ?",
               "   AND aeh36 = ?",
               "   AND aeh37 = ?"
  #IF g_aza.aza26 = '2' AND l_cay.cay00 MATCHES '[23456]' THEN #FUN-E40053 mark
   IF last_period = 'Y' AND l_cay.cay00 MATCHES '[23456]' THEN #FUN-E40053 add
   
      LET l_sql = l_sql CLIPPED, " AND aeh10 <= ? "
   ELSE 
      LET l_sql = l_sql CLIPPED, " AND aeh10 = ? "
   END IF 
   PREPARE sum_aeh02 FROM l_sql
   IF SQLCA.sqlcode THEN
      CALL cl_err('sum_aeh01:',STATUS,1) 
      LET g_success = 'N'   
      RETURN 
   END IF
   DECLARE sum_c_aeh02 CURSOR FOR sum_aeh02


   LET l_sql = " SELECT cmii00,cmii01,cmii02,cmii03,
                        cmii04,cmii05,cmii06,cmii07,cmii08 ", 
               "   FROM cmii_file ",  
               "  WHERE cmii00 = ?   AND cmii01 = ? ",
               "    AND cmii02 = ?   ",
               "    AND cmii05 = ? ",
               "    AND cmii06 = ?                  ",
               "    AND cmii10 = ? AND cmii11 = ? ",
               "    AND cmii12 = ? AND cmii13 = ? ",
               "    AND cmii14 = ?  ",
               "    AND cmii15 = ? AND cmii16 = ? ",
               "    AND cmii17 = ? AND cmii18 = ? ",
               "    AND cmii19 = ? AND cmii20 = ? ",
               "    AND cmii21 = ? "
             
            
   PREPARE max_cmii09 FROM l_sql
   IF SQLCA.sqlcode THEN
      CALL cl_err('max_cmii09:',STATUS,1) 
      LET g_success = 'N'   
      RETURN 
   END IF
   DECLARE max_c_cmii09 SCROLL CURSOR WITH HOLD FOR max_cmii09
   
      
   #調整尾差: 將cmii_file的金額總和跟aeh_file做比較，將多/少的錢攤到該筆金額的最大筆
   #撈取cmii_file
   FOREACH sum_c_cmii09 USING l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02
                         INTO l_cmii_1.cmii09,l_cmii_1.cmii10,l_cmii_1.cmii11,l_cmii_1.cmii12,
                              l_cmii_1.cmii13,l_cmii_1.cmii14,l_cmii_1.cmii15,l_cmii_1.cmii16,
                              l_cmii_1.cmii17,l_cmii_1.cmii18,l_cmii_1.cmii19,l_cmii_1.cmii20,
                              l_cmii_1.cmii21,l_cmii_1.cmii05,l_cmii_1.cmii06
                                 
      IF cl_null(l_cmii_1.cmii09) THEN LET l_cmii_1.cmii09 = 0 END IF 
     #MOD-G80028--mark--start--
     #IF cl_null(l_cmii_1.cmii10) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii11) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii12) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii13) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii14) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii15) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii16) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii17) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii18) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #IF cl_null(l_cmii_1.cmii19) THEN LET l_cmii_1.cmii21 = ' ' END IF
     #MOD-G80028--mark--end----
     #MOD-G80028--add--start---
      IF cl_null(l_cmii_1.cmii10) THEN LET l_cmii_1.cmii10 = ' ' END IF
      IF cl_null(l_cmii_1.cmii11) THEN LET l_cmii_1.cmii11 = ' ' END IF
      IF cl_null(l_cmii_1.cmii12) THEN LET l_cmii_1.cmii12 = ' ' END IF
      IF cl_null(l_cmii_1.cmii13) THEN LET l_cmii_1.cmii13 = ' ' END IF
      IF cl_null(l_cmii_1.cmii14) THEN LET l_cmii_1.cmii14 = ' ' END IF
      IF cl_null(l_cmii_1.cmii15) THEN LET l_cmii_1.cmii15 = ' ' END IF
      IF cl_null(l_cmii_1.cmii16) THEN LET l_cmii_1.cmii16 = ' ' END IF
      IF cl_null(l_cmii_1.cmii17) THEN LET l_cmii_1.cmii17 = ' ' END IF
      IF cl_null(l_cmii_1.cmii18) THEN LET l_cmii_1.cmii18 = ' ' END IF
      IF cl_null(l_cmii_1.cmii19) THEN LET l_cmii_1.cmii19 = ' ' END IF
     #MOD-G80028--add--end-----  
      IF cl_null(l_cmii_1.cmii21) THEN LET l_cmii_1.cmii21 = ' ' END IF
      IF cl_null(l_cmii_1.cmii05) THEN LET l_cmii_1.cmii05 = ' ' END IF
      IF cl_null(l_cmii_1.cmii06) THEN LET l_cmii_1.cmii06 = ' ' END IF

      #撈取aeh_file 
      EXECUTE sum_c_aeh02 USING l_cmi.cmi00,l_cmii_1.cmii05,l_cmii_1.cmii06,l_cmi.cmi01,
                                l_cmii_1.cmii10,l_cmii_1.cmii11,l_cmii_1.cmii12,l_cmii_1.cmii13,
                                l_cmii_1.cmii14,l_cmii_1.cmii15,l_cmii_1.cmii16,l_cmii_1.cmii17,
                                l_cmii_1.cmii18,l_cmii_1.cmii19,l_cmii_1.cmii20,l_cmii_1.cmii21,
                                l_cmi.cmi02 	
                          INTO l_sum_aeh11,l_sum_aeh12
      IF SQLCA.sqlcode THEN                                                                                                       
         CALL cl_err('',SQLCA.sqlcode,0)
         ROLLBACK WORK  
         LET g_success = 'N'                                                                               
         EXIT FOREACH                                                                                                            
      END IF               
      IF cl_null(l_sum_aeh11) THEN LET l_sum_aeh11 = 0 END IF
      IF cl_null(l_sum_aeh12) THEN LET l_sum_aeh12 = 0 END IF
      SELECT aag06,aag02 INTO l_aag06,l_cmi.cmi07 FROM aag_file
       WHERE aag01 = l_cmii_1.cmii05 AND aag00 = l_cmii_1.cmii00
      IF NOT cl_null(l_aag06) THEN LET l_aag06 = '1' END IF
      IF l_aag06 = '1' THEN  #借余
         LET l_tot_sum = l_sum_aeh11 - l_sum_aeh12
      ELSE
         LET l_tot_sum = l_sum_aeh12 - l_sum_aeh11
      END IF 
      
      #判斷aeh 跟cmii 是否一致
      #不一致代表有尾差
      #會將多的金額隨機攤到一筆
      IF l_cmii_1.cmii09 <> l_tot_sum THEN 
         LET l_diff =  l_tot_sum - l_cmii_1.cmii09

         OPEN max_c_cmii09 USING l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02,l_cmii_1.cmii05,
                                 l_cmii_1.cmii06,l_cmii_1.cmii10,l_cmii_1.cmii11,l_cmii_1.cmii12,
                                 l_cmii_1.cmii13,l_cmii_1.cmii14,l_cmii_1.cmii15,l_cmii_1.cmii16,
                                 l_cmii_1.cmii17,l_cmii_1.cmii18,l_cmii_1.cmii19,l_cmii_1.cmii20,
                                 l_cmii_1.cmii21
         FETCH FIRST max_c_cmii09 INTO l_cmii00,l_cmii01,l_cmii02,l_cmii03,l_cmii04,l_cmii05,
                                 l_cmii06,l_cmii07,l_cmii08,l_cmii09
         IF SQLCA.sqlcode THEN
            CLOSE max_c_cmii09
            LET g_success = 'N'                                                                               
            EXIT FOREACH      
         END IF
         CLOSE max_c_cmii09

         UPDATE cmii_file SET cmii09 = cmii09 + l_diff
          WHERE cmii00 = l_cmii00
            AND cmii01 = l_cmii01
            AND cmii02 = l_cmii02 
            AND cmii03 = l_cmii03  
            AND cmii04 = l_cmii04  
            AND cmii05 = l_cmii05
            AND cmii06 = l_cmii06
            AND cmii08 = l_cmii08   
          
                
      END IF           
   END FOREACH 


   #INSERT INTO cmi_file   
   LET l_sql = " SELECT SUM(cmii09),cmii00,cmii01,cmii02,cmii03, ",
               "            cmii04,cmii05,cmii06,cmii07 ",
               "   FROM cmii_file ",
               "  WHERE cmii00 = ? ",
               "    AND cmii01 = ? ",
               "    AND cmii02 = ? ",
               "  GROUP BY cmii00,cmii01,cmii02,cmii03,cmii04,cmii05,cmii06,cmii07 "
               
   PREPARE sum_cmii09_1 FROM l_sql
   IF SQLCA.sqlcode THEN
      CALL cl_err('sum_cmii09_1:',STATUS,1) 
      LET g_success = 'N'   
      RETURN 
   END IF
   DECLARE sum_c_cmii09_1 CURSOR FOR sum_cmii09_1
   FOREACH sum_c_cmii09_1 USING l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02
                           INTO l_cmii_1.cmii09,l_cmii_1.cmii00,l_cmii_1.cmii01,l_cmii_1.cmii02,
                                l_cmii_1.cmii03,l_cmii_1.cmii04,l_cmii_1.cmii05,l_cmii_1.cmii06,
                                l_cmii_1.cmii07
    #科目名稱(cmi07)                           
    SELECT aag02 INTO l_aag02 FROM aag_file
     WHERE aag01 = l_cmii_1.cmii05 AND aag00 = l_cmii_1.cmii00                             
                                
      INSERT INTO cmi_file(cmi01,cmi02,cmi03,cmi04,
                           cmi05,cmi06,cmi07,cmi08,
                           cmi09,cmi10,cmiacti,cmiuser,
                           cmigrup,cmimodu,cmidate,cmi051,
                           cmiorig,cmioriu,cmi00,cmi12,
                           cmilegal)  
                  VALUES(l_cmii_1.cmii01,l_cmii_1.cmii02,l_cmii_1.cmii03,l_cmii_1.cmii04,
                         l_cmii_1.cmii05,l_cmii_1.cmii06,l_aag02,l_cmii_1.cmii09,
                         '','','Y',g_user,
                         g_grup,'',g_today,'',
                         g_grup,g_user,l_cmii_1.cmii00,l_cmii_1.cmii07, 
                         g_legal)     
 
      CASE SQLCA.sqlcode
          WHEN "0"    CONTINUE FOREACH
          WHEN "-239" UPDATE cmi_file SET cmi08= l_cmii_1.cmii09
                       WHERE cmi01=l_cmii_1.cmii01 AND cmi02=l_cmii_1.cmii02
                         AND cmi03=l_cmii_1.cmii03 AND cmi04=l_cmii_1.cmii04
                         AND cmi05=l_cmii_1.cmii05 AND cmi06=l_cmii_1.cmii06
                         AND cmi00=l_cmii_1.cmii00
          OTHERWISE
             CALL cl_err3("ins","cmi_file",l_cmii_1.cmii01,l_cmii_1.cmii02,SQLCA.sqlcode,'','',0)
             ROLLBACK WORK
             LET g_success = 'N'   
             EXIT FOREACH
      END CASE

         
   END FOREACH 
      


   IF g_success = 'Y' THEN
      CALL cl_err('','aic-059',1)
      COMMIT WORK
   ELSE
      CALL cl_err('','abm-020',1)
      ROLLBACK WORK
   END IF
   


   CLOSE WINDOW t211a_w
   COMMIT WORK

END FUNCTION

FUNCTION t211_s1()
DEFINE l_cmi   RECORD LIKE cmi_file.*
DEFINE l_sql   STRING                    
DEFINE tm      RECORD
       cda01   LIKE cda_file.cda01,
       cda02   LIKE cda_file.cda02,
       cda04   LIKE cda_file.cda04,
       cda05   LIKE cda_file.cda05,
       cda10   LIKE cda_file.cda10
               END RECORD,
       sr1     RECORD
       cda01   LIKE cda_file.cda01,
       cda02   LIKE cda_file.cda02,
       cda05   LIKE cda_file.cda05,
       cay03   LIKE cay_file.cay03,
       cay05   LIKE cay_file.cay05,
       cay04   LIKE cay_file.cay04,     #TQC-D40043 add  
       cay12   LIKE cay_file.cay12      #TQC-D40043 add   
               END RECORD,
       l_tot   LIKE cmi_file.cmi08,
       l_tot1  LIKE cmi_file.cmi08,
       l_tot2  LIKE cmi_file.cmi08,
       l_cay03 LIKE cay_file.cay03,       
       l_cay04 LIKE cay_file.cay04,       
       l_aag02 LIKE aag_file.aag02
DEFINE p_row,p_col     LIKE type_file.num5 
DEFINE l_cda06         LIKE cda_file.cda06   
DEFINE l_cmii   RECORD LIKE cmii_file.*
DEFINE l_cmii_1 RECORD LIKE cmii_file.*      
DEFINE l_cnt   LIKE type_file.num5  
DEFINE l_rate          LIKE abb_file.abb25
DEFINE l_sum_abb07     LIKE abb_file.abb07
DEFINE l_sum_1_abb07   LIKE abb_file.abb07
DEFINE l_tot_sum       LIKE abb_file.abb07
DEFINE l_diff          LIKE aah_file.aah04 
DEFINE l_abb08         LIKE abb_file.abb08
DEFINE l_abb11         LIKE abb_file.abb11
DEFINE l_abb12         LIKE abb_file.abb12
DEFINE l_abb13         LIKE abb_file.abb13
DEFINE l_abb14         LIKE abb_file.abb14
DEFINE l_abb31         LIKE abb_file.abb31
DEFINE l_abb32         LIKE abb_file.abb32
DEFINE l_abb33         LIKE abb_file.abb33
DEFINE l_abb34         LIKE abb_file.abb34
DEFINE l_abb35         LIKE abb_file.abb35
DEFINE l_abb36         LIKE abb_file.abb36
DEFINE l_abb37         LIKE abb_file.abb37
DEFINE l_cmii00        LIKE cmii_file.cmii00
DEFINE l_cmii01        LIKE cmii_file.cmii01
DEFINE l_cmii02        LIKE cmii_file.cmii02
DEFINE l_cmii03        LIKE cmii_file.cmii03
DEFINE l_cmii04        LIKE cmii_file.cmii04
DEFINE l_cmii05        LIKE cmii_file.cmii05
DEFINE l_cmii06        LIKE cmii_file.cmii06
DEFINE l_cmii07        LIKE cmii_file.cmii07
DEFINE l_cmii08        LIKE cmii_file.cmii08
DEFINE l_cmii09        LIKE cmii_file.cmii09

 
LET p_row = 6 LET p_col = 6
       
  OPEN WINDOW t211a_w AT p_row,p_col WITH FORM
          "axc/42f/axct211a"  ATTRIBUTE (STYLE = g_win_style CLIPPED) 
     CALL cl_ui_locale("axct211a")
     INITIALIZE l_cmi.* TO NULL
     INPUT BY NAME l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00   
     WITHOUT DEFAULTS

    
     BEFORE INPUT
        LET g_before_input_done = FALSE
        LET l_cmi.cmi01 = g_ccz.ccz01
        LET l_cmi.cmi02 = g_ccz.ccz02
        LET l_cmi.cmi00 = g_ccz.ccz12
        DISPLAY BY NAME l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00
    
 
     AFTER FIELD cmi01
        IF NOT cl_null(l_cmi.cmi01) THEN
           IF l_cmi.cmi01 < g_ccz.ccz01 THEN
              CALL cl_err(l_cmi.cmi01,'axc-095',0)
              NEXT FIELD cmi01
           END IF
        END IF
     AFTER FIELD cmi02
        IF NOT cl_null(l_cmi.cmi02) THEN
           IF l_cmi.cmi01 = g_ccz.ccz01 AND l_cmi.cmi02 < g_ccz.ccz02 THEN
              CALL cl_err(l_cmi.cmi01,'axc-095',0)
              NEXT FIELD cmi01
           END IF
        END IF

    AFTER FIELD cmi00
        IF NOT cl_null(l_cmi.cmi00) THEN
           CALL t211_cmi00('a',l_cmi.cmi00)
           IF NOT cl_null(g_errno) THEN
              CALL cl_err(l_cmi.cmi00,g_errno,0)
              NEXT FIELD cmi00
           END IF
        END IF
 
      ON ACTION about         
         CALL cl_about()      
 
      ON ACTION help          
         CALL cl_show_help()  
 
      ON ACTION controlg      
         CALL cl_cmdask()     
 
 
     END INPUT
     IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW t211a_w RETURN END IF
     IF NOT t211_chk_q310(l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02) THEN  
        CLOSE WINDOW t211a_w 
        RETURN               
     END IF                
     DELETE FROM cmi_file
      WHERE cmi01=l_cmi.cmi01    AND cmi02=l_cmi.cmi02
        AND cmi00= l_cmi.cmi00   

      
     DELETE FROM cmii_file
      WHERE cmii01 = l_cmi.cmi01 
        AND cmii02 = l_cmi.cmi02
        AND cmii00 = l_cmi.cmi00

     LET l_cnt = 1 #項次  
     LET g_success = 'Y'
      

    
    #處理單部門    
     DECLARE t211_s1_1 CURSOR FOR
        SELECT cda01,cda02,cda04,cda05,cda10,cda06    
          FROM cda_file
         WHERE cda04= '1'   #單部門,部門可能為一個空格
     BEGIN WORK
     FOREACH t211_s1_1 INTO tm.cda01,tm.cda02,tm.cda04,tm.cda05,tm.cda10,l_cda06    
        IF SQLCA.sqlcode THEN                                                                                                       
           CALL cl_err('',SQLCA.sqlcode,0)
           ROLLBACK WORK                                                                                  
           EXIT FOREACH                                                                                                            
        END IF
     
        #先將變數清空，以防重複
        LET l_tot = NULL
        LET l_tot1 = NULL 
        LET l_abb08 = NULL   
        LET l_abb11 = NULL LET l_abb12 = NULL
        LET l_abb13 = NULL LET l_abb14 = NULL
        LET l_abb31 = NULL LET l_abb32 = NULL 
        LET l_abb33 = NULL LET l_abb34 = NULL
        LET l_abb35 = NULL LET l_abb36 = NULL
        LET l_abb37 = NULL 
      


       #借-貸
       #將該科目所攤到的錢，再依核算值1~10來算錢的細項，塞到cmii_file
       #判斷為借方還是貸方，來決定abb07要正還是負 
       #MOD-EB0027-Start-Modify
       #LET l_sql = " SELECT SUM(abb07),abb08,abb11,abb12,abb13,abb14,abb31,abb32, ",
       #            "            abb33,abb34,abb35,abb36,abb37 ",                                             
        LET l_sql = " SELECT SUM(CASE abb06 WHEN '1' THEN abb07 ELSE abb07*-1 END ), ", 
                    "                   NVL(abb08,' '),NVL(abb11,' '),NVL(abb12,' '), ",
                    "                   NVL(abb13,' '),NVL(abb14,' '),NVL(abb31,' '),NVL(abb32,' '), ",
                    "                   NVL(abb33,' '),NVL(abb34,' '),NVL(abb35,' '),NVL(abb36,' '), ",
                    "                   NVL(abb37,' ') ",
       #MOD-EB0027-End-Modify             
                    "   FROM aba_file,abb_file ",
                    "  WHERE aba03 = '",l_cmi.cmi01 ,"'",	
                    "    AND aba04 = '",l_cmi.cmi02 ,"'",
                    "    AND aba00 = '",l_cmi.cmi00 ,"'",
                    "    AND aba00 = abb00 ",
                    "    AND aba01 = abb01 ",
                    "    AND aba19 = 'Y' ",
                    "    AND abapost = 'Y' "
                
        IF cl_null(tm.cda10) THEN #部門有可能為空
           LET l_sql = l_sql CLIPPED
        ELSE 
           LET l_sql = l_sql CLIPPED, " AND abb05 = '",tm.cda10 ,"'"    
        END IF 

        LET l_sql = l_sql CLIPPED,            
                    "    AND abb03=  '",tm.cda05 ,"'",
                    "    AND abb05=  '",tm.cda10 ,"'",
                   #MOD-EB0027-Start-Modify 
                   #"    AND abb06='1' ",
                   #"  GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37 ",
                   #"  ORDER BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37 "              
                    "  GROUP BY NVL(abb08,' '),NVL(abb11,' '),NVL(abb12,' '),NVL(abb13,' '),NVL(abb14,' '), ",
                    "           NVL(abb31,' '),NVL(abb32,' '),NVL(abb33,' '),NVL(abb34,' '),NVL(abb35,' '), ",
                    "           NVL(abb36,' '),NVL(abb37,' ')                                               ",
                    "  ORDER BY NVL(abb08,' '),NVL(abb11,' '),NVL(abb12,' '),NVL(abb13,' '),NVL(abb14,' '), ",
                    "           NVL(abb31,' '),NVL(abb32,' '),NVL(abb33,' '),NVL(abb34,' '),NVL(abb35,' '), ",
                    "           NVL(abb36,' '),NVL(abb37,' ')                                               "
                   #MOD-EB0027-End-Modify  
        PREPARE sum1_abb07 FROM l_sql
        IF SQLCA.sqlcode THEN
           CALL cl_err('sum1_abb07:',STATUS,1) 
           LET g_success = 'N'   
           EXIT FOREACH
        END IF
        DECLARE sum1_c_abb07 CURSOR FOR sum1_abb07
        FOREACH sum1_c_abb07 INTO l_tot1,l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   
                                  l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37


          #MOD-EB0027-Start-Mark 
          # #貸
          ##要扣貸方也要依據核算值來group by
          #IF cl_null(tm.cda10) THEN
          #   SELECT SUM(abb07) INTO l_tot2
          #     FROM aba_file,abb_file
          #    WHERE aba03=l_cmi.cmi01
          #      AND aba04=l_cmi.cmi02
          #      AND abb00=aba00
          #      AND aba00=l_cmi.cmi00   
          #      AND aba19='Y'
          #      AND abapost = 'Y'    
          #      AND abb01=aba01
          #      AND abb03=tm.cda05
          #      AND abb06='2'
          #      AND abb08 = l_abb08
          #      AND abb11 = l_abb11
          #      AND abb12 = l_abb12
          #      AND abb13 = l_abb13
          #      AND abb14 = l_abb14
          #      AND abb31 = l_abb31
          #      AND abb32 = l_abb32
          #      AND abb33 = l_abb33
          #      AND abb34 = l_abb34
          #      AND abb35 = l_abb35
          #      AND abb36 = l_abb36
          #      AND abb37 = l_abb37
          #ELSE
          #   SELECT SUM(abb07) INTO l_tot2
          #     FROM aba_file,abb_file
          #    WHERE aba03=l_cmi.cmi01
          #      AND aba04=l_cmi.cmi02
          #      AND abb00=aba00
          #      AND aba00=l_cmi.cmi00   
          #      AND aba19='Y'
          #      AND abapost = 'Y'    
          #      AND abb01=aba01
          #      AND abb03=tm.cda05
          #      AND abb05=tm.cda10
          #      AND abb06='2'  
          #      AND abb08 = l_abb08
          #      AND abb11 = l_abb11
          #      AND abb12 = l_abb12
          #      AND abb13 = l_abb13
          #      AND abb14 = l_abb14
          #      AND abb31 = l_abb31
          #      AND abb32 = l_abb32
          #      AND abb33 = l_abb33
          #      AND abb34 = l_abb34
          #      AND abb35 = l_abb35
          #      AND abb36 = l_abb36
          #      AND abb37 = l_abb37
          # END IF
          #MOD-EB0027-End-Mark 
  
           IF cl_null(l_tot1) THEN LET l_tot1 = 0 END IF
          #IF cl_null(l_tot2) THEN LET l_tot2 = 0 END IF  #MOD-EB0027 Mark 
          #LET l_tot=l_tot1-l_tot2                        #MOD-EB0027 Mark 
           LET l_tot = l_tot1                             #MOD-EB0027 add
           IF l_tot = 0 THEN
              CONTINUE FOREACH
           END IF 

           #異動碼-1
           IF NOT cl_null(l_abb11) THEN 
              LET l_cmii.cmii11 = l_abb11
           ELSE
              LET l_cmii.cmii11 = ' ' 
           END IF 

           #異動碼-2
           IF NOT cl_null(l_abb12) THEN 
              LET l_cmii.cmii12 = l_abb12
           ELSE
              LET l_cmii.cmii12 = ' ' 
           END IF 

           #異動碼-3
           IF NOT cl_null(l_abb13) THEN 
              LET l_cmii.cmii13 = l_abb13
           ELSE
              LET l_cmii.cmii13 = ' ' 
           END IF 

           #異動碼-4
           IF NOT cl_null(l_abb14) THEN 
              LET l_cmii.cmii14 = l_abb14
           ELSE
              LET l_cmii.cmii14 = ' ' 
           END IF 

           #異動碼-5
           IF NOT cl_null(l_abb31) THEN 
              LET l_cmii.cmii15 = l_abb31
           ELSE
              LET l_cmii.cmii15 = ' ' 
           END IF 

           #異動碼-6
           IF NOT cl_null(l_abb32) THEN 
              LET l_cmii.cmii16 = l_abb32
           ELSE
              LET l_cmii.cmii16 = ' ' 
           END IF 

           #異動碼-7
           IF NOT cl_null(l_abb33) THEN 
              LET l_cmii.cmii17 = l_abb33
           ELSE
              LET l_cmii.cmii17 = ' ' 
           END IF 

           #異動碼-8
           IF NOT cl_null(l_abb34) THEN 
              LET l_cmii.cmii18 = l_abb34
           ELSE
              LET l_cmii.cmii18 = ' ' 
           END IF 

           #異動碼-9
           IF NOT cl_null(l_abb35) THEN 
              LET l_cmii.cmii19 = l_abb35
           ELSE
              LET l_cmii.cmii19 = ' ' 
           END IF 

           #異動碼-10
           IF NOT cl_null(l_abb36) THEN 
              LET l_cmii.cmii20 = l_abb36
           ELSE
              LET l_cmii.cmii20 = ' ' 
           END IF 

           #異動碼-關係人
           IF NOT cl_null(l_abb37) THEN 
              LET l_cmii.cmii21 = l_abb37
           ELSE
              LET l_cmii.cmii21 = ' ' 
           END IF 

           #專案編號
           LET l_cmii.cmii10 = l_abb08
           IF cl_null(tm.cda10) THEN LET tm.cda10 = ' ' END IF
           IF cl_null(l_cda06) THEN LET l_cda06 = '1' END IF

           #塞到cmii_file(細項)
           INSERT INTO cmii_file(cmii00,cmii01,cmii02,cmii03,cmii04,
                                 cmii05,cmii06,cmii07,cmii08,cmii09,
                                 cmii10,cmii11,cmii12,cmii13,cmii14,
                                 cmii15,cmii16,cmii17,cmii18,cmii19,
                                 cmii20,cmii21,cmiiacti,cmiidate,cmiigrup,
                                 cmiilegal,cmiimodu,cmiiorig,cmiioriu,cmiiuser)
                            
                          VALUES(l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02,tm.cda01,tm.cda02,
                                 tm.cda05,tm.cda10,l_cda06,l_cnt,l_tot,
                                 l_cmii.cmii10,l_cmii.cmii11,l_cmii.cmii12,l_cmii.cmii13,l_cmii.cmii14,
                                 l_cmii.cmii15,l_cmii.cmii16,l_cmii.cmii17,l_cmii.cmii18,l_cmii.cmii19,
                                 l_cmii.cmii20,l_cmii.cmii21,'Y',g_today,g_grup,
                                 g_legal,'',g_grup,g_user,g_user  ) 

           CASE SQLCA.sqlcode
              WHEN "0" LET l_cnt = l_cnt + 1 #項次
                       CONTINUE FOREACH
              WHEN "-239" UPDATE cmii_file SET cmii09 = cmii09+l_tot 
                           WHERE cmii00 = l_cmi.cmi00   AND cmii01 = l_cmi.cmi01
                             AND cmii02 = l_cmi.cmi02   AND cmii03 = tm.cda01
                             AND cmii04 = tm.cda02      AND cmii05 = tm.cda05
                             AND cmii06 = tm.cda10      AND cmii08 = l_cnt
                         
                             AND cmii10 = l_cmii.cmii10 AND cmii11 = l_cmii.cmii11
                             AND cmii12 = l_cmii.cmii12 AND cmii13 = l_cmii.cmii13
                             AND cmii14 = l_cmii.cmii14 AND cmii14 = l_cmii.cmii14
                             AND cmii15 = l_cmii.cmii15 AND cmii16 = l_cmii.cmii16
                             AND cmii17 = l_cmii.cmii17 AND cmii18 = l_cmii.cmii18
                             AND cmii19 = l_cmii.cmii19 AND cmii20 = l_cmii.cmii20
                             AND cmii21 = l_cmii.cmii21  
                       LET l_cnt = l_cnt + 1 #項次
            OTHERWISE
               CALL cl_err3("ins","cmi_file",l_cmi.cmi01,l_cmi.cmi02,SQLCA.sqlcode,'','',0)
               ROLLBACK WORK
               EXIT FOREACH
           END CASE
        END FOREACH
     END FOREACH

     
     LET l_cnt = 1 #項次  
    #處理多部門
     DECLARE t211_s2_1 CURSOR FOR
       SELECT DISTINCT cda01,cda02,cda05,cay03,cay05,
                       cay04,cay12                      
         FROM cda_file LEFT OUTER JOIN cay_file
           ON (cda02=cay00 AND cda01=cay04 AND cda05=cay06   
               AND cay11 = l_cmi.cmi00                      
               AND cay01=l_cmi.cmi01 AND cay02=l_cmi.cmi02)
        WHERE cda04 = '2'
     FOREACH t211_s2_1 INTO sr1.cda01,sr1.cda02,sr1.cda05,sr1.cay03,sr1.cay05,
                            sr1.cay04,sr1.cay12     
        IF SQLCA.sqlcode THEN                                                                                                       
           CALL cl_err('',SQLCA.sqlcode,0)
           LET g_success = 'N'
           ROLLBACK WORK                                                                                  
           EXIT FOREACH                                                                                                            
        END IF
        IF sr1.cay03 IS NULL OR sr1.cay05=0 THEN CONTINUE FOREACH END IF  #無設定 axci001/002

     
       #借-貸
       #將該科目所攤到的錢，再依核算值1~10來算錢的細項，塞到cmii_file
       #判斷為借方還是貸方，來決定abb07要正還是負 
       #MOD-EB0027-Start-Modify 
       #LET l_sql = " SELECT SUM(abb07),abb08,abb11,abb12,abb13,abb14,abb31,abb32, ",
       #            "            abb33,abb34,abb35,abb36,abb37 ",                                         
        LET l_sql = " SELECT SUM(CASE abb06 WHEN '1' THEN abb07 ELSE abb07*-1 END ), ", 
                    "                   NVL(abb08,' '),NVL(abb11,' '),NVL(abb12,' '), ",
                    "                   NVL(abb13,' '),NVL(abb14,' '),NVL(abb31,' '),NVL(abb32,' '), ",
                    "                   NVL(abb33,' '),NVL(abb34,' '),NVL(abb35,' '),NVL(abb36,' '), ",
                    "                   NVL(abb37,' ') ",
       #MOD-EB0027-End-Modify             
                    "   FROM aba_file,abb_file ",
                    "  WHERE aba03 = '",l_cmi.cmi01 ,"'",	
                    "    AND aba04 = '",l_cmi.cmi02 ,"'",
                    "    AND aba00 = '",l_cmi.cmi00 ,"'",
                    "    AND aba00 = abb00 ",
                    "    AND aba01 = abb01 ",
                    "    AND aba19 = 'Y' ",
                    "    AND abapost = 'Y' ",    
                    "    AND abb03=  '",sr1.cda05 ,"'",
                    "    AND abb05=  '",sr1.cay03 ,"'",
                   #"    AND abb06='1' ",                                                                         #MOD-EB0027 Mark 
                   #"  GROUP BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37 ",        #MOD-EB0027 Mark 
                   #"  ORDER BY abb08,abb11,abb12,abb13,abb14,abb31,abb32,abb33,abb34,abb35,abb36,abb37 "         #MOD-EB0027 Mark 
                    "  GROUP BY NVL(abb08,' '),NVL(abb11,' '),NVL(abb12,' '),NVL(abb13,' '),NVL(abb14,' '), ",    #MOD-EB0027 add
                    "           NVL(abb31,' '),NVL(abb32,' '),NVL(abb33,' '),NVL(abb34,' '),NVL(abb35,' '), ",    #MOD-EB0027 add 
                    "           NVL(abb36,' '),NVL(abb37,' ')                                               ",    #MOD-EB0027 add
                    "  ORDER BY NVL(abb08,' '),NVL(abb11,' '),NVL(abb12,' '),NVL(abb13,' '),NVL(abb14,' '), ",    #MOD-EB0027 add
                    "           NVL(abb31,' '),NVL(abb32,' '),NVL(abb33,' '),NVL(abb34,' '),NVL(abb35,' '), ",    #MOD-EB0027 add
                    "           NVL(abb36,' '),NVL(abb37,' ')                                               "     #MOD-EB0027 add
        PREPARE sum_abb07 FROM l_sql
        IF SQLCA.sqlcode THEN
           CALL cl_err('sum_aeh01:',STATUS,1) 
           LET g_success = 'N'   
           EXIT FOREACH
        END IF
        DECLARE sum_c_abb07 CURSOR FOR sum_abb07

        FOREACH sum_c_abb07 INTO l_tot1,l_abb08,l_abb11,l_abb12,l_abb13,l_abb14,l_abb31,   
                                 l_abb32,l_abb33,l_abb34,l_abb35,l_abb36,l_abb37

           
          #MOD-EB0027-Start-Mark           
          ##貸
          ##要扣貸方也要依據核算值來group by
          #SELECT SUM(abb07) INTO l_tot2
          #  FROM aba_file,abb_file
          # WHERE aba03=l_cmi.cmi01
          #   AND aba04=l_cmi.cmi02
          #   AND abb00=aba00
          #   AND abb01=aba01
          #   AND aba00=l_cmi.cmi00  
          #   AND aba19='Y'
          #   AND abapost = 'Y'    
          #   AND abb03=sr1.cda05
          #   AND abb05=sr1.cay03
          #   AND abb06='2'
          #   AND abb08 = l_abb08
          #   AND abb11 = l_abb11
          #   AND abb12 = l_abb12
          #   AND abb13 = l_abb13
          #   AND abb14 = l_abb14
          #   AND abb31 = l_abb31
          #   AND abb32 = l_abb32
          #   AND abb33 = l_abb33
          #   AND abb34 = l_abb34
          #   AND abb35 = l_abb35
          #   AND abb36 = l_abb36
          #   AND abb37 = l_abb37
          #MOD-EB0027-End-Mark
          
           IF cl_null(l_tot1) THEN LET l_tot1 = 0 END IF
          #IF cl_null(l_tot2) THEN LET l_tot2 = 0 END IF  #MOD-EB0027 Mark 

           CALL s_get_cay05(l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00,sr1.cda05,sr1.cay03,sr1.cay05)
           RETURNING l_rate
          #LET l_tot=(l_tot1-l_tot2)*l_rate  #MOD-EB0027 Mark 
           LET l_tot=(l_tot1)*l_rate         #MOD-EB0027 add 

           LET l_tot = cl_digcut(l_tot,g_azi04)
           
           #異動碼-1
           IF NOT cl_null(l_abb11) THEN 
              LET l_cmii.cmii11 = l_abb11
           ELSE
              LET l_cmii.cmii11 = ' ' 
           END IF 

           #異動碼-2
           IF NOT cl_null(l_abb12) THEN 
              LET l_cmii.cmii12 = l_abb12
           ELSE
              LET l_cmii.cmii12 = ' ' 
           END IF 

           #異動碼-3
           IF NOT cl_null(l_abb13) THEN 
              LET l_cmii.cmii13 = l_abb13
           ELSE
              LET l_cmii.cmii13 = ' ' 
           END IF 

           #異動碼-4
           IF NOT cl_null(l_abb14) THEN 
              LET l_cmii.cmii14 = l_abb14
           ELSE
              LET l_cmii.cmii14 = ' ' 
           END IF 

           #異動碼-5
           IF NOT cl_null(l_abb31) THEN 
              LET l_cmii.cmii15 = l_abb31
           ELSE
              LET l_cmii.cmii15 = ' ' 
           END IF 

           #異動碼-6
           IF NOT cl_null(l_abb32) THEN 
              LET l_cmii.cmii16 = l_abb32
           ELSE
              LET l_cmii.cmii16 = ' ' 
           END IF 

           #異動碼-7
           IF NOT cl_null(l_abb33) THEN 
              LET l_cmii.cmii17 = l_abb33
           ELSE
              LET l_cmii.cmii17 = ' ' 
           END IF 

           #異動碼-8
           IF NOT cl_null(l_abb34) THEN 
              LET l_cmii.cmii18 = l_abb34
           ELSE
              LET l_cmii.cmii18 = ' ' 
           END IF 

           #異動碼-9
           IF NOT cl_null(l_abb35) THEN 
              LET l_cmii.cmii19 = l_abb35
           ELSE
              LET l_cmii.cmii19 = ' ' 
           END IF 

           #異動碼-10
           IF NOT cl_null(l_abb36) THEN 
              LET l_cmii.cmii20 = l_abb36
           ELSE
              LET l_cmii.cmii20 = ' ' 
           END IF 

           #異動碼-關係人
           IF NOT cl_null(l_abb37) THEN 
              LET l_cmii.cmii21 = l_abb37
           ELSE
              LET l_cmii.cmii21 = ' ' 
           END IF 

           #專案編號
           LET l_cmii.cmii10 = l_abb08


           IF cl_null(sr1.cay03) THEN LET sr1.cay03 = ' ' END IF


           #塞到cmii_file(細項)
           INSERT INTO cmii_file(cmii00,cmii01,cmii02,cmii03,cmii04,
                                 cmii05,cmii06,cmii07,cmii08,cmii09,
                                 cmii10,cmii11,cmii12,cmii13,cmii14,
                                 cmii15,cmii16,cmii17,cmii18,cmii19,
                                 cmii20,cmii21,cmiiacti,cmiidate,cmiigrup,
                                 cmiilegal,cmiimodu,cmiiorig,cmiioriu,cmiiuser)
                            
                          VALUES(l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02,sr1.cay04,sr1.cda02,
                                 sr1.cda05,sr1.cay03,sr1.cay12,l_cnt,l_tot,
                                 l_cmii.cmii10,l_cmii.cmii11,l_cmii.cmii12,l_cmii.cmii13,l_cmii.cmii14,
                                 l_cmii.cmii15,l_cmii.cmii16,l_cmii.cmii17,l_cmii.cmii18,l_cmii.cmii19,
                                 l_cmii.cmii20,l_cmii.cmii21,'Y',g_today,g_grup,
                                 g_legal,'',g_grup,g_user,g_user  ) 
           CASE SQLCA.sqlcode
              WHEN "0"  LET l_cnt = l_cnt + 1 #項次 
                        CONTINUE FOREACH 
                        
              WHEN "-239" UPDATE cmii_file SET cmii09 = cmii09+l_tot 
                           WHERE cmii00 = l_cmi.cmi00   AND cmii01 = l_cmi.cmi01
                             AND cmii02 = l_cmi.cmi02   AND cmii03 = sr1.cda01
                             AND cmii04 = sr1.cda02     AND cmii05 = sr1.cda05
                             AND cmii06 = sr1.cay03     AND cmii08 = l_cnt
                         
                             AND cmii10 = l_cmii.cmii10 AND cmii11 = l_cmii.cmii11
                             AND cmii12 = l_cmii.cmii12 AND cmii13 = l_cmii.cmii13
                             AND cmii14 = l_cmii.cmii14 AND cmii14 = l_cmii.cmii14
                             AND cmii15 = l_cmii.cmii15 AND cmii16 = l_cmii.cmii16
                             AND cmii17 = l_cmii.cmii17 AND cmii18 = l_cmii.cmii18
                             AND cmii19 = l_cmii.cmii19 AND cmii20 = l_cmii.cmii20
                             AND cmii21 = l_cmii.cmii21  
                      
                           LET l_cnt = l_cnt + 1 #項次 
                         
             OTHERWISE
                CALL cl_err3("ins","cmii_file",l_cmi.cmi01,l_cmi.cmi02,SQLCA.sqlcode,'','',0)
                ROLLBACK WORK
                EXIT FOREACH
          END CASE                    
        END FOREACH  
     END FOREACH      
           
 
     #針對多部門,處理尾差的問題 
     LET l_sql = " SELECT SUM(cmii09),cmii10,cmii11,cmii12,cmii13,cmii14,cmii15, ",
                #"            cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06 ",               #MOD-EC0039 mark
                 "            cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06,cmii03,cmii04 ", #MOD-EC0039 add 
                 "   FROM cmii_file ",
                 "  WHERE cmii00 = ? ",
                 "    AND cmii01 = ? ",
                 "    AND cmii02 = ? ",
                #"  GROUP BY cmii10,cmii11,cmii12,cmii13,cmii14,cmii15,cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06 ",               #MOD-EC0039 mark        
                #"  ORDER BY cmii10,cmii11,cmii12,cmii13,cmii14,cmii15,cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06 "                #MOD-EC0039 mark
                 "  GROUP BY cmii10,cmii11,cmii12,cmii13,cmii14,cmii15,cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06,cmii03,cmii04 ", #MOD-EC0039 add
                 "  ORDER BY cmii10,cmii11,cmii12,cmii13,cmii14,cmii15,cmii16,cmii17,cmii18,cmii19,cmii20,cmii21,cmii05,cmii06,cmii03,cmii04 "  #MOD-EC0039 add
     PREPARE sum_1_cmii09 FROM l_sql
     IF SQLCA.sqlcode THEN
        CALL cl_err('sum_1_cmii09:',STATUS,1) 
        LET g_success = 'N'   
        RETURN 
     END IF
     DECLARE sum_c1_cmii09 CURSOR FOR sum_1_cmii09


     LET l_sql = " SELECT SUM(abb07) ",
                 "   FROM aba_file,abb_file ",
                 "  WHERE aba03 = ? ",	   #年度
                 "    AND aba04 = ? ",     #期別
                 "    AND aba00 = ? ",     #帳別
                 "    AND aba00 = abb00 ",
                 "    AND aba01 = abb01 ",
                 "    AND aba19 = 'Y' ",
                 "    AND abapost = 'Y' ",    
                 "    AND abb03=  ?",       #科目
                 "    AND abb05=  ?",       #部門
                 "    AND abb06='1' ",
                 "    AND NVL(abb08,' ') = ?  ",
                 "    AND NVL(abb11,' ') = ? ",
                 "    AND NVL(abb12,' ') = ? ",
                 "    AND NVL(abb13,' ') = ? ",
                 "    AND NVL(abb14,' ') = ? ",
                 "    AND NVL(abb31,' ') = ? ",
                 "    AND NVL(abb32,' ') = ? ",
                 "    AND NVL(abb33,' ') = ? ",
                 "    AND NVL(abb34,' ') = ? ",
                 "    AND NVL(abb35,' ') = ? ",
                 "    AND NVL(abb36,' ') = ? ",
                 "    AND NVL(abb37,' ') = ? "
      PREPARE sum_1_abb07 FROM l_sql
      IF SQLCA.sqlcode THEN
         CALL cl_err('sum_1_aeh01:',STATUS,1) 
         LET g_success = 'N'   
         RETURN 
      END IF
      DECLARE sum_c1_abb07 CURSOR FOR sum_1_abb07

      LET l_sql = " SELECT cmii00,cmii01,cmii02,cmii03,
                           cmii04,cmii05,cmii06,cmii07,cmii08,MAX(cmii09) ", 
                  "   FROM cmii_file ",  
                  "  WHERE cmii00 = ?   AND cmii01 = ? ",
                  "    AND cmii02 = ?   ",
                  "    AND cmii05 = ? ",
                  "    AND cmii06 = ?                  ",
                  "    AND cmii10 = ? AND cmii11 = ? ",
                  "    AND cmii12 = ? AND cmii13 = ? ",
                  "    AND cmii14 = ?  ",
                  "    AND cmii15 = ? AND cmii16 = ? ",
                  "    AND cmii17 = ? AND cmii18 = ? ",
                  "    AND cmii19 = ? AND cmii20 = ? ",
                  "    AND cmii21 = ? ",
                  " GROUP BY cmii00,cmii01,cmii02,cmii03,cmii04,cmii05,cmii06,cmii07,cmii08"
   
      PREPARE max1_cmii09 FROM l_sql
      IF SQLCA.sqlcode THEN
         CALL cl_err('max1_cmii09:',STATUS,1) 
         LET g_success = 'N'   
         RETURN 
      END IF
      DECLARE max_c1_cmii09 SCROLL CURSOR WITH HOLD FOR max1_cmii09 

      
     #調整尾差: 將cmii_file的金額總和跟aeh_file做比較，將多/少的錢攤到該筆金額的最大筆
     #撈取cmii_file
     FOREACH sum_c1_cmii09 USING l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02
                            INTO l_cmii_1.cmii09,l_cmii_1.cmii10,l_cmii_1.cmii11,l_cmii_1.cmii12,
                                 l_cmii_1.cmii13,l_cmii_1.cmii14,l_cmii_1.cmii15,l_cmii_1.cmii16,
                                 l_cmii_1.cmii17,l_cmii_1.cmii18,l_cmii_1.cmii19,l_cmii_1.cmii20,
                                 l_cmii_1.cmii21,l_cmii_1.cmii05,l_cmii_1.cmii06
                                ,l_cmii_1.cmii03,l_cmii_1.cmii04                  #MOD-EC0039 add
                                 
        IF cl_null(l_cmii_1.cmii09) THEN LET l_cmii_1.cmii09 = 0 END IF 
       #MOD-EB0023-Start-Modify
       #IF cl_null(l_cmii_1.cmii10) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii11) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii12) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii13) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii14) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii15) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii16) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii17) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii18) THEN LET l_cmii_1.cmii21 = ' ' END IF
       #IF cl_null(l_cmii_1.cmii19) THEN LET l_cmii_1.cmii21 = ' ' END IF
        IF cl_null(l_cmii_1.cmii10) THEN LET l_cmii_1.cmii10 = ' ' END IF
        IF cl_null(l_cmii_1.cmii11) THEN LET l_cmii_1.cmii11 = ' ' END IF
        IF cl_null(l_cmii_1.cmii12) THEN LET l_cmii_1.cmii12 = ' ' END IF
        IF cl_null(l_cmii_1.cmii13) THEN LET l_cmii_1.cmii13 = ' ' END IF
        IF cl_null(l_cmii_1.cmii14) THEN LET l_cmii_1.cmii14 = ' ' END IF
        IF cl_null(l_cmii_1.cmii15) THEN LET l_cmii_1.cmii15 = ' ' END IF
        IF cl_null(l_cmii_1.cmii16) THEN LET l_cmii_1.cmii16 = ' ' END IF
        IF cl_null(l_cmii_1.cmii17) THEN LET l_cmii_1.cmii17 = ' ' END IF
        IF cl_null(l_cmii_1.cmii18) THEN LET l_cmii_1.cmii18 = ' ' END IF
        IF cl_null(l_cmii_1.cmii19) THEN LET l_cmii_1.cmii19 = ' ' END IF
       #MOD-EB0023-End-Modify 
        IF cl_null(l_cmii_1.cmii21) THEN LET l_cmii_1.cmii21 = ' ' END IF
        IF cl_null(l_cmii_1.cmii05) THEN LET l_cmii_1.cmii05 = ' ' END IF
        IF cl_null(l_cmii_1.cmii06) THEN LET l_cmii_1.cmii06 = ' ' END IF
     

      #撈取abb_file 
      EXECUTE sum_c1_abb07 USING l_cmi.cmi01,l_cmi.cmi02,l_cmi.cmi00,
                                 l_cmii_1.cmii05,l_cmii_1.cmii06,
                                 l_cmii_1.cmii10,l_cmii_1.cmii11,l_cmii_1.cmii12,l_cmii_1.cmii13,
                                 l_cmii_1.cmii14,l_cmii_1.cmii15,l_cmii_1.cmii16,l_cmii_1.cmii17,
                                 l_cmii_1.cmii18,l_cmii_1.cmii19,l_cmii_1.cmii20,l_cmii_1.cmii21
                            INTO l_sum_abb07
      IF SQLCA.sqlcode THEN                                                                                                       
         CALL cl_err('',SQLCA.sqlcode,0)
         ROLLBACK WORK  
         LET g_success = 'N'                                                                               
         EXIT FOREACH                                                                                                            
      END IF               

      #貸
      #要扣貸方也要依據核算值來group by
      SELECT SUM(abb07) INTO l_sum_1_abb07
        FROM aba_file,abb_file
       WHERE aba03=l_cmi.cmi01
         AND aba04=l_cmi.cmi02
         AND abb00=aba00
         AND abb01=aba01
         AND aba00=l_cmi.cmi00  
         AND aba19='Y'
         AND abapost = 'Y'    
         AND abb03=l_cmii_1.cmii05
         AND abb05=l_cmii_1.cmii06
         AND abb06='2'
         AND NVL(abb08,' ') = l_cmii_1.cmii10
         AND NVL(abb11,' ') = l_cmii_1.cmii11
         AND NVL(abb12,' ') = l_cmii_1.cmii12
         AND NVL(abb13,' ') = l_cmii_1.cmii13
         AND NVL(abb14,' ') = l_cmii_1.cmii14 
         AND NVL(abb31,' ') = l_cmii_1.cmii15
         AND NVL(abb32,' ') = l_cmii_1.cmii16
         AND NVL(abb33,' ') = l_cmii_1.cmii17
         AND NVL(abb34,' ') = l_cmii_1.cmii18
         AND NVL(abb35,' ') = l_cmii_1.cmii19
         AND NVL(abb36,' ') = l_cmii_1.cmii20
         AND NVL(abb37,' ') = l_cmii_1.cmii21
      
      IF cl_null(l_sum_abb07) THEN LET l_sum_abb07 = 0 END IF
      IF cl_null(l_sum_1_abb07) THEN LET l_sum_1_abb07 = 0 END IF

      LET l_tot_sum = l_sum_abb07 - l_sum_1_abb07

      
      #判斷aab 跟cmii 是否一致
      #不一致代表有尾差
      #將差額分攤到隨機一筆
      IF l_cmii_1.cmii09 <> l_tot_sum THEN 
         LET l_diff =  l_tot_sum - l_cmii_1.cmii09

         OPEN max_c1_cmii09 USING l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02,l_cmii_1.cmii05,
                                  l_cmii_1.cmii06,l_cmii_1.cmii10,l_cmii_1.cmii11,l_cmii_1.cmii12,
                                  l_cmii_1.cmii13,l_cmii_1.cmii14,l_cmii_1.cmii15,l_cmii_1.cmii16,
                                  l_cmii_1.cmii17,l_cmii_1.cmii18,l_cmii_1.cmii19,l_cmii_1.cmii20,
                                  l_cmii_1.cmii21
         FETCH max_c1_cmii09 INTO l_cmii00,l_cmii01,l_cmii02,l_cmii03,l_cmii04,l_cmii05,
                                  l_cmii06,l_cmii07,l_cmii08,l_cmii09
         IF SQLCA.sqlcode THEN
            CLOSE max_c1_cmii09
            LET g_success = 'N'                                                                               
            EXIT FOREACH      
         END IF
         CLOSE max_c1_cmii09

         UPDATE cmii_file SET cmii09 = cmii09 + l_diff
          WHERE cmii00 = l_cmii00
            AND cmii01 = l_cmii01
            AND cmii02 = l_cmii02 
            AND cmii03 = l_cmii03  
            AND cmii04 = l_cmii04   AND cmii05 = l_cmii05
            AND cmii06 = l_cmii06   
            
 
      END IF           
   END FOREACH 

   #INSERT INTO cmi_file   
   LET l_sql = " SELECT SUM(cmii09),cmii00,cmii01,cmii02,cmii03, ",
               "            cmii04,cmii05,cmii06,cmii07 ",
               "   FROM cmii_file ",
               "  WHERE cmii00 = ? ",
               "    AND cmii01 = ? ",
               "    AND cmii02 = ? ",
               "  GROUP BY cmii00,cmii01,cmii02,cmii03,cmii04,cmii05,cmii06,cmii07 "
               
   PREPARE sum_cmii09_2 FROM l_sql
   IF SQLCA.sqlcode THEN
      CALL cl_err('sum_cmii09_1:',STATUS,1) 
      LET g_success = 'N'   
      RETURN 
   END IF
   DECLARE sum_c_cmii09_2 CURSOR FOR sum_cmii09_2
   FOREACH sum_c_cmii09_2 USING l_cmi.cmi00,l_cmi.cmi01,l_cmi.cmi02
                           INTO l_cmii_1.cmii09,l_cmii_1.cmii00,l_cmii_1.cmii01,l_cmii_1.cmii02,
                                l_cmii_1.cmii03,l_cmii_1.cmii04,l_cmii_1.cmii05,l_cmii_1.cmii06,
                                l_cmii_1.cmii07
    #科目名稱(cmi07)                           
    SELECT aag02 INTO l_aag02 FROM aag_file
     WHERE aag01 = l_cmii_1.cmii05 AND aag00 = l_cmii_1.cmii00                             
                                
      INSERT INTO cmi_file(cmi01,cmi02,cmi03,cmi04,
                           cmi05,cmi06,cmi07,cmi08,
                           cmi09,cmi10,cmiacti,cmiuser,
                           cmigrup,cmimodu,cmidate,cmi051,
                           cmiorig,cmioriu,cmi00,cmi12,
                           cmilegal)  
                  VALUES(l_cmii_1.cmii01,l_cmii_1.cmii02,l_cmii_1.cmii03,l_cmii_1.cmii04,
                         l_cmii_1.cmii05,l_cmii_1.cmii06,l_aag02,l_cmii_1.cmii09,
                         '','','Y',g_user,
                         g_grup,'',g_today,'',
                         g_grup,g_user,l_cmii_1.cmii00,l_cmii_1.cmii07, 
                         g_legal)     
 
      CASE SQLCA.sqlcode
          WHEN "0"    CONTINUE FOREACH
          WHEN "-239" UPDATE cmi_file SET cmi08= l_cmii_1.cmii09
                       WHERE cmi01=l_cmii_1.cmii01 AND cmi02=l_cmii_1.cmii02
                         AND cmi03=l_cmii_1.cmii03 AND cmi04=l_cmii_1.cmii04
                         AND cmi05=l_cmii_1.cmii05 AND cmi06=l_cmii_1.cmii06
                         AND cmi00=l_cmii_1.cmii00
          OTHERWISE
             CALL cl_err3("ins","cmi_file",l_cmii_1.cmii01,l_cmii_1.cmii02,SQLCA.sqlcode,'','',0)
             ROLLBACK WORK
             LET g_success = 'N'   
             EXIT FOREACH
      END CASE

         
   END FOREACH 
     
   IF g_success = 'Y' THEN
      CALL cl_err('','aic-059',1)
      COMMIT WORK
   ELSE
      CALL cl_err('','abm-020',1)
      ROLLBACK WORK
   END IF
   
     CLOSE WINDOW t211a_w
     COMMIT WORK
 
END FUNCTION

#FUN-E90020-End-Add
