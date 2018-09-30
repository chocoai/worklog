# Prog. Version..: '5.25.02-11.03.23(00010)'     #
#
# Library name...: cl_prt
# Descriptions...: 詢問使用者以何種方式處理報表檔
#                   (1) 系統印表機-1 by lp default destination
#                   (2-9) 系統印表機 2-9 by 'lp -dpr2' or 'lp -dpr3' ...
#                   (L) 終端機印表 by p000
#                   (D) 畫面顯示 by pg
#                   (S) 狀態顯示 by lpstat -t
#                   (C) 報表依頁次切割(Input Page length, Begin page, End page)
# Input parameter.: p_name   報表檔名稱
#                  p_prtway 列印方式
#                  p_copies 列印份數
#                  p_len    報表寬度(80/132)
# Return code....: none
# Usage .........: call cl_prt(p_name,p_prtway,p_copies,p_len)
# Date & Author..: 89/09/04 By LYS
# Revise record..: 91/05/28 add p_len
#                  91/05/30 add p_copies
#                  91/07/30 add print privillege control (from zy06)
#                  WEB判斷               by alexlin
#                  01/05/21 Java-Client報表功能新增 by Brendan
#                  01/07/05 Text & GUI mode新增串crystal report輸出
#                  04/04/05 Genero 新增報表轉Pdf的功能 add by COCO
#                  04/10/25 Echo   修改cl_vout
# Modify.........: No.FUN-4C0039 04/12/20 By coco report ->xml file
#                             Report to pdf :zz17改為g_len
# Modify.........: No.FUN-510030 05/01/17 By coco 報表內容簡繁轉換
# Modify.........: No.FUN-510048 05/01/28 By coco 報表轉pdf時.需依照不同的語言來指定編碼(encoding)
# Modify.........: No.MOD-490130 05/03/04 By coco 將寫死的訊息改到ze_file
# Modify.........: No.MOD-530739 05/03/28 by alexlin VARCHAR->CHAR
# Modify.........: No.FUN-530064 05/03/29 by saki 更改javamail 信件xml預設語言
# Modify.........: No.FUN-540002 05/04/04 By coco add setting Report PDF Logo Position
# Modify.........: No.MOD-540082 05/04/12 by Brendan: Fix BIG5/GB2312 can't automatically switch in HP-UX
# Modify.........: No.FUN-540029 05/04/22 By coco add setting Report PDF Logo from p_zo
# Modify.........: No.FUN-540062 05/04/29 By coco the encoding of xml by os.Path.join(FGL_GETENV("TOP")LOCALE
#                                         cl_prt_o1 excel add html tag
# Modify.........: No.FUN-550001 05/05/01 By coco add if g_len=0 let g_len=zz17 for older report
# Modify.........: No.MOD-550021 04/05/05 by Brendan : Take GBK/GB18030 into account.
# Modify.........: No.MOD-550032 05/05/05 by Brendan : Line counter failed if invalid character meets.
# Modify.........: No.FUN-550086 05/05/12 By coco add fix_cutpage when cut by page
# Modify.........: No.MOD-550171 05/05/24 By coco add GP version is big5 or unicode
# Modify.........: No.MOD-540113 05/06/07 By coco add PDF template 258-427
# Modify.........: No.MOD-560038 05/06/08 By coco PDF encoding GBK -> GB18030
# Modify.........: No.MOD-560231 05/06/29 By coco if g_page_line then view-320 show all file in one page
# Modify.........: No.MOD-570335 05/07/26 By coco if g_xml_rep =null no wc to count report
# Modify.........: No.MOD-560213 05/07/28 By Echo p_zaa設定報表樣版為voucher，報表產生資料為1行時，不應顯示無此報表資料。
# Modify.........: No.MOD-570245 05/07/28 By Echo 報表列印建議說明呈現灰底色
# Modify.........: No.FUN-570203 05/07/26 By echo 在html中加上script.讓報表的欄位位置能夠動態拖拉來調換
# Modify.........: No.FUN-570132 05/07/29 By saki p_cron執行，送信內容改變
# Modify.........: No.MOD-580044 05/08/03 By CoCo 2行以上的單頭報表,報表輸出時不可選擇"動態HTML"
# Modify.........: No.FUN-580164 05/08/30 By CoCo Add Print Range except History and Rich Format
# Modify.........: No.MOD-590108 05/09/08 By Echo 關閉列印功能後,仍有"電腦正在作業中,請稍後!"之訊息 報表列印後,要清除此 message
# Modify.........: No.MOD-590131 05/09/09 By CoCo l_end_line smallint->int
# Modify.........: No.MOD-580063 05/09/13 By Echo attrib -r xxx.pdf
# Modify.........: No.FUN-590079 05/09/16 By CoCo show message if g_len <> the real length of report
# Modify.........: No.MOD-590384 05/09/21 By CoCo recall window style 4st
# Modify.........: No.TQC-590051 05/09/21 By CoCo if g_len = 0 then no check the real length of report
# Modify.........: No.MOD-5A0202 05/10/14 By Echo 按下列印後,在彈出多格式列印畫面前,主程式畫面的"報表列印中,請稍後..."的訊息應該清除
# Modify.........: No.TQC-5B0069 05/11/09 By CoCo if g_page_line=0 then 頁碼設1
# Modify.........: No.TQC-5B0077 05/11/09 By CoCo encoding判斷由TOPLOCALE改為ms_codeset
# Modify.........: No.TQC-5B0170 05/11/21 By Echo 動態表頭類型的報表不能選擇"S:動態(合併)"的選擇
# Modify.........: No.TQC-5B0188 05/11/24 By Echo 因unicode編號問題，將awk方式改為channel讀取並利用FGL_WIDTH()方式判斷報表長度
# Modify.........: No.MOD-5B0314 05/11/24 By CoCo locale print list 印簡體為亂碼
# Modify.........: No.FUN-5C0010 05/12/02 By CoCo add web vtcp function
# Modify.........: No.FUN-5C0113 05/12/30 By Echo TIPTOP GP 報表資料連查~報表預覽功能
# Modify.........: No.FUN-630011 06/03/07 By saki Javamail報表附件檔處理
# Modify.........: No.FUN-630099 06/03/31 By Echo 將原先填註 1234AOUT等代碼的方式改為參照 action 方式，讓使用者勾選
# Modify.........: No.MOD-640008 06/04/06 By Echo 選終端印表機確定送出列印後,一直出現"作業中,請稍候"的訊息,列印完畢後,訊息應該更改為"列印完畢"
# Modify.........: No.TQC-640104 06/04/08 By Echo apmt722多格式輸出選項無中文說明.
#                                                 若多行報表的欄位有設定連查時，多行列印時應該不能顯示連查選項。
# Modify.........: No.TQC-5C0007 06/04/14 By Echo xml作簡繁的轉換
# Modify.........: No.TQC-610093 06/04/14 by Echo add idle control
# Modify.........: No.TQC-610031 06/04/25 By Brendan 背景執行的報表加上每頁行數的資訊(p_cron 檢視時使用)
# Modify.........: No.TQC-650109 06/05/24 By Echo voucher樣版的報表轉excel、html時，若資料含有「<」時，之後的資料就會被截斷。
# Modify.........: No.MOD-650122 06/05/30 By Echo 將檔案處理都做完,再由繁中轉換為簡中
# Modify.........: No.FUN-660011 06/06/05 By Echo 報表輸出到excel分為2種開啟的方式
# Modify.........: No.FUN-650017 06/06/15 By Echo 新增抓取報表左邊界(zaa19)的值
# Modify.........: No.TQC-660086 06/06/19 By alexstar cl_prt_convert功能接收檔案名稱的參數其型態為char(20),有時會因檔名過長而造成不正常的現象，須修改成STRING型態
# Modify.........: No.FUN-660062 06/06/22 By saki p_cron新增時cl_javamail要帶入預設寄件人
# Modify.........: No.MOD-660063 06/06/15 By CoCo 報表輸出時,先做完所有的處理,再做簡繁轉換
# Modify.........: No.FUN-680026 06/08/11 By Echo UNICODE版本有關九宮格的報表.轉成PDF都會亂掉
# Modify.........: No.FUN-690005 06/09/18 By cheunl  欄位型態定義，改為LIKE
# Modify.........: No.TQC-6B0054 06/11/13 By Claire l_endpage, l_startpage, l_pagenum smallint->int
# Modify.........: No.FUN-6B0023 06/11/22 By jacklai 報表輸出新增一選項VPrint選項(即VTCP Web版)
# Modify.........: No.TQC-6B0006 06/12/12 By Echo 報表程式，若 PRINT COLUMN g_c[40],XXX 但在p_zaa卻未建立40序號資料時,
#                                                 則會造成程式無窮迴圈，導至 resource 整個被吃掉...
# Modify.........: No.FUN-690069 06/12/14 By Echo 將PDF定義的name放大至char(50)
# Modify.........: No.TQC-670032 06/12/25 By Echo 查詢->列印->取消 後,Ring menu的按鈕會出現"核","不核"等的簽核按鈕 (axmt700也有相同情形)
# Modify.........: No.MOD-6C0165 07/01/03 By jacklai 選擇vprint時，隱藏列印範圍群組
# Modify.........: No.FUN-660179 07/01/04 By Echo 報表輸出新增callviewer功能
# Modify.........: No.FUN-710071 07/01/25 By CoCo 報表輸出至Crystal Reports功能
# Modify.........: No.FUN-720022 07/02/08 By CoCo CR功能
# Modify.........: No.FUN-720003 07/02/09 By dxfwo 增加修改單身批處理錯誤統整功能
# Modify.........: No.FUN-740008 07/04/02 By CoCo CR功能-把資料庫的密碼跟instance刪除.
#                                                 在新IE視窗開啟CR
#                                                 無DB:ds_report的訊息控制
# Modify.........: No.TQC-6B0123 07/04/20 By Claire 報表以串參數執行的所開出畫面OK,CANCEL而非中文的確定,取消
# Modify.........: No.TQC-740155 07/04/30 By kim zz02以gaz03取代
# Modify.........: No.FUN-750016 07/05/08 By CoCo CR logo與PDF一致jpg
# Modify.........: No.FUN-750065 07/05/08 關掉CR viewer IE視窗時刪除ds_report的暫存檔
# Modify.........: No.FUN-750092 07/05/25 避免URL過長,把CR報表用的title...存在zax_file中
# Modify.........: No.TQC-750056 07/06/20 show err-msg should in g_dbs
# Modify.........: No.TQC-760168 07/06/22 By jacklai 報表輸出到locale print list導致不正常跳頁, 將cl_prt_l3()的邊界固定為0
# Modify.........: No.TQC-720029 07/06/25 By Echo 呼叫下載檔案功能時, 目的檔檔名應為全路徑
# Modify.........: No.FUN-740189 07/06/27 By jacklai 當客戶端環境為簡體, javamail 要先將信件內容轉為簡體再轉UTF-8寄出
# Modify.........: No.FUN-770002 07/07/05 By jacklai 新增 Crystal Report 匯出的權限控管功能
# Modify.........: No.TQC-770107 07/07/23 By jacklai 修改GDC呼叫IE的方式
# Modify.........: No.FUN-770107 07/07/27 By CoCo 新增 CR 與Informix的串接
# Modify.........: No.FUN-770106 07/07/27 By jacklai 新增.NET提供子報表功能
# Modify.........: No.TQC-770049 07/08/10 By claire 簡繁轉換的報表打印，連續列印二次第二次會變亂碼
# Modify.........: No.MOD-780018 07/08/10 By claire Vprint 簡繁轉換問題調整
# Modify.........: No.FUN-780023 07/08/14 By jacklai cl_prt_cs3_t()增加行業別欄位的判斷
# Modify.........: No.FUN-780036 07/08/17 By Sarah CR報表的報表名稱(title2)抓法改為先抓gaz06,若gaz06沒值,再抓gaz03
# Modify.........: No.FUN-780054 07/08/21 By alexstar Vprint 原先呼叫EXPLORER改成呼叫IEXPLORE,避免IE當掉問題
# Modify.........: No.FUN-790003 07/09/14 By Echo 將原先填註代碼的"列印方式"、"控制碼"改為 combobox 方式，讓使用者選擇
# Modify.........: No.FUN-790036 07/09/20 By Echo p_zv 新增預設"印表機"、"直接列印"等選項的參數功能
# Modify.........: No.FUN-7A0003 07/10/04 By jacklai 擴充子報表的SQL欄位到15組
# Modify.........: No.TQC-7A0075 07/10/22 By jacklai 修正Informix區 cl_prt_cs3_t() 抓報表名稱會變成NULL的問題
# Modify.........: No.TQC-7A0088 07/10/23 By Echo 指定第 2 部以上系統印表機,無法使用 LP1~9 UNIX 環境變數所指定的系統印表機.
# Modify.........: No.TQC-7B0135 07/11/26 By jacklai 當列印CR報表時, 若抓不到該行業別的程式代號, 則抓行業別為std的程式代號
# Modify.........: No.FUN-7B0109 07/12/10 By Brendan 對於 DVM 2.02.06 以上版本調整使用 Genero 內建的簡繁轉碼工具
# Modify.........: No.TQC-7C0150 07/12/17 By Echo Local Printer List 改成 GDC Local Printer List
# Modify.........: No.FUN-810068 08/01/24 By CoCo 新增MSV 
# Modify.........: No.MOD-810042 08/02/21 By claire 依vprint產報表時判斷utf8碼的值需傳0 or 1
# Modify.........: No.FUN-830021 08/03/06 By alex 移除gay02使用
# Modify.........: No.TQC-830055 08/03/06 By jacklai 移除FUN-7C0078被提前過單的程式段
# Modify.........: No.MOD-810198 08/03/28 By jacklai 修正certid由亂數產生時易發生重複的情況, 改抓PID
# Modify.........: No.CHI-830031 08/03/26 By jacklai 在新增紀錄檔前先行刪除同一鍵值的舊紀錄
# Modify.........: No.TQC-860016 08/06/06 By saki 修改ON IDLE段
# Modify.........: No.FUN-850105 08/06/06 By Hiko 增加報表TimeOut設定
# Modify.........: No.MOD-860181 08/06/17 By CoCo 在informix切換到CR的DB時,會導致原本的dirty read 又回復為commint read
# Modify.........: No.MOD-860225 08/06/17 By CoCo 修改錯誤訊息(使用者較易閱讀)
# Modify.........: No.FUN-860087 08/06/23 By jacklai 增加CR中介程式對Informix Unicode版的支持 
# Modify.........: No.TQC-870021 08/07/14 By jacklai 替換cl_prt_cs1()與cl_prt_cs3()中所有會傳到CR的SQL
# Modify.........: No.FUN-710036 08/08/07 By tsai_yen 判斷字型FUNCTION cl_prt_htm
# Modify.........: No.FUN-880041 08/08/12 By kevin CR背景報表可不同格式發送mail
# Modify.........: No.FUN-880108 08/09/04 By Echo 報表lib調整-for Genero 2.11
# Modify.........: No.MOD-890086 08/08/05 By Echo Voucher 報表excel、html點選第二次以上會一直出現重覆資料
# Modify.........: No.FUN-890056 08/09/17 By Kevin 傳送 Mail 資訊給 Default.aspx
# Modify.........: No.FUN-8A0022 08/10/07 By Kevin 加入mlj09
# Modify.........: No.FUN-8A0037 08/10/14 By tsai_yen 依照aoos010的設定報表輸出Logo位置zax09一併紀錄aoos010的位置來供.net判斷使用(用|隔開)
# Modify.........: No.FUN-8B0011 08/11/04 By alex 調整使用 os.Path及MSV設定
# Modify.........: No.FUN-8B0032 08/11/06 By jacklai CR背景作業由CR主機ASP.NET回傳的訊息加入所產生的歷史報表的URL
# Modify.........: No.TQC-8B0026 08/11/13 By jacklai 在執行iconv指令執行前先判斷l_codeset是否為UTF-8
# Modify.........: No.TQC-8B0049 08/12/03 By tsai_yen 新增ds_report的table時，blob資料型態不加長度
# Modify.........: No.FUN-8C0027 08/12/10 By tsai_yen 在CR報表表尾列印 EasyFlow 簽核者的簽名檔
# Modify.........: No.FUN-860089 08/12/12 By Echo 新增 CR Viewer 預覽查詢功能
# Modify.........: No.FUN-8C0025 08/12/29 By tsai_yen CR報表檔名設定作業
# Modify.........: No.FUN-920131 09/01/09 By tsai_yen 報表紙張設定(紙張名稱、紙張方向)
# Modify.........: No.FUN-910035 09/01/12 By CoCo 把組呼叫.Net的URL字串放到safe structure並修改取得資料庫帳號密碼的方式
# Modify.........: No.FUN-910012 09/01/08 By tsai_yen 在CR報表列印 TIPTOP 簽核欄
# Modify.........: No.FUN-930132 09/03/25 By Vicky 增加可將報表結果組成 XML 字串
# Modify.........: No.TQC-930143 09/03/26 By tsai_yen 開窗選擇樣板因cl_create_qry的回傳值上限(5個)，q_zaw改成回傳key值，再用key值查所需要的資訊
# Modify.........: No.TQC-940031 09/04/08 By kevin sendmail需由 mlj07 改成 mlj08
# Modify.........: No.FUN-940099 09/04/24 By tsai_yen mail寄件者的邏輯，都改到cl_prt.4gl處理，不在ASP.NET處理，並且放大"郵件主機使用者"欄位，容許輸入"xxx@xx.xxx.tw"的帳號
# Modify.........: No.TQC-940059 09/04/24 By tsai_yen 透過背景作業呼叫報表程式,無資料會開空報表，例如axct100用背景呼叫axcr010
# Modify.........: No.MOD-940295 09/04/24 By tsai_yen 使用者名稱(zx02)：mail內容的"製表(發送)人員"、mail標題
# Modify.........: No.FUN-920137 09/06/17 By Hiko 增加刪除功能
# Modify.........: No.FUN-960182 09/07/22 By tsai_yen 當資料庫是SQL SERVER時，年如果是4碼要改成2碼，避免CR報表的製表日期折行
# Modify.........: No.FUN-970006 09/07/28 By jacklai 修改CR logo的URL路徑,並傳遞DBDATE環境變數到CR 
# Modify.........: No.TQC-970130 09/07/29 By lilingyu 打印時彈出CR選項對話框,"close"功能沒有維護中文
# Modify.........: No.FUN-980030 09/08/14 By Hiko 增加新增sid_file的設定
# Modify.........: No.MOD-9A0040 09/10/12 By kevin 當畫面資料被清空時,不再預設值
# Modify.........: No.FUN-9B0062 09/11/09 By Echo OS不同，awk語法需調整
# Modify.........: No:FUN-A10041 10/01/08 By Hiko title bar也顯示營運中心的說明
# Modify.........: No:FUN-A30119 10/04/09 By tsai_yen CR mail主旨、內容由4gl產生，並且可指定樣板
# Modify.........: No:CHI-990023 09/09/22 By CoCo 暫存檔檔名重複加上PID
# Modify.........: No:FUN-A50041 10/05/10 by tsai_yen 報表簽核圖功能出現Error Messages -450,在fglrun Version 2.21.02中的blob必須先用LOCATE初始化
# Modify.........: No.FUN-A80029 10/08/09 By Echo 調整 msv 版本 awk 語法
# Modify.........: No:FUN-950030 10/08/17 By jay 將action改為checkbox
# Modify.........: No:TQC-AA0104 10/10/18 By CoCo 透過p_cron 設定,由java mail所寄出的附件需依照碼別執行簡繁轉換的動作
# Modify.........: No:FUN-AA0076 10/10/26 By alex 新增ASE處理功能
# Modify.........: No.FUN-A60063 10/10/26 By jacklai CR透過p_zv直接送印
# Modify.........: No.FUN-B20102 11/03/01 By CaryHsu 原本暫存資料表為時分秒，目前改為時分秒與五位數的毫秒
# Modify.........: No.FUN-B30131 11/03/17 By jacklai 將p_zv的zv06改抓zaw08 
# Modify.........: No:CHI-B30010 11/03/18 By jay 變更p_name data type

IMPORT util
IMPORT os      #FUN-8B0011
 
DATABASE ds
 
GLOBALS "../../config/top.global"
 
GLOBALS
   DEFINE g_gui             LIKE type_file.num5   #No.FUN-690005 SMALLINT
   DEFINE g_cmd             LIKE type_file.chr1000#No.FUN-690005 VARCHAR(1000)
   DEFINE g_report          LIKE type_file.chr20  #No.FUN-690005 VARCHAR(10)
   DEFINE g_receiver_list   STRING
   DEFINE g_cc_list         STRING
   DEFINE g_bcc_list        STRING
   DEFINE ms_locale         STRING,
          ms_codeset        STRING,
          ms_b5_gb          STRING
   #FUN-5C0113
   DEFINE g_zaa04_value     LIKE zaa_file.zaa04
   DEFINE g_zaa10_value     LIKE zaa_file.zaa10
   DEFINE g_zaa11_value     LIKE zaa_file.zaa11
   DEFINE g_zaa17_value     LIKE zaa_file.zaa17
   #END FUN-5C0113
   DEFINE mc_cron_prog      LIKE zz_file.zz01    #No.FUN-660062
   #No.FUN-860089 -- start --
   DEFINE g_query_prog    LIKE gcy_file.gcy01               #查詢單ID
   DEFINE g_query_cust    LIKE gcy_file.gcy02               #客製否
   DEFINE g_query_grup    LIKE gcy_file.gcy03               #群組
   DEFINE g_query_user    LIKE gcy_file.gcy04               #使用者
   DEFINE g_gcy           DYNAMIC ARRAY OF RECORD           #樣版資料
                             gcy03   LIKE gcy_file.gcy03,   #權限類別
                             gcy04   LIKE gcy_file.gcy04    #使用者
                          END RECORD
   DEFINE g_dbqry_rec_b   LIKE type_file.num10              #dbqry單身筆數
   DEFINE g_zal_err       LIKE type_file.num5               #判斷欄位在 zal 是否有設定資料
   DEFINE g_cr_sql        STRING                            #記錄產生 temptable 的sql語法
   DEFINE   ga_table_data DYNAMIC ARRAY OF RECORD
          field001, field002, field003, field004, field005, field006, field007,
          field008, field009, field010, field011, field012, field013, field014,
          field015, field016, field017, field018, field019, field020, field021,
          field022, field023, field024, field025, field026, field027, field028,
          field029, field030, field031, field032, field033, field034, field035,
          field036, field037, field038, field039, field040, field041, field042,
          field043, field044, field045, field046, field047, field048, field049,
          field050, field051, field052, field053, field054, field055, field056,
          field057, field058, field059, field060, field061, field062, field063,
          field064, field065, field066, field067, field068, field069, field070,
          field071, field072, field073, field074, field075, field076, field077,
          field078, field079, field080, field081, field082, field083, field084,
          field085, field086, field087, field088, field089, field090, field091,
          field092, field093, field094, field095, field096, field097, field098,
          field099, field100 STRING
                  END RECORD
   DEFINE g_gcz   DYNAMIC ARRAY OF RECORD
                      gcz05   LIKE gcz_file.gcz05,
                      gcz07   LIKE gcz_file.gcz07,
                      gcz08   LIKE gcz_file.gcz08,
                      gcz10   LIKE gcz_file.gcz10,
                      gcz11   LIKE gcz_file.gcz11,
                      gcz12   LIKE gcz_file.gcz12
                  END RECORD
   #No.FUN-860089 -- end --
   DEFINE g_open_cnt        LIKE type_file.num5  #No.MOD-9A0040
   #No.FUN-A60063 --start--
   DEFINE g_zv_cr           RECORD              
          zv06              LIKE zv_file.zv06,
          zv07              LIKE zv_file.zv07,
          zv08              LIKE zv_file.zv08
   END RECORD
   #No.FUN-A60063 --end--
END GLOBALS
 
DEFINE g_lpcode         LIKE type_file.chr1   #No.FUN-690005 VARCHAR(1)
DEFINE g_name           LIKE type_file.chr20  #No.FUN-690005 VARCHAR(20)
DEFINE g_mark1          LIKE type_file.chr20  #No.FUN-690005 VARCHAR(20)
DEFINE g_mark2          LIKE type_file.chr20  #No.FUN-690005 VARCHAR(20)
DEFINE g_zo07           LIKE zo_file.zo07
DEFINE g_zz             RECORD LIKE zz_file.*
DEFINE g_choice         LIKE type_file.chr1   #No.FUN-690005 VARCHAR(1)
DEFINE g_cut_count      LIKE type_file.num5   #No.FUN-690005 SMALLINT
DEFINE g_cnt            LIKE type_file.num10, #No.FUN-690005 INTEGER,
       g_log            LIKE type_file.chr1,  #No.FUN-690005 VARCHAR(1),
# genero mark g_query       g_query          VARCHAR(1),
       g_wc2,g_sql      string,  #No.FUN-580092 HCN
       g_row_cnt        LIKE type_file.num10, #No.FUN-690005 INTEGER,
       crip             STRING                #FUN-710071 CR Server IP
DEFINE l_ac             LIKE type_file.num5,  #No.FUN-690005 SMALLINT,
       g_rec_b          LIKE type_file.num5   #No.FUN-690005 SMALLINT
DEFINE g_prtsup         LIKE type_file.num5   #No.FUN-690005 SMALLINT    #可支援的印表機總台數
DEFINE g_url            LIKE type_file.chr1000#No.FUN-690005 VARCHAR(1000)
DEFINE g_cron_job       LIKE type_file.chr1   #No.FUN-690005 VARCHAR(1)
DEFINE lch_cmd          base.Channel
DEFINE tsconv_cmd       STRING
DEFINE os_type          STRING
DEFINE g_rep_err        LIKE type_file.num5   #No.FUN-690005 SMALLINT    #No.FUN-570132
DEFINE g_zv_chk         LIKE type_file.chr1   #NO.FUN-790003
DEFINE g_zv             RECORD LIKE zv_file.* #No.FUN-790036
 
DEFINE g_prt_timeout    LIKE type_file.num10  ### FUN-850105 ###
DEFINE g_receiver       STRING #FUN-890056
DEFINE g_cc             STRING #FUN-890056
DEFINE g_bcc            STRING #FUN-890056
DEFINE g_temptable      STRING                #FUN-930132 add
DEFINE g_zaw14          LIKE zaw_file.zaw14   #FUN-A60063   #紙張格式
 
FUNCTION cl_prt(p_name,p_prtway,p_copies,p_len)
   DEFINE p_name                LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          p_prtway              LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          p_copies              LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          p_len            	LIKE type_file.num5,   #No.FUN-690005 SMALLINT,
          l_chr                 LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
           l_cmd,l_xml_data	STRING,           ###MOD-570335###
          l_i                   LIKE type_file.num5,   #No.FUN-690005 SMALLINT,
          l_env                 LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(10),
          l_option              LIKE type_file.chr1000,#No.FUN-690005 VARCHAR(30),
          l_buf                 LIKE type_file.chr1000,#No.FUN-690005 VARCHAR(30),
          webip                 LIKE type_file.chr1000,#No.FUN-690005 VARCHAR(30),#WEB IP ADDRESS
          ftpip                 LIKE type_file.chr1000,#No.FUN-690005 VARCHAR(30),#FTP IP ADDRESS
          ftp_path              LIKE type_file.chr1000#No.FUN-690005 VARCHAR(100) #WEB Mode 報表下載路徑
   DEFINE l_channel             base.Channel
   DEFINE l_time                LIKE type_file.chr8    #No.FUN-690005 VARCHAR(8)
   DEFINE ls_para               STRING              #No.FUN-570132
   DEFINE ls_context            STRING              #No.FUN-570132
   DEFINE ls_temp_path          STRING              #No.FUN-570132
   DEFINE ls_context_file       STRING              #No.FUN-570132
   DEFINE li_i                  LIKE type_file.num5   #No.FUN-690005 SMALLINT  #No.FUN-570132
   DEFINE p_name_ts             STRING,             #No.FUN-790003
          l_choice              LIKE type_file.chr1 #No.FUN-790003
   DEFINE l_str                 STRING              #No.FUN-A80029
   DEFINE l_tok                 base.StringTokenizer  #No.FUN-A80029 
   WHENEVER ERROR CALL cl_err_msg_log
 
  #CALL cl_load_act_sys("cl_prt")                          #TQC-670032
   #TQC-6B0123-begin-add
   IF g_bgjob='Y' THEN
      CALL cl_load_act_sys("cl_prt")
   END IF
   #TQC-6B0123-end-add
   CALL cl_load_act_list("cl_prt")
   LET g_gui=g_gui_type  # 0.ASCII 1.GUI 2.HTML 3.JAVA
   LET g_prtway = p_prtway
   LET g_name   = p_name
   LET g_cut_count=0
   LET g_prtsup=9
   LET l_xml_data = '0'     ###MOD-570335###
   LET tsconv_cmd = ''    ## MOD-660063 ##
 
##########  No.FUN-4C0039  ##########
   IF not cl_null(g_xml_rep) THEN
      LET l_channel = base.Channel.create()
     #--- MOD-550032
    # Unset LANG locale setting before counter line numbers
      #No.FUN-9B0062  -- start --
      #No.FUN-A80029 -- start --
      IF os.Path.separator() = "/" THEN        #Unix 環境
         LET l_cmd = "unset LANG; wc -l ", g_xml_rep CLIPPED, " | awk ' { print $1 }'"
         CALL l_channel.openPipe(l_cmd, "r")
         WHILE l_channel.read(g_row_cnt)
         END WHILE
      ELSE
         #無法使用 awk，則改自行抓取第一個值
         LET l_cmd = "wc -l ", g_xml_rep CLIPPED
         CALL l_channel.openPipe(l_cmd, "r")
         WHILE l_channel.read(l_str)              
               LET l_tok = base.StringTokenizer.createExt(l_str.trim()," ","",TRUE)
               WHILE l_tok.hasMoreTokens()   
                     LET g_row_cnt=l_tok.nextToken()
                     EXIT WHILE
               END WHILE          
         END WHILE
      END IF
      #No.FUN-A80029 -- end --
      CALL l_channel.close()
  #----------
      #No.FUN-9B0062  -- end --
    #----------
      #IF g_row_cnt > 1 THEN                 ###MOD-570335###
      IF g_row_cnt > 2 THEN                 ###MOD-570335###  #No.FUN-880108
         CALL cl_trans_xml(g_xml_rep,"T")
         IF INT_FLAG THEN
            LET INT_FLAG = 0                 #TQC-6B0006
            RETURN
         END IF
      ELSE
          LET l_xml_data = '1'               ###MOD-570335###
      END IF
   END IF
 
   LET g_cron_job = 'N'
   IF FGL_GETENV("BGJOB") = '1' THEN
      LET g_cron_job = 'Y'
   END IF
 
   #當報表檔案 size 為 0 時, show message 並離開
    IF l_xml_data =0 THEN                    ###MOD-570335###
      LET l_channel = base.Channel.create()
  #--- MOD-550032
 # Unset LANG locale setting before counter line numbers
      #No.FUN-9B0062  -- start --
      #No.FUN-A80029 -- start --
      IF os.Path.separator() = "/" THEN        #Unix 環境
         LET l_cmd = "unset LANG; wc -l ", p_name CLIPPED, " | awk ' { print $1 }'"
         CALL l_channel.openPipe(l_cmd, "r")
         WHILE l_channel.read(g_row_cnt)
         END WHILE
      ELSE
         #無法使用 awk，則改自行抓取第一個值
         LET l_cmd = "wc -l ", p_name CLIPPED
         CALL l_channel.openPipe(l_cmd, "r")
         WHILE l_channel.read(l_str)              
               LET l_tok = base.StringTokenizer.createExt(l_str.trim()," ","",TRUE)
               WHILE l_tok.hasMoreTokens()   
                     LET g_row_cnt=l_tok.nextToken()
                     EXIT WHILE
               END WHILE          
         END WHILE
      END IF
      CALL l_channel.close()
      #No.FUN-A80029 -- end --
      #No.FUN-9B0062  -- end --
 #----------
   END IF
  #IF ( g_row_cnt <= 1 ) AND ( g_gui <> 2 ) THEN  ###  No.FUN-4C0039
  #IF (not cl_null(g_xml_rep) AND ( g_row_cnt <= 1 ) AND ( g_gui <> 2 )) OR
   IF (not cl_null(g_xml_rep) AND ( g_row_cnt <= 2 ) AND ( g_gui <> 2 )) OR   #No.FUN-880108
       (( g_row_cnt = 0 ) AND ( g_gui <> 2 ))                      #MOD-560213
   THEN
      IF g_cron_job != 'Y' THEN
#        CALL cl_err('!','lib-216',1)
      #No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','!','lib-216',1)
      ELSE
         CALL cl_err('!','lib-216',1)
      END IF
      #No.FUN-720003--end
      #No.FUN-570132 --start--
      ELSE
         LET g_receiver_list = FGL_GETENV("MAIL_TO")
         LET g_cc_list = FGL_GETENV("MAIL_CC")
         LET g_bcc_list = FGL_GETENV("MAIL_BCC")
 
         IF ( NOT cl_null(g_receiver_list) ) OR
            ( NOT cl_null(g_cc_list) ) OR
            ( NOT cl_null(g_bcc_list) ) THEN
            FOR li_i = 1 TO NUM_ARGS()
                LET ls_para = ls_para, " '", ARG_VAL(li_i), "'"
            END FOR
            LET ls_para = cl_replace_str(ls_para,"'","\"")    #No.FUN-630011
            LET ls_context = cl_getmsg("lib-282",g_lang) CLIPPED," : \n",
                             cl_getmsg("lib-227",g_lang) CLIPPED," : " ,cl_get_progname(g_prog,g_lang),"\(",g_prog CLIPPED,"\)\n" ,
                             cl_getmsg("lib-229",g_lang) CLIPPED," : " ,g_user CLIPPED,"\n",
                             cl_getmsg("lib-279",g_lang) CLIPPED," : " ,TODAY," ",TIME,"\n",
                             cl_getmsg("lib-280",g_lang) CLIPPED," : " ,ls_para,"\n",
                             cl_getmsg("lib-281",g_lang) CLIPPED," : " ,cl_getmsg("lib-216",g_lang),"\n"
            LET ls_temp_path = FGL_GETENV("TEMPDIR")
            LET ls_context_file = ls_temp_path,"/report_context_" || FGL_GETPID() || ".txt"
            LET l_cmd = "echo '" || ls_context || "' > " || ls_context_file
            RUN l_cmd WITHOUT WAITING
            LET g_xml.body = ls_context_file
            LET g_rep_err = TRUE
            CALL cl_prt_j(p_name, NULL)

            #No.FUN-9B0062  -- start --
            IF os.Path.delete( ls_context_file CLIPPED) THEN
            END IF
            #No.FUN-9B0062  -- end --

         END IF
      #No.FUN-570132 ---end---
      END IF
      RETURN
   END IF
 
   #No.FUN-9B0062  -- start --
   IF os.Path.separator() = "/" THEN        #Unix 環境
      LET l_cmd = "chmod 777 ", p_name
   ELSE
      LET l_cmd = "attrib -r ", p_name
   END IF
   #No.FUN-9B0062  -- end --
   RUN l_cmd
 
##MOD-660063 START##
### TQC-5C0007 START ###
#  CALL cl_prt_convert(p_name)
#  IF tsconv_cmd IS NOT NULL THEN
#     IF tsconv_cmd = "gb2312_to_big5" THEN
#        LET ms_codeset = "BIG5"
#     ELSE
#        LET ms_codeset = "GB2312"
#     END IF
#  END IF
### TQC-5C0007 END ###
##MOD-660063 END ##
 
### TQC-5C0007 mark this section start ###
 
######  FUN-510030  #######
#  LET l_cmd = "del ",p_name CLIPPED,".ts  >nul 2>nul"
#  RUN l_cmd
#
#  LET tsconv_cmd = NULL
# #----------
#  # MOD-540082
# #----------
#  IF ms_codeset.getIndexOf("BIG5", 1) OR
#     ( ms_codeset.getIndexOf("GB2312", 1) OR ms_codeset.getIndexOf("GBK", 1) OR ms_codeset.getIndexOf("GB18030", 1) ) THEN
# #----------
#     IF ms_locale = "ZH_TW" AND g_lang = '2' THEN
#        LET tsconv_cmd = "big5_to_gb2312"
#     END IF
#     IF ms_locale = "ZH_CN" AND g_lang = '0' THEN
#        LET tsconv_cmd = "gb2312_to_big5"
#     END IF
#
#     LET lch_cmd = base.Channel.create()
#     CALL lch_cmd.openPipe("uname -s", "r")
#     WHILE lch_cmd.read(os_type)
#     END WHILE
#     CALL lch_cmd.close()
#     LET os_type = os_type.toUpperCase()
#
#     IF tsconv_cmd IS NOT NULL THEN
#        CASE
#            WHEN os_type MATCHES "AIX*"
#                 LET tsconv_cmd=tsconv_cmd, ".ibm"
#            WHEN os_type MATCHES "LINUX*"
#                 LET tsconv_cmd=tsconv_cmd, ".lux"
#            WHEN os_type MATCHES "HP-UX*"
#                 LET tsconv_cmd=tsconv_cmd, ".hp"
#            WHEN os_type MATCHES "SUNOS*"
#                 LET tsconv_cmd=tsconv_cmd, ".sun"
#        END CASE
#
#        LET l_cmd = "cat ", p_name CLIPPED, "|", tsconv_cmd, ">", p_name CLIPPED, ".ts2&&mv ", p_name CLIPPED," ",p_name CLIPPED, ".ts;mv ", p_name CLIPPED, ".ts2 ", p_name CLIPPED
#        RUN l_cmd
#     END IF
#  END IF
######  FUN-510030  #######
### TQC-5C0007 mark this section end ###
 
#####   Please don't delete this make section. coco 20050304   #####
#
#   IF g_gui=2  THEN ## For TIPTOP 5.0 WEB MODE 2000/03/16
#
#      IF g_row_cnt = 0 THEN
#         LET g_cmd="產生檔案size為0"
#         DISPLAY g_cmd TO web01
#      ELSE
#         LET g_cmd ="產生檔案:"
#         DISPLAY g_cmd TO web01
#
#         LET webip = fgl_getenv("WEBIP")
#         LET ftpip = fgl_getenv("FTPIP")
#      ## WEB Server IP & PATH 需依客戶環境修改(或依環境變數)
#         LET g_cmd ="<IMG SRC=\"/icons/hand.right.gif\">"
#         DISPLAY g_cmd TO web02
#
#      ## AP Server IP & Report Output PATH 需依客戶環境修改(或依環境變數)
#         LET ftp_path="ftp://",ftpip CLIPPED,"/pub/out/"
#         LET g_cmd="<a href=""",ftp_path clipped,p_name,"""> ",
#          p_name,"</a><tr>"
#
#         DISPLAY g_cmd TO FORMONLY.web03
#      END IF
#      RETURN
#   END IF  #
#####   Please don't delete this make section. coco 20050304   #####
 
   CALL cl_prt_get_pcode()
   IF p_copies IS NULL THEN
      LET p_copies = '1'
   END IF
 
#----------
# If it's background job, should not apply Print-Way
#----------
#FUN-790003
   IF ( g_cron_job != 'Y' ) AND
      ( g_prtway IS NOT NULL ) AND
      ( g_prtway MATCHES "[123456789LTDXIWMSPVNCJH]" ) AND
      ( g_row_cnt != 0 ) AND
      ( g_zv.zv08 = 'Y' OR g_prtway = 'N')                    #FUN-790036
   THEN
      IF (tsconv_cmd IS NULL) or
         (g_prtway NOT MATCHES "[VTDXIWMSPCHN]") #TQC-770049   #MOD-780018 modify "N"
      THEN
         CALL cl_prt_convert(p_name)
         IF tsconv_cmd IS NOT NULL THEN
            IF tsconv_cmd = "gb2312_to_big5" THEN
              LET ms_codeset = "BIG5"
            ELSE
              LET ms_codeset = "GB2312"
            END IF
         END IF
      END IF
      LET g_zv_chk = "Y"
      IF cl_prt_chk(g_prtway) THEN
         IF g_prtway MATCHES "[ITDXWMSPC]" THEN
            LET l_choice = g_prtway
            LET g_prtway = "O"
         ELSE
            #利用 WEB 登入時，設定"終端機印表"B選項不是"Local Print" 時，
            #固定列印預設改為 VPrint
            IF g_prtway = "L" AND g_gui = 3 AND g_lpcode <> "9" THEN
               LET g_prtway = "N"
            END IF
         END IF
         CASE g_prtway
           WHEN "1" CALL cl_prt_1(p_name,p_copies,'1')
           WHEN "2" CALL cl_prt_1(p_name,p_copies,'2')
           WHEN "3" CALL cl_prt_1(p_name,p_copies,'3')
           WHEN "4" CALL cl_prt_1(p_name,p_copies,'4')
           WHEN "5" CALL cl_prt_1(p_name,p_copies,'5')
           WHEN "6" CALL cl_prt_1(p_name,p_copies,'6')
           WHEN "7" CALL cl_prt_1(p_name,p_copies,'7')
           WHEN "8" CALL cl_prt_1(p_name,p_copies,'8')
           WHEN "9" CALL cl_prt_1(p_name,p_copies,'9')
           WHEN "L"
                    IF g_gui=3 THEN    ## http ##
                       IF cl_null(fgl_getenv("DBPRINT")) THEN
                          CALL cl_err_msg(NULL,"9064",NULL,-1)
                       ELSE
                          IF tsconv_cmd IS NULL THEN
                             CALL cl_prt_l3(p_name,p_copies)
                          ELSE
                             LET  p_name_ts= p_name CLIPPED,".ts"
                             CALL cl_prt_l3(p_name_ts,p_copies)
                          END IF
                       END IF
                    ELSE
                       IF g_lpcode = "9" THEN
                          IF cl_null(fgl_getenv("DBPRINT")) THEN
                             CALL cl_err_msg(NULL,"9064",NULL,-1)
                             EXIT CASE
                          END IF
                          IF tsconv_cmd IS NULL THEN
                             CALL cl_prt_l3(p_name,p_copies)
                          ELSE
                             LET  p_name_ts= p_name CLIPPED,".ts"
                             CALL cl_prt_l3(p_name_ts,p_copies)
                          END IF
                       ELSE
                           CALL cl_prt_l(p_name,p_copies)
                       END IF
                    END IF
           WHEN "O"
                    LET g_prtway = l_choice
                    IF g_prtway = 'I' THEN
                       LET g_prtway ='H'
                    END IF
                    IF not cl_null(g_xml_rep) THEN
                       CALL cl_prt_o(p_name,g_prtway)
                    ELSE
                       CALL cl_prt_o1(p_name,g_prtway)
                    END IF
           WHEN "V" CALL cl_prt_v(p_name)
           WHEN "J" CALL cl_prt_j(p_name,'')
           WHEN "H" CALL cl_vout(p_name)
           WHEN "N"
                    IF tsconv_cmd IS NULL THEN
                       CALL cl_prt_vprint(p_name,p_copies)
                    ELSE
                       LET p_name_ts= p_name CLIPPED,".ts"
                       #No.FUN-9B0062  -- start --
                       IF os.Path.separator() = "/" THEN        #Unix 環境
                          LET l_cmd = "cp ",os.Path.join(FGL_GETENV("TEMPDIR") CLIPPED,p_name_ts CLIPPED),     #FUN-8B0011
                                        " ",os.Path.join(FGL_GETENV("TEMPDIR") CLIPPED,p_name CLIPPED||".vpt")
                          RUN l_cmd
                          LET p_name_ts= p_name CLIPPED,".vpt"
                          LET l_cmd = "chmod 777 ",p_name_ts CLIPPED," 2>/dev/null"
                          RUN l_cmd
                          CALL cl_prt_convert(p_name_ts)
                          CALL cl_prt_vprint(p_name_ts,p_copies)
                       ELSE
                          IF os.Path.copy( os.Path.join(FGL_GETENV("TEMPDIR"),p_name_ts CLIPPED),
                             os.Path.join(FGL_GETENV("TEMPDIR"),p_name CLIPPED||".vpt")) THEN END IF
                          LET p_name_ts= p_name CLIPPED,".vpt"
                          LET l_cmd = "attrib -r ",p_name_ts CLIPPED,"  >nul 2>nul"
                          RUN l_cmd
                          CALL cl_prt_convert(p_name_ts)
                          CALL cl_prt_vprint(p_name_ts,p_copies)
                       END  IF
                       IF os.Path.delete(p_name_ts CLIPPED||".ts") THEN
                       END IF
                       #No.FUN-9B0062  -- end --

                       LET p_name_ts= p_name CLIPPED,".ts"
                    END IF
          #WHEN "L" CALL cl_prt_l(p_name,p_copies)
          #WHEN "D" CALL cl_prt_d(p_name,p_len)
          #WHEN "F" CALL cl_prt_f(p_name,'')
          #WHEN "Q" CALL cl_prt_d(p_name,p_len)
          #WHEN "V" CALL cl_prt_v(p_name)
          #WHEN "X" CALL cl_prt_x(p_name)
          #WHEN "J" CALL cl_prt_j(p_name,'')
        END CASE
      END IF
   END IF
#END FUN-790003
 
   IF g_cron_job = 'Y' THEN
      LET l_time = TIME(CURRENT)
    #--- TQC-610031 BEGIN
      LET l_cmd = "cp -p ", p_name CLIPPED, " ",FGL_GETENV("TEMPDIR") CLIPPED,os.Path.separator(),"p_cron",os.Path.separator(),g_user CLIPPED,os.Path.separator(), g_today USING 'yyyy-mm-dd', ".", l_time[1,5], ".", g_page_line USING '<<<<<', ".", p_name CLIPPED  #FUN-8B0011
      RUN l_cmd
    #--- TQC-610031 END
   END IF
 
#----------
# JavaMail function:
# While backgound job, notify user automatically when finished
#----------
   IF g_cron_job = 'Y' THEN
      LET g_receiver_list = FGL_GETENV("MAIL_TO")
      LET g_cc_list = FGL_GETENV("MAIL_CC")
      LET g_bcc_list = FGL_GETENV("MAIL_BCC")
 
      IF ( NOT cl_null(g_receiver_list) ) OR
         ( NOT cl_null(g_cc_list) ) OR
         ( NOT cl_null(g_bcc_list) ) THEN
         CALL cl_prt_j(p_name, NULL)
      END IF
   END IF
#----------
 
#----------
# While background job done, then return
#----------
   IF g_cron_job = 'Y' THEN
      RETURN
   END IF
#----------
 
   IF g_prtway IS NULL OR g_prtway = "Q" OR g_prtway = ' ' OR
      (g_zv.zv08 = 'N' AND g_prtway != "N")                    #FUN-790036
   THEN
      IF g_gui_type=0 THEN    # Text mode
         OPEN WINDOW cl_prt_w1 AT 3,2
                  WITH 1 ROWS, 40 COLUMNS #ATTRIBUTE(BORDER,YELLOW)  #FUN-9B0062 
      ELSE
         CLOSE WINDOW screen
      END IF
 
 ##########  No.MOD-490130  ##########
#      MESSAGE cl_getmsg('lib-222',g_lang) CLIPPED,":",p_name CLIPPED," ",
#              cl_getmsg('lib-223',g_lang) CLIPPED,":",p_len USING "<<<"," ",
#              cl_getmsg('lib-224',g_lang) CLIPPED,":",g_row_cnt USING "<<<<<<"," ",
#              l_cmd CLIPPED
#      CASE
#          WHEN g_lang = '0'
#                    MESSAGE " 檔名:",p_name CLIPPED,
#                            " 寬度:",p_len USING "<<<",
#                            " 長度:",g_row_cnt USING "<<<<<<","    "
#                            #ATTRIBUTE(WHITE,REVERSE)
#          WHEN g_lang = '2'
#                    MESSAGE " 檔名:",p_name CLIPPED,
#                            " 寬度:",p_len USING "<<<",
#                            " 長度:",g_row_cnt USING "<<<<<<","    "
#                            #ATTRIBUTE(WHITE,REVERSE)
#          OTHERWISE MESSAGE " File:",p_name CLIPPED,
#                            " Width:",p_len USING "<<<",
#                            " Length:",g_row_cnt USING "<<<<<<","    "
#                            #ATTRIBUTE(WHITE,REVERSE)
#      END CASE
 ##########  No.MOD-490130  ##########
 
      CASE
          WHEN g_gui>0
               IF g_bgjob = 'Y' THEN
                  CLOSE WINDOW screen
               END IF
               CALL cl_prt_m(p_name,p_copies)
          OTHERWISE
               EXIT CASE
      END CASE
      IF INT_FLAG THEN
         LET INT_FLAG = 0
      END IF
   END IF
END FUNCTION
 
### TQC-5C0007 start ###
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name
# Return code....:
##################################################
 
FUNCTION cl_prt_convert(p_name)
   DEFINE p_name     STRING,   #TQC-660086
          l_cmd      STRING
 
   #No.FUN-9B0062  -- start --
   IF os.Path.delete(p_name CLIPPED||".ts") THEN 
   END IF
   #No.FUN-9B0062  -- end --
 
   LET tsconv_cmd = NULL
   IF ms_codeset.getIndexOf("BIG5", 1) OR
      ( ms_codeset.getIndexOf("GB2312", 1) OR ms_codeset.getIndexOf("GBK", 1) OR ms_codeset.getIndexOf("GB18030", 1) ) THEN
      IF ms_locale = "ZH_TW" AND g_lang = '2' THEN
         LET tsconv_cmd = "big5_to_gb2312"
      END IF
      IF ms_locale = "ZH_CN" AND g_lang = '0' THEN
         LET tsconv_cmd = "gb2312_to_big5"
      END IF
 
      LET lch_cmd = base.Channel.create()
      CALL lch_cmd.openPipe("uname -s", "r")
      WHILE lch_cmd.read(os_type)
      END WHILE
      CALL lch_cmd.close()
      LET os_type = os_type.toUpperCase()
 
    #-- No.FUN-7B0109 BEGIN ----------------------------------------------------
    # 當 DVM 版本 >= 2.02.06 時, 則使用 Genero 內建的簡繁工具: 檔名直接為 big5_to_gb2312 & gb2312_to_big5
    #---------------------------------------------------------------------------
      IF cl_get_dvm_version() >= "2.02.06" THEN
         LET os_type = "DVM_BUILT_IN"
      END IF
    #-- No.FUN-7B0109 END ------------------------------------------------------
 
      IF tsconv_cmd IS NOT NULL THEN
         CASE
             WHEN os_type MATCHES "AIX*"
                  LET tsconv_cmd=tsconv_cmd, ".ibm"
             WHEN os_type MATCHES "LINUX*"
                  LET tsconv_cmd=tsconv_cmd, ".lux"
             WHEN os_type MATCHES "HP-UX*"
                  LET tsconv_cmd=tsconv_cmd, ".hp"
             WHEN os_type MATCHES "SUNOS*"
                  LET tsconv_cmd=tsconv_cmd, ".sun"
         END CASE
 
         LET l_cmd = "cat ", p_name CLIPPED, "|", tsconv_cmd, ">", p_name CLIPPED, ".ts2 ", p_name CLIPPED," ",p_name CLIPPED, ".ts;mv ", p_name CLIPPED, ".ts2 ", p_name CLIPPED
         RUN l_cmd
         #No.FUN-9B0062  -- start --
         IF os.Path.separator() = "/" THEN        #Unix 環境
            LET l_cmd = "chmod 666 ",p_name CLIPPED,".ts 2>/dev/null"
         ELSE
            LET l_cmd = "attrib -r ",p_name CLIPPED,".ts  >nul 2>nul"  #MOD-660063#
         END IF
         #No.FUN-9B0062  -- end --
         RUN l_cmd                                                  #MOD-660063#
      END IF
   END IF
END FUNCTION
### TQC-5C0007 end ###
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name,p_copies,p_no
# Return code....:
##################################################
 
FUNCTION cl_prt_1(p_name,p_copies,p_no)
   DEFINE p_name        LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          p_copies      LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          p_no          LIKE type_file.chr1    #No.FUN-690005 VARCHAR(1)
   DEFINE l_printer     LIKE type_file.chr3,   #No.FUN-690005 VARCHAR(3),
          l_print_cmd  	STRING
 
 
   #No.FUN-790036
   IF g_zv.zv03 MATCHES "[123456789]"
   THEN
      IF NOT cl_null(g_zv.zv07) AND p_no = g_zv.zv03 THEN
         LET l_print_cmd = "lp -d",g_zv.zv07 CLIPPED," ",p_name
      END IF
   END IF
   IF l_print_cmd IS NULL THEN
      LET l_printer = "LP", p_no USING "<<"
      IF fgl_getenv(l_printer) IS NULL THEN
         LET l_print_cmd = "lp -s -n ", p_copies USING "<<", " ", p_name
      ELSE
        #LET l_print_cmd = "$", l_printer, " ", p_name
         LET l_print_cmd = fgl_getenv(l_printer), " ", p_name         #TQC-7A0088
      END IF
   END IF
   #END No.FUN-790036
   display l_print_cmd
   RUN l_print_cmd
END FUNCTION
 
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name,p_copies
# Return code....:
##################################################
 
FUNCTION cl_prt_l(p_name,p_copies)
   DEFINE p_name        LIKE type_file.chr20,  #No.FUN-690005  VARCHAR(20),
          p_copies      LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          l_print_cmd   LIKE type_file.chr1000,#No.FUN-690005 VARCHAR(40),
          l_choice2     LIKE type_file.chr1    #No.FUN-690005 VARCHAR(1)
   DEFINE window_path   STRING                 #No.TQC-720029
 
   IF g_gui>=1 AND cl_null(g_lpcode) # 1.GUI mode  2.HTML 3.JAVA
      THEN
 
 ##########  No.MOD-490130  ##########
 
       MESSAGE cl_getmsg('lib-225',g_lang) CLIPPED
       CALL ui.interface.refresh()      #MOD-570245    #MOD-640008
 
#      CASE
#       WHEN g_lang = '0'
#         MESSAGE '       作業中,請稍候!'
#       WHEN g_lang = '2'
#         MESSAGE '       作業中,請稍候!'
#       OTHERWISE
#         MESSAGE '       Processing ..!'
#      END CASE
 ##########  No.MOD-490130  ##########
 
      IF g_choice='B' THEN
         LET l_print_cmd = os.Path.join( FGL_GETENV("TEMPDIR"), p_name CLIPPED)
         DISPLAY l_print_cmd
         #No.TQC-720029
         #LET status = cl_download_file(l_print_cmd, "C:/tiptop")
         LET window_path = "c:\\tiptop\\",p_name CLIPPED
         LET status = cl_download_file(l_print_cmd, window_path)
         #END No.TQC-720029
 
      ELSE
         LET l_print_cmd = 'p000 ',p_name CLIPPED,' ',g_choice
         RUN l_print_cmd
      END IF
   ELSE
      display "lpcode"
      LET l_print_cmd = 'p000 ',p_name CLIPPED,' ', g_lpcode
      RUN l_print_cmd
   END IF
END FUNCTION
 
### FUN-5C0010 start ###
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name,p_copies
# Return code....:
##################################################
 
FUNCTION cl_prt_vprint(p_name,p_copies)
   DEFINE l_url,l_cmd           STRING,
          lch_cmd               base.Channel,
          vprint_cmd,isutf8     STRING,
          res                   LIKE type_file.num10,  #No.FUN-690005 INTEGER,
          p_copies              LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          p_name,file_path      STRING
#FUN-790036
   DEFINE l_zv07                STRING
   DEFINE l_zv04                STRING
   DEFINE l_zv08                STRING
#END FUN-790036
 
#   LET filename=ARG_VAL(1)
 
   LET isutf8 = "0"             #FUN-790036  #No.MOD-810042 modify
   IF ms_codeset.getIndexOf("UTF-8", 1) THEN
      LET isutf8="1"    #No.MOD-810042
     #LET isutf8="Y"    #No.MOD-810042 mark
   END IF
   LET file_path=FGL_GETENV("TEMPDIR")
 
   LET lch_cmd = base.Channel.create()
   CALL lch_cmd.openPipe("uname -s", "r")
   WHILE lch_cmd.read(os_type)
   END WHILE
   CALL lch_cmd.close()
   LET os_type = os_type.toUpperCase()
   CASE
       WHEN os_type MATCHES "AIX*"
            LET vprint_cmd="VPrintHtml.ibm"
       WHEN os_type MATCHES "LINUX*"
            LET vprint_cmd="VPrintHtml.lux"
       WHEN os_type MATCHES "HP-UX*"
            LET vprint_cmd="VPrintHtml.hp"
       WHEN os_type MATCHES "SUNOS*"
            LET vprint_cmd="VPrintHtml.sun"
   END CASE
 
   #FUN-790036
   IF g_zv.zv03 = 'N' THEN
      IF NOT cl_null(g_zv.zv07) THEN
         LET l_zv07 = g_zv.zv07 CLIPPED
      END IF
      IF NOT cl_null(g_zv.zv04) THEN
         LET l_zv04 = g_zv.zv04 CLIPPED
      END IF
      IF NOT cl_null(g_zv.zv08) THEN
         IF g_zv.zv08 = "Y" THEN
            LET l_zv08 = "1"
         ELSE
            LET l_zv08 = "0"
         END IF
      END IF
   END IF
   LET l_cmd=vprint_cmd CLIPPED," ",file_path CLIPPED,os.Path.separator(),p_name CLIPPED," '",isutf8 ,"' '",l_zv04,"' '",l_zv07,"' '",l_zv08,"'"   #FUN-8B0011
   display l_cmd
   #LET l_cmd=vprint_cmd CLIPPED," ",file_path CLIPPED,os.Path.separator(),p_name CLIPPED," ",isutf8 CLIPPED     #FUN-8B0011
   #END FUN-790036
 
  #LET l_cmd=vprint_cmd CLIPPED," ",p_name CLIPPED," ",isutf8 CLIPPED
   RUN l_cmd
  #LET l_url= "http://10.40.40.168/vprint/out/",filename CLIPPED,".html"
   LET l_url = FGL_GETENV("FGLASIP"),"/../../../vprint/out/", p_name CLIPPED,".html"
   CALL ui.Interface.frontCall("standard",
                                   "shellexec",
  #                                ["EXPLORER \"" || l_url || "\""], #FUN-780054 mark
                                   ["IEXPLORE \"" || l_url || "\""], #FUN-780054 add
                                   [res])
END FUNCTION
### FUN-5C0010 end ###
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name,p_copies
# Return code....:
##################################################
 
FUNCTION cl_prt_l3(p_name,p_copies)
   DEFINE p_name         STRING,                #No.FUN-690005 CHAR(20),  #CHI-B30010 chr20改成STRING
          p_copies  	 LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          l_channel      base.Channel,
          l_str 	 string
 
   START REPORT cl_prt_l3_rep TO PRINTER
#   OUTPUT TO REPORT cl_prt_l3_rep(p_name)
   LET l_channel = base.Channel.create()
   CALL l_channel.openFile(p_name CLIPPED, "r")
   WHILE l_channel.read(l_str)
      OUTPUT TO REPORT cl_prt_l3_rep(l_str)
   END WHILE
   CALL l_channel.close()
   FINISH REPORT cl_prt_l3_rep
   LET INT_FLAG = 0
END FUNCTION
 
REPORT cl_prt_l3_rep(l_str)
   DEFINE l_str    string
#   DEFINE p_name    VARCHAR(20)
 
#No.TQC-760168  --start--
   OUTPUT TOP MARGIN 0      #g_top_margin
         LEFT MARGIN 0      #g_left_margin
         BOTTOM MARGIN 0    #g_bottom_margin
         PAGE LENGTH g_page_line
#No.TQC-760168  --end--
   FORMAT
      ON EVERY ROW
         PRINT l_str
#         PRINT FILE p_name
END REPORT
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name,p_len
# Return code....:
##################################################
 
FUNCTION cl_prt_d(p_name,p_len)
   DEFINE p_name     LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          p_len      LIKE type_file.num5,   #No.FUN-690005 SMALLINT,
          l_cmd      LIKE type_file.chr1000 #No.FUN-690005 VARCHAR(80)
   IF p_len > 80 THEN LET l_cmd = "132;" END IF
   LET l_cmd = l_cmd CLIPPED,'pg -n -f ',p_name,';'
   IF p_len > 80 THEN LET l_cmd = l_cmd CLIPPED,"80;" END IF
   RUN l_cmd
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name
# Return code....:
##################################################
 
FUNCTION cl_prt_v(p_name)
   DEFINE p_name        LIKE type_file.chr20   #No.FUN-690005 VARCHAR(20)
   DEFINE l_cmd         STRING
 
 
   IF fgl_getenv('FGLRUN') IS NULL THEN
      LET l_cmd = "fglrun"
   ELSE
      LET l_cmd = fgl_getenv('FGLRUN')
   END IF
 ### MOD-560231 ###
   IF g_page_line = 0 then
      LET g_page_line = g_row_cnt
   END IF
 ### MOD-560231 ###
######  FUN-510030  #######
   IF tsconv_cmd IS NULL THEN
     #LET l_cmd = l_cmd CLIPPED," ",FGL_GETENV("TOP"),"/azz/42r/p_view.42r ", p_name CLIPPED, g_page_line
      LET l_cmd = l_cmd CLIPPED," ",FGL_GETENV("TOP"),"/azz/42r/p_view.42r ", p_name CLIPPED, g_page_line, g_idle_seconds ### TQC-610093 ###
   ELSE                         
     #LET l_cmd = l_cmd CLIPPED," ",FGL_GETENV("TOP"),"/azz/42r/p_view.42r ", p_name CLIPPED,".ts", g_page_line
      LET l_cmd = l_cmd CLIPPED," ",FGL_GETENV("TOP"),"/azz/42r/p_view.42r ", p_name CLIPPED,".ts", g_page_line, g_idle_seconds ### TQC-610093 ###
   END IF
######  FUN-510030  #######
   RUN l_cmd
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name
# Return code....:
##################################################
 
FUNCTION cl_prt_x(p_name)
   DEFINE p_name   LIKE type_file.chr20  #No.FUN-690005 VARCHAR(20)
   DEFINE l_cmd    STRING
 
   #No.FUN-9B0062  -- start --
   IF os.Path.separator() = "/" THEN        #Unix 環境
      LET l_cmd = "chmod +rw ", p_name,";",
                  "$LPX ",p_name
   ELSE
      LET l_cmd = "attrib -r ", p_name,";",
                        "$LPX ",p_name
   END IF
   #No.FUN-9B0062  -- end --
 
   RUN l_cmd
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_priv
# Return code....:
##################################################
 
FUNCTION cl_prt_chk(p_priv)
   DEFINE p_priv   LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          l_buf    LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          l_i      LIKE type_file.num5    #No.FUN-690005 SMALLINT
 
 
   IF g_user = "informix" THEN
      RETURN 1
   END IF
   IF cl_null(g_priv4) THEN
      RETURN 1
   END IF
 
   FOR l_i = 1 TO 20                    #FUN-630099
       IF p_priv = g_priv4[l_i,l_i] AND g_priv4[l_i,l_i] IS NOT NULL THEN
          RETURN 1
       END IF
   END FOR
 
   #FUN-790003
   IF g_zv_chk = "Y" THEN
         CALL cl_err(p_priv,'9040',1)
   ELSE
         CALL cl_err(p_priv,'9040',0)
   END IF
   #END FUN-790003
 
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',p_priv,'9040',0)
      ELSE
         CALL cl_err(p_priv,'9040',0)
      END IF
#No.FUN-720003--end
   RETURN 0
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name
# Return code....:
##################################################
 
FUNCTION cl_prt_c(p_name)
   DEFINE p_name                  LIKE type_file.chr20   #No.FUN-690005 VARCHAR(20)
   DEFINE page_length             LIKE type_file.num10   #No.FUN-690005 INTEGER
   DEFINE b_page                  LIKE type_file.num10   #No.FUN-690005 INTEGER
   DEFINE c                       LIKE type_file.chr1    #No.FUN-690005 VARCHAR(1)  # '1'去除 '2'保留
   DEFINE line_no                 LIKE type_file.num10   #No.FUN-690005 INTEGER
   DEFINE l_cmd                   LIKE type_file.chr1000,#No.FUN-690005 VARCHAR(80),
          tmp_name                LIKE type_file.chr50,  #No.FUN-690005 VARCHAR(26),
          l_line_cnt              LIKE type_file.num10,  #No.FUN-690005 INTEGER,
          l_end_line,l_start_line LIKE type_file.num10,  #No.FUN-690005 INTEGER,
          l_str                   STRING,
          row_cnt                 LIKE type_file.num10,  #No.FUN-690005 INTEGER,    ##總行數
          l_channel               base.Channel,
          l_channel1              base.Channel
 
    OPEN WINDOW cl_prt_w2 AT 5,40
        WITH FORM "lib/42f/cl_prt_2" ATTRIBUTE(STYLE="lib")
    CALL cl_ui_locale("cl_prt_2")
    LET page_length = 66
    LET b_page      = 1
    LET c           = 1
    INPUT BY NAME page_length,c,b_page WITHOUT DEFAULTS  #ATTRIBUTE(YELLOW)   #No.FUN-9B0062
        AFTER FIELD c
           IF c NOT MATCHES "[1234]" THEN NEXT FIELD c END IF
       ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE INPUT
 
       #No.TQC-860016 --start--
       ON ACTION controlg
          CALL cl_cmdask()
 
       ON ACTION about
          CALL cl_about()
 
       ON ACTION help
          CALL cl_show_help()
       #No.TQC-860016 ---end---
    END INPUT
    IF INT_FLAG THEN LET INT_FLAG = 0 CLOSE WINDOW cl_prt_w2 RETURN END IF
 #### MOD-550086 ####
    LET l_cmd= "fix_cutpage ",p_name CLIPPED
    RUN l_cmd
 #### MOD-550086 ####
    IF c = 1
       THEN LET line_no = page_length * b_page + 1
       ELSE LET line_no = page_length * b_page
    END IF
 
   LET l_channel = base.Channel.create()
   LET l_channel1 = base.Channel.create()
   LET tmp_name = p_name CLIPPED,CURRENT HOUR TO SECOND,".cut"
   LET l_line_cnt=0
   ###刪除已存在的檔案
   CALL l_channel.openFile(p_name CLIPPED, "r")
   CALL l_channel.setDelimiter("")
   CALL l_channel1.openFile( tmp_name CLIPPED, "a" )
   CALL l_channel1.setDelimiter("")
 
   CASE
        WHEN c='1'  #去前
             WHILE l_channel.read(l_str)
               LET l_line_cnt = l_line_cnt + 1
               IF l_line_cnt>9852 and l_line_cnt<9857 THEN
                 display l_line_cnt," ",l_str
               END IF
               IF l_line_cnt >= line_no THEN
                 CALL l_channel1.write(l_str)
#                 IF l_line_cnt>140 and l_line_cnt<151 THEN
#                    display l_line_cnt ,l_str
#                 end if
               END IF
             END WHILE
             LET g_row_cnt=g_row_cnt - line_no + 1
        WHEN c='2'  #去後
             LET l_end_line = g_row_cnt - line_no
             WHILE l_channel.read(l_str)
               LET l_line_cnt = l_line_cnt + 1
               IF l_line_cnt <= l_end_line THEN
                 CALL l_channel1.write(l_str)
               END IF
             END WHILE
             LET g_row_cnt = l_end_line
        WHEN c='3'  #保前
             WHILE l_channel.read(l_str)
               LET l_line_cnt = l_line_cnt + 1
               IF l_line_cnt <= line_no THEN
                 CALL l_channel1.write(l_str)
               END IF
             END WHILE
             LET g_row_cnt = line_no
        WHEN c='4'  #保後
             LET l_start_line = g_row_cnt - line_no + 1
             WHILE l_channel.read(l_str)
               LET l_line_cnt = l_line_cnt + 1
               IF l_line_cnt>=l_start_line THEN
                 CALL l_channel1.write(l_str)
               END IF
             END WHILE
             LET g_row_cnt = g_row_cnt - l_start_line + 1
   END CASE
 
   CALL l_channel.close()
   CALL l_channel1.close()
   LET l_cmd = 'cp ',tmp_name CLIPPED,' ',p_name CLIPPED
   RUN l_cmd

   #No.FUN-9B0062  -- start --
   IF os.Path.delete(tmp_name CLIPPED) THEN
   END IF
   #No.FUN-9B0062  -- end --

   CLOSE WINDOW cl_prt_w2
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: none
# Return code....:
##################################################
#FUN-790036
FUNCTION cl_prt_get_pcode()
   DEFINE l_cnt       LIKE type_file.num10
 
   INITIALIZE g_zv.* TO NULL
 
   #先抓取 user 設定
   SELECT COUNT(*) INTO l_cnt FROM zv_file
    WHERE zv02 = g_user  AND zv05 = 'default'
      AND zv01 = g_prog  AND zv06 = g_zaa11_value AND zvacti = 'Y'
   IF l_cnt = 0 THEN
      #無 user 設定，則抓取 group 設定
      SELECT COUNT(*) INTO l_cnt FROM zv_file
       WHERE zv02 = 'default'  AND zv05 = g_clas
         AND zv01 = g_prog     AND zv06 = g_zaa11_value AND zvacti='Y'
      IF l_cnt = 0 THEN
         #無 group 設定, 則以 default/default 為主
         SELECT COUNT(*) INTO l_cnt FROM zv_file
          WHERE zv02 = 'default'  AND zv05 = 'default'
            AND zv01 = g_prog     AND zv06 = g_zaa11_value AND zvacti='Y'
         IF l_cnt > 0 THEN
            LET g_zv.zv02 = "default"
            LET g_zv.zv05 = "default"
         END IF
      ELSE
         LET g_zv.zv02 = "default"
         LET g_zv.zv05 = g_clas
      END IF
   ELSE
      LET g_zv.zv02 = g_user
      LET g_zv.zv05 = "default"
   END IF
 
   IF l_cnt > 0 THEN
      SELECT * INTO g_zv.*   FROM zv_file
        WHERE zv02 = g_zv.zv02  AND zv05 = g_zv.zv05     AND zvacti = 'Y'
          AND zv01 = g_prog     AND zv06 = g_zaa11_value
      IF SQLCA.SQLCODE OR SQLCA.SQLCODE = NOTFOUND THEN
         LET g_zv.zv03 = NULL
         LET g_lpcode = NULL
      ELSE
         IF g_zv.zv03 = 'G' THEN
            LET g_zv.zv03 = 'L'
            LET g_zv.zv04= '9'
         END IF
         LET g_lpcode = g_zv.zv04
      END IF
   END IF
 
   IF g_zv.zv03 IS NOT NULL THEN
     #FUN-790003
     #IF g_zv.zv03 MATCHES '[DS]' AND g_gui>=1 THEN  ## 1.GUI mode 2.HTML 3.JAVA
     #   LET g_prtway = ''
     #ELSE
         LET g_prtway = g_zv.zv03
     #END IF
     #END FUN-790003
   END IF
END FUNCTION
#END FUN-790036
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name
# Return code....:
##################################################
 
FUNCTION cl_vout(p_name)
   DEFINE p_name          LIKE type_file.chr20  #No.FUN-690005 VARCHAR(20)
   DEFINE p_prog          LIKE zz_file.zz01     #No.FUN-690005 VARCHAR(10)
   DEFINE str	          LIKE type_file.chr1000#No.FUN-690005 VARCHAR(80)
   DEFINE l_cmd	          LIKE type_file.chr1000#No.FUN-690005 VARCHAR(80)
   DEFINE i,j,k,m,start   LIKE type_file.num5   #No.FUN-690005 SMALLINT
   DEFINE l_count,l_cnt   LIKE type_file.num5   #No.FUN-690005 SMALLINT
   DEFINE flag,l_sw       LIKE type_file.chr1   #No.FUN-690005 VARCHAR(1)    #MOD-4A0258
   DEFINE vout            DYNAMIC ARRAY OF RECORD
          t1              LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          t2              LIKE type_file.num10,  #No.FUN-690005 INTEGER,
#         t3              VARCHAR(10),
#         t4              VARCHAR(10),
          t5              LIKE type_file.chr20   #No.FUN-690005 VARCHAR(12)
                          END RECORD
   DEFINE vout2           DYNAMIC ARRAY OF RECORD
          t1              LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          t2              LIKE type_file.num10   #No.FUN-690005 INTEGER
                          END RECORD
 
 
  FOR i=1 TO 20 IF p_name[i]='.' THEN EXIT FOR END IF END FOR
 
   ### MOD-4A0258 ###
  LET p_prog=p_name[1,i-1]
   SELECT zz06 INTO l_sw
     FROM zz_FILE WHERE zz01 = p_prog
 
   #No.FUN-9B0062  -- start --
   IF os.Path.separator() = "/" THEN        #Unix 環境
      LET l_cmd="chmod 777 x"
   ELSE
      LET l_cmd="attrib -r x"
   END IF
   #No.FUN-9B0062  -- end --
   RUN l_cmd
 
   IF l_sw = '1' THEN  #
      LET l_cmd='ls -al ',p_prog CLIPPED,'.out > x'
      RUN l_cmd
   ELSE
      LET l_cmd='ls -al ',p_prog CLIPPED,'.??r > x'
      RUN l_cmd
   END IF
   ### END MOD-4A0258 ###
 
  OPEN WINDOW cl_vout_w AT 4,5 WITH FORM "lib/42f/cl_vout"
       ATTRIBUTE(STYLE="lib")
  CALL cl_ui_locale("cl_vout")
 
  IF STATUS THEN
#   CALL cl_err('open w:',STATUS,1)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','open w:',STATUS,1)
      ELSE
         CALL cl_err('open w:',STATUS,1)
      END IF
#No.FUN-720003--end
   RETURN END IF
  MESSAGE "WAIT..."
#No.FUN-690005-------------start------------------
  DROP TABLE temp_out
  CREATE TEMP TABLE temp_out(
         t1 LIKE type_file.chr1000)       #No.FUN-9B0062
  DROP TABLE temp_wc
  CREATE TEMP TABLE temp_wc(
         t1 LIKE type_file.chr50)         #No.FUN-9B0062
#No.FUN-690005--------------end------------------
  BEGIN WORK
  LOAD FROM 'x' INSERT INTO temp_out
  COMMIT WORK
  DECLARE cl_vout_c CURSOR WITH HOLD FOR SELECT * FROM temp_out
  LET m=0
  LET start=1
  LET i=1
  FOREACH cl_vout_c INTO str
     FOR j=1 TO 79
        LET k=j+1
        CASE
           WHEN NOT cl_null(str[j]) AND cl_null(str[k])
                LET m=m+1
                LET flag='Y'
           WHEN cl_null(str[j]) AND NOT cl_null(str[k])
                LET start=k
        END CASE
        IF m=3 AND flag='Y' THEN
           LET flag='N'
           IF str[start,j] <> g_user THEN
              LET m=0
              LET start=1
              CONTINUE FOREACH
           END IF
        END IF
        CASE
{
           WHEN m=3 AND flag='Y' LET vout[i].t3=str[start,j] LET flag='N'
                SELECT zx02 INTO vout[i].t4 FROM zx_file
                WHERE zx01=vout[i].t3
}
           WHEN m=6 AND flag='Y' LET vout[i].t5[1,4]=str[start,j] LET flag='N'
           WHEN m=7 AND flag='Y' LET vout[i].t5[5,6]=str[start,j] LET flag='N'
           WHEN m=8 AND flag='Y' LET vout[i].t5[8,12]=str[start,j] LET flag='N'
           WHEN m=9 AND flag='Y' LET vout[i].t1=str[start,j] LET flag='N'
 
        END CASE
     END FOR
     LET m=0
     LET start=1
     LET i=i+1
     IF i>100 THEN EXIT FOREACH END IF
  END FOREACH
  CALL SET_COUNT(i-1)
  LET l_count=i-1
 
   ###MOD-4A0258 ###
   IF l_sw = '1' THEN  #
     #--- MOD-550032
    # Unset LANG locale setting before counter line numbers
      LET l_cmd='wc -l ',p_prog CLIPPED,'.out > x'
    #----------
      RUN l_cmd
   ELSE
     #--- MOD-550032
    # Unset LANG locale setting before counter line numbers
      LET l_cmd='wc -l ',p_prog CLIPPED,'.??r > x'
    #----------
      RUN l_cmd
   END IF
   ###END MOD-4A0258 ###
 
  BEGIN WORK
  LOAD FROM 'x' INSERT INTO temp_wc
  COMMIT WORK
 
  DECLARE cl_vout_c2 CURSOR FOR SELECT * FROM temp_wc
  LET i=1
  FOREACH cl_vout_c2 INTO str
     FOR j=1 TO 40
         LET k=j+1
         IF cl_null(str[j]) AND NOT cl_null(str[k]) THEN
            LET vout2[i].t2=str[1,j]
            LET vout2[i].t1=str[k,40]
         END IF
     END FOR
     LET i=i+1
     IF i>100 THEN EXIT FOREACH END IF
  END FOREACH
  LET l_cnt=i-1
 
  IF l_count>0
     THEN
     FOR i=1 TO l_count
         FOR j=1 TO l_cnt
             IF vout[i].t1=vout2[j].t1
                THEN
                LET vout[i].t2=vout2[j].t2
                EXIT FOR
             END IF
         END FOR
     END FOR
  END IF
 
  MESSAGE ""
   CALL cl_set_act_visible("accept,cancel", FALSE)               #MOD-4A0258
  DISPLAY ARRAY vout TO s_vout.* ATTRIBUTE(COUNT=100,UNBUFFERED)
# INPUT ARRAY vout WITHOUT DEFAULTS FROM s_vout.*
 
      BEFORE DISPLAY
          IF vout.getLength() = 0 THEN
             CALL DIALOG.setActionActive("controlm", FALSE)
          END IF
 
      BEFORE ROW
          LET i=ARR_CURR()
 
    ##MOD-4A0258
      ON ACTION controlm
#         LET l_cmd='$VI ',vout[i].t1
#         RUN l_cmd
          IF vout[i].t2 > 0 THEN
             CALL cl_prt_v(vout[i].t1)
          ELSE
#           CALL cl_err('','azz-066',1)
      #No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','','azz-066',1)
      ELSE
         CALL cl_err('','azz-066',1)
      END IF
      #No.FUN-720003--end
          END IF
 
      ON ACTION accept
          CONTINUE DISPLAY
    ## END MOD-4A0258
 
      ON ACTION exit
          EXIT DISPLAY
 
      ON IDLE g_idle_seconds
          CALL cl_on_idle()
          CONTINUE DISPLAY
 
      #No.TQC-860016 --start--
      ON ACTION controlg
         CALL cl_cmdask()
 
      ON ACTION about
         CALL cl_about()
 
      ON ACTION help
         CALL cl_show_help()
      #No.TQC-860016 ---end---
  END DISPLAY
 
   CALL cl_set_act_visible("accept,cancel", TRUE)               #MOD-4A0258
  CLOSE WINDOW cl_vout_w
  IF INT_FLAG THEN LET INT_FLAG=0 RETURN END IF
END FUNCTION
 
##################################################
# Descriptions...: 傳真功能新增
# Date & Author..: 1996/04/12 by WUPN
# Input Parameter: p_name,p_faxnumber
# Return code....:
##################################################
 
FUNCTION cl_prt_f(p_name,p_faxnumber)
   DEFINE p_name        LIKE type_file.chr20,   #No.FUN-690005 VARCHAR(20),
          p_faxnumber   LIKE type_file.chr20    #No.FUN-690005 VARCHAR(20)
   DEFINE l_cmd	        LIKE type_file.chr1000, #No.FUN-690005 VARCHAR(100),
          l_str         LIKE type_file.chr50    #No.FUN-690005 VARCHAR(50)
   DEFINE l_buf         LIKE type_file.chr50    #No.FUN-690005 VARCHAR(30)
 
   IF cl_null(p_faxnumber)   #傳真號碼
      THEN
#--genero
#     OPEN WINDOW cl_prt_f_w AT 18,20
#          WITH 2 ROWS, 40 COLUMNS
#       ATTRIBUTE (BORDER)
 
 ##########  No.MOD-490130  ##########
      MESSAGE cl_getmsg('lib-226',g_lang) CLIPPED,":"
#      CASE
#       WHEN g_lang = '0'
#            LET l_str = "請輸入傳真電話號碼:"
#       WHEN g_lang = '2'
#            LET l_str = "請輸入傳真電話號碼:"
#       OTHERWISE
#            LET l_str = "Enter Fax Number:"
#      END CASE
 ##########  No.MOD-490130  ##########
      PROMPT l_str CLIPPED FOR p_faxnumber
         ON IDLE g_idle_seconds
            CALL cl_on_idle()
##           CONTINUE PROMPT
 
         #No.TQC-860016 --start--
         ON ACTION controlg
            CALL cl_cmdask()
 
         ON ACTION about
            CALL cl_about()
 
         ON ACTION help
            CALL cl_show_help()
         #No.TQC-860016 ---end---
      END PROMPT
#     CLOSE WINDOW cl_prt_f_w
      IF INT_FLAG OR cl_null(p_faxnumber) THEN
          LET INT_FLAG=0
          RETURN
      END IF
   END IF
 
   CALL fgl_getenv('FAX') RETURNING l_buf  #
   IF l_buf IS NULL THEN
      LET l_cmd = "lpr -Pfax -J ",p_faxnumber CLIPPED," ",p_name
   ELSE
      LET l_cmd = l_buf CLIPPED," ",p_faxnumber CLIPPED," ",p_name
   END IF
   DISPLAY l_cmd
   sleep 3
   RUN l_cmd
 
END FUNCTION
 
##################################################
# Descriptions...: erase semicolon
# Date & Author..:
# Input Parameter: p_name
# Return code....:
##################################################
 
FUNCTION cl_prt_sub_semicolon(p_name)  # erase semicolon
   DEFINE p_name    LIKE type_file.chr20  #No.FUN-690005 VARCHAR(20)
   DEFINE l_cmd	    LIKE type_file.chr1000#No.FUN-690005 VARCHAR(100)
 
   #No.FUN-9B0062  -- start --
   IF os.Path.separator() = "/" THEN        #Unix 環境
      LET l_cmd="cp ",p_name CLIPPED," ",p_name CLIPPED,"xl"
      RUN l_cmd
      LET l_cmd="sed -e 's/;/ /g' ",p_name CLIPPED,"xl >",p_name CLIPPED
   ELSE
      IF os.Path.copy(os.Path.join(FGL_GETENV("TEMPDIR"),p_name CLIPPED),
                      os.Path.join(FGL_GETENV("TEMPDIR"),p_name CLIPPED||"xl" )) THEN END IF
      LET l_cmd = FGL_GETENV("FGLRUN"),
                   os.Path.join( os.Path.join( FGL_GETENV("DS4GL"),"bin" ),"rsed.42m"),  
                  ' ";" " " ',
                  p_name CLIPPED,"xl ",p_name CLIPPED
   END IF 
   RUN l_cmd
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_prog,p_sql
# Return code....:
##################################################
 
FUNCTION cl_prt_temptable(p_prog,p_sql)
    DEFINE p_prog                 LIKE zz_file.zz01,
           p_sql,l_length         STRING,
           l_table,l_str          STRING,
           l_name                 STRING,
           l_time                 STRING,               ### No. FUN-B20102 ###
           l_n                    LIKE type_file.num10,
           l_tok_column           base.StringTokenizer,
           l_tok_table            base.StringTokenizer,
           l_table_name           LIKE gac_file.gac05,
           l_field_name           LIKE gac_file.gac06,
           l_alias_name           LIKE gac_file.gac06,
           l_datatype             LIKE ztb_file.ztb04,
           l_cnt_dot,l_cnt_comma  LIKE type_file.num5,
           l_p                    LIKE type_file.num5,
           l_p2                   LIKE type_file.num5,
           l_sql                  STRING,
           l_db_type              LIKE type_file.chr3,
           l_mssqlarea            STRING,                ### FUN-810068 ###
           l_dbname               STRING                 ### FUN-810068 ###
    DEFINE l_str1                 STRING                 ### CHI-990023 ### 
 
    ### 依照不同的datebase_type,來指定在sql中的資料庫寫法 ###
    LET l_db_type=cl_db_get_database_type()

    CASE l_db_type
       WHEN "IFX" LET g_cr_db_str = "ds_report:"
       WHEN "ORA" LET g_cr_db_str = "ds_report."
       WHEN "MSV" LET g_cr_db_str = fgl_getenv("MSSQLAREA"),"_ds_report.dbo."
       WHEN "ASE" LET g_cr_db_str = "ds_report.dbo."                             #FUN-AA0076
       OTHERWISE
    END CASE 
 
    ##No. FUN-B20102 Start ## 
    #FUN-9B0062 -- start --
    #CASE l_db_type
    #   WHEN "ORA" LET l_sql = "SELECT TO_CHAR(SYSDATE, 'HH24MI.SS') FROM DUAL"
    #   WHEN "IFX" LET l_sql = "SELECT FIRST 1 REPLACE(CURRENT HOUR TO FRACTION,':','') FROM zx_file"
    #   WHEN "MSV" LET l_sql = "SELECT CAST(DATEPART(hh,GETDATE()) AS VARCHAR) ",
    #                              " + CAST(DATEPART(mi,GETDATE()) AS VARCHAR) ",
    #                              " + CAST(DATEPART(ss,GETDATE()) AS VARCHAR)+'.' ",
    #                              " + CAST(DATEPART(ms,GETDATE()) AS VARCHAR)"
    #   WHEN "ASE" LET l_sql = "SELECT CAST(DATEPART(hh,GETDATE()) AS VARCHAR) ",        #FUN-AA0076
    #                              " + CAST(DATEPART(mi,GETDATE()) AS VARCHAR) ",
    #                              " + CAST(DATEPART(ss,GETDATE()) AS VARCHAR)+'.' ",
    #                              " + CAST(DATEPART(ms,GETDATE()) AS VARCHAR)"
    #   OTHERWISE
    #END CASE 
    #PREPARE time_prep FROM l_sql
    #FUN-9B0062 -- end --
    #IF SQLCA.sqlcode THEN
    #  IF g_bgerr THEN
    #     CALL s_errmsg('','','time_prep:',SQLCA.sqlcode,1)
    #  ELSE
    #     CALL cl_err('time_prep:',SQLCA.sqlcode,1)
    #  END IF
    #  RETURN -1
    #END IF
 
    #DECLARE time_curs CURSOR FOR time_prep
    #OPEN time_curs
    #FETCH time_curs INTO l_time

    LET l_time = CURRENT HOUR TO FRACTION(5)
    CALL cl_replace_str(l_time, ":", "") RETURNING l_time
    CALL cl_replace_str(l_time, ".", "_") RETURNING l_time
 
    LET l_str = l_time CLIPPED
    #LET l_n = l_str.getIndexOf(".",1)  #No. FUN-B20102 ##
    ### CHI-990023 START ###
    #LET l_str1 = FGL_GETPID()       #使用GETPID抓PID的值
    #LET l_str1 = l_str1.trimLeft()  #使用trim函式，變數型態需為STRING
    #LET l_table = p_prog CLIPPED,"_",l_str.subString(1,l_n-1),"_",
    #              l_str.subString(l_n+1,FGL_WIDTH(l_str))
    #              ,"_",l_str1 CLIPPED
    #LET l_table = p_prog CLIPPED,"_",l_str.subString(1,l_n-1),"_",
    #              l_str.subString(l_n+1,FGL_WIDTH(l_str))
    ### CHI-990023 END ###
    LET l_table = p_prog CLIPPED, "_", l_str
    #DISPLAY "l_table = ", l_table
    ##No. FUN-B20102 End ##

    IF g_report IS NULL OR g_report = '' THEN LET g_report = 'ds_report' END IF
 
    CALL cl_ins_del_sid(2, g_plant) #FUN-980030:將原本的SESSIONID刪除
 
    CLOSE DATABASE
    DATABASE g_report   ### temptable created in g_report for CR ###
 
    IF SQLCA.sqlcode THEN
      DATABASE g_dbs  ###FUN-740008###
      IF l_db_type="IFX" THEN               ### MOD-860181 ###
         SET ISOLATION TO DIRTY READ  
      END IF                                ### MOD-860181 ###
      IF g_bgerr THEN
         CALL s_errmsg('','','DATABASE ds_report not exist','!',1)
      ELSE
         CALL cl_err('DATABASE ds_report not exist','!',1)
      END IF
       CLOSE DATABASE
       RETURN -1
    END IF
 
    LET g_sql = "DROP TABLE ",l_table CLIPPED
    PREPARE drop_prep FROM g_sql
    ## FUN-810068 ##
    IF (l_db_type="ORA" and SQLCA.sqlcode<>0) OR (l_db_type="IFX" and SQLCA.sqlcode<>-206) OR 
       (l_db_type="MSV" and SQLCA.sqlcode<>0) OR
       (l_db_type="ASE" and SQLCA.sqlcode<>0) THEN                   #FUN-AA0076
      DATABASE g_dbs  ### TQC-750056 ###
      IF l_db_type="IFX" THEN               ### MOD-860181 ###
         SET ISOLATION TO DIRTY READ  
      END IF                                ### MOD-860181 ###
      IF g_bgerr THEN
         CALL s_errmsg('','','drop_prep:',SQLCA.sqlcode,1)
      ELSE
         CALL cl_err('drop_prep:',SQLCA.sqlcode,1)
      END IF
      RETURN -1
    END IF
    EXECUTE drop_prep
 
    LET l_tok_table = base.StringTokenizer.create(p_sql,".")
    LET l_cnt_dot = l_tok_table.countTokens()
    LET l_tok_table = base.StringTokenizer.create(p_sql,",")
    LET l_cnt_comma = l_tok_table.countTokens()
    IF ((l_cnt_dot-1)/2)  <> l_cnt_comma THEN
      DATABASE g_dbs  ### TQC-750056 ###
      IF l_db_type="IFX" THEN               ### MOD-860181 ###
         SET ISOLATION TO DIRTY READ  
      END IF                                ### MOD-860181 ###
      IF g_bgerr THEN
         CALL s_errmsg('','','','lib-359',1)
      ELSE
         CALL cl_err('','lib-359',1)
      END IF
      RETURN -1
    END IF
 
    LET l_sql = ""
 
    ### Using Function to get data type and length ###
    ### FUN-810068 START ###
    IF l_db_type="MSV" THEN
       LET l_mssqlarea= fgl_getenv('MSSQLAREA') CLIPPED
       LET l_dbname = l_mssqlarea CLIPPED,"_ds"
    ELSE 
       LET l_dbname = "ds"
    END IF 
    ### FUN-810068 END ###
 
    WHILE l_tok_table.hasMoreTokens()
       #DISPLAY l_tok_table.nextToken()
       LET l_name = l_tok_table.nextToken()
       LET l_p = l_name.getIndexOf(".",1)
       LET l_p2 = l_name.getIndexOf(".",l_p+1)
       LET l_alias_name = l_name.subString(1,l_p-1)
       LET l_table_name = l_name.subString(l_p+1,l_p2-1)
       LET l_field_name = l_name.subString(l_p2+1,l_name.getLength())
       ### FUN-810068 START ###
       #CALL cl_get_column_info('ds',l_table_name,l_field_name)
       
       CALL cl_get_column_info(l_dbname,l_table_name,l_field_name)
       ### FUN-810068 END ###
       RETURNING l_datatype,l_length
       IF NOT cl_null(l_sql) THEN
          LET l_sql = l_sql,","
       END IF
       IF l_datatype = "smallint" OR l_datatype = "integer" OR l_datatype = "date"
          OR l_datatype = "datetime"   ### FUN-810068 ### 
          OR l_datatype = "blob"  OR l_datatype = "byte"     #TQC-8B0049  #FUN-910012 byte
       THEN
           LET l_sql = l_sql, l_alias_name CLIPPED," ",l_datatype
       ELSE
           LET l_sql = l_sql, l_alias_name CLIPPED," ",l_datatype,
                       "(",l_length,")"
       END IF
    END WHILE
    ###
    LET l_sql = "(",l_sql,")"
 
    LET g_sql = "CREATE TABLE ",l_table CLIPPED,l_sql CLIPPED
    PREPARE create_prep FROM g_sql
    IF SQLCA.sqlcode THEN
       DATABASE g_dbs  ### TQC-750056 ###
       IF l_db_type="IFX" THEN               ### MOD-860181 ###
          SET ISOLATION TO DIRTY READ  
       END IF                                ### MOD-860181 ###
       IF g_bgerr THEN
          CALL s_errmsg('','','create_prep:',SQLCA.sqlcode,1)
       ELSE
          CALL cl_err('create_prep:',SQLCA.sqlcode,1)
       END IF
       RETURN -1
    END IF

    EXECUTE create_prep
    IF SQLCA.sqlcode THEN
       DATABASE g_dbs  ### TQC-750056 ###
       IF l_db_type="IFX" THEN               ### MOD-860181 ###
          SET ISOLATION TO DIRTY READ  
       END IF                                ### MOD-860181 ###
       IF g_bgerr THEN
          CALL s_errmsg('','','create_table:',SQLCA.sqlcode,1)
       ELSE
          CALL cl_err('create_table:',SQLCA.sqlcode,1)
       END IF
       RETURN -1
    END IF
 
    LET g_sql = "GRANT ALL ON ",l_table CLIPPED," TO PUBLIC"
    PREPARE grant_prep FROM g_sql
    IF SQLCA.sqlcode THEN
       DATABASE g_dbs  ### TQC-750056 ###
       IF l_db_type="IFX" THEN               ### MOD-860181 ###
          SET ISOLATION TO DIRTY READ  
       END IF                                ### MOD-860181 ###
       IF g_bgerr THEN
          CALL s_errmsg('','','grant_prep:',SQLCA.sqlcode,1)
       ELSE
          CALL cl_err('grant_prep:',SQLCA.sqlcode,1)
       END IF
       RETURN -1
    END IF

    EXECUTE grant_prep
 
    CLOSE DATABASE
    DATABASE g_dbs    # 切換回原來的資料庫
    CALL cl_ins_del_sid(1, g_plant) #FUN-980030:儲存新的SESSIONID
    IF l_db_type="IFX" THEN               ### MOD-860181 ###
       SET ISOLATION TO DIRTY READ  
    END IF                                ### MOD-860181 ###
    IF SQLCA.sqlcode THEN
       IF g_bgerr THEN
          CALL s_errmsg('','','Change Database failed','!',1)
       ELSE
          CALL cl_err('Change Database failed','!',1)
       END IF
       EXIT PROGRAM
    END IF
 
    #No.FUN-860089 -- start --
    IF cl_null(g_cr_sql) THEN 
       LET g_cr_sql = p_sql
    END IF
    #No.FUN-860089 -- end --
 
    LET g_temptable = l_table          #FUN-930132 add

    #FUN-9B0062 -- start --
    IF l_db_type="MSV" THEN           
       SET ISOLATION TO DIRTY READ 
       SET LOCK MODE TO NOT WAIT
    END IF
    #FUN-9B0062 -- end --

    RETURN l_table   # 傳回自動產生的 Temp Table Name
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: none
# Return code....:
##################################################
 
FUNCTION cl_prt_cr_trans_lang()   ### FUN-710071 CR ###
   DEFINE l_trans_lang     STRING
 
   LET l_trans_lang = "0"
   IF ms_codeset.getIndexOf("BIG5", 1) OR
      ( ms_codeset.getIndexOf("GB2312", 1) OR ms_codeset.getIndexOf("GBK", 1) OR ms_codeset.getIndexOf("GB18030", 1) ) THEN
      IF ms_locale = "ZH_TW" AND g_lang = '2' THEN
         LET l_trans_lang ="1"         ### big5_to_gb2312 ###
      END IF
      IF ms_locale = "ZH_CN" AND g_lang = '0' THEN
         LET l_trans_lang ="2"         ### gb2312_to_big5 ###
      END IF
   END IF
   RETURN l_trans_lang
END FUNCTION
 
##################################################
# Descriptions...: 簡單報表 (直接使用SQL抓取資料) 串接 CR接口
# Date & Author..:
# Input Parameter: p_prog,p_rep_template,p_sql,param_str
# Return code....:
##################################################
 
FUNCTION cl_prt_cs1(p_prog,p_rep_template,p_sql,param_str)
    DEFINE p_prog                    LIKE zaw_file.zaw01,
           p_rep_template            LIKE zaw_file.zaw02,
           p_rpt_name                LIKE zaw_file.zaw08,
           p_cust                    LIKE zaw_file.zaw03,
           p_rpt_path                LIKE zax_file.zax03,    ### FUN-750092 ###
           p_sql_zax                 LIKE zax_file.zax04,    ### FUN-750092 ###
           param1_zax                LIKE zax_file.zax05,    ### FUN-750092 ###
           param2_zax                LIKE zax_file.zax06,    ### FUN-750092 ###
           param3_zax                LIKE zax_file.zax07,    ### FUN-750092 ###
           l_trans_lang              LIKE zax_file.zax08,    ### FUN-750092 ###
           l_logo                    LIKE zax_file.zax09,    ### FUN-750092 ###
           l_tab_list                LIKE zax_file.zax10,    ### FUN-750092 ###
           l_rpt_exp                 LIKE zax_file.zax11,    #No.FUN-770002 #CrystalReport可用的匯出功能
           #l_rep_db                  LIKE zax_file.zax03,   ### FUN-740008 ###
           #l_rep_db_pw               LIKE zax_file.zax04,   ### FUN-740008 ###
           #l_instance                LIKE zax_file.zax05,   ### FUN-740008 ###
           l_str_ord                 STRING,                 ### FUN-740008 ###
           p_sql                     STRING,
           l_url,l_str,param_str     STRING,
           l_modul                   LIKE zz_file.zz011,
           l_gaz03                   LIKE gaz_file.gaz03,
           l_gaz06                   LIKE gaz_file.gaz06,    #FUN-780036 add
           #ls_gaz03,ls_company       STRING,                #No.FUN-770106
           #ls_user,ls_date,l_certid  STRING,                #No.FUN-770106
           li_status                 LIKE type_file.num10,
           i,l_cnt_param,certid      LIKE type_file.num5,
           l_tok_param               base.StringTokenizer,
           param_array               DYNAMIC ARRAY OF STRING,   ### FUN-750065 ###
           l_db_type                 LIKE type_file.chr3    ### TQC-750056 ###
    DEFINE l_sub_sql1                LIKE zax_file.zax12    #No.FUN-770106
    DEFINE l_sub_sql2                LIKE zax_file.zax13    #No.FUN-770106
    DEFINE l_sub_sql3                LIKE zax_file.zax14    #No.FUN-770106
    DEFINE l_sub_sql4                LIKE zax_file.zax15    #No.FUN-770106
    DEFINE l_sub_sql5                LIKE zax_file.zax16    #No.FUN-770106
    DEFINE l_sql_tok                 base.StringTokenizer   #No.FUN-770106
    DEFINE l_has_subreport           LIKE type_file.num5    #No.FUN-770106
    DEFINE l_sub_sql6                LIKE zax_file.zax17    #No.TQC-870021
    DEFINE l_sub_sql7                LIKE zax_file.zax18    #No.TQC-870021
    DEFINE l_sub_sql8                LIKE zax_file.zax19    #No.TQC-870021
    DEFINE l_sub_sql9                LIKE zax_file.zax20    #No.TQC-870021
    DEFINE l_sub_sql10               LIKE zax_file.zax21    #No.TQC-870021
    DEFINE l_sub_sql11               LIKE zax_file.zax22    #No.TQC-870021
    DEFINE l_sub_sql12               LIKE zax_file.zax23    #No.TQC-870021
    DEFINE l_sub_sql13               LIKE zax_file.zax24    #No.TQC-870021
    DEFINE l_sub_sql14               LIKE zax_file.zax25    #No.TQC-870021
    DEFINE l_sub_sql15               LIKE zax_file.zax26    #No.TQC-870021
    #No.FUN-880041 --start
    DEFINE l_mlj03                LIKE mlj_file.mlj03
    DEFINE l_mlj04                LIKE mlj_file.mlj04
    DEFINE l_mlj05                LIKE mlj_file.mlj05
    DEFINE l_mlj06                LIKE mlj_file.mlj06
    DEFINE l_mlj08                LIKE mlj_file.mlj08   #TQC-940031
    DEFINE l_mlj09                LIKE mlj_file.mlj09   #FUN-8A0022
    DEFINE l_zax28                LIKE zax_file.zax28    
    DEFINE l_zax29                LIKE zax_file.zax29
    DEFINE l_zax30                LIKE zax_file.zax30
    DEFINE l_zax31                LIKE zax_file.zax31    
    DEFINE l_zax32                LIKE zax_file.zax32
    DEFINE l_zax33                LIKE zax_file.zax33   #FUN-8A0022
    DEFINE l_zax34                LIKE zax_file.zax34   #報表檔名        #FUN-8C0025
    DEFINE l_zax35                LIKE zax_file.zax35   #檔名重複時覆寫   #FUN-8C0025
    DEFINE l_zax36                LIKE zax_file.zax36   # Prog. Version..: '5.25.02-11.03.23(0:不列印簽核/ 1:頁尾/ 2:表尾)   #FUN-910012
    DEFINE l_cnt                  LIKE type_file.num5   #FUN-8A0022
    DEFINE ls_context             string
    DEFINE ls_para                string
    DEFINE li_i                   LIKE type_file.num5
    DEFINE l_havedata             string
    #No.FUN-880041 --end
    DEFINE l_aza24                LIKE aza_file.aza24 #FUN-8A0037
    ###FUN-8C0025 START ###
    DEFINE l_zaw   RECORD             
           zaw04 LIKE zaw_file.zaw04,                   #權限類別
           zaw05 LIKE zaw_file.zaw05,                   #使用者   
           zaw14 LIKE zaw_file.zaw14,                   #紙張名稱           #FUN-920131
           zaw15 LIKE zaw_file.zaw15                    #紙張方向(縱向/橫向)  #FUN-920131
           END RECORD
    DEFINE l_gcw   RECORD         LIKE gcw_file.*       #CR報表檔名設定
    DEFINE l_zx02                 LIKE zx_file.zx02     #使用者名稱
    DEFINE l_time                 LIKE type_file.chr8   #時間
    DEFINE l_item_name            STRING                #報表檔名全部選項，以"|"隔開
    DEFINE l_field       RECORD                         #NO.FUN-860089
              field001  LIKE gaq_file.gaq03     #No.FUN-680135 VARCHAR(255)
                     END RECORD
    ###FUN-960182 START ###
    DEFINE l_DByy                 STRING                #年
    DEFINE l_DByy_new             STRING                #年new
    DEFINE l_DByy_l               LIKE type_file.num5   #年的位置   
    DEFINE l_DByy_i               LIKE type_file.num5   #年幾碼
    DEFINE l_pdate                STRING                #日期(轉換過後的)
    ###FUN-960182 END ###
    DEFINE l_zax39                LIKE zax_file.zax39   #DBDATE環境變數     #FUN-970006
    DEFINE l_mailtpl              STRING                #CR mail樣板檔名,預設為"crmail_default.html"  #FUN-A30119
    DEFINE lc_azp02 LIKE azp_file.azp02 #FUN-A10041
        
    LET l_time=TIME
    ###FUN-8C0025 END ###
        
    #No.FUN-770106 --start--
    IF (g_pdate = 0 ) OR cl_null(g_pdate) THEN
       LET g_pdate = g_today
    END IF    
    ###FUN-960182 START ###
    LET l_pdate = g_pdate
    LET l_db_type = cl_db_get_database_type() #資料庫型態

    #MSV的年4碼要轉2碼
    IF l_db_type = "MSV" THEN        
       LET l_str = FGL_GETENV("DBDATE")       #MDY4/ ((Y4:年4碼,M:月,D:日,/:分隔符號)，年月日的順序可以改變)       
       LET l_DByy_l = l_str.getIndexOf("Y",1) #年的位置, l_DByy_l=3
       LET l_DByy_i = l_str.subString(l_DByy_l+1, l_DByy_l+1) #年幾碼  
            
       IF l_DByy_i = 4 THEN  #年4碼要轉2碼
          IF l_DByy_l > 1 THEN
             LET l_DByy_l = (l_DByy_l-1) * 3 + 1   #06/30/2009, l_DByy_l=7
          END IF      
          LET l_str = l_pdate CLIPPED
          LET l_DByy = l_str.subString(l_DByy_l, l_DByy_l+l_DByy_i-1)  #年:2009
          LET l_DByy_new = l_DByy.subString(3, 4)  #年:09
          CALL cl_replace_str(l_str, l_DByy, l_DByy_new) RETURNING l_pdate
       END IF
    END IF
    ###FUN-960182 END ###
    
    #主報表與各子報表SQL用 '|' 分隔, 主報表SQL為 p_sql_zax, 子報表SQL為 l_sub_sql1 - l_sub_sql5
    DISPLAY "p_sql:",p_sql
    LET l_sql_tok = base.StringTokenizer.createExt(p_sql,"|","",TRUE)
    LET l_has_subreport = FALSE
    IF l_sql_tok.hasMoreTokens() THEN
        LET p_sql_zax = l_sql_tok.nextToken() CLIPPED
    ELSE
        LET p_sql_zax = p_sql CLIPPED
    END IF
    LET p_sql_zax = cl_replace_str(p_sql_zax, "\"", "'")	#No.TQC-870021
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_has_subreport = TRUE
        LET l_sub_sql1 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql1 = cl_replace_str(l_sub_sql1, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql2 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql2 = cl_replace_str(l_sub_sql2, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql3 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql3 = cl_replace_str(l_sub_sql3, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql4 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql4 = cl_replace_str(l_sub_sql4, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql5 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql5 = cl_replace_str(l_sub_sql5, "\"", "'")	#No.TQC-870021
    END IF
    #No.TQC-870021 --start--
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql6 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql6 = cl_replace_str(l_sub_sql6, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql7 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql7 = cl_replace_str(l_sub_sql7, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql8 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql8 = cl_replace_str(l_sub_sql8, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql9 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql9 = cl_replace_str(l_sub_sql9, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql10 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql10 = cl_replace_str(l_sub_sql10, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql11 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql11 = cl_replace_str(l_sub_sql11, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql12 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql12 = cl_replace_str(l_sub_sql12, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql13 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql13 = cl_replace_str(l_sub_sql13, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql14 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql14 = cl_replace_str(l_sub_sql14, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql15 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql15 = cl_replace_str(l_sub_sql15, "\"", "'")	#No.TQC-870021
    END IF
    #No.TQC-870021 --end--
    DISPLAY "sub:"||l_has_subreport
    #No.FUN-770106 --end--
 
    #LET l_db_type=cl_db_get_database_type()   ### TQC-750056 ###   #FUN-960182 mark
 
    # 背景作業
    #IF g_bgjob = 'Y' THEN RETURN 1 END IF
    ### 先判斷有無資料或其他問題,再串到CR ###
    #PREPARE cr_prepare1 FROM p_sql
    #EXECUTE IMMEDIATE p_sql    #No.FUN-770106
    EXECUTE IMMEDIATE p_sql_zax #No.FUN-770106
    #display "SQLCA.sqlcode:",SQLCA.sqlcode
    #display "SQLCA.sqlerrd[3]:",SQLCA.sqlerrd[3]
 
    #No.FUN-860089 -- start --
    #FUN-880041 --start
    IF SQLCA.sqlcode=100 THEN
       LET l_havedata='N'
    ELSE
       DECLARE sql_cur1 CURSOR FROM p_sql_zax
       IF SQLCA.SQLCODE THEN
          IF g_bgjob = 'Y' THEN       	
             CALL s_errmsg('','','DECLARE sql_cur1:',SQLCA.SQLCODE,1)                                                                     
          ELSE                                                                                                                          
             CALL cl_err('DECLARE sql_cur1',SQLCA.SQLCODE,1)
             RETURN
          END IF       
       END IF
       FOREACH sql_cur1 INTO l_field.*
          EXIT FOREACH
       END FOREACH
       IF SQLCA.SQLCODE THEN
          IF g_bgjob = 'Y' THEN       	
             CALL s_errmsg('','','DECLARE sql_cur1:',SQLCA.SQLCODE,1)                                                                     
          ELSE                                                                                                                          
             CALL cl_err('DECLARE sql_cur1',SQLCA.SQLCODE,1)
             RETURN
          END IF       
          RETURN 
       END IF
       CLOSE sql_cur1
       LET l_havedata='Y'
    END IF
    IF l_havedata='N' THEN                                                                                                           
       IF g_bgjob = 'Y' THEN       	
          CALL s_errmsg('','','!','lib-216',1)                                                                     
       ELSE                                                                                                                          
          CALL cl_err('!','lib-216',1)
          RETURN
       END IF       
    END IF
    {IF SQLCA.sqlcode=100 THEN
       IF g_bgerr THEN
          CALL s_errmsg('','','!','lib-216',1)
       ELSE
          CALL cl_err('!','lib-216',1)
       END IF
       RETURN
    END IF}
    #FUN-880041 --end
 
    #No.FUN-A60063 --start--
    CALL cl_get_zvcr()
    IF cl_prt_chkzv() THEN
        #No.FUN-B30131 --start--
        CALL cl_prt_zv_get_page_size(p_prog, g_zv_cr.zv06)
        RETURNING p_cust,l_zaw.zaw04,l_zaw.zaw05,p_rpt_name,l_zax36,l_zaw.zaw14,l_zaw.zaw15
        #CALL cl_prt_cs3_t(p_prog, g_zv_cr.zv06)
        #    RETURNING p_cust, l_zaw.zaw04, l_zaw.zaw05, p_rpt_name, l_zax36,
        #              l_zaw.zaw14, l_zaw.zaw15
        #No.FUN-B30131 --end--
        LET g_zaw14 = l_zaw.zaw14
    ELSE
    #No.FUN-A60063 --end--
        IF NOT cl_prt_cs_preview(p_prog,p_sql_zax) THEN
            RETURN
        END IF
        #No.FUN-860089 -- end --
    
        #CALL cl_prt_cs3_t(p_prog,p_rep_template) RETURNING p_cust,p_rpt_name   #FUN-8C0025 mark 
        CALL cl_prt_cs3_t(p_prog,p_rep_template) RETURNING p_cust,l_zaw.zaw04,l_zaw.zaw05,p_rpt_name,l_zax36,l_zaw.zaw14,l_zaw.zaw15  #FUN-8C0025   #FUN-920131 add zaw14,zaw15 #FUN-910012 加l_zax36  
    END IF  #No.FUN-A60063
    
    
    SELECT zz011 INTO l_modul FROM zz_file where zz01 = g_prog
    IF p_cust = 'Y' THEN
       LET p_rpt_path="topcust/",DOWNSHIFT(l_modul) CLIPPED,"/",p_prog CLIPPED,"/",g_rlang CLIPPED,"/",p_rpt_name CLIPPED,".rpt"
    ELSE
       LET p_rpt_path="tiptop/",DOWNSHIFT(l_modul) CLIPPED,"/",p_prog CLIPPED,"/",g_rlang CLIPPED,"/",p_rpt_name CLIPPED,".rpt"
    END IF
 
    #LET p_sql_zax = p_sql CLIPPED    ### FUN-750092 ###    #No.FUN-770106
    LET p_sql = cl_prt_trans_str(p_sql)
   #str FUN-780036 mod
   #SELECT gaz03 INTO l_gaz03 FROM gaz_file WHERE gaz01=g_prog AND gaz02=g_rlang
   #LET ls_gaz03 = l_gaz03 CLIPPED
   #報表名稱抓法改為先抓gaz06,若gaz06沒值,再抓gaz03
    SELECT gaz03,gaz06 INTO l_gaz03,l_gaz06 FROM gaz_file
     WHERE gaz01=g_prog AND gaz02=g_rlang
    IF cl_null(l_gaz06) THEN
       LET l_gaz06 = l_gaz03 CLIPPED
    END IF
    #LET ls_gaz03 = l_gaz06 CLIPPED     #No.FUN-770106
   #end FUN-780036 mod
   #No.FUN-770106 --start--
    #LET ls_gaz03 = cl_prt_trans_str(ls_gaz03)
    #LET ls_company = g_company CLIPPED
    #LET ls_company = cl_prt_trans_str(ls_company)
    #LET ls_user = g_user CLIPPED
    #LET ls_user = cl_prt_trans_str(ls_user)
    #LET ls_date = g_pdate
    #LET ls_date = cl_prt_trans_str(ls_date)
   #No.FUN-770106 --end--
 
    ### param1-param10###
    #LET l_tok_param = base.StringTokenizer.create(param_str,";")
    LET l_tok_param = base.StringTokenizer.createExt(param_str,";","",TRUE)
    LET l_cnt_param = l_tok_param.countTokens()
    IF l_cnt_param>0 THEN
       CALL param_array.clear()
       LET i=0
       WHILE l_tok_param.hasMoreTokens()
          #DISPLAY l_tok_table.nextToken()
          LET i=i+1
          #LET param_array[i] =cl_prt_trans_str(l_tok_param.nextToken()) ## FUN-750092 ##
          LET param_array[i] =l_tok_param.nextToken()  ## FUN-750092 ##
       END WHILE
    END IF
    ### Get certificate_ID ###
    #LET certid = util.Math.rand(99999)   #No.MOD-810198
    LET certid = FGL_GETPID()             #No.MOD-810198
    #display certid
    #INSERT INTO zax_file values(certid,g_user,l_rep_db,l_rep_db_pw,l_instance)
    #INSERT INTO zax_file values(certid,g_user) ### FUN-750092 ###
 
    ### FUN-750092 START ###
    LET param2_zax = param_array[1] CLIPPED,"|",param_array[2] CLIPPED,"|",
                     param_array[3] CLIPPED,"|",param_array[4] CLIPPED,"|",
                     param_array[5] CLIPPED,"|",param_array[6] CLIPPED,"|",
                     param_array[7] CLIPPED,"|",param_array[8] CLIPPED,"|",
                     param_array[9] CLIPPED,"|",param_array[10] CLIPPED
    LET param3_zax = param_array[11] CLIPPED,"|",param_array[12] CLIPPED,"|",
                     param_array[13] CLIPPED,"|",param_array[14] CLIPPED,"|",
                     param_array[15] CLIPPED,"|",param_array[16] CLIPPED,"|",
                     param_array[17] CLIPPED,"|",param_array[18] CLIPPED,"|",
                     param_array[19] CLIPPED,"|",param_array[20] CLIPPED
   #LET param1_zax =g_company CLIPPED,"|",l_gaz03 CLIPPED,"|",g_pdate,"|",TIME,"|",g_user,"|",g_prog   #FUN-780036 mark
   #LET param1_zax =g_company CLIPPED,"|",l_gaz06 CLIPPED,"|",g_pdate,"|",TIME,"|",g_user,"|",g_prog   #FUN-780036 #FUN-8C0025 mark
    SELECT zx02 INTO l_zx02 FROM zx_file WHERE zx01 = g_user   #使用者名稱   #MOD-940295
    #LET param1_zax =g_company CLIPPED,"|",l_gaz06 CLIPPED,"|",g_pdate,"|",l_time,"|",g_user,"|",g_prog,"|",l_zx02  #FUN-8C0025  #MOD-940295 加l_zx02   #FUN-960182 mark

    SELECT azp02 INTO lc_azp02 FROM azp_file WHERE azp01 = g_plant #FUN-A10041
    LET param1_zax =g_company CLIPPED,"[",g_plant CLIPPED,":",lc_azp02 CLIPPED,"]|",l_gaz06 CLIPPED,"|",l_pdate,"|",l_time,"|",g_user,"|",g_prog,"|",l_zx02  #FUN-960182
    LET l_trans_lang = cl_prt_cr_trans_lang()
    #LET l_logo = FGL_GETENV("FGLASIP") || "/tiptop/pic/pdf_logo_",g_dbs CLIPPED,g_rlang,".jpg"  ### FUN-750016 ### #No.FUN-970006 marked
    LET l_logo = FGL_GETENV("CRIP") || "images/pdf_logo_",g_dbs CLIPPED,g_rlang,".jpg"  #No.FUN-970006 add
 
    #== FUN-8A0037 START ==#
    #依照aoos010的設定報表輸出Logo位置，zax09一併紀錄aza24(用|隔開)
    select aza24 into l_aza24 from aza_file
    IF SQLCA.sqlcode THEN
        CALL cl_err3("sel","aza_file",l_aza24,"",SQLCA.sqlcode,"","",0)
        RETURN
    ELSE
        LET l_logo = l_logo CLIPPED, "|", l_aza24 CLIPPED
    END IF
    #== FUN-8A0037 END ==#
 
    #FUN-880041 --start 記錄發信 message
    #SELECT mlj03,mlj04,mlj05,mlj06,mlj08,mlj09 INTO l_mlj03,l_mlj04,l_mlj05,l_mlj06,l_mlj08,l_mlj09 #FUN-8A0022  #FUN-940099 mark #TQC-940031
    #  FROM mlj_file where mlj01='CR'   #FUN-940099 mark
    CALL cl_prt_cs3_aooi999(p_prog) RETURNING l_mlj03,l_mlj04,l_mlj05,l_mlj06,l_mlj08,l_mlj09,l_zax33   #查aooi999的資訊 #FUN-940099
      
    LET l_zax28 = l_mlj03 CLIPPED,"|",l_mlj04 CLIPPED,"|",
                  l_mlj05 CLIPPED,"|",l_mlj06 CLIPPED,"|",l_mlj08 CLIPPED #TQC-940031
                  
    #FUN-890056 --start
    IF g_bgjob = 'Y' AND g_prtway = 'A' THEN             
       LET l_zax29 = FGL_GETENV("MAIL_TO")
       LET l_zax30 = FGL_GETENV("MAIL_CC")
       LET l_zax31 = FGL_GETENV("MAIL_BCC")
    ELSE
    	 CALL cl_maillist()
    	 LET l_zax29 = g_receiver CLIPPED
    	 LET l_zax30 = g_cc CLIPPED
    	 LET l_zax31 = g_bcc CLIPPED
    END IF
    #FUN-890056 --end
    IF cl_null(g_xml.subject) THEN   #信件主旨   #FUN-A30119
       LET l_zax32 = cl_getmsg("lib-227",g_lang) CLIPPED," : ", l_gaz03 CLIPPED, "\(", g_prog CLIPPED, "\)",  #TQC-740155
                     cl_getmsg("lib-228",g_lang) CLIPPED,"  : ", g_company CLIPPED,
                     cl_getmsg("lib-229",g_lang) CLIPPED,"  : ", l_zx02 CLIPPED, "\(", g_user CLIPPED, "\)",   #MOD-940295 加l_zx02
                     cl_getmsg("lib-230",g_lang) CLIPPED,"  : ", g_today   
    ELSE                             #FUN-A30119
       LET l_zax32 = g_xml.subject   #FUN-A30119
    END IF                           #FUN-A30119
 
    FOR li_i = 1 TO NUM_ARGS()
         LET ls_para = ls_para, " '", ARG_VAL(li_i), "'"
    END FOR                        
    
    #LET ls_context = cl_getmsg("lib-282",g_lang) CLIPPED,"|", cl_getmsg("lib-227",g_lang) CLIPPED,"|", cl_getmsg("lib-229",g_lang) CLIPPED,"|", cl_get_progname(g_prog,g_lang) CLIPPED,"|",   #FUN-A30119 mark
    #                 cl_getmsg("lib-279",g_lang) CLIPPED,"|",TODAY CLIPPED," ",TIME ,"|",cl_getmsg("lib-280",g_lang) CLIPPED,"|",ls_para CLIPPED,"|",cl_getmsg("lib-281",g_lang) CLIPPED,"|", #FUN-A30119 mark
    #                 cl_getmsg("lib-216",g_lang) CLIPPED,"|",cl_getmsg("lib-284",g_lang) CLIPPED,"|",FGL_GETENV("CRIP") CLIPPED   #FUN-A30119 mark
    ###FUN-A30119 START ###
    IF cl_null(g_xml.file) THEN
       LET l_mailtpl = "crmail_default.html"
    ELSE
       LET l_mailtpl = g_xml.file CLIPPED
    END IF
    LET ls_context = cl_getmsg("lib-282",g_lang) CLIPPED,"|", cl_getmsg("lib-227",g_lang) CLIPPED,"|", cl_getmsg("lib-229",g_lang) CLIPPED,"|", cl_get_progname(g_prog,g_lang) CLIPPED,"(",g_prog,")", "|",
                     cl_getmsg("lib-279",g_lang) CLIPPED,"|",TODAY CLIPPED," ",TIME ,"|",l_mailtpl CLIPPED,"||",cl_getmsg("lib-281",g_lang) CLIPPED,"|"
    
    IF l_havedata = "Y" THEN
       LET ls_context = ls_context CLIPPED, cl_getmsg("lib-284",g_lang) CLIPPED, "|"
    ELSE
       LET ls_context = ls_context CLIPPED, cl_getmsg("lib-216",g_lang) CLIPPED, "|"
    END IF
    DISPLAY "ls_context=",ls_context
    LET ls_context = ls_context CLIPPED, l_zx02 CLIPPED,"(",g_user CLIPPED,")", "|", FGL_GETENV("CRIP") CLIPPED
    ###FUN-A30119 END ###
    
    LET l_zax32 = l_zax32 CLIPPED ,"|",ls_context
    LET l_zax32 = l_zax32 CLIPPED ,"|",l_havedata
    
    ###FUN-A30119 START ###
    LET l_zax32 = l_zax32 CLIPPED ,"||||||"  #前20個參數是TIPTOP內定的
    IF NOT cl_null(g_xml.body) THEN          #zax32在第20個參數之後的可以客製化,都用"|"隔開
       LET l_zax32 = l_zax32 CLIPPED ,"|",g_xml.body
    END IF
    ###FUN-A30119 END ### 
    ###FUN-940099 mark START ###
    ##FUN-8A0022 start
    #SELECT COUNT(*) INTO l_cnt FROM mlj_file WHERE mlj01=g_prog
    #
    #IF l_cnt >0 THEN #程式代號為優先
    #	 SELECT COUNT(*) INTO l_cnt FROM mlj_file WHERE mlj01=g_prog AND mlj09='N'
    #	 IF l_cnt > 0 THEN
    #	 	  LET l_mlj09 = "N"
    #	 ELSE
    #		  LET l_mlj09 = "Y"
    #	 END IF
    #END IF 
    #
    #IF l_mlj09 = "N" THEN
    #	 select zx09 INTO l_zax33 from zx_file  where zx01 = g_user
    #   LET l_zax33 = l_zax33 CLIPPED
    #
    #   IF cl_null(l_zax33) THEN
    #	    LET l_zax33 = ""
    #   END IF 
    #END IF
    ##FUN-8A0022 end
    ###FUN-940099 mark END ###
    #FUN-880041 --end
    
    #No.FUN-770002 --start--
    SELECT zy06 INTO l_rpt_exp FROM zy_file WHERE zy01=g_clas AND zy02=g_prog
    #No.FUN-770106 --start--
    #INSERT INTO zax_file values(certid,g_user,p_rpt_path,p_sql_zax,param1_zax,param2_zax,param3_zax,l_trans_lang,l_logo,l_tab_list,l_rpt_exp)  ###FUN-750092###
    ###FUN-8C0025 START ###
    LET l_zax34=""  #報表檔名    
    SELECT * INTO l_gcw.* FROM gcw_file
       WHERE gcw01=p_prog AND gcw02=p_rep_template AND gcw03=l_zaw.zaw04 AND gcw04=l_zaw.zaw05
 
    IF (NOT cl_null(l_gcw.gcw05)) OR (NOT cl_null(l_gcw.gcw06)) OR (NOT cl_null(l_gcw.gcw07)) OR (NOT cl_null(l_gcw.gcw08)) OR (NOT cl_null(l_gcw.gcw09)) OR (NOT cl_null(l_gcw.gcw10)) THEN    
       #SELECT zx02 INTO l_zx02 FROM zx_file WHERE zx01 = g_user   #使用者名稱   #MOD-940295改在前面先撈資料
       
       #程式代號|程式名稱|營運中心編號|營運中心名稱|使用者代號|使用者名稱|日期|時間|p1|p2|......|p20
       LET l_item_name = p_prog CLIPPED,"|",l_gaz06 CLIPPED,"|",g_plant CLIPPED,"|",g_dbs CLIPPED,"|",g_user CLIPPED,"|",l_zx02 CLIPPED,"|",g_pdate CLIPPED,"|",l_time CLIPPED
       FOR li_i = 1 TO 20   #p1~p20
          LET l_item_name = l_item_name,"|",param_array[li_i] CLIPPED
       END FOR     
       
       CALL cl_prt_filename(l_item_name,l_gcw.gcw05) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw06) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw07) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw08) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw09) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw10) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED  
       #刪除最後一個分隔符號       
       LET l_str = l_zax34 CLIPPED
       LET l_str = l_str.substring(1,l_str.getLength()-1) CLIPPED             
       LET l_zax34 = l_str CLIPPED
    END IF
 
    #檔名重複是否覆寫
    IF cl_null(l_gcw.gcw11) THEN 
       LET l_zax35 = "Y" 
    ELSE
       LET l_zax35 = l_gcw.gcw11
    END IF
    LET l_zax39 = FGL_GETENV("DBDATE")  #No.FUN-970006
    ###FUN-8C0025 END ###
    DELETE FROM zax_file WHERE zax01=certid  #No.CHI-830031
    IF l_has_subreport THEN
    	  #No.TQC-870021 --start--
        #INSERT INTO zax_file (zax01,zax02,zax03,zax04,zax05,zax06,zax07,zax08,zax09,zax10,zax11,zax12,zax13,zax14,zax15,zax16)
        #VALUES (certid,g_user,p_rpt_path,p_sql_zax,param1_zax,param2_zax,param3_zax,l_trans_lang,l_logo,l_tab_list,l_rpt_exp,l_sub_sql1,l_sub_sql2,l_sub_sql3,l_sub_sql4,l_sub_sql5)
        INSERT INTO zax_file (zax01, zax02, zax03, zax04, zax05, zax06, zax07, zax08, zax09, zax10,
                              zax11, zax12, zax13, zax14, zax15, zax16, zax17, zax18, zax19, zax20,
                              zax21, zax22, zax23, zax24, zax25, zax26,
                              zax28, zax29, zax30, zax31, zax32, zax33, zax34, zax35, zax36, zax37, zax38, zax39) #FUN-880041  #FUN-8C0025 add zax34, zax35   #FUN-920131 add zax37,zax38  #FUN-910012 add zax36 #FUN970006 add zax39
        VALUES (certid, g_user, p_rpt_path, p_sql_zax, param1_zax, param2_zax, param3_zax, l_trans_lang, l_logo, l_tab_list, l_rpt_exp,
                l_sub_sql1, l_sub_sql2, l_sub_sql3, l_sub_sql4, l_sub_sql5, l_sub_sql6, l_sub_sql7, l_sub_sql8, l_sub_sql9, l_sub_sql10,
                l_sub_sql11, l_sub_sql12, l_sub_sql13, l_sub_sql14, l_sub_sql15,
                l_zax28, l_zax29, l_zax30, l_zax31, l_zax32, l_zax33, l_zax34, l_zax35, l_zax36, l_zaw.zaw14, l_zaw.zaw15, l_zax39) #FUN-880041  #FUN-8A0022 #FUN-8C0025 add l_zax34, l_zax35   #FUN-920131 add zaw14,zaw15  #FUN-910012 add zax36 #FUN970006 add l_zax39
        #No.TQC-870021 --end--
    ELSE
        INSERT INTO zax_file (zax01,zax02,zax03,zax04,zax05,zax06,zax07,zax08,zax09,zax10,zax11,
                              zax28, zax29, zax30, zax31, zax32, zax33, zax34, zax35, zax36, zax37, zax38, zax39) #FUN-880041  #FUN-8C0025 add zax34, zax35   #FUN-920131 add zax37,zax38  #FUN-910012 add zax36    #FUN970006 add zax39
        VALUES (certid,g_user,p_rpt_path,p_sql_zax,param1_zax,param2_zax,param3_zax,l_trans_lang,l_logo,l_tab_list,l_rpt_exp,
                l_zax28, l_zax29, l_zax30, l_zax31, l_zax32, l_zax33, l_zax34, l_zax35, l_zax36, l_zaw.zaw14, l_zaw.zaw15, l_zax39) #FUN-880041  #FUN-8C0025 add l_zax34, l_zax35   #FUN-920131 add zaw14,zaw15  #FUN-910012 add zax36  #FUN970006 add l_zax39
    END IF
    #No.FUN-770106 --end--
    #No.FUN-770002 --end--
 
    #INSERT INTO zax_file values(certid,g_user,p_rpt_path,p_sql_zax,param1_zax,param2_zax,param3_zax,l_trans_lang,l_logo,l_tab_list)  ###FUN-750092###
    DISPLAY "certid:",certid
    DISPLAY "p_rpt_path:",p_rpt_path
    DISPLAY "p_sql_zax:",p_sql_zax
    DISPLAY "param1_zax:",param1_zax
    DISPLAY "param2_zax:",param2_zax
    DISPLAY "param3_zax:",param3_zax
    DISPLAY "l_trans_lang:",l_trans_lang
    DISPLAY "l_logo:",l_logo
    DISPLAY "l_tab_list:",l_tab_list
    DISPLAY "l_rpt_exp:",l_rpt_exp          #No.FUN-770002
    #No.FUN-770106 --start--
    DISPLAY "l_sub_sql1:",l_sub_sql1
    DISPLAY "l_sub_sql2:",l_sub_sql2
    DISPLAY "l_sub_sql3:",l_sub_sql3
    DISPLAY "l_sub_sql4:",l_sub_sql4
    DISPLAY "l_sub_sql5:",l_sub_sql5
    #No.FUN-770106 --end--
    #No.TQC-870021 --start--
    DISPLAY "l_sub_sql6:",l_sub_sql6
    DISPLAY "l_sub_sql7:",l_sub_sql7
    DISPLAY "l_sub_sql8:",l_sub_sql8
    DISPLAY "l_sub_sql9:",l_sub_sql9
    DISPLAY "l_sub_sql10:",l_sub_sql10
    DISPLAY "l_sub_sql11:",l_sub_sql11
    DISPLAY "l_sub_sql12:",l_sub_sql12
    DISPLAY "l_sub_sql13:",l_sub_sql13
    DISPLAY "l_sub_sql14:",l_sub_sql14
    DISPLAY "l_sub_sql15:",l_sub_sql15
    #No.TQC-870021 --end--
    ### FUN-750092 END ###
    #FUN-880041 --start
    #IF g_bgjob = 'Y' THEN  #FUN-890056
       DISPLAY "l_zax28:",l_zax28
       DISPLAY "l_zax29:",l_zax29
       DISPLAY "l_zax30:",l_zax30
       DISPLAY "l_zax31:",l_zax31
       DISPLAY "l_zax32:",l_zax32
       DISPLAY "l_zax33:",l_zax33     #FUN-8A0022
       DISPLAY "l_zax34:",l_zax34     #FUN-8C0025
       DISPLAY "l_zax35:",l_zax35     #FUN-920131
       DISPLAY "l_zax36:",l_zax36     #FUN-910012
       DISPLAY "l_zax37:",l_zaw.zaw14 #FUN-920131
       DISPLAY "l_zax38:",l_zaw.zaw15 #FUN-920131
       DISPLAY "l_zax39:",l_zax39     #FUN-970006
    #END IF #FUN-890056
    #FUN-880041 --end
    DISPLAY cl_getmsg("lib-280",g_lang) CLIPPED,":",ls_para CLIPPED  #FUN-A30119
    
    IF SQLCA.sqlcode THEN
       CALL cl_err3("ins","zax_file",certid,"",SQLCA.sqlcode,"","",0)
       RETURN
    END IF
 
    CALL cl_get_cr_url(l_havedata)   ## FUN-910035 the source code put in safe structure ##  #TQC-940059 傳入參數l_havedata
 
END FUNCTION
 
##################################################
# Descriptions...: 把瀏覽器中的保留字轉換為代碼
# Date & Author..:
# Input Parameter: l_str
# Return code....:
##################################################
 
FUNCTION cl_prt_trans_str(l_str)       ###把瀏覽器中的保留字轉換為代碼###
   DEFINE       l_bufstr     BASE.StringBuffer,
                l_str        STRING
    LET l_bufstr = base.StringBuffer.create()
    IF NOT cl_null(l_str) THEN
       CALL l_bufstr.clear()
       CALL l_bufstr.append(l_str)
       CALL l_bufstr.replace("&","%26",0)
       CALL l_bufstr.replace("%","%25",0)
       CALL l_bufstr.replace("#","%23",0)
       CALL l_bufstr.replace("+","%2B",0)
       CALL l_bufstr.replace(" ","%20",0)
       CALL l_bufstr.replace("/","%2F",0)
       #CALL l_bufstr.replace(""","'",0)
    END IF
    LET l_str = l_bufstr.tostring()
    RETURN l_str
END FUNCTION
 
##################################################
# Descriptions...: 複雜報表 (使用temptable) 串接 CR接口
# Date & Author..:
# Input Parameter: p_prog,p_rep_template,p_sql,param_str
# Return code....:
##################################################
 
FUNCTION cl_prt_cs3(p_prog,p_rep_template,p_sql,param_str)
    DEFINE p_prog                 LIKE zaw_file.zaw01,
           p_rep_template         LIKE zaw_file.zaw02,
           p_rpt_name             LIKE zaw_file.zaw08,
           p_cust                 LIKE zaw_file.zaw03,
           p_rpt_path             LIKE zax_file.zax03,     ### FUN-750092 ###
           p_sql_zax              LIKE zax_file.zax04,     ### FUN-750092 ###
           param1_zax             LIKE zax_file.zax05,     ### FUN-750092 ###
           param2_zax             LIKE zax_file.zax06,     ### FUN-750092 ###
           param3_zax             LIKE zax_file.zax07,     ### FUN-750092 ###
           l_trans_lang           LIKE zax_file.zax08,     ### FUN-750092 ###
           l_logo                 LIKE zax_file.zax09,     ### FUN-750092 ###
           l_tab_list             LIKE zax_file.zax10,     ### FUN-750092 ###
           l_rpt_exp              LIKE zax_file.zax11,    #No.FUN-770002 #CrystalReport可用的匯出功能
           #l_rep_db               LIKE zax_file.zax03,    ### FUN-740008 ###
           #l_rep_db_pw            LIKE zax_file.zax04,    ### FUN-740008 ###
           #l_instance             LIKE zax_file.zax05,    ### FUN-740008 ###
           l_str_ord              STRING,                  ### FUN-740008 ###
           p_sql,l_url,l_str      STRING,
           param_str,ls_date      STRING,
           l_modul                LIKE zz_file.zz011,
           l_bufstr               BASE.StringBuffer,
           l_gaz03                LIKE gaz_file.gaz03,
           l_gaz06                LIKE gaz_file.gaz06,    #FUN-780036 add
           i,l_cnt_param,certid   LIKE type_file.num5,
           l_tok_param            base.StringTokenizer,
           #ls_gaz03,ls_company    STRING,                 #No.FUN-770106
           #ls_user,l_havedata     STRING,                 #No.FUN-770106
           l_havedata             STRING,                  #No.FUN-770106
           l_db_type              LIKE type_file.chr3,    ### FUN-750065 ###
           param_array            DYNAMIC ARRAY OF STRING
    #DEFINE l_str_bak,l_tab_list   STRING                  ### FUN-750065 ###
    DEFINE l_str_bak              STRING                  ### FUN-750092 ###
    DEFINE l_start                LIKE type_file.num10    ### FUN-750065 ###
    DEFINE l_end                  LIKE type_file.num10    ### FUN-750065 ###
    DEFINE l_tab                  STRING                  ### FUN-750065 ###
    DEFINE l_tok                  base.StringTokenizer    ### FUN-750065 ###
    DEFINE l_j                    LIKE type_file.num10    ### FUN-750065 ###
    DEFINE l_sub_sql1             LIKE zax_file.zax12     #No.FUN-770106
    DEFINE l_sub_sql2             LIKE zax_file.zax13     #No.FUN-770106
    DEFINE l_sub_sql3             LIKE zax_file.zax14     #No.FUN-770106
    DEFINE l_sub_sql4             LIKE zax_file.zax15     #No.FUN-770106
    DEFINE l_sub_sql5             LIKE zax_file.zax16     #No.FUN-770106
    DEFINE l_sql_tok              base.StringTokenizer    #No.FUN-770106
    DEFINE l_has_subreport        LIKE type_file.num5     #No.FUN-770106
    DEFINE l_sub_sql6             LIKE zax_file.zax17     #No.FUN-7A0003
    DEFINE l_sub_sql7             LIKE zax_file.zax18     #No.FUN-7A0003
    DEFINE l_sub_sql8             LIKE zax_file.zax19     #No.FUN-7A0003
    DEFINE l_sub_sql9             LIKE zax_file.zax20     #No.FUN-7A0003
    DEFINE l_sub_sql10            LIKE zax_file.zax21     #No.FUN-7A0003
    DEFINE l_sub_sql11            LIKE zax_file.zax22     #No.FUN-7A0003
    DEFINE l_sub_sql12            LIKE zax_file.zax23     #No.FUN-7A0003
    DEFINE l_sub_sql13            LIKE zax_file.zax24     #No.FUN-7A0003
    DEFINE l_sub_sql14            LIKE zax_file.zax25     #No.FUN-7A0003
    DEFINE l_sub_sql15            LIKE zax_file.zax26     #No.FUN-7A0003
    #No.FUN-880041 --start
    DEFINE l_mlj03                LIKE mlj_file.mlj03
    DEFINE l_mlj04                LIKE mlj_file.mlj04
    DEFINE l_mlj05                LIKE mlj_file.mlj05
    DEFINE l_mlj06                LIKE mlj_file.mlj06
    DEFINE l_mlj08                LIKE mlj_file.mlj08   #TQC-940031   
    DEFINE l_mlj09                LIKE mlj_file.mlj09   #FUN-8A0022
    DEFINE l_zax28                LIKE zax_file.zax28    
    DEFINE l_zax29                LIKE zax_file.zax29
    DEFINE l_zax30                LIKE zax_file.zax30
    DEFINE l_zax31                LIKE zax_file.zax31    
    DEFINE l_zax32                LIKE zax_file.zax32
    DEFINE l_zax33                LIKE zax_file.zax33   #FUN-8A0022
    DEFINE l_zax34                LIKE zax_file.zax34   #報表檔名        #FUN-8C0025
    DEFINE l_zax35                LIKE zax_file.zax35   #檔名重複時覆寫   #FUN-8C0025
    DEFINE l_zax36                LIKE zax_file.zax36   # Prog. Version..: '5.25.02-11.03.23(0:不列印簽核/ 1:頁尾/ 2:表尾)   #FUN-910012
    DEFINE l_cnt                  LIKE type_file.num5   #FUN-8A0022
    DEFINE ls_context             string
    DEFINE ls_para                string
    DEFINE li_i                   LIKE type_file.num5
    DEFINE l_ii                   LIKE type_file.num10                   #FUN-910012
    DEFINE l_key_v                STRING                #主鍵值，用"|"隔開  #FUN-910012
    DEFINE l_key_num              LIKE type_file.num10  #主鍵欄位數量       #FUN-910012
    #No.FUN-880041 --end
    DEFINE l_aza24                LIKE aza_file.aza24 #FUN-8A0037
    ###FUN-8C0025 START ###
    DEFINE l_zaw   RECORD             
           zaw04 LIKE zaw_file.zaw04,                   #權限類別
           zaw05 LIKE zaw_file.zaw05,                   #使用者   
           zaw14 LIKE zaw_file.zaw14,                   #紙張名稱           #FUN-920131
           zaw15 LIKE zaw_file.zaw15                    #紙張方向(縱向/橫向)  #FUN-920131 
           END RECORD
    DEFINE l_gcw         RECORD   LIKE gcw_file.*       #CR報表檔名設定
    DEFINE l_zx02                 LIKE zx_file.zx02     #使用者名稱
    DEFINE l_time                 LIKE type_file.chr8   #時間
    DEFINE l_item_name            STRING                #報表檔名全部選項，以"|"隔開
    DEFINE l_field       RECORD                         #NO.FUN-860089
              field001  LIKE gaq_file.gaq03     #No.FUN-680135 VARCHAR(255)
                         END RECORD
    ###FUN-960182 START ###
    DEFINE l_DByy                 STRING                #年
    DEFINE l_DByy_new             STRING                #年new
    DEFINE l_DByy_l               LIKE type_file.num5   #年的位置   
    DEFINE l_DByy_i               LIKE type_file.num5   #年幾碼
    DEFINE l_pdate                STRING                #日期(轉換過後的)
    ###FUN-960182 END ###
    DEFINE l_zax39                LIKE zax_file.zax39   #DBDATE環境變數     #FUN-970006
    DEFINE l_mailtpl              STRING                #CR mail樣板檔名,預設為"crmail_default.html"  #FUN-A30119
    DEFINE lc_azp02 LIKE azp_file.azp02 #FUN-A10041
    
    LET l_time=TIME
    ###FUN-8C0025 END ###
    
    #No.FUN-770106 --start--
    IF (g_pdate = 0 ) OR cl_null(g_pdate) THEN
       LET g_pdate = g_today
    END IF
    ###FUN-960182 START ###
    LET l_pdate = g_pdate
    LET l_db_type = cl_db_get_database_type() #資料庫型態
    #MSV的年4碼要轉2碼
    DISPLAY "g_pdate=",g_pdate
    IF l_db_type = "MSV" THEN        
       LET l_str = FGL_GETENV("DBDATE")       #MDY4/ ((Y4:年4碼,M:月,D:日,/:分隔符號)，年月日的順序可以改變)       
       LET l_DByy_l = l_str.getIndexOf("Y",1) #年的位置, l_DByy_l=3
       LET l_DByy_i = l_str.subString(l_DByy_l+1, l_DByy_l+1) #年幾碼         
            
       IF l_DByy_i = 4 THEN  #年4碼要轉2碼
          IF l_DByy_l > 1 THEN
             LET l_DByy_l = (l_DByy_l-1) * 3 + 1   #06/30/2009, l_DByy_l=7
          END IF      
          LET l_str = l_pdate CLIPPED
          LET l_DByy = l_str.subString(l_DByy_l, l_DByy_l+l_DByy_i-1)  #年:2009
          LET l_DByy_new = l_DByy.subString(3, 4)  #年:09
          CALL cl_replace_str(l_str, l_DByy, l_DByy_new) RETURNING l_pdate
       END IF
    END IF
    ###FUN-960182 END ###
    
    #主報表與各子報表SQL用 '|' 分隔, 主報表SQL為 p_sql_zax, 子報表SQL為 l_sub_sql1 - l_sub_sql5
    DISPLAY "p_sql:",p_sql
    LET l_sql_tok = base.StringTokenizer.createExt(p_sql,"|","",TRUE)
    LET l_has_subreport = FALSE
    IF l_sql_tok.hasMoreTokens() THEN
        LET p_sql_zax = l_sql_tok.nextToken() CLIPPED
    ELSE
        LET p_sql_zax = p_sql CLIPPED
    END IF
    LET p_sql_zax = cl_replace_str(p_sql_zax, "\"", "'")	#No.TQC-870021
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_has_subreport = TRUE
        LET l_sub_sql1 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql1 = cl_replace_str(l_sub_sql1, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql2 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql2 = cl_replace_str(l_sub_sql2, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql3 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql3 = cl_replace_str(l_sub_sql3, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql4 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql4 = cl_replace_str(l_sub_sql4, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql5 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql5 = cl_replace_str(l_sub_sql5, "\"", "'")	#No.TQC-870021
    END IF
    #No.FUN-7A0003 --start--
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql6 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql6 = cl_replace_str(l_sub_sql6, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql7 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql7 = cl_replace_str(l_sub_sql7, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql8 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql8 = cl_replace_str(l_sub_sql8, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql9 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql9 = cl_replace_str(l_sub_sql9, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql10 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql10 = cl_replace_str(l_sub_sql10, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql11 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql11 = cl_replace_str(l_sub_sql11, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql12 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql12 = cl_replace_str(l_sub_sql12, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql13 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql13 = cl_replace_str(l_sub_sql13, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql14 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql14 = cl_replace_str(l_sub_sql14, "\"", "'")	#No.TQC-870021
    END IF
    IF l_sql_tok.hasMoreTokens() THEN
        LET l_sub_sql15 = l_sql_tok.nextToken() CLIPPED
        LET l_sub_sql15 = cl_replace_str(l_sub_sql15, "\"", "'")	#No.TQC-870021
    END IF
    #No.FUN-7A0003 --end--
    DISPLAY "sub:"||l_has_subreport
    #No.FUN-770106 --end--
 
    # 背景作業
    #IF g_gui_type =0 THEN RETURN 1 END IF   
    LET g_report = 'ds_report'
    ### 先判斷有無資料或其他問題,再串到CR ###
    #EXECUTE IMMEDIATE p_sql    #No.FUN-770106
    EXECUTE IMMEDIATE p_sql_zax #No.FUN-770106
    #display "SQLCA.sqlcode:",SQLCA.sqlcode
    #display "SQLCA.sqlerrd[3]:",SQLCA.sqlerrd[3]
 
    #No.FUN-860089 -- start --
    IF SQLCA.sqlcode=100 THEN
       LET l_havedata='N'
    ELSE
       DECLARE sql_cur2 CURSOR FROM p_sql_zax
       IF SQLCA.SQLCODE THEN
          IF g_bgjob = 'Y' THEN       	
             CALL s_errmsg('','','DECLARE sql_cur2:',SQLCA.SQLCODE,1)                                                                     
          ELSE                                                                                                                          
             CALL cl_err('DECLARE sql_cur2',SQLCA.SQLCODE,1)
             RETURN
          END IF       
       END IF
       FOREACH sql_cur2 INTO l_field.*
          EXIT FOREACH
       END FOREACH
       IF SQLCA.SQLCODE THEN
          IF g_bgjob = 'Y' THEN       	
             CALL s_errmsg('','','DECLARE sql_cur2:',SQLCA.SQLCODE,1)                                                                     
          ELSE                                                                                                                          
             CALL cl_err('DECLARE sql_cur2',SQLCA.SQLCODE,1)
             RETURN
          END IF       
          RETURN 
       END IF
       CLOSE sql_cur2
       LET l_havedata='Y'
    END IF
    #FUN-880041 --start
 
    IF l_havedata='N' THEN       
       IF g_bgjob = 'Y' THEN       	
          CALL s_errmsg('','','!','lib-216',1)                                                                     
       ELSE                                                                                                                          
          CALL cl_err('!','lib-216',1)
          RETURN
       END IF
       
    END IF    
    #IF l_havedata='N' THEN
    #   IF g_bgerr THEN
    #      CALL s_errmsg('','','!','lib-216',1)
    #   ELSE
    #      CALL cl_err('!','lib-216',1)
    #   END IF
    #   RETURN
    #END IF
    #FUN-880041 --end

    #No.FUN-A60063 --start--
    CALL cl_get_zvcr()
    IF NOT cl_prt_chkzv() THEN
    #No.FUN-A60063 --end--
        IF NOT cl_prt_cs_preview(p_prog,p_sql_zax) THEN
            RETURN
        END IF
    END IF  #No.FUN-A60063
    #No.FUN-860089 -- end --
 
    ### FUN-750065 start ###
     #LET l_db_type=cl_db_get_database_type()   #FUN-960182 mark
     #No.FUN-770106 --start--
#     LET l_str=p_sql
#     LET l_str_bak = l_str.toLowerCase()
#     LET l_start = l_str_bak.getIndexOf('from',1)
#     LET l_end   = l_str_bak.getIndexOf('where',1)
#     IF l_end=0 THEN
#        LET l_end   = l_str_bak.getIndexOf('group',1)
#        IF l_end=0 THEN
#           LET l_end   = l_str_bak.getIndexOf('order',1)
#           IF l_end=0 THEN
#              LET l_end=l_str.getLength()
#              LET l_str=l_str.subString(l_start+5,l_end)
#           ELSE
#              LET l_str=l_str.subString(l_start+5,l_end-2)
#           END IF
#        ELSE
#           LET l_str=l_str.subString(l_start+5,l_end-2)
#        END IF
#     ELSE
#        LET l_str=l_str.subString(l_start+5,l_end-2)
#     END IF
#     LET l_str=l_str.trim()
#     LET l_tok = base.StringTokenizer.createExt(l_str CLIPPED,",","",TRUE)
#     LET l_j=1
#     WHILE l_tok.hasMoreTokens()
#           LET l_tab=l_tok.nextToken()
#           LET l_tab=l_tab.trim()
#          IF l_tab.getIndexOf(' ',1) THEN
#             LET l_tab=l_tab.subString(1,l_tab.getIndexOf(' ',1)-1)
#          END IF
#          CASE l_db_type
#           WHEN "IFX"
#             LET l_tab=l_tab.subString(l_tab.getIndexOf(':',1)+1,l_tab.getLength())
#           WHEN "ORA"
#             LET l_tab=l_tab.subString(l_tab.getIndexOf('.',1)+1,l_tab.getLength())
#           WHEN "MSV"
#          END CASE
#          IF l_j=1 THEN
#             LET l_tab_list = l_tab CLIPPED
#             LET l_j=l_j+1
#          ELSE
#             LET l_tab_list = l_tab_list CLIPPED,"|",l_tab CLIPPED
#          END IF
#          # IF l_tab.getIndexOf(' ',1) THEN
#          #    LET l_tab=l_tab.subString(1,l_tab.getIndexOf(' ',1)-1)
#          #    LET l_tab=l_tab.subString(l_tab.getIndexOf('.',1)+1,l_tab.getLength())
#          #    IF l_j=1 THEN
#          #       LET l_tab_list = l_tab CLIPPED
#          #       LET l_j=l_j+1
#          #    ELSE
#          #       LET l_tab_list = l_tab_list CLIPPED,"|",l_tab CLIPPED
#          #    END IF
#          # END IF
#     END WHILE
#     #display "table:",l_tab_list
#    ### FUN-750065 end ###
 
    LET l_tab_list = cl_prt_get_tblname(p_sql_zax) CLIPPED
    IF l_has_subreport THEN
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql1) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql2) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql3) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql4) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql5) CLIPPED
        #No.FUN-7A0003 --start--
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql6) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql7) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql8) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql9) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql10) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql11) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql12) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql13) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql14) CLIPPED
        LET l_tab_list = l_tab_list CLIPPED,"|",cl_prt_get_tblname(l_sub_sql15) CLIPPED
        #No.FUN-7A0003 --end--
    END IF
    #No.FUN-770106 --end--

    #No.FUN-A60063 --start--
    IF cl_prt_chkzv() THEN
        #No.FUN-B30131 --start--
        CALL cl_prt_zv_get_page_size(p_prog, g_zv_cr.zv06)
        RETURNING p_cust,l_zaw.zaw04,l_zaw.zaw05,p_rpt_name,l_zax36,l_zaw.zaw14,l_zaw.zaw15
        #CALL cl_prt_cs3_t(p_prog, g_zv_cr.zv06)
        #    RETURNING p_cust, l_zaw.zaw04, l_zaw.zaw05, p_rpt_name, l_zax36,
        #              l_zaw.zaw14, l_zaw.zaw15
        LET g_zaw14 = l_zaw.zaw14
        #No.FUN-B30131 --end--
    ELSE
    #No.FUN-A60063 --end--
        #CALL cl_prt_cs3_t(p_prog,p_rep_template) RETURNING p_cust,p_rpt_name   #FUN-8C0025 mark
        CALL cl_prt_cs3_t(p_prog,p_rep_template) RETURNING p_cust,l_zaw.zaw04,l_zaw.zaw05,p_rpt_name,l_zax36,l_zaw.zaw14,l_zaw.zaw15   #FUN-8C0025   #FUN-920131 add zaw14,zaw15  #FUN-910012 加l_zax36
    END IF  #No.FUN-A60063
    
    #LET p_rpt_name="axmr213"
    #LET p_rpt_path="tiptop/axm/axmr213/0/",p_rpt_name
    SELECT zz011 INTO l_modul FROM zz_file where zz01 = g_prog
    IF p_cust = 'Y' THEN
       LET p_rpt_path="topcust/",DOWNSHIFT(l_modul) CLIPPED,"/",p_prog CLIPPED,"/",g_rlang CLIPPED,"/",p_rpt_name CLIPPED,".rpt"
    ELSE
       LET p_rpt_path="tiptop/",DOWNSHIFT(l_modul) CLIPPED,"/",p_prog CLIPPED,"/",g_rlang CLIPPED,"/",p_rpt_name CLIPPED,".rpt"
    END IF
 
    ### param1-param10###
    #LET l_tok_param = base.StringTokenizer.create(param_str,";")
    LET l_tok_param = base.StringTokenizer.createExt(param_str,";","",TRUE)
    LET l_cnt_param = l_tok_param.countTokens()
    IF l_cnt_param>0 THEN
       CALL param_array.clear()
       LET i=0
       WHILE l_tok_param.hasMoreTokens()
          LET i=i+1
          #LET param_array[i] =cl_prt_trans_str(l_tok_param.nextToken()) # FUN-750092 #
          LET param_array[i] =l_tok_param.nextToken() # FUN-750092 #
       END WHILE
    END IF
 
    #LET p_sql_zax = p_sql CLIPPED    ### FUN-750092 ###    #No.FUN-770106
   #str FUN-780036 mod
   #SELECT gaz03 INTO l_gaz03 FROM gaz_file WHERE gaz01=g_prog AND gaz02=g_rlang
   #報表名稱抓法改為先抓gaz06,若gaz06沒值,再抓gaz03
    SELECT gaz03,gaz06 INTO l_gaz03,l_gaz06 FROM gaz_file
     WHERE gaz01=g_prog AND gaz02=g_rlang
    IF cl_null(l_gaz06) THEN
       LET l_gaz06 = l_gaz03 CLIPPED
    END IF
   #end FUN-780036 mod
 
    ### Get certificate_ID ###
    #LET certid = util.Math.rand(99999)   #No.MOD-810198
    LET certid = FGL_GETPID()             #No.MOD-810198
    ### FUN-740008 START ###
    #LET l_rep_db = g_report CLIPPED
    #LET l_str = "dbi.database.", g_report CLIPPED, ".password"
    #LET l_rep_db_pw = fgl_getresource(l_str) CLIPPED
    #LET l_instance = fgl_getenv('ORACLE_SID') CLIPPED
    #INSERT INTO zax_file values(certid,g_user,l_rep_db,l_rep_db_pw,l_instance)
    #INSERT INTO zax_file values(certid,g_user) ### FUN-750092 ###
    ### FUN-740008 END ###
 
    ### FUN-750092 START ###
    LET param2_zax = param_array[1] CLIPPED,"|",param_array[2] CLIPPED,"|",
                     param_array[3] CLIPPED,"|",param_array[4] CLIPPED,"|",
                     param_array[5] CLIPPED,"|",param_array[6] CLIPPED,"|",
                     param_array[7] CLIPPED,"|",param_array[8] CLIPPED,"|",
                     param_array[9] CLIPPED,"|",param_array[10] CLIPPED
 
    LET param3_zax = param_array[11] CLIPPED,"|",param_array[12] CLIPPED,"|",
                     param_array[13] CLIPPED,"|",param_array[14] CLIPPED,"|",
                     param_array[15] CLIPPED,"|",param_array[16] CLIPPED,"|",
                     param_array[17] CLIPPED,"|",param_array[18] CLIPPED,"|",
                     param_array[19] CLIPPED,"|",param_array[20] CLIPPED
   #LET param1_zax =g_company CLIPPED,"|",l_gaz03 CLIPPED,"|",g_pdate,"|",TIME,"|",g_user,"|",g_prog    #FUN-780036 mark
   #LET param1_zax =g_company CLIPPED,"|",l_gaz06 CLIPPED,"|",g_pdate,"|",TIME,"|",g_user,"|",g_prog    #FUN-780036 #FUN-8C0025 mark
    SELECT zx02 INTO l_zx02 FROM zx_file WHERE zx01 = g_user   #使用者名稱   #MOD-940295
    #LET param1_zax =g_company CLIPPED,"|",l_gaz06 CLIPPED,"|",g_pdate,"|",l_time,"|",g_user,"|",g_prog,"|",l_zx02  #FUN-8C0025 #MOD-940295 加l_zx02   #FUN-960182 mark

    SELECT azp02 INTO lc_azp02 FROM azp_file WHERE azp01 = g_plant #FUN-A10041
    LET param1_zax =g_company CLIPPED,"[",g_plant CLIPPED,":",lc_azp02 CLIPPED,"]|",l_gaz06 CLIPPED,"|",l_pdate,"|",l_time,"|",g_user,"|",g_prog,"|",l_zx02  #FUN-960182
    LET l_trans_lang = cl_prt_cr_trans_lang()
    #LET l_logo = FGL_GETENV("FGLASIP") || "/tiptop/pic/pdf_logo_",g_dbs CLIPPED,g_rlang,".jpg"  ### FUN-750016 ### #No.FUN-970006 marked
    LET l_logo = FGL_GETENV("CRIP") || "images/pdf_logo_",g_dbs CLIPPED,g_rlang,".jpg"  #No.FUN-970006 add
    #== FUN-8A0037 START ==#
    #依照aoos010的設定報表輸出Logo位置，zax09一併紀錄aza24(用|隔開)
    select aza24 into l_aza24 from aza_file
    IF SQLCA.sqlcode THEN
        CALL cl_err3("sel","aza_file",l_aza24,"",SQLCA.sqlcode,"","",0)
        RETURN
    ELSE
        LET l_logo = l_logo CLIPPED, "|", l_aza24 CLIPPED
    END IF
    #== FUN-8A0037 END ==#
   
    #FUN-880041 --start 記錄發信 message
    #SELECT mlj03,mlj04,mlj05,mlj06,mlj08,mlj09 INTO l_mlj03,l_mlj04,l_mlj05,l_mlj06,l_mlj08,l_mlj09 #FUN-8A0022   #FUN-940099 mark
    #  FROM mlj_file where mlj01='CR'   #FUN-940099 mark
    CALL cl_prt_cs3_aooi999(p_prog) RETURNING l_mlj03,l_mlj04,l_mlj05,l_mlj06,l_mlj08,l_mlj09,l_zax33   #查aooi999的資訊 #FUN-940099
      
    LET l_zax28 = l_mlj03 CLIPPED,"|",l_mlj04 CLIPPED,"|",
                  l_mlj05 CLIPPED,"|",l_mlj06 CLIPPED,"|",l_mlj08 CLIPPED   #TQC-940031
                  
    #FUN-890056 --start
    IF g_bgjob = 'Y' AND g_prtway = 'A' THEN             
       LET l_zax29 = FGL_GETENV("MAIL_TO")
       LET l_zax30 = FGL_GETENV("MAIL_CC")
       LET l_zax31 = FGL_GETENV("MAIL_BCC")
    ELSE
    	 CALL cl_maillist()
    	 LET l_zax29 = g_receiver CLIPPED
    	 LET l_zax30 = g_cc CLIPPED
    	 LET l_zax31 = g_bcc CLIPPED
    END IF
    #FUN-890056 --end
    IF cl_null(g_xml.subject) THEN   #信件主旨   #FUN-A30119
       LET l_zax32 = cl_getmsg("lib-227",g_lang) CLIPPED," : ", l_gaz03 CLIPPED, "\(", g_prog CLIPPED, "\)",  #TQC-740155
                     cl_getmsg("lib-228",g_lang) CLIPPED,"  : ", g_company CLIPPED,
                     cl_getmsg("lib-229",g_lang) CLIPPED,"  : ", l_zx02 CLIPPED, "\(", g_user CLIPPED, "\)",   #MOD-940295 加l_zx02
                     cl_getmsg("lib-230",g_lang) CLIPPED,"  : ", g_today 
    ELSE                             #FUN-A30119
       LET l_zax32 = g_xml.subject   #FUN-A30119
    END IF                           #FUN-A30119  
 
    FOR li_i = 1 TO NUM_ARGS()
         LET ls_para = ls_para, " '", ARG_VAL(li_i), "'"
    END FOR                        
    
    #LET ls_context = cl_getmsg("lib-282",g_lang) CLIPPED,"|", cl_getmsg("lib-227",g_lang) CLIPPED,"|", cl_getmsg("lib-229",g_lang) CLIPPED,"|", cl_get_progname(g_prog,g_lang) CLIPPED,"|",    #FUN-A30119 mark
    #                 cl_getmsg("lib-279",g_lang) CLIPPED,"|",TODAY CLIPPED," ",TIME ,"|",cl_getmsg("lib-280",g_lang) CLIPPED,"|",ls_para CLIPPED,"|",cl_getmsg("lib-281",g_lang) CLIPPED,"|",  #FUN-A30119 mark
    #                 cl_getmsg("lib-216",g_lang) CLIPPED,"|",cl_getmsg("lib-284",g_lang) CLIPPED,"|",FGL_GETENV("CRIP") CLIPPED    #FUN-A30119 mark
    ###FUN-A30119 START ###
    IF cl_null(g_xml.file) THEN
       LET l_mailtpl = "crmail_default.html"
    ELSE
       LET l_mailtpl = g_xml.file CLIPPED
    END IF
    LET ls_context = cl_getmsg("lib-282",g_lang) CLIPPED,"|", cl_getmsg("lib-227",g_lang) CLIPPED,"|", cl_getmsg("lib-229",g_lang) CLIPPED,"|", cl_get_progname(g_prog,g_lang) CLIPPED,"(",g_prog,")", "|",
                     cl_getmsg("lib-279",g_lang) CLIPPED,"|",TODAY CLIPPED," ",TIME ,"|",l_mailtpl CLIPPED,"||",cl_getmsg("lib-281",g_lang) CLIPPED,"|"
    
    IF l_havedata = "Y" THEN
       LET ls_context = ls_context CLIPPED, cl_getmsg("lib-284",g_lang) CLIPPED, "|"
    ELSE
       LET ls_context = ls_context CLIPPED, cl_getmsg("lib-216",g_lang) CLIPPED, "|"
    END IF
    DISPLAY "ls_context=",ls_context
    LET ls_context = ls_context CLIPPED, l_zx02 CLIPPED,"(",g_user CLIPPED,")", "|", FGL_GETENV("CRIP") CLIPPED
    ###FUN-A30119 END ###
    
    LET l_zax32 = l_zax32 CLIPPED ,"|",ls_context
    LET l_zax32 = l_zax32 CLIPPED ,"|",l_havedata
    
    ###FUN-A30119 START ###
    LET l_zax32 = l_zax32 CLIPPED ,"||||||"  #前20個參數是TIPTOP內定的
    IF NOT cl_null(g_xml.body) THEN          #zax32在第20個參數之後的可以自訂,都用"|"隔開
       LET l_zax32 = l_zax32 CLIPPED ,"|",g_xml.body
    END IF
    ###FUN-A30119 END ###
    ###FUN-940099 mark START ###
    ##FUN-8A0022 start
    #SELECT COUNT(*) INTO l_cnt FROM mlj_file WHERE mlj01=g_prog
    #
    #IF l_cnt >0 THEN #程式代號為優先
    #	 SELECT COUNT(*) INTO l_cnt FROM mlj_file WHERE mlj01=g_prog AND mlj09='N'
    #	 IF l_cnt > 0 THEN
    #	 	  LET l_mlj09 = "N"
    #	 ELSE
    #		  LET l_mlj09 = "Y"
    #	 END IF
    #END IF
    #    
    #IF l_mlj09 = "N" THEN
    #	 select zx09 INTO l_zax33 from zx_file  where zx01 = g_user
    #   LET l_zax33 = l_zax33 CLIPPED
    #
    #   IF cl_null(l_zax33) THEN
    #	    LET l_zax33 = ""
    #   END IF 
    #END IF
    ##FUN-8A0022 end
    ###FUN-940099 mark END ###
    #FUN-880041 --end
 
    #No.FUN-770002 --start--
    SELECT zy06 INTO l_rpt_exp FROM zy_file WHERE zy01=g_clas AND zy02=g_prog
    ##coco##
    #No.FUN-770106 --start--
    #INSERT INTO zax_file values(certid,g_user,p_rpt_path,p_sql_zax,param1_zax,param2_zax,param3_zax,l_trans_lang,l_logo,l_tab_list,l_rpt_exp)  ###FUN-750092###
    ###FUN-8C0025 START ###
    LET l_zax34=""  #報表檔名    
    SELECT * INTO l_gcw.* FROM gcw_file
       WHERE gcw01=p_prog AND gcw02=p_rep_template AND gcw03=l_zaw.zaw04 AND gcw04=l_zaw.zaw05
 
    IF (NOT cl_null(l_gcw.gcw05)) OR (NOT cl_null(l_gcw.gcw06)) OR (NOT cl_null(l_gcw.gcw07)) OR (NOT cl_null(l_gcw.gcw08)) OR (NOT cl_null(l_gcw.gcw09)) OR (NOT cl_null(l_gcw.gcw10)) THEN    
       #SELECT zx02 INTO l_zx02 FROM zx_file WHERE zx01 = g_user   #使用者名稱   #MOD-940295改在前面先撈資料
       
       #程式代號|程式名稱|營運中心編號|營運中心名稱|使用者代號|使用者名稱|日期|時間|p1|p2|......|p20
       LET l_item_name = p_prog CLIPPED,"|",l_gaz06 CLIPPED,"|",g_plant CLIPPED,"|",g_dbs CLIPPED,"|",g_user CLIPPED,"|",l_zx02 CLIPPED,"|",g_pdate CLIPPED,"|",l_time CLIPPED
       FOR li_i = 1 TO 20   #p1~p20
          LET l_item_name = l_item_name,"|",param_array[li_i] CLIPPED
       END FOR 
       
       CALL cl_prt_filename(l_item_name,l_gcw.gcw05) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw06) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw07) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw08) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw09) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       CALL cl_prt_filename(l_item_name,l_gcw.gcw10) RETURNING l_str  #CR報表檔名設定
       LET l_zax34 = l_zax34 CLIPPED,l_str CLIPPED
       #刪除最後一個分隔符號       
       LET l_str = l_zax34 CLIPPED
       LET l_str = l_str.substring(1,l_str.getLength()-1) CLIPPED    
       LET l_zax34 = l_str CLIPPED    
    END IF
 
    #檔名重複是否覆寫
    IF cl_null(l_gcw.gcw11) THEN 
       LET l_zax35 = "Y" 
    ELSE
       LET l_zax35 = l_gcw.gcw11
    END IF
    LET l_zax39 = FGL_GETENV("DBDATE")  #No.FUN-970006
    ###FUN-8C0025 END ###
    DELETE FROM zax_file WHERE zax01=certid  #No.CHI-830031
 
    #FUN-850105 by Hiko : zax_file增加zax27欄位,資料為g_prt_timeout.
    IF l_has_subreport THEN
        #No.FUN-7A0003 --start--
        #INSERT INTO zax_file (zax01,zax02,zax03,zax04,zax05,zax06,zax07,zax08,zax09,zax10,zax11,zax12,zax13,zax14,zax15,zax16)
        #VALUES (certid,g_user,p_rpt_path,p_sql_zax,param1_zax,param2_zax,param3_zax,l_trans_lang,l_logo,l_tab_list,l_rpt_exp,l_sub_sql1,l_sub_sql2,l_sub_sql3,l_sub_sql4,l_sub_sql5)
        INSERT INTO zax_file (zax01, zax02, zax03, zax04, zax05, zax06, zax07, zax08, zax09, zax10,
                              zax11, zax12, zax13, zax14, zax15, zax16, zax17, zax18, zax19, zax20,
                              zax21, zax22, zax23, zax24, zax25, zax26, zax27,
                              zax28, zax29, zax30, zax31, zax32, zax33, zax34, zax35, zax36, zax37, zax38, zax39) #FUN-880041 #FUN-8C0025 add zax34, zax35   #FUN-920131 add zax37,zax38 #FUN-910012 add zax36 #FUN-970006 add zax39
        VALUES (certid, g_user, p_rpt_path, p_sql_zax, param1_zax, param2_zax, param3_zax, l_trans_lang, l_logo, l_tab_list, l_rpt_exp,
                l_sub_sql1, l_sub_sql2, l_sub_sql3, l_sub_sql4, l_sub_sql5, l_sub_sql6, l_sub_sql7, l_sub_sql8, l_sub_sql9, l_sub_sql10,
                l_sub_sql11, l_sub_sql12, l_sub_sql13, l_sub_sql14, l_sub_sql15, g_prt_timeout,
                l_zax28, l_zax29, l_zax30, l_zax31, l_zax32, l_zax33, l_zax34, l_zax35, l_zax36, l_zaw.zaw14, l_zaw.zaw15, l_zax39) #FUN-880041 #FUN-8C0025 add l_zax34, l_zax35   #FUN-920131 add zaw14,zaw15 #FUN-910012 add zax36 #FUN-970006 add l_zax39
        #No.FUN-7A0003 --end--
    ELSE
        INSERT INTO zax_file (zax01,zax02,zax03,zax04,zax05,zax06,zax07,zax08,zax09,zax10,zax11,zax27,
                              zax28, zax29, zax30, zax31, zax32, zax33, zax34, zax35, zax36, zax37, zax38, zax39) #FUN-880041 #FUN-8C0025 add zax34, zax35   #FUN-920131 add zax37,zax38 #FUN-910012 add zax36 #FUN-970006 add zax39
        VALUES (certid,g_user,p_rpt_path,p_sql_zax,param1_zax,param2_zax,param3_zax,l_trans_lang,l_logo,l_tab_list,l_rpt_exp,g_prt_timeout,
                l_zax28, l_zax29, l_zax30, l_zax31, l_zax32, l_zax33, l_zax34, l_zax35, l_zax36, l_zaw.zaw14, l_zaw.zaw15, l_zax39)#FUN-880041 #FUN-8C0025 add l_zax34, l_zax35   #FUN-920131 add zaw14,zaw15 #FUN-910012 add zax36 #FUN-970006 add l_zax39
    END IF
    #No.FUN-770106 --end--
    #No.FUN-770002 --end--
 
    #INSERT INTO zax_file values(certid,g_user,p_rpt_path,p_sql_zax,param1_zax,param2_zax,param3_zax,l_trans_lang,l_logo,l_tab_list)  ###FUN-750092###
    DISPLAY "certid:",certid
    DISPLAY "p_rpt_path:",p_rpt_path
    DISPLAY "p_sql_zax:",p_sql_zax
    DISPLAY "param1_zax:",param1_zax
    DISPLAY "param2_zax:",param2_zax
    DISPLAY "param3_zax:",param3_zax
    DISPLAY "l_trans_lang:",l_trans_lang
    DISPLAY "l_logo:",l_logo
    DISPLAY "l_tab_list:",l_tab_list
    DISPLAY "l_rpt_exp:",l_rpt_exp          #No.FUN-770002
    #No.FUN-770106 --start--
    DISPLAY "l_sub_sql1:",l_sub_sql1
    DISPLAY "l_sub_sql2:",l_sub_sql2
    DISPLAY "l_sub_sql3:",l_sub_sql3
    DISPLAY "l_sub_sql4:",l_sub_sql4
    DISPLAY "l_sub_sql5:",l_sub_sql5
    #No.FUN-770106 --end--
    DISPLAY "l_sub_sql6:",l_sub_sql6
    DISPLAY "l_sub_sql7:",l_sub_sql7
    DISPLAY "l_sub_sql8:",l_sub_sql8
    DISPLAY "l_sub_sql9:",l_sub_sql9
    DISPLAY "l_sub_sql10:",l_sub_sql10
    DISPLAY "l_sub_sql11:",l_sub_sql11
    DISPLAY "l_sub_sql12:",l_sub_sql12
    DISPLAY "l_sub_sql13:",l_sub_sql13
    DISPLAY "l_sub_sql14:",l_sub_sql14
    DISPLAY "l_sub_sql15:",l_sub_sql15
    #No.FUN-7A0003 --start--
    #No.FUN-7A0003 --end--
    ### FUN-750092 END ###
    #FUN-880041 --start
    #IF g_bgjob = 'Y' THEN  #FUN-890056
       DISPLAY "l_zax28:",l_zax28
       DISPLAY "l_zax29:",l_zax29
       DISPLAY "l_zax30:",l_zax30
       DISPLAY "l_zax31:",l_zax31
       DISPLAY "l_zax32:",l_zax32 
       DISPLAY "l_zax33:",l_zax33     #FUN-8A0022
       DISPLAY "l_zax34:",l_zax34     #FUN-8C0025
       DISPLAY "l_zax35:",l_zax35     #FUN-920131
       DISPLAY "l_zax36:",l_zax36     #FUN-910012
       DISPLAY "l_zax37:",l_zaw.zaw14 #FUN-920131
       DISPLAY "l_zax38:",l_zaw.zaw15 #FUN-920131
       DISPLAY "l_zax39:",l_zax39     #FUN-970006
    #END IF #FUN-890056
    #FUN-880041 --end
    DISPLAY cl_getmsg("lib-280",g_lang) CLIPPED,":",ls_para CLIPPED  #FUN-A30119
    
    IF SQLCA.sqlcode THEN
        CALL cl_err3("ins","zax_file",certid,"",SQLCA.sqlcode,"","",0)
        RETURN
    END IF
 
    ###FUN-910012 START ### 
    #更新temp table的簽核圖檔
    IF (l_zax36 <> "0") AND (NOT cl_null(g_cr_apr_key_f)) THEN
       #單據數量，用於顯示作業處理進度
       LET l_cnt = 0
       FOR l_ii = 1 TO g_cr_apr_key.getlength()
          LET l_cnt = l_cnt + 1
       END FOR
 
       IF l_cnt > 0 THEN              
          IF cl_null(l_zax29) AND cl_null(l_zax30) AND cl_null(l_zax31) THEN #非背景作業的mail
             #背景作業關掉預設的screen視窗
             IF (g_bgjob = "Y") THEN   
                CLOSE WINDOW screen 
             END IF
             CALL cl_progress_bar(l_cnt)   #顯示作業處理進度
          END IF
 
          #主鍵欄位數量
          LET l_key_num = 0
          LET l_str = ""
          LET l_tok = base.StringTokenizer.createExt(g_cr_apr_key_f CLIPPED,"|","",TRUE)	#指定分隔符號
          WHILE l_tok.hasMoreTokens()	#依序取得子字串
             LET l_str = l_tok.nextToken()
             LET l_key_num = l_key_num + 1
          END WHILE 
           
          LET l_key_v = NULL
          FOR l_ii = 1 TO l_cnt
             CASE l_key_num
                WHEN 1
                   LET l_key_v = g_cr_apr_key[l_ii].v1 CLIPPED
                WHEN 2
                   LET l_key_v = g_cr_apr_key[l_ii].v1 CLIPPED,"|",g_cr_apr_key[l_ii].v2 CLIPPED
                WHEN 3
                   LET l_key_v = g_cr_apr_key[l_ii].v1 CLIPPED,"|",g_cr_apr_key[l_ii].v2 CLIPPED,"|",g_cr_apr_key[l_ii].v3 CLIPPED
                WHEN 4
                   LET l_key_v = g_cr_apr_key[l_ii].v1 CLIPPED,"|",g_cr_apr_key[l_ii].v2 CLIPPED,"|",g_cr_apr_key[l_ii].v3 CLIPPED,"|",g_cr_apr_key[l_ii].v4 CLIPPED
                WHEN 5
                   LET l_key_v = g_cr_apr_key[l_ii].v1 CLIPPED,"|",g_cr_apr_key[l_ii].v2 CLIPPED,"|",g_cr_apr_key[l_ii].v3 CLIPPED,"|",g_cr_apr_key[l_ii].v4 CLIPPED,"|",g_cr_apr_key[l_ii].v5 CLIPPED
             END CASE   
             
             IF cl_null(l_zax29) AND cl_null(l_zax30) AND cl_null(l_zax31) THEN #非背景作業的mail          
                CALL cl_progressing(l_key_v)   #顯示作業處理進度
             END IF
             CALL cl_prt_apr_img(l_ii, g_cr_gcx01, g_cr_apr_key[l_ii].v1, g_cr_table, g_cr_apr_key_f, l_key_v, 0, 0)   #報表簽核
          END FOR
       END IF
    END IF
    ###FUN-910012 END ###
   
    #--FUN-930132--start--
    IF FGL_GETENV("CRTYPE") = "XML" THEN
       CALL cl_report_xml(p_prog,g_temptable)
    ELSE
       CALL cl_get_cr_url(l_havedata)   ## FUN-910035 the source code put in safe structure ##  #TQC-940059 傳入參數l_havedata
    END IF
    #--FUN-930132--end--
END FUNCTION
 
##################################################
# Descriptions...: 把字串轉為ASCII CODE
# Date & Author..: 2008/02/18 By CoCo
# Input Parameter: l_str
# Return code....: l_str
##################################################
 
FUNCTION cl_prt_trans_ascii(l_str)  ### FUN-810068 ADD ###
DEFINE   l_str,l_str_ord     STRING,
         l_str_ascii         STRING,
         i                   LIKE type_file.num5   #SMALLINT    #FUN-910012
   LET l_str_ascii="" 
   FOR i=1 TO l_str.getLength()
      LET l_str_ord = ORD(l_str.subString(i,i))
      IF i=1 THEN
         LET l_str_ascii = l_str_ord.trim()
      ELSE
         LET l_str_ascii = l_str_ascii.trim() ,'|',l_str_ord.trim()
      END IF
   END FOR
   RETURN l_str_ascii
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_prog,p_rep_template
# Return code....:
##################################################
 
FUNCTION cl_prt_cs3_t(p_prog,p_rep_template)
DEFINE p_prog                     LIKE zaw_file.zaw01,
       p_rep_template             LIKE zaw_file.zaw02,
       l_zaw03                    LIKE zaw_file.zaw03,
       p_zaw08                    LIKE zaw_file.zaw08,
       l_sql,l_str                STRING,
       l_cust                     LIKE type_file.num5,
       l_gay03                    LIKE gay_file.gay03
DEFINE l_zaw10                    LIKE zaw_file.zaw10   #No.TQC-7B0135
DEFINE l_db_type                  LIKE type_file.chr3   ## FUN-810068 ##
#No.FUN-7C0078 --start--
DEFINE l_i                        LIKE type_file.num10 
DEFINE l_rec   ARRAY[1] OF RECORD
       l_zaw08 LIKE zaw_file.zaw08
       END RECORD
#No.FUN-7C0078 --end--
DEFINE ls_sql                     STRING                #No.FUN-850105
###FUN-8C0025 START ###
DEFINE l_zaw   RECORD   
       zaw01 LIKE zaw_file.zaw01,       #程‘N號           #TQC-930143
       zaw02 LIKE zaw_file.zaw02,       #樣板代號           #TQC-930143
       zaw03 LIKE zaw_file.zaw03,       #客製否             #TQC-930143          
       zaw04 LIKE zaw_file.zaw04,       #權限類別
       zaw05 LIKE zaw_file.zaw05,       #使用者  
       zaw06 LIKE zaw_file.zaw06,       #語言別             #TQC-930143
       zaw07 LIKE zaw_file.zaw07,       #序號              #TQC-930143
       zaw10 LIKE zaw_file.zaw10,       #行業別             #TQC-930143 
       zaw12 LIKE zaw_file.zaw12,       #列印簽核           #FUN-910012
       zaw13 LIKE zaw_file.zaw13,       #列印簽核位置        #FUN-910012
       zaw14 LIKE zaw_file.zaw14,       #紙張名稱           #FUN-920131
       zaw15 LIKE zaw_file.zaw15        #紙張方向(縱向/橫向)  #FUN-920131
       END RECORD
###FUN-8C0025 END ###
DEFINE l_zax36                    LIKE zax_file.zax36   # Prog. Version..: '5.25.02-11.03.23(0:不列印簽核/ 1:頁尾/ 2:表尾)   #FUN-910012
 
   IF g_gui_type = "Y" THEN
      CLOSE WINDOW screen
   END IF
 
   LET p_zaw08 =""
 
   ##判斷客製否，使用者名稱優先
   LET l_zaw03 = "Y"
   LET l_zaw10 = g_sma.sma124   #No.TQC-7B0135
   ## FUN-810068 START ##
   LET l_db_type=cl_db_get_database_type()
   CASE
      WHEN l_db_type="ORA"
         LET l_sql = "SELECT count(*) FROM ",
                     "(SELECT unique zaw08 FROM zaw_file ",
                     "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                     "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                     #"' AND zaw10 ='",g_sma.sma124 CLIPPED,        #No.FUN-780023 #No.TQC-7B0135
                     "' AND zaw10 ='",l_zaw10 CLIPPED,        #No.TQC-7B0135
                     "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                     "' OR zaw05= '",g_user CLIPPED,"'))"
 
      WHEN l_db_type="IFX"
         LET l_sql = "SELECT count(*) FROM table(multiset",
                     "(SELECT unique zaw08 FROM zaw_file ",
                     "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                     "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                     #"' AND zaw10 ='",g_sma.sma124 CLIPPED,        #No.FUN-780023 #No.TQC-7B0135
                     "' AND zaw10 ='",l_zaw10 CLIPPED,        #No.TQC-7B0135
                     "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                     "' OR zaw05= '",g_user CLIPPED,"')))"

      WHEN l_db_type="MSV"
         LET l_sql = "SELECT count(*) FROM ",
                     "(SELECT unique zaw08 FROM zaw_file ",
                     "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                     "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                     "' AND zaw10 ='",l_zaw10 CLIPPED,        
                     "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                     "' OR zaw05= '",g_user CLIPPED,"')) a"

      WHEN l_db_type="ASE"                        #FUN-AA0076
         LET l_sql = "SELECT count(*) FROM ",
                     "(SELECT unique zaw08 FROM zaw_file ",
                     "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                     "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                     "' AND zaw10 ='",l_zaw10 CLIPPED,        
                     "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                     "' OR zaw05= '",g_user CLIPPED,"')) a"

      OTHERWISE
   END CASE
   ## FUN-810068 END ##
 
   PREPARE zaw_pre FROM l_sql
   IF SQLCA.SQLCODE THEN
      CALL cl_err("prepare zaw_cur: ", SQLCA.SQLCODE, 1)
      EXIT PROGRAM
   END IF
   EXECUTE zaw_pre INTO l_cust
 
   IF l_cust = 0 THEN
      LET l_zaw03 = "N"
      LET l_zaw10 = g_sma.sma124   #No.TQC-7B0135
      ## FUN-810068 START ##
      CASE
         WHEN l_db_type="ORA"
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        #"' AND zaw10 ='",g_sma.sma124 CLIPPED,        #No.FUN-780023 #No.TQC-7B0135
                        "' AND zaw10 ='",l_zaw10 CLIPPED,        #No.TQC-7B0135
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"'))"

         WHEN l_db_type="IFX"
            LET l_sql = "SELECT count(*) FROM table(multiset",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        #"' AND zaw10 ='",g_sma.sma124 CLIPPED,        #No.FUN-780023 #No.TQC-7B0135
                        "' AND zaw10 ='",l_zaw10 CLIPPED,        #No.TQC-7B0135
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')))"

         WHEN l_db_type="MSV"
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,        #No.TQC-7B0135
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')) a"

         WHEN l_db_type="ASE"     #FUN-AA0076
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,        #No.TQC-7B0135
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')) a"
         OTHERWISE
      END CASE
      ## FUN-810068 END ##
   END IF
   PREPARE zaw_pre1 FROM l_sql
   IF SQLCA.SQLCODE THEN
      CALL cl_err("prepare zaw_cur: ", SQLCA.SQLCODE, 1)
      EXIT PROGRAM
   END IF
   EXECUTE zaw_pre1 INTO l_cust
 
   #No.TQC-7B0135 --start--
   ##客製, 行業別為std
   IF l_cust = 0 THEN
      LET l_zaw03 = "Y"
      LET l_zaw10 = "std"
      ## FUN-810068 START ##
      CASE
         WHEN l_db_type="ORA"
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"'))"

         WHEN l_db_type="IFX"
            LET l_sql = "SELECT count(*) FROM table(multiset",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')))"

         WHEN l_db_type="MSV"
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')) a"

         WHEN l_db_type="ASE"              #FUN-AA0076
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')) a"

         OTHERWISE
      END CASE
      ## FUN-810068 END ##
 
      PREPARE zaw_pre_cust_std FROM l_sql
      IF SQLCA.SQLCODE THEN
         CALL cl_err("prepare zaw_cur: ", SQLCA.SQLCODE, 1)
         EXIT PROGRAM
      END IF
      EXECUTE zaw_pre_cust_std INTO l_cust
   END IF
 
   ##標準, 行業別為std
   IF l_cust = 0 THEN
      LET l_zaw03 = "N"
      LET l_zaw10 = "std"
      ## FUN-810068 START ##
      CASE
         WHEN l_db_type="ORA"
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"'))"

         WHEN l_db_type="IFX"
            LET l_sql = "SELECT count(*) FROM table(multiset",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')))"

         WHEN l_db_type="MSV"
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')) a"

         WHEN l_db_type="ASE"          #FUN-AA0076
            LET l_sql = "SELECT count(*) FROM ",
                        "(SELECT unique zaw08 FROM zaw_file ",
                        "WHERE zaw01 = '",p_prog CLIPPED,"' AND zaw02 = '",p_rep_template CLIPPED,
                        "' AND zaw03 ='",l_zaw03 CLIPPED,"' AND zaw06 = '",g_rlang CLIPPED,
                        "' AND zaw10 ='",l_zaw10 CLIPPED,
                        "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                        "' OR zaw05= '",g_user CLIPPED,"')) a"
         OTHERWISE
      END CASE
      ## FUN-810068 END ##
 
      PREPARE zaw_pre_std1 FROM l_sql
      IF SQLCA.SQLCODE THEN
         CALL cl_err("prepare zaw_cur: ", SQLCA.SQLCODE, 1)
         EXIT PROGRAM
      END IF
      EXECUTE zaw_pre_std1 INTO l_cust
   END IF
   #No.TQC-7B0135 --end--
 
   IF l_cust > 1 THEN  ## 多筆 zaw ##
      #No.FUN-7C0078 --start--
      #背景執行時, 抓取第一筆CR樣板名稱(序號最小)
      IF FGL_GETENV('FGLGUI') = '0' AND g_bgjob MATCHES "[Yy]" THEN
         LET l_sql = #"SELECT zaw08 FROM zaw_file WHERE zaw01 = '",p_prog CLIPPED,            #No.TQC-7A0075 add unique before zaw08  #FUN-8C0025 mark
                     "SELECT zaw04,zaw05,zaw08,zaw12,zaw13,zaw14,zaw15 FROM zaw_file WHERE zaw01 = '",p_prog CLIPPED,             #FUN-8C0025   #FUN-920131 add zaw14,zaw15  #FUN-910012 加zaw12,zaw13
                     "' AND zaw02 = '",p_rep_template CLIPPED,"' AND zaw03 ='",l_zaw03 CLIPPED,     #No.TQC-7A0075 add CLIPPED
                     "' AND zaw06 = '",g_rlang CLIPPED,                                             #No.TQC-7A0075 add CLIPPED
                     #"' AND zaw10 ='",g_sma.sma124 CLIPPED,        #No.FUN-780023 #No.TQC-7B0135
                     "' AND zaw10 ='",l_zaw10 CLIPPED,        #No.TQC-7B0135
                     "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED, 
                     "' OR zaw05= '",g_user CLIPPED,"')"
         
         IF NOT cl_null(g_rpt_name) THEN
            LET p_zaw08 = g_rpt_name
            LET l_sql = l_sql," AND zaw08 = '",p_zaw08,"'"
         END IF
         LET l_sql = l_sql," ORDER BY zaw07"         
         PREPARE pre_rptname FROM l_sql
         IF SQLCA.SQLCODE THEN
            CALL cl_err("prepare zaw_cur: ", SQLCA.SQLCODE, 1)
         ELSE
            DECLARE cur_rptname CURSOR FOR pre_rptname
            LET l_i = 1
            #FOREACH cur_rptname INTO l_rec[l_i].*   #FUN-8C0025 mark
            FOREACH cur_rptname INTO l_zaw.zaw04,l_zaw.zaw05,l_rec[l_i].l_zaw08,l_zaw.zaw12,l_zaw.zaw13,l_zaw.zaw14,l_zaw.zaw15   #FUN-8C0025   #FUN-920131 add zaw14,zaw15  #FUN-910012 加zaw12,zaw13
               IF SQLCA.SQLCODE THEN
                  CALL cl_err("excute zaw_cur: ", SQLCA.SQLCODE, 1)
                  EXIT FOREACH
               END IF
               LET p_zaw08 = l_rec[l_i].l_zaw08
               EXIT FOREACH
            END FOREACH
            
         END IF
      ELSE   
      #No.FUN-7C0078 --end--
         CALL cl_load_act_sys("")
         CALL cl_set_act_visible("cancel",FALSE)
         CALL cl_init_qry_var()
         LET g_qryparam.form = "q_zaw"
         LET g_qryparam.arg1 = p_prog
         LET g_qryparam.arg2 = p_rep_template
         LET g_qryparam.arg3 = l_zaw03  ##客製否
         LET g_qryparam.arg4 = g_clas #No.FUN-770002
         LET g_qryparam.arg5 = g_user #No.FUN-770002
         LET g_qryparam.arg6 = g_rlang
         LET g_qryparam.construct = "N"
         #CALL cl_create_qry() RETURNING p_zaw08   #FUN-8C0025 mark         
         #CALL cl_create_qry() RETURNING l_zaw.zaw04,l_zaw.zaw05,p_zaw08,l_zaw.zaw14,l_zaw.zaw15,l_zaw.zaw12,l_zaw.zaw13 #FUN-8C0025   #FUN-920131 add zaw14,zaw15  #FUN-910012 加zaw12,zaw13  #TQC-930143 mark
         ###TQC-930143 START ###
         CALL cl_create_qry() RETURNING  l_zaw.zaw04,l_zaw.zaw05,l_zaw.zaw07,l_zaw.zaw10   #開窗選擇樣板，回傳key值
         #查zaw相關資料
         SELECT zaw08,zaw12,zaw13,zaw14,zaw15 INTO p_zaw08,l_zaw.zaw12,l_zaw.zaw13,l_zaw.zaw14,l_zaw.zaw15 
            FROM zaw_file 
            WHERE zaw01=p_prog AND zaw02=p_rep_template AND zaw03=l_zaw03 AND zaw04=l_zaw.zaw04 AND zaw05=l_zaw.zaw05 AND zaw06=g_rlang AND zaw07=l_zaw.zaw07 AND zaw10=l_zaw.zaw10 
         ###TQC-930143 END ###
         CALL cl_set_act_visible("cancel",TRUE)
     END IF   #No.FUN-7C0078
   ELSE
      IF l_cust = 0 THEN ## no data in zaw ##
         SELECT gay03 INTO l_gay03 FROM gay_file
          WHERE gay01 = g_rlang AND gayacti="Y"  #gay02 = g_rlang #FUN-830021
          LET l_str = g_rlang CLIPPED, ":",l_gay03 CLIPPED
          CALL cl_err_msg(g_prog,'lib-360',l_str,10)
          EXIT PROGRAM
      ELSE  ## only one zaw ##
         LET l_sql = #"SELECT unique zaw08 FROM zaw_file WHERE zaw01 = '",p_prog CLIPPED,            #No.TQC-7A0075 add unique before zaw08  #FUN-8C0025 mark
                     "SELECT unique zaw04,zaw05,zaw08,zaw12,zaw13,zaw14,zaw15 FROM zaw_file WHERE zaw01 = '",p_prog CLIPPED, #FUN-8C0025   #FUN-920131 add zaw14,zaw15  #FUN-910012 加zaw12,zaw13
                     "' AND zaw02 = '",p_rep_template CLIPPED,"' AND zaw03 ='",l_zaw03 CLIPPED,     #No.TQC-7A0075 add CLIPPED
                     "' AND zaw06 = '",g_rlang CLIPPED,                                             #No.TQC-7A0075 add CLIPPED
                     #"' AND zaw10 ='",g_sma.sma124 CLIPPED,        #No.FUN-780023 #No.TQC-7B0135
                     "' AND zaw10 ='",l_zaw10 CLIPPED,        #No.TQC-7B0135
                     "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                     "' OR zaw05= '",g_user CLIPPED,"')"
         PREPARE zaw_pre2 FROM l_sql
         IF SQLCA.SQLCODE THEN
            CALL cl_err("prepare zaw_cur: ", SQLCA.SQLCODE, 1)
            EXIT PROGRAM
         END IF
         #EXECUTE zaw_pre2 INTO p_zaw08  #FUN-8C0025 mark
         #EXECUTE zaw_pre2 INTO l_zaw.zaw04,l_zaw.zaw05,p_zaw08   #FUN-8C0025   #FUN-920131 mark
         ###FUN-920131 START ###
         DECLARE zaw_cus2 SCROLL CURSOR FOR zaw_pre2
         OPEN zaw_cus2
         FETCH LAST zaw_cus2 INTO l_zaw.zaw04,l_zaw.zaw05,p_zaw08,l_zaw.zaw12,l_zaw.zaw13,l_zaw.zaw14,l_zaw.zaw15   #FUN-910012 加zaw12,zaw13
         CLOSE zaw_cus2
         ###FUN-920131 END ###
      END IF
   END IF
 
   #FUN-850105 by Hiko : 取得timeout資料
   LET ls_sql = "SELECT unique zaw11 FROM zaw_file WHERE zaw01 = '",p_prog CLIPPED,           
                "' AND zaw02 = '",p_rep_template CLIPPED,"' AND zaw03 ='",l_zaw03 CLIPPED,    
                "' AND zaw06 = '",g_rlang CLIPPED,                                            
                "' AND zaw10 ='",l_zaw10 CLIPPED,       
                "' AND ((zaw04='default' AND zaw05='default') OR zaw04 ='",g_clas CLIPPED,
                "' OR zaw05= '",g_user CLIPPED,"')"
   PREPARE zaw11_prep FROM ls_sql
   IF SQLCA.SQLCODE THEN
      CALL cl_err("prepare zaw11_cur: ", SQLCA.SQLCODE, 1)
      EXIT PROGRAM
   END IF
   EXECUTE zaw11_prep INTO g_prt_timeout
 
   ###FUN-910012 START ###
   #列印簽核位置(0:不列印簽核/ 1:頁尾/ 2:表尾)
   IF cl_null(l_zaw.zaw12) THEN
      LET l_zaw.zaw12 ="N"   #預設不列印簽核
   END IF
   IF cl_null(l_zaw.zaw13) THEN
      LET l_zaw.zaw13 ="1"   #預設列印簽核未置於頁尾
   END IF
   IF l_zaw.zaw12 = "Y" THEN
      LET l_zax36 = l_zaw.zaw13 CLIPPED   
   ELSE
      LET l_zax36 = "0"
   END IF
   ###FUN-910012 END ###
   #RETURN l_zaw03,p_zaw08  #FUN-8C0025 mark
   RETURN l_zaw03,l_zaw.zaw04,l_zaw.zaw05,p_zaw08,l_zax36,l_zaw.zaw14,l_zaw.zaw15    #FUN-8C0025   #FUN-920131 add zaw14,zaw15  #FUN-910012 加l_zax36
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_table
# Return code....:
##################################################
 
FUNCTION cl_del_data(p_table)
    DEFINE  p_table   STRING
    DEFINE  l_db_type    LIKE type_file.chr3    ### MOD-860225 ###
 
    #LET g_sql = "DELETE FROM ds_report.",p_table CLIPPED," WHERE 1=1"
    LET g_sql = "DELETE FROM ",g_cr_db_str CLIPPED,p_table CLIPPED," WHERE 1=1"
    PREPARE deldata_prep FROM g_sql
    ### MOD-860225 marked start###
    #IF SQLCA.sqlcode THEN
#       CALL cl_err('deldata_prep:',SQLCA.sqlcode,1)
    #No.FUN-720003--begin
    #  IF g_bgerr THEN
    #     CALL s_errmsg('','','deldata_prep:',SQLCA.sqlcode,1)
    #  ELSE
    #     CALL cl_err('deldata_prep:',SQLCA.sqlcode,1)
    #  END IF
#No.FUN-720003--end
    #    EXIT PROGRAM
    #END IF
    ### MOD-860225 marked end###
    EXECUTE deldata_prep
    ### MOD-860225 start###
    IF SQLCA.sqlcode THEN
       LET l_db_type=cl_db_get_database_type()
       IF (l_db_type="ORA" and SQLCA.sqlcode=-206) OR (l_db_type="IFX" and SQLCA.sqlcode=-410) THEN
          IF g_bgerr THEN
             CALL s_errmsg('','','','lib-508',1)
          ELSE
             CALL cl_err('','lib-508',1)
          END IF
       ELSE
          IF g_bgerr THEN
             CALL s_errmsg('','','deldata_prep:',SQLCA.sqlcode,1)
          ELSE
             CALL cl_err('deldata_prep:',SQLCA.sqlcode,1)
          END IF
       END IF
       EXIT PROGRAM
    END IF
    ### MOD-860225 end###
END FUNCTION
 
##################################################
# Descriptions...: 新增報表輸出至pdf
# Date & Author..: add by COCO 2004/04/05
# Input Parameter: none
# Return code....:
##################################################
FUNCTION cl_prt_p(p_name)
   DEFINE p_name            LIKE type_file.chr50,  #No.FUN-690005 VARCHAR(20), #FUN-690069
          xml_name          LIKE type_file.chr50,  #No.FUN-690005 VARCHAR(20), #FUN-690069
          xsl_name          LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(18),
          tmp_name          LIKE gap_file.gap08,   #No.FUN-690005 VARCHAR(25),
           l_str             STRING,    ### MOD-540113
          l_cmd,l_locale    STRING,
          l_url,ls_pdfimg   STRING,
          l_logo_pos        STRING,
          l_i               LIKE type_file.num5,   #No.FUN-690005 SMALLINT,
          l_row_cnt,res     LIKE type_file.num10,  #No.FUN-690005 INTEGER,
          l_column,l_msg    LIKE type_file.num10,  #No.FUN-690005 INTEGER,
          l_channel         base.Channel,
          l_channel1        base.Channel,
          l_bufstr          base.StringBuffer
 
   LET l_row_cnt = 0
   LET xsl_name=""
   LET l_bufstr = base.StringBuffer.create()
   LET l_channel = base.Channel.create()
   LET l_channel1 = base.Channel.create()
   LET xml_name = p_name CLIPPED,"1.xml"
   CALL l_channel.openFile(p_name CLIPPED, "r")
   CALL l_channel.setDelimiter("")
   CALL l_channel1.openFile( xml_name CLIPPED, "a" )
   CALL l_channel1.setDelimiter("")
 
## TQC-5B0077 START##
   CALL l_channel1.write("<?xml version=""1.0"" encoding=\'" || ms_codeset || "\'?>")
##原本TOPLOCALE的IF判斷都刪除
## TQC-5B0077 END##
   CALL l_channel1.write( "<Report>" )
 
######  FUN-540029  #######
   #LET ls_pdfimg = FGL_GETENV("FGLASIP") || "/tiptop/pic/pdf_logo_",g_dbs CLIPPED,g_rlang,".gif" ### FUN-750016 ###
   LET ls_pdfimg = FGL_GETENV("FGLASIP") || "/tiptop/pic/pdf_logo_",g_dbs CLIPPED,g_rlang,".jpg"  ### FUN-750016 ###
   LET l_logo_pos = cl_prt_p_img()
   LET l_str='<Logo',' image="',ls_pdfimg CLIPPED,'" position="',l_logo_pos CLIPPED,'" />'
   display l_str
   CALL l_channel1.write( l_str)
######  FUN-540029  #######
 
   WHILE l_channel.read(l_str)
      LET l_row_cnt = l_row_cnt + 1
      CALL l_bufstr.clear()
      CALL l_bufstr.append(l_str)
      IF NOT cl_null(l_str) THEN
         CALL l_bufstr.replace("&","&amp;",0)
         CALL l_bufstr.replace("'","&apos;",0)
         CALL l_bufstr.replace("\"","&quot;",0)
         CALL l_bufstr.replace("<","&lt;",0)
         CALL l_bufstr.replace(">","&gt;",0)
 
         #FUN-680026
         IF ms_codeset.getIndexOf("UTF-8", 1) THEN
            CALL l_bufstr.replace("──","─",0)  # －
            CALL l_bufstr.replace(" ┌","┌",0)   # 「
 
            CALL l_bufstr.replace(" │","│",0)   # |
 
            CALL l_bufstr.replace(" ├","├",0)   # |-
 
            CALL l_bufstr.replace(" └","└",0)   # 9宮格的左下
            CALL l_bufstr.replace("─┐","┐",0)  # 9宮格的右上
 
            CALL l_bufstr.replace("─┤","┤",0)  # -|
 
            CALL l_bufstr.replace("─┘","┘",0)  # 」
 
            CALL l_bufstr.replace("─┬","┬",0)  # T
 
            CALL l_bufstr.replace("─┼","┼",0)  # 十
 
            CALL l_bufstr.replace("─┴","┴",0)  # _|_
         END IF
         #END FUN-680026
 
      END IF
      LET l_str = l_bufstr.tostring()
      IF (l_row_cnt MOD g_page_line = 1) AND (l_row_cnt > 1) THEN
         LET l_str = "<Print>^L",l_str CLIPPED
         CALL l_channel1.write( l_str)
######  FUN-540029  #######
         LET l_str='<Logo',' image="',ls_pdfimg,'" position="',l_logo_pos CLIPPED,'" />','</Print>'
         display l_str
         CALL l_channel1.write( l_str)
######  FUN-540029  #######
      ELSE
         LET l_str = "<Print>",l_str CLIPPED,"</Print>"
         CALL l_channel1.write( l_str)
      END IF
   END WHILE
 
   CALL l_channel1.write( "</Report>" )
   CALL l_channel.close()
   CALL l_channel1.close()
   CALL cl_prt_convert(xml_name) ### TQC-5C0007 ###
   #No.FUN-9B0062  -- start --
   IF os.Path.separator() = "/" THEN        #Unix 環境
      LET l_cmd = "chmod 666 ",xml_name CLIPPED," 2>/dev/null"
   ELSE
      LET l_cmd = "attrib -r ",xml_name CLIPPED,"  >nul 2>nul"
   END IF
   #No.FUN-9B0062  -- end --
   RUN l_cmd
   LET l_cmd = "mv ",FGL_GETENV("TEMPDIR"),os.Path.separator(),xml_name CLIPPED," ",
                     FGL_GETENV("TOP"),"/tool/fop-0.20.5/"
   display l_cmd
   RUN l_cmd
 
######  FUN-550001  #######
   IF g_len = 0 OR g_len IS NULL THEN
      SELECT zz17 INTO g_len FROM zz_file WHERE zz01 = g_prog
      IF g_len = 0 OR g_len IS NULL THEN LET g_len = 80 END IF
   END IF
######  FUN-550001  #######
   CASE
        WHEN g_len <= 103
             LET xsl_name = "template_80_A4_12"
        ###132 or 80
         WHEN g_len > 103 AND g_len <=155
              CALL cl_prt_length() RETURNING l_msg
              IF l_msg=1 then
                 CASE
                      WHEN g_len > 103 AND g_len <= 114
                           LET xsl_name = "template_80_A4_11"
                      WHEN g_len > 114 AND g_len <= 124
                           LET xsl_name = "template_80_A4_10"
                      WHEN g_len > 124 AND g_len <= 138
                           LET xsl_name = "template_80_A4_9"
                      WHEN g_len > 138 AND g_len <= 155
                           LET xsl_name = "template_80_A4_8"
                 END CASE
              ELSE
                 IF l_msg=2 then
                    LET xsl_name = "template_132_12"
                 END IF
              END IF
             ##open window
        WHEN g_len > 155 AND g_len <= 172
             LET xsl_name = "template_132_12"
        WHEN g_len > 172 AND g_len <= 188
             LET xsl_name = "template_132_11"
        WHEN g_len > 188 AND g_len <= 206
             LET xsl_name = "template_132_10"
        WHEN g_len > 206 AND g_len <= 230
             LET xsl_name = "template_132_9"
        WHEN g_len > 230 AND g_len <= 258
             LET xsl_name = "template_132_8"
 ######  MOD-540113  #######
        WHEN g_len > 258 AND g_len <=285
             LET xsl_name = "template_132_7.5"
        WHEN g_len > 285 AND g_len <=305
             LET xsl_name = "template_132_7"
        WHEN g_len > 305 AND g_len <=329
             LET xsl_name = "template_132_6.5"
        WHEN g_len > 329 AND g_len <=355
             LET xsl_name = "template_132_6"
        WHEN g_len > 355 AND g_len <=388
             LET xsl_name = "template_132_5.5"
       ### size 5 can support 389 to 427
        WHEN g_len > 388
             LET xsl_name = "template_132_5"
 ######  MOD-540113  #######
   END CASE
   IF NOT cl_null(xsl_name) then

      #No.FUN-9B0062  -- start --
      IF os.Path.delete(xml_name CLIPPED||'.pdf') THEN
      END IF
 
      IF os.Path.separator() = "/" THEN        #Unix 環境
         LET l_cmd = 'fop.sh'
      ELSE
         LET l_cmd = 'fop.bat'
      END IF 
     IF not ms_codeset.getIndexOf("UTF-8", 1) THEN  ##TQC-5B0077##
        IF g_lang = "0" THEN
           LET l_cmd = FGL_GETENV("TOP"),"/tool/fop-0.20.5/",l_cmd," -c ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/conf/userconfig.xml -xml ", FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED, " -xsl ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/template/big5/",xsl_name CLIPPED,".xsl -pdf ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED,".pdf"
        ELSE
            IF g_lang = "2" THEN  ##### MOD-550021 #####
              IF ms_codeset.getIndexOf("GB2312", 1) THEN
                 LET l_cmd = FGL_GETENV("TOP"),"/tool/fop-0.20.5/",l_cmd," -c ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/conf/userconfig.xml -xml ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED, " -xsl ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/template/gb2312/",xsl_name CLIPPED,".xsl -pdf ", FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED,".pdf"
              ELSE
                 IF ms_codeset.getIndexOf("GBK", 1) THEN
                    LET l_cmd = FGL_GETENV("TOP"),"/tool/fop-0.20.5/",l_cmd," -c ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/conf/userconfig.xml -xml ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED, " -xsl ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/template/gb18030/",xsl_name CLIPPED,".xsl -pdf ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED,".pdf"
                 ELSE
                    IF ms_codeset.getIndexOf("GB18030", 1) THEN
                       LET l_cmd = FGL_GETENV("TOP"),"/tool/fop-0.20.5/",l_cmd," -c ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/conf/userconfig.xml -xml ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED, " -xsl ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/template/gb18030/",xsl_name CLIPPED,".xsl -pdf ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED,".pdf"
                    END IF
                 END IF
              END IF
           ELSE
              LET l_cmd = FGL_GETENV("TOP"),"/tool/fop-0.20.5/",l_cmd," -c ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/conf/userconfig.xml -xml ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED, " -xsl ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/template/utf8/",xsl_name CLIPPED,".xsl -pdf ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED,".pdf"
           END IF
        END IF
     ELSE
        LET l_cmd = FGL_GETENV("TOP"),"/tool/fop-0.20.5/",l_cmd," -c ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/conf/userconfig.xml -xml ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED, " -xsl ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/template/utf8/",xsl_name CLIPPED,".xsl -pdf ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED,".pdf"
     END IF
     #No.FUN-9B0062  -- end --
     DISPLAY l_cmd
     RUN l_cmd

     #No.FUN-9B0062  -- start --
     IF os.Path.separator() = "/" THEN        #Unix 環境
        LET l_cmd = "chmod 666 ",xml_name CLIPPED,".pdf 2>/dev/null"
        RUN l_cmd
        LET l_cmd = "rm $TOP/tool/fop-0.20.5/",xml_name CLIPPED
        RUN l_cmd
        LET l_cmd = "mv $TOP/tool/fop-0.20.5/",xml_name CLIPPED,".pdf $TEMPDIR/."
        RUN l_cmd
        LET l_cmd = "chmod 777 ",xml_name CLIPPED,".pdf 2>/dev/null" ### MOD-580063
        RUN l_cmd
        LET l_url = FGL_GETENV("FGLASIP"),"/tiptop/out/",xml_name CLIPPED,".pdf"
     ELSE
        LET l_cmd = "attrib -r ",xml_name CLIPPED,".pdf  >nul 2>nul"
        RUN l_cmd
        LET l_cmd = "rm ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED
        RUN l_cmd
        LET l_cmd = "mv ",FGL_GETENV("TOP"),"/tool/fop-0.20.5/",xml_name CLIPPED,".pdf ",FGL_GETENV("TEMPDIR"),"/."
        RUN l_cmd
        LET l_cmd = "attrib -r ",xml_name CLIPPED,".pdf  >nul 2>nul" ### MOD-580063
        RUN l_cmd
     END IF
     #No.FUN-9B0062  -- end --
     LET l_url = FGL_GETENV("FGLASIP"),"/tiptop/out/",xml_name CLIPPED,".pdf"
 
      ##No.MOD-530309
   # CALL ui.Interface.frontCall("standard","execute",
   #                              ["\"C:\\Program Files\\Internet Explorer\\IEXPLORE.EXE\" \"" || l_url || "\"", 0],
   #                              [res])
     CALL ui.Interface.frontCall("standard",
                                   "shellexec",
                                   ["EXPLORER \"" || l_url || "\""],
                                   [res])
      ## END No.MOD-530309
   END IF
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: none
# Return code....:
##################################################
 
FUNCTION cl_prt_p_img()
   DEFINE l_logo_pos      STRING,
          l_aza24         LIKE aza_file.aza24  #No.FUN-690005 VARCHAR(1)    ###FUN-540002
     select aza24 into l_aza24 from aza_file
     IF l_aza24 = 2 THEN
        LET l_logo_pos ="center"
     ELSE
        IF l_aza24= 3 THEN
           LET l_logo_pos ="right"
        ELSE
           LET l_logo_pos = "left"
        END IF
     END IF
  RETURN l_logo_pos
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name,l_opt
# Return code....:
##################################################
 
FUNCTION cl_prt_htm(p_name,l_opt)
   DEFINE p_name            LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          file_name         LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          l_str,gb_code     STRING,
          l_cmd,l_opt       STRING,
          l_url,l_locale    STRING,
          res               LIKE type_file.num10,  #No.FUN-690005 INTEGER,
          l_channel         base.Channel,
          l_channel1        base.Channel,
          l_bufstr          base.StringBuffer          #TQC-650109
   DEFINE unix_path         STRING,                    #FUN-660011
          window_path       STRING                     #FUN-660011
 
   LET l_bufstr = base.StringBuffer.create()           #TQC-650109
 
   LET l_channel = base.Channel.create()
   LET l_channel1 = base.Channel.create()
   CALL l_channel.openFile(p_name CLIPPED, "r")
   CALL l_channel.setDelimiter("")
 
   #MOD-650122
   IF tsconv_cmd IS NULL THEN
      IF l_opt = "x" THEN
        LET file_name = p_name CLIPPED,".xls"
      ELSE
        LET file_name = p_name CLIPPED,".htm"
      END IF
   ELSE
      IF l_opt = "x" THEN
        LET file_name = p_name[1,length(p_name CLIPPED)-3],".xls"
      ELSE
        LET file_name = p_name[1,length(p_name CLIPPED)-3],".htm"
      END IF
   END IF
   #END MOD-650122
 
   #No.FUN-9B0062  -- start --
   IF os.Path.delete(file_name CLIPPED) THEN
   END IF
   #No.FUN-9B0062  -- end --
 
   CALL l_channel1.openFile( file_name CLIPPED, "a" )
   CALL l_channel1.setDelimiter("")
 
   LET l_str = "<HEAD>"
### TQC-5B0077 START###
   LET l_str=l_str CLIPPED,
             "<META http-equiv=Content-Type content=\"text/html; charset=",ms_codeset CLIPPED,"\">"
##原本TOPLOCALE的IF判斷都刪除
### TQC-5B0077 END###
 
   LET l_str = l_str CLIPPED,"<PRE>"
   ### FUN-710036 START ###
    LET l_str = l_str CLIPPED,"<style><!--"
    IF not ms_codeset.getIndexOf("UTF-8", 1) THEN
       IF g_lang = "0" THEN
         LET l_str = l_str CLIPPED,"{font-family:細明體, serif;}"
       ELSE
          IF g_lang = "2" THEN
             LET l_str = l_str CLIPPED,"{font-family:新宋体, serif;}"
          ELSE
            LET l_str = l_str CLIPPED,"{font-family:細明體, serif;}"
          END IF
       END IF
    ELSE
        LET l_str = l_str CLIPPED,"{font-family:Courier New, serif;}"
    END IF
    LET l_str = l_str CLIPPED,"--></style>"
   ###FUN-710036 END ###
 
   CALL l_channel1.write( l_str)
 
   WHILE l_channel.read(l_str)
      #TQC-650109
      CALL l_bufstr.clear()
      CALL l_bufstr.append(l_str)
      IF NOT cl_null(l_str) THEN
         CALL l_bufstr.replace("<","&lt;",0)
      END IF
      LET l_str = l_bufstr.tostring()
      #END TQC-650109
 
      CALL l_channel1.write( l_str)
   END WHILE
 
   CALL l_channel1.write( "</PRE>" )
   CALL l_channel.close()
   CALL l_channel1.close()
 
   CALL cl_prt_convert(file_name)                #MOD-650122
 
   #No.FUN-9B0062  -- start --
   IF os.Path.separator() = "/" THEN        #Unix 環境
      LET l_cmd = "chmod 777 ",file_name CLIPPED," 2>/dev/null"
   ELSE
      LET l_cmd = "attrib -r ",file_name CLIPPED,"  >nul 2>nul"
   END IF
   #No.FUN-9B0062  -- end --
   RUN l_cmd
 
   #FUN-660011
   #LET l_url = FGL_GETENV("FGLASIP"),"/tiptop/out/",file_name CLIPPED
   #CALL ui.Interface.frontCall("standard",
   #                            "shellexec",
   #                            ["EXPLORER \"" || l_url || "\""],
   #                            [res])
   IF cl_null(g_aza.aza56) THEN
     UPDATE aza_file set aza56='1'
     IF SQLCA.sqlcode THEN
#            CALL cl_err('U',SQLCA.sqlcode,0)
     #No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','U',SQLCA.sqlcode,0)
      ELSE
         CALL cl_err('U',SQLCA.sqlcode,0)
      END IF
#No.FUN-720003--end
             RETURN
     END IF
     LET g_aza.aza56 = '1'
   END IF
   IF l_opt = "x" AND g_aza.aza56 = '2' THEN
            LET unix_path = os.Path.join( FGL_GETENV("TEMPDIR"),file_name)
 
            LET window_path = os.Path.join( os.Path.join("C:","tiptop"), file_name)
            LET status = cl_download_file(unix_path, window_path)
            IF status then
               DISPLAY "Download OK!!"
            ELSE
               DISPLAY "Download fail!!"
            END IF
            LET status = cl_open_prog("excel",window_path)
            IF status then
               DISPLAY "Open OK!!"
            ELSE
               DISPLAY "Open fail!!"
            END IF
   ELSE
       LET l_url = FGL_GETENV("FGLASIP"),"/tiptop/out/",file_name CLIPPED
       CALL ui.Interface.frontCall("standard",
                                   "shellexec",
                                   ["EXPLORER \"" || l_url || "\""],
                                   [res])
       IF STATUS THEN
#          CALL cl_err("Front End Call failed.", STATUS, 1)
       #No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',"Front End Call failed.", STATUS, 1)
      ELSE
         CALL cl_err("Front End Call failed.", STATUS, 1)
      END IF
#No.FUN-720003--end
          RETURN
       END IF
       IF NOT res THEN
#          CALL cl_err("Application execution failed.", '!', 1)
       #No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',"Application execution failed.", '!', 1)
      ELSE
         CALL cl_err("Application execution failed.", '!', 1)
      END IF
#No.FUN-720003--end
          RETURN
       END IF
 
   END IF
   #END FUN-660011
 
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name,p_copies
# Return code....:
##################################################
 
FUNCTION cl_prt_m(p_name,p_copies)
   DEFINE p_name                    LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          p_copies                  LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          l_choice2                 LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          l_choice3                 LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          l_choice4                 LIKE type_file.chr1,   #No.FUN-690005 VARCHAR(1),
          l_gae04                   LIKE gae_file.gae04,
          l_gae04_s                 LIKE gae_file.gae04,    #TQC-5B0170
          l_gae04_c                 LIKE gae_file.gae04,    #FUN-5C0113
          l_msg                     STRING,
          l_cnt,l_2header           LIKE type_file.num5,   #No.FUN-690005 SMALLINT,     ### MOD-580044
          l_real_len                LIKE type_file.num5,   #No.FUN-690005 SMALLINT,     ### FUN-590079 ###
          l_len                     LIKE type_file.num5,   #No.FUN-690005 SMALLINT,     #FUN-650017
      ### FUN-580164 ###
          p_name_tmp                STRING,
          l_pagenum                 LIKE type_file.num10,  #TQC-6B0054 num5->num10  #No.FUN-690005 SMALLINT,
          l_startpage,l_endpage     LIKE type_file.num10,  #TQC-6B0054 num5->num10  #No.FUN-690005 SMALLINT,
          l_start_line,l_end_line   LIKE type_file.num10,  #No.FUN-690005 INTEGER,   ### MOD-590131 ###
          l_line_cnt                LIKE type_file.num10,  #No.FUN-690005 INTEGER,   ### MOD-590131 ###
          l_cmd,l_str               STRING,
          l_channel,l_channel1      base.Channel,
      ### FUN-580164 ###
          p_name_ts                 STRING     ### MOD-5B0314 ###
#FUN-5C0113
   DEFINE ln_w,ln_child,ln_items    om.DomNode
   DEFINE ls_items                  om.NodeList
   DEFINE ls_colname                STRING
   DEFINE lw_w                      ui.window
   DEFINE l_name                    STRING
#END FUN-5C0113
 
   MESSAGE ''                              #MOD-5A0202
 
   IF g_gui>=1 THEN # 1.GUI mode  2.HTML 3.JAVA
      CASE
         WHEN g_gui MATCHES "[13]"
              LET g_choice='V'
              LET l_choice2='1'
              LET l_choice4='T'
 
               CALL ui.interface.refresh()      #MOD-570245
 
              OPEN WINDOW cl_prt_m_w
                   WITH FORM "lib/42f/cl_prt_m" #ATTRIBUTE(BORDER,BLUE,FORM LINE FIRST)
                   ATTRIBUTE(STYLE = "report")
              CALL cl_load_style_list(NULL)    ### MOD-590384 ###
#### By page_Width to propose font size ####
#FUN-650017
              LET l_len = g_len + g_left_margin
              CASE
                   WHEN l_len <= 100
                        LET l_msg = "A4-10"
                   WHEN l_len > 100 AND l_len <= 115
                        LET l_msg = "A4-9"
                   WHEN l_len > 115 AND l_len <= 125
                        LET l_msg = "A4-8"
                   WHEN l_len > 125 AND l_len <= 145
                        LET l_msg = "A4-7"
                   WHEN l_len > 145 AND l_len <= 170
                        LET l_msg = "A4-6"
                   WHEN l_len > 170 AND l_len <= 200
                        LET l_msg = "A4-5"
              END CASE
              CASE
                   WHEN l_len <= 135
                        LET l_msg = l_msg CLIPPED," 80-8"
                   WHEN l_len > 135 AND l_len <= 150
                        LET l_msg = l_msg CLIPPED," 80-7"
                   WHEN l_len > 150 AND l_len <= 170
                        LET l_msg = l_msg CLIPPED," 80-6"
                   WHEN l_len > 170 AND l_len <= 200
                        LET l_msg = l_msg CLIPPED," 80-5"
              END CASE
              CASE
                   WHEN l_len <= 240
                        LET l_msg = l_msg CLIPPED," 132-8"
                   WHEN l_len > 240 AND l_len <= 265
                        LET l_msg = l_msg CLIPPED," 132-7"
                   WHEN l_len > 265 AND l_len <= 300
                        LET l_msg = l_msg CLIPPED," 132-6"
           #        WHEN g_len > 300 AND g_len <= 345
                   WHEN l_len > 300
                        LET l_msg = l_msg CLIPPED," 132-5"
              END CASE
#### By page_Width to propose font size ####
 
 ##########  No.MOD-490130  ##########
       MESSAGE cl_getmsg('lib-222',g_lang) CLIPPED,":",p_name CLIPPED," ",
               cl_getmsg('lib-223',g_lang) CLIPPED,":",l_len USING "<<<"," ",
               cl_getmsg('lib-224',g_lang) CLIPPED,":",g_row_cnt USING "<<<<<<"," ",
               cl_getmsg('lib-231',g_lang) CLIPPED,":",l_msg CLIPPED
 ##########  No.MOD-490130  ##########
#END FUN-650017
 
              CALL cl_ui_locale("cl_prt_m")
              IF g_gui=3 THEN   ###http不能執行終端機印表
                #### No.FUN-6B0023 start ####
                #CALL cl_set_combo_items("choice3", "V,L", "V:VPrint,L:Local Printer List")  ## FUN-5C0010 ##
                #LET l_choice3='V'     ## FUN-5C0010 ##
                CALL cl_set_combo_items("choice3", "L", "L:GDC Local Printer List")  #No.TQC-7C0150
                LET l_choice3='L'
                #### No.FUN-6B0023 End ####
 
              ELSE
                 LET l_choice3='1'
              END IF
 
 ### MOD-580044 ###
        LET l_2header = 0
        FOR l_cnt=1 to g_zaa.getLength()
           IF g_zaa[l_cnt].zaa15 > 1  THEN
              LET l_2header = 1
              EXIT FOR
           END IF
        END FOR
### 2 header or voucher->no script ###
        #TQC-5B0170
        IF l_2header = 1 OR cl_null(g_xml_rep) OR (g_zaa_dyn.getLength() > 0)
        THEN
           #TQC-640104
           SELECT count(*) into l_cnt from gae_file
            where gae01='cl_prt_m' and gae02 = 'choice4_T' and gae03=g_lang
                  and gae11='Y'
           IF l_cnt = 0 THEN
              SELECT gae04 into l_gae04 from gae_file
               where gae01='cl_prt_m' and gae02 = 'choice4_T' and gae03=g_lang
                     and gae11='N'
           ELSE
              SELECT gae04 into l_gae04 from gae_file
               where gae01='cl_prt_m' and gae02 = 'choice4_T' and gae03=g_lang
                     and gae11='Y'
           END IF
           SELECT count(*) into l_cnt from gae_file
            where gae01='cl_prt_m' and gae02 = 'choice4_T' and gae03=g_lang
                  and gae11='Y'
           IF l_cnt = 0 THEN
              SELECT gae04 into l_gae04_s from gae_file
               where gae01='cl_prt_m' and gae02 = 'choice4_S' and gae03=g_lang
                 and gae11='N'
           ELSE
              SELECT gae04 into l_gae04_s from gae_file
               where gae01='cl_prt_m' and gae02 = 'choice4_S' and gae03=g_lang
                 and gae11='Y'
           END IF
           #END TQC-640104
           IF (g_zaa_dyn.getLength() > 0) AND (l_2header = 0)
           THEN
                CALL cl_set_combo_items("choice4", "T,D,X,H,S,P", "T:" || l_gae04 CLIPPED || ",D:Microsoft Office Word,X:Microsoft Office Excel,H:Microsoft Internet Explorer(HTML),S:" || l_gae04_s CLIPPED || ",P:Adobe Acrobat PDF")
           ELSE
#FUN-5C0113
                #TQC-640104
                CALL cl_set_combo_items("choice4", "T,D,X,H,P", "T:" || l_gae04 CLIPPED || ",D:Microsoft Office Word,X:Microsoft Office Excel,H:Microsoft Internet Explorer(HTML),P:Adobe Acrobat PDF")
                #END TQC-640104
           END IF
        ELSE
           SELECT COUNT(*) INTO l_cnt FROM zad_file
            WHERE zad01=g_prog AND zad03 = g_rlang AND zad04=g_zaa04_value
              AND zad05=g_zaa10_value AND zad06=g_zaa11_value
              AND zad07 = g_zaa17_value
           IF l_cnt = 0  OR ms_codeset.getIndexOf("UTF-8", 1) THEN #FUN-660179
               LET lw_w=ui.window.getcurrent()
               LET ln_w = lw_w.getNode()
               LET ls_items=ln_w.selectByTagName("ComboBox")
               LET ln_items = ls_items.item(3)
               LET ln_child = ln_items.getFirstChild()
               WHILE ln_child IS NOT NULL
                  LET l_name = ln_child.getAttribute("name")
                  #FUN-660179
                  IF l_name = "C" AND l_cnt = 0 THEN
                     CALL ln_items.removeChild(ln_child)
                    #EXIT WHILE
                  ELSE
                     IF l_name = "W" AND ms_codeset.getIndexOf("UTF-8", 1) THEN
                        CALL ln_items.removeChild(ln_child)
                     END IF
                  END IF
                  #END FUN-660179
 
                  LET ln_child = ln_child.getNext()
               END WHILE
           END IF
        END IF
#END FUN-5C0113
 ### MOD-580044 ###
 ######   MOD-530309   ########
### No.FUN-540062 #####
#              IF cl_null(g_xml_rep) THEN  ##No xml,no html
#                 CALL cl_set_combo_items("choice4", "T,D,X,P", "T:" || l_gae04 CLIPPED || ",D:Microsoft Office Word,X:Microsoft Office Excel,P:Adobe Acrobat PDF")
#              END IF
### No.FUN-540062 #####
 ######   MOD-530309   ########
      END CASE
 
### FUN-580164 Start ###
      #對頁數，起始結束頁等變量賦初始值
      IF g_page_line = 0 THEN  ## TQC-5B0069 ##
         LET l_pagenum = 1     ## TQC-5B0069 ##
         LET l_startpage = 1   ## TQC-5B0069 ##
         LET l_endpage = 1     ## TQC-5B0069 ##
      ELSE                     ## TQC-5B0069 ##
         LET l_pagenum = g_row_cnt / g_page_line
         IF ( g_row_cnt MOD l_pagenum ) THEN
            LET l_pagenum = l_pagenum + 1
         END IF
         LET l_endpage = l_pagenum
         IF l_endpage > 0 THEN LET l_startpage = 1
            ELSE LET l_startpage = 0
         END IF
      END IF                    ## TQC-5B0069 ##
      DISPLAY l_pagenum   TO FORMONLY.pagenum
      DISPLAY l_startpage TO FORMONLY.startpage
      DISPLAY l_endpage   TO FORMONLY.endpage
### FUN-580164 End ###
 
### FUN-590079 Start ###
      IF g_len <> 0 and g_len is not null THEN  ###  TQC-590051  ###
         LET l_channel = base.Channel.create()
#        LET l_cmd = "unset LANG; cat ", p_name CLIPPED, "|wc -L"
 
        #TQC-5B0188
        #LET l_cmd = "unset LANG;awk ' BEGIN { maxlen = 0 } { maxlen=(length($0) > maxlen)?length($0):maxlen } END { print maxlen } ' ",p_name CLIPPED
#        cat aglr903.97r|wc -L
        # CALL l_channel.openPipe(l_cmd, "r")
        # WHILE l_channel.read(l_real_len)
        # END WHILE
         CALL l_channel.openFile(p_name CLIPPED, "r")
         LET l_real_len = 0
         WHILE l_channel.read(l_str)
             LET l_cnt = FGL_WIDTH(l_str)
             IF l_cnt > l_real_len THEN
                  LET l_real_len = l_cnt
             END IF
         END WHILE
        #END TQC-5B0188
 
         CALL l_channel.close()
         #display "l_real_len",l_real_len
         #display "g_len",g_len
         #l_len = g_len + g_left_margin
         IF l_real_len <> l_len THEN    #FUN-650017
#           CALL cl_err('','lib-301',1)
         #No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','','lib-301',1)
      ELSE
         CALL cl_err('','lib-301',1)
      END IF
#No.FUN-720003--end
         END IF
      END IF
### FUN-590079 End ###
 
      #FUN-790036
      display "zv_zv08:",g_zv.zv08
      IF g_zv.zv08 ='N' THEN
         CASE
           WHEN g_zv.zv03 MATCHES "[123456789]"
                LET g_choice  = "1"
                LET l_choice2 = g_zv.zv03
           WHEN g_zv.zv03 MATCHES "[TDXIWMSPC]"
                IF g_zv.zv03 = "I" THEN
                   LET g_zv.zv03 = "H"
                END IF
                LET g_choice  = 'O'
                LET l_choice4 = g_zv.zv03
           WHEN g_zv.zv03 = "L"
                LET g_choice = "L"
                IF g_gui=3 THEN   ###http不能執行終端機印表
                   LET l_choice2 = "L"
                ELSE
                   LET l_choice3 = g_zv.zv04
                END IF
           WHEN g_zv.zv03 MATCHES "[VNJH]"
                LET g_choice = g_zv.zv03
         END CASE
      END IF
      #END #FUN-790036
 
      WHILE TRUE
           CALL FGL_DIALOG_SETFIELDORDER(FALSE)                #No.MOD-570212
        ### FUN-580164 Start ###
          INPUT g_choice,l_choice2,l_choice3,l_choice4,l_startpage,l_endpage WITHOUT DEFAULTS
           FROM FORMONLY.choice,FORMONLY.choice2,FORMONLY.choice3,
                FORMONLY.choice4,FORMONLY.startpage,FORMONLY.endpage ATTRIBUTE(UNBUFFERED)
 
              ON CHANGE FORMONLY.choice
                #IF ( g_choice = 'O') OR ( g_choice = 'H') THEN #No.MOD-6C0165
                IF ( g_choice = 'O') OR ( g_choice = 'H') OR ( g_choice = 'N') THEN #No.MOD-6C0165
                   CALL cl_set_comp_visible("group02", FALSE)
                ELSE
                   CALL cl_set_comp_visible("group02", TRUE)
                END IF
        ### FUN-580164 End ###
 
              BEFORE FIELD FORMONLY.choice2
                  LET g_choice='1'
                  CALL cl_set_comp_visible("group02", TRUE) ### FUN-580164  ###
 
              BEFORE FIELD FORMONLY.choice3
                  LET g_choice='L'
                  CALL cl_set_comp_visible("group02", TRUE) ### FUN-580164  ###
 
              BEFORE FIELD FORMONLY.choice4
                  LET g_choice='O'
                  CALL cl_set_comp_visible("group02", FALSE) ### FUN-580164  ###
 
              AFTER FIELD FORMONLY.startpage
                  #對起始頁數以及對應的結束頁數進行規範調整
                  IF l_startpage < 1 THEN
                     LET l_startpage = 1
                     DISPLAY l_startpage TO FORMONLY.startpage
#                    CALL cl_err('','lib-297',0)
                     #No.FUN-720003--begin
                     IF g_bgerr THEN
                     CALL s_errmsg('','','','lib-297',0)
                     ELSE
                     CALL cl_err('','lib-297',0)
                     END IF
                     #No.FUN-720003--end
                  END IF
                  IF l_startpage > l_pagenum THEN
                     LET l_startpage = l_pagenum
                     DISPLAY l_startpage TO FORMONLY.startpage
#                    CALL cl_err('','lib-297',0)
                     #No.FUN-720003--begin
                     IF g_bgerr THEN
                     CALL s_errmsg('','','','lib-297',0)
                     ELSE
                     CALL cl_err('','lib-297',0)
                     END IF
                     #No.FUN-720003--end
                  END IF
                  IF l_startpage > l_endpage THEN
                     LET l_endpage = l_startpage
                     DISPLAY l_endpage TO FORMONLY.endpage
#                    CALL cl_err('','lib-297',0)
                     #No.FUN-720003--begin
                     IF g_bgerr THEN
                     CALL s_errmsg('','','','lib-297',0)
                     ELSE
                     CALL cl_err('','lib-297',0)
                     END IF
                     #No.FUN-720003--end
                  END IF
 
              AFTER FIELD FORMONLY.endpage
                  #對起始頁數以及對應的結束頁數進行規範調整
                  IF l_endpage > l_pagenum THEN
                     LET l_endpage = l_pagenum
                     DISPLAY l_endpage TO FORMONLY.endpage
#                    CALL cl_err('','lib-297',0)
                     #No.FUN-720003--begin
                     IF g_bgerr THEN
                     CALL s_errmsg('','','','lib-297',0)
                     ELSE
                     CALL cl_err('','lib-297',0)
                     END IF
                     #No.FUN-720003--end
                  END IF
                  IF l_endpage < 1 THEN
                     LET l_endpage = 1
                     DISPLAY l_endpage TO FORMONLY.endpage
#                    CALL cl_err('','lib-297',0)
                     #No.FUN-720003--begin
                     IF g_bgerr THEN
                     CALL s_errmsg('','','','lib-297',0)
                     ELSE
                     CALL cl_err('','lib-297',0)
                     END IF
                     #No.FUN-720003--end
                  END IF
                  IF l_endpage < l_startpage THEN
                     LET l_startpage = l_endpage
                     DISPLAY l_startpage TO FORMONLY.endpage
#                    CALL cl_err('','lib-297',0)
                     #No.FUN-720003--begin
                     IF g_bgerr THEN
                     CALL s_errmsg('','','','lib-297',0)
                     ELSE
                     CALL cl_err('','lib-297',0)
                     END IF
                     #No.FUN-720003--end
                  END IF
 
               ON IDLE g_idle_seconds  ### TQC-610093 start###
                  CALL cl_on_idle()
                  CONTINUE INPUT       ### TQC-610093 end###
 
               #No.TQC-860016 --start--
               ON ACTION controlg
                  CALL cl_cmdask()
 
               ON ACTION about
                  CALL cl_about()
 
               ON ACTION help
                  CALL cl_show_help()
               #No.TQC-860016 ---end---
 
          END INPUT
           CALL FGL_DIALOG_SETFIELDORDER(TRUE)                 #No.MOD-570212
 
          IF INT_FLAG THEN
             LET INT_FLAG = 0
             EXIT WHILE
          END IF
 
### FUN-580164 Start ###
      #將原報表?ず琱憟馧ぁ魖鴗@個臨時文件中
          IF ( g_choice <> "O") AND ( g_choice <> "H") AND ( g_choice <> "N") THEN  #MOD-780018 add "N"
             LET p_name_tmp = p_name CLIPPED,".org"
             LET l_cmd = "mv ",p_name CLIPPED," ",p_name_tmp
             RUN l_cmd
             #No.FUN-9B0062  -- start --
             IF os.Path.separator() = "/" THEN        #Unix 環境
                LET l_cmd = "chmod 666 ",p_name_tmp CLIPPED," 2>/dev/null"  
                RUN l_cmd
             ELSE
                LET l_cmd = "attrib -r ",p_name_tmp CLIPPED,"  >nul 2>nul"  #MOD-660063
                RUN l_cmd                                                   #MOD-660063
             END IF
             IF os.Path.delete(p_name CLIPPED) THEN
             END IF
             #No.FUN-9B0062  -- end --

             LET l_channel = base.Channel.Create()
             LET l_channel1 = base.Channel.Create()
             CALL l_channel.OpenFile(p_name_tmp CLIPPED , "r")
             CALL l_channel.SetDelimiter("")
             CALL l_channel1.OpenFile(p_name CLIPPED , "a")
             CALL l_channel1.SetDelimiter("")
             LET l_line_cnt = 0
 
             #將起止頁數轉換成起止行數計算
             LET l_start_line = (l_startpage - 1) * g_page_line + 1
             IF l_endpage = l_pagenum THEN
                LET l_end_line = g_row_cnt
             ELSE
                LET l_end_line = l_endpage * g_page_line
             END IF
 
             #從備份文件中取得需要的信息并生成到新的文件中
             WHILE l_channel.read(l_str)
                LET l_line_cnt = l_line_cnt + 1
                IF l_line_cnt >= l_start_line AND l_line_cnt <= l_end_line THEN
                   CALL l_channel1.write(l_str)
                END IF
             END WHILE
             CALL l_channel.close()     ### MOD-660063  ###
             CALL l_channel1.close()    ### MOD-660063  ###
          END IF
### FUN-580164 End ###
 
          ### MOD-660063 START ###
          IF (tsconv_cmd IS NULL) or
             ((g_choice <> "V") AND ( g_choice <> "O") AND ( g_choice <> "H") AND( g_choice <> "N")) #TQC-770049   #MOD-780018 modify "N"
            #((tsconv_cmd IS NULL) AND ( g_choice <> "O") AND ( g_choice <> "H")) #TQC-6B0113   #TQC-770049 mark
           THEN
             CALL cl_prt_convert(p_name)
             IF tsconv_cmd IS NOT NULL THEN
                IF tsconv_cmd = "gb2312_to_big5" THEN
                  LET ms_codeset = "BIG5"
                ELSE
                  LET ms_codeset = "GB2312"
                END IF
             END IF
          END IF
          ### MOD-660063 END ###
 
          CASE g_choice
               WHEN '1' IF cl_prt_chk('1') THEN
                           CALL cl_prt_1(p_name,p_copies,l_choice2)
                        END IF
               WHEN 'L' IF cl_prt_chk('L') THEN
                           LET g_choice=l_choice3
                           IF g_gui=3 THEN    ## http ##
                              IF l_choice3='L' THEN
                                 IF cl_null(fgl_getenv("DBPRINT")) THEN
                                   CALL cl_err_msg(NULL,"9064",NULL,-1)
                                    EXIT CASE
                                 ELSE
                                    ### MOD-5B0314 ###
                                    IF tsconv_cmd IS NULL THEN
                                       CALL cl_prt_l3(p_name,p_copies)
                                    ELSE
                                       LET  p_name_ts= p_name CLIPPED,".ts"
                                       CALL cl_prt_l3(p_name_ts,p_copies)
                                    END IF
                                    ### MOD-5B0314 ###
                                 END IF
                              ### FUN-5C0010 start ###
                              ### No.FUN-6B0023 mark start ###
                              # ELSE   ##VPrint
                              #   IF tsconv_cmd IS NULL THEN
                              #      CALL cl_prt_vprint(p_name,p_copies)
                              #   ELSE
                              #      LET  p_name_ts= p_name CLIPPED,".ts"
                              #      CALL cl_prt_vprint(p_name_ts,p_copies)
                              #   END IF
                              ### No.FUN-6B0023 mark end ###
                              END IF
                              ### FUN-5C0010 end ###
                              EXIT CASE
                           ELSE
                              IF g_choice = "9" THEN
                                 ### FUN-5C0010 start ###
                                 IF cl_null(fgl_getenv("DBPRINT")) THEN
                                    CALL cl_err_msg(NULL,"9064",NULL,-1)
                                    EXIT CASE
                                 END IF
                                 ### FUN-5C0010 end ###
                                 ### MOD-5B0314 ###
                                 IF tsconv_cmd IS NULL THEN
                                    CALL cl_prt_l3(p_name,p_copies)
                                 ELSE
                                    LET  p_name_ts= p_name CLIPPED,".ts"
                                    CALL cl_prt_l3(p_name_ts,p_copies)
                                 END IF
                                 ### MOD-5B0314 ###
                              ELSE
                                  CALL cl_prt_l(p_name,p_copies)
                                  #MOD-640008
                                  MESSAGE cl_getmsg('lib-222',g_lang) CLIPPED,":",p_name CLIPPED," ",
                                          cl_getmsg('lib-223',g_lang) CLIPPED,":",l_len USING "<<<"," ", #FUN-650017
                                          cl_getmsg('lib-224',g_lang) CLIPPED,":",g_row_cnt USING "<<<<<<"," ",
                                          cl_getmsg('lib-231',g_lang) CLIPPED,":",l_msg CLIPPED
                                  #END MOD-640008
 
                              END IF
                           END IF
                        END IF
               #FUN-630099
               WHEN 'O' IF l_choice4 = 'H' THEN
                           LET l_choice4='I'
                        END IF
                        IF cl_prt_chk(l_choice4) THEN
                           IF l_choice4 = 'I' THEN
                              LET l_choice4='H'
                           END IF
                           IF not cl_null(g_xml_rep) THEN
                              CALL cl_prt_o(p_name,l_choice4)
                           ELSE
                              CALL cl_prt_o1(p_name,l_choice4)
                           END IF
                        ELSE
                           IF l_choice4 = 'I' THEN
                               LET l_choice4='H'
                           END IF
                        END IF
               #END FUN-630099
               WHEN 'F' IF cl_prt_chk('F') THEN
                           CALL cl_prt_f(p_name,'')
                        END IF
               WHEN 'V' IF cl_prt_chk('V') THEN
                           CALL cl_prt_v(p_name)
                        END IF
               ### No.FUN-6B0023 start ###
               WHEN 'N' IF cl_prt_chk('N') THEN
                          #MOD-780018-modify-begin
                          # IF tsconv_cmd IS NULL THEN
                          #    CALL cl_prt_vprint(p_name,p_copies)
                          # ELSE
                          #    LET  p_name_ts= p_name CLIPPED,".ts"
                          #    CALL cl_prt_vprint(p_name_ts,p_copies)
                          # END IF
                           IF tsconv_cmd IS NULL THEN
                              CALL cl_prt_vprint(p_name,p_copies)
                           ELSE
                              LET  p_name_ts= p_name CLIPPED,".ts"
                              #No.FUN-9B0062  -- start --
                              IF os.Path.separator() = "/" THEN        #Unix 環境
                                 LET l_cmd = "cp ",os.Path.join(FGL_GETENV("TEMPDIR") CLIPPED,p_name_ts CLIPPED),      #FUN-8B0011
                                               " ",os.Path.join(FGL_GETENV("TEMPDIR") CLIPPED,p_name CLIPPED||".vpt")
                                 RUN l_cmd
                                 LET  p_name_ts= p_name CLIPPED,".vpt"
                                 LET l_cmd = "chmod 777 ",p_name_ts CLIPPED," 2>/dev/null"
                                 RUN l_cmd
                                 CALL cl_prt_convert(p_name_ts)
                                 CALL cl_prt_vprint(p_name_ts,p_copies)
                              ELSE
                                 IF os.Path.copy( os.Path.join(FGL_GETENV("TEMPDIR"),p_name_ts CLIPPED),
                                    os.Path.join(FGL_GETENV("TEMPDIR"),p_name CLIPPED||".vpt")) THEN END IF
                                 LET  p_name_ts= p_name CLIPPED,".vpt"
                                 LET l_cmd = "attrib -r ",p_name_ts CLIPPED,"  >nul 2>nul"
                                 RUN l_cmd
                                 CALL cl_prt_convert(p_name_ts)
                                 CALL cl_prt_vprint(p_name_ts,p_copies)
                              END IF
                              IF os.Path.delete(p_name_ts CLIPPED||".ts") THEN
                              END IF
                              #No.FUN-9B0062  -- end --

                              LET  p_name_ts= p_name CLIPPED,".ts"
                           END IF
                          #MOD-780018-modify-end
                        END IF
               ### No.FUN-6B0023 end ###
               WHEN 'J' IF cl_prt_chk('J') THEN
                           CALL cl_prt_j(p_name,'')
                        END IF
               #WHEN 'C' CALL cl_prt_c(p_name)              #FUN-5C0113
               #FUN-630099
               WHEN 'H' IF cl_prt_chk('H') THEN
                               CALL cl_vout(p_name)
                        END IF
               #END FUN-630099
               WHEN 'B' IF cl_prt_chkbrowser() THEN
                           CALL cl_prt_browser()
                        END IF
               WHEN 'W' IF cl_prt_chkbrowser() THEN
                           CALL cl_prt_webp()
                        END IF
          END CASE
      ### FUN-580164 ### 還原
          #IF ( g_choice <> "O") AND ( g_choice <> "H") THEN #No.MOD-6C0165
          IF ( g_choice <> "O") AND ( g_choice <> "H") AND ( g_choice <> "N") THEN #No.MOD-6C0165

             #No.FUN-9B0062  -- start --
             IF os.Path.delete(p_name CLIPPED) THEN
             END IF
             IF os.Path.copy( os.Path.join(FGL_GETENV("TEMPDIR"),p_name_tmp CLIPPED),
                os.Path.join(FGL_GETENV("TEMPDIR"),p_name CLIPPED)) THEN
             END IF
             IF os.Path.separator() = "/" THEN        #Unix 環境
                LET l_cmd = "chmod 777 ", p_name
                RUN l_cmd
             END IF
             #No.FUN-9B0062  -- end --

          END IF
      ### FUN-580164 ### 還原
      END WHILE
      CLOSE WINDOW cl_prt_m_w
   END IF
 
END FUNCTION
 
##################################################
# Descriptions...: 在Java Client透過Web Printer 輸出
# Date & Author..:
# Input Parameter: none
# Return code....:
##################################################
 
FUNCTION cl_prt_webp()
    DEFINE l_server     LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
           l_url        LIKE type_file.chr1000 #No.FUN-690005 VARCHAR(1000)
 
    LET g_cmd = "cat webph.htm > T", g_name CLIPPED
    RUN g_cmd
    LET g_cmd = "cat ", g_name CLIPPED, " >> T", g_name CLIPPED
    RUN g_cmd
    LET g_cmd = "cat webpe.htm >> T", g_name CLIPPED
    RUN g_cmd
    LET l_server = fgl_getenv("WEB")   # Web Server IP
    LET l_url = "http://",l_server CLIPPED,"/out/T", g_name CLIPPED
 
    CALL cl_prt_url(l_url)
    #No.FUN-9B0062  -- start --
    IF os.Path.separator() = "/" THEN        #Unix 環境
       LET g_cmd = "rm -f T", g_name CLIPPED
    ELSE
       LET g_cmd = "def /f T", g_name CLIPPED
    END IF
    #No.FUN-9B0062  -- end --
    RUN g_cmd
END FUNCTION
 
##################################################
# Descriptions...: 在Java Client透過瀏覽器輸出
# Date & Author..:
# Input Parameter: none
# Return code....:
##################################################
 
FUNCTION cl_prt_browser()
    DEFINE l_server     LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
           l_url        LIKE type_file.chr1000 #No.FUN-690005 VARCHAR(1000)
 
    LET l_server = fgl_getenv("WEB")   # Web Server IP
    LET l_url = "http://",l_server CLIPPED,"/out/", g_name CLIPPED
    CALL cl_prt_url(l_url)
END FUNCTION
 
##################################################
# Descriptions...: 在Java Client觸發瀏覽器作對應的輸出
# Date & Author..:
# Input Parameter: p_url
# Return code....:
##################################################
 
FUNCTION cl_prt_url(p_url)
    DEFINE p_url       LIKE type_file.chr1000#No.FUN-690005  VARCHAR(1000)
 
    OPEN WINDOW url_w AT 8,24 WITH FORM "azz/42f/url" ATTRIBUTE(STYLE="lib")
    DISPLAY p_url TO u
 
    CASE
        WHEN g_lang = '0'
             MENU ""
                  COMMAND "Esc.結束" EXIT MENU
                  COMMAND KEY (F12) EXIT MENU
                ON IDLE g_idle_seconds
                   CALL cl_on_idle()
                   CONTINUE MENU
 
                #No.TQC-860016 --start--
                ON ACTION controlg
                   CALL cl_cmdask()
 
                ON ACTION about
                   CALL cl_about()
 
                ON ACTION help
                   CALL cl_show_help()
                #No.TQC-860016 ---end---
             END MENU
        WHEN g_lang = '2'
             MENU ""
                  COMMAND "Esc.結束" EXIT MENU
                  COMMAND KEY (F12) EXIT MENU
                ON IDLE g_idle_seconds
                   CALL cl_on_idle()
                   CONTINUE MENU
 
                #No.TQC-860016 --start--
                ON ACTION controlg
                   CALL cl_cmdask()
 
                ON ACTION about
                   CALL cl_about()
 
                ON ACTION help
                   CALL cl_show_help()
                #No.TQC-860016 ---end---
             END MENU
        OTHERWISE
             MENU ""
                  COMMAND "Exit" EXIT MENU
                  COMMAND KEY (F12) EXIT MENU
                ON IDLE g_idle_seconds
                   CALL cl_on_idle()
                   CONTINUE MENU
 
                #No.TQC-860016 --start--
                ON ACTION controlg
                   CALL cl_cmdask()
 
                ON ACTION about
                   CALL cl_about()
 
                ON ACTION help
                   CALL cl_show_help()
                #No.TQC-860016 ---end---
             END MENU
    END CASE
 
    IF INT_FLAG THEN LET INT_FLAG = 0 END IF
    CLOSE WINDOW url_w
END FUNCTION
 
##################################################
# Descriptions...: 檢查瀏覽器環境是否完成
# Date & Author..:
# Input Parameter: none
# Return code....:
##################################################
 
FUNCTION cl_prt_chkbrowser()
    DEFINE l_browser   LIKE type_file.chr1000 #No.FUN-690005 VARCHAR(100)
 
 
    LET l_browser = fgl_getenv('WEB')
    IF cl_null(l_browser) THEN
#      CALL cl_err('Please set up Web Server first.', '!', 1)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','Please set up Web Server first.', '!', 1)
      ELSE
         CALL cl_err('Please set up Web Server first.', '!', 1)
      END IF
#No.FUN-720003--end
       RETURN 0
    ELSE
       RETURN 1
    END IF
END FUNCTION
 
##################################################
# Descriptions...: 檢查 Crystal Report環境是否完成
# Date & Author..:
# Input Parameter: none
# Return code....:
##################################################
 
FUNCTION cl_prt_chkcr()
    DEFINE l_cr    LIKE type_file.chr1000#No.FUN-690005 VARCHAR(100)
 
 
    LET l_cr = fgl_getenv('CRIP')
    IF cl_null(l_cr) THEN
#      CALL cl_err('Please set up Crystal Report Server first.', '!', 1)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','Please set up Crystal Report Server first.', '!', 1)
      ELSE
         CALL cl_err('Please set up Crystal Report Server first.', '!', 1)
      END IF
#No.FUN-720003--end
       RETURN 0
    ELSE
       RETURN 1
    END IF
END FUNCTION
 
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name, p_choice
# Return code....:
##################################################
 
FUNCTION cl_prt_o(p_name, p_choice)
    DEFINE p_name          LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
           p_choice        LIKE type_file.chr1    #No.FUN-690005 VARCHAR(1)
    DEFINE l_url           STRING,
           l_file          STRING,
           l_status        LIKE type_file.num10,  #No.FUN-690005 INTEGER,
           l_print_cmd     LIKE type_file.chr1000,#No.FUN-690005 VARCHAR(40),
           input_name      STRING
    DEFINE p_name_ts       STRING     ### MOD-5B0314 ###
 
     LET input_name = p_name
         display input_name
    CASE p_choice
         WHEN 'T' LET l_file = input_name CLIPPED, ".txt"
         WHEN 'D' CALL cl_trans_xml(g_xml_rep,"6")
         WHEN 'X' CALL cl_trans_xml(g_xml_rep,"1")
         WHEN 'W' CALL cl_trans_xml(g_xml_rep,"3")     #FUN-660179
         WHEN 'C' CALL cl_trans_xml(g_xml_rep,"9")     #FUN-5C0113
                  CALL cl_contview(g_xml_rep)          #FUN-5C0113
         WHEN 'H' CALL cl_trans_xml(g_xml_rep,"2")
         WHEN 'M' CALL cl_trans_xml(g_xml_rep,"7")     #FUN-570203
         WHEN 'S' CALL cl_trans_xml(g_xml_rep,"8")     #FUN-570203
         WHEN 'P'
                  ### MOD-5B0314 ###
                  IF tsconv_cmd IS NULL THEN
                     CALL cl_prt_p(p_name)
                  ELSE
                     LET  p_name_ts= p_name CLIPPED,".ts"
                     CALL cl_prt_p(p_name_ts)
                  END IF
                  ### MOD-5B0314 ###
         WHEN 'L' CALL cl_trans_xml(g_xml_rep,"5")
    END CASE
    #TQC-6B0006
    IF INT_FLAG THEN
       LET INT_FLAG = 0
       RETURN
    END IF
    #END TQC-6B0006
 
 
    IF p_choice = "T" THEN
       ### MOD-660063 START ###
       IF tsconv_cmd IS NULL THEN
          #No.FUN-9B0062  -- start --
          IF os.Path.separator() = "/" THEN        #Unix 環境
             LET l_url = "cp -f " || input_name CLIPPED || " " || l_file CLIPPED
             RUN l_url
             display l_url
             LET l_url = "chmod 666 ",l_file CLIPPED," 2>/dev/null"
          ELSE
             IF os.Path.copy( os.Path.join(FGL_GETENV("TEMPDIR"),input_name CLIPPED),
                os.Path.join(FGL_GETENV("TEMPDIR"),l_file CLIPPED)) THEN END IF
             LET l_url = "attrib -r ",l_file CLIPPED,"  >nul 2>nul"
          END IF
          #No.FUN-9B0062  -- end --
          RUN l_url
          LET l_url = FGL_GETENV("FGLASIP") CLIPPED, "/tiptop/out/", l_file
       ELSE
          #No.FUN-9B0062  -- start --
          IF os.Path.separator() = "/" THEN        #Unix 環境
             LET l_url = "cp -f " || input_name CLIPPED || ".ts " || l_file CLIPPED
             RUN l_url
             display l_url
             LET l_url = "chmod 666 ",l_file CLIPPED," 2>/dev/null"
          ELSE
             IF os.Path.copy( os.Path.join(FGL_GETENV("TEMPDIR"),input_name CLIPPED || ".ts"),
                os.Path.join(FGL_GETENV("TEMPDIR"),l_file CLIPPED)) THEN END IF
             LET l_url = "attrib -r ",l_file CLIPPED,"  >nul 2>nul"
          END IF
          #No.FUN-9B0062  -- end --
          RUN l_url
          display l_url
          CALL cl_prt_convert(l_file CLIPPED)
          LET l_url = FGL_GETENV("FGLASIP") CLIPPED, "/tiptop/out/", l_file CLIPPED
       END IF
       #LET l_url = "cp -f " || input_name CLIPPED || " " || l_file CLIPPED
       #RUN l_url
       #display l_url
       #LET l_url = FGL_GETENV("FGLASIP") CLIPPED, "/tiptop/out/", l_file
       ### MOD-660063 END ###
 ##No.MOD-530309
#    CALL ui.Interface.frontCall("standard",
#                                "execute",
#                                ["\"C:\\Program Files\\Internet Explorer\\IEXPLORE.EXE\" \"" || l_url || "\"", 0],
#                               [l_status])
       CALL ui.Interface.frontCall("standard",
                                   "execute",
                                   ["EXPLORER \"" || l_url || "\"",0],
                                   [l_status])
 ##No.MOD-530309
     IF STATUS THEN
#       CALL cl_err("Front End Call failed.", STATUS, 1)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',"Front End Call failed.", STATUS, 1)
      ELSE
         CALL cl_err("Front End Call failed.", STATUS, 1)
      END IF
#No.FUN-720003--end
        RETURN
     END IF
     IF NOT l_status THEN
#       CALL cl_err("Application execution failed.", '!', 1)
     #No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',"Application execution failed.", '!', 1)
      ELSE
         CALL cl_err("Application execution failed.", '!', 1)
      END IF
     #No.FUN-720003--end
 
        RETURN
     END IF
    END IF
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name, p_choice
# Return code....:
##################################################
 
FUNCTION cl_prt_o1(p_name, p_choice)
    DEFINE p_name          LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
           p_choice        LIKE type_file.chr1    #No.FUN-690005 VARCHAR(1)
    DEFINE l_url           STRING,
           l_file          STRING,
           l_cmd           STRING,
           l_status        LIKE type_file.num10,  #No.FUN-690005 INTEGER,
           l_print_cmd     LIKE type_file.chr1000 #No.FUN-690005 VARCHAR(40)
    DEFINE p_name_ts       string     ### MOD-5B0314 ###
 
    CASE p_choice
         WHEN 'T' LET l_file = p_name CLIPPED, ".txt"
         WHEN 'D' LET l_file = p_name CLIPPED, ".doc"
#MOD-650122
         WHEN 'X'
                  IF tsconv_cmd IS NULL THEN
                     CALL cl_prt_htm(p_name,"x")                #FUN-540062
                  ELSE
                     LET  p_name_ts= p_name CLIPPED,".ts"
                     CALL cl_prt_htm(p_name_ts,"x")                #FUN-540062
                  END IF
                  RETURN
         WHEN 'H'
                  IF tsconv_cmd IS NULL THEN
                     CALL cl_prt_htm(p_name,"h")                #FUN-540062
                  ELSE
                     LET  p_name_ts= p_name CLIPPED,".ts"
                     CALL cl_prt_htm(p_name_ts,"h")                #FUN-540062
                  END IF
                  RETURN
#END MOD-650122
#        WHEN 'X' LET l_file = p_name CLIPPED, ".xls" #FUN-540062
#        WHEN 'H' LET l_file = p_name CLIPPED, ".htm"
         WHEN 'P'
                  ### MOD-5B0314 ###
                  IF tsconv_cmd IS NULL THEN
                     CALL cl_prt_p(p_name)
                  ELSE
                     LET  p_name_ts= p_name CLIPPED,".ts"
                     CALL cl_prt_p(p_name_ts)
                  END IF
                  ### MOD-5B0314 ###
                  RETURN
    END CASE
 
    IF p_choice MATCHES "[TDP]" THEN
       ### MOD-660063 START ###
       IF tsconv_cmd IS NULL THEN
          #No.FUN-9B0062  -- start --
          IF os.Path.separator() = "/" THEN        #Unix 環境
             LET l_url = "cp -f " || p_name CLIPPED || " " || l_file CLIPPED
             display l_url
             RUN l_url
             LET l_cmd = "chmod 777 ", l_file
          ELSE
             IF os.Path.copy( os.Path.join(FGL_GETENV("TEMPDIR"),p_name CLIPPED),
                os.Path.join(FGL_GETENV("TEMPDIR"),l_file CLIPPED)) THEN END IF
             LET l_cmd = "attrib -r ", l_file
          END IF
          #No.FUN-9B0062  -- end --
          RUN l_cmd
          LET l_url = FGL_GETENV("FGLASIP") CLIPPED, "/tiptop/out/", l_file
          display l_url
       ELSE
          #No.FUN-9B0062  -- start --
          IF os.Path.separator() = "/" THEN        #Unix 環境
             LET l_url = "cp -f " || p_name CLIPPED || ".ts " || l_file CLIPPED
             RUN l_url
             LET l_url = "chmod 666 ",l_file CLIPPED," 2>/dev/null"
          ELSE
             IF os.Path.copy( os.Path.join(FGL_GETENV("TEMPDIR"),p_name CLIPPED || ".ts" ),
                os.Path.join(FGL_GETENV("TEMPDIR"),l_file CLIPPED)) THEN END IF
             LET l_url = "attrib -r ",l_file CLIPPED,"  >nul 2>nul"
          END IF
          #No.FUN-9B0062  -- end --
          RUN l_url
          display l_url
          CALL cl_prt_convert(l_file CLIPPED)
          LET l_url = FGL_GETENV("FGLASIP") CLIPPED, "/tiptop/out/", l_file CLIPPED
       END IF
       ### MOD-660063 END ###
        ##No.MOD-530309
     # CALL ui.Interface.frontCall("standard",
     #                             "execute",
     #                             ["\"C:\\Program Files\\Internet Explorer\\IEXPLORE.EXE\" \"" || l_url || "\"", 0],
     #                             [l_status])
       CALL ui.Interface.frontCall("standard",
                                   "shellexec",
                                   ["EXPLORER \"" || l_url || "\""],
                                   [l_status])
 
        ## END No.MOD-530309
       IF STATUS THEN
#         CALL cl_err("Front End Call failed.", STATUS, 1)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',"Front End Call failed.", STATUS, 1)
      ELSE
         CALL cl_err("Front End Call failed.", STATUS, 1)
      END IF
#No.FUN-720003--end
          RETURN
       END IF
       IF NOT l_status THEN
#         CALL cl_err("Application execution failed.", '!', 1)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',"Application execution failed.", '!', 1)
      ELSE
         CALL cl_err("Application execution failed.", '!', 1)
      END IF
#No.FUN-720003--end
          RETURN
       END IF
    ELSE
#       CALL cl_err("Sorry, this function isn't yet implement.", '!', 1)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',"Sorry, this function isn't yet implement.", '!', 1)
      ELSE
         CALL cl_err("Sorry, this function isn't yet implement.", '!', 1)
      END IF
#No.FUN-720003--end
    END IF
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_name,p_maillist
# Return code....:
##################################################
 
FUNCTION cl_prt_j(p_name,p_maillist)
   DEFINE p_name        LIKE type_file.chr20,  #No.FUN-690005 VARCHAR(20),
          p_maillist  	STRING,
         #l_zz02        LIKE zz_file.zz02 #TQC-740155
          l_gaz03       LIKE gaz_file.gaz03 #TQC-740155
   DEFINE ls_receiver   STRING,
          ls_cc         STRING,
          ls_bcc        STRING
   DEFINE lc_ze03       LIKE ze_file.ze03
   DEFINE ls_para               STRING              #No.FUN-570132
   DEFINE ls_context            STRING              #No.FUN-570132
   DEFINE ls_temp_path          STRING              #No.FUN-570132
   DEFINE ls_context_file       STRING              #No.FUN-570132
   DEFINE li_i                  LIKE type_file.num5     #No.FUN-690005 SMALLINT   #No.FUN-570132
   DEFINE l_cmd                 STRING              #No.FUN-570132
   DEFINE l_cnt         LIKE type_file.num10        #No.FUN-7C0078
   DEFINE l_is_cr       LIKE type_file.chr1         #No.FUN-7C0078
   DEFINE l_rpturl      STRING                      #No.FUN-7C0078
   DEFINE l_attach_file STRING                      #No:TQC-AA0104  
 
   #No.FUN-7C0078 --start--
   LET l_cnt = 0
   SELECT COUNT(*) INTO l_cnt FROM zaw_file WHERE zaw01 = g_prog
   IF l_cnt > 0 THEN
      LET l_is_cr = 'Y'
   ELSE
      LET l_is_cr = 'N'
   END IF
   #No.FUN-7C0078 --end--
 
   IF g_cron_job != 'Y' THEN
      CALL cl_javamail() RETURNING ls_receiver, ls_cc, ls_bcc
      IF cl_null(ls_receiver) AND cl_null(ls_cc) AND cl_null(ls_bcc) THEN
         RETURN
      ELSE
         LET g_receiver_list = ls_receiver
         LET g_cc_list = ls_cc
         LET g_bcc_list = ls_bcc
      END IF
   END IF
 
   IF cl_null(g_receiver_list) AND cl_null(g_cc_list) AND cl_null(g_bcc_list) THEN
      RETURN
   END IF
 
  #SELECT zz02 INTO l_zz02 FROM zz_file WHERE zz01 = g_prog #TQC-740155
 
   LET l_gaz03=cl_get_progdesc(g_prog,g_lang) #TQC-740155
   LET g_xml.recipient = g_receiver_list
 
   LET g_xml.cc        = g_cc_list
 
   LET g_xml.bcc       = g_bcc_list
 
   LET g_xml.subject = cl_getmsg("lib-227",g_lang) CLIPPED," : ", l_gaz03 CLIPPED, "\(", g_prog CLIPPED, "\)",  #TQC-740155
                          cl_getmsg("lib-228",g_lang) CLIPPED,"  : ", g_company CLIPPED,
                          cl_getmsg("lib-229",g_lang) CLIPPED,"  : ", g_user CLIPPED,
                          cl_getmsg("lib-230",g_lang) CLIPPED,"  : ", g_today
   #No.FUN-570132 --start--
   IF g_cron_job = "Y" AND (NOT g_rep_err) THEN
      FOR li_i = 1 TO NUM_ARGS()
          LET ls_para = ls_para, " '", ARG_VAL(li_i), "'"
      END FOR
      LET ls_para = cl_replace_str(ls_para,"'","\"")    #No.FUN-630011
      #No.FUN-7C0078 --start--
      IF l_is_cr = 'Y' THEN
         LET ls_para = cl_replace_str(ls_para,"'","\"")
         DISPLAY ls_context #afer testing, delete
      ELSE
      #No.FUN-7C0078 --end--
         LET ls_context = cl_getmsg("lib-282",g_lang) CLIPPED,"\n\n",
                          cl_getmsg("lib-227",g_lang) CLIPPED," : " ,cl_get_progname(g_prog,g_lang),"\(",g_prog CLIPPED,"\)\n" ,
                          cl_getmsg("lib-229",g_lang) CLIPPED," : " ,g_user CLIPPED , "\n" ,
                          cl_getmsg("lib-279",g_lang) CLIPPED," : " ,TODAY," ",TIME,"\n",
                          cl_getmsg("lib-280",g_lang) CLIPPED," : " ,ls_para,"\n",
                          cl_getmsg("lib-281",g_lang) CLIPPED," : " ,cl_getmsg("lib-284",g_lang),"\n"
      END IF #No.FUN-7C0078
      LET ls_temp_path = FGL_GETENV("TEMPDIR")
      LET ls_context_file = ls_temp_path,"/report_context_" || FGL_GETPID() || ".txt"
      LET l_cmd = "echo '" || ls_context || "' > " || ls_context_file
      RUN l_cmd WITHOUT WAITING
      LET g_xml.body = ls_context_file
   END IF
 
   #IF NOT g_rep_err THEN   #No.FUN-7C0078
   IF NOT g_rep_err AND l_is_cr = 'N' THEN   #No.FUN-7C0078
      #No.FUN-630011 --start--
      LET l_cmd = "copy ",os.Path.join(FGL_GETENV("TEMPDIR") CLIPPED,p_name CLIPPED),         #FUN-8B0011
                    " ",os.Path.join(FGL_GETENV("TEMPDIR") CLIPPED,p_name CLIPPED||".txt")
      RUN l_cmd
      LET l_cmd = os.Path.join(os.Path.join(FGL_GETENV("DS4GL"),"bin"),"addcr"),
              " ",os.Path.join(FGL_GETENV("TEMPDIR") CLIPPED,p_name CLIPPED||".txt")        #FUN-8B0011
      RUN l_cmd
      ### TQC-AA0104 START ###
      IF g_cron_job = 'Y' THEN
        LET l_attach_file = p_name CLIPPED,".txt"
        CALL cl_prt_convert(l_attach_file)
      END IF
      ### TQC-AA0104 END ###
      LET g_xml.attach = os.Path.join(FGL_GETENV("TEMPDIR") CLIPPED,p_name CLIPPED||".txt") #FUN-8B0011
      #No.FUN-630011 ---end---
   END IF
   #No.FUN-570132 ---end---
 
   CALL cl_jmail()

   #No.FUN-9B0062  -- start --
   IF os.Path.delete( ls_context_file CLIPPED) THEN          #No.FUN-570132
   END IF
   #No.FUN-9B0062  -- end --

   #No.FUN-630011 --start--
   #IF NOT g_rep_err THEN   #No.FUN-7C0078
   IF NOT g_rep_err AND l_is_cr = 'N' THEN   #No.FUN-7C0078

      #No.FUN-9B0062  -- start --
      IF os.Path.delete(g_xml.attach CLIPPED) THEN
      END IF
      #No.FUN-9B0062  -- end --

   END IF
   #No.FUN-630011 ---end---
END FUNCTION
 
##################################################
# Descriptions...: Java Mail功能
# Date & Author..:
# Input Parameter: none
# Return code....:
# Modify.........: 2004/08/23 by saki
##################################################
 
FUNCTION cl_jmail()
    DEFINE l_top        STRING
    DEFINE l_tempdir    STRING
    DEFINE l_cmd        STRING
    DEFINE l_str        STRING
    DEFINE l_zx02       LIKE zx_file.zx02
    DEFINE l_zx09       LIKE zx_file.zx09
    DEFINE l_count      LIKE type_file.num5      #No.FUN-690005 SMALLINT
    DEFINE l_mlj        RECORD LIKE mlj_file.*
    DEFINE l_xml        RECORD
                           file         STRING,  #XML檔名(不含路徑,檔案放置在os.Path.join(FGL_GETENV("TEMPDIR")底下)
                           mailserver   STRING,  #MAIL SERVER IP
                           serverport   STRING,  #MAIL SERVER Port
                           user         STRING,  #MAIL SERVER User
                           passwd       STRING,  #MAIL SERVER User Password
                           checkauth    LIKE type_file.chr1,    #No.FUN-690005 VARCHAR(1), #CheckAuth
                           subject      STRING,  #信件主旨
                           body         STRING,  #信件本文內容檔路徑
                           attach       STRING,  #信件附件檔路徑
                           recipient    STRING,  #收件者
                           cc           STRING,  #副本
                           bcc          STRING,  #密件副本
                           sender       STRING   #寄件者
                        END RECORD
   DEFINE lc_channel    base.Channel
   DEFINE li_inx        LIKE type_file.num10     #No.FUN-690005 INTEGER
   DEFINE ls_email      STRING
#No.FUN-740189 --start--
   DEFINE l_filepath    STRING                   #檔案路徑
   DEFINE l_codeset     STRING                   #產生的客戶端字元集
   DEFINE l_locale      STRING                   #產生的客戶端地區
   DEFINE l_strtmp      STRING
   DEFINE l_strbuf      base.StringBuffer
   DEFINE l_oldstr      STRING
#No.FUN-740189 --end--
 
########判斷是否啟動JavaMail,如無設定,則return
    SELECT * INTO l_mlj.*  FROM mlj_file WHERE mlj01 = g_prog
    IF SQLCA.SQLCODE THEN
       INITIALIZE l_mlj.* TO NULL
       SELECT * INTO l_mlj.*  FROM mlj_file WHERE mlj01 = "DEFAULT"
       IF SQLCA.SQLCODE THEN
#         CALL cl_err("","aoo-996",1)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','',"","aoo-996",1)
      ELSE
         CALL cl_err("","aoo-996",1)
      END IF
#No.FUN-720003--end
          INITIALIZE l_mlj.* TO NULL
          RETURN
       END IF
    END IF
 
    IF l_mlj.mlj07 = 'N' THEN
#      CALL cl_err('','jml-002',0)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','','jml-002',0)
      ELSE
         CALL cl_err('','jml-002',0)
      END IF
#No.FUN-720003--end
       RETURN
    END IF
 
    INITIALIZE l_xml.* TO NULL
 
#######根據自訂檔名或javamail維護作業抓出l_xml.file的值
   IF NOT cl_null(g_xml.file) THEN
      LET l_xml.file = g_xml.file
   ELSE
      IF l_mlj.mlj02 = '1' THEN
         LET l_xml.file = g_prog CLIPPED,'.xml'
      ELSE
         LET l_xml.file = FGL_GETPID() USING '<<<<<<<<<<', ".xml"
      END IF
   END IF
 
###########抓取MAIL SERVER IP default值
   IF NOT cl_null(g_xml.mailserver) THEN
      LET l_xml.mailserver = g_xml.mailserver
   ELSE
      LET l_xml.mailserver = l_mlj.mlj03
      IF cl_null(l_xml.mailserver) THEN
#         CALL cl_err('','jml-003',0)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','','jml-003',0)
      ELSE
         CALL cl_err('','jml-003',0)
      END IF
#No.FUN-720003--end
         RETURN
      END IF
   END IF
 
###########給予g_xml.serverport default值
   IF NOT cl_null(g_xml.serverport) THEN
      LET l_xml.serverport = g_xml.serverport
   ELSE
      LET l_xml.serverport = l_mlj.mlj04
   END IF
   IF cl_null(l_xml.serverport) THEN
      LET l_xml.serverport = '25'
   END IF
 
###########抓取MAIL SERVER User default值
   IF NOT cl_null(g_xml.user) THEN
      LET l_xml.user = g_xml.user
   ELSE
      LET l_xml.user = l_mlj.mlj05
      IF cl_null(l_xml.user) THEN
#        CALL cl_err('','jml-004',0)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','','jml-004',0)
      ELSE
         CALL cl_err('','jml-004',0)
      END IF
#No.FUN-720003--end
         RETURN
      END IF
   END IF
 
###########抓取MAIL SERVER User Password default值
   IF NOT cl_null(g_xml.passwd) THEN
      LET l_xml.passwd = g_xml.passwd
   ELSE
      LET l_xml.passwd = l_mlj.mlj06
      IF cl_null(l_xml.passwd) THEN
#        CALL cl_err('','jml-005',0)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','','jml-005',0)
      ELSE
         CALL cl_err('','jml-005',0)
      END IF
#No.FUN-720003--end
         RETURN
      END IF
   END IF
 
###########抓取MAIL SERVER 是否Check Auth的設定值, 於aooi999設定, 不再給自訂
   LET l_xml.checkauth = l_mlj.mlj08
   IF cl_null(l_xml.checkauth) THEN
#      CALL cl_err('','jml-006',0)
#No.FUN-720003--begin
      IF g_bgerr THEN
         CALL s_errmsg('','','','jml-006',0)
      ELSE
         CALL cl_err('','jml-006',0)
      END IF
#No.FUN-720003--end
      RETURN
   END IF
 
 
###########如果沒指定收件人mail address,則CALL cl_javamail() 開窗讓使用者輸入
#   IF cl_null(g_xml.recipient) THEN
#      CALL cl_javamail() RETURNING g_xml.recipient, g_xml.cc, g_xml.bcc
#   END IF
#   IF cl_null(g_xml.recipient) THEN
#      RETURN
#   END IF
 
###########如果沒有指定寄件人時,則從zx_file抓取
   IF cl_null(g_xml.sender) THEN          # FUN-510006
      SELECT zx02,zx09 INTO l_zx02,l_zx09 FROM zx_file WHERE zx01 = g_user
      IF ( NOT SQLCA.SQLCODE ) AND ( NOT cl_null(l_zx09) ) THEN
         LET ls_email = l_zx09
         LET li_inx = ls_email.getIndexOf("@",1)
         IF li_inx = 0 THEN
            LET l_zx09 = l_zx09 CLIPPED,"@",l_xml.mailserver CLIPPED
         END IF
         IF (cl_null(l_zx02)) THEN
            LET g_xml.sender = l_zx09 CLIPPED, ":", g_user CLIPPED
         ELSE
            LET g_xml.sender = l_zx09 CLIPPED, ":", l_zx02 CLIPPED
         END IF
      ELSE
         LET g_xml.sender = l_xml.user CLIPPED, "@", l_xml.mailserver CLIPPED,
                           ":", l_xml.user CLIPPED
      END IF
   END IF
 
#######給予l_xml.* default值
   LET l_xml.subject = g_xml.subject
   LET l_xml.body = g_xml.body
   LET l_xml.attach = g_xml.attach
   LET l_xml.recipient = g_xml.recipient
   LET l_xml.cc = g_xml.cc
   LET l_xml.bcc = g_xml.bcc
   LET l_xml.sender = g_xml.sender
 
   LET l_top = fgl_getenv("TOP")
   LET l_tempdir =fgl_getenv("TEMPDIR")
 
#########產生for javamail的xml檔############
   LET lc_channel = base.Channel.create()
   LET l_str = os.Path.join(l_tempdir CLIPPED,l_xml.file CLIPPED) #FUN-8B0011
   CALL lc_channel.openFile(l_str, "w")
   CALL lc_channel.setDelimiter("")
   # No.FUN-530064
 
#No.FUN-740189 --start--
   LET l_codeset = ms_codeset
   IF ms_codeset.getIndexOf("BIG5", 1) OR (ms_codeset.getIndexOf("GB2312", 1)
      OR ms_codeset.getIndexOf("GBK",1) OR ms_codeset.getIndexOf("GB18030",1))
   THEN
      IF ms_locale = "ZH_TW" AND g_lang = '2' THEN
         LET l_codeset = "GB2312"
      END IF
      IF ms_locale = "ZH_CN" AND g_lang = '0' THEN
         LET l_codeset = "BIG5"
      END IF
   END IF
   #DISPLAY "ms_codeset: ",ms_codeset,ASCII 10,"l_codeset: ",l_codeset #debug
#No.FUN-740189 --end--
 
#  CALL lc_channel.write("<?xml version=""1.0"" encoding=\'Big5\'?>")
  #CALL lc_channel.write("<?xml version=""1.0"" encoding=\'" || ms_codeset || "\'?>") #No.FUN-740189
   CALL lc_channel.write("<?xml version=""1.0"" encoding=""UTF-8""?>") #No.FUN-740189
   CALL lc_channel.write("<Mail>")
   CALL lc_channel.write("<Protocol>smtp</Protocol>")
   LET l_str = '<CheckAuth>',l_xml.checkauth CLIPPED,'</CheckAuth>'
   CALL lc_channel.write(l_str CLIPPED)
   LET l_str = '<MailServer>',l_xml.mailserver CLIPPED,'</MailServer>'
   CALL lc_channel.write(l_str CLIPPED)
   LET l_str = '<MailServerPort>',l_xml.serverport CLIPPED,'</MailServerPort>'
   CALL lc_channel.write(l_str CLIPPED)
   LET l_str = '<MailServerUser>',l_xml.user CLIPPED,'</MailServerUser>'
   CALL lc_channel.write(l_str CLIPPED)
   LET l_str = '<MailServerUserPassword>',l_xml.passwd CLIPPED,'</MailServerUserPassword>'
   CALL lc_channel.write(l_str CLIPPED)
   Let l_str = '<Subject>',l_xml.subject CLIPPED,'</Subject>'
   CALL lc_channel.write(l_str CLIPPED)
   IF NOT cl_null(l_xml.body) THEN
      LET l_str = '<MessageBody>',l_xml.body CLIPPED,'</MessageBody>'
      CALL lc_channel.write(l_str CLIPPED)
   END IF
   IF NOT cl_null(l_xml.attach) THEN
      LET l_str = '<Attach>',l_xml.attach CLIPPED,'</Attach>'
      CALL lc_channel.write(l_str CLIPPED)
   END IF
   LET l_str = '<Recipient>',l_xml.recipient CLIPPED,'</Recipient>'
   CALL lc_channel.write(l_str CLIPPED)
   IF NOT cl_null(l_xml.cc) THEN
      LET l_str = '<CCRecipient>',l_xml.cc CLIPPED,'</CCRecipient>'
      CALL lc_channel.write(l_str CLIPPED)
   END IF
   IF NOT cl_null(l_xml.bcc) THEN
      LET l_str = '<BCCRecipient>',l_xml.bcc CLIPPED,'</BCCRecipient>'
      CALL lc_channel.write(l_str CLIPPED)
   END IF
   LET l_str = '<From>',l_xml.sender CLIPPED,'</From>'
   CALL lc_channel.write(l_str CLIPPED)
   CALL lc_channel.write("</Mail>")
   CALL lc_channel.close()
 
#No.FUN-740189 --start--
   #將產生給javamail的xml檔轉成客戶端的編碼
   LET l_filepath = os.Path.join(l_tempdir CLIPPED,l_xml.file CLIPPED)  #FUN-8B0011
   #IF NOT cl_null(l_filepath) THEN #No.TQC-8B0026
   IF NOT cl_null(l_filepath) AND l_codeset != "UTF-8" THEN #No.TQC-8B0026
      CALL cl_prt_convert(l_filepath)
      LET l_cmd = "mv ",l_filepath," ",l_filepath,".t1"
      RUN l_cmd

      #No.FUN-9B0062  -- start --
      IF os.Path.separator() = "/" THEN        #Unix 環境
         LET l_cmd = "iconv -f ",l_codeset," -t UTF-8 ",l_filepath,".t1 >",l_filepath,".t1 >",l_filepath
         RUN l_cmd
      ELSE
         LET l_cmd = "java -cp ",os.Path.join(os.Path.join(FGL_GETENV("DS4GL"),"bin"),"zhcode.jar")," zhcode -b8 ",l_filepath,".t1 ",l_filepath
         RUN l_cmd
      END IF
      IF os.Path.delete(l_filepath||".t1") THEN
      END IF
      #No.FUN-9B0062  -- end --

   END IF

   #將mailbody對應的檔案轉成客戶端的編碼
   LET l_filepath = l_xml.body CLIPPED
   #IF NOT cl_null(l_filepath) THEN #No.TQC-8B0026
   IF NOT cl_null(l_filepath) AND l_codeset != "UTF-8" THEN #No.TQC-8B0026
      CALL cl_prt_convert(l_filepath)
      LET l_cmd = "mv ",l_filepath," ",l_filepath,".t1"
      RUN l_cmd
      #No.FUN-9B0062  -- start --
      IF os.Path.separator() = "/" THEN        #Unix 環境
         LET l_cmd = "iconv -f ",l_codeset," -t UTF-8 ",l_filepath,".t1 >",l_filepath,".t1 >",l_filepath
      ELSE
         LET l_cmd = "java -cp ",os.Path.join(os.Path.join(FGL_GETENV("DS4GL"),"bin"),"zhcode.jar")," zhcode -b8 ",l_filepath,".t1 ",l_filepath
      END IF
      #No.FUN-9B0062  -- end --
      RUN l_cmd
   END IF
#No.FUN-740189 --end--
 
   #No.FUN-9B0062  -- start --
   IF os.Path.separator() = "/" THEN        #Unix 環境
      LET l_cmd="chmod 777 ",os.Path.join(l_tempdir CLIPPED,l_xml.file CLIPPED)," 2>/dev/null"     #FUN-8B0011
      RUN l_cmd
      LET l_cmd="sh ",l_top CLIPPED,"/ds4gl2/bin/javamail/UnixMailSender.bat ",
                      os.Path.join(l_tempdir CLIPPED,l_xml.file CLIPPED) #," 2>/dev/null" #FUN-510006 FUN-8B0011
      RUN l_cmd
   ELSE
      LET l_cmd="attrib -r ",os.Path.join(l_tempdir CLIPPED,l_xml.file CLIPPED),"  >nul 2>nul"     #FUN-8B0011
      RUN l_cmd
      LET l_cmd=" ",l_top CLIPPED,"/ds4gl2/bin/javamail/WinMailSender.bat ",
                      os.Path.join(l_tempdir CLIPPED,l_xml.file CLIPPED) #,"  >nul 2>nul" #FUN-510006 FUN-8B0011
      RUN l_cmd
   END IF
   #No.FUN-9B0062  -- end --
 
#No.FUN-740189 --start--
   #IF NOT cl_null(l_filepath) THEN #No.TQC-8B0026
   IF NOT cl_null(l_filepath) AND l_codeset != "UTF-8" THEN #No.TQC-8B0026

      #No.FUN-9B0062  -- start --
      IF os.Path.delete(l_filepath CLIPPED) THEN
      END IF
      #No.FUN-9B0062  -- end --

      LET l_cmd = "mv ",l_filepath,".t1 ",l_filepath
      RUN l_cmd
   END IF
#No.FUN-740189 --end--
END FUNCTION
 
#FUN-890056 --start   
FUNCTION cl_maillist()
   DEFINE g_m           DYNAMIC ARRAY OF RECORD
                           m3 LIKE mlk_file.mlk03,
                           m1 LIKE mlk_file.mlk05,
                           m2 LIKE mlk_file.mlk04,
                           m7 LIKE mlk_file.mlk07  #FUN-880041
                        END RECORD
   DEFINE l_cnt         LIKE type_file.num5   
   DEFINE l_i           LIKE type_file.num5
   DEFINE l_sql         STRING                
   
   
      LET l_sql =  "SELECT mlk03, mlk05, mlk04, mlk07 FROM mlk_file WHERE mlk01 = '", g_prog CLIPPED
                 , "' ORDER BY mlk03"  #FUN-880041
      
      PREPARE mail_pre FROM l_sql
      DECLARE mail_curs CURSOR FOR mail_pre
 
      CALL g_m.clear()
      LET l_cnt = 1
      FOREACH mail_curs INTO g_m[l_cnt].m3, g_m[l_cnt].m1, g_m[l_cnt].m2, g_m[l_cnt].m7 #FUN-880041
         IF SQLCA.sqlcode THEN
            EXIT FOREACH
         END IF
         LET l_cnt = l_cnt + 1
      END FOREACH
      CALL g_m.deleteElement(l_cnt)
      
      LET g_receiver = NULL
      LET g_cc = NULL
      LET g_bcc = NULL
      
      FOR l_i = 1 TO g_m.getLength()
          CASE g_m[l_i].m3
             WHEN "1"
                IF NOT cl_null(g_m[l_i].m2) THEN
                   IF NOT cl_null(g_receiver) THEN
                      LET g_receiver = g_receiver, ";"
                   END IF
                   LET g_receiver = g_receiver CLIPPED, g_m[l_i].m2 CLIPPED, ":"
                END IF
                IF NOT cl_null(g_m[l_i].m1) THEN
                   LET g_receiver = g_receiver CLIPPED, g_m[l_i].m1 CLIPPED, ":" ##FUN-880041
                END IF
                #FUN-880041  --start
                IF NOT cl_null(g_m[l_i].m7) THEN
                   LET g_receiver = g_receiver CLIPPED, g_m[l_i].m7 CLIPPED                  
                END IF
                #FUN-880041  --end
             WHEN "2"
                IF NOT cl_null(g_m[l_i].m2) THEN
                   IF NOT cl_null(g_cc) THEN
                      LET g_cc = g_cc, ";"
                   END IF
                   LET g_cc = g_cc CLIPPED, g_m[l_i].m2 CLIPPED, ":"
                END IF
                IF NOT cl_null(g_m[l_i].m1) THEN
                   LET g_cc = g_cc CLIPPED, g_m[l_i].m1 CLIPPED, ":" ##FUN-880041
                END IF
                #FUN-880041  --start
                IF NOT cl_null(g_m[l_i].m7) THEN
                   LET g_cc = g_cc CLIPPED, g_m[l_i].m7 CLIPPED 
                END IF
                #FUN-880041  --end
             WHEN "3"
                IF NOT cl_null(g_m[l_i].m2) THEN
                   IF NOT cl_null(g_bcc) THEN
                      LET g_bcc = g_bcc, ";"
                   END IF
                   LET g_bcc = g_bcc CLIPPED, g_m[l_i].m2 CLIPPED, ":"
                END IF
                IF NOT cl_null(g_m[l_i].m1) THEN
                   LET g_bcc = g_bcc CLIPPED, g_m[l_i].m1 CLIPPED, ":" ##FUN-880041
                END IF
                #FUN-880041  --start
                IF NOT cl_null(g_m[l_i].m7) THEN 
                   LET g_bcc = g_bcc CLIPPED, g_m[l_i].m7 CLIPPED 
                END IF
                #FUN-880041  --end
          END CASE
      END FOR
END FUNCTION
#FUN-890056 --end
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: none
# Return code....:
##################################################
 
FUNCTION cl_javamail()
   DEFINE g_m           DYNAMIC ARRAY OF RECORD
                           m3 LIKE mlk_file.mlk03,
                           m1 LIKE mlk_file.mlk05,
                           m2 LIKE mlk_file.mlk04,
                           m7 LIKE mlk_file.mlk07  #FUN-880041
                        END RECORD
   DEFINE g_m_t         RECORD
                           m3 LIKE mlk_file.mlk03,
                           m1 LIKE mlk_file.mlk05,
                           m2 LIKE mlk_file.mlk04,
                           m7 LIKE mlk_file.mlk07  #FUN-880041
                        END RECORD
   DEFINE l_mode        LIKE type_file.chr1    #No.FUN-690005 VARCHAR(1)
   DEFINE l_i           LIKE type_file.num5,   #No.FUN-690005 SMALLINT,
          l_pos         LIKE type_file.num5,   #No.FUN-690005 SMALLINT,
          l_n           LIKE type_file.num5    #No.FUN-690005 SMALLINT
   DEFINE l_flag        LIKE type_file.num10   #No.FUN-690005 INTEGER
   DEFINE l_sql         STRING
   DEFINE l_cnt         LIKE type_file.num10   #No.FUN-690005 INTEGER
   DEFINE l_receiver    STRING
   DEFINE l_cc          STRING
   DEFINE l_bcc         STRING
   DEFINE l_mail        base.StringTokenizer
   DEFINE l_str         STRING
   DEFINE lwin_curr       ui.Window,      #FUN-920137
          l_target_node   om.DomNode      #FUN-920137
 
 
 
   OPEN WINDOW cl_javamail_w WITH FORM "lib/42f/cl_javamail"
        ATTRIBUTE (STYLE="lib")
 
   CALL cl_ui_locale("cl_javamail")
 
#   SELECT ze03 INTO ls_msg FROM ze_file WHERE ze01 = 'lib-027' AND ze02 = g_lang
#   DISPLAY ls_msg AT 1,1
 
   LET l_flag = TRUE
   LET l_cnt = 1
   IF NOT cl_null(g_receiver_list) THEN
      LET l_flag = FALSE
      LET l_mail = base.StringTokenizer.create(g_receiver_list, ";")
      WHILE l_mail.hasMoreTokens()
          LET l_str = l_mail.nextToken()
          IF NOT cl_null(l_str) THEN
             LET g_m[l_cnt].m3 = '1'
             #FUN-880041 --start
             CALL cl_splite(l_str) RETURNING g_m[l_cnt].m2,g_m[l_cnt].m1,g_m[l_cnt].m7 
             #LET l_pos = l_str.getIndexOf(":", 1)
             #LET g_m[l_cnt].m2 = l_str.subString(1, l_pos - 1)
             #LET g_m[l_cnt].m1 = l_str.subString(l_pos + 1, l_str.getLength())
             #FUN-880041 --end
             LET l_cnt = l_cnt + 1
          END IF
      END WHILE
   END IF
   IF NOT cl_null(g_cc_list) THEN
      LET l_flag = FALSE
      LET l_mail = base.StringTokenizer.create(g_cc_list, ";")
      WHILE l_mail.hasMoreTokens()
          LET l_str = l_mail.nextToken()
          IF NOT cl_null(l_str) THEN
             LET g_m[l_cnt].m3 = '2'
             #FUN-880041 --start
             CALL cl_splite(l_str) RETURNING g_m[l_cnt].m2,g_m[l_cnt].m1,g_m[l_cnt].m7 
             #LET l_pos = l_str.getIndexOf(":", 1)
             #LET g_m[l_cnt].m2 = l_str.subString(1, l_pos - 1)
             #LET g_m[l_cnt].m1 = l_str.subString(l_pos + 1, l_str.getLength())
             #FUN-880041 --end
             LET l_cnt = l_cnt + 1
          END IF
      END WHILE
   END IF
   IF NOT cl_null(g_bcc_list) THEN
      LET l_flag = FALSE
      LET l_mail = base.StringTokenizer.create(g_bcc_list, ";")
      WHILE l_mail.hasMoreTokens()
          LET l_str = l_mail.nextToken()
          IF NOT cl_null(l_str) THEN
             LET g_m[l_cnt].m3 = '3'
             #FUN-880041 --start
             CALL cl_splite(l_str) RETURNING g_m[l_cnt].m2,g_m[l_cnt].m1,g_m[l_cnt].m7 
             #LET l_pos = l_str.getIndexOf(":", 1)
             #LET g_m[l_cnt].m2 = l_str.subString(1, l_pos - 1)
             #LET g_m[l_cnt].m1 = l_str.subString(l_pos + 1, l_str.getLength())
             #FUN-880041 --end
             LET l_cnt = l_cnt + 1
          END IF
      END WHILE
   END IF
 
   IF l_flag AND g_open_cnt<>1 THEN         #No.MOD-9A0040
      LET g_open_cnt = 1                    #No.MOD-9A0040
      #No.FUN-660062 --start--
      IF cl_null(mc_cron_prog) THEN
         LET mc_cron_prog = g_prog
      END IF
#     LET l_sql = "SELECT mlk03, mlk05, mlk04 FROM mlk_file WHERE mlk01 = '", g_prog CLIPPED, "' ORDER BY mlk03"
      LET l_sql = "SELECT mlk03, mlk05, mlk04, mlk07 FROM mlk_file WHERE mlk01 = '", mc_cron_prog CLIPPED, "' ORDER BY mlk03" #FUN-880041
      #No.FUN-660062 ---end---
      PREPARE mlk_pre FROM l_sql
      DECLARE mlk_curs CURSOR FOR mlk_pre
 
      FOREACH mlk_curs INTO g_m[l_cnt].m3, g_m[l_cnt].m1, g_m[l_cnt].m2, g_m[l_cnt].m7 #FUN-880041
         IF SQLCA.sqlcode THEN
            EXIT FOREACH
         END IF
         LET l_cnt = l_cnt + 1
      END FOREACH
      CALL g_m.deleteElement(l_cnt)
   END IF
 
   LET g_rec_b = l_cnt - 1
 
   LET lwin_curr = ui.Window.getCurrent() #FUN-920137
 
   INPUT ARRAY g_m WITHOUT DEFAULTS FROM s_m.*
      ATTRIBUTE (COUNT=g_rec_b, MAXCOUNT=g_max_rec, UNBUFFERED)
#                 INSERT ROW=FALSE, DELETE ROW=FALSE, APPEND ROW=TRUE)
 
 
      BEFORE INPUT
         CALL DIALOG.setActionHidden("insert", TRUE)
         #FUN-920137 -- start --
         #CALL DIALOG.setActionHidden("delete", TRUE)
         LET l_target_node = lwin_curr.findNode("Action", "delete")
         CALL l_target_node.setAttribute("defaultView", "no")
         ##FUN-920137 -- end --
 
      BEFORE ROW
         LET l_ac = ARR_CURR()
         LET g_m_t.* = g_m[l_ac].*
         LET l_mode = 'u'
 
       AFTER FIELD m01                        # MOD-4B0301
         IF NOT cl_null(g_m[l_ac].m1) THEN
            SELECT gen06 INTO g_m[l_ac].m2 FROM gen_file
             WHERE gen01 = g_m[l_ac].m1
            DISPLAY g_m[l_ac].m1 TO m01
         END IF
 
      BEFORE INSERT
         LET l_n = ARR_COUNT()
         INITIALIZE g_m[l_ac].* TO NULL      #900423
         LET l_mode = 'a'
         NEXT FIELD m03
 
      AFTER INSERT
         IF INT_FLAG THEN
            LET INT_FLAG = FALSE
            CANCEL INSERT
         END IF
 
      AFTER ROW
         LET l_ac = ARR_CURR()
         IF INT_FLAG THEN
            IF l_mode = 'u' THEN
               LET g_m[l_ac].* = g_m_t.*
            END IF
            EXIT INPUT
         END IF
{
         IF (cl_null(g_m[i].m1) AND NOT cl_null(g_m[i].m2))
            OR (cl_null(g_m[i].m2) AND NOT cl_null(g_m[i].m1)) THEN
            CAll cl_err('','jml-001',0)
            INITIALIZE g_m[i].* TO NULL
         END IF
}
      ON ACTION controlp
          CASE
              WHEN INFIELD(m01)
                   CALL cl_init_qry_var()
                   LET g_qryparam.form = "q_gen_m"
                   LET g_qryparam.default1 = g_m[l_ac].m1
                   LET g_qryparam.default2 = g_m[l_ac].m2
                   CALL cl_create_qry() RETURNING g_m[l_ac].m1, g_m[l_ac].m2
                   DISPLAY g_m[l_ac].m1 TO m1
                   DISPLAY g_m[l_ac].m2 TO m2
          END CASE
 
      ON IDLE g_idle_seconds
         CALL cl_on_idle()
         CONTINUE INPUT
 
      #No.TQC-860016 --start--
      ON ACTION controlg
         CALL cl_cmdask()
 
      ON ACTION about
         CALL cl_about()
 
      ON ACTION help
         CALL cl_show_help()
      #No.TQC-860016 ---end---
   END INPUT
 
   CLOSE WINDOW cl_javamail_w
 
   IF INT_FLAG THEN
      LET INT_FLAG = FALSE
      RETURN '', '', ''
   ELSE
      LET l_receiver = NULL
      LET l_cc = NULL
      LET l_bcc = NULL
      FOR l_i = 1 TO g_m.getLength()
          CASE g_m[l_i].m3
             WHEN "1"
                IF NOT cl_null(g_m[l_i].m2) THEN
                   IF NOT cl_null(l_receiver) THEN
                      LET l_receiver = l_receiver, ";"
                   END IF
                   LET l_receiver = l_receiver CLIPPED, g_m[l_i].m2 CLIPPED, ":"
                END IF
                IF NOT cl_null(g_m[l_i].m1) THEN
                   LET l_receiver = l_receiver CLIPPED, g_m[l_i].m1 CLIPPED, ":" ##FUN-880041
                END IF
                #FUN-880041  --start
                IF NOT cl_null(g_m[l_i].m7) THEN
                   LET l_receiver = l_receiver CLIPPED, g_m[l_i].m7 CLIPPED                  
                END IF
                #FUN-880041  --end
             WHEN "2"
                IF NOT cl_null(g_m[l_i].m2) THEN
                   IF NOT cl_null(l_cc) THEN
                      LET l_cc = l_cc, ";"
                   END IF
                   LET l_cc = l_cc CLIPPED, g_m[l_i].m2 CLIPPED, ":"
                END IF
                IF NOT cl_null(g_m[l_i].m1) THEN
                   LET l_cc = l_cc CLIPPED, g_m[l_i].m1 CLIPPED, ":" ##FUN-880041
                END IF
                #FUN-880041  --start
                IF NOT cl_null(g_m[l_i].m7) THEN
                   LET l_cc = l_cc CLIPPED, g_m[l_i].m7 CLIPPED 
                END IF
                #FUN-880041  --end
             WHEN "3"
                IF NOT cl_null(g_m[l_i].m2) THEN
                   IF NOT cl_null(l_bcc) THEN
                      LET l_bcc = l_bcc, ";"
                   END IF
                   LET l_bcc = l_bcc CLIPPED, g_m[l_i].m2 CLIPPED, ":"
                END IF
                IF NOT cl_null(g_m[l_i].m1) THEN
                   LET l_bcc = l_bcc CLIPPED, g_m[l_i].m1 CLIPPED, ":" ##FUN-880041
                END IF
                #FUN-880041  --start
                IF NOT cl_null(g_m[l_i].m7) THEN 
                   LET l_bcc = l_bcc CLIPPED, g_m[l_i].m7 CLIPPED 
                END IF
                #FUN-880041  --end
          END CASE
      END FOR
 
      RETURN l_receiver,l_cc,l_bcc
   END IF
END FUNCTION
 
FUNCTION cl_splite(p_str) #FUN-880041
   DEFINE p_str,l_str STRING
   DEFINE l_mail      base.StringTokenizer
   DEFINE l_m         RECORD                           
                        m1 LIKE mlk_file.mlk04,
                        m2 LIKE mlk_file.mlk05,
                        m7 LIKE mlk_file.mlk07
                      END RECORD                      
   DEFINE l_cnt  LIKE type_file.num5                        
             
   LET l_mail = base.StringTokenizer.create(p_str, ":")
   LET l_cnt = 1
   WHILE l_mail.hasMoreTokens()
       LET l_str = l_mail.nextToken()
          IF NOT cl_null(l_str) THEN
          	 CASE l_cnt
                WHEN 1
                  LET l_m.m1 = l_str
                WHEN 2
                  LET l_m.m2 = l_str  
                WHEN 3
                  LET l_m.m7 = l_str    
             END CASE
             LET l_cnt = l_cnt + 1
       END IF
   END WHILE
   RETURN l_m.m1,l_m.m2,l_m.m7   
END FUNCTION
 
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_prg,p_mailtype
# Return code....:
##################################################
 
FUNCTION cl_jmaildeflist(p_prg,p_mailtype)    #  jimmy
   DEFINE p_prg         LIKE mlk_file.mlk01   #No.FUN-690005 VARCHAR(10)
   DEFINE p_mailtype    LIKE type_file.chr1   #No.FUN-690005 VARCHAR(1)
   DEFINE i,j,l_n       LIKE type_file.num5   #No.FUN-690005 SMALLINT
   DEFINE l_str         LIKE type_file.chr1000#No.FUN-690005 VARCHAR(1000)
   DEFINE l_sql         LIKE type_file.chr1000#No.FUN-690005 VARCHAR(500)
   DEFINE l_mlk RECORD LIKE mlk_file.*
 
   LET l_str = ''
   LET l_sql = "SELECT *  FROM mlk_file WHERE ",
               " mlk01='",p_prg CLIPPED,"' AND mlk03='", p_mailtype CLIPPED,"'"
   PREPARE p1  FROM l_sql
   DECLARE curs1  CURSOR WITH HOLD FOR  p1
   FOREACH curs1 INTO l_mlk.*
     IF cl_null(l_mlk.mlk05) THEN
        LET l_mlk.mlk05 = l_mlk.mlk04
     END IF
     LET l_str = l_str CLIPPED , l_mlk.mlk04 CLIPPED,":",l_mlk.mlk05 CLIPPED,";"
   END FOREACH
   RETURN l_str
END FUNCTION
 
 
#Patch....NO.TQC-610035 <001> #
#No.FUN-770106 --start--
##################################################
# Descriptions...:
# Date & Author..:
# Input Parameter: p_sql
# Return code....:
##################################################
 
FUNCTION cl_prt_get_tblname(p_sql)
    DEFINE p_sql        STRING
    DEFINE l_db_type    STRING
    DEFINE l_str        STRING
    DEFINE l_str_bak    STRING
    DEFINE l_start      LIKE type_file.num10
    DEFINE l_end        LIKE type_file.num10
    DEFINE l_tok        base.StringTokenizer
    DEFINE l_i          LIKE type_file.num10
    DEFINE l_j          LIKE type_file.num10
    DEFINE l_tab        STRING
    DEFINE l_tab_list   STRING
 
     LET l_db_type=cl_db_get_database_type()
     LET l_str=p_sql
     LET l_str_bak = l_str.toLowerCase()
     LET l_start = l_str_bak.getIndexOf('from',1)
     LET l_end   = l_str_bak.getIndexOf('where',1)
     IF l_end=0 THEN
        LET l_end   = l_str_bak.getIndexOf('group',1)
        IF l_end=0 THEN
           LET l_end   = l_str_bak.getIndexOf('order',1)
           IF l_end=0 THEN
              LET l_end=l_str.getLength()
              LET l_str=l_str.subString(l_start+5,l_end)
           ELSE
              LET l_str=l_str.subString(l_start+5,l_end-2)
           END IF
        ELSE
           LET l_str=l_str.subString(l_start+5,l_end-2)
        END IF
     ELSE
        LET l_str=l_str.subString(l_start+5,l_end-2)
     END IF
     LET l_str=l_str.trim()
     LET l_tok = base.StringTokenizer.createExt(l_str CLIPPED,",","",TRUE)
     LET l_j=1
     WHILE l_tok.hasMoreTokens()
          LET l_tab=l_tok.nextToken()
          LET l_tab=l_tab.trim()
          IF l_tab.getIndexOf(' ',1) THEN
             LET l_tab=l_tab.subString(1,l_tab.getIndexOf(' ',1)-1)
          END IF

          CASE l_db_type
             WHEN "IFX" LET l_tab = l_tab.subString(l_tab.getIndexOf(':',1)+1,l_tab.getLength())
             WHEN "ORA" LET l_tab = l_tab.subString(l_tab.getIndexOf('.',1)+1,l_tab.getLength())
             WHEN "MSV"
             WHEN "ASE"                          #FUN-AA0076
             OTHERWISE
          END CASE

          IF l_j=1 THEN
             LET l_tab_list = l_tab CLIPPED
             LET l_j=l_j+1
          ELSE
             LET l_tab_list = l_tab_list CLIPPED,"|",l_tab CLIPPED
          END IF
     END WHILE
 
     RETURN l_tab_list
    ### FUN-750065 end ###
END FUNCTION
#No.FUN-770106 --end--
 
#No.FUN-7C0078 --start--
##################################################
# Descriptions...: 呼叫CR背景作業
# Date & Author..: jacklai
# Input Parameter: p_url   呼叫CR背景作業的URL
#                  p_prog  程式代號
# Return code....: none
##################################################
FUNCTION cl_prt_cs_bgjob(p_url, p_prog)
   DEFINE p_url     STRING
   DEFINE p_prog    LIKE zaw_file.zaw01
   DEFINE l_cmd     STRING
   DEFINE l_buf     STRING
   DEFINE l_out     STRING
   DEFINE l_ch      base.Channel
   DEFINE l_file    STRING
   DEFINE l_spos    LIKE type_file.num10
   DEFINE l_epos    LIKE type_file.num10
   
   #呼叫Java程式啟動CR背景作業, 執行結果會輸出在stdout
   LET l_ch = base.Channel.create()
   CALL l_ch.setDelimiter("")
   LET l_cmd = FGL_GETENV("TOP")
   LET l_cmd = " ",l_cmd,"/ds4gl2/bin/javaboec/cmd.sh \"",p_url CLIPPED,"\""
   DISPLAY "l_cmd: ",l_cmd
 
   #利用pipe物件截取輸出在stdout的字串, 並存入l_out字串陣列
   CALL l_ch.openPipe(l_cmd,"r")
   IF STATUS == 0 THEN
      WHILE TRUE
         CALL l_ch.readLine() RETURNING l_buf
         IF cl_null(l_buf) THEN
            EXIT WHILE
         END IF
         LET l_out = l_out,l_buf,"\r\n"        
         DISPLAY l_out #FUN-880041
      END WHILE
   END IF
   CALL l_ch.close()
   
   #No.FUN-8B0032 --start--
   #l_out字串(CR主機ASP.NET回傳訊息)以|分隔各回傳變數
   LET l_spos = l_out.getIndexOf("|",1)
   IF l_spos > 0 THEN
      LET l_epos = l_out.getLength()
      LET g_head = l_out.subString(l_spos + 1, l_epos)
      DISPLAY "g_head=",g_head
   END IF 
   #No.FUN-8B0032 --end--
   
   #l_out字串陣列的第一行為\"回傳檔名\"(CR處理成功時)或是null(CR處理失敗時)
   #FUN-880041 --start
   #IF l_out.getIndexOf("null",1) > 0 THEN
   #   LET g_rep_err = TRUE
   #   LET g_bgrpt = NULL
   #ELSE
   #   LET l_spos = l_out.getIndexOf("\"",1)
   #   LET l_epos = l_out.getIndexOf("\"",l_spos+1)
   #   IF l_epos > l_spos AND l_spos > 0 THEN
   #      LET l_file = l_out.subString(l_spos+1, l_epos-1)
   #      LET g_bgrpt = l_file
   #      LET g_rep_err = FALSE
   #   ELSE
   #      LET g_rep_err = TRUE
   #      LET g_bgrpt = NULL
   #   END IF
   #END IF
   #FUN-880041 --end
   
   LET g_cron_job = 'N'
   IF FGL_GETENV("BGJOB") = '1' THEN
      LET g_cron_job = 'Y'
   END IF
       
   #CALL cl_prt_setmail(p_prog) #FUN-880041
END FUNCTION
 
##################################################
# Descriptions...: 設定email寄送資訊
# Date & Author..: jacklai
# Input Parameter: p_name  程式代號
# Return code....: none
##################################################
FUNCTION cl_prt_setmail(p_name)
   DEFINE p_name                LIKE type_file.chr20
   DEFINE l_time                LIKE type_file.chr8
   DEFINE ls_para               STRING
   DEFINE ls_context            STRING
   DEFINE ls_temp_path          STRING
   DEFINE ls_context_file       STRING
   DEFINE l_cmd                 STRING
   DEFINE li_i                  LIKE type_file.num5
 
   LET g_receiver_list = FGL_GETENV("MAIL_TO")
   LET g_cc_list = FGL_GETENV("MAIL_CC")
   LET g_bcc_list = FGL_GETENV("MAIL_BCC")
 
   IF ( NOT cl_null(g_receiver_list) ) OR
      ( NOT cl_null(g_cc_list) ) OR
      ( NOT cl_null(g_bcc_list) ) THEN
      FOR li_i = 1 TO NUM_ARGS()
         LET ls_para = ls_para, " '", ARG_VAL(li_i), "'"
      END FOR
      LET ls_para = cl_replace_str(ls_para,"'","\"")
      LET ls_context = cl_prt_gen_context(ls_para)
      LET ls_temp_path = FGL_GETENV("TEMPDIR")
      LET ls_context_file = ls_temp_path,"/report_context_" || FGL_GETPID() || ".txt"
      LET l_cmd = "echo '" || ls_context || "' > " || ls_context_file
      RUN l_cmd WITHOUT WAITING
      DISPLAY ls_context #afer testing, delete
      LET g_xml.body = ls_context_file
      #LET g_rep_err = TRUE
      CALL cl_prt_j(p_name, NULL)

      #No.FUN-9B0062  -- start --
      IF os.Path.delete(ls_context_file CLIPPED) THEN
      END IF
      #No.FUN-9B0062  -- end --

   END IF
END FUNCTION
 
##################################################
# Descriptions...: 組出郵件本文
# Date & Author..: jacklai
# Input Parameter: p_para 命令列參數
# Return code....: STRING 郵件本文
##################################################
FUNCTION cl_prt_gen_context(p_para)
   DEFINE p_para     STRING
   DEFINE ls_context STRING
   DEFINE ls_rpturl  STRING
   
   LET ls_context = "<html><head><title>jmail</title></head>\n<body>\n",
                    "<table style=\"border: black 1px solid; border-collapse: collapse\">\n",
                    "<tr><td colspan=\"2\" style=\"font-weight: bold; font-size: 20px; color: white; background-color: #f08080; font-variant: normal\">",
                    cl_getmsg("lib-282",g_lang) CLIPPED,"</td></tr>\n",
                    "<tr><td style=\"width: 140px; color: white; background-color: #365f91\">",cl_getmsg("lib-227",g_lang) CLIPPED,
                    "</td><td style=\"background-color: #A7BFDE\">",cl_get_progname(g_prog,g_lang),"\(",g_prog CLIPPED,"\)</td></tr>\n",
                    "<tr><td style=\"color: white; background-color: #365f91\">",cl_getmsg("lib-229",g_lang) CLIPPED,
                    "</td><td style=\"background-color: #dbe5f1\">" ,g_user CLIPPED,"</td></tr>\n",
                    "<tr><td style=\"color: white; background-color: #365f91\">",cl_getmsg("lib-279",g_lang) CLIPPED,
                    "</td><td style=\"background-color: #A7BFDE\">" ,TODAY," ",TIME,"</td></tr>\n",
                    "<tr><td style=\"color: white; background-color: #365f91\">",cl_getmsg("lib-280",g_lang) CLIPPED,
                    "</td><td style=\"background-color: #dbe5f1\">" ,p_para,"</td></tr>\n",
                    "<tr><td style=\"color: white; background-color: #365f91\">",cl_getmsg("lib-281",g_lang) CLIPPED,
                    "</td><td style=\"background-color: #A7BFDE\">"
   
   IF g_rep_err THEN
      LET ls_context = ls_context,cl_getmsg("lib-216",g_lang),"</td></tr>\n"
   ELSE
      LET ls_context = ls_context,cl_getmsg("lib-284",g_lang),"</td></tr>\n"
      LET ls_rpturl = FGL_GETENV("CRIP") CLIPPED,"loadrpt.aspx?file=",g_bgrpt CLIPPED
      LET ls_context = ls_context,"<tr><td style=\"color: white; background-color: #365f91\">Report URL"
      LET ls_context = ls_context,"</td><td style=\"background-color: #dbe5f1\"><A HREF=\"",ls_rpturl,"\">",ls_rpturl,"</A></td></tr>\n"
   END IF
   LET ls_context = ls_context,"</table>\n</body>\n</html>\n"
   RETURN ls_context
END FUNCTION
#No.FUN-7C0078 --end--
 
 
###FUN-8C0027 START ###
##################################################
# Descriptions...: 組合圖片
# Date & Author..: 08/12/04  tsai_yen
# Input Parameter: p_ii(編號),p_dir_input(輸入的路徑),p_dir_output(輸出的路徑),p_img_list(要組合的圖片列表),p_show_col(圖片一行顯示幾張),p_show_row(圖片顯示幾列)
# Return code....: l_jar_msg(執行java回傳訊息),l_img_out合併完成的圖檔(檔名和路徑)
##################################################
FUNCTION cl_prt_makeimage_jar(p_ii,p_dir_input,p_dir_output,p_img_list,p_show_col,p_show_row)
   DEFINE p_ii          LIKE type_file.num10    #編號，用於檔案命名
   DEFINE p_img_list    STRING                  #要組合的圖片列表
   DEFINE p_show_col    LIKE type_file.num10    #圖片一行顯示幾張，0:使用預設值(預留的功能參數)
   DEFINE p_show_row    LIKE type_file.num10    #圖片顯示幾列，0:使用預設值(預留的功能參數)
   DEFINE p_dir_input   STRING 
   DEFINE p_dir_output  STRING
   DEFINE l_now         DATETIME YEAR TO FRACTION(1)
   DEFINE l_now_str     STRING   
   DEFINE l_cmd         STRING          #UNIX指令   
   DEFINE l_si          STRING   
   DEFINE l_jar         STRING          #java組圖
   DEFINE l_jar_msg     STRING          #執行java回傳訊息   
   DEFINE l_img_out     STRING          #合併完成的圖檔(檔名和路徑)
    
   LET l_now = CURRENT  #2008-11-24 17:21:02.8      
   LET l_now_str = l_now
   CALL cl_replace_str(l_now_str, "-", "") RETURNING l_now_str
   CALL cl_replace_str(l_now_str, " ", "") RETURNING l_now_str
   CALL cl_replace_str(l_now_str, ":", "") RETURNING l_now_str
   CALL cl_replace_str(l_now_str, ".", "") RETURNING l_now_str
   LET l_si = p_ii
   
   
   #java組圖
   #使用pipe
   #將ch替換為從資料庫撈資料組成字串s1, 會有相同效果
   LET l_img_out = g_prog,l_now_str,g_user,l_si
   LET l_jar = "java -DImageDir=",p_dir_input," -DImageOutputDir=",p_dir_output," -jar ",FGL_GETENV("TOP"),"/ds4gl2/bin/MakeImage.jar ",l_img_out,".png"
   #java -DImageDir=/top3o/doc/pic -DImageOutputDir=/u2/out -jar /top3o/ds4gl2/bin/java/MakeImage.jar test1.png
 
   #產生input的圖片列表(文字檔)
   LET l_cmd = "echo '",p_img_list,"' > ",p_dir_output,"/",l_img_out,".im"
   RUN l_cmd
   
   #呼叫java組圖
   LET l_cmd = l_jar," < ",l_img_out,".im"
   RUN l_cmd RETURNING l_jar_msg
   
   CASE l_jar_msg
        WHEN "0"
                LET l_jar_msg = l_jar_msg,":NOERROR"
        WHEN "1"
                LET l_jar_msg = l_jar_msg,":ARGS_NULL"
        WHEN "2"
                LET l_jar_msg = l_jar_msg,".dbo.UNSUPPORTED_IMAGE_fileTYPE"
        WHEN "4"
                LET l_jar_msg = l_jar_msg,":STDIN_FORMAT_ERROR"
        WHEN "8"
                LET l_jar_msg = l_jar_msg,":PROCESS_IMAGE_ERROR"
        WHEN "16"
                LET l_jar_msg = l_jar_msg,":OUTPUT_IMAGE_ERROR"
        OTHERWISE
                LET l_jar_msg = "ERROR"
   END CASE
   DISPLAY "l_jar_msg=",l_jar_msg  
   DISPLAY  " "
   
   #No.FUN-9B0062  -- start --
   IF os.Path.delete(l_img_out||".im") THEN
   END IF
   
   LET l_img_out = l_img_out,".png"   
   LET l_img_out = os.Path.join(p_dir_output,l_img_out)
   #No.FUN-9B0062  -- end --
   
   RETURN l_jar_msg,l_img_out 
 
 END FUNCTION 
###FUN-8C0027 END ### 
 
 
###FUN-910012 START ###
#################################################
# Descriptions...: 報表簽核
# Date & Author..: 09/01/20  tsai_yen
# Input Parameter: p_ii (編號),
#                  p_gcx01 (單別維護程式),
#                  p_code (單號),
#                  p_table (報表暫存table名稱),
#                  p_key_f (主鍵欄位，用"|"隔開),
#                  p_key_v (主鍵值，用"|"隔開), 
#                  p_show_col (圖片一行顯示幾張，0:使用預設值(預留的功能參數)), 
#                  p_show_row (圖片顯示幾列，0:使用預設值(預留的功能參數))
#################################################
FUNCTION cl_prt_apr_img(p_ii, p_gcx01, p_code, p_table, p_key_f, p_key_v, p_show_col, p_show_row)
   DEFINE p_ii              LIKE type_file.num10  #編號
   DEFINE p_gcx01           LIKE gcx_file.gcx01   #單別維護程式
   DEFINE p_code            STRING                #單號
   DEFINE p_table           STRING                #報表暫存table名稱
   DEFINE p_key_f           STRING                #主鍵欄位，用"|"隔開
   DEFINE p_key_v           STRING                #主鍵值，用"|"隔開
   DEFINE p_show_col        LIKE type_file.num10  #圖片一行顯示幾張，0:使用預設值(預留的功能參數)
   DEFINE p_show_row        LIKE type_file.num10  #圖片顯示幾列，0:使用預設值(預留的功能參數)
   
   DEFINE l_key_fv          DYNAMIC ARRAY OF RECORD
             f   STRING,                             #主鍵欄位
             v   STRING                              #主鍵值
             END RECORD   
   DEFINE l_key_str         STRING                #主鍵串成字串，當wsc_file的wsc01送簽單號  key01{+}field02=key02{+}field03=key03
   DEFINE l_wc              STRING                #where條件
   DEFINE l_sign_type       LIKE type_file.chr1   #簽核方式 e:EasyFlow, g:EasyFlowGP, t:TIPTOP
   DEFINE l_sign_show       LIKE type_file.chr1   #是否有簽核資料(Y/N)  
   DEFINE l_sign_location   LIKE zaw_file.zaw13   #列印簽核位置(1:頁尾/2:表尾)
   DEFINE l_jar_msg         STRING                #執行java回傳訊息
   DEFINE l_img_out         STRING                #全部的合併完成的圖檔(檔名和路徑)
   DEFINE l_img_blob        LIKE type_file.blob
   DEFINE l_aza23           LIKE aza_file.aza23   #簽核流程與EasyFlow串連
   DEFINE l_aza72           LIKE aza_file.aza72   #N:與EasyFlow整合，Y:與EasyFlow GP整合
   DEFINE l_si              STRING
   DEFINE l_str             STRING
   DEFINE l_sql	            STRING
   DEFINE l_img_list        STRING                #準備要組圖的圖片列表
   DEFINE l_dir_input       STRING                #組合圖片的輸入目錄
   DEFINE l_dir_output      STRING                #組合圖片的輸出目錄
   DEFINE l_wsc             RECORD                #簽核記錄檔
             wsc04 LIKE wsc_file.wsc04,              #關號
             wsc06 LIKE wsc_file.wsc06,              #簽核人員姓名
             wsc07 LIKE wsc_file.wsc07,              #簽核人員職級
             wsc10 LIKE wsc_file.wsc10,              #簽核日期
             wsc13 LIKE wsc_file.wsc13               #簽核圖檔名稱
            END RECORD
   DEFINE l_i               LIKE type_file.num10 
   DEFINE l_tok             base.StringTokenizer
   DEFINE l_apr             LIKE type_file.chr1   #是否走EasyFlow簽核
   DEFINE l_slip            STRING                #單據別
   
   #LET l_img_blob = NULL                         #FUN-A50041 mark
   LOCATE l_img_blob IN MEMORY                    #FUN-A50041
   LET l_jar_msg = NULL
   LET l_sign_type = NULL
   LET l_sign_show = "N"     #預設無簽核圖
   LET l_sign_location = "1" #列印簽核位置(1:頁尾)
   LET l_img_out = NULL
   
      
   #系統參數作業(aoos010):簽核流程是否與EasyFlow串連
   SELECT aza23,aza72 INTO l_aza23,l_aza72 From aza_file   
   IF STATUS THEN
      CALL cl_err('select aoos010:',status,1) EXIT PROGRAM 
   END IF
   #簽核流程
   LET l_sign_type = NULL
   IF l_aza23 = "Y" THEN
      IF l_aza72="N" THEN
         LET l_sign_type = "e"      #EasyFlow
      ELSE
         LET l_sign_type = "g"      #EasyFlowGP
      END IF
   ELSE 
      LET l_sign_type = "t"         #TIPTOP
   END IF
   
   #拆解字串：主鍵欄位
   LET l_i =0
   LET l_tok = base.StringTokenizer.createExt(p_key_f CLIPPED,"|","",TRUE)	#指定分隔符號
   WHILE l_tok.hasMoreTokens()	#依序取得子字串
      LET l_str = l_tok.nextToken()
      LET l_i = l_i + 1
      LET l_key_fv[l_i].f = l_str CLIPPED
   END WHILE 
   
   #拆解字串：主鍵值
   LET l_i =0
   LET l_tok = base.StringTokenizer.createExt(p_key_v CLIPPED,"|","",TRUE)	#指定分隔符號
   WHILE l_tok.hasMoreTokens()	#依序取得子字串
      LET l_str = l_tok.nextToken()
      LET l_i = l_i + 1
      LET l_key_fv[l_i].v = l_str CLIPPED
   END WHILE 
 
   #報表暫存檔的WHERE條件、wsc_file的主鍵wsc01
   FOR l_i = 1 TO l_key_fv.getlength()
      IF l_i = 1 THEN
         LET l_key_str = l_key_fv[l_i].v CLIPPED
         LET l_wc = "WHERE ",l_key_fv[l_i].f CLIPPED,"='",l_key_fv[l_i].v CLIPPED,"'"
      ELSE
         LET l_key_str = l_key_str CLIPPED,"{+}",l_key_fv[l_i].f CLIPPED,"=",l_key_fv[l_i].v CLIPPED
         LET l_wc = l_wc CLIPPED," AND ",l_key_fv[l_i].f CLIPPED,"='",l_key_fv[l_i].v CLIPPED,"'"
      END IF 
   END FOR   
 
   IF NOT cl_null(l_key_str) THEN  #主鍵有值
      LET l_si = p_ii  
        
      #【TIPTOP簽核】
      IF l_sign_type = "t" THEN
         CALL cl_prt_apr(p_gcx01,p_code) RETURNING l_apr,l_slip
         CALL cl_prt_apr_t(p_gcx01, l_slip) RETURNING l_img_list   #TIPTOP報表簽核
      ELSE
         IF l_sign_type = "e" THEN
            CALL cl_prt_apr(p_gcx01,p_code) RETURNING l_apr,l_slip
            #【EasyFlow簽核】
            IF l_apr = "Y" THEN
                #EasyFlow簽核記錄
                INITIALIZE l_wsc.* TO NULL  
                LET l_sql = "SELECT wsc04,wsc06,wsc07,wsc10,wsc13 FROM wsc_file",
                            " WHERE wsc01 = '",l_key_str CLIPPED,"'",
                            " ORDER BY wsc04,wsc05"
                PREPARE wsc_prep FROM l_sql
                IF STATUS THEN 
                   CALL cl_err('prepare:', STATUS, 1)
                END IF
                DECLARE wsc_curs CURSOR FOR wsc_prep
 
                LET l_img_list = NULL
                FOREACH wsc_curs INTO l_wsc.*   #查EasyFlow簽核資料
                   LET l_img_list = l_img_list CLIPPED,"關號：",l_wsc.wsc04 CLIPPED,";",l_wsc.wsc07 CLIPPED,";",l_wsc.wsc06 CLIPPED,";",l_wsc.wsc10 CLIPPED,";",l_wsc.wsc13 CLIPPED,"|" 
                END FOREACH  
            #【TIPTOP簽核】
            ELSE            
               LET l_sign_type = "t"
               CALL cl_prt_apr(p_gcx01,p_code) RETURNING l_apr,l_slip
               CALL cl_prt_apr_t(p_gcx01, l_slip) RETURNING l_img_list   #TIPTOP報表簽核
            END IF
         END IF
         
         IF l_sign_type = "g" THEN
            CALL cl_prt_apr(p_gcx01,p_code) RETURNING l_apr,l_slip
            #【EasyFlow GP簽核】
            IF l_apr = "Y" THEN
               
            #【TIPTOP簽核】
            ELSE
               LET l_sign_type = "t"
               CALL cl_prt_apr(p_gcx01,p_code) RETURNING l_apr,l_slip
               CALL cl_prt_apr_t(p_gcx01, l_slip) RETURNING l_img_list   #TIPTOP報表簽核
            END IF
         END IF
      END IF
      
      IF NOT cl_null(l_img_list) THEN
         LET l_sign_show = "Y"   #有簽核圖
      END IF
      
      IF l_sign_show = "Y" THEN   #有簽核圖
         #組合圖片
         LET l_dir_input = FGL_GETENV("TOP"),"/doc/pic/easyflow/Personal"
         LET l_dir_output = FGL_GETENV("TEMPDIR")
         DISPLAY "l_img_list:",l_img_list
         DISPLAY "l_wc=",l_wc CLIPPED
         CALL cl_prt_makeimage_jar(p_ii,l_dir_input,l_dir_output,l_img_list,p_show_col,p_show_row) 
            RETURNING l_jar_msg, l_img_out 
            
         IF NOT cl_null(l_img_out) THEN
            LOCATE l_img_blob IN FILE l_img_out   
         END IF                 
      END IF
      
      #報表簽和資訊更新至報表暫存檔
      LET l_sql = "UPDATE ",g_cr_db_str CLIPPED,p_table CLIPPED,
                     " SET sign_type=?, sign_img=?, sign_show=? ",
                     l_wc CLIPPED      
      PREPARE cr_prt_apr_prep FROM l_sql
      IF SQLCA.SQLCODE THEN
         CALL cl_err("PREPARE cr_prt_apr_prep:",SQLCA.SQLCODE,1)
         EXIT PROGRAM
      END IF
      EXECUTE cr_prt_apr_prep USING l_sign_type,l_img_blob,l_sign_show
      IF SQLCA.SQLCODE THEN
         CALL cl_err("EXECUTE cr_prt_apr_prep:",SQLCA.SQLCODE,1)
         EXIT PROGRAM
      END IF
      
      #釋放資源，刪除暫存實體檔案 
      IF l_sign_show = "Y" AND (NOT cl_null(l_img_out)) THEN
         FREE l_img_blob
      END IF             
   END IF
END FUNCTION
 
 
#################################################
# Descriptions...: 是否走EasyFlow簽核
# Date & Author..: 09/01/20  tsai_yen
# Input Parameter: p_gcx01(模組), p_code(單號)
# Return code....: l_apr (在各個單據維護程式中設定，若維護程式無此欄位，則預設"N"),
#                  l_slip (單據別)
#################################################
FUNCTION cl_prt_apr(p_gcx01,p_code)
   DEFINE p_gcx01       LIKE gcx_file.gcx01     #單別維護程式
   DEFINE p_code        STRING                  #單號   
   DEFINE l_slip        STRING                  #單據別
   DEFINE l_apr         LIKE type_file.chr1     #是否走EasyFlow簽核(在各個單據維護程式中設定，若維護程式無此欄位，則預設"N")
   DEFINE l_aza41       LIKE aza_file.aza41     #單別位數設定  aoos010的"其他設定"，可設定"單別位數設定(aza41)"、"單號位數設定(aza42)"
   DEFINE l_aza41_i     LIKE type_file.num10
   DEFINE l_sql         STRING
   DEFINE l_str         STRING 
   
   LET p_gcx01 = p_gcx01 CLIPPED
   LET p_code = p_code CLIPPED
   LET l_apr = "N"
   LET l_aza41_i = 0
   LET l_sql = ""
   
   #單別位數設定
   SELECT aza41 INTO l_aza41 FROM aza_file
   IF STATUS THEN
      CALL cl_err('select:',status,1) EXIT PROGRAM 
   ELSE
      IF l_aza41="1" THEN
         LET l_aza41_i = 3
      END IF
      IF l_aza41="2" THEN
         LET l_aza41_i = 4
      END IF
      IF l_aza41="3" THEN
         LET l_aza41_i = 5
      END IF
   END IF
      
   #單據別
   IF l_aza41_i >0 THEN
      LET l_slip = p_code.subString(1,l_aza41_i)
   ELSE
      LET l_slip = ""
   END IF      
   
   #是否走EasyFlow簽核
   IF p_gcx01="aapi010" OR p_gcx01="aapi103" THEN
      LET l_sql = "SELECT apyapr FROM apy_file WHERE apyslip='",l_slip CLIPPED,"'"
   END IF
   IF p_gcx01="afai060" THEN
      LET l_sql = "SELECT fahapr FROM fah_file WHERE fahslip='",l_slip CLIPPED,"'"
   END IF
   IF p_gcx01="anmi100" THEN
      LET l_sql = "SELECT nmyapr FROM nmy_file WHERE nmyslip='",l_slip CLIPPED,"'"
   END IF
   IF p_gcx01="apyi070" THEN
      LET l_sql = "SELECT cplapr FROM cpl_file WHERE cplslip='",l_slip CLIPPED,"'"
   END IF	
   IF p_gcx01="asmi300" THEN
      LET l_sql = "SELECT smyapr FROM smy_file WHERE smyslip='",l_slip CLIPPED,"'"
   END IF
   IF p_gcx01="axmi010" THEN
      LET l_sql = "SELECT oayapr FROM oay_file WHERE oayslip='",l_slip CLIPPED,"'"
   END IF
   IF p_gcx01="axri010" THEN
      LET l_sql = "SELECT ooyapr FROM ooy_file WHERE ooyslip='",l_slip CLIPPED,"'"
   END IF
   IF p_gcx01="agli108" THEN
      LET l_sql = "SELECT aac08 FROM aac_file WHERE aac01='",l_slip CLIPPED,"'"
   END IF
   
   IF NOT cl_null(l_sql) THEN
      PREPARE cl_prt_apr_prep FROM l_sql
      IF SQLCA.SQLCODE THEN
         CALL cl_err("prepare cl_prt_apr_prep: ", SQLCA.SQLCODE, 1)
         EXIT PROGRAM
      END IF
      DECLARE cl_prt_apr_curs SCROLL CURSOR FOR cl_prt_apr_prep
      OPEN cl_prt_apr_curs
      FETCH cl_prt_apr_curs INTO l_apr
      CLOSE cl_prt_apr_curs
   END IF
   
   IF cl_null(l_apr) THEN
      LET l_apr = "N"
   END IF
      
   RETURN l_apr,l_slip
END FUNCTION
 
 
#################################################
# Descriptions...: TIPTOP報表簽核
# Date & Author..: 09/01/20  tsai_yen
# Input Parameter: 
# Return code....: 
#################################################
FUNCTION cl_prt_apr_t(p_gcx01, p_slip)
   DEFINE p_gcx01           LIKE gcx_file.gcx01   #單別維護程式
   DEFINE p_slip            STRING                #單據別   
   DEFINE l_img_list        STRING                #準備要組圖的圖片列表
   DEFINE l_gcx             RECORD                #TIPTOP報表簽核欄
             gcx01          LIKE gcx_file.gcx01,  #單別維護程式
             gcx02          LIKE gcx_file.gcx02,  #單別
             gcx03          LIKE gcx_file.gcx03,  #語言別
             gcx04          LIKE gcx_file.gcx04,  #關卡順序
             gcx05          LIKE gcx_file.gcx05   #簽核人員職稱
             END RECORD
   DEFINE l_sql             STRING
   DEFINE l_gcx04_s         STRING
   
   LET l_img_list = NULL
   
   IF (NOT cl_null(p_gcx01)) AND (NOT cl_null(p_slip)) THEN
      LET l_gcx.gcx01 = p_gcx01 CLIPPED
      LET l_gcx.gcx02 = p_slip CLIPPED
      LET l_gcx.gcx03 = g_rlang CLIPPED
      LET l_sql = "SELECT gcx04,gcx05 FROM gcx_file",
                  " WHERE gcx01 = ? AND gcx02 = ? AND gcx03 = ?",
                  " ORDER BY gcx04"
      PREPARE cl_prt_apr_t_pre FROM l_sql
      IF SQLCA.SQLCODE THEN
         CALL cl_err("PREPARE cl_prt_apr_t_pre: ", SQLCA.SQLCODE, 1)
         EXIT PROGRAM
      END IF
      DECLARE cl_prt_apr_t_cus CURSOR FOR cl_prt_apr_t_pre
      FOREACH cl_prt_apr_t_cus USING l_gcx.gcx01,l_gcx.gcx02,l_gcx.gcx03 INTO l_gcx.gcx04,l_gcx.gcx05
         IF NOT cl_null(l_gcx.gcx05) THEN   #職稱有值
            LET l_gcx04_s = l_gcx04_s
            #關號;職稱;姓名;簽核日期;簽核圖檔|
            LET l_img_list = l_img_list CLIPPED,"關號：",l_gcx04_s CLIPPED,";",l_gcx.gcx05 CLIPPED,";","______________",";","",";","","|" 
         END IF
      END FOREACH
   END IF
   
   RETURN l_img_list
END FUNCTION
###FUN-910012 END ###
 
 
#No.FUN-860089 -- start --
FUNCTION cl_prt_cs_preview(p_prog,p_sql)
DEFINE p_prog                 LIKE gcy_file.gcy01
DEFINE p_sql                  STRING
DEFINE l_option               LIKE type_file.chr1
DEFINE lw_window              ui.Window
DEFINE lf_form                ui.Form
DEFINE lnode_root             om.DomNode
DEFINE lnode_frm              om.DomNode
DEFINE lnode_tool             om.DomNode
DEFINE lnode_item             om.DomNode
DEFINE lst_wins               om.NodeList
DEFINE lst_tool               om.NodeList
DEFINE lst_form               om.NodeList
DEFINE l_p                    LIKE type_file.num10
DEFINE l_i                    LIKE type_file.num10
DEFINE l_status               LIKE type_file.chr1
DEFINE l_cmd                  STRING
DEFINE l_gcy05                LIKE gcy_file.gcy05
DEFINE l_cnt                  LIKE type_file.num10
 
    IF g_aza.aza93 = 'N' OR g_aza.aza93 IS NULL THEN 
       RETURN 1 
    END IF
 
    LET g_query_prog = g_prog
 
    SELECT COUNT(*) INTO l_cnt FROM gcy_file
      WHERE gcy01 = g_query_prog AND gcy02 = "Y"
    IF l_cnt = 0 THEN
         SELECT COUNT(*) INTO l_cnt FROM gcy_file
           WHERE gcy01 = g_query_prog AND gcy02 = "N" 
         LET g_query_cust = "N"
    ELSE
       LET g_query_cust = "Y"
    END IF
    
    SELECT gcy05 INTO l_gcy05 FROM gcy_file
     WHERE gcy01 = g_query_prog AND gcy02 = g_query_cust
       AND gcy03 = 'default'    AND gcy04 = g_user
    IF cl_null(l_gcy05) THEN
       SELECT gcy05 INTO l_gcy05 FROM gcy_file
        WHERE gcy01 = g_query_prog AND gcy02 = g_query_cust
          AND gcy03 = g_clas       AND gcy04 = 'default'
       IF cl_null(l_gcy05) THEN
          SELECT gcy05 INTO l_gcy05 FROM gcy_file
           WHERE gcy01 = g_query_prog AND gcy02 = g_query_cust
             AND gcy03 = 'default'    AND gcy04 = 'default'
       END IF
    END IF
 
    SELECT zz14 INTO g_zz.zz14 FROM zz_file WHERE zz01 = g_query_prog
    IF l_gcy05 = "N" OR (g_zz.zz14 ="1" AND cl_null(l_gcy05)) THEN
       RETURN 1
    ELSE
      #憑證報表不需自動產生 p_crdata_set 設定
      #若 p_crdata_set 已經有資料的存在，就要一併檢查其temptable or sql是否有異動
      IF (g_zz.zz14 != "1" OR g_zz.zz14 IS NULL) OR l_cnt> 0 
      THEN
         IF cl_null(g_cr_sql) THEN 
            LET g_cr_sql = p_sql
         END IF
         LET g_cr_sql = cl_replace_str(g_cr_sql,"'","\"")    #No.FUN-630011
         IF l_cnt = 0 THEN
            LET l_cmd = "p_crdata_set '",g_query_prog CLIPPED,"' '",g_query_cust CLIPPED,
                        "' 'default' 'default' '",g_cr_sql CLIPPED,"'"
         ELSE
            LET l_cmd = "p_crdata_set '",g_query_prog CLIPPED,"' ",
                        " '' '' '' '",g_cr_sql CLIPPED,"'"
         END IF
         CALL cl_cmdrun_wait(l_cmd) 
      END IF
    END IF
 
    #背景執行時，直接產生 CR 報表
    IF g_bgjob = 'Y' THEN 
       RETURN 1 
    END IF
 
    #詢問預覽或開啟CR
    LET l_option =  cl_prt_cs_type()
    CASE l_option
         WHEN 'O'  RETURN 1            #Crystal Report
         WHEN 'P'                      #Excel
                  display "Excel"
                  CALL cl_data_to_excel(p_sql)
         OTHERWISE
           RETURN 0
    END CASE
 
    RETURN 0
END FUNCTION
 
##################################################
# Descriptions...: 詢問預覽或開啟CR
# Date & Author..:
# Input Parameter:
# Return code....:
##################################################
FUNCTION cl_prt_cs_type()
DEFINE l_option    LIKE type_file.chr1
DEFINE l_cancel_cr LIKE type_file.chr1        #FUN-950030
DEFINE l_temp      LIKE type_file.chr1
DEFINE l_i         LIKE type_file.num5
DEFINE l_gcz_t     RECORD
                      gcz05   LIKE gcz_file.gcz05,
                      gcz07   LIKE gcz_file.gcz07,
                      gcz08   LIKE gcz_file.gcz08,
                      gcz10   LIKE gcz_file.gcz10,
                      gcz11   LIKE gcz_file.gcz11,
                      gcz12   LIKE gcz_file.gcz12
                   END RECORD
      
      OPEN WINDOW cl_prt_preview_w
           WITH FORM "lib/42f/cl_prt_preview" #ATTRIBUTE(BORDER,BLUE,FORM LINE FIRST)
           ATTRIBUTE(STYLE = "report")
      CALL cl_load_act_sys(NULL)  #TQC-970130
      CALL cl_ui_locale("cl_prt_preview")
 
 
      LET l_option = 'O'
      LET l_cancel_cr = 'N'            #FUN-950030
      LET l_ac = 1
 
      CALL cl_prt_viewset_temp() RETURNING l_temp
      LET l_i = l_temp
      LET g_query_grup = g_gcy[l_i].gcy03
      LET g_query_user = g_gcy[l_i].gcy04
      CALL cl_prt_viewset_data()
 
      DISPLAY l_option    TO FORMONLY.option
      DISPLAY l_cancel_cr TO FORMONLY.cancel_cr     #FUN-950030
      DISPLAY l_temp      TO FORMONLY.template
 
      CALL cl_set_comp_visible("page01",TRUE)  
      CALL ui.interface.refresh() 
      CALL cl_set_comp_visible("page01",FALSE)  
 
      DIALOG ATTRIBUTES(UNBUFFERED)
 
        INPUT l_option,l_cancel_cr FROM FORMONLY.option,FORMONLY.cancel_cr
                                   ATTRIBUTES(WITHOUT DEFAULTS)
           
           ON CHANGE option
              CASE l_option 
                WHEN 'O' 
                     CALL cl_set_comp_visible("page01",FALSE)  
                OTHERWISE
                     CALL cl_set_comp_visible("page01",TRUE)  
                     NEXT FIELD gcz08
              END CASE
 
        END INPUT
 
        INPUT l_temp FROM FORMONLY.template ATTRIBUTES(WITHOUT DEFAULTS)
           ON CHANGE template
              LET l_i = l_temp
              LET g_query_grup = g_gcy[l_i].gcy03
              LET g_query_user = g_gcy[l_i].gcy04
              CALL cl_prt_viewset_data()
        END INPUT
 
        INPUT ARRAY g_gcz FROM s_gcz.* 
           ATTRIBUTES (COUNT=g_rec_b, MAXCOUNT=g_max_rec,WITHOUT DEFAULTS,
                       APPEND ROW=FALSE, INSERT ROW=FALSE,DELETE ROW=FALSE)
         
           BEFORE INPUT                
              IF l_option = 'O' THEN
                 NEXT FIELD option
              END IF
  
           BEFORE ROW
              LET l_ac = ARR_CURR()
              CALL cl_set_action_active("up,down", TRUE)
              IF l_ac = 1 THEN
                 CALL cl_set_action_active("up", FALSE)
              END IF
              IF l_ac = g_rec_b THEN
                 CALL cl_set_action_active("down", FALSE)
              END IF 
 
           AFTER FIELD gcz10
              IF NOT cl_null(g_gcz[l_ac].gcz10) THEN
                 IF g_gcz[l_ac].gcz10 <= 0 THEN
                    CALL cl_err('','-32406', 0)
                    NEXT FIELD gcz10
                 END IF
              END IF
 
        END INPUT
 
        BEFORE DIALOG
       #   CALL cl_set_act_visible("close", FALSE)   #TQC-970130
           CALL cl_set_action_active("up", FALSE)
           CALL cl_set_action_active("close", FALSE) #TQC-970130
           NEXT FIELD option

        #FUN-950030
        ON ACTION accept
           IF l_cancel_cr = 'Y' THEN
              LET g_action_choice = "cancel_cr"
              LET l_temp = cl_prt_save(l_temp)
           END IF
           EXIT DIALOG
 
        ON ACTION cancel
           LET INT_FLAG=TRUE
           EXIT DIALOG
 
        ON ACTION save_as   #存檔
           LET g_action_choice = "save_as"
           LET l_temp = cl_prt_save(l_temp)
           DISPLAY l_temp   TO FORMONLY.template
           LET l_i = l_temp
           LET g_query_grup = g_gcy[l_i].gcy03
           LET g_query_user = g_gcy[l_i].gcy04
           CALL cl_prt_viewset_data()
 
        ON ACTION up        #欄位順序-往上移
           IF l_ac > 1 THEN
              LET l_gcz_t.* = g_gcz[l_ac-1].*
              LET g_gcz[l_ac-1].* = g_gcz[l_ac].*
              LET g_gcz[l_ac].* = l_gcz_t.*
              LET l_ac = l_ac - 1
              CALL fgl_set_arr_curr(l_ac)
              IF l_ac = 1 THEN
                 CALL cl_set_action_active("up", FALSE)
              END IF
           END IF
 
        ON ACTION down      #欄位順序-往下移
           IF l_ac < g_rec_b THEN
              LET l_gcz_t.* = g_gcz[l_ac+1].*
              LET g_gcz[l_ac+1].* = g_gcz[l_ac].*
              LET g_gcz[l_ac].* = l_gcz_t.*
              LET l_ac = l_ac + 1
              CALL fgl_set_arr_curr(l_ac)
              IF l_ac = g_rec_b THEN
                 CALL cl_set_action_active("down", FALSE)
              END IF
           END IF
 
        ON IDLE g_idle_seconds  
           CALL cl_on_idle()
           CONTINUE DIALOG
        
        ON ACTION controlg
           CALL cl_cmdask()
        
        ON ACTION about
           CALL cl_about()
        
        ON ACTION help
           CALL cl_show_help()
        
      END DIALOG 
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         LET l_option = ""
      END IF
 
      CALL cl_set_act_visible("close", TRUE)
      CLOSE WINDOW cl_prt_preview_w
      RETURN l_option
 
END FUNCTION
 
FUNCTION cl_prt_viewset_temp()
DEFINE l_sql       STRING
DEFINE l_items     STRING
DEFINE l_values    STRING
DEFINE l_cnt       LIKE type_file.num10
DEFINE l_temp      LIKE type_file.num10
 
   CALL g_gcy.clear()
 
   LET l_sql = "SELECT gcy03,gcy04 FROM gcy_file",
               " WHERE gcy01 = '",g_query_prog CLIPPED,"'",
               "   AND gcy02 = '",g_query_cust CLIPPED,"'", 
               "   AND ((gcy03='default' AND gcy04='default') OR ",
               "         gcy03='",g_clas CLIPPED,"' OR ",
               "         gcy04='",g_user CLIPPED,"')",
               "   AND gcy05 ='Y'"
   DECLARE gcy_cs CURSOR FROM l_sql
 
   LET l_cnt = 1
   FOREACH gcy_cs INTO g_gcy[l_cnt].gcy03,g_gcy[l_cnt].gcy04
       IF l_cnt = 1 THEN
          LET l_items  = l_cnt USING '<<<<<<<<<<'
          LET l_values = l_items,": ",g_gcy[l_cnt].gcy03 CLIPPED,
                          "/",g_gcy[l_cnt].gcy04 CLIPPED
       ELSE
          LET l_items  = l_items,",",l_cnt USING '<<<<<<<<<<'
          LET l_values = l_values,",",l_cnt USING '<<<<<<<<<<',": ",
                          g_gcy[l_cnt].gcy03 CLIPPED,"/",g_gcy[l_cnt].gcy04 CLIPPED
       END IF
 
       IF g_gcy[l_cnt].gcy03 = g_clas AND NOT cl_null(l_temp) THEN
          LET l_temp = l_cnt
       END IF
       IF g_gcy[l_cnt].gcy04 = g_user THEN
          LET l_temp = l_cnt
       END IF
 
       LET l_cnt = l_cnt + 1
   END FOREACH
   CLOSE gcy_cs
 
   CALL g_gcy.deleteElement(l_cnt)
 
   CALL cl_set_combo_items("template", l_items,l_values) 
 
   IF cl_null(l_temp) OR l_temp = 0 THEN 
       LET l_temp = 1
   END IF
   RETURN l_temp
END FUNCTION
 
FUNCTION cl_prt_viewset_data()
DEFINE l_sql       STRING
DEFINE l_cnt       LIKE type_file.num10
 
   LET l_sql = "SELECT gcz05,gcz07,gcz08,gcz10,gcz11,gcz12 FROM gcz_file",
               " WHERE gcz01 = '",g_query_prog CLIPPED,"'",
               "   AND gcz02 = '",g_query_cust CLIPPED,"'", 
               "   AND gcz03 = '",g_query_grup CLIPPED,"'",
               "   AND gcz04 = '",g_query_user CLIPPED,"'",
               "   AND gcz06 = '",g_rlang CLIPPED,"'",
               " ORDER BY gcz05"
   DECLARE gcz_cs CURSOR FROM l_sql
 
   LET l_cnt = 1
   FOREACH gcz_cs INTO g_gcz[l_cnt].gcz05,g_gcz[l_cnt].gcz07,g_gcz[l_cnt].gcz08,
                       g_gcz[l_cnt].gcz10,g_gcz[l_cnt].gcz11,g_gcz[l_cnt].gcz12
       LET l_cnt = l_cnt + 1
   END FOREACH
   CALL g_gcz.deleteElement(l_cnt)
 
   LET g_rec_b = l_cnt - 1
 
END FUNCTION
 
FUNCTION cl_prt_save(p_temp)
DEFINE p_temp      LIKE type_file.chr1
DEFINE l_cnt       LIKE type_file.num5
DEFINE l_i         LIKE type_file.num5
 
   SELECT COUNT(*) INTO l_cnt FROM gcy_file
    WHERE gcy01 = g_query_prog AND gcy02 = g_query_cust
      AND gcy03 = 'default'    AND gcy04 = g_user
   IF l_cnt > 0 AND g_action_choice = "save_as" THEN
      IF NOT cl_confirm('lib-366') THEN
         RETURN p_temp
      END IF
   END IF
 
   BEGIN WORK      
   IF l_cnt = 0 THEN
      CALL cl_prt_save_copy(p_temp) 
      IF g_success = 'N' THEN
         ROLLBACK WORK
         RETURN p_temp
      END IF
   END IF 
 
   #取消使用 CR 資料匯入至 Excel 功能
   #複製資料及更新完成即可離開
   IF g_action_choice = "cancel_cr" THEN
      UPDATE gcy_file SET gcy05='N'
       WHERE gcy01 = g_query_prog     AND gcy02 = g_query_cust 
         AND gcy03 = 'default'        AND gcy04 = g_user  
      IF SQLCA.sqlcode THEN
         CALL cl_err3("upd","gcy_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",0)    #No.FUN-660081
         ROLLBACK WORK
         RETURN p_temp
      END IF
      COMMIT WORK                               
      RETURN p_temp    
   END IF
 
   FOR l_i = 1 TO g_rec_b
       UPDATE gcz_file SET gcz08 = g_gcz[l_i].gcz08
        WHERE gcz01 = g_query_prog     AND gcz02 = g_query_cust 
          AND gcz03 = 'default'        AND gcz04 = g_user  
          AND gcz05 = g_gcz[l_i].gcz05 AND gcz06 = g_rlang
       IF SQLCA.sqlcode THEN
          CALL cl_err3("upd","gcz_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",0)    #No.FUN-660081
          ROLLBACK WORK
          RETURN p_temp
       END IF
 
       UPDATE gcz_file SET gcz10 = g_gcz[l_i].gcz10,      
                           gcz12 = g_gcz[l_i].gcz12,     
                           gcz05 = g_rec_b+l_i      
        WHERE gcz01 = g_query_prog AND gcz02 = g_query_cust 
          AND gcz03 = 'default'    AND gcz04 = g_user  
          AND gcz05 = g_gcz[l_i].gcz05 
       IF SQLCA.sqlcode THEN
          CALL cl_err3("upd","gcz_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",0)    #No.FUN-660081
          ROLLBACK WORK
          RETURN p_temp
       END IF
   END FOR
 
   FOR l_i = 1 TO g_rec_b
       UPDATE gcz_file SET gcz05 = l_i      
        WHERE gcz01 = g_query_prog AND gcz02 = g_query_cust 
          AND gcz03 = 'default'    AND gcz04 = g_user  
          AND gcz05 = g_rec_b+l_i 
       IF SQLCA.sqlcode THEN
          CALL cl_err3("upd","gcz_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",0)    #No.FUN-660081
          ROLLBACK WORK
          RETURN p_temp
       END IF
   END FOR
   CALL cl_msgany(0,0,"lib-284")
   COMMIT WORK                               
 
   CALL cl_prt_viewset_temp() RETURNING p_temp
 
   RETURN p_temp
END FUNCTION 
 
FUNCTION cl_prt_save_copy(p_temp)
DEFINE p_temp      LIKE type_file.chr1
DEFINE l_i         LIKE type_file.num5
 
    LET l_i = p_temp
 
    DROP TABLE y
    SELECT * FROM gcy_file         #單頭複製
        WHERE gcy01 = g_query_prog AND gcy02 = g_query_cust
          AND gcy03 = g_gcy[l_i].gcy03 AND gcy04 = g_gcy[l_i].gcy04
        INTO TEMP y
    UPDATE y
        SET gcy03='default',  #權限類別
            gcy04=g_user      #使用者
 
    INSERT INTO gcy_file
        SELECT * FROM y
    IF SQLCA.sqlcode THEN
        CALL cl_err3("ins","gcy_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK
        RETURN
    END IF
 
    #複製 gcz_file
    DROP TABLE x
    SELECT * FROM gcz_file         #單身複製
        WHERE gcz01 = g_query_prog     AND gcz02 = g_query_cust
          AND gcz03 = g_gcy[l_i].gcy03 AND gcz04 = g_gcy[l_i].gcy04
        INTO TEMP x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("sel","gcz_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
    UPDATE x
        SET gcz03='default',
            gcz04=g_user
    INSERT INTO gcz_file
        SELECT * FROM x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("ins","gcz_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
 
    #複製 gda_file
    DROP TABLE x
    SELECT * FROM gda_file         #單身複製
        WHERE gda01 = g_query_prog     AND gda02 = g_query_cust
          AND gda03 = g_gcy[l_i].gcy03 AND gda04 = g_gcy[l_i].gcy04
        INTO TEMP x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("sel","gda_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
    UPDATE x
        SET gda03='default',
            gda04=g_user
    INSERT INTO gda_file
        SELECT * FROM x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("ins","gda_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
 
    #複製 gdb_file
    DROP TABLE x
    SELECT * FROM gdb_file         #單身複製
        WHERE gdb01 = g_query_prog     AND gdb02 = g_query_cust
          AND gdb03 = g_gcy[l_i].gcy03 AND gdb04 = g_gcy[l_i].gcy04
        INTO TEMP x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("sel","gdb_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
    UPDATE x
        SET gdb03='default',
            gdb04=g_user
    INSERT INTO gdb_file
        SELECT * FROM x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("ins","gdb_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
 
    #複製 gdc_file
    DROP TABLE x
    SELECT * FROM gdc_file         #單身複製
        WHERE gdc01 = g_query_prog     AND gdc02 = g_query_cust
          AND gdc03 = g_gcy[l_i].gcy03 AND gdc04 = g_gcy[l_i].gcy04
        INTO TEMP x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("sel","gdc_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
    UPDATE x
        SET gdc03='default',
            gdc04=g_user
    INSERT INTO gdc_file
        SELECT * FROM x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("ins","gdc_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
 
    #複製 gdd_file
    DROP TABLE x
    SELECT * FROM gdd_file         #單身複製
        WHERE gdd01 = g_query_prog     AND gdd02 = g_query_cust
          AND gdd03 = g_gcy[l_i].gcy03 AND gdd04 = g_gcy[l_i].gcy04
        INTO TEMP x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("sel","gdd_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
    UPDATE x
        SET gdd03='default',
            gdd04=g_user
    INSERT INTO gdd_file
        SELECT * FROM x
    IF SQLCA.sqlcode THEN
        CALL cl_err3("ins","gdd_file",g_query_prog,g_query_cust,SQLCA.sqlcode,"","",1)  #No.FUN-660129
        LET g_success = 'N'
        ROLLBACK WORK                                     #TQC-790050
        RETURN
    END IF
 
END FUNCTION
#No.FUN-860089 -- end --
 
 
###FUN-8C0025 START ###
##################################################
# Descriptions...: CR報表檔名設定
# Date & Author..: tsai_yen
# Input Parameter: p_item_name(報表檔名全部選項，以"|"隔開), p_this(選擇項目)
# Return code....: 檔名段落
##################################################
FUNCTION cl_prt_filename(p_item_name,p_this)
   DEFINE p_item_name       STRING               #報表檔名全部選項，以"|"隔開
   DEFINE p_this            LIKE gcw_file.gcw05  #選擇項目
   #1: zaw01 程式代號
   #2: gaz03 程式名稱(須依照g_rlang來取得資料)
   #3: 營運中心編號
   #4: 營運中心名稱
   #5: zaw05使用者代號(zx01)
   #6: zx02使用者名稱(zx02)
   #7: 2008/12/17年月日 10碼
   #8: 05:38:59時分秒 8碼
   #A~T: p1~p20 
   DEFINE l_item             DYNAMIC ARRAY OF RECORD
             val     STRING
             END RECORD
   DEFINE l_tok       base.StringTokenizer
   DEFINE l_i                INTEGER   
   
   LET l_tok = base.StringTokenizer.createExt(p_item_name CLIPPED,"|","",TRUE)	#指定分隔符號
   WHILE l_tok.hasMoreTokens()	#依序取得子字串
      LET l_i = l_i+1
      LET l_item[l_i].val = l_tok.nextToken()
      #刪除windows不支援的檔名特殊符號
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, '\\', '')
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, '/', '')
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, ':', '')
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, '*', '')
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, '?', '')
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, '"', '')
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, '<', '')
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, '>', '')
      LET l_item[l_i].val = cl_replace_str(l_item[l_i].val, '|', '')
      LET l_item[l_i].val = l_item[l_i].val,"_"   #加上分隔符號   
   END WHILE
   
   CASE p_this
      WHEN "1"
         RETURN l_item[1].val
      WHEN "2"
         RETURN l_item[2].val
      WHEN "3"
         RETURN l_item[3].val
      WHEN "4"
         RETURN l_item[4].val
      WHEN "5"
         RETURN l_item[5].val
      WHEN "6"
         RETURN l_item[6].val
      WHEN "7"
         RETURN l_item[7].val
      WHEN "8"
         RETURN l_item[8].val
      WHEN "A"
         RETURN l_item[9].val
      WHEN "B"
         RETURN l_item[10].val
      WHEN "C"
         RETURN l_item[11].val
      WHEN "D"
         RETURN l_item[12].val
      WHEN "E"
         RETURN l_item[13].val
      WHEN "F"
         RETURN l_item[14].val
      WHEN "G"
         RETURN l_item[15].val
      WHEN "H"
         RETURN l_item[16].val
      WHEN "I"
         RETURN l_item[17].val
      WHEN "J"
         RETURN l_item[18].val
      WHEN "K"
         RETURN l_item[19].val
      WHEN "L"
         RETURN l_item[20].val
      WHEN "M"
         RETURN l_item[21].val
      WHEN "N"
         RETURN l_item[22].val
      WHEN "O"
         RETURN l_item[23].val
      WHEN "P"
         RETURN l_item[24].val
      WHEN "Q"
         RETURN l_item[25].val
      WHEN "R"
         RETURN l_item[26].val
      WHEN "S"
         RETURN l_item[27].val
      WHEN "T"
         RETURN l_item[28].val
      OTHERWISE
         RETURN ""
    END CASE
END FUNCTION
###FUN-8C0025 END ###
 
###FUN-940099 START ###
##################################################
# Descriptions...: 查aooi999的資訊
# Date & Author..: 2009/04/20
# Input Parameter: p_prog
# Return code....: l_mlj03,l_mlj04,l_mlj05,l_mlj06,l_mlj08,l_mlj09,l_zax33
##################################################
FUNCTION cl_prt_cs3_aooi999(p_prog)
   DEFINE p_prog                 LIKE zaw_file.zaw01
   DEFINE l_cnt                  LIKE type_file.num5
   DEFINE l_str                  STRING
   DEFINE l_mlj01                LIKE mlj_file.mlj01
   DEFINE l_mlj03                LIKE mlj_file.mlj03
   DEFINE l_mlj04                LIKE mlj_file.mlj04
   DEFINE l_mlj05                LIKE mlj_file.mlj05
   DEFINE l_mlj06                LIKE mlj_file.mlj06
   DEFINE l_mlj08                LIKE mlj_file.mlj08
   DEFINE l_mlj09                LIKE mlj_file.mlj09
   DEFINE l_zax33                LIKE zax_file.zax33
   
   #程式代號為優先
   SELECT COUNT(*) INTO l_cnt FROM mlj_file WHERE mlj01=p_prog
   IF l_cnt >0 THEN  
      LET l_mlj01 = p_prog
   ELSE
      LET l_mlj01 = "CR"
   END IF 
   
   SELECT mlj03,mlj04,mlj05,mlj06,mlj08,mlj09 INTO l_mlj03,l_mlj04,l_mlj05,l_mlj06,l_mlj08,l_mlj09
      FROM mlj_file WHERE mlj01=l_mlj01
   
   IF cl_null(l_mlj09) THEN LET l_mlj09="N" END IF
   
   #用使用者的Email當寄件者
   IF l_mlj09 = "N" THEN    	
      SELECT zx09 INTO l_zax33 FROM zx_file  WHERE zx01 = g_user
      LET l_zax33 = l_zax33 CLIPPED
   END IF
   
   #用系統寄件者串Email當寄件者
   IF cl_null(l_zax33) THEN  
      LET l_str = l_mlj05 CLIPPED
      IF l_str.getindexof("@", 1) > 0 THEN
         LET l_zax33 = l_mlj05 CLIPPED
      ELSE
         LET l_zax33 = l_mlj05 CLIPPED,"@",l_mlj03 CLIPPED
      END IF
   END IF
   
   RETURN l_mlj03,l_mlj04,l_mlj05,l_mlj06,l_mlj08,l_mlj09,l_zax33
END FUNCTION
###FUN-940099 END ###

#No.FUN-A60063 --start--
############################################################
# Descriptions...: 根據程式代號、使用者、權限類別取出zv_file的資料
#                  取出的資料會做為cl_prt_chkzv()判斷的依據
# Date & Author..:
# Input Parameter: none
# Return code....: none
############################################################
FUNCTION cl_get_zvcr()
    DEFINE l_zv_rec     RECORD
           zv02         LIKE zv_file.zv02,
           zv05         LIKE zv_file.zv05,
           zv06         LIKE zv_file.zv06,
           zv07         LIKE zv_file.zv07,
           zv08         LIKE zv_file.zv08
           END RECORD
    DEFINE l_zv_arr   DYNAMIC ARRAY OF RECORD
           zv02         LIKE zv_file.zv02,
           zv05         LIKE zv_file.zv05,
           zv06         LIKE zv_file.zv06,
           zv07         LIKE zv_file.zv07,
           zv08         LIKE zv_file.zv08
           END RECORD
    DEFINE l_i          LIKE type_file.num10
    DEFINE l_zv_index   LIKE type_file.num10
    
    DECLARE zv06_curs CURSOR FOR SELECT zv02,zv05,zv06,zv07,zv08 FROM zv_file 
        WHERE zv01 = g_prog AND ((zv02 = 'default' AND zv05 = 'default')
        OR zv02 = g_user OR zv05 = g_clas)
        AND zv03 = 'L' AND zvacti IN ('Y','y')
        ORDER BY zv02,zv05

    LET l_i = 1
    LET l_zv_index = 0

    #找使用者設定的資料
    FOREACH zv06_curs INTO l_zv_rec.*
        LET l_zv_arr[l_i].* = l_zv_rec.*
        IF l_zv_arr[l_i].zv02 = g_user THEN
            LET l_zv_index = l_i
        END IF 
        LET l_i = l_i + 1
    END FOREACH

    #未找到資料時，找權限類別的資料
    IF l_zv_index = 0 THEN
        FOR l_i = 1 TO l_zv_arr.getLength()
            IF l_zv_arr[l_i].zv05 = g_clas THEN
                LET l_zv_index = l_i
                EXIT FOR
            END IF
        END FOR 
    END IF
    
    #未找到資料時，找預設的資料
    IF l_zv_index = 0 THEN
        FOR l_i = 1 TO l_zv_arr.getLength()
            IF l_zv_arr[l_i].zv02 = 'default' 
                AND l_zv_arr[l_i].zv05 = 'default'
            THEN
                LET l_zv_index = l_i
                EXIT FOR
            END IF
        END FOR 
    END IF

    #找到資料
    IF l_zv_arr.getLength() >= l_zv_index AND l_zv_index > 0 THEN
        LET g_zv_cr.zv06 = l_zv_arr[l_zv_index].zv06
        LET g_zv_cr.zv07 = l_zv_arr[l_zv_index].zv07
        LET g_zv_cr.zv08 = l_zv_arr[l_zv_index].zv08
    ELSE    #未找到資料
        LET g_zv_cr.zv06 = NULL
        LET g_zv_cr.zv07 = NULL
        LET g_zv_cr.zv08 = NULL
    END IF 
END FUNCTION

##################################################
# Descriptions...: 檢查p_zv是否有設定該筆直接送印的資料
# Date & Author..:
# Input Parameter: none
# Return code....: true     zv_file有資料
#                  false    zv_file無資料
##################################################
FUNCTION cl_prt_chkzv()
    RETURN (NOT cl_null(g_zv_cr.zv06))
END FUNCTION

#################################################################
# Descriptions...: 呼叫GDC開啟自行開發的ClientPrint.exe執行CR直接送印
# Date & Author..: 
# Input Parameter: p_url 呼叫CR報表直接送印的URL
# Return code....: none
#################################################################
FUNCTION cl_prt_silent_print(p_url)
    DEFINE p_url STRING
    
    LET p_url = "C:\\TIPTOP\\ClientPrint.exe \"",g_zv_cr.zv08 CLIPPED,"\" \"",p_url.trim(),
                "\" \"",g_prog CLIPPED,"\" \"",g_zaw14 CLIPPED,"\""
    IF NOT cl_null(g_zv_cr.zv07) THEN
        LET p_url = p_url," \"",g_zv_cr.zv07 CLIPPED,"\""
    END IF

    #DISPLAY "p_url: ",p_url
    IF NOT cl_execClientApp(NULL, p_url) THEN
        #DISPLAY "SilentPrint Error!"
        CALL cl_err("Front Call Error: ", -16314, 1)
    END IF
END FUNCTION
#No.FUN-A60063 --end--

#No.FUN-B30131 --start--
#################################################################
# Descriptions...: 執行p_zv時, 直接選取對應的紙張大小
# Date & Author..: 
# Input Parameter: p_url 呼叫CR報表直接送印的URL
# Return code....: zaw14 紙張大小
#################################################################
FUNCTION cl_prt_zv_get_page_size(p_prog,p_template)
    DEFINE p_prog       LIKE zaw_file.zaw01
    DEFINE p_template   LIKE zaw_file.zaw08
    DEFINE la_zaw       DYNAMIC ARRAY OF RECORD
           zaw03        LIKE zaw_file.zaw03,
           zaw04        LIKE zaw_file.zaw04,
           zaw05        LIKE zaw_file.zaw05,
           zaw08        LIKE zaw_file.zaw08,
           zaw10        LIKE zaw_file.zaw10,
           zaw12        LIKE zaw_file.zaw12,
           zaw13        LIKE zaw_file.zaw13,
           zaw14        LIKE zaw_file.zaw14,
           zaw15        LIKE zaw_file.zaw15
           END RECORD
    DEFINE l_zax36      LIKE zax_file.zax36
    DEFINE l_i          LIKE type_file.num5
    DEFINE l_index1     LIKE type_file.num5
    DEFINE l_index2     LIKE type_file.num5
    DEFINE l_index3     LIKE type_file.num5
    DEFINE l_index4     LIKE type_file.num5
    DEFINE l_index5     LIKE type_file.num5
    DEFINE l_index6     LIKE type_file.num5

    DECLARE cl_prt_zv_get_page_size_cur1 CURSOR FOR
    SELECT zaw03,zaw04,zaw05,zaw08,zaw10,zaw12,zaw13,zaw14,zaw15
      FROM zaw_file WHERE zaw01=p_prog AND zaw06=g_rlang
       AND (zaw10=g_sma.sma124 OR zaw10='std') AND zaw08=p_template
       AND ((zaw04='default' AND zaw05='default') 
        OR zaw04=g_clas OR zaw05=g_user)
     ORDER BY zaw03 DESC,zaw10,zaw04,zaw05

    LET l_i = 1
    FOREACH cl_prt_zv_get_page_size_cur1 INTO la_zaw[l_i].*
        LET l_i = l_i + 1
    END FOREACH
    CALL la_zaw.deleteElement(l_i)

    FOR l_i = 1 TO la_zaw.getLength()
        CASE 
            WHEN la_zaw[l_i].zaw10=g_sma.sma124 AND la_zaw[l_i].zaw05=g_user
                LET l_index1 = l_i
            WHEN la_zaw[l_i].zaw10=g_sma.sma124 AND la_zaw[l_i].zaw04=g_clas
                LET l_index2 = l_i
            WHEN la_zaw[l_i].zaw10=g_sma.sma124 AND la_zaw[l_i].zaw04='default' AND la_zaw[l_i].zaw05='default'
                LET l_index3 = l_i
            WHEN la_zaw[l_i].zaw10='std' AND la_zaw[l_i].zaw05=g_user
                LET l_index4 = l_i
            WHEN la_zaw[l_i].zaw10='std' AND la_zaw[l_i].zaw04=g_clas
                LET l_index5 = l_i
            WHEN la_zaw[l_i].zaw10='std' AND la_zaw[l_i].zaw04='default' AND la_zaw[l_i].zaw05='default'
                LET l_index6 = l_i
        END CASE 
    END FOR

    IF l_index1 >= 1 THEN
        CALL cl_prt_zv_get_approval(la_zaw[l_index1].zaw12,la_zaw[l_index1].zaw13)
        RETURNING la_zaw[l_index1].zaw12,la_zaw[l_index1].zaw13,l_zax36
        RETURN la_zaw[l_index1].zaw03,la_zaw[l_index1].zaw04,la_zaw[l_index1].zaw05,
               la_zaw[l_index1].zaw08,l_zax36,la_zaw[l_index1].zaw14,la_zaw[l_index1].zaw15
    END IF

    IF l_index2 >= 1 THEN
        CALL cl_prt_zv_get_approval(la_zaw[l_index2].zaw12,la_zaw[l_index2].zaw13)
        RETURNING la_zaw[l_index2].zaw12,la_zaw[l_index2].zaw13,l_zax36
        RETURN la_zaw[l_index2].zaw03,la_zaw[l_index2].zaw04,la_zaw[l_index2].zaw05,
               la_zaw[l_index2].zaw08,l_zax36,la_zaw[l_index2].zaw14,la_zaw[l_index2].zaw15
    END IF

    IF l_index3 >= 1 THEN
        CALL cl_prt_zv_get_approval(la_zaw[l_index3].zaw12,la_zaw[l_index3].zaw13)
        RETURNING la_zaw[l_index3].zaw12,la_zaw[l_index3].zaw13,l_zax36
        RETURN la_zaw[l_index3].zaw03,la_zaw[l_index3].zaw04,la_zaw[l_index3].zaw05,
               la_zaw[l_index3].zaw08,l_zax36,la_zaw[l_index3].zaw14,la_zaw[l_index3].zaw15
    END IF

    IF l_index4 >= 1 THEN
        CALL cl_prt_zv_get_approval(la_zaw[l_index4].zaw12,la_zaw[l_index4].zaw13)
        RETURNING la_zaw[l_index4].zaw12,la_zaw[l_index4].zaw13,l_zax36
        RETURN la_zaw[l_index4].zaw03,la_zaw[l_index4].zaw04,la_zaw[l_index4].zaw05,
               la_zaw[l_index4].zaw08,l_zax36,la_zaw[l_index4].zaw14,la_zaw[l_index4].zaw15
    END IF

    IF l_index5 >= 1 THEN
        CALL cl_prt_zv_get_approval(la_zaw[l_index5].zaw12,la_zaw[l_index5].zaw13)
        RETURNING la_zaw[l_index5].zaw12,la_zaw[l_index5].zaw13,l_zax36
        RETURN la_zaw[l_index5].zaw03,la_zaw[l_index5].zaw04,la_zaw[l_index5].zaw05,
               la_zaw[l_index5].zaw08,l_zax36,la_zaw[l_index5].zaw14,la_zaw[l_index5].zaw15
    END IF

    IF l_index6 >= 1 THEN
        CALL cl_prt_zv_get_approval(la_zaw[l_index6].zaw12,la_zaw[l_index6].zaw13)
        RETURNING la_zaw[l_index6].zaw12,la_zaw[l_index6].zaw13,l_zax36
        RETURN la_zaw[l_index6].zaw03,la_zaw[l_index6].zaw04,la_zaw[l_index6].zaw05,
               la_zaw[l_index6].zaw08,l_zax36,la_zaw[l_index6].zaw14,la_zaw[l_index6].zaw15
    END IF

    RETURN NULL,NULL,NULL,NULL,NULL,NULL,NULL    
END FUNCTION

FUNCTION cl_prt_zv_get_approval(p_zaw12,p_zaw13)
    DEFINE p_zaw12  LIKE zaw_file.zaw12
    DEFINE p_zaw13  LIKE zaw_file.zaw13
    DEFINE l_zax36  LIKE zax_file.zax36
    
    #列印簽核位置(0:不列印簽核/ 1:頁尾/ 2:表尾)
    IF cl_null(p_zaw12) THEN
        LET p_zaw12 ="N"   #預設不列印簽核
    END IF
    IF cl_null(p_zaw13) THEN
        LET p_zaw13 ="1"   #預設列印簽核未置於頁尾
    END IF
    IF p_zaw12 = "Y" THEN
        LET l_zax36 = p_zaw13 CLIPPED   
    ELSE
        LET l_zax36 = "0"
    END IF

    RETURN p_zaw12,p_zaw13,l_zax36
END FUNCTION
#No.FUN-B30101 --end--
