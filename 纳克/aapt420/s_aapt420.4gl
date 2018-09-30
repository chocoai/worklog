#該程式未解開Section, 採用最新樣板產出!
{<section id="s_aapt420.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0082(1900-01-01 00:00:00), PR版次:0082(1900-01-01 00:00:00)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000377
#+ Filename...: s_aapt420
#+ Description: 應付核銷應用元件
#+ Creator....: 03080(2014-09-25 09:37:06)
#+ Modifier...: 00000 -SD/PR- 00000
 
{</section>}
 
{<section id="s_aapt420.global" >}
#應用 p00 樣板自動產生(Version:6)
#add-point:填寫註解說明 name="main.memo"
#150317apo        2015/03/17 By apo      計算可沖銷金額時,以apcc109來扣除被沖銷單據之直接沖帳/直接付款金額+aapt420中已確認的金額
#150501           2015/05/01 By apo      取得帳款單資訊及可沖金額時,應考慮到沖銷參數:1/2時帳款單身項次與多帳期可能不同
#150512-00036#1   2015/05/19 By apo      開窗改為多選回傳寫入單身
#150602-00031#1   2015/06/02 By apo      待抵單之來源預付/預收單據必須先收付款後,待抵單才可以被沖銷
#140930-00020#17  2015/06/12 By Reanna   增加自動產生付款金額項目(apde_t)
#150622-00004#1   2015/06/25 By apo      增加立帳單別"是否產生分錄"+帳別設定"核銷限定立帳單已產生傳票"考慮
#150629-00028#1   2015/06/29 By apo      屬於20:銀行匯款,則先取anmi152的科目給予預設
#150817-00025#1   2015/08/19 By Reanna   預帶沖銷科目不同款別性質取不同欄位
#150818-00032#3   2015/08/23 By RayHuang nmbc_t新增兩個欄位
#150825-00004#1   2015/08/26 By Reanna   增加產生apde時，若付款對象是EMPL，要寫入apde017=員工
#151001           2015/10/01 By 03538    直接沖帳新增到單身時,增加給予應稅折抵否欄位
#151008           2015/10/08 By albireo  可沖銷單的沖銷對象檢查增加夥伴關係
#151009           2015/10/09 By apo      屬於直接付款情形,仍需依帳戶取科目;暫估性質及非確認單據不可沖銷 
#151012-00014#2   2015/10/13 By Jessy    帶入日/月平均匯率預設值，依aoos020(S-FIN-3009)設定
#151016           20151016   By albireo  沖帳開窗對象與其交易夥伴都能納入
#151012-00014#6   2015/10/26 By RayHuang nmbc_t新增三個欄位(nmbc014~nmbc016)
#151027-00014#1   2015/10/27 By 03538    原本檢核glaa136的參數, 改為取glaa137的參數作判斷;且須檢查該立帳傳票的狀態, 應該為”確認”狀態。
#151029           2015/10/29 By 03538    多帳期的key只要到帳期為止即可,因為不同發票會拆成不同項次
#151105           2015/11/05 By 03538    151105 carol:當支付款別為10.現金,不參考S-FIN3008(直接產生銀存支付帳),一律都要產生到nmbc
#151106           2015/11/06 By 03538    151106 carol:如果付款對象是員工,則將付款單身業務人員apde017帶入nmbc004
#151130-00015#4   2015/12/23 By 02097    訂金沖銷依aoos020 參數S-FIN-3020(是否依單核銷訂金)/IF Y  則只能沖同一張採購單之訂金
#160301-00003#1   2016/03/02 By 03538    aapt420审核产生anmt520时，单头单身修正為考虑多笔
#160202-00021#2   2016/03/10 By 02097    受款人全名 apde041 欄位, 預設帶基本資料帳戶對應戶名 pmaf004
#150602-00057#3   2016/03/09 By Reanna   依據參數判斷(D-FIN-5001)資料建立者與確認者是否可為同一人
#160321-00016#2   2016/03/21 By Jessy    修正azzi920重複定義之錯誤訊息
#160322-00025#11  2016/03/23 By 02114    nmbc_t增加nmbcorga记示画面上的来源组织栏位，原nmbcsite依旧记录资金中心
#160324-00032#2   2016/03/30 By 03538    付款且類型為20:電匯款時,取科目依參數S-FIN-3008,Y取anmi121科目,N取anmi152科目
#160429-00010#1   2016/04/29 By 03538    交易銀行+帳戶的檢核,也應該加入交易對象當作key值
#160419-00040#1   2016/05/09 By 03538    若票據類別屬即期票據, 則要寫nmbc
#160509-00004#89  2016/06/29 By 03538    檢核銀行資訊元件,沒有傳入付款對象時,只檢核受款銀行與帳戶間的合理性;付款類型8*等同4*處理
#160628-00002#2   2016/07/13 By 02599    當aapt3*作業中直接沖帳且是應付折抵時，需要將含稅待抵單的稅額拆分出來顯示
#160704-00022#1   2016/07/18 By 03538    應付帳款可沖金額應扣除留置金額
#160517-00001#5   2016/07/24 By 03538    aapt3* 直接付款/aapt420 付款為現金或即期票等, 在本支程式直接寫nmbc 要同時寫一筆 glbc
#160428-00001#6   160729     By albireo  直接付款產生待抵多一個性質
#160705-00035#1   2016/07/26 By Reanna   增加預付&雜項發票立帳流程
#160805-00053#1   2016/08/05 By 03538    付款單身屬於付款且為票據付款時,非即期票據者,不寫入nmbc;aapt420已加入控卡:不為即期票者,不能維護票據號碼,此處為防呆
#160729-00010#1   2016/08/12 By 06821    畫面增加兩個開窗欄位1.現金及即期匯款指定帳戶/2.應付票據開票指定帳戶,依據款別作為 apde008 預設值,參考 aapt420 付款帳戶方式,有開放人員權限的帳戶才可供其選擇
#160816-00022#1   2016/08/23 By 03538    為aapt430增加以帳款單號+項次來看剩餘可沖金額的類型
#160308-00010#47  2016/09/23 By 07491    背景审核將核銷日期更新為當天日期
#161024-00016#1   2016/10/24 By 05634    aap-00190控卡增加判斷已轉(apde009)='Y',且anmt440/anmt460來源類型=AP:應付請款單(nmck001=AP),則不允許取消確認
#161107-00035#1   2016/11/09 By 05634    產生到aapt420應該以付款對象為主(apca005)
#161111-00048#4   2016/11/15 By 08171    SUB_程式中DEFINE / INSERT INTO 有星號整批調整
#160901-00012#1   2016/11/21 By Reanna   調整轉第三方稅別取用取同一稅區(aooi610)零稅率的第一筆(oodb008課稅別=2)
#160802-00007#2   161128     By albireo  一次性交易對象識別碼(pmaa004=2)功能應用 
#161124-00029#1   2016/11/29 By 05634    aoos020 參數 S-FIN-3020 "是否依單核銷訂金",當此參數為Y,且aapt3*單身來源類型至少有一筆是11:入庫單,才需控卡aap-00424(非同張採購單之訂金待抵單)
#161129-00040#1   2016/11/30 By 00222    付款類型=15.現金折扣時，沒有帶出現金折扣的會計科目，應該改抓agli160的9711_23會科
#161209-00034#1   2016/12/12 By 05634    產生到axrt330 1.單頭的收款條件/銷售分類/應收帳款類別,應該抓apmm102裡AR類 2.增加寫入單身收款條件(axcb031),後續寫入多帳期xrcc才抓的到收款條件
#161209-00035#1   161213     By albireo  同axrt400處理161125-00025邏輯修正開窗範圍
#161208-00026#25  2016/12/14 By 08732    SUB_程式中DEFINE / INSERT INTO 有星號整批調整(針對SELECT *的部份)
#161206-00042#8   2016/12/21 By 08732    s_aapt420_source_doc_query傳入參數p_apcadocno改成p_lsjs
#161222-00030#1   2016/12/26 By 01531    anmt440单身的请款科目为空，应nmcl003来源于apde016
#161221-00046#1   2016/12/27 By 05634    s_aapt420_ins_nmck函式,将apde024票据号码回写到nmck025栏位
#161226-00039#1   2016/12/28 By Reanna   調整刪除待底單回寫最大號邏輯
#161114-00009#1   2017/01/05 By 06821    單據審核時的效能調校
#170112-00056#1   170118     By albireo  第三方轉付時摘要帶入立帳單
#170123-00045#5   170125     By 06821    SQL中撈取資料時使用 rownum 語法撰寫方式調整
#170202-00027#1   2017/02/02 By Reanna   AP單作廢時，應一併回寫：1.最後異動日及修改者2.一併清空多角序號apca047
#170213-00023#1   2017/02/17 By fionchen 處理當帳款類別為31時,開窗選擇帳款單號時,無法選擇的問題
#170217-00039#1   2017/02/20 By 05634    修正160202-00021#2,抓取pmaf004寫到apde041才對
#170221-00016#1   2017/02/21 By 05634    若aoos020參數S-FIN-4012(銀存支出匯率來源),為23:銀行日平均匯率,則呼叫s_anm_get_exrate,取銀行日平均匯率
#170301-00021#1   2017/03/01 By 09263    g_prog整批調整
#170303-00003#1   2017/03/07 By 01531    1.aapt420:單身[其他明細]頁箋,增加"營運據點"的顯示，apde可維護，apce源自帳款cc表, 不可維護。
#                                        2.有來源單據者,依來源單決定据點,繳款單取orga;手動新增的資料default單頭的法人據點;自動產生的匯差損益則判斷沖銷的帳款單，是否來自同一據點,IF yes THEN 帳款單據點 ELSE 單頭法人據點。
#170316-00062#1   2017/03/17 By 02114    若apde003已付款单号有值,则aapt420审核时,不再新增一笔anmt440的单身资料,改为回写原单身的来源单号和项次
#170308-00034#5   2017/03/21 By 05016   .帳款明細頁籤 帳款類型 =40.應付單沖銷 開窗增加: 帳款單性質 =31:外購應付單
#170316-00024#1   2017/03/22 By 05634    s_aapt420_auto_ins_apde,根據款別性質(apde006),決定付款日(apde032)預帶規則
#170324-00128#1   2017/03/2  By 08729    核销预付账款，开窗挑不到,手工key可以通过
#170328-00033#1   2017/03/28 By 06821    当aoos020参数核销方式是3:冲销至明细(单号+项次+账期)时，aapt330和aapt331多账期是一条，但在aapt420核销时，又是按照单身+多账期明细来核销的，带不出金额。
#170328-00099#1   170330     By albireo  s_aapt420_auto_ins_apde中,此為對應帳款單金額自動產生對應付款單身,未考慮借貸方NET之後的結果再產生造成錯誤
#170330-00083#1   2017/03/30 By 08532    補充170329-00005的修改
#170413-00077#1   2017/04/14 By 05634    修正s_aapt420_ws_confirm,在CALL s_aapt420_conf_upd(l_apdald,p_apdadocno,p_flag)第三個參數p_flag只有定義未給值的問題
#161201-00031#1   2017/04/19 By Sabrina  將q_apcadocno_3、q_xrcadocno_8開窗改為程式開窗
#170322-00052#23  2017/04/19 By Mars     增加EC整合拋轉段落
#170322-00052#28  2017/05/02 By Mars     EC整合拋轉段落調整
#170522-00006#6   2017/05/22 By Jessica  BPM整合增加自動確認的交易前處理元件s_aapt420_ws_preprocess
#170615-00061#11  2017/06/16 By 06821    AAP模組多表JOIN時 ent 缺失調整
#170618-00252#1   170618     By albireo  原2類存在費用分攤單身就不可沖銷,現邏輯調整22 24 29以外的2類待抵單存在費用分攤單身才不可沖銷
#170618-00288#1   170619     By 06821    取消確認時,若付款單身有已付款單號,則須檢查若該付款單(anmt440/460...)單據狀態已確認,則aapt420不能取消確認
#170620-00106#1   170620     By 06821    已付款單如果anmt460的來源為IV發票來源請款單,則aapt420取消確認時不可以清空單身的已付款單號與已付註記
#170618-00516#1   2017/06/26 By 01531    修正#170620-00106#1
#170531-00062#1   2017/07/05 By 08729    直接沖帳時：開窗有檢核,但輸入沖銷單號後，增加檢核單據日期的合理性。
#170620-00025#1   2017/07/11 By 06821    產生銀存以參數(S-FIN-3008)控制
#                                        1.當付款單直接產生銀存為N時,aapt420 交易款別為 20 時比照款別為 30 時可到 apde014 指定匯款單別(nmckdocno)
#                                          確認段產生 anmt460 資料,相關欄位對應參考 anmp410 但狀態碼(nmckstus)須為 Y,並將實際單號(nmckdocno)更新已付款單號(apde003)
#                                        2.當付款單直接產生銀存為Y時,且 anmi120 開通網銀否 為 Y 的 20電匯款的, 則自動產生anmt460
#170714-00023#1   2017/07/24 By 08729    aapp400拋到aapt420沒有單身問題
#170802-00061#1   2017/08/08 By 05634    修正aapt420_03開窗查無aapq344待抵借支單問題
#170809-00046#1   2017/08/10 By 06821    第二单身的已轉字段為 Y ，在aapt420仅核销未做付款時, 不可以再產生 nmbc_t的资料
#170627-00020#1   2017/08/16 By 05634    調整aapt310預付訂金不用全部付完(apcc109>0),待抵單才可以被拿來沖
#170823-00020#1   2017/08/24 By 05634    開窗可挑選aapt310預付訂金產生的待抵單apcc109>0即可沖抵
#170823-00010#1   2017/08/25 By 06821    直接沖帳輸入帳款單號,沖銷項次,帳期後,會提示aap-00642沖銷單的日期不可大於單據立帳日期，請重新輸入
#170621-00044#1   2017/08/28 By 06821    aapt3*限定直接沖帳內只能使用原幣金額付款
#170918-00005#1   2017/09/18 By 06821    延續 170620-00025 直接判斷 anmi120 當開通網銀否(nmaa006) 為 Y 時,才設定 anmt460 單別等相關資料,目的區隔 anmp410 應用
#170926-00004#1   2017/09/26 By 06821    產生待抵時不考慮單別參數自動確認否(本就以確認寫入),調整為以未確認寫入,增加確認時檢核段,當檢核有誤報錯,無誤則更新狀態為確認
#170929-00040#1   2017/09/29 By 05634    s_aapt420_ins_payable_detail如應稅扣抵='N',則直接LET l_apce.apce103=l_apce.apce109
#170930-00038#1   2017/10/02 By 06821    產生匯款單時,付款對象帶aapt420單頭付款對象
#170322-00076#1   2017/10/11 By 04152    指定付款帳戶時，依據帳戶幣別為主，付款單身以帳款單身本幣為依據，用帳戶幣別的匯率反推原幣金額
#171010-00013#1   2017/10/12 By 05795    税种参考s_axrt400的取值方法，来取值
#171012-00047#1   2017/10/18 By 05016    抓取glaa_t的時候以帳套為KEY 不需指定一定要主帳。
#171026-00025#1   2017/10/26 By 05634    確認時如果S-FIN-3008='N'不需要自動產生anmt460.
#171107-00015#1   2017/11/07 By 06821    單據確認需檢核 如付款款別性質為 20:銀行電匯款 則 控卡受款帳戶、受款銀行 不得為空
#end add-point
#add-point:填寫註解說明(客製用) name="main.memo_customerization"

#end add-point
#(ver:6) ---start---
#add-point:填寫註解說明(行業用) name="global.memo_industry"

#end add-point
#(ver:6) --- end ---
 
IMPORT os
#add-point:增加匯入項目 name="main.import"
IMPORT util
#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
{</section>}
 
{<section id="s_aapt420.free_style_variable" >}
#add-point:free_style模組變數(Module Variable) name="free_style.variable"
 TYPE type_g_apde RECORD
   apdadocdt  LIKE apda_t.apdadocdt,
   apda003  LIKE apda_t.apda003,
   apdesite   LIKE apde_t.apdesite,
   apdecomp   LIKE apde_t.apdecomp,
   apdeorga   LIKE apde_t.apdeorga,
   
   apdedocno  LIKE apde_t.apdedocno,
   apdeseq    LIKE apde_t.apdeseq,
   apde001    LIKE apde_t.apde001,
   apde006    LIKE apde_t.apde006,                             
   apde008    LIKE apde_t.apde008,
   
   apde011    LIKE apde_t.apde011,
   apde012    LIKE apde_t.apde012,                                                                                                   
   apde014    LIKE apde_t.apde014,
   apde021    LIKE apde_t.apde021,   
   apde024    LIKE apde_t.apde024, 
   
   apde032    LIKE apde_t.apde032,
   apde038    LIKE apde_t.apde038,
   apde039    LIKE apde_t.apde039,                             
   apde040    LIKE apde_t.apde040,                             
   apde041    LIKE apde_t.apde041,  
   
   apde100    LIKE apde_t.apde100,
   apde101    LIKE apde_t.apde101,
   apde109    LIKE apde_t.apde109,
   apde119    LIKE apde_t.apde119,
   apdeld     LIKE apde_t.apdeld,
   
   apde003    LIKE apde_t.apde003,
   apde016    LIKE apde_t.apde016,
   apde121    LIKE apde_t.apde121,
   apde129    LIKE apde_t.apde129,
   apde131    LIKE apde_t.apde131,
              
   apde139    LIKE apde_t.apde139   
       END RECORD     
 TYPE type_g_apde2 RECORD
   apdadocdt   LIKE apda_t.apdadocdt,
   apda003     LIKE apda_t.apda003,
   apda005     LIKE apda_t.apda005,
   apdecomp    LIKE apde_t.apdecomp,
   apdedocno   LIKE apde_t.apdedocno,
   
   apdeseq   LIKE apde_t.apdeseq,
   apdeld      LIKE apde_t.apdeld,
   apdesite    LIKE apde_t.apdesite,
   apde002     LIKE apde_t.apde002,
   apde014     LIKE apde_t.apde014,
   
   apde016     LIKE apde_t.apde016,
   apde017     LIKE apde_t.apde017,
   apde018     LIKE apde_t.apde018,
   apde019     LIKE apde_t.apde019,
   apde020     LIKE apde_t.apde020,
   
   apde022     LIKE apde_t.apde022,
   apde023     LIKE apde_t.apde023,
   apde035     LIKE apde_t.apde035,
   apde036     LIKE apde_t.apde036,
   apde042     LIKE apde_t.apde042,
   
   apde043     LIKE apde_t.apde043,
   apde044     LIKE apde_t.apde044,
   apde051     LIKE apde_t.apde051,
   apde052     LIKE apde_t.apde052,
   apde053     LIKE apde_t.apde053,
   
   apde054     LIKE apde_t.apde054,
   apde055     LIKE apde_t.apde055,
   apde056     LIKE apde_t.apde056,
   apde057     LIKE apde_t.apde057,
   apde058     LIKE apde_t.apde058,
   
   apde059     LIKE apde_t.apde059,
   apde060     LIKE apde_t.apde060,   
   apde100     LIKE apde_t.apde100,
   apde101     LIKE apde_t.apde101,   
   apde109     LIKE apde_t.apde109,
   
   apde119     LIKE apde_t.apde119
  ,apde010     LIKE apde_t.apde010   #170112-00056#1
          END RECORD  
 TYPE type_g_apde3 RECORD
   apdadocno   LIKE apda_t.apdadocno,
   apdadocdt   LIKE apda_t.apdadocdt,
   apdacomp    LIKE apda_t.apdacomp,
   apda005     LIKE apda_t.apda005,
   apdeseq     LIKE apde_t.apdeseq,    #160301-00003#1
   apde003     LIKE apde_t.apde003, 
   
   apde024     LIKE apde_t.apde024, 
   apde100     LIKE apde_t.apde100,  
   apde101     LIKE apde_t.apde101,   
   apde109     LIKE apde_t.apde109,   
   apde119     LIKE apde_t.apde119,
   
   apde121     LIKE apde_t.apde121,
   apde131     LIKE apde_t.apde131
          END RECORD  
#end add-point
 
{</section>}
 
{<section id="s_aapt420.global_variable" >}
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
{</section>}
 
{<section id="s_aapt420.other_dialog" >}

 
{</section>}
 
{<section id="s_aapt420.other_function" readonly="Y" >}
################################################################################
# Descriptions...: 確認前檢查
# Memo...........:
# Usage..........: CALL s_aapt420_conf_chk(p_apdald,p_apdadocno)
#                  RETURNING r_success
# Date & Author..: 14/10/10 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_conf_chk(p_apdald,p_apdadocno)
DEFINE p_apdald         LIKE apda_t.apdald
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE r_success        LIKE type_t.num5
DEFINE l_amt1           LIKE type_t.num20_6
DEFINE l_amt2           LIKE type_t.num20_6
DEFINE l_count          LIKE type_t.num5
DEFINE l_count2         LIKE type_t.num5
DEFINE l_dfin0030       LIKE type_t.chr1
DEFINE l_ap_slip        LIKE ooba_t.ooba002  #總帳單別
DEFINE l_glaa121        LIKE glaa_t.glaa121
#DEFINE l_apda           RECORD LIKE apda_t.* #161111-00048#4  mark
#161111-00048#4 --s add
DEFINE l_apda RECORD  #付款核銷單單頭檔
       apdaent LIKE apda_t.apdaent, #企業編號
       apdacomp LIKE apda_t.apdacomp, #法人
       apdald LIKE apda_t.apdald, #帳套
       apdadocno LIKE apda_t.apdadocno, #單號
       apdadocdt LIKE apda_t.apdadocdt, #單據日期
       apdasite LIKE apda_t.apdasite, #帳務組織
       apda001 LIKE apda_t.apda001, #帳款單性質
       apda002 LIKE apda_t.apda002, #NO USE
       apda003 LIKE apda_t.apda003, #帳務人員
       apda004 LIKE apda_t.apda004, #帳款核銷對象
       apda005 LIKE apda_t.apda005, #付款對象
       apda006 LIKE apda_t.apda006, #一次性交易識別碼
       apda007 LIKE apda_t.apda007, #產生方式
       apda008 LIKE apda_t.apda008, #來源參考單號
       apda009 LIKE apda_t.apda009, #沖帳批序號
       apda010 LIKE apda_t.apda010, #集團代付付單號
       apda011 LIKE apda_t.apda011, #差異處理
       apda012 LIKE apda_t.apda012, #退款類型
       apda013 LIKE apda_t.apda013, #分錄底稿是否可重新產生
       apda014 LIKE apda_t.apda014, #拋轉傳票號碼
       apda015 LIKE apda_t.apda015, #作廢理由碼
       apda016 LIKE apda_t.apda016, #列印次數
       apda017 LIKE apda_t.apda017, #MEMO備註
       apda018 LIKE apda_t.apda018, #付款(攤銷)理由碼
       apda019 LIKE apda_t.apda019, #攤銷目的方式
       apda020 LIKE apda_t.apda020, #分攤金額方式
       apda021 LIKE apda_t.apda021, #目的成本要素
       apda113 LIKE apda_t.apda113, #應核銷本幣金額
       apda123 LIKE apda_t.apda123, #應核銷本幣二金額
       apda133 LIKE apda_t.apda133, #應核銷本幣三金額
       apdaownid LIKE apda_t.apdaownid, #資料所有者
       apdaowndp LIKE apda_t.apdaowndp, #資料所屬部門
       apdacrtid LIKE apda_t.apdacrtid, #資料建立者
       apdacrtdp LIKE apda_t.apdacrtdp, #資料建立部門
       apdacrtdt LIKE apda_t.apdacrtdt, #資料創建日
       apdamodid LIKE apda_t.apdamodid, #資料修改者
       apdamoddt LIKE apda_t.apdamoddt, #最近修改日
       apdacnfid LIKE apda_t.apdacnfid, #資料確認者
       apdacnfdt LIKE apda_t.apdacnfdt, #資料確認日
       apdapstid LIKE apda_t.apdapstid, #資料過帳者
       apdapstdt LIKE apda_t.apdapstdt, #資料過帳日
       apdastus LIKE apda_t.apdastus, #狀態碼
       apdaud001 LIKE apda_t.apdaud001, #自定義欄位(文字)001
       apdaud002 LIKE apda_t.apdaud002, #自定義欄位(文字)002
       apdaud003 LIKE apda_t.apdaud003, #自定義欄位(文字)003
       apdaud004 LIKE apda_t.apdaud004, #自定義欄位(文字)004
       apdaud005 LIKE apda_t.apdaud005, #自定義欄位(文字)005
       apdaud006 LIKE apda_t.apdaud006, #自定義欄位(文字)006
       apdaud007 LIKE apda_t.apdaud007, #自定義欄位(文字)007
       apdaud008 LIKE apda_t.apdaud008, #自定義欄位(文字)008
       apdaud009 LIKE apda_t.apdaud009, #自定義欄位(文字)009
       apdaud010 LIKE apda_t.apdaud010, #自定義欄位(文字)010
       apdaud011 LIKE apda_t.apdaud011, #自定義欄位(數字)011
       apdaud012 LIKE apda_t.apdaud012, #自定義欄位(數字)012
       apdaud013 LIKE apda_t.apdaud013, #自定義欄位(數字)013
       apdaud014 LIKE apda_t.apdaud014, #自定義欄位(數字)014
       apdaud015 LIKE apda_t.apdaud015, #自定義欄位(數字)015
       apdaud016 LIKE apda_t.apdaud016, #自定義欄位(數字)016
       apdaud017 LIKE apda_t.apdaud017, #自定義欄位(數字)017
       apdaud018 LIKE apda_t.apdaud018, #自定義欄位(數字)018
       apdaud019 LIKE apda_t.apdaud019, #自定義欄位(數字)019
       apdaud020 LIKE apda_t.apdaud020, #自定義欄位(數字)020
       apdaud021 LIKE apda_t.apdaud021, #自定義欄位(日期時間)021
       apdaud022 LIKE apda_t.apdaud022, #自定義欄位(日期時間)022
       apdaud023 LIKE apda_t.apdaud023, #自定義欄位(日期時間)023
       apdaud024 LIKE apda_t.apdaud024, #自定義欄位(日期時間)024
       apdaud025 LIKE apda_t.apdaud025, #自定義欄位(日期時間)025
       apdaud026 LIKE apda_t.apdaud026, #自定義欄位(日期時間)026
       apdaud027 LIKE apda_t.apdaud027, #自定義欄位(日期時間)027
       apdaud028 LIKE apda_t.apdaud028, #自定義欄位(日期時間)028
       apdaud029 LIKE apda_t.apdaud029, #自定義欄位(日期時間)029
       apdaud030 LIKE apda_t.apdaud030, #自定義欄位(日期時間)030
       apda104 LIKE apda_t.apda104, #原幣借方金額合計
       apda105 LIKE apda_t.apda105, #原幣貸方金額合計
       apda114 LIKE apda_t.apda114, #本幣借方金額合計
       apda115 LIKE apda_t.apda115, #本幣貸方金額合計
       apda124 LIKE apda_t.apda124, #本位幣二借方金額合計
       apda125 LIKE apda_t.apda125, #本位幣二貸方金額合計
       apda134 LIKE apda_t.apda134, #本位幣三借方金額合計
       apda135 LIKE apda_t.apda135, #本位幣三貸方金額合計
       apda022 LIKE apda_t.apda022, #經營方式
       apda023 LIKE apda_t.apda023  #請款單號
END RECORD
#161111-00048#4 --e add
DEFINE l_sfin3007       LIKE apda_t.apdadocdt
DEFINE l_sfin3008       LIKE type_t.chr1   #151009
DEFINE l_cnt            LIKE type_t.num5   #151009
#150602-00057#3 add ------
DEFINE l_success        LIKE type_t.num5
DEFINE l_dfin5001       LIKE type_t.chr1
DEFINE l_ooba002        LIKE ooba_t.ooba002
#150602-00057#3 add end---

   LET r_success = TRUE
   CALL s_ld_sel_glaa(p_apdald,'glaa121') RETURNING  g_sub_success,l_glaa121
   #SELECT * INTO l_apda.*   #161208-00026#25   mark
   #161208-00026#25   add---s
   SELECT apdaent,apdacomp,apdald,apdadocno,apdadocdt,
          apdasite,apda001,apda002,apda003,apda004,
          apda005,apda006,apda007,apda008,apda009,
          apda010,apda011,apda012,apda013,apda014,
          apda015,apda016,apda017,apda018,apda019,
          apda020,apda021,apda113,apda123,apda133,
          apdaownid,apdaowndp,apdacrtid,apdacrtdp,apdacrtdt,
          apdamodid,apdamoddt,apdacnfid,apdacnfdt,apdapstid,
          apdapstdt,apdastus,apdaud001,apdaud002,apdaud003,
          apdaud004,apdaud005,apdaud006,apdaud007,apdaud008,
          apdaud009,apdaud010,apdaud011,apdaud012,apdaud013,
          apdaud014,apdaud015,apdaud016,apdaud017,apdaud018,
          apdaud019,apdaud020,apdaud021,apdaud022,apdaud023,
          apdaud024,apdaud025,apdaud026,apdaud027,apdaud028,
          apdaud029,apdaud030,apda104,apda105,apda114,
          apda115,apda124,apda125,apda134,apda135,
          apda022,apda023
     INTO l_apda.*
   #161208-00026#25   add---e
     FROM apda_t
    WHERE apdaent = g_enterprise
      AND apdald = p_apdald AND apdadocno = p_apdadocno
   
   #檢核關帳日
   CALL cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-3007') RETURNING l_sfin3007
   IF NOT cl_null(l_sfin3007) THEN
      IF l_apda.apdadocdt <= l_sfin3007 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = 'aap-00110'
         LET g_errparam.extend = l_apda.apdadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
   END IF   

   #檢查是否有單身
   LET l_count = 0
   SELECT COUNT(apcedocno) INTO l_count FROM apce_t
    WHERE apceent = g_enterprise
      AND apcedocno = p_apdadocno
      AND apceld = p_apdald     
   IF cl_null(l_count) THEN LET l_count = 0 END IF      
   LET l_count2 = 0
   SELECT COUNT(apdedocno) INTO l_count2 FROM apde_t
    WHERE apdeent = g_enterprise
      AND apdedocno = p_apdadocno
      AND apdeld = p_apdald     
   IF cl_null(l_count2) THEN LET l_count2 = 0 END IF       

   IF l_count+l_count2 = 0 THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'axm-00228'
      LET g_errparam.extend = p_apdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE 
   END IF     
   #151009--s
   #參數直接產生銀存支付帳否有勾選,且類型為付款,則付款帳戶不可為空白    
   CALL cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-3008') RETURNING l_sfin3008   
   IF l_sfin3008 = 'Y' THEN
      LET l_cnt = 0
      #SELECT COUNT(*) INTO l_cnt        #161114-00009#1 mark
      SELECT COUNT(apdedocno) INTO l_cnt #161114-00009#1 add
        FROM apde_t
       WHERE apdeent = g_enterprise
         AND apdedocno = p_apdadocno
         AND apdeld = p_apdald   
         AND apde002 = '10'
         AND apde006 IN ('10','20','30')
         AND apde008 IS NULL         
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aap-00399'
         LET g_errparam.extend = p_apdadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE       
      END IF           
   END IF
   #151009--e

   #檢核帳款明細單身與預設付款明細單身本幣金額是否為平
   SELECT SUM(CASE apce015 WHEN 'D' THEN apce119 ELSE 0 END) - SUM(CASE apce015 WHEN 'C' THEN apce119 ELSE 0 END)
     INTO l_amt1 FROM apce_t
    WHERE apceent = g_enterprise
      AND apcedocno = p_apdadocno
      AND apceld = p_apdald
   IF cl_null(l_amt1) THEN LET l_amt1 = 0 END IF
      
   SELECT SUM(CASE apde015 WHEN 'C' THEN apde119 ELSE 0 END) - SUM(CASE apde015 WHEN 'D' THEN apde119 ELSE 0 END)
     INTO l_amt2 FROM apde_t
    WHERE apdeent = g_enterprise
      AND apdedocno = p_apdadocno
      AND apdeld = p_apdald
   IF cl_null(l_amt2) THEN LET l_amt2 = 0 END IF
   
   IF l_amt1 <> l_amt2 THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00189'
      LET g_errparam.extend = l_apda.apdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE 
   END IF
   #檢核沖銷科目是否輸入
   LET l_count = 0
   #SELECT COUNT(*) INTO l_count FROM apce_t         #161114-00009#1 mark
   SELECT COUNT(apcedocno) INTO l_count FROM apce_t  #161114-00009#1 ad
    WHERE apceent = g_enterprise
      AND apcedocno = p_apdadocno
      AND apceld = p_apdald
      AND apce016 IS NULL 
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   IF l_count > 0 THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00207'
      LET g_errparam.extend = l_apda.apdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE 
   END IF  

   LET l_count = 0
   #SELECT COUNT(*) INTO l_count FROM apde_t        #161114-00009#1 mark
   SELECT COUNT(apdedocno) INTO l_count FROM apde_t #161114-00009#1 add
    WHERE apdeent = g_enterprise
      AND apdedocno = p_apdadocno
      AND apdeld = p_apdald
      AND apde016 IS NULL 
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   IF l_count > 0 THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00208'
      LET g_errparam.extend = l_apda.apdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE 
   END IF         
   
   #如果有啟用分錄要檢核分錄是否正確
   #141202-00061-15--(S)
#150224apo 搬至前面
#   SELECT * INTO l_apda.*
#     FROM apda_t
#    WHERE apdaent = g_enterprise
#      AND apdald = p_apdald AND apdadocno = p_apdadocno
   CALL s_aooi200_fin_get_slip(p_apdadocno) RETURNING g_sub_success,l_ap_slip
   CALL s_fin_get_doc_para(p_apdald,l_apda.apdacomp,l_ap_slip,'D-FIN-0030') RETURNING l_dfin0030    #150507apo
   IF l_dfin0030 = 'Y' THEN
      IF l_glaa121 = 'N' THEN     #141218-00011#6
         #核算項檢核
         CALL s_aapt420_account_item_chk(p_apdald,p_apdadocno) RETURNING g_sub_success
      ELSE
         CALL s_chk_voucher('AP','P20',p_apdald,p_apdadocno) RETURNING g_sub_success
      END IF
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF
   END IF
   #141202-00061-15--(E)
   
   #171107-00015#1 --s add
   LET l_cnt = 0
   SELECT COUNT(apdedocno) INTO l_cnt
     FROM apde_t
    WHERE apdeent = g_enterprise
      AND apdedocno = p_apdadocno
      AND apdeld = p_apdald   
      AND apde002 = '10'
      AND apde006 = '20'
      AND ((apde039 IS NULL) OR (apde040 IS NULL))       
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00661'
      LET g_errparam.extend = p_apdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE       
   END IF    
   #171107-00015#1 --e add   
   
   #150602-00057#3 add ------
   #資料建立者與確認者為同一人，不可確認！
   CALL s_aooi200_fin_get_slip(p_apdadocno) RETURNING l_success,l_ooba002
   CALL s_fin_chk_E5001(p_apdald,l_apda.apdacomp,l_ooba002) RETURNING l_dfin5001
   IF l_dfin5001 = 'N' THEN
      IF l_apda.apdacrtid = g_user THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'axr-00346'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   #150602-00057#3 add end---
   
   RETURN r_success
   
END FUNCTION
################################################################################
# Descriptions...: 確認資訊回寫
# Memo...........:
# Usage..........: CALL s_aapt420_conf_upd(p_apdald,p_apdadocno,p_flag)
#                  RETURNING r_success
# Date & Author..: 14/10/10 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_conf_upd(p_apdald,p_apdadocno,p_flag)
DEFINE p_apdald         LIKE apda_t.apdald
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE p_flag           LIKE type_t.chr1          #S-FIN-3008-付款單直接產生銀存支付帳
DEFINE r_success        LIKE type_t.num5
DEFINE l_date           DATETIME YEAR TO SECOND
DEFINE l_sql            STRING
DEFINE l_apde           type_g_apde                        
DEFINE l_apde2          type_g_apde2    
DEFINE l_apde3          type_g_apde3    
DEFINE l_apde014        LIKE apde_t.apde014
DEFINE l_apde003        LIKE apde_t.apde003
DEFINE l_apde024        LIKE apde_t.apde024
DEFINE l_glaacomp    LIKE glaa_t.glaacomp
DEFINE l_glaa121     LIKE glaa_t.glaa121
DEFINE l_ap_slip     LIKE apca_t.apcadocno                     
DEFINE l_chr         LIKE type_t.chr1
DEFINE l_apde002     LIKE apde_t.apde002   #160419-00040#1
DEFINE l_ooia011     LIKE ooia_t.ooia011   #160805-00053#1
DEFINE l_cnt         LIKE type_t.num5      #170322-00052#23
DEFINE l_nmaa006     LIKE nmaa_t.nmaa006   #170620-00025#1  add

   LET r_success = TRUE
   LET l_date = cl_get_current()

   ###1.依類型將沖銷金額回寫:應付-apcc/應收-xrcc###
   CALL s_aapt420_upd_contra_amount(p_apdald,p_apdadocno,'+') RETURNING g_sub_success
   IF NOT g_sub_success THEN
      LET r_success = FALSE
   END IF

   LET l_sql = " SELECT apdadocdt,apda003,apdesite,apdecomp,apdeorga, ",
               "        apdedocno,apdeseq,apde001,apde006,apde008, ",
               "        apde011,apde012,apde014,apde021,apde024, ",
               "        apde032,apde038,apde039,apde040,apde041, ",
               "        apde100,apde101,apde109,apde119,apdeld, ",
               "        apde003,apde016,apde121,apde129,apde131, ",
               "        apde139,apde002 ",  #160419-00040#1 add apde002
               "   FROM apde_t,apda_t ",
               "  WHERE apdeent = apdaent ",
               "    AND apdedocno = apdadocno ",
               "    AND apdeld = apdald ",
               #"    AND apdeent = '",g_enterprise,"' ", #170615-00061#11 mark
               "    AND apdeent = ",g_enterprise," ",    #170615-00061#11 add
               "    AND apdedocno = '",p_apdadocno,"' ",
               "    AND apdeld = '",p_apdald,"' ",
               #160419-00040#1 mod--s
               #"    AND apde002 = '10' ",                  #付款
               #"    AND apde006 IN ('10','20','30') ",     #方式為現金/銀行電匯款/票據
               "    AND(",
               "        (apde002 = '10' AND",                  #付款
               "         apde006 IN ('10','20','30')) ",       #方式為現金/銀行電匯款/票據
               "     OR (apde002 = '16' AND",                  #收票轉付
               "        (SELECT ooia011 FROM ooia_t WHERE ooiaent = apdeent AND apde021 = ooia001) ='Y')",   #屬於即期票據
               "       )",     #方式為現金/銀行電匯款/票據                   
               #160419-00040#1 mod--e
               #"    AND (apde009 <> 'Y' ", #170809-00046#1 mark
               "    AND apde009 <> 'Y' ",   #170809-00046#1 add           
               #屬於先付款後核銷類型,並排除已於付款申請單確認時,轉過銀存檔或應付票據檔 
               #"     OR (apde009 = 'Y' AND apde003 IS NOT NULL ","))", #170809-00046#1 mark
#               "    AND NOT EXISTS ",                             
#               "          ( SELECT 1 FROM apee_t ",
#               "             WHERE apeeent =apdeent ",
#               "               AND apeedocno =apde046 AND apeeseq= apde047 AND apee009 = 'Y'))) ",                  
               "  ORDER BY apdeseq "

   PREPARE s_aapt420_sel_apde_p FROM l_sql
   DECLARE s_aapt420_sel_apde_c CURSOR FOR s_aapt420_sel_apde_p   

   ###2.付款單直接產生銀存收支異動檔或應付票據檔###
   
   #付款單直接產生銀存支付帳(S-FIN-3008為Y)
   IF p_flag = 'Y' THEN
      FOREACH s_aapt420_sel_apde_c INTO l_apde.*,l_apde002   #160419-00040#1 add apde002
         CASE 
            WHEN (l_apde.apde006 = '10' OR l_apde.apde006='20') AND cl_null(l_apde.apde003)
               #10:現金/20:銀行電匯款=>寫入銀存收支檔
               #CALL s_aapt420_ins_nmbc(l_apde.*) RETURNING g_sub_success #170620-00025#1 mark
               #170620-00025#1 --s add 當付款單直接產生銀存為Y時,且 anmi120 開通網銀否 為 Y 的 20電匯款的, 則自動產生anmt460
               #開通網銀否
               LET l_nmaa006 = ''
               SELECT nmaa006 INTO l_nmaa006 
                 FROM nmaa_t,nmas_t
                WHERE nmaaent = g_enterprise
                  AND nmaaent = nmasent
                  AND nmaa001 = nmas001
                  AND nmas002 = l_apde.apde008
                  AND nmaa002 IN (SELECT ooef001 FROM ooef_t WHERE ooefent = g_enterprise AND ooef017 = l_apde.apdecomp)
                  AND nmaastus ='Y'                     
                
               IF l_nmaa006 = 'Y' AND l_apde.apde006='20' THEN
                  #產生anmt460
                  CALL s_aapt420_ins_nmck(l_apde.*) RETURNING g_sub_success   
               ELSE
                  CALL s_aapt420_ins_nmbc(l_apde.*) RETURNING g_sub_success
               END IF
               #170620-00025#1 --e add

            WHEN l_apde.apde006 = '30' AND cl_null(l_apde.apde003)
               #160805-00053#1--s
               #即期票據否
               LET l_ooia011 = ''
               SELECT ooia011 INTO l_ooia011
                 FROM ooia_t 
                WHERE ooiaent = g_enterprise
                  AND ooia001 = l_apde.apde021     
               IF cl_null(l_ooia011) THEN LET l_ooia011 = 'N' END IF
               IF l_ooia011 = 'Y' THEN                               
               #160805-00053#1--e
              #IF NOT cl_null(l_apde.apde024) THEN   #160805-00053#1 mark
                  #30:票據(即期票據)=>寫入銀存收支檔
                  CALL s_aapt420_ins_nmbc(l_apde.*) RETURNING g_sub_success
               ELSE 
                  #30:票據(非即期票據)=>寫入應付票據檔
                  CALL s_aapt420_ins_nmck(l_apde.*) RETURNING g_sub_success           
               END IF
           #WHEN NOT cl_null(l_apde.apde003)                          #160419-00040#1 mark
            WHEN NOT cl_null(l_apde.apde003) AND l_apde002 <> '16'    #160419-00040#1 
               #170316-00062#1--add--str--lujh
               UPDATE nmcl_t SET nmcl001 = l_apde.apdedocno,
                                 nmcl002 = l_apde.apdeseq
                WHERE nmclent = g_enterprise
                  AND nmclcomp = l_apde.apdecomp
                  AND nmcldocno = l_apde.apde003
               
               IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = l_apde.apdedocno CLIPPED,"/upd nmcl_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_sub_success = FALSE
               END IF
               #170316-00062#1--add--end--lujh
               #CALL s_aapt420_ins_nmcl(l_apde.*) RETURNING g_sub_success   #170316-00062#1 mark lujh 
            #160419-00040#1--s
            WHEN l_apde002 = '16' 
               #16:收票轉付=>寫入銀存收支檔
               CALL s_aapt420_ins_nmbc(l_apde.*) RETURNING g_sub_success              
            #160419-00040#1--e
         END CASE
         IF NOT g_sub_success THEN
            LET r_success = FALSE
         END IF
         IF l_apde002 <> '16' THEN   #160419-00040#1
            #產生後回寫為已轉
            UPDATE apde_t SET apde009 = 'Y'
             WHERE apdeent = g_enterprise
               AND apdedocno = l_apde.apdedocno
               AND apdeseq = l_apde.apdeseq
               
            IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = l_apde.apdedocno CLIPPED,"/upd apde_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
            END IF      
         END IF   #160419-00040#1
         
      END FOREACH
   #151105--s
   ELSE
      FOREACH s_aapt420_sel_apde_c INTO l_apde.*,l_apde002   #160419-00040#1 add apde002
         CASE 
            WHEN l_apde.apde006 = '10' AND cl_null(l_apde.apde003)
               #10:現金/20:銀行電匯款=>寫入銀存收支檔
               CALL s_aapt420_ins_nmbc(l_apde.*) RETURNING g_sub_success
               IF NOT g_sub_success THEN
                  LET r_success = FALSE
               END IF
               #產生後回寫為已轉
               UPDATE apde_t SET apde009 = 'Y'
                WHERE apdeent = g_enterprise
                  AND apdedocno = l_apde.apdedocno
                  AND apdeseq = l_apde.apdeseq
                  
               IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = l_apde.apdedocno CLIPPED,"/upd apde_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success = FALSE
               END IF      
            #160419-00040#1--s
            WHEN l_apde002 = '16' 
               #16:收票轉付=>寫入銀存收支檔
               CALL s_aapt420_ins_nmbc(l_apde.*) RETURNING g_sub_success
               IF NOT g_sub_success THEN
                  LET r_success = FALSE
               END IF                       
            #160419-00040#1--e
            #171026-00025#1---mark---str--
            ##170620-00025#1 --s add 當付款單直接產生銀存為N時,款別為20則自動產生anmt460
            #WHEN (l_apde.apde006 = '20') AND (cl_null(l_apde.apde003))                    
            #   #170918-00005#1 --s add 直接判斷 anmi120 當開通網銀否(nmaa006) 為 Y 時,才設定 anmt460 單別等相關資料,目的區隔 anmp410 應用
            #   #開通網銀否
            #   LET l_nmaa006 = ''
            #   SELECT nmaa006 INTO l_nmaa006 
            #     FROM nmaa_t,nmas_t
            #    WHERE nmaaent = g_enterprise
            #      AND nmaaent = nmasent
            #      AND nmaa001 = nmas001
            #      AND nmas002 = l_apde.apde008
            #      AND nmaa002 IN (SELECT ooef001 FROM ooef_t WHERE ooefent = g_enterprise AND ooef017 = l_apde.apdecomp)
            #      AND nmaastus ='Y'        
            #   IF l_nmaa006 = 'Y' THEN                  
            #   #170918-00005#1 --e add             
            #
            #   #產生anmt460
            #   CALL s_aapt420_ins_nmck(l_apde.*) RETURNING g_sub_success
            #   IF NOT g_sub_success THEN
            #      LET r_success = FALSE
            #   END IF    
            #   #產生後回寫為已轉
            #   UPDATE apde_t SET apde009 = 'Y'
            #    WHERE apdeent = g_enterprise
            #      AND apdedocno = l_apde.apdedocno
            #      AND apdeseq = l_apde.apdeseq
            #      
            #   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
            #      INITIALIZE g_errparam TO NULL
            #      LET g_errparam.code = SQLCA.sqlcode
            #      LET g_errparam.extend = l_apde.apdedocno CLIPPED,"/upd apde_t"
            #      LET g_errparam.popup = TRUE
            #      CALL cl_err()
            #      LET r_success = FALSE
            #   END IF
            #   END IF    #170918-00005#1 add                         
            ##170620-00025#1 --e add         
            #171026-00025#1---mark---end--            
         END CASE
      END FOREACH
   #151105--e

   END IF
   
   ###3.20/21/22帳款類別,產生待抵單或其他應付單###
   LET l_sql = " SELECT apdadocdt,apda003,apde013,apdacomp,apdedocno,apdeseq, ",
               "        apdeld,apdesite,apde002,apde014,apde016,apde017, ",
               "        apde018,apde019,apde020,apde022,apde023,apde035, ",
               "        apde036,apde042,apde043,apde044,apde051,apde052, ",
               "        apde053,apde054,apde055,apde056,apde057,apde058, ",
               "        apde059,apde060,apde100,apde101,apde109,apde119 ",
               "       ,apde010 ",   #170112-00056#1
               "   FROM apde_t,apda_t ",
               "  WHERE apdeent = apdaent ",
               "    AND apdedocno = apdadocno ",
               "    AND apdeld = apdald ",
               #"    AND apdeent = '",g_enterprise,"' ", #170615-00061#11 mark
               "    AND apdeent = ",g_enterprise," ",    #170615-00061#11 add
               "    AND apdedocno = '",p_apdadocno,"' ",
               "    AND apdeld = '",p_apdald,"' ",
               "    AND apde002 IN ('20','21','22') ",            #20:轉應付待抵/21:預付待抵轉應收/22:轉付第三方
               "  ORDER BY apdeseq "

   PREPARE s_aapt420_sel_apde_p2 FROM l_sql
   DECLARE s_aapt420_sel_apde_c2 CURSOR FOR s_aapt420_sel_apde_p2   
   
   FOREACH s_aapt420_sel_apde_c2 INTO l_apde2.*
         CASE 
            WHEN l_apde2.apde002 = '20'
               CALL s_aapt420_create_contra_doc(l_apde2.*) RETURNING g_sub_success,l_apde014  #產生aapq343
            WHEN l_apde2.apde002 = '21'
               CALL s_aapt420_create_contra_doc2(l_apde2.*) RETURNING g_sub_success,l_apde014 #產生axrt330
            WHEN l_apde2.apde002 = '22' 
               CALL s_aapt420_create_contra_doc(l_apde2.*) RETURNING g_sub_success,l_apde014  #產生aapt301
         END CASE
         IF NOT g_sub_success THEN
            LET r_success = FALSE
         END IF         
         #產生後回寫為已轉
         UPDATE apde_t SET apde009 = 'Y',apde014 = l_apde014
          WHERE apdeent = g_enterprise
            AND apdedocno = l_apde2.apdedocno
            AND apdeseq = l_apde2.apdeseq
            
         IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = l_apde2.apdedocno CLIPPED,"/upd apde_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF         
   END FOREACH   

   ###4.16帳款類別,產生應收票據異動檔(anmt520)###
  #LET l_sql = " SELECT apdadocno,apdadocdt,apdacomp,apda005,apde003, ",          #160301-00003#1 mark
   LET l_sql = " SELECT apdadocno,apdadocdt,apdacomp,apda005,apdeseq,apde003, ",  #160301-00003#1
               "        apde024,apde100,apde101,apde109,apde119, ",
               "        apde121,apde131 ",
               "   FROM apde_t,apda_t ",
               "  WHERE apdeent = apdaent ",
               "    AND apdedocno = apdadocno ",
               "    AND apdeld = apdald ",
               #"    AND apdeent = '",g_enterprise,"' ", #170615-00061#11 mark
               "    AND apdeent = ",g_enterprise," ",    #170615-00061#11 add
               "    AND apdedocno = '",p_apdadocno,"' ",
               "    AND apdeld = '",p_apdald,"' ",
               "    AND apde002 IN ('16') ",           #16:應收轉付
               "  ORDER BY apdeseq "

   PREPARE s_aapt420_sel_apde_p3 FROM l_sql
   DECLARE s_aapt420_sel_apde_c3 CURSOR FOR s_aapt420_sel_apde_p3   
   
   FOREACH s_aapt420_sel_apde_c3 INTO l_apde3.*
      CALL s_aapt420_ins_nmcq(l_apde3.*) RETURNING g_sub_success   #產生應收票據異動檔(anmt520)
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF         
   END FOREACH     
   
   UPDATE apda_t SET apdastus = 'Y',
                     apdacnfid = g_user,apdacnfdt = l_date
    WHERE apdaent = g_enterprise
      AND apdald = p_apdald AND apdadocno = p_apdadocno
      
   
   IF SQLCA.SQLERRD[3] = 0 THEN
      LET r_success = FALSE
   END IF

   CALL s_ld_sel_glaa(p_apdald,'glaacomp|glaa121') RETURNING  g_sub_success,l_glaacomp,l_glaa121
   
   CALL s_aooi200_fin_get_slip(p_apdadocno) RETURNING g_sub_success,l_ap_slip
   
   CALL s_fin_get_doc_para(p_apdald,l_glaacomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
   IF l_glaa121 = 'Y' AND l_chr = 'Y'THEN
      UPDATE glga_t SET glgastus = 'Y',
                        glgacnfid = g_user,glgacnfdt = l_date
       WHERE glgaent = g_enterprise
         AND glgald  = p_apdald AND glgadocno = p_apdadocno
      
      IF SQLCA.SQLCODE THEN
         LET r_success = FALSE  
      END IF
   END IF
   
   #170322-00052#23  add  --str---
   #判斷 aoos020 是否啟用 e-B Chain 整合
   IF cl_get_para(g_enterprise,g_site,"S-SYS-0006") = "Y" THEN

      #更新 欄位:已拋轉EC 為 Y
      #UPDATE apda_t SET apda024 = 'Y'
      # WHERE apdadocno = p_apdadocno
      #   AND apdaent = g_enterprise
      #   AND apdald = p_apdald      
      #
      #IF SQLCA.sqlcode THEN         
      #   INITIALIZE g_errparam TO NULL
      #   LET g_errparam.code = SQLCA.sqlcode
      #   LET g_errparam.extend = p_apdadocno
      #   LET g_errparam.popup = TRUE
      #   CALL cl_err()
      #   LET r_success = FALSE         
      #   RETURN r_success
      #END IF 

      #判斷單據是否拋轉EC
      SELECT COUNT(1) INTO l_cnt
        FROM apca_t,apce_t
       WHERE apcaent = apceent
         AND apcald = apceld
         AND apcadocno = apce003
         AND apcaent = g_enterprise
         AND apcald = p_apdald
         AND apca074 = 'Y'
         AND apcedocno = p_apdadocno
            
      IF l_cnt > 0 THEN
         
         #拋轉 付款單開立 給EC
         CALL s_all_wsel('','EBCHAIN','purchase.payment.create',p_apdadocno,p_apdald,'','','','','','','','') RETURNING r_success #add by Nina
#         CALL s_jscli_ec10(p_apdadocno,p_apdald) RETURNING l_success  #Nina mark
         IF NOT r_success THEN  
            RETURN r_success
         END IF
      END IF
   END IF           
   #170322-00052#23  add  --end---   
     
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 取消確認
# Memo...........:
# Usage..........: CALL s_aapt420_unconf_chk(p_apdald,p_apdadocno,p_flag)
#                  RETURNING r_success
# Date & Author..: 14/10/10 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_unconf_chk(p_apdald,p_apdadocno,p_flag)
DEFINE p_apdald         LIKE apda_t.apdald
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE r_success        LIKE type_t.num5
DEFINE p_flag           LIKE type_t.chr1          #S-FIN-3008-付款單直接產生銀存支付帳
DEFINE l_cnt            LIKE type_t.num5
DEFINE l_sql            STRING
DEFINE l_apda014        LIKE apda_t.apda014
DEFINE l_apde           RECORD
         apdacomp          LIKE apda_t.apdacomp,
         apde003           LIKE apde_t.apde003,
         apde024           LIKE apde_t.apde024
                        END RECORD
#DEFINE l_apda           RECORD LIKE apda_t.* #161111-00048#4 mark
#161111-00048#4 --s add
DEFINE l_apda RECORD  #付款核銷單單頭檔
       apdaent LIKE apda_t.apdaent, #企業編號
       apdacomp LIKE apda_t.apdacomp, #法人
       apdald LIKE apda_t.apdald, #帳套
       apdadocno LIKE apda_t.apdadocno, #單號
       apdadocdt LIKE apda_t.apdadocdt, #單據日期
       apdasite LIKE apda_t.apdasite, #帳務組織
       apda001 LIKE apda_t.apda001, #帳款單性質
       apda002 LIKE apda_t.apda002, #NO USE
       apda003 LIKE apda_t.apda003, #帳務人員
       apda004 LIKE apda_t.apda004, #帳款核銷對象
       apda005 LIKE apda_t.apda005, #付款對象
       apda006 LIKE apda_t.apda006, #一次性交易識別碼
       apda007 LIKE apda_t.apda007, #產生方式
       apda008 LIKE apda_t.apda008, #來源參考單號
       apda009 LIKE apda_t.apda009, #沖帳批序號
       apda010 LIKE apda_t.apda010, #集團代付付單號
       apda011 LIKE apda_t.apda011, #差異處理
       apda012 LIKE apda_t.apda012, #退款類型
       apda013 LIKE apda_t.apda013, #分錄底稿是否可重新產生
       apda014 LIKE apda_t.apda014, #拋轉傳票號碼
       apda015 LIKE apda_t.apda015, #作廢理由碼
       apda016 LIKE apda_t.apda016, #列印次數
       apda017 LIKE apda_t.apda017, #MEMO備註
       apda018 LIKE apda_t.apda018, #付款(攤銷)理由碼
       apda019 LIKE apda_t.apda019, #攤銷目的方式
       apda020 LIKE apda_t.apda020, #分攤金額方式
       apda021 LIKE apda_t.apda021, #目的成本要素
       apda113 LIKE apda_t.apda113, #應核銷本幣金額
       apda123 LIKE apda_t.apda123, #應核銷本幣二金額
       apda133 LIKE apda_t.apda133, #應核銷本幣三金額
       apdaownid LIKE apda_t.apdaownid, #資料所有者
       apdaowndp LIKE apda_t.apdaowndp, #資料所屬部門
       apdacrtid LIKE apda_t.apdacrtid, #資料建立者
       apdacrtdp LIKE apda_t.apdacrtdp, #資料建立部門
       apdacrtdt LIKE apda_t.apdacrtdt, #資料創建日
       apdamodid LIKE apda_t.apdamodid, #資料修改者
       apdamoddt LIKE apda_t.apdamoddt, #最近修改日
       apdacnfid LIKE apda_t.apdacnfid, #資料確認者
       apdacnfdt LIKE apda_t.apdacnfdt, #資料確認日
       apdapstid LIKE apda_t.apdapstid, #資料過帳者
       apdapstdt LIKE apda_t.apdapstdt, #資料過帳日
       apdastus LIKE apda_t.apdastus, #狀態碼
       apdaud001 LIKE apda_t.apdaud001, #自定義欄位(文字)001
       apdaud002 LIKE apda_t.apdaud002, #自定義欄位(文字)002
       apdaud003 LIKE apda_t.apdaud003, #自定義欄位(文字)003
       apdaud004 LIKE apda_t.apdaud004, #自定義欄位(文字)004
       apdaud005 LIKE apda_t.apdaud005, #自定義欄位(文字)005
       apdaud006 LIKE apda_t.apdaud006, #自定義欄位(文字)006
       apdaud007 LIKE apda_t.apdaud007, #自定義欄位(文字)007
       apdaud008 LIKE apda_t.apdaud008, #自定義欄位(文字)008
       apdaud009 LIKE apda_t.apdaud009, #自定義欄位(文字)009
       apdaud010 LIKE apda_t.apdaud010, #自定義欄位(文字)010
       apdaud011 LIKE apda_t.apdaud011, #自定義欄位(數字)011
       apdaud012 LIKE apda_t.apdaud012, #自定義欄位(數字)012
       apdaud013 LIKE apda_t.apdaud013, #自定義欄位(數字)013
       apdaud014 LIKE apda_t.apdaud014, #自定義欄位(數字)014
       apdaud015 LIKE apda_t.apdaud015, #自定義欄位(數字)015
       apdaud016 LIKE apda_t.apdaud016, #自定義欄位(數字)016
       apdaud017 LIKE apda_t.apdaud017, #自定義欄位(數字)017
       apdaud018 LIKE apda_t.apdaud018, #自定義欄位(數字)018
       apdaud019 LIKE apda_t.apdaud019, #自定義欄位(數字)019
       apdaud020 LIKE apda_t.apdaud020, #自定義欄位(數字)020
       apdaud021 LIKE apda_t.apdaud021, #自定義欄位(日期時間)021
       apdaud022 LIKE apda_t.apdaud022, #自定義欄位(日期時間)022
       apdaud023 LIKE apda_t.apdaud023, #自定義欄位(日期時間)023
       apdaud024 LIKE apda_t.apdaud024, #自定義欄位(日期時間)024
       apdaud025 LIKE apda_t.apdaud025, #自定義欄位(日期時間)025
       apdaud026 LIKE apda_t.apdaud026, #自定義欄位(日期時間)026
       apdaud027 LIKE apda_t.apdaud027, #自定義欄位(日期時間)027
       apdaud028 LIKE apda_t.apdaud028, #自定義欄位(日期時間)028
       apdaud029 LIKE apda_t.apdaud029, #自定義欄位(日期時間)029
       apdaud030 LIKE apda_t.apdaud030, #自定義欄位(日期時間)030
       apda104 LIKE apda_t.apda104, #原幣借方金額合計
       apda105 LIKE apda_t.apda105, #原幣貸方金額合計
       apda114 LIKE apda_t.apda114, #本幣借方金額合計
       apda115 LIKE apda_t.apda115, #本幣貸方金額合計
       apda124 LIKE apda_t.apda124, #本位幣二借方金額合計
       apda125 LIKE apda_t.apda125, #本位幣二貸方金額合計
       apda134 LIKE apda_t.apda134, #本位幣三借方金額合計
       apda135 LIKE apda_t.apda135, #本位幣三貸方金額合計
       apda022 LIKE apda_t.apda022, #經營方式
       apda023 LIKE apda_t.apda023  #請款單號
END RECORD
#161111-00048#4 --e add
DEFINE l_sfin3007       LIKE apda_t.apdadocdt
DEFINE l_apde003        LIKE apde_t.apde003   #161024-00016#1 add
DEFINE l_apde014        LIKE apde_t.apde014   #150416
DEFINE l_nmck001        LIKE nmck_t.nmck001   #161024-00016#1 add

   LET r_success = TRUE

   #aapt420才在此處檢核關帳日
   #IF g_prog = 'aapt420' THEN   #170301-00021#1 by 09263 --mark
   IF g_prog MATCHES 'aapt420*' THEN   #170301-00021#1 by 09263 --add
      #SELECT * INTO l_apda.*   #161208-00026#25   mark
      #161208-00026#25   add---s
      SELECT apdaent,apdacomp,apdald,apdadocno,apdadocdt,
             apdasite,apda001,apda002,apda003,apda004,
             apda005,apda006,apda007,apda008,apda009,
             apda010,apda011,apda012,apda013,apda014,
             apda015,apda016,apda017,apda018,apda019,
             apda020,apda021,apda113,apda123,apda133,
             apdaownid,apdaowndp,apdacrtid,apdacrtdp,apdacrtdt,
             apdamodid,apdamoddt,apdacnfid,apdacnfdt,apdapstid,
             apdapstdt,apdastus,apdaud001,apdaud002,apdaud003,
             apdaud004,apdaud005,apdaud006,apdaud007,apdaud008,
             apdaud009,apdaud010,apdaud011,apdaud012,apdaud013,
             apdaud014,apdaud015,apdaud016,apdaud017,apdaud018,
             apdaud019,apdaud020,apdaud021,apdaud022,apdaud023,
             apdaud024,apdaud025,apdaud026,apdaud027,apdaud028,
             apdaud029,apdaud030,apda104,apda105,apda114,
             apda115,apda124,apda125,apda134,apda135,
             apda022,apda023
        INTO l_apda.*
      #161208-00026#25   add---e
        FROM apda_t
       WHERE apdaent = g_enterprise
         AND apdald = p_apdald AND apdadocno = p_apdadocno
      #檢核關帳日
      CALL cl_get_para(g_enterprise,l_apda.apdacomp,'S-FIN-3007') RETURNING l_sfin3007
      IF NOT cl_null(l_sfin3007) THEN
         IF l_apda.apdadocdt <= l_sfin3007 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code   = 'aap-00110'
            LET g_errparam.extend = l_apda.apdadocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
            RETURN r_success
         END IF
      END IF   
      #140709-00007#2
      IF l_apda.apda007 = '1' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = 'axr-00196'
         LET g_errparam.extend = l_apda.apdadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success
      END IF
      #140709-00007#2
   END IF
   

   SELECT apda014 INTO l_apda014
     FROM apda_t
    WHERE apdaent = g_enterprise
      AND apdadocno = p_apdadocno
      AND apdald = p_apdald
   #傳票已拋轉,不可取消確認!
   IF NOT cl_null(l_apda014) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'sub-00404'
      LET g_errparam.extend = p_apdadocno,'-',s_fin_get_colname('','apdadocno')
      CALL cl_err()
      LET r_success = FALSE
   END IF   
   #直接付款則不考慮s-fin-3008,一律都是參數為Y的情形
   IF g_prog[1,5] = 'aapt3' THEN
      LET p_flag = 'Y'
   END IF
   
   IF p_flag = 'N' THEN
      #S-FIN-3008-付款單直接產生銀存支付帳為'N'
      #單身存在已轉,不可取消確認      
      #161024-00016#1---mark---str--
      #LET l_cnt = 0
      #SELECT COUNT(*) INTO l_cnt
      # FROM apde_t
      #WHERE apdeent = g_enterprise
      #  AND apdedocno = p_apdadocno
      #  AND apdeld = p_apdald
      #  AND apde009 = 'Y'
      #  AND apde002 = '10'               #10:付款            #150211apo
      # #AND apde006 IN ('10','20','30')  #款別為10/20/30     #151105 mark  #150211apo
      #  AND apde006 IN ('20','30')       #款別為20/30        #151105
      #IF l_cnt > 0 THEN
      #   INITIALIZE g_errparam TO NULL
      #   LET g_errparam.code = 'aap-00190'
      #   LET g_errparam.extend = p_apdadocno
      #   LET g_errparam.popup = TRUE
      #   CALL cl_err()
      #   LET r_success = FALSE       
      #END IF
      #161024-00016#1---mark---end--
#170618-00516#1 mark s---
#      ##S-FIN-3008-付款單直接產生銀存支付帳為'N'时可删除
#      #161024-00016#1---add---str--
#      LET l_sql = " SELECT apde003 ",
#                  "   FROM apde_t ",
#                  #"  WHERE apdeent = '",g_enterprise,"' ", #170615-00061#11 mark
#                  "  WHERE apdeent = ",g_enterprise," ",    #170615-00061#11 add
#                  "    AND apdedocno = '",p_apdadocno,"' ",
#                  "    AND apdeld = '",p_apdald,"' ",
#                  "    AND apde009 = 'Y' ",
#                  "    AND apde002 = '10' ",            #10:付款           
#                  "    AND apde006 IN ('20','30') "     #款別為20/30
#      PREPARE s_aapt420_unconf_chk_p3 FROM l_sql
#      DECLARE s_aapt420_unconf_chk_c3 CURSOR FOR s_aapt420_unconf_chk_p3
#      FOREACH s_aapt420_unconf_chk_c3 INTO l_apde003
#         SELECT nmck001 INTO l_nmck001
#           FROM nmck_t
#          WHERE nmckent = g_enterprise
#            AND nmckcomp = l_apda.apdacomp
#            AND nmckdocno = l_apde003
#            AND nmckstus <> 'X'   
#         IF l_nmck001 = 'AP' THEN
#            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'aap-00190'
#            LET g_errparam.extend = p_apdadocno
#            LET g_errparam.popup = TRUE
#            CALL cl_err()
#            LET r_success = FALSE
#            RETURN r_success #170618-00288#1 add
#         END IF
#      END FOREACH
#      #161024-00016#1---add---end--
#170618-00516#1 mark e---
   ELSE
      #S-FIN-3008-付款單直接產生銀存支付帳為'Y'
      #轉應付票據者,存在票據已開立情形不可取消確認
      LET l_cnt = 0
      #SELECT COUNT(*) INTO l_cnt         #161114-00009#1 mark
      SELECT COUNT(nmckdocno) INTO l_cnt  #161114-00009#1 add
        FROM nmck_t
       WHERE nmckent = g_enterprise
         AND nmck019 = p_apdadocno
         AND nmck025 IS NOT NULL
         AND nmck026 IS NOT NULL
         AND nmck026 NOT IN ('0','1','4')      #票據已開立
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aap-00191'
         LET g_errparam.extend = p_apdadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success #170618-00288#1 add         
      END IF        
   END IF
   

 
   #170618-00288#1 --s add aapt420 取消確認時,若付款單身有已付款單號,則須檢查若該付款單(anmt440/460...)單據狀態已確認,則aapt420不能取消確認
   LET l_apde003 = ''
   LET l_sql = " SELECT apde003 ",
               "   FROM apde_t ",
               "  WHERE apdeent = ",g_enterprise," ",   
               "    AND apdedocno = '",p_apdadocno,"' ",
               "    AND apdeld = '",p_apdald,"' ",
               "    AND apde009 = 'Y' ",
               "    AND apde002 = '10' ",            #10:付款           
               "    AND apde006 IN ('20','30') "     #款別為20/30
   PREPARE s_aapt420_unconf_chk_p4 FROM l_sql
   DECLARE s_aapt420_unconf_chk_c4 CURSOR FOR s_aapt420_unconf_chk_p4
   FOREACH s_aapt420_unconf_chk_c4 INTO l_apde003
      LET l_cnt = ''
      SELECT COUNT(nmckdocno) INTO l_cnt
        FROM nmck_t
       WHERE nmckent = g_enterprise
         AND nmckcomp = l_apda.apdacomp
         AND nmckdocno = l_apde003
         AND nmck001 = 'AP'
         AND nmckstus = 'Y' 
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aap-00190'
         LET g_errparam.extend = p_apdadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success 
      END IF
      #170618-00516#1 add s---
      #检核付款单单身是否有多笔AP来源单，有则不可直接取消审核     
      LET l_cnt = ''
      SELECT COUNT(nmcldocno) INTO l_cnt
        FROM nmck_t,nmcl_t
       WHERE nmckent = nmclent AND nmckdocno = nmcldocno AND nmckcomp = nmclcomp
         AND nmclent = g_enterprise
         AND nmclcomp = l_apda.apdacomp
         AND nmcldocno = l_apde003
         AND nmck001 = 'AP'
         AND nmckstus = 'N' 
      IF l_cnt > 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aap-00641'
         LET g_errparam.extend = l_apde003
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success 
      END IF      
   END FOREACH
   #170618-00288#1 --e add  


   #產生的待抵單已拋傳票則不可取消確認
   LET l_cnt = 0
   #SELECT COUNT(*) INTO l_cnt        #161114-00009#1 mark
   SELECT COUNT(apcadocno) INTO l_cnt #161114-00009#1 add
     FROM apca_t
    WHERE apcaent = g_enterprise
      AND apcald = p_apdald
      AND apca018 = p_apdadocno
      AND apca038 IS NOT NULL  #已拋傳票

   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00172'
      LET g_errparam.extend = p_apdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
  
   #產生的應收單已拋傳票則不可取消確認
   LET l_cnt = 0
   #SELECT COUNT(*) INTO l_cnt         #161114-00009#1 mark
   SELECT COUNT(xrcadocno) INTO l_cnt  #161114-00009#1 add
     FROM xrca_t
    WHERE xrcaent = g_enterprise
      AND xrcald = p_apdald
      AND xrca018 = p_apdadocno
      AND xrca038 IS NOT NULL  #已拋傳票

   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
   IF l_cnt > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aap-00203'
      LET g_errparam.extend = p_apdadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
 
   
   #--150416--(s)
   #20/21/22類產生之單據是否已被沖銷,已有沖銷紀錄者不可取消確認抽回
   LET l_sql = " SELECT apde014 ",  
               "   FROM apde_t ",
               #"  WHERE apdeent = '",g_enterprise,"' ",  #170615-00061#11 mark
               "  WHERE apdeent = ",g_enterprise," ",     #170615-00061#11 add
               "    AND apdedocno = '",p_apdadocno,"' ",
               "    AND apdeld = '",p_apdald,"' ",
               "    AND apde002 IN ('20','21','22') ",    #20:轉應付待抵/21:預付待抵轉應收/22:轉付第三方
               "  ORDER BY apdeseq "   
   PREPARE s_aapt420_unconf_chk_p FROM l_sql
   DECLARE s_aapt420_unconf_chk_c CURSOR FOR s_aapt420_unconf_chk_p
   FOREACH s_aapt420_unconf_chk_c INTO l_apde014
      LET l_cnt = 0
      CALL s_aapt300_apce_chk(p_apdald,l_apde014) RETURNING l_cnt
      IF NOT l_cnt = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code   = 'axr-00190'
         LET g_errparam.extend = s_fin_get_colname('','apdadocno'),'-',p_apdadocno,'/',s_fin_get_colname('','apde014'),'-',l_apde014
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOREACH
   #--150416-*(e)
   #16類檢核應收票據票況,票據已有異動處理不可取消確認
   LET l_sql = " SELECT apdacomp,apde003,apde024 ",
               "   FROM apda_t,apde_t ",
               "  WHERE apdeent = apdaent ",
               "    AND apdedocno = apdadocno ",
               "    AND apdeld = apdald ",
               #"    AND apdeent = '",g_enterprise,"' ", #170615-00061#11 mark
               "    AND apdeent = ",g_enterprise," ",    #170615-00061#11 add
               "    AND apdedocno = '",p_apdadocno,"' ",
               "    AND apdeld = '",p_apdald,"' ",
               "    AND apde002 IN ('16') "

   PREPARE s_aapt420_unconf_chk_p2 FROM l_sql
   DECLARE s_aapt420_unconf_chk_c2 CURSOR FOR s_aapt420_unconf_chk_p2  
   
   FOREACH s_aapt420_unconf_chk_c2 INTO l_apde.*
      LET l_cnt = 0
      #SELECT COUNT(*) INTO l_cnt	      #161114-00009#1 mark
      SELECT COUNT(nmbbdocno) INTO l_cnt	#161114-00009#1 add
        FROM nmbb_t
       WHERE nmbbent  = g_enterprise
         AND nmbbcomp = l_apde.apdacomp
         AND nmbbdocno= l_apde.apde003
         AND nmbb030  = l_apde.apde024
         AND nmbb042 <> '5'
      IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'anm-00333'
         LET g_errparam.extend = l_apde.apde003
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END FOREACH
   
   
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 取消確認
# Memo...........:
# Usage..........: CALL s_aapt420_unconf_upd(p_apdald,p_apdadocno)
#                  RETURNING r_success
# Date & Author..: 14/10/10 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_unconf_upd(p_apdald,p_apdadocno)
DEFINE p_apdald      LIKE apda_t.apdald
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE r_success        LIKE type_t.num5
DEFINE l_date           DATETIME YEAR TO SECOND
DEFINE l_sql            STRING
DEFINE l_apde           RECORD
         apdeseq           LIKE apde_t.apdeseq,
         apde014           LIKE apde_t.apde014,
         apde002           LIKE apde_t.apde002   #150205apo
                        END RECORD
DEFINE l_apde2          RECORD
         apde003           LIKE apde_t.apde003,
         apde024           LIKE apde_t.apde024
                        END RECORD
DEFINE l_apdacomp       LIKE apda_t.apdacomp
DEFINE l_nmcr002        LIKE nmcr_t.nmcr002
DEFINE l_count          LIKE type_t.num5
DEFINE l_glaacomp    LIKE glaa_t.glaacomp
DEFINE l_glaa121     LIKE glaa_t.glaa121
DEFINE l_ap_slip     LIKE apca_t.apcadocno
DEFINE l_chr         LIKE type_t.chr1
#150205apo--(s)
DEFINE l_apca001     LIKE apca_t.apca001
DEFINE l_apcadocdt   LIKE apca_t.apcadocdt
DEFINE l_str         STRING
DEFINE l_prog        LIKE type_t.chr10   #備份現在執行的程式代號
#150205apo--(e)
DEFINE l_apcd024     LIKE apda_t.apda024  #170322-00052
DEFINE l_wsel_cnt    LIKE type_t.num5     #170322-00052#21  add                    
DEFINE l_mid_db      STRING               #170322-00052#21  add  

   LET r_success = TRUE
   LET l_date = cl_get_current()
   
   CALL s_ld_sel_glaa(p_apdald,'glaacomp|glaa121') RETURNING  g_sub_success,l_glaacomp,l_glaa121 #161226-00039#1

   ###1.依類型將沖銷金額還原:應付-apcc/應收-xrcc###
   CALL s_aapt420_upd_contra_amount(p_apdald,p_apdadocno,'-') RETURNING g_sub_success
   IF NOT g_sub_success THEN
      LET r_success = FALSE
   END IF
   
   ###2.刪除銀存收支異動檔及應付票據檔###
   #銀存收支異動檔
   DELETE FROM nmbc_t
    WHERE nmbcent = g_enterprise
      AND nmbcdocno = p_apdadocno
   #160517-00001#5--s
   #刪除現金變動碼明細檔
   DELETE FROM glbc_t
    WHERE glbcent = g_enterprise
      AND glbcdocno = p_apdadocno   
   #160517-00001#5--e
    
   #應付票據單身檔   
   IF cl_get_para(g_enterprise,g_site,'S-COM-0002') = 'N' THEN #170618-00516#1 add
      DELETE FROM nmcl_t
       WHERE nmclent = g_enterprise
         #AND nmcl001 = p_apdadocno    #170316-00062#1 mark lujh
         #170316-00062#1--add--str--lujh
         AND nmcl001 IN (SELECT apdedocno FROM apde_t 
                          WHERE apdeent = g_enterprise 
                            AND apdeld = p_apdald
                            AND apdedocno = p_apdadocno
                            AND apde006 = '30'
                            #AND apde003 IS NULL #170618-00516#1 mark 
                            )
         #170316-00062#1--add--str--lujh
         AND EXISTS(SELECT 1 FROM nmck_t
                     WHERE nmckent = g_enterprise
                       AND nmckdocno = nmcldocno 
                       AND nmck026 <> '4')    #票況為作廢不刪除 
   END IF #170618-00516#1 add                 
   
   #170316-00062#1--add--str--lujh   
   UPDATE nmcl_t SET nmcl001 = '',
                     nmcl002 = ''
    WHERE nmclent = g_enterprise
      AND nmcl001 IN (SELECT apdedocno FROM apde_t 
                       WHERE apdeent = g_enterprise 
                         AND apdeld = p_apdald
                         AND apdedocno = p_apdadocno
                         AND apde002 <> '16'
                         AND apde006 = '30'
                         AND apde003 IS NOT NULL)
      AND EXISTS(SELECT 1 FROM nmck_t
                  WHERE nmckent = g_enterprise
                    AND nmckdocno = nmcldocno 
                    #AND nmck026 <> '4')                      #170620-00106#1 mark
                    AND nmck026 <> '4' AND nmck001 <> 'IV' AND nmck001 <> 'AP')   #170620-00106#1 add #170618-00516#1 add nmck001 <> 'AP'
   #170316-00062#1--add--end--lujh
   
   #應付票據單頭檔
   IF cl_get_para(g_enterprise,g_site,'S-COM-0002') = 'N' THEN #170618-00516#1 add
      DELETE FROM nmck_t
       WHERE nmckent = g_enterprise
         AND nmck019 = p_apdadocno 
         AND nmck026 <> '4'   #票況為作廢不刪除
   #170618-00516#1 add s---      
   ELSE
      UPDATE nmck_t SET nmckstus = 'X'
       WHERE nmckent = g_enterprise
         AND nmck019 = p_apdadocno 
         AND nmck026 <> '4'   #票況為作廢不刪除      
   END IF   
   #170618-00516#1 add e---
#150205apo mark-- (s)
#   #----------------刪除產生之AP單--str---------------#
#   #待抵單多帳期檔
#   DELETE FROM apcc_t
#    WHERE apccent = g_enterprise
#      AND EXISTS(SELECT 1 FROM apca_t
#                  WHERE apcaent = g_enterprise
#                    AND apcadocno = apccdocno 
#                    AND apcald = apccld
#                    AND apca018 = p_apdadocno)   
#   
#   #待抵單單頭檔   
#   DELETE FROM apca_t
#    WHERE apcaent = g_enterprise
#      AND apca018 = p_apdadocno   
#
#   #待抵單單身檔   
#   DELETE FROM apcb_t
#    WHERE apcbent = g_enterprise
#      AND apcb002 = p_apdadocno    
#   #----------------刪除產生之AP單--end---------------#
#
#   #----------------刪除產生之AR單--str---------------#
#   #應收單多帳期檔
#   DELETE FROM xrcc_t
#    WHERE xrccent = g_enterprise
#      AND EXISTS(SELECT 1 FROM xrca_t
#                  WHERE xrcaent = g_enterprise
#                    AND xrcadocno = xrccdocno 
#                    AND xrcald = xrccld
#                    AND xrca018 = p_apdadocno)   
#   #應收單單頭檔   
#   DELETE FROM xrca_t
#    WHERE xrcaent = g_enterprise
#      AND xrca018 = p_apdadocno   
#
#   #應收單單身檔   
#   DELETE FROM xrcb_t
#    WHERE xrcbent = g_enterprise
#      AND xrcb002 = p_apdadocno    
#   #----------------刪除產生之AR單--end---------------#
#150205apo mark-- (e)

   LET l_count = 0 
   #SELECT COUNT(*) INTO l_count        #161114-00009#1 mark
   SELECT COUNT(apdedocno) INTO l_count #161114-00009#1 add
     FROM apde_t
    WHERE apdeent = g_enterprise
      AND apdedocno = p_apdadocno
      AND apdeld = p_apdald
#      AND NOT EXISTS
#            ( SELECT 1 FROM apee_t
#               WHERE apeeent =apdeent
#                 AND apeedocno =apde046 AND apeeseq= apde047 AND apee009 = 'Y')
      AND NOT EXISTS
            ( SELECT 1 FROM nmck_t
               WHERE nmckent = apdeent
                 AND nmckcomp = apdecomp
                 AND nmckdocno = apde003
                 #AND nmck001 = 'XX')        #170620-00106#1 mark 已付款單如果anmt460的來源為IV發票來源請款單,則aapt420取消確認時不可以清空單身的已付款單號與已付註記
                 AND nmck001 IN ('XX','IV')) #170620-00106#1 add                 
      AND apde002 = '10'   
      AND apde006 IN ('10','20','30')   #150128-00005#9
                 
   IF cl_null(l_count) THEN LET l_count = 0 END IF
   
   IF l_count > 0 THEN
      ###3.還原已轉及清空收支付款單號###   
      UPDATE apde_t SET apde009 = 'N',apde003 = '',apde004 = ''
       WHERE apdeent = g_enterprise
         AND apdedocno = p_apdadocno
         AND apdeld = p_apdald
#         AND NOT EXISTS
#               ( SELECT 1 FROM apee_t
#                  WHERE apeeent =apdeent
#                    AND apeedocno =apde046 AND apeeseq= apde047 AND apee009 = 'Y')
         AND NOT EXISTS
               ( SELECT 1 FROM nmck_t
                  WHERE nmckent = apdeent
                    AND nmckcomp = apdecomp
                    AND nmckdocno = apde003
                    #AND nmck001 = 'XX')        #170620-00106#1 mark 已付款單如果anmt460的來源為IV發票來源請款單,則aapt420取消確認時不可以清空單身的已付款單號與已付註記
                    AND nmck001 IN ('XX','IV')) #170620-00106#1 add
         AND apde002 = '10'
         AND apde006 IN ('10','20','30')   #150128-00005#9 
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN 
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = p_apdadocno CLIPPED,"/upd apde_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF 
   END IF   #150205apo
      
   ###4.將轉入帳款單號還原為原單別###
   LET l_sql = " SELECT apdeseq,apde014,apde002 ",   #150205apo add apde002
               "   FROM apde_t ",
               #"  WHERE apdeent = '",g_enterprise,"' ", #170615-00061#11 mark
               "  WHERE apdeent = ",g_enterprise," ",    #170615-00061#11 add
               "    AND apdedocno = '",p_apdadocno,"' ",
               "    AND apdeld = '",p_apdald,"' ",
               "    AND apde002 IN ('20','21','22') ",    #20:轉應付待抵/21:預付待抵轉應收/22:轉付第三方
#               "    AND NOT EXISTS ",
#               "          ( SELECT 1 FROM apee_t ",
#               "             WHERE apeeent =apdeent ",
#               "               AND apeedocno =apde046 AND apeeseq= apde047 AND apee009 = 'Y') ", #不含付款申請單確認時已轉之資料
               "  ORDER BY apdeseq "
   
   PREPARE s_aapt420_unconf_upd_p FROM l_sql
   DECLARE s_aapt420_unconf_upd_c CURSOR FOR s_aapt420_unconf_upd_p
   
   FOREACH s_aapt420_unconf_upd_c INTO l_apde.*
      #150205apo--(s)
      LET l_apca001 = ''
      LET l_apcadocdt = ''
      LET l_prog = g_prog   #備份程式代號            
      CASE
         #20:轉應付待抵款/22:代扣轉付
         WHEN l_apde.apde002 MATCHES '2[02]'
            SELECT apca001,apcadocdt INTO l_apca001,l_apcadocdt
              FROM apca_t
             WHERE apcaent = g_enterprise
               AND apcald  = p_apdald
               AND apcadocno = l_apde.apde014
            CALL s_fin_get_scc_value('8502',l_apca001,'3')RETURNING g_prog
            #不可跳號則不刪除改作廢
            #IF NOT s_aooi200_fin_del_docno(p_apdald,l_apde.apde014,l_apcadocdt) THEN #161226-00039#1 mark
            IF cl_get_para(g_enterprise,l_glaacomp,'S-COM-0002') = 'Y' THEN           #161226-00039#1
               UPDATE apca_t SET apcastus = 'X'
                                ,apca047 = ''       #170202-00027#1
                                ,apcamodid = g_user #170202-00027#1
                                ,apcamoddt = l_date #170202-00027#1
                WHERE apcaent = g_enterprise
                  AND apcald  = p_apdald AND apcadocno = l_apde.apde014
            ELSE
               DELETE FROM apca_t
                WHERE apcaent = g_enterprise
                  AND apcald  = p_apdald  AND apcadocno = l_apde.apde014
               #更新最大單號
               IF NOT s_aooi200_fin_del_docno(p_apdald,l_apde.apde014,l_apcadocdt) THEN
                  #LET r_success = FALSE  #150805apo mark
                  LET r_success = FALSE   #161226-00039#1
               END IF
               
               DELETE FROM apcb_t
                WHERE apcbent = g_enterprise
                  AND apcbld = p_apdald AND apcbdocno = l_apde.apde014
         
               CALL s_aapt300_del_sub_table(p_apdald,l_apde.apde014) RETURNING g_sub_success,g_errno,l_str
               IF NOT g_sub_success THEN
                  LET r_success = FALSE
               END IF
            END IF  
         #21:轉應收款
         WHEN l_apde.apde002 = '21'
            SELECT xrca001,xrcadocdt INTO l_apca001,l_apcadocdt
              FROM xrca_t
             WHERE xrcaent = g_enterprise
               AND xrcald  = p_apdald
               AND xrcadocno = l_apde.apde014
            CALL s_fin_get_scc_value('8302',l_apca001,'3')RETURNING g_prog
            #不可跳號則不刪除改作廢
            #IF NOT s_aooi200_fin_del_docno(p_apdald,l_apde.apde014,l_apcadocdt) THEN #161226-00039#1 mark
            IF cl_get_para(g_enterprise,l_glaacomp,'S-COM-0002') = 'Y' THEN           #161226-00039#1
               UPDATE xrca_t SET xrcastus = 'X'
                WHERE xrcaent = g_enterprise
                  AND xrcald  = p_apdald AND xrcadocno = l_apde.apde014
            ELSE
               DELETE FROM xrca_t
                WHERE xrcaent = g_enterprise
                  AND xrcald  = p_apdald  AND xrcadocno = l_apde.apde014
               #更新最大單號
               IF NOT s_aooi200_fin_del_docno(p_apdald,l_apde.apde014,l_apcadocdt) THEN
                  #LET r_success = FALSE  #150805apo mark
                  LET r_success = FALSE   #161226-00039#1
               END IF
               
               DELETE FROM xrcb_t
                WHERE xrcbent = g_enterprise
                  AND xrcbld = p_apdald AND xrcbdocno = l_apde.apde014
         
               CALL s_axrt300_del_sub_table(p_apdald,l_apde.apde014) RETURNING g_sub_success
               IF NOT g_sub_success THEN
                  LET r_success = FALSE
               END IF
            END IF              
      END CASE   
      LET g_prog = l_prog   #還原為原本程式代號         
      #150205apo--(e)
      #取單別
      CALL s_aooi200_fin_get_slip(l_apde.apde014) RETURNING g_sub_success,l_apde.apde014
      UPDATE apde_t SET apde014 = l_apde.apde014,apde009 = 'N'   #150205apo add apde009
       WHERE apdeent = g_enterprise
         AND apdedocno = p_apdadocno
         AND apdeld = p_apdald 
         AND apdeseq = l_apde.apdeseq    
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = p_apdadocno CLIPPED,"/upd apde_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF          
   END FOREACH
   #END IF   #150205 apo mark

   SELECT apdacomp INTO l_apdacomp
     FROM apda_t 
    WHERE apdaent  = g_enterprise
      AND apdadocno= p_apdadocno
      AND apdald   = p_apdald
   
   ###16類單身處理:1.還原票況 2.刪除票據異動檔###  
   LET l_sql = " SELECT apde003,apde024 ",
               "   FROM apde_t ",
               "  WHERE apdeent = '",g_enterprise,"' ",
               "    AND apdedocno = '",p_apdadocno,"' ",
               "    AND apdeld = '",p_apdald,"' ",
               "    AND apde002 IN ('16') ",    #16:收票轉付
               "  ORDER BY apdeseq "
   
   PREPARE s_aapt420_unconf_upd_p2 FROM l_sql
   DECLARE s_aapt420_unconf_upd_c2 CURSOR FOR s_aapt420_unconf_upd_p2
   
   FOREACH s_aapt420_unconf_upd_c2 INTO l_apde2.*
      LET l_nmcr002 = ''
      SELECT nmcr002 INTO l_nmcr002 
        FROM nmcr_t
       WHERE nmcrent  = g_enterprise
         AND nmcrdocno= p_apdadocno
         AND nmcr003  = l_apde2.apde003
         AND nmcr001  = l_apde2.apde024
         AND nmcrcomp = l_apdacomp
      IF cl_null(l_nmcr002) THEN 
         LET l_nmcr002 = '1'
      END IF

      #還原票據檔nmbb_t				
      UPDATE nmbb_t SET nmbb042 = l_nmcr002,     #原票況
                        nmbb046 = ''             #清空轉付對象			
       WHERE nmbbent  = g_enterprise
         AND nmbbcomp = l_apdacomp
         AND nmbbdocno= l_apde2.apde003
         AND nmbb030  = l_apde2.apde024		
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = p_apdadocno CLIPPED,"/upd nmbb_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF          
      UPDATE nmba_t SET nmbamodid = g_user,         
                        nmbamoddt = l_date	 
       WHERE nmbaent  = g_enterprise
         AND nmbacomp = l_apdacomp
         AND nmbadocno= l_apde2.apde003		
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = p_apdadocno CLIPPED,"/upd nmba_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF              
   END FOREACH
   #刪除票據異動檔
   DELETE FROM nmcq_t WHERE nmcqent = g_enterprise AND nmcqdocno = p_apdadocno AND nmcqcomp = l_apdacomp
   DELETE FROM nmcr_t WHERE nmcrent = g_enterprise AND nmcrdocno = p_apdadocno AND nmcrcomp = l_apdacomp
   
   UPDATE apda_t SET apdastus ='N',
                     apdacnfid = ''    ,apdacnfdt = ''
    WHERE apdaent = g_enterprise
      AND apdadocno = p_apdadocno
      AND apdald = p_apdald
   
   IF SQLCA.SQLERRD[3] = 0 THEN
      LET r_success = FALSE
   END IF
   
   #CALL s_ld_sel_glaa(p_apdald,'glaacomp|glaa121') RETURNING  g_sub_success,l_glaacomp,l_glaa121 #161226-00039#1 mark
   
   CALL s_aooi200_fin_get_slip(p_apdadocno) RETURNING g_sub_success,l_ap_slip
   
   CALL s_fin_get_doc_para(p_apdald,l_glaacomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
   IF l_glaa121 = 'Y' AND l_chr = 'Y'THEN
      UPDATE glga_t SET glgastus = 'N',
                        glgacnfid = '',glgacnfdt = ''
       WHERE glgaent = g_enterprise
         AND glgald  = p_apdald AND glgadocno = p_apdadocno
      
      IF SQLCA.SQLCODE THEN
         LET r_success = FALSE  
      END IF
   END IF

   #170322-00052#28 mark -str-
   #170322-00052#23  add  --str---
   #判斷 aoos020 是否啟用 e-B Chain 整合
   #IF cl_get_para(g_enterprise,g_site,"S-SYS-0006") = "Y" THEN
   #   
   #    #判斷單據是否拋轉EC
   #    SELECT apcd024 INTO l_apcd024 
   #      FROM apcd_t
   #     WHERE apcdent  = g_enterprise
   #       AND apcddocno = p_apdadocno
   #       AND apcdld   = p_apdald
   #
   #    IF l_apcd024 = 'Y' THEN
   #
   #   #中間庫轉換
   #   LET l_mid_db = ""
   #   CALL cl_eai_get_middb(g_dbs) RETURNING l_mid_db
   #    
   #   LET l_sql = " SELECT COUNT(1) FROM ",l_mid_db,".all_wsel_t",
   #               " WHERE wselent =",g_enterprise,
   #               "   AND wselsite = '",g_site,"'",
   #               "   AND wsel_pk1 = '",p_apdadocno,"'",
   #               "   AND wsel004 = 'purchase.payment.create'"
   #   PREPARE wsel_chk_pre FROM l_sql
   #   EXECUTE wsel_chk_pre INTO l_wsel_cnt
   #   
   #   IF l_wsel_cnt > 0 THEN      
   #      LET g_errparam.code = 'axm-00823'  #單據已拋轉EC，不可取消確認！
   #      LET g_errparam.extend = p_apdadocno
   #      LET g_errparam.popup = TRUE
   #      CALL cl_err()
   #      LET r_success = FALSE
   #      RETURN r_success            
   #   END IF         
   #END IF           
   #170322-00052#23  add  --end---
   #170322-00052#28 mark -end-   

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 作廢檢核
# Memo...........:
# Usage..........: CALL s_aapt420_void_chk(p_apdald,p_apdadocno)
#                  RETURNING r_success
# Date & Author..: 14/10/10 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_void_chk(p_apdald,p_apdadocno)
DEFINE p_apdald         LIKE apda_t.apdald
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE r_success        LIKE type_t.num5

   LET r_success = TRUE
   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 作廢
# Memo...........:
# Usage..........: CALL s_aapt420_void_upd(p_apdald,p_apdadocno)
#                  RETURNING r_success
# Date & Author..: 14/10/10 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_void_upd(p_apdald,p_apdadocno)
DEFINE p_apdald         LIKE apda_t.apdald
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE r_success        LIKE type_t.num5
DEFINE l_date           DATETIME YEAR TO SECOND
DEFINE l_glaacomp    LIKE glaa_t.glaacomp
DEFINE l_glaa121     LIKE glaa_t.glaa121
DEFINE l_ap_slip     LIKE apca_t.apcadocno
DEFINE l_chr         LIKE type_t.chr1

   LET r_success = TRUE
   LET l_date = cl_get_current()
   
   UPDATE apda_t SET apdastus = 'X',apdamodid = g_user,apdamoddt = l_date
    WHERE apdaent = g_enterprise
      AND apdald = p_apdald AND apdadocno = p_apdadocno
      
   
   IF SQLCA.SQLERRD[3] = 0 THEN
      LET r_success = FALSE
   END IF
   
   CALL s_ld_sel_glaa(p_apdald,'glaacomp|glaa121') RETURNING  g_sub_success,l_glaacomp,l_glaa121
   
   CALL s_aooi200_fin_get_slip(p_apdadocno) RETURNING g_sub_success,l_ap_slip
   
   CALL s_fin_get_doc_para(p_apdald,l_glaacomp,l_ap_slip,'D-FIN-0030') RETURNING l_chr
   IF l_glaa121 = 'Y' AND l_chr = 'Y'THEN
      UPDATE glga_t SET glgastus = 'X',
                        glgamodid = g_user,glgamoddt = l_date
       WHERE glgaent = g_enterprise
         AND glgald  = p_apdald AND glgadocno = p_apdadocno
      
      IF SQLCA.SQLCODE THEN
         LET r_success = FALSE  
      END IF
   END IF   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: BPM 自動確認
# Usage..........: CALL s_aapt420_ws_confirm(p_apdadocno)
#                  RETURNING r_success
# Date & Author..: 14/10/10 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ws_confirm(p_apdadocno)
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE p_flag           LIKE type_t.chr1
DEFINE r_success        LIKE type_t.num5
DEFINE l_apdald         LIKE apda_t.apdald
DEFINE l_sfin3008       LIKE type_t.chr80      #170413-00077#1 add
DEFINE l_apdacomp       LIKE apda_t.apdacomp   #170413-00077#1 add

   LET r_success = TRUE
   LET l_apdald = cl_bpm_get_key_value('apdald')

   #160308-00010#47 add---(s) 背景审核將核銷日期更新為當天日期
   IF g_bgjob = 'Y' THEN
      UPDATE apda_t SET apdadocdt = g_today
      WHERE apdaent = g_enterprise
         AND apdald = l_apdald AND apdadocno = p_apdadocno
         
      IF SQLCA.sqlcode THEN
         LET r_success = FALSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'sub-00034'
         LET g_errparam.extend = 'update docdt'
         LET g_errparam.popup = TRUE
         CALL cl_err()
   
         RETURN r_success
      END IF
   END IF
   #160308-00010#47 add---(e)
   
   #確認前檢核段
   CALL s_aapt420_conf_chk(l_apdald,p_apdadocno) RETURNING r_success
   IF r_success THEN
       #確認交易處理段
       #CALL s_aapt420_conf_upd(l_apdald,p_apdadocno,p_flag) RETURNING r_success   #170413-00077#1 mark
       #170413-00077#1---add---str--
       SELECT apdacomp INTO l_apdacomp
         FROM apda_t
        WHERE apdaent = g_enterprise
          AND apdald = l_apdald
          AND apdadocno = p_apdadocno
       CALL cl_get_para(g_enterprise,l_apdacomp,'S-FIN-3008') RETURNING l_sfin3008
       CALL s_aapt420_conf_upd(l_apdald,p_apdadocno,l_sfin3008) RETURNING r_success
       #170413-00077#1---add---end--
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 依帳款單帶值
# Memo...........:
# Usage..........: CALL s_aapt420_source_doc_carry(p_apce002,p_docno,p_seq,p_apcald,p_apcedocno,p_apceseq,p_apceld,p_period,p_invo,p_flag)
#                  RETURNING r_array
# Input parameter: p_apce002     帳款類型
#                : p_docno       帳款單號
#                : p_seq         帳款項次
#                : p_apcald      來源帳款帳別
#                : p_apcedocno   核銷單號
#                : p_apceseq     核銷單項次
#                : p_apceld      核銷單帳別
#                : p_period      帳期
#                : p_invo        發票號碼
#                : p_flag        沖銷參數S-FIN-2002
# Return code....: r_apce013,r_apce024,r_apce100,r_apce109,r_apce101,r_apce119,r_apce031
# Date & Author..: 14/10/10 By apo
# Modify.........:
#160704-00022#1   160718 By 03538   應付帳款可沖金額應扣除留置金額
################################################################################
PUBLIC FUNCTION s_aapt420_source_doc_carry(p_apce002,p_docno,p_seq,p_apcald,p_apcedocno,p_apceseq,p_apceld,p_period,p_invo,p_flag)
	DEFINE p_apce002     LIKE apce_t.apce002
   DEFINE p_docno       LIKE apcc_t.apccdocno
	DEFINE p_seq         LIKE apcc_t.apccseq
	DEFINE p_apcald      LIKE apca_t.apcald
   DEFINE p_apcedocno   LIKE apce_t.apcedocno
	DEFINE p_apceseq     LIKE apce_t.apceseq
	DEFINE p_apceld      LIKE apce_t.apceld
	DEFINE p_period      LIKE apcc_t.apcc001
	DEFINE p_invo        LIKE apcc_t.apcc009
	DEFINE p_flag        LIKE type_t.chr1   #應付沖銷參數:S-FIN-2002
	DEFINE r_apce        RECORD
                        apce038    LIKE apce_t.apce038,
                        apce024    LIKE apce_t.apce024,
                        apce100    LIKE apce_t.apce100,
                        apce109    LIKE apce_t.apce109,
                        apce101    LIKE apce_t.apce101,
                        
                        apce119    LIKE apce_t.apce119,
                        apce120    LIKE apce_t.apce120,
                        apce121    LIKE apce_t.apce121,
                        apce129    LIKE apce_t.apce129,
                        apce130    LIKE apce_t.apce130,
                        
                        apce131    LIKE apce_t.apce131,
                        apce139    LIKE apce_t.apce139,
                        apce031    LIKE apce_t.apce031,
                        apce017    LIKE apce_t.apce017,
                        apce018    LIKE apce_t.apce018,
                        
                        apce019    LIKE apce_t.apce019,
                        apce022    LIKE apce_t.apce022,
                        apce020    LIKE apce_t.apce020,
                        apce023    LIKE apce_t.apce023,
                        apce035    LIKE apce_t.apce035,
                        
                        apce036    LIKE apce_t.apce036,
                        apce044    LIKE apce_t.apce044,
                        apce045    LIKE apce_t.apce045,
                        apce046    LIKE apce_t.apce046,
                        apce051    LIKE apce_t.apce051,
                        
                        apce052    LIKE apce_t.apce052,
                        apce053    LIKE apce_t.apce053,
                        apce054    LIKE apce_t.apce054,
                        apce055    LIKE apce_t.apce055,
                        apce056    LIKE apce_t.apce056,
                        
                        apce057    LIKE apce_t.apce057,
                        apce058    LIKE apce_t.apce058,
                        apce059    LIKE apce_t.apce059,
                        apce060    LIKE apce_t.apce060,
                        apce010    LIKE apce_t.apce010,
                        apce048    LIKE apce_t.apce048   #151029
                       
                        END RECORD
   DEFINE l_sql         STRING
   DEFINE l_unconf      RECORD
                        apcc10x    LIKE type_t.num20_6,
                        apcc11x    LIKE type_t.num20_6,
                        apcc12x    LIKE type_t.num20_6,
                        apcc13x    LIKE type_t.num20_6
                        END RECORD
   DEFINE l_unconf2     RECORD
                        apcc10x    LIKE type_t.num20_6,
                        apcc11x    LIKE type_t.num20_6,
                        apcc12x    LIKE type_t.num20_6,
                        apcc13x    LIKE type_t.num20_6
                        END RECORD
   DEFINE l_unconf3     RECORD
                        xrcc10x    LIKE type_t.num20_6,
                        xrcc11x    LIKE type_t.num20_6,
                        xrcc12x    LIKE type_t.num20_6,
                        xrcc13x    LIKE type_t.num20_6
                        END RECORD
   DEFINE l_unconf4     RECORD
                        xrcc10x    LIKE type_t.num20_6,
                        xrcc11x    LIKE type_t.num20_6,
                        xrcc12x    LIKE type_t.num20_6,
                        xrcc13x    LIKE type_t.num20_6
                        END RECORD
   #160705-00035#1-s
   DEFINE l_unconf5     RECORD
                        apba103    LIKE type_t.num20_6,
                        apba113    LIKE type_t.num20_6,
                        apba1032   LIKE type_t.num20_6,
                        apba1033   LIKE type_t.num20_6
                        END RECORD
   #160705-00035#1-e
   DEFINE l_pay         RECORD
                        apcc10x    LIKE type_t.num20_6,
                        apcc11x    LIKE type_t.num20_6,
                        apcc12x    LIKE type_t.num20_6,
                        apcc13x    LIKE type_t.num20_6
                        END RECORD
   DEFINE l_apda005     LIKE apda_t.apda005   #150825-00004#1
   #160704-00022#1--s
   DEFINE l_lien_amt    LIKE apcc_t.apcc108
   DEFINE l_lien_amt2   LIKE apcc_t.apcc108
   DEFINE l_glaa        RECORD
            glaa001     LIKE glaa_t.glaa001,
            glaa015     LIKE glaa_t.glaa015,
            glaa016     LIKE glaa_t.glaa016,
            glaa019     LIKE glaa_t.glaa019,
            glaa020     LIKE glaa_t.glaa020
                  END RECORD
   #160704-00022#1--e
   #170328-00033#1 --s add
   DEFINE l_cnt         LIKE type_t.num10
   DEFINE l_cnt_sql     STRING
   #170328-00033#1 --e add 
   #170531-00062#1 add(s) 
   DEFINE l_docdt       LIKE apca_t.apcadocdt #170531-00062#1
   DEFINE l_docdt1      LIKE apca_t.apcadocdt
   #170531-00062#1 add(e)
   
   #170531-00062#1 add(s)
   SELECT apcadocdt INTO l_docdt   #沖銷單的日期
     FROM apca_t 
    WHERE apcaent = g_enterprise
      AND apcadocno = p_docno
      AND apcald = p_apcald
   #IF g_prog MATCHES 'aapt420*' THEN   #170714-00023#1 mark
   #IF g_prog MATCHES 'aapt420*' OR 'aapp400*' THEN #170714-00023#1 add #170823-00010#1 mark 寫法修正
   IF g_prog MATCHES 'aapt420*' OR g_prog MATCHES 'aapp400*' THEN       #170823-00010#1 add 
      SELECT apdadocdt INTO l_docdt1  #單據日期
        FROM apda_t 
       WHERE apdaent = g_enterprise
         AND apdadocno = p_apcedocno
         AND apdald = p_apceld
   ELSE   
      SELECT apcadocdt INTO l_docdt1  #單據日期
        FROM apca_t 
       WHERE apcaent = g_enterprise
         AND apcadocno = p_apcedocno
         AND apcald = p_apceld
   END IF      
   #如果沖銷單日期>單據日期，則需報錯
   IF l_docdt > l_docdt1 THEN 
      INITIALIZE r_apce TO NULL
      RETURN r_apce.*
   END IF
   #170531-00062#1 add(e)
   
   
   
   CASE 
      WHEN p_apce002[1,1] = '4'   #應付      #重評匯率
        #-150501--mark--(s)
        ##-150317apo add apcc1*9--(s)
        #LET l_sql = " SELECT apca004,apcb002,apca100,apcc108-apcc109,apcc102, ",   
        #            "        apcc118+apcc113-apcc119,apcc120,apcc121,apcc128+apcc123-apcc129, ",
        #            "        apcc130,apcc131,apcc138+apcc133-apcc139,apcc004, " 
        ##-150317apo add apcc1*9--(e)          
        #-150501--mark--(e)         
         #1/2:取單頭核算項 3:取單身
         IF p_flag = '1' OR p_flag = '2' THEN         
            #LET l_sql = l_sql,   #150501 mark
            #-150501--(s)
            LET l_sql = 
                     " SELECT apca004,apca018,apca100,apcc108-apcc109,apcc102, ",   
                     "        apcc118+apcc113-apcc119,apcc120,apcc121,apcc128+apcc123-apcc129, ",
                     "        apcc130,apcc131,apcc138+apcc133-apcc139,apcc004, ",              
            #-150501--(e)
                     "        apca014,apca015,apca034,apca033,'', ",
                     "        '','','','','', ",
                     "        '','','','','', ",
                     "        '','','','','', ",
                     "        '','',apcc009 "   #151029 add apcc009
            #-150501--(s)
                    ,"   FROM apca_t,apcc_t ",
                     "  WHERE apcaent = apccent ", 
                     "    AND apcald = apccld ",
                     "    AND apcadocno = apccdocno ",                 
                     "    AND apcaent = '",g_enterprise,"' ",
                     "    AND apcadocno = '",p_docno,"' ",
                     "    AND apccseq = '",p_seq,"' ",
                     "    AND apcald = '",p_apcald,"' ",                     
                     "    AND apcc001 = '",p_period,"' "
                    #"    AND apcc009 = '",p_invo,"' "   #151029 mark          
            #-150501--(e)
         ELSE           
            #LET l_sql = l_sql,   #150501 mark
            #-150501--(s)
            LET l_sql = 
                     " SELECT apca004,apcb002,apca100,apcc108-apcc109,apcc102, ",   
                     "        apcc118+apcc113-apcc119,apcc120,apcc121,apcc128+apcc123-apcc129, ",
                     "        apcc130,apcc131,apcc138+apcc133-apcc139,apcc004, ",              
            #-150501--(e)            
                     "        '',apcb010,apcb011,apcb015,apcb012, ",
                     "        apcb016,apcb024,apcb036,apcb033,apcb034, ",
                     "        apcb035,apcb037,apcb038,apcb039,apcb040, ",
                     "        apcb041,apcb042,apcb043,apcb044,apcb045, ",
                     "        apcb046,apcb047,apcc009 "    #151029 add apcc009     
            #-150501--(s)
                    ,"   FROM apca_t,apcb_t,apcc_t ",
                     "  WHERE apcaent = apcbent ", 
                     "    AND apcald = apcbld ",
                     "    AND apcadocno = apcbdocno ",
                     "    AND apcbent = apccent ",
                     "    AND apcbld  = apccld ",
                     "    AND apcbdocno = apccdocno ",
                     "    AND apcbseq = apccseq ",                    
                     "    AND apcaent = '",g_enterprise,"' ",
                     "    AND apcadocno = '",p_docno,"' ",
                     "    AND apcbseq = '",p_seq,"' ",
                     "    AND apcald = '",p_apcald,"' ",                     
                     "    AND apcc001 = '",p_period,"' "
                    #"    AND apcc009 = '",p_invo,"' "    #151029 mark 
            #-150501--(e)
            #170328-00033#1 --s add
            LET l_cnt = 0
            LET l_cnt_sql = " SELECT COUNT(apcb002) FROM (",l_sql,")"
            PREPARE cnt_pre FROM l_cnt_sql
            EXECUTE cnt_pre INTO l_cnt  
            IF l_cnt = 0 OR cl_null(l_cnt) THEN
            LET l_sql = 
                     " SELECT apca004,apcb002,apca100,apcc108-apcc109,apcc102, ",   
                     "        apcc118+apcc113-apcc119,apcc120,apcc121,apcc128+apcc123-apcc129, ",
                     "        apcc130,apcc131,apcc138+apcc133-apcc139,apcc004, ",              
                     "        apca014,apca015,apca034,apca033,'', ",
                     "        '','','','','', ",
                     "        '','','','','', ",
                     "        '','','','','', ",
                     "        '','',apcc009 ",
                     "   FROM apca_t,apcb_t,apcc_t ",
                     "  WHERE apcaent = apcbent ", 
                     "    AND apcald = apcbld ",
                     "    AND apcadocno = apcbdocno ",
                     "    AND apcbent = apccent ",
                     "    AND apcbld  = apccld ",
                     "    AND apcbdocno = apccdocno ",
                     "    AND apcaent = '",g_enterprise,"' ",
                     "    AND apcadocno = '",p_docno,"' ",
                     "    AND apccseq = '",p_seq,"' ",
                     "    AND apcald = '",p_apcald,"' ",                     
                     "    AND apcc001 = '",p_period,"' "               
            END IF
            #170328-00033#1 --e add            
         END IF
        #-150501--mark--(s)
        #LET l_sql = l_sql,
        #            "   FROM apca_t,apcb_t,apcc_t ",
        #            "  WHERE apcaent = apcbent ", 
        #            "    AND apcald = apcbld ",
        #            "    AND apcadocno = apcbdocno ",
        #            "    AND apcbent = apccent ",
        #            "    AND apcbld  = apccld ",
        #            "    AND apcbdocno = apccdocno ",
        #            "    AND apcbseq = apccseq ",                    
        #            "    AND apcaent = '",g_enterprise,"' ",
        #            "    AND apcadocno = '",p_docno,"' ",
        #            "    AND apcbseq = '",p_seq,"' ",
        #            "    AND apcald = '",p_apcald,"' ",                     
        #            "    AND apcc001 = '",p_period,"' ",
        #            "    AND apcc009 = '",p_invo,"' "
        #-150501--mark--(e)
    
      WHEN p_apce002[1,1] = '3'   #應收 
        #-150501--mark--(s)
        ##-150317apo add xrcc1*9--(s)
        #LET l_sql = " SELECT xrca004,xrcb002,xrca100,xrcc108-xrcc109,xrcc102, ",
        #            "        xrcc118+xrcc113-xrcc119,xrcc120,xrcc121,xrcc128+xrcc123-xrcc129, ",
        #            "        xrcc130,xrcc131,xrcc138+xrcc133-xrcc139,xrcc004, "       
        ##-150317apo add xrcc1*9--(e)                     
        #-150501--mark--(e)
         #1/2:取單頭核算項 3:取單身
         IF p_flag = '1' OR p_flag = '2' THEN         
            #LET l_sql = l_sql,  #150501 mark
            #-150501--(s)
            LET l_sql =
                     " SELECT xrca004,xrca018,xrca100,xrcc108-xrcc109,xrcc102, ",
                     "        xrcc118+xrcc113-xrcc119,xrcc120,xrcc121,xrcc128+xrcc123-xrcc129, ",
                     "        xrcc130,xrcc131,xrcc138+xrcc133-xrcc139,xrcc004, ",                       
            #-150501--(e)
                     "        xrca014,xrca015,xrca034,xrca033,'', ",
                     "        '','','','','', ",
                     "        '','','','','', ",
                     "        '','','','','', ",
                     "        '','',xrcc009 "   #151029 add xrcc009
            #-150501--(s)
                    ,"   FROM xrca_t,xrcc_t ",
                     "  WHERE xrcaent = xrccent ", 
                     "    AND xrcald = xrccld ",
                     "    AND xrcadocno = xrccdocno ",                  
                     "    AND xrcaent = '",g_enterprise,"' ",
                     "    AND xrcadocno = '",p_docno,"' ",
                     "    AND xrccseq = '",p_seq,"' ",
                     "    AND xrcald = '",p_apcald,"' ",                     
                     "    AND xrcc001 = '",p_period,"' "            
            #-150501--(e)
         ELSE
            #LET l_sql = l_sql,   #150501 mark
            #-150501--(s)
            LET l_sql =
                     " SELECT xrca004,xrcb002,xrca100,xrcc108-xrcc109,xrcc102, ",
                     "        xrcc118+xrcc113-xrcc119,xrcc120,xrcc121,xrcc128+xrcc123-xrcc129, ",
                     "        xrcc130,xrcc131,xrcc138+xrcc133-xrcc139,xrcc004, ",                       
            #-150501--(e)            
                     "        '',xrcb010,xrcb011,xrcb015,xrcb012, ",
                     "        xrcb016,xrcb024,xrcb036,xrcb033,xrcb034, ",
                     "        xrcb035,xrcb037,xrcb038,xrcb039,xrcb040, ",
                     "        xrcb041,xrcb042,xrcb043,xrcb044,xrcb045, ",
                     "        xrcb046,xrcb047,xrcc009 "   #151029 add xrcc009      
            #-150501--(s)
                    ,"   FROM xrca_t,xrcb_t,xrcc_t ",
                     "  WHERE xrcaent = xrcbent ", 
                     "    AND xrcald = xrcbld ",
                     "    AND xrcadocno = xrcbdocno ",
                     "    AND xrcbent = xrccent ",
                     "    AND xrcbld  = xrccld ",
                     "    AND xrcbdocno = xrccdocno ",
                     "    AND xrcbseq = xrccseq ",                    
                     "    AND xrcaent = '",g_enterprise,"' ",
                     "    AND xrcadocno = '",p_docno,"' ",
                     "    AND xrcbseq = '",p_seq,"' ",
                     "    AND xrcald = '",p_apcald,"' ",                     
                     "    AND xrcc001 = '",p_period,"' "            
            #-150501--(e)
            #170328-00033#1 --s add
            LET l_cnt = 0
            LET l_cnt_sql = " SELECT COUNT(xrcb002) FROM (",l_sql,")"
            PREPARE cnt_pre1 FROM l_cnt_sql
            EXECUTE cnt_pre1 INTO l_cnt  
            IF l_cnt = 0 OR cl_null(l_cnt) THEN
            LET l_sql =
                     " SELECT xrca004,xrcb002,xrca100,xrcc108-xrcc109,xrcc102, ",
                     "        xrcc118+xrcc113-xrcc119,xrcc120,xrcc121,xrcc128+xrcc123-xrcc129, ",
                     "        xrcc130,xrcc131,xrcc138+xrcc133-xrcc139,xrcc004, ",                       
                     "        xrca014,xrca015,xrca034,xrca033,'', ",
                     "        '','','','','', ",
                     "        '','','','','', ",
                     "        '','','','','', ",
                     "        '','',xrcc009 ",   
                     "   FROM xrca_t,xrcb_t,xrcc_t ",
                     "  WHERE xrcaent = xrcbent ", 
                     "    AND xrcald = xrcbld ",
                     "    AND xrcadocno = xrcbdocno ",
                     "    AND xrcbent = xrccent ",
                     "    AND xrcbld  = xrccld ",
                     "    AND xrcbdocno = xrccdocno ",
                     "    AND xrcaent = '",g_enterprise,"' ",
                     "    AND xrcadocno = '",p_docno,"' ",
                     "    AND xrccseq = '",p_seq,"' ",
                     "    AND xrcald = '",p_apcald,"' ",                     
                     "    AND xrcc001 = '",p_period,"' "            
            END IF
            #170328-00033#1 --e add              
            
         END IF
        #-150501--mark--(s)
        #LET l_sql = l_sql,         
        #            "   FROM xrca_t,xrcb_t,xrcc_t ",
        #            "  WHERE xrcaent = xrcbent ", 
        #            "    AND xrcald = xrcbld ",
        #            "    AND xrcadocno = xrcbdocno ",
        #            "    AND xrcbent = xrccent ",
        #            "    AND xrcbld  = xrccld ",
        #            "    AND xrcbdocno = xrccdocno ",
        #            "    AND xrcbseq = xrccseq ",                    
        #            "    AND xrcaent = '",g_enterprise,"' ",
        #            "    AND xrcadocno = '",p_docno,"' ",
        #            "    AND xrcbseq = '",p_seq,"' ",
        #            "    AND xrcald = '",p_apcald,"' ",                     
        #            "    AND xrcc001 = '",p_period,"' "
        #-150501--mark--(e)          
        #151029 mark--s        
        ##此處由於xrcc009為空時,不會預設給一個空白,因此sql特別處理
        #IF NOT cl_null(p_invo) THEN
        #   LET l_sql = l_sql," AND xrcc009 = '",p_invo,"' "
        #ELSE
        #   LET l_sql = l_sql," AND (xrcc009 IS NULL OR xrcc009 = ' ') "
        #END IF
        #151029 mark--e
     
   END CASE 
   PREPARE s_aapt420_sel_info_p FROM l_sql
   DECLARE s_aapt420_sel_info_c SCROLL CURSOR FOR s_aapt420_sel_info_p
   OPEN s_aapt420_sel_info_c
   FETCH s_aapt420_sel_info_c INTO r_apce.*
   FREE s_aapt420_sel_info_c 
   
   INITIALIZE l_unconf.* TO NULL
   #已存在應付核銷單金額
   LET l_sql = " SELECT SUM(COALESCE(apce109,0)),SUM(COALESCE(apce119,0)),SUM(COALESCE(apce129,0)),SUM(COALESCE(apce139,0)) ",
               "   FROM apce_t,apda_t ",
               "  WHERE apceent = ",g_enterprise," ",
               "    AND apceld  = '",p_apceld,"' ",
               "    AND apce003 = '",p_docno,"' ",
               "    AND apce004 = ",p_seq," ",
               "    AND apce005 = ",p_period," ",
               "    AND apdaent = apceent ",
               "    AND apdald  = apceld ",
               "    AND apdadocno = apcedocno ",
               #-150331apo--(s)
               #150331 carol:來源為aapt430之沖銷紀錄(apda_t+apce_t),帳款單性質1*的要排除, 2*不排除(原因為aapt430只會回寫性質為2*之apcc)
               "    AND NOT ( apce001='aapt430' AND EXISTS(SELECT 1 FROM apca_t ",
               "                                            WHERE apcaent = apceent ",
               "                                              AND apcadocno = apce003 ",
               "                                              AND apcald = apceld ",
               "                                              AND apca001 LIKE '1%')) ",
               #-150331apo--(e)              
               "    AND apdastus NOT IN ('X','Y') ",   #150317apo add 'Y'
               "    AND (( apcedocno <> '",p_apcedocno,"') ",  #排除自身且非作廢
               "         OR (apcedocno = '",p_apcedocno,"' AND apceseq <> ",p_apceseq,")) "
   
   PREPARE s_aapt420_sum_apcep3 FROM l_sql
   EXECUTE s_aapt420_sum_apcep3 INTO l_unconf.*
   IF cl_null(l_unconf.apcc10x) THEN LET l_unconf.apcc10x = 0 END IF
   IF cl_null(l_unconf.apcc11x) THEN LET l_unconf.apcc11x = 0 END IF 
   IF cl_null(l_unconf.apcc12x) THEN LET l_unconf.apcc12x = 0 END IF 
   IF cl_null(l_unconf.apcc13x) THEN LET l_unconf.apcc13x = 0 END IF    

   INITIALIZE l_unconf2.* TO NULL
   #已存在應付直接沖帳金額
   LET l_sql = " SELECT SUM(COALESCE(apce109,0)),SUM(COALESCE(apce119,0)),SUM(COALESCE(apce129,0)),SUM(COALESCE(apce139,0)) ",
               "   FROM apce_t,apca_t ",
               "  WHERE apceent = ",g_enterprise," ",
               "    AND apceld  = '",p_apceld,"' ",
               "    AND apce003 = '",p_docno,"' ",
               "    AND apce004 = ",p_seq," ",
               "    AND apce005 = ",p_period," ",
               "    AND apcaent = apceent ",
               "    AND apcald  = apceld ",
               "    AND apcadocno = apcedocno ",
               #150331 carol:來源為aapt430之沖銷紀錄(apda_t+apce_t),帳款單性質1*的要排除, 2*不排除(原因為aapt430只會回寫性質為2*之apcc)
               "    AND NOT ( apce001='aapt430' AND EXISTS(SELECT 1 FROM apca_t ",
               "                                            WHERE apcaent = apceent ",
               "                                              AND apcadocno = apce003 ",
               "                                              AND apcald = apceld ",
               "                                              AND apca001 LIKE '1%')) ",
               #-150331apo--(e)              
               "    AND apcastus NOT IN ('X','Y') ",   #150317apo add 'Y'
               "    AND (( apcedocno <> '",p_apcedocno,"') ",  #排除自身且非作廢
               "         OR (apcedocno = '",p_apcedocno,"' AND apceseq <> ",p_apceseq,")) "
   
   PREPARE s_aapt420_sum_apcep4 FROM l_sql
   EXECUTE s_aapt420_sum_apcep4 INTO l_unconf2.*
   IF cl_null(l_unconf2.apcc10x) THEN LET l_unconf2.apcc10x = 0 END IF
   IF cl_null(l_unconf2.apcc11x) THEN LET l_unconf2.apcc11x = 0 END IF   
   IF cl_null(l_unconf2.apcc12x) THEN LET l_unconf2.apcc12x = 0 END IF   
   IF cl_null(l_unconf2.apcc13x) THEN LET l_unconf2.apcc13x = 0 END IF   


#   #已存在付款申請單
#   LET l_sql = " SELECT SUM(COALESCE(apeb109,0)),SUM(COALESCE(apeb119,0)),SUM(COALESCE(apeb129,0)),SUM(COALESCE(apeb139,0)) ",
#               "   FROM apeb_t,apea_t ",
#               "  WHERE apebent = ",g_enterprise," ",
#               "    AND apebld  = '",p_apceld,"' ",
#               "    AND apeb003 = '",p_docno,"' ",
#               "    AND apeb004 = ",p_seq," ",
#               "    AND apeb005 = ",p_period," ",
#               "    AND apeaent = apebent ",
#               "    AND apeald  = apebld ",
#               "    AND apeadocno = apebdocno ",
#               "    AND apeastus NOT IN ('X') ",  #不包含作廢
#               "    AND NOT EXISTS ",             #扣除已產生到核銷單金額,避免重複計算
#               "          ( SELECT 1 FROM apce_t ",
#               "             WHERE apceent=apebent AND apceld = apebld ",
#               "               AND apce049=apebdocno AND apce050 = apebseq) "               
#   PREPARE s_aapt420_sum_apebp3 FROM l_sql
#   EXECUTE s_aapt420_sum_apebp3 INTO l_pay.*
   
   #151207-00018#6--add--str--lujh
   #aapt415 同 apcc key 己請款未核銷額(apeb108-apeb109)
   LET l_sql = "SELECT SUM(COALESCE(apeb108,0)-COALESCE(apeb109,0)),SUM(COALESCE(apeb118,0)-COALESCE(apeb119,0)),0,0 ",
               "  FROM apea_t,apeb_t ",
               " WHERE apebent = ",g_enterprise,
               "   AND apeaent = apebent ",
               "   AND apeadocno = apebdocno ", 
               "   AND apeb003 = '",p_docno,"'",
               "   AND apeb004 = ",p_seq,
               "   AND apeb005 = ",p_period,    
               "   AND apeastus <> 'X' "
   
   PREPARE s_aapt420_sum_apebp3 FROM l_sql
   EXECUTE s_aapt420_sum_apebp3 INTO l_pay.*
   #151207-00018#6--add--end--lujh

   IF cl_null(l_pay.apcc10x) THEN LET l_pay.apcc10x = 0 END IF
   IF cl_null(l_pay.apcc11x) THEN LET l_pay.apcc11x = 0 END IF
   IF cl_null(l_pay.apcc12x) THEN LET l_pay.apcc12x = 0 END IF
   IF cl_null(l_pay.apcc13x) THEN LET l_pay.apcc13x = 0 END IF

   INITIALIZE l_unconf3.* TO NULL
   #已存在應收核銷單金額
   LET l_sql = " SELECT SUM(COALESCE(xrce109,0)),SUM(COALESCE(xrce119,0)),SUM(COALESCE(xrce129,0)),SUM(COALESCE(xrce139,0)) ",
               "   FROM xrce_t,xrda_t ",
               "  WHERE xrceent = ",g_enterprise," ",
               "    AND xrceld  = '",p_apceld,"' ",
               "    AND xrce003 = '",p_docno,"' ",
               "    AND xrce004 = ",p_seq," ",
               "    AND xrce005 = ",p_period," ",
               "    AND xrdaent = xrceent ",
               "    AND xrdald  = xrceld ",
               "    AND xrdadocno = xrcedocno ",
               "    AND xrdastus NOT IN ('X','Y') "   #150317apo add 'Y'
   
   PREPARE s_aapt420_sum_xrcep3 FROM l_sql
   EXECUTE s_aapt420_sum_xrcep3 INTO l_unconf3.*
   IF cl_null(l_unconf3.xrcc10x) THEN LET l_unconf3.xrcc10x = 0 END IF
   IF cl_null(l_unconf3.xrcc11x) THEN LET l_unconf3.xrcc11x = 0 END IF  
   IF cl_null(l_unconf3.xrcc12x) THEN LET l_unconf3.xrcc12x = 0 END IF  
   IF cl_null(l_unconf3.xrcc13x) THEN LET l_unconf3.xrcc13x = 0 END IF  

   INITIALIZE l_unconf4.* TO NULL
   #已存在應收直接沖帳金額
   LET l_sql = " SELECT SUM(COALESCE(xrce109,0)),SUM(COALESCE(xrce119,0)),SUM(COALESCE(xrce129,0)),SUM(COALESCE(xrce139,0)) ",
               "   FROM xrce_t,xrca_t ",
               "  WHERE xrceent = ",g_enterprise," ",
               "    AND xrceld  = '",p_apceld,"' ",
               "    AND xrce003 = '",p_docno,"' ",
               "    AND xrce004 = ",p_seq," ",
               "    AND xrce005 = ",p_period," ",
               "    AND xrcaent = xrceent ",
               "    AND xrcald  = xrceld ",
               "    AND xrcadocno = xrcedocno ",
               "    AND xrcastus NOT IN ('X','Y') "   #150317apo add 'Y'
   
   PREPARE s_aapt420_sum_xrcep4 FROM l_sql
   EXECUTE s_aapt420_sum_xrcep4 INTO l_unconf4.*
   IF cl_null(l_unconf4.xrcc10x) THEN LET l_unconf4.xrcc10x = 0 END IF
   IF cl_null(l_unconf4.xrcc11x) THEN LET l_unconf4.xrcc11x = 0 END IF 
   IF cl_null(l_unconf4.xrcc12x) THEN LET l_unconf4.xrcc12x = 0 END IF 
   IF cl_null(l_unconf4.xrcc13x) THEN LET l_unconf4.xrcc13x = 0 END IF 
   
   #160705-00035#1-s
   #已存在未立帳的對帳單裡的待底單的未沖金額
   INITIALIZE l_unconf5.* TO NULL
   LET l_sql = " SELECT SUM(COALESCE(apba103,0)),SUM(COALESCE(apba113,0))",
               "   FROM apba_t",
               "   LEFT JOIN apbb_t ON apbaent=apbbent AND apbadocno=apbbdocno ",
               "  WHERE apbbent = ",g_enterprise,
               "    AND apba005 = '",p_docno,"' ",
               "    AND (apbbstus NOT IN ('X','Y') ",
               "        OR (apbbstus = 'Y' AND apbbdocno NOT IN (SELECT apca018",
               "                                                   FROM apca_t WHERE apcaent=",g_enterprise,
               "                                                    AND apcastus <> 'X')",
               "            ))",
               "    AND apba004 IN ('27')",
               "    AND apba006 = ",p_seq,
               "    AND apba020 = ",p_period,
                  " AND (( apbbdocno <> '",p_apcedocno,"') ",
                  "      OR (apbbdocno = '",p_apcedocno,"' AND apbaseq <> ",p_apceseq,")) "
   PREPARE s_aapt420_sum_apba2 FROM l_sql
   EXECUTE s_aapt420_sum_apba2 INTO l_unconf5.*
   IF cl_null(l_unconf5.apba103) THEN LET l_unconf5.apba103 = 0 END IF
   IF cl_null(l_unconf5.apba113) THEN LET l_unconf5.apba113 = 0 END IF
   LET l_unconf5.apba1032 = l_unconf5.apba103 * r_apce.apce121
   LET l_unconf5.apba1033 = l_unconf5.apba103 * r_apce.apce131
   CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa016,l_unconf5.apba1032,2) RETURNING g_sub_success,g_errno,l_unconf5.apba1032
   CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa020,l_unconf5.apba1033,2) RETURNING g_sub_success,g_errno,l_unconf5.apba1033
   #160705-00035#1-e
   
   #160705-00035#1 mark ------
   #LET r_apce.apce109 =r_apce.apce109 - l_unconf.apcc10x - l_unconf2.apcc10x - l_pay.apcc10x - l_unconf3.xrcc10x - l_unconf4.xrcc10x
   #LET r_apce.apce119 =r_apce.apce119 - l_unconf.apcc11x - l_unconf2.apcc11x - l_pay.apcc11x - l_unconf3.xrcc11x - l_unconf4.xrcc11x
   #LET r_apce.apce129 =r_apce.apce129 - l_unconf.apcc12x - l_unconf2.apcc12x - l_pay.apcc12x - l_unconf3.xrcc12x - l_unconf4.xrcc12x
   #LET r_apce.apce139 =r_apce.apce139 - l_unconf.apcc13x - l_unconf2.apcc13x - l_pay.apcc13x - l_unconf3.xrcc13x - l_unconf4.xrcc13x
   #160705-00035#1 mark end---
   #160705-00035#1-s
   LET r_apce.apce109 =r_apce.apce109 - l_unconf.apcc10x - l_unconf2.apcc10x - l_pay.apcc10x - l_unconf3.xrcc10x - l_unconf4.xrcc10x - l_unconf5.apba103
   LET r_apce.apce119 =r_apce.apce119 - l_unconf.apcc11x - l_unconf2.apcc11x - l_pay.apcc11x - l_unconf3.xrcc11x - l_unconf4.xrcc11x - l_unconf5.apba113
   LET r_apce.apce129 =r_apce.apce129 - l_unconf.apcc12x - l_unconf2.apcc12x - l_pay.apcc12x - l_unconf3.xrcc12x - l_unconf4.xrcc12x - l_unconf5.apba1032
   LET r_apce.apce139 =r_apce.apce139 - l_unconf.apcc13x - l_unconf2.apcc13x - l_pay.apcc13x - l_unconf3.xrcc13x - l_unconf4.xrcc13x - l_unconf5.apba1033
   #160705-00035#1-e
   
   #160704-00022#1--s
   #應付計算剩餘可沖金額,應扣除留置金額
   IF p_apce002 = '40' THEN
      #取得該張立帳單號扣除留置金額後可沖金額(原幣)
      CALL s_aapt420_get_lien_money(p_apcald,p_docno,p_apcedocno,p_apceseq,'')
       RETURNING l_lien_amt,l_lien_amt2
      IF r_apce.apce109 > l_lien_amt2 THEN
         CALL s_ld_sel_glaa(p_apcald,'glaa001|glaa015|glaa016|glaa019|glaa020')
          RETURNING g_sub_success,l_glaa.*
         LET r_apce.apce109 = l_lien_amt2         
         #本幣金額
         LET r_apce.apce119 = r_apce.apce109 * r_apce.apce101
         IF cl_null(r_apce.apce119) THEN LET r_apce.apce119 = 0 END IF
         CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa001,r_apce.apce119,2) RETURNING g_sub_success,g_errno,r_apce.apce119
         #本位幣二金額
         IF l_glaa.glaa015 = 'Y' THEN
            LET r_apce.apce129 = r_apce.apce109 * r_apce.apce121
            IF cl_null(r_apce.apce129) THEN LET r_apce.apce129 = 0 END IF
            CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa016,r_apce.apce129,2) RETURNING g_sub_success,g_errno,r_apce.apce129
         END IF
         #本位幣三金額
         IF l_glaa.glaa019 = 'Y' THEN
            LET r_apce.apce139 = r_apce.apce109 * r_apce.apce131
            IF cl_null(r_apce.apce139) THEN LET r_apce.apce139 = 0 END IF
            CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa020,r_apce.apce139,2) RETURNING g_sub_success,g_errno,r_apce.apce139
         END IF      
      END IF
   END IF
   #160704-00022#1--e   
	
	#150825-00004#1 add ------
	#如果付款對像是EMPL員工單據的話，業務人員(apce017)要改抓受款對象(apca057)
	SELECT apda005 INTO l_apda005
     FROM apda_t
    WHERE apdaent = g_enterprise 
      AND apdald = p_apceld
      AND apdadocno = p_apcedocno
   IF l_apda005 = 'EMPL' THEN
      SELECT apca057 INTO r_apce.apce017
        FROM apca_t
       WHERE apcaent = g_enterprise 
         AND apcald = p_apcald
         AND apcadocno = p_docno
   END IF
	#150825-00004#1 add end---
	
	RETURN r_apce.*
END FUNCTION

################################################################################
# Descriptions...: 更新(+)/還原(-)沖帳金額
# Memo...........:
# Usage..........: s_aapt420_upd_contra_amount(p_apdald,p_apdadocno,p_type)
#
# Input parameter: p_apdald       帳別
#                : p_apdadocno    請款單號
#                : p_type         異動別+/-
# Return code....: r_success      資料新增成功否 
# Date & Author..: 14/10/11 By apo
# Modify.........: 150225 By albireo 1.修改抓取範圍不含17類
#                                    2.修改錯誤訊息顯示方式
################################################################################
PUBLIC FUNCTION s_aapt420_upd_contra_amount(p_apdald,p_apdadocno,p_type)
DEFINE p_apdald         LIKE apda_t.apdald
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE p_type           LIKE type_t.chr1
DEFINE r_success        LIKE type_t.num5
DEFINE l_sql            STRING
DEFINE l_apceorga_comp  LIKE glaa_t.glaacomp
DEFINE l_apceorga_ld    LIKE glaa_t.glaald 
DEFINE l_apce           RECORD
          apceseq          LIKE apce_t.apceseq,
          apceorga         LIKE apce_t.apceorga,
          apce002          LIKE apce_t.apce002,
          apce003          LIKE apce_t.apce003,
          apce004          LIKE apce_t.apce004,
          apce005          LIKE apce_t.apce005,
          apce048          LIKE apce_t.apce048,
          apce109          LIKE apce_t.apce109,
          apce119          LIKE apce_t.apce119,
          apce129          LIKE apce_t.apce129,
          apce139          LIKE apce_t.apce139,
          #151207-00018#6--add--str--lujh
          apce049          LIKE apce_t.apce049,
          apce050          LIKE apce_t.apce050
          #151207-00018#6--add--end--lujh
                        END RECORD 
#150518-00040#4--(S)
DEFINE l_cnt            LIKE type_t.num5
DEFINE ls_js            STRING
DEFINE lc_param         RECORD
         xmab003        LIKE xmab_t.xmab003,          #單據編號
         xmab006        LIKE xmab_t.xmab006,          #交易客戶
         xmab007        LIKE xmab_t.xmab007,          #交易幣別
         proj           LIKE xmaa_t.xmaa002,          #目前計算項目
         proj_o         LIKE xmaa_t.xmaa002,          #前置計算項目
         type           LIKE type_t.num5,             #正負向
         glaald         LIKE glaa_t.glaald,           #帳套
         glaacomp       LIKE glaa_t.glaacomp          #法人
                    END RECORD
#150518-00040#4--(E)

   LET r_success = TRUE
   LET l_sql = " SELECT apceseq,apceorga,apce002,apce003,apce004,apce005,apce048,apce109,apce119,apce129,apce139, ",
               "        apce049,apce050 ",   #151207-00018#6 add lujh
               "   FROM apce_t ",
               "  WHERE apceent = '",g_enterprise,"' ",
               "    AND apcedocno = '",p_apdadocno,"' ",
               "    AND apceld = '",p_apdald,"' ",
               "    AND apce002 <> '17' ",   #albireo 150225
               "  ORDER BY apceseq,apce003,apce004,apce005 "

   PREPARE s_aapt420_sel_apce_p FROM l_sql
   DECLARE s_aapt420_sel_apce_c CURSOR FOR s_aapt420_sel_apce_p  
   
   LET l_sql = " UPDATE apcc_t SET apcc109 = apcc109 ",p_type," ? ",
               "                  ,apcc119 = apcc119 ",p_type," ? ",
               "                  ,apcc129 = apcc129 ",p_type," ? ",
               "                  ,apcc139 = apcc139 ",p_type," ? ",
               "  WHERE apccent = ? ",
               "    AND apccdocno = ? ",
               "    AND apccseq = ? ",
               "    AND apccld = ? ",                    
               "    AND apcc001 = ? "
              #"    AND apcc009 = ? "    #151019 mark

   PREPARE s_aapt420_upd_apcc_p FROM l_sql 
   
   #151207-00018#6--add--str--lujh
   LET l_sql = " UPDATE apeb_t SET apeb109 = COALESCE(apeb109,0) ",p_type," ? ",
               "                  ,apeb119 = COALESCE(apeb119,0) ",p_type," ? ",
               "  WHERE apebent = ",g_enterprise,
               "    AND apebdocno = ? ",
               "    AND apebseq = ? "

   PREPARE s_aapt420_upd_apeb_p FROM l_sql 
   #151207-00018#6--add--end--lujh
   
   #150518-00040#4--(S)--信用額度處理(只處理主帳套)
   LET l_cnt = 0
   #SELECT count(*) INTO l_cnt     #161114-00009#1 mark
   SELECT count(glaald) INTO l_cnt #161114-00009#1 add
     FROM glaa_t
    WHERE glaaent = g_enterprise
      AND glaald  = p_apdald                    #171012-00047#1 add    
      #AND glaald  = p_apdald AND glaa014 = 'Y' #171012-00047#1 mark
   IF l_cnt > 0 THEN
      LET lc_param.xmab003  = p_apdadocno
      LET lc_param.glaald = p_apdald
      CASE p_type 
           WHEN '+'  LET lc_param.type   = '1'    #1:正向 2:負向
           WHEN '-'  LET lc_param.type   = '2'    #1:正向 2:負向
      END CASE
      LET lc_param.proj   = '##'    #應付帳款
      LET lc_param.proj_o = 'P5'    #前置項目(30:S5/31:S6/32:S6/40:P5/41:P6/42:P6)
      SELECT apda005 INTO lc_param.xmab006
        FROM apda_t
       WHERE apdaent = g_enterprise 
         AND apdald = p_apdald AND apdadocno = p_apdadocno
      IF cl_null(lc_param.xmab006) THEN
         SELECT apca005 INTO lc_param.xmab006
           FROM apca_t
          WHERE apcaent = g_enterprise 
            AND apcald = p_apdald AND apcadocno = p_apdadocno
      END IF
      LET ls_js = util.JSON.stringify(lc_param)
      CALL s_credit_move(ls_js)  RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET r_success = FALSE 
      END IF
   END IF
   #150518-00040#4--(E)
   FOREACH s_aapt420_sel_apce_c INTO l_apce.*
      IF l_apce.apce002[1,1] <> '4' AND  l_apce.apce002[1,1] <> '3' THEN
         CONTINUE FOREACH
      END IF
      LET l_apceorga_ld = ''
      CALL s_fin_orga_get_comp_ld(l_apce.apceorga) RETURNING g_sub_success,g_errno,l_apceorga_comp,l_apceorga_ld
      CASE l_apce.apce002[1,1]
         WHEN '4'    #應付
            IF cl_null(l_apce.apce048)THEN LET l_apce.apce048 = ' ' END IF  #空的給予一個空白
            EXECUTE s_aapt420_upd_apcc_p USING l_apce.apce109,l_apce.apce119,l_apce.apce129,l_apce.apce139,g_enterprise,l_apce.apce003,l_apce.apce004,
                                               l_apceorga_ld,l_apce.apce005                  #151029
                                              #l_apceorga_ld,l_apce.apce005,l_apce.apce048   #151029 mark
            #151207-00018#6--add--str--lujh
            IF NOT cl_null(l_apce.apce049) THEN 
               EXECUTE s_aapt420_upd_apeb_p USING l_apce.apce109,l_apce.apce119,l_apce.apce049,l_apce.apce050
            END IF
            #151207-00018#6--add--end--lujh
            
         WHEN '3'    #應收
            LET l_sql = " UPDATE xrcc_t SET xrcc109 = xrcc109 ",p_type," ? ",
                        "                  ,xrcc119 = xrcc119 ",p_type," ? ",
                        "                  ,xrcc129 = xrcc129 ",p_type," ? ",
                        "                  ,xrcc139 = xrcc139 ",p_type," ? ",
                        "  WHERE xrccent = ? ",
                        "    AND xrccdocno = ? ",
                        "    AND xrccseq = ? ",
                        "    AND xrccld = ? ",                    
                        "    AND xrcc001 = ? "
           #151029 mark--s
           ##此處由於xrcc009為空時,不會預設給一個空白,因此sql特別處理                        
           #IF NOT cl_null(l_apce.apce048) THEN
           #   LET l_sql = l_sql," AND xrcc009 = '",l_apce.apce048,"' "
           #ELSE
           #   LET l_sql = l_sql," AND (xrcc009 IS NULL OR xrcc009 = ' ') "
           #END IF   
           #151029 mark--e
            PREPARE s_aapt420_upd_xrcc_p FROM l_sql
            EXECUTE s_aapt420_upd_xrcc_p USING l_apce.apce109,l_apce.apce119,l_apce.apce129,l_apce.apce139,g_enterprise,l_apce.apce003,l_apce.apce004,
                                               l_apceorga_ld,l_apce.apce005                      
      END CASE
      
      #albireo 150225 modify-----s
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         CASE l_apce.apce002[1,1]
            WHEN '4'
               LET g_errparam.extend = p_apdadocno CLIPPED,"/upd apcc_t"
            WHEN '3'
               LET g_errparam.extend = p_apdadocno CLIPPED,"/upd xrcc_t"
         END CASE
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      ELSE
         IF SQLCA.SQLERRD[3]=0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'aap-00338'
            CASE l_apce.apce002[1,1]
               WHEN '4'
                  LET g_errparam.extend = p_apdadocno CLIPPED,"/upd apcc_t"
               WHEN '3'
                  LET g_errparam.extend = p_apdadocno CLIPPED,"/upd xrcc_t"
            END CASE
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success = FALSE
         END IF
      END IF      
      #albireo 150225 modify-----e
   
   END FOREACH   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 沖帳差異處理整合
# Memo...........:
# Usage..........: CALL s_aapt420_balance_chk(p_ld,p_docno,p_prog)
#                  RETURNING r_balance_apee119
# Input parameter: p_ld           帳別
#                : p_docno        單據編號
#                : p_prog         區分沖帳類型 aapt300_02:aapt410
# Return code....: r_success  
#                : r_errno
#                : r_balance_apee119      本幣差異金額
# Date & Author..: 140918 albireo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_balance_chk(p_ld,p_docno,p_prog)
   DEFINE p_ld      LIKE glaa_t.glaald
   DEFINE p_docno   LIKE apda_t.apdadocno
   DEFINE p_prog    LIKE type_t.chr20
   DEFINE r_success LIKE type_t.num5
   DEFINE r_errno   LIKE gzze_t.gzze001
   DEFINE r_balance_apde119 LIKE apde_t.apde119
   DEFINE l_sql         STRING
   DEFINE l_str         STRING
   DEFINE l_where       STRING
   DEFINE l_pay         RECORD         #付款單身(第二)
                        apde015        LIKE apde_t.apde015,
                        apde119        LIKE apde_t.apde119
                        END RECORD
 
   DEFINE l_bill        RECORD         #帳款單身(第一)
                        apce015        LIKE apce_t.apce015,
                        apce119        LIKE apce_t.apce119
                        END RECORD
   DEFINE l_other       RECORD         #其他東西(第二)
                        apde015        LIKE apde_t.apde015,
                        apde119        LIKE apde_t.apde119
                        END RECORD

   DEFINE l_sum_b       RECORD         #帳款單身總計
                        apce119        LIKE apce_t.apce119
                        END RECORD
   DEFINE l_sum_p       RECORD         #付款單身總計
                        apde119        LIKE apde_t.apde119
                        END RECORD
   DEFINE l_type        LIKE oocq_t.oocq002

   WHENEVER ERROR CONTINUE
   LET l_sum_b.apce119 = 0
   LET l_sum_p.apde119 = 0

   #帳款單身合計金額(負)
   LET l_sql = " SELECT apce015,SUM(COALESCE(apce119,0)) ",
               "   FROM apce_t ",
               "  WHERE apceent = '",g_enterprise,"' ",
               "    AND apcedocno = '",p_docno,"' ",

               "  GROUP BY apce015 "
   PREPARE sel_sum_apce_billp FROM l_sql
   DECLARE sel_sum_apce_billc CURSOR FOR sel_sum_apce_billp
   FOREACH sel_sum_apce_billc INTO l_bill.*
      IF SQLCA.SQLCODE THEN EXIT FOREACH END IF
      IF cl_null(l_bill.apce119)THEN LET l_bill.apce119 = 0 END IF

      CASE

         WHEN l_bill.apce015 = 'D'
            LET l_sum_b.apce119 = l_sum_b.apce119 - l_bill.apce119

         WHEN l_bill.apce015 = 'C'
            LET l_sum_b.apce119 = l_sum_b.apce119 + l_bill.apce119

      END CASE      
      
   END FOREACH
   #帳款金額合計後轉向作計算
   LET l_sum_b.apce119 = l_sum_b.apce119 * -1


   #付款單身合計(正)
   LET l_sql = " SELECT apde015,SUM(COALESCE(apde119,0)) ",
               "   FROM apde_t ",
               "  WHERE apdeent = '",g_enterprise,"' ",
               "    AND apdedocno = '",p_docno,"' ",
               " GROUP BY apde015 "
   PREPARE sel_sum_apde_otherp FROM l_sql
   DECLARE sel_sum_apde_otherc CURSOR FOR sel_sum_apde_otherp
   INITIALIZE l_pay.* TO NULL
   FOREACH sel_sum_apde_otherc INTO l_pay.*
      IF SQLCA.SQLCODE THEN EXIT FOREACH END IF 
      IF cl_null(l_pay.apde119)THEN LET l_pay.apde119 = 0 END IF

      CASE
         WHEN l_pay.apde015 = 'D'
            LET l_sum_p.apde119 = l_sum_p.apde119 - l_pay.apde119

         WHEN l_pay.apde015 = 'C'
            LET l_sum_p.apde119 = l_sum_p.apde119 + l_pay.apde119

      END CASE
   END FOREACH
   
   #求帳款總金額與實際付款總金額差異
   LET r_balance_apde119 = l_sum_p.apde119 - l_sum_b.apce119

   RETURN r_success,r_errno,r_balance_apde119
END FUNCTION
################################################################################
# Descriptions...: 計算可被沖銷金額
# Memo...........: #已沖銷金額排除p_apcedocno,p_apceseq
# Usage..........: s_aapt420_apcc_used_num(p_apce0002,p_apceld,p_apcald,p_apcadocno,p_apcc001,p_apcedocno,p_apceseq)
#                  RETURNING r_success,r_errno,r_apcc10x,r_apcc11x,r_apcc12x,r_apcc13x
# Input parameter: p_apce002      帳款類型
#                : p_apceld       帳別
#                : p_apcald       來源帳別
#                : p_apcadocno    單據號碼
#                : p_apcc001      期別
#                : p_apcedocno    單據號碼
#                : p_apceseq      項次
# Return code....: r_success      正確否
#                : r_errno        錯誤訊息代碼
#                : r_apcc10x      原幣可沖銷金額
#                : r_apcc11x
#                : r_apcc12x
#                : r_apcc13x  
# Date & Author..: 14/10/13 By apo
# Modify.........:
#160704-00022#1   160718 By 03538   應付帳款可沖金額應扣除留置金額
#160816-00022#1   160823 By 03538   為aapt430增加以帳款單號+項次來看剩餘可沖金額的類型
################################################################################
PUBLIC FUNCTION s_aapt420_apcc_used_num(p_apce002,p_apceld,p_apcald,p_apcadocno,p_apcbseq,p_apcc001,p_apcedocno,p_apceseq,p_type)
   DEFINE p_apce002   LIKE apce_t.apce002   
   DEFINE p_apceld    LIKE glaa_t.glaald     #核銷單帳別
   DEFINE p_apcald    LIKE glaa_t.glaald     #來源帳款帳別
   DEFINE p_apcadocno LIKE apca_t.apcadocno
   DEFINE p_apcbseq   LIKE apcb_t.apcbseq
   DEFINE p_apcc001   LIKE apcc_t.apcc001
   DEFINE p_apcedocno LIKE apce_t.apcedocno
   DEFINE p_apceseq   LIKE apce_t.apceseq
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_errno     LIKE gzze_t.gzze001
   DEFINE r_apcc10x   LIKE type_t.num20_6
   DEFINE r_apcc11x   LIKE type_t.num20_6
   DEFINE r_apcc12x   LIKE type_t.num20_6
   DEFINE r_apcc13x   LIKE type_t.num20_6
   DEFINE p_type      LIKE type_t.chr1     #1單筆/2匯總/3匯總(細到項次)   #160816-00022#1 add 3
   DEFINE l_sql       STRING
   DEFINE l_conf      RECORD
                      apcc10x    LIKE type_t.num20_6,
                      apcc11x    LIKE type_t.num20_6,
                      apcc12x    LIKE type_t.num20_6,
                      apcc13x    LIKE type_t.num20_6
                      END RECORD
   DEFINE l_unconf    RECORD
                      apcc10x    LIKE type_t.num20_6,
                      apcc11x    LIKE type_t.num20_6,
                      apcc12x    LIKE type_t.num20_6,
                      apcc13x    LIKE type_t.num20_6
                      END RECORD
   DEFINE l_unconf2   RECORD
                      apcc10x    LIKE type_t.num20_6,
                      apcc11x    LIKE type_t.num20_6,
                      apcc12x    LIKE type_t.num20_6,
                      apcc13x    LIKE type_t.num20_6
                      END RECORD
   DEFINE l_unconf3   RECORD
                      xrcc10x    LIKE type_t.num20_6,
                      xrcc11x    LIKE type_t.num20_6,
                      xrcc12x    LIKE type_t.num20_6,
                      xrcc13x    LIKE type_t.num20_6
                      END RECORD
   DEFINE l_unconf4   RECORD
                      xrcc10x    LIKE type_t.num20_6,
                      xrcc11x    LIKE type_t.num20_6,
                      xrcc12x    LIKE type_t.num20_6,
                      xrcc13x    LIKE type_t.num20_6
                      END RECORD
   #160705-00035#1-s
   DEFINE l_unconf5   RECORD
                      apba103    LIKE type_t.num20_6,
                      apba113    LIKE type_t.num20_6,
                      apba1032   LIKE type_t.num20_6,
                      apba1033   LIKE type_t.num20_6
                      END RECORD
   #160705-00035#1-e
   DEFINE l_pay       RECORD
                      apcc10x    LIKE type_t.num20_6,
                      apcc11x    LIKE type_t.num20_6,
                      apcc12x    LIKE type_t.num20_6,
                      apcc13x    LIKE type_t.num20_6
                      END RECORD
   DEFINE l_amt1      LIKE type_t.num20_6         #151207-00018#6 add lujh
   #160704-00022#1--s
   DEFINE l_lien_amt  LIKE apcc_t.apcc108
   DEFINE l_lien_amt2 LIKE apcc_t.apcc108
   DEFINE l_apcc102   LIKE apcc_t.apcc102
   DEFINE l_apcc121   LIKE apcc_t.apcc121
   DEFINE l_apcc131   LIKE apcc_t.apcc131
   DEFINE l_glaa      RECORD
            glaa001   LIKE glaa_t.glaa001,
            glaa015   LIKE glaa_t.glaa015,
            glaa016   LIKE glaa_t.glaa016,
            glaa019   LIKE glaa_t.glaa019,
            glaa020   LIKE glaa_t.glaa020
                  END RECORD
   #160704-00022#1--e


   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_errno   = ''
   
   LET r_apcc10x = 0  LET r_apcc11x = 0  LET r_apcc12x = 0  LET r_apcc13x = 0
   
   #抓確認後的剩餘金額
   INITIALIZE l_conf.* TO NULL      
   CASE p_apce002[1,1] 
      WHEN '4'      #應付
         #LET l_sql = " SELECT SUM(COALESCE(apcc108,0)),SUM(COALESCE(apcc118+apcc113,0)), ",                       #150317apo mark
         #            "        SUM(COALESCE(apcc128+apcc123,0)),SUM(COALESCE(apcc138+apcc133,0)) ",                #150317apo mark
         LET l_sql = " SELECT SUM(COALESCE(apcc108-apcc109,0)),SUM(COALESCE(apcc118+apcc113-apcc119,0)), ",        #150317apo
                     "        SUM(COALESCE(apcc128+apcc123-apcc129,0)),SUM(COALESCE(apcc138+apcc133-apcc139,0)) ", #150317apo
                     "   FROM apcc_t ",
                     "  WHERE apccent = '",g_enterprise,"' ",
                     "    AND apccld  = '",p_apcald,"' ",
                     "    AND apccdocno = '",p_apcadocno,"' "
         IF p_type = '1' THEN
            LET l_sql = l_sql,
                     "    AND apccseq   = '",p_apcbseq,"' ",
                     "    AND apcc001   = '",p_apcc001,"' "
         END IF
         #160816-00022#1--s
         IF p_type = '3' THEN   #匯總(細到項次)
            LET l_sql = l_sql,
                     "    AND apccseq   = '",p_apcbseq,"' "
         END IF         
         #160816-00022#1--e
      WHEN '3'     #應收 
         #LET l_sql = " SELECT SUM(COALESCE(xrcc108,0)),SUM(COALESCE(xrcc118+xrcc113,0)), ",                       #150317apo mark
         #            "        SUM(COALESCE(xrcc128+xrcc123,0)),SUM(COALESCE(xrcc138+xrcc133,0)) ",                #150317apo mark
         LET l_sql = " SELECT SUM(COALESCE(xrcc108-xrcc109,0)),SUM(COALESCE(xrcc118+xrcc113-xrcc119,0)), ",        #150317apo 
                     "        SUM(COALESCE(xrcc128+xrcc123-xrcc129,0)),SUM(COALESCE(xrcc138+xrcc133-xrcc139,0)) ", #150317apo          
                     "   FROM xrcc_t ",
                     "  WHERE xrccent = '",g_enterprise,"' ",
                     "    AND xrccld  = '",p_apcald,"' ",
                     "    AND xrccdocno = '",p_apcadocno,"' "
         IF p_type = '1' THEN
            LET l_sql = l_sql,
                     "    AND xrccseq   = '",p_apcbseq,"' ",
                     "    AND xrcc001   = '",p_apcc001,"' "   
         END IF         
         #160816-00022#1--s
         IF p_type = '3' THEN   #匯總(細到項次)
            LET l_sql = l_sql,
                     "    AND xrccseq   = '",p_apcbseq,"' "
         END IF         
         #160816-00022#1--e         
   END CASE
   PREPARE s_aapt420_sel_info_p2 FROM l_sql
   DECLARE s_aapt420_sel_info_c2 SCROLL CURSOR FOR s_aapt420_sel_info_p2
   OPEN s_aapt420_sel_info_c2
   FETCH s_aapt420_sel_info_c2 INTO l_conf.*
   FREE s_aapt420_sel_info_c2    
   IF cl_null(l_conf.apcc10x) THEN LET l_conf.apcc10x = 0 END IF
   IF cl_null(l_conf.apcc11x) THEN LET l_conf.apcc11x = 0 END IF
   IF cl_null(l_conf.apcc12x) THEN LET l_conf.apcc12x = 0 END IF
   IF cl_null(l_conf.apcc13x) THEN LET l_conf.apcc13x = 0 END IF

   
   INITIALIZE l_unconf.* TO NULL
   #已存在應付核銷單金額
   LET l_sql = " SELECT SUM(COALESCE(apce109,0)),SUM(COALESCE(apce119,0)), ",
               "        SUM(COALESCE(apce129,0)),SUM(COALESCE(apce139,0)) ",
               "   FROM apce_t,apda_t ",
               "  WHERE apceent = ",g_enterprise," ",
               "    AND apceld  = '",p_apceld,"' ",
               "    AND apce003 = '",p_apcadocno,"' ",
               "    AND apdaent = apceent ",
               "    AND apdald  = apceld ",
               "    AND apdadocno = apcedocno ",
               #150331 carol:來源為aapt430之沖銷紀錄(apda_t+apce_t),帳款單性質1*的要排除, 2*不排除(原因為aapt430只會回寫性質為2*之apcc)
               "    AND NOT ( apce001='aapt430' AND EXISTS(SELECT 1 FROM apca_t ",
               "                                            WHERE apcaent = apceent ",
               "                                              AND apcadocno = apce003 ",
               "                                              AND apcald = apceld ",
               "                                              AND apca001 LIKE '1%')) ",
               #-150331apo--(e)                             
               "    AND apdastus NOT IN ('X','Y') "    #排除自身且未作廢  #150317apo add 'Y'
   IF p_type = '1' THEN
      LET l_sql = l_sql,   
               "    AND apce004 = ",p_apcbseq," ",
               "    AND apce005 = ",p_apcc001," "      
   END IF      
   #160816-00022#1--s
   IF p_type = '3' THEN   #匯總(細到項次)
      LET l_sql = l_sql,   
               "    AND apce004 = ",p_apcbseq," "
   END IF         
   #160816-00022#1--e   
   IF NOT cl_null(p_apcedocno) AND NOT cl_null(p_apceseq) THEN
      LET l_sql = l_sql CLIPPED,
                  " AND (( apcedocno <> '",p_apcedocno,"') ",
                  "      OR (apcedocno = '",p_apcedocno,"' AND apceseq <> ",p_apceseq,")) "
   END IF
   PREPARE s_aapt420_sum_apcep1 FROM l_sql
   EXECUTE s_aapt420_sum_apcep1 INTO l_unconf.*
   IF cl_null(l_unconf.apcc10x) THEN LET l_unconf.apcc10x = 0 END IF
   IF cl_null(l_unconf.apcc11x) THEN LET l_unconf.apcc11x = 0 END IF
   IF cl_null(l_unconf.apcc12x) THEN LET l_unconf.apcc12x = 0 END IF
   IF cl_null(l_unconf.apcc13x) THEN LET l_unconf.apcc13x = 0 END IF

   INITIALIZE l_unconf2.* TO NULL
   #已存在應付直接沖帳金額
   LET l_sql = " SELECT SUM(COALESCE(apce109,0)),SUM(COALESCE(apce119,0)), ",
               "        SUM(COALESCE(apce129,0)),SUM(COALESCE(apce139,0)) ",
               "   FROM apce_t,apca_t ",
               "  WHERE apceent = ",g_enterprise," ",
               "    AND apceld  = '",p_apceld,"' ",
               "    AND apce003 = '",p_apcadocno,"' ",
               "    AND apcaent = apceent ",
               "    AND apcald  = apceld ",
               "    AND apcadocno = apcedocno ",
               #150331 carol:來源為aapt430之沖銷紀錄(apda_t+apce_t),帳款單性質1*的要排除, 2*不排除(原因為aapt430只會回寫性質為2*之apcc)
               "    AND NOT ( apce001='aapt430' AND EXISTS(SELECT 1 FROM apca_t ",
               "                                            WHERE apcaent = apceent ",
               "                                              AND apcadocno = apce003 ",
               "                                              AND apcald = apceld ",
               "                                              AND apca001 LIKE '1%')) ",
               #-150331apo--(e)                             
               "    AND apcastus NOT IN ('X','Y') "    #排除自身且未作廢  #150317apo add 'Y'
   IF p_type = '1' THEN
      LET l_sql = l_sql,   
               "    AND apce004 = ",p_apcbseq," ",
               "    AND apce005 = ",p_apcc001," "      
   END IF                    
   #160816-00022#1--s
   IF p_type = '3' THEN   #匯總(細到項次)
      LET l_sql = l_sql,   
               "    AND apce004 = ",p_apcbseq," "
   END IF         
   #160816-00022#1--e    
   IF NOT cl_null(p_apcedocno) AND NOT cl_null(p_apceseq) THEN
      LET l_sql = l_sql CLIPPED,
                  " AND (( apcedocno <> '",p_apcedocno,"') ",
                  "      OR (apcedocno = '",p_apcedocno,"' AND apceseq <> ",p_apceseq,")) "
   END IF
   PREPARE s_aapt420_sum_apcep2 FROM l_sql
   EXECUTE s_aapt420_sum_apcep2 INTO l_unconf2.*
   IF cl_null(l_unconf2.apcc10x) THEN LET l_unconf2.apcc10x = 0 END IF
   IF cl_null(l_unconf2.apcc11x) THEN LET l_unconf2.apcc11x = 0 END IF
   IF cl_null(l_unconf2.apcc12x) THEN LET l_unconf2.apcc12x = 0 END IF
   IF cl_null(l_unconf2.apcc13x) THEN LET l_unconf2.apcc13x = 0 END IF

#   INITIALIZE l_pay.* TO NULL
#   #已存在付款申請單金額
#   LET l_sql = " SELECT SUM(COALESCE(apeb109,0)),SUM(COALESCE(apeb119,0)) ",
#               "   FROM apeb_t,apea_t ",
#               "  WHERE apebent = ",g_enterprise," ",
#               "    AND apebld  = '",p_apceld,"' ",
#               "    AND apeb003 = '",p_apcadocno,"' ",
#               "    AND apeaent = apebent ",
#               "    AND apeald  = apebld ",
#               "    AND apeadocno = apebdocno ",
#               "    AND apeastus NOT IN ('X') ",
#               "    AND NOT EXISTS ",        #扣除已產生到核銷單金額,避免重複計算
#               "          ( SELECT 1 FROM apce_t ",
#               "             WHERE apceent=apebent AND apceld = apebld ",
#               "               AND apce049=apebdocno AND apce050 = apebseq) "
#   IF p_type = '1' THEN
#      LET l_sql = l_sql,   
#               "    AND apeb004 = ",p_apcbseq," ",
#               "    AND apeb005 = ",p_apcc001," "      
#   END IF                    
#   PREPARE s_aapt420_sum_apebp5 FROM l_sql
#   EXECUTE s_aapt420_sum_apebp5 INTO l_pay.*
   IF cl_null(l_pay.apcc10x) THEN LET l_pay.apcc10x = 0 END IF
   IF cl_null(l_pay.apcc11x) THEN LET l_pay.apcc11x = 0 END IF
   IF cl_null(l_pay.apcc12x) THEN LET l_pay.apcc12x = 0 END IF
   IF cl_null(l_pay.apcc13x) THEN LET l_pay.apcc13x = 0 END IF
   
   INITIALIZE l_unconf3.* TO NULL
   #已存在應收核銷單金額
   LET l_sql = " SELECT SUM(COALESCE(xrce109,0)),SUM(COALESCE(xrce119,0)), ",
               "        SUM(COALESCE(xrce129,0)),SUM(COALESCE(xrce139,0)) ",
               "   FROM xrce_t,xrda_t ",
               "  WHERE xrceent = ",g_enterprise," ",
               "    AND xrceld  = '",p_apceld,"' ",
               "    AND xrce003 = '",p_apcadocno,"' ",
               "    AND xrdaent = xrceent ",
               "    AND xrdald  = xrceld ",
               "    AND xrdadocno = xrcedocno ",
               "    AND xrdastus NOT IN ('X','Y') "    #未作廢   #150317apo add 'Y'
   IF p_type = '1' THEN
      LET l_sql = l_sql,
               "    AND xrce004 = ",p_apcbseq," ",
               "    AND xrce005 = ",p_apcc001," "
   END IF
   #160816-00022#1--s
   IF p_type = '3' THEN   #匯總(細到項次)
      LET l_sql = l_sql,
               "    AND xrce004 = ",p_apcbseq," "
   END IF         
   #160816-00022#1--e      
   PREPARE s_aapt420_sum_xrcep1 FROM l_sql
   EXECUTE s_aapt420_sum_xrcep1 INTO l_unconf3.*
   IF cl_null(l_unconf3.xrcc10x) THEN LET l_unconf3.xrcc10x = 0 END IF
   IF cl_null(l_unconf3.xrcc11x) THEN LET l_unconf3.xrcc11x = 0 END IF   
   IF cl_null(l_unconf3.xrcc12x) THEN LET l_unconf3.xrcc12x = 0 END IF   
   IF cl_null(l_unconf3.xrcc13x) THEN LET l_unconf3.xrcc13x = 0 END IF   
   
   INITIALIZE l_unconf4.* TO NULL
   #已存在應收直接沖帳金額
   LET l_sql = " SELECT SUM(COALESCE(xrce109,0)),SUM(COALESCE(xrce119,0)), ",
               "        SUM(COALESCE(xrce129,0)),SUM(COALESCE(xrce139,0)) ",
               "   FROM xrce_t,xrca_t ",
               "  WHERE xrceent = ",g_enterprise," ",
               "    AND xrceld  = '",p_apceld,"' ",
               "    AND xrce003 = '",p_apcadocno,"' ",
               "    AND xrcaent = xrceent ",
               "    AND xrcald  = xrceld ",
               "    AND xrcadocno = xrcedocno ",
               "    AND xrcastus NOT IN ('X','Y') "    #未作廢   #150317apo add 'Y'
   IF p_type = '1' THEN
      LET l_sql = l_sql,
               "    AND xrce004 = ",p_apcbseq," ",
               "    AND xrce005 = ",p_apcc001," "
   END IF
   #160816-00022#1--s
   IF p_type = '3' THEN   #匯總(細到項次)
      LET l_sql = l_sql,
               "    AND xrce004 = ",p_apcbseq," "
   END IF         
   #160816-00022#1--e     
   PREPARE s_aapt420_sum_xrcep2 FROM l_sql
   EXECUTE s_aapt420_sum_xrcep2 INTO l_unconf4.*
   IF cl_null(l_unconf4.xrcc10x) THEN LET l_unconf4.xrcc10x = 0 END IF
   IF cl_null(l_unconf4.xrcc11x) THEN LET l_unconf4.xrcc11x = 0 END IF
   IF cl_null(l_unconf4.xrcc12x) THEN LET l_unconf4.xrcc12x = 0 END IF
   IF cl_null(l_unconf4.xrcc13x) THEN LET l_unconf4.xrcc13x = 0 END IF
   
   #151207-00018#6--add--str--lujh
   #aapt415 同 apcc key 己請款未核銷額(apeb108-apeb109)
   #160816-00022#1--s
   CASE p_type
      WHEN '1'   #1:明細
   #160816-00022#1--e
         SELECT SUM(COALESCE(apeb108,0)-COALESCE(apeb109,0)) INTO l_amt1
           FROM apea_t,apeb_t
          WHERE apebent = g_enterprise
            AND apeaent = apebent
            AND apeadocno = apebdocno
            AND apeb003 = p_apcadocno
            AND apeb004 = p_apcbseq
            AND apeb005 = p_apcc001
            AND apeastus <> 'X'
   #160816-00022#1--s
      WHEN '2'   #2:匯總(至單號)
         SELECT SUM(COALESCE(apeb108,0)-COALESCE(apeb109,0)) INTO l_amt1
           FROM apea_t,apeb_t
          WHERE apebent = g_enterprise
            AND apeaent = apebent
            AND apeadocno = apebdocno
            AND apeb003 = p_apcadocno
            AND apeastus <> 'X'      
      WHEN '3'   #2:匯總(至項次)
         SELECT SUM(COALESCE(apeb108,0)-COALESCE(apeb109,0)) INTO l_amt1
           FROM apea_t,apeb_t
          WHERE apebent = g_enterprise
            AND apeaent = apebent
            AND apeadocno = apebdocno
            AND apeb003 = p_apcadocno
            AND apeb004 = p_apcbseq
            AND apeastus <> 'X'       
   END CASE            
   #160816-00022#1--e            
   IF cl_null(l_amt1) THEN LET l_amt1 = 0 END IF
   #151207-00018#6--add--end--lujh
   
   #160705-00035#1-s
   #取得多帳期匯率
   CASE                   #160816-00022#1
      WHEN p_type = '1'   #160816-00022#1
         SELECT apcc102,apcc121,apcc131 INTO l_apcc102,l_apcc121,l_apcc131
           FROM apcc_t
          WHERE apccent = g_enterprise
            AND apccld = p_apcald
            AND apccdocno = p_apcadocno
            AND apccseq = p_apcbseq
            AND apcc001 = p_apcc001
   #160816-00022#1--s
      WHEN p_type MATCHES '[23]'   #160816-00022#1
         SELECT apca101,apca121,apca131 INTO l_apcc102,l_apcc121,l_apcc131
           FROM apca_t
          WHERE apcaent = g_enterprise
            AND apcald = p_apcald
            AND apcadocno = p_apcadocno
   END CASE
   #160816-00022#1--e
   IF cl_null(l_apcc102) THEN LET l_apcc102 = 1 END IF
   IF cl_null(l_apcc121) THEN LET l_apcc121 = 1 END IF
   IF cl_null(l_apcc131) THEN LET l_apcc131 = 1 END IF
   
   #已存在未立帳的對帳單裡的待底單的未沖金額
   INITIALIZE l_unconf5.* TO NULL
   LET l_sql = " SELECT SUM(COALESCE(apba103,0)),SUM(COALESCE(apba113,0))",
               "   FROM apba_t",
               "   LEFT JOIN apbb_t ON apbaent=apbbent AND apbadocno=apbbdocno ",
               "  WHERE apbbent = ",g_enterprise," ",
               "    AND apba005 = '",p_apcadocno,"' ",
               "    AND (apbbstus NOT IN ('X','Y') ",
               "        OR (apbbstus = 'Y' AND apbbdocno NOT IN (SELECT apca018",
               "                                                   FROM apca_t WHERE apcaent=",g_enterprise,
               "                                                    AND apcastus <> 'X')",
               "            ))",
               "    AND apba004 IN ('27')"
   IF p_type = '1' THEN
      LET l_sql = l_sql,
               "    AND apba006 = ",p_apcbseq," ",
               "    AND apba020 = ",p_apcc001," "
   END IF
   #160816-00022#1--s
   IF p_type = '3' THEN   #匯總(細到項次)
      LET l_sql = l_sql,
               "    AND apba006 = ",p_apcbseq," "
   END IF         
   #160816-00022#1--e        
   #排除目前key對帳單的那一筆
   IF NOT cl_null(p_apcedocno) AND NOT cl_null(p_apceseq) THEN
      LET l_sql = l_sql CLIPPED,
                  " AND (( apbbdocno <> '",p_apcedocno,"') ",
                  "      OR (apbbdocno = '",p_apcedocno,"' AND apbaseq <> ",p_apceseq,")) "
   END IF
   PREPARE s_aapt420_sum_apba FROM l_sql
   EXECUTE s_aapt420_sum_apba INTO l_unconf5.*
   IF cl_null(l_unconf5.apba103) THEN LET l_unconf5.apba103 = 0 END IF
   IF cl_null(l_unconf5.apba113) THEN LET l_unconf5.apba113 = 0 END IF
   LET l_unconf5.apba1032 = l_unconf5.apba103 * l_apcc121
   LET l_unconf5.apba1033 = l_unconf5.apba103 * l_apcc131
   CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa016,l_unconf5.apba1032,2) RETURNING g_sub_success,g_errno,l_unconf5.apba1032
   CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa020,l_unconf5.apba1033,2) RETURNING g_sub_success,g_errno,l_unconf5.apba1033
   #160705-00035#1-e
   #160705-00035#1 mark ------
   #LET r_apcc10x = l_conf.apcc10x - l_unconf.apcc10x - l_unconf2.apcc10x - l_pay.apcc10x - l_unconf3.xrcc10x - l_unconf4.xrcc10x - l_amt1  #151207-00018#6 add lujh
   #LET r_apcc11x = l_conf.apcc11x - l_unconf.apcc11x - l_unconf2.apcc11x - l_pay.apcc11x - l_unconf3.xrcc11x - l_unconf4.xrcc11x
   #LET r_apcc12x = l_conf.apcc12x - l_unconf.apcc12x - l_unconf2.apcc12x - l_pay.apcc12x - l_unconf3.xrcc12x - l_unconf4.xrcc12x
   #LET r_apcc13x = l_conf.apcc13x - l_unconf.apcc13x - l_unconf2.apcc13x - l_pay.apcc13x - l_unconf3.xrcc13x - l_unconf4.xrcc13x
   #160705-00035#1 mark end---
   #160705-00035#1-s
   LET r_apcc10x = l_conf.apcc10x - l_unconf.apcc10x - l_unconf2.apcc10x - l_pay.apcc10x - l_unconf3.xrcc10x - l_unconf4.xrcc10x - l_amt1 - l_unconf5.apba103
   LET r_apcc11x = l_conf.apcc11x - l_unconf.apcc11x - l_unconf2.apcc11x - l_pay.apcc11x - l_unconf3.xrcc11x - l_unconf4.xrcc11x - l_unconf5.apba113
   LET r_apcc12x = l_conf.apcc12x - l_unconf.apcc12x - l_unconf2.apcc12x - l_pay.apcc12x - l_unconf3.xrcc12x - l_unconf4.xrcc12x - l_unconf5.apba1032
   LET r_apcc13x = l_conf.apcc13x - l_unconf.apcc13x - l_unconf2.apcc13x - l_pay.apcc13x - l_unconf3.xrcc13x - l_unconf4.xrcc13x - l_unconf5.apba1033
   #160705-00035#1-e
   
   #160704-00022#1--s
   #應付計算剩餘可沖金額,應扣除留置金額
   IF p_apce002 = '40' AND p_type = '1' THEN   
      #取得該張立帳單號扣除留置金額後可沖金額(原幣)
      CALL s_aapt420_get_lien_money(p_apcald,p_apcadocno,p_apcedocno,p_apceseq,'')
       RETURNING l_lien_amt,l_lien_amt2
      IF r_apcc10x > l_lien_amt2 THEN
         CALL s_ld_sel_glaa(p_apcald,'glaa001|glaa015|glaa016|glaa019|glaa020')
              RETURNING g_sub_success,l_glaa.*
         #160705-00035#1 mark ------
         #改前面先取故mark
         #SELECT apcc102,apcc121,apcc131 INTO l_apcc102,l_apcc121,l_apcc131
         #  FROM apcc_t
         # WHERE apccent = g_enterprise
         #   AND apccld = p_apcald
         #   AND apccdocno = p_apcadocno
         #   AND apccseq = p_apcbseq
         #   AND apcc001 = p_apcc001
         #160705-00035#1 mark end---
         LET r_apcc10x = l_lien_amt2         
         #本幣金額
         LET r_apcc11x = r_apcc10x * l_apcc102
         IF cl_null(r_apcc11x) THEN LET r_apcc11x = 0 END IF
         CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa001,r_apcc11x,2) RETURNING g_sub_success,g_errno,r_apcc11x
         #本位幣二金額
         IF l_glaa.glaa015 = 'Y' THEN
            LET r_apcc12x = r_apcc10x * l_apcc121
            IF cl_null(r_apcc12x) THEN LET r_apcc12x = 0 END IF
            CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa016,r_apcc12x,2) RETURNING g_sub_success,g_errno,r_apcc12x
         END IF
         #本位幣三金額
         IF l_glaa.glaa019 = 'Y' THEN
            LET r_apcc13x = r_apcc10x * l_apcc131
            IF cl_null(r_apcc13x) THEN LET r_apcc13x = 0 END IF
            CALL s_curr_round_ld('1',p_apcald,l_glaa.glaa020,r_apcc13x,2) RETURNING g_sub_success,g_errno,r_apcc13x
         END IF      
      END IF
   END IF
   #160704-00022#1--e
   IF r_apcc10x < 0 THEN LET r_apcc10x = 0 END IF
   IF r_apcc11x < 0 THEN LET r_apcc11x = 0 END IF
   IF r_apcc12x < 0 THEN LET r_apcc12x = 0 END IF
   IF r_apcc13x < 0 THEN LET r_apcc13x = 0 END IF
   
   RETURN r_success,r_errno,r_apcc10x,r_apcc11x,r_apcc12x,r_apcc13x
END FUNCTION
################################################################################
# Descriptions...: 傳入金額檢核是否超過apcc剩餘可沖量
# Memo...........:          
# Usage..........: s_aapt420_apcc_used_chk(p_apce002,p_apceld,p_apcald,p_apcadocno,p_apcbseq,p_apcc001,p_chk_num,p_apcedocno,p_apceseq,p_type,p_field)
#                  RETURNING r_success,r_errno
# Input parameter: p_apce002      帳款類型
#                : p_apceld       帳別
#                : p_apcald       來源帳別
#                : p_apcadocno    單號
#                : p_apcbseq      項次
#                : p_apcc001      期別
#                : p_chk_num      要檢查的金額
#                : p_apcedocno    檢查的單號
#                : p_apceseq      檢查的項次
#                : p_type         類型     匯總 或明細
#                : p_field        檢查的欄位     0原幣   1本幣 2本幣二 3本幣三
# Return code....: r_success      
#                : r_errno 
# Date & Author..: 14/10/13 By apo
# Modify.........:
#160704-00022#1   160718 By 03538   應付帳款可沖金額應扣除留置金額
################################################################################
PUBLIC FUNCTION s_aapt420_apcc_used_chk(p_apce002,p_apceld,p_apcald,p_apcadocno,p_apcbseq,p_apcc001,p_chk_num,p_apcedocno,p_apceseq,p_type,p_field)
   DEFINE p_apce002   LIKE apce_t.apce002
   DEFINE p_apceld    LIKE apce_t.apceld   #核銷單帳別
   DEFINE p_apcald    LIKE apca_t.apcald   #來源帳款帳別
   DEFINE p_apcadocno LIKE apca_t.apcadocno
   DEFINE p_apcbseq   LIKE apcb_t.apcbseq
   DEFINE p_apcc001   LIKE apcc_t.apcc001
   DEFINE p_chk_num   LIKE type_t.num20_6
   DEFINE p_apcedocno LIKE apce_t.apcedocno
   DEFINE p_apceseq   LIKE apce_t.apceseq
   DEFINE p_type      LIKE type_t.chr1
   DEFINE p_field     LIKE type_t.chr1
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_errno     LIKE gzze_t.gzze001
   DEFINE l_apcc_used RECORD
                      apcc10x    LIKE type_t.num20_6,
                      apcc11x    LIKE type_t.num20_6,
                      apcc12x    LIKE type_t.num20_6,
                      apcc13x    LIKE type_t.num20_6
                      END RECORD
   #160704-00022#1--s
   DEFINE l_lien_amt    LIKE apcc_t.apcc108         
   DEFINE l_lien_amt2   LIKE apcc_t.apcc108         
   #160704-00022#1--e   
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_errno = ''
   
   INITIALIZE l_apcc_used.* TO NULL
   CALL s_aapt420_apcc_used_num(p_apce002,p_apceld,p_apcald,p_apcadocno,p_apcbseq,p_apcc001,p_apcedocno,p_apceseq,p_type)
      RETURNING g_sub_success,g_errno,l_apcc_used.apcc10x,l_apcc_used.apcc11x,l_apcc_used.apcc12x,l_apcc_used.apcc13x
   
   CASE
      #檢核原幣金額
      WHEN p_field = '0'
        #IF p_chk_num > l_apcc_used.apcc10x THEN                    #160704-00022#1 mark
         IF p_chk_num > l_apcc_used.apcc10x OR p_chk_num = 0 THEN   #160704-00022#1 
            LET r_success  = FALSE
            LET r_errno    = 'aap-00158'
         END IF
         
      #檢核本幣金額
      WHEN p_field = '1'  
        #IF p_chk_num > l_apcc_used.apcc11x THEN                    #160704-00022#1 mark
         IF p_chk_num > l_apcc_used.apcc11x OR p_chk_num = 0 THEN   #160704-00022#1 
            LET r_success = FALSE
            LET r_errno   = 'aap-00158'
         END IF
         
      #檢核本位幣二金額
      WHEN p_field = '2'  
        #IF p_chk_num > l_apcc_used.apcc12x THEN                #160704-00022#1 mark
         IF p_chk_num > l_apcc_used.apcc12x OR p_chk_num THEN   #160704-00022#1 
            LET r_success = FALSE
            LET r_errno   = 'aap-00158'
         END IF
         
      #檢核本位幣三金額
      WHEN p_field = '3'  
        #IF p_chk_num > l_apcc_used.apcc13x THEN                #160704-00022#1 mark
         IF p_chk_num > l_apcc_used.apcc13x OR p_chk_num THEN   #160704-00022#1 
            LET r_success = FALSE
            LET r_errno   = 'aap-00158'
         END IF         
   END CASE
   #160704-00022#1--s
   #應付計算剩餘可沖金額,應扣除留置金額
   IF NOT r_success AND p_apce002 = '40' AND p_type = '1' THEN   
      #取得該張立帳單號扣除留置金額後可沖金額(原幣)
      CALL s_aapt420_get_lien_money(p_apcald,p_apcadocno,p_apcedocno,p_apceseq,'')
       RETURNING l_lien_amt,l_lien_amt2
      IF l_lien_amt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aap-00570'
         LET g_errparam.extend = p_apcadocno
         LET g_errparam.replace[1] = l_lien_amt
         LET g_errparam.replace[2] = l_lien_amt2
         LET g_errparam.popup = TRUE
         CALL cl_err()      
      END IF
   END IF
   #160704-00022#1--e   
   
   RETURN r_success,r_errno
END FUNCTION

################################################################################
# Descriptions...: 產生核銷單身apce_t & apde_t
# Memo...........:
# Usage..........: CALL s_aapt420_ins_clearance_detail(p_docno,p_ld,p_apda005,p_flag)
# Input parameter: p_docno        核銷單號
#                : p_ld           帳別
#                : p_apda005      付款對象
#                : p_flag         應付沖銷參數
# Date & Author..: 14/10/17 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ins_clearance_detail(p_docno,p_ld,p_apda005,p_flag)
DEFINE p_docno       LIKE apda_t.apdadocno
DEFINE p_ld          LIKE apda_t.apdald
DEFINE p_apda005     LIKE apda_t.apda005
DEFINE p_flag        LIKE type_t.chr1          #S-FIN-2002-應付沖銷參數
DEFINE l_apeadocno   LIKE apea_t.apeadocno
DEFINE l_sql         STRING
DEFINE r_success     LIKE type_t.num5
DEFINE l_wc          STRING

   LET r_success = TRUE
   CALL aapt420_01(p_apda005) RETURNING l_wc
   LET l_wc = l_wc CLIPPED," AND apea005 = '",p_apda005,"' ",
                           " AND apeastus = 'Y' "  
                           
   LET l_sql = "  SELECT DISTINCT apeadocno FROM apea_t ",
               "   WHERE apeastus = 'Y' ",
               "     AND ",l_wc,
               "     AND apeaent = ",g_enterprise," ", #170615-00061#11 add
               "     AND NOT EXISTS ",
               " (SELECT 1 FROM apda_t,apce_t ",
               "   WHERE apdaent = apceent ", 
               "     AND apdald = apceld ",  
               "     AND apdadocno = apcedocno ",
               "     AND apdastus <> 'X' ",  #作廢不算
               "     AND apceent = apeaent ",
               "     AND apceent = '",g_enterprise,"' ",
               "     AND apceld = '",p_ld,"' ",
               "     AND apce049 = apeadocno) ",
               "   ORDER BY apeadocno "

   PREPARE s_aapt420_sel_apea_p FROM l_sql
   DECLARE s_aapt420_sel_apea_c CURSOR FOR s_aapt420_sel_apea_p  
   
   LET l_sql = " SELECT apeb002,apeborga,apeb003,apeb004,apeb005, ",
               "        apeb013,apeb008,apeb024,apeb015,apeb100, ",
               "        apeb109,apeb101,apeb119,apeb031,apebld, ",
               "        apebcomp,apebsite,apebdocno,apebseq ",
               "   FROM apeb_t ",
               "  WHERE apebent = '",g_enterprise,"' ", 
               "    AND apebdocno = ? "               
 
   PREPARE s_aapt420_sel_apeb_p2 FROM l_sql
   DECLARE s_aapt420_sel_apeb_c2 CURSOR FOR s_aapt420_sel_apeb_p2 
   
   LET l_sql = " SELECT apeeorga,apee002,apee006,apee008,apee021, ",
               "        apee024,apee015,apee100,apee109,apee101, ",
               "        apee119,apee032,apee013,apee014,apee010, ",
               "        apee009,apee039,apee040,apee011,apee012, ",
               "        apeecomp,apeesite,apeedocno,apeeseq,apee038 ",
               "   FROM apee_t ",
               "  WHERE apeeent = '",g_enterprise,"' ", 
               "    AND apeedocno = ? "               
 
   PREPARE s_aapt420_sel_apee_p2 FROM l_sql
   DECLARE s_aapt420_sel_apee_c2 CURSOR FOR s_aapt420_sel_apee_p2   

   
   FOREACH s_aapt420_sel_apea_c INTO l_apeadocno
      CALL s_aapt420_ins_apce_from_apeb(p_docno,l_apeadocno,p_ld,p_flag) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF
      CALL s_aapt420_ins_apde_from_apee(p_docno,l_apeadocno,p_ld) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF      
   END FOREACH
    
   RETURN r_success   

END FUNCTION

################################################################################
# Descriptions...: 付款申請單寫入核銷單帳款單身
# Memo...........:
# Usage..........: CALL s_aapt420_ins_apce_from_apeb(p_apdadocno,p_apeadocno,p_ld,p_flag)
#                  RETURNING g_sub_success
# Date & Author..: 14/10/17 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ins_apce_from_apeb(p_apdadocno,p_apeadocno,p_ld,p_flag)
   DEFINE p_apdadocno     LIKE apda_t.apdadocno   #核銷單號
   DEFINE p_apeadocno     LIKE apea_t.apeadocno   #付款申請單號
   DEFINE p_flag          LIKE type_t.chr1        #S-FIN-2002-應付沖銷參數   
   DEFINE p_ld            LIKE apda_t.apdald
  #DEFINE l_apce          RECORD LIKE apce_t.* #161111-00048#4 mark
   #161111-00048#4 --s add
   DEFINE l_apce RECORD  #應付沖帳明細
          apceent LIKE apce_t.apceent, #企業編號
          apcecomp LIKE apce_t.apcecomp, #法人
          apcelegl LIKE apce_t.apcelegl, #核算組織
          apcesite LIKE apce_t.apcesite, #帳務組織
          apceld LIKE apce_t.apceld, #帳套
          apceorga LIKE apce_t.apceorga, #帳務歸屬組織
          apcedocno LIKE apce_t.apcedocno, #沖銷單單號
          apceseq LIKE apce_t.apceseq, #項次
          apce001 LIKE apce_t.apce001, #來源作業
          apce002 LIKE apce_t.apce002, #沖銷類型
          apce003 LIKE apce_t.apce003, #沖銷帳款單單號
          apce004 LIKE apce_t.apce004, #沖銷帳款單項次
          apce005 LIKE apce_t.apce005, #分期帳款序
          apce006 LIKE apce_t.apce006, #no use
          apce007 LIKE apce_t.apce007, #no use
          apce008 LIKE apce_t.apce008, #票據號碼/ 現金銀存帳戶
          apce009 LIKE apce_t.apce009, #no use
          apce010 LIKE apce_t.apce010, #摘要說明
          apce011 LIKE apce_t.apce011, #理由碼
          apce012 LIKE apce_t.apce012, #銀存存提碼
          apce013 LIKE apce_t.apce013, #現金異動碼
          apce014 LIKE apce_t.apce014, #no use
          apce015 LIKE apce_t.apce015, #沖銷加減項
          apce016 LIKE apce_t.apce016, #沖銷科目
          apce017 LIKE apce_t.apce017, #業務人員
          apce018 LIKE apce_t.apce018, #業務部門
          apce019 LIKE apce_t.apce019, #責任中心
          apce020 LIKE apce_t.apce020, #產品類別
          apce021 LIKE apce_t.apce021, #no use
          apce022 LIKE apce_t.apce022, #專案編號
          apce023 LIKE apce_t.apce023, #WBS編號
          apce024 LIKE apce_t.apce024, #第二參考單號
          apce025 LIKE apce_t.apce025, #第二參考單號項次
          apce026 LIKE apce_t.apce026, #no use
          apce027 LIKE apce_t.apce027, #應稅折抵否
          apce028 LIKE apce_t.apce028, #產生方式
          apce029 LIKE apce_t.apce029, #傳票號碼
          apce030 LIKE apce_t.apce030, #傳票項次
          apce031 LIKE apce_t.apce031, #付款(票)到期日
          apce032 LIKE apce_t.apce032, #應付款日
          apce033 LIKE apce_t.apce033, #no use
          apce034 LIKE apce_t.apce034, #no use
          apce035 LIKE apce_t.apce035, #區域
          apce036 LIKE apce_t.apce036, #客戶分類
          apce037 LIKE apce_t.apce037, #no use
          apce038 LIKE apce_t.apce038, #帳款對象
          apce039 LIKE apce_t.apce039, #no use
          apce040 LIKE apce_t.apce040, #no use
          apce041 LIKE apce_t.apce041, #no use
          apce042 LIKE apce_t.apce042, #no use
          apce043 LIKE apce_t.apce043, #no use
          apce044 LIKE apce_t.apce044, #經營方式
          apce045 LIKE apce_t.apce045, #通路
          apce046 LIKE apce_t.apce046, #品牌
          apce047 LIKE apce_t.apce047, #發票編號
          apce048 LIKE apce_t.apce048, #發票號碼
          apce049 LIKE apce_t.apce049, #付款申請單號碼
          apce050 LIKE apce_t.apce050, #付款申請單項次
          apce051 LIKE apce_t.apce051, #自由核算項一
          apce052 LIKE apce_t.apce052, #自由核算項二
          apce053 LIKE apce_t.apce053, #自由核算項三
          apce054 LIKE apce_t.apce054, #自由核算項四
          apce055 LIKE apce_t.apce055, #自由核算項五
          apce056 LIKE apce_t.apce056, #自由核算項六
          apce057 LIKE apce_t.apce057, #自由核算項七
          apce058 LIKE apce_t.apce058, #自由核算項八
          apce059 LIKE apce_t.apce059, #自由核算項九
          apce060 LIKE apce_t.apce060, #自由核算項十
          apce100 LIKE apce_t.apce100, #幣別
          apce101 LIKE apce_t.apce101, #匯率
          apce104 LIKE apce_t.apce104, #原幣應稅折抵稅額
          apce109 LIKE apce_t.apce109, #原幣沖帳金額
          apce114 LIKE apce_t.apce114, #本幣應稅折抵稅額
          apce119 LIKE apce_t.apce119, #本幣沖帳金額
          apce120 LIKE apce_t.apce120, #本位幣二幣別
          apce124 LIKE apce_t.apce124, #本位幣二應稅折抵稅額
          apce121 LIKE apce_t.apce121, #本位幣二匯率
          apce129 LIKE apce_t.apce129, #本位幣二沖帳金額
          apce130 LIKE apce_t.apce130, #本位幣三幣別
          apce131 LIKE apce_t.apce131, #本位幣三匯率
          apce134 LIKE apce_t.apce134, #本位幣三應稅折抵稅額
          apce139 LIKE apce_t.apce139, #本位幣三沖帳金額
          apceud001 LIKE apce_t.apceud001, #自定義欄位(文字)001
          apceud002 LIKE apce_t.apceud002, #自定義欄位(文字)002
          apceud003 LIKE apce_t.apceud003, #自定義欄位(文字)003
          apceud004 LIKE apce_t.apceud004, #自定義欄位(文字)004
          apceud005 LIKE apce_t.apceud005, #自定義欄位(文字)005
          apceud006 LIKE apce_t.apceud006, #自定義欄位(文字)006
          apceud007 LIKE apce_t.apceud007, #自定義欄位(文字)007
          apceud008 LIKE apce_t.apceud008, #自定義欄位(文字)008
          apceud009 LIKE apce_t.apceud009, #自定義欄位(文字)009
          apceud010 LIKE apce_t.apceud010, #自定義欄位(文字)010
          apceud011 LIKE apce_t.apceud011, #自定義欄位(數字)011
          apceud012 LIKE apce_t.apceud012, #自定義欄位(數字)012
          apceud013 LIKE apce_t.apceud013, #自定義欄位(數字)013
          apceud014 LIKE apce_t.apceud014, #自定義欄位(數字)014
          apceud015 LIKE apce_t.apceud015, #自定義欄位(數字)015
          apceud016 LIKE apce_t.apceud016, #自定義欄位(數字)016
          apceud017 LIKE apce_t.apceud017, #自定義欄位(數字)017
          apceud018 LIKE apce_t.apceud018, #自定義欄位(數字)018
          apceud019 LIKE apce_t.apceud019, #自定義欄位(數字)019
          apceud020 LIKE apce_t.apceud020, #自定義欄位(數字)020
          apceud021 LIKE apce_t.apceud021, #自定義欄位(日期時間)021
          apceud022 LIKE apce_t.apceud022, #自定義欄位(日期時間)022
          apceud023 LIKE apce_t.apceud023, #自定義欄位(日期時間)023
          apceud024 LIKE apce_t.apceud024, #自定義欄位(日期時間)024
          apceud025 LIKE apce_t.apceud025, #自定義欄位(日期時間)025
          apceud026 LIKE apce_t.apceud026, #自定義欄位(日期時間)026
          apceud027 LIKE apce_t.apceud027, #自定義欄位(日期時間)027
          apceud028 LIKE apce_t.apceud028, #自定義欄位(日期時間)028
          apceud029 LIKE apce_t.apceud029, #自定義欄位(日期時間)029
          apceud030 LIKE apce_t.apceud030, #自定義欄位(日期時間)030
          apce103 LIKE apce_t.apce103, #原幣未稅沖銷額
          apce113 LIKE apce_t.apce113, #本位未稅沖銷額
          apce123 LIKE apce_t.apce123, #本位幣二未稅沖銷額
          apce133 LIKE apce_t.apce133, #本位幣三未稅沖銷額
          apce061 LIKE apce_t.apce061  #付款對象
   END RECORD
   #161111-00048#4 --e add
   DEFINE l_apeb015       LIKE apeb_t.apeb015
   DEFINE r_success       LIKE type_t.num5
   DEFINE l_apceorga_comp LIKE apce_t.apcecomp
   DEFINE l_apceorga_ld   LIKE apce_t.apceld

   LET r_success = TRUE   
   
   FOREACH s_aapt420_sel_apeb_c2 USING p_apeadocno INTO 
      l_apce.apce002,l_apce.apceorga,l_apce.apce003,l_apce.apce004,l_apce.apce005,
      l_apce.apce038,l_apce.apce048,l_apce.apce024,l_apeb015,l_apce.apce100,
      l_apce.apce109,l_apce.apce101,l_apce.apce119,l_apce.apce031,l_apce.apceld,
      l_apce.apcecomp,l_apce.apcesite,l_apce.apce049,l_apce.apce050
      
      LET l_apce.apceent = g_enterprise  
      LET l_apce.apcedocno = p_apdadocno
      LET l_apce.apceld = p_ld
      LET l_apce.apce001 = g_prog
      #付款申請單借貸別資料轉換
      IF l_apeb015 = '1' THEN
         LET l_apce.apce015 = 'C'
      ELSE
         LET l_apce.apce015 = 'D'
      END IF
      
      SELECT MAX(apceseq)+1 INTO l_apce.apceseq
        FROM apce_t
       WHERE apceent = g_enterprise
         AND apcedocno = p_apdadocno
         AND apceld = p_ld
      IF cl_null(l_apce.apceseq) THEN LET l_apce.apceseq = 1 END IF
      
      #取得來源組織所屬法人
      CALL s_fin_orga_get_comp_ld(l_apce.apceorga) RETURNING g_sub_success,g_errno,l_apceorga_comp,l_apceorga_ld       
      #預帶沖銷科目
      LET l_apce.apce016 = s_aapt420_bring_acc_code(l_apceorga_ld,l_apce.apce002,l_apce.apce003,l_apce.apce004,p_flag)
      
      INSERT INTO apce_t
                 (apceent,
                  apceld,apcecomp,apceorga,apcesite,apcedocno,
                  apceseq,apce001,apce002,apce003,apce004,
                  apce005,apce015,apce024,apce031,apce038,
                  apce048,apce049,apce050,apce100,apce101,
                  apce109,apce119,apce016)

           VALUES(l_apce.apceent,
                  l_apce.apceld,l_apce.apcecomp,l_apce.apceorga,l_apce.apcesite,l_apce.apcedocno,
                  l_apce.apceseq,l_apce.apce001,l_apce.apce002,l_apce.apce003,l_apce.apce004,
                  l_apce.apce005,l_apce.apce015,l_apce.apce024,l_apce.apce031,l_apce.apce038,
                  l_apce.apce048,l_apce.apce049,l_apce.apce050,l_apce.apce100,l_apce.apce101,
                  l_apce.apce109,l_apce.apce119,l_apce.apce016)      
                  
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins apce_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF      
   END FOREACH 
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 付款申請單寫入核銷單付款單身
# Memo...........:
# Usage..........: CALL s_aapt420_ins_apde_from_apee(p_apdadocno,p_apeadocno,p_ld)
#                  RETURNING g_sub_success
# Date & Author..: 14/10/17 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ins_apde_from_apee(p_apdadocno,p_apeadocno,p_ld)
   DEFINE p_apdadocno   LIKE apda_t.apdadocno   #核銷單號
   DEFINE p_apeadocno   LIKE apea_t.apeadocno   #付款申請單號
   DEFINE p_ld          LIKE apda_t.apdald
  #DEFINE l_apde        RECORD LIKE apde_t.* #161111-00048#4 mark
   #161111-00048#4 --s add
   DEFINE l_apde RECORD  #付款及差異處理明細檔
          apdeent LIKE apde_t.apdeent, #企業編號
          apdecomp LIKE apde_t.apdecomp, #法人
          apdeld LIKE apde_t.apdeld, #帳套
          apdedocno LIKE apde_t.apdedocno, #沖銷單單號
          apdeseq LIKE apde_t.apdeseq, #項次
          apdesite LIKE apde_t.apdesite, #帳務中心
          apdeorga LIKE apde_t.apdeorga, #帳務歸屬組織
          apde001 LIKE apde_t.apde001, #來源作業
          apde002 LIKE apde_t.apde002, #沖銷帳款類型
          apde003 LIKE apde_t.apde003, #已付款單號
          apde004 LIKE apde_t.apde004, #沖銷單項次
          apde006 LIKE apde_t.apde006, #款別編號
          apde008 LIKE apde_t.apde008, #帳戶/票券號碼
          apde009 LIKE apde_t.apde009, #已轉資料
          apde010 LIKE apde_t.apde010, #摘要說明
          apde011 LIKE apde_t.apde011, #銀行存提碼
          apde012 LIKE apde_t.apde012, #現金變動碼
          apde013 LIKE apde_t.apde013, #轉入客商碼
          apde014 LIKE apde_t.apde014, #轉入帳款單編號
          apde015 LIKE apde_t.apde015, #沖銷加減項
          apde016 LIKE apde_t.apde016, #沖銷會科
          apde017 LIKE apde_t.apde017, #業務人員
          apde018 LIKE apde_t.apde018, #業務部門
          apde019 LIKE apde_t.apde019, #責任中心
          apde020 LIKE apde_t.apde020, #產品類別
          apde021 LIKE apde_t.apde021, #票據類型
          apde022 LIKE apde_t.apde022, #專案編號
          apde023 LIKE apde_t.apde023, #WBS編號
          apde024 LIKE apde_t.apde024, #票據號碼
          apde028 LIKE apde_t.apde028, #產生方式
          apde029 LIKE apde_t.apde029, #傳票號碼
          apde030 LIKE apde_t.apde030, #傳票項次
          apde032 LIKE apde_t.apde032, #付款日
          apde035 LIKE apde_t.apde035, #區域
          apde036 LIKE apde_t.apde036, #客群
          apde038 LIKE apde_t.apde038, #對象
          apde039 LIKE apde_t.apde039, #受款銀行
          apde040 LIKE apde_t.apde040, #受款帳號
          apde041 LIKE apde_t.apde041, #受款人全名
          apde042 LIKE apde_t.apde042, #經營方式
          apde043 LIKE apde_t.apde043, #通路
          apde044 LIKE apde_t.apde044, #品牌
          apde045 LIKE apde_t.apde045, #摘要
          apde046 LIKE apde_t.apde046, #付款申請單
          apde047 LIKE apde_t.apde047, #付款申請單項次
          apde051 LIKE apde_t.apde051, #自由核算項一
          apde052 LIKE apde_t.apde052, #自由核算項二
          apde053 LIKE apde_t.apde053, #自由核算項三
          apde054 LIKE apde_t.apde054, #自由核算項四
          apde055 LIKE apde_t.apde055, #自由核算項五
          apde056 LIKE apde_t.apde056, #自由核算項六
          apde057 LIKE apde_t.apde057, #自由核算項七
          apde058 LIKE apde_t.apde058, #自由核算項八
          apde059 LIKE apde_t.apde059, #自由核算項九
          apde060 LIKE apde_t.apde060, #自由核算項十
          apde100 LIKE apde_t.apde100, #幣別
          apde101 LIKE apde_t.apde101, #匯率
          apde104 LIKE apde_t.apde104, #原幣應稅折抵稅額
          apde109 LIKE apde_t.apde109, #原幣沖帳金額
          apde119 LIKE apde_t.apde119, #本幣沖帳金額
          apde120 LIKE apde_t.apde120, #本位幣二幣別
          apde121 LIKE apde_t.apde121, #本位幣二匯率
          apde129 LIKE apde_t.apde129, #本位幣二沖帳金額
          apde130 LIKE apde_t.apde130, #本位幣三幣別
          apde131 LIKE apde_t.apde131, #本位幣三匯率
          apde139 LIKE apde_t.apde139, #本位幣三沖帳金額
          apdeud001 LIKE apde_t.apdeud001, #自定義欄位(文字)001
          apdeud002 LIKE apde_t.apdeud002, #自定義欄位(文字)002
          apdeud003 LIKE apde_t.apdeud003, #自定義欄位(文字)003
          apdeud004 LIKE apde_t.apdeud004, #自定義欄位(文字)004
          apdeud005 LIKE apde_t.apdeud005, #自定義欄位(文字)005
          apdeud006 LIKE apde_t.apdeud006, #自定義欄位(文字)006
          apdeud007 LIKE apde_t.apdeud007, #自定義欄位(文字)007
          apdeud008 LIKE apde_t.apdeud008, #自定義欄位(文字)008
          apdeud009 LIKE apde_t.apdeud009, #自定義欄位(文字)009
          apdeud010 LIKE apde_t.apdeud010, #自定義欄位(文字)010
          apdeud011 LIKE apde_t.apdeud011, #自定義欄位(數字)011
          apdeud012 LIKE apde_t.apdeud012, #自定義欄位(數字)012
          apdeud013 LIKE apde_t.apdeud013, #自定義欄位(數字)013
          apdeud014 LIKE apde_t.apdeud014, #自定義欄位(數字)014
          apdeud015 LIKE apde_t.apdeud015, #自定義欄位(數字)015
          apdeud016 LIKE apde_t.apdeud016, #自定義欄位(數字)016
          apdeud017 LIKE apde_t.apdeud017, #自定義欄位(數字)017
          apdeud018 LIKE apde_t.apdeud018, #自定義欄位(數字)018
          apdeud019 LIKE apde_t.apdeud019, #自定義欄位(數字)019
          apdeud020 LIKE apde_t.apdeud020, #自定義欄位(數字)020
          apdeud021 LIKE apde_t.apdeud021, #自定義欄位(日期時間)021
          apdeud022 LIKE apde_t.apdeud022, #自定義欄位(日期時間)022
          apdeud023 LIKE apde_t.apdeud023, #自定義欄位(日期時間)023
          apdeud024 LIKE apde_t.apdeud024, #自定義欄位(日期時間)024
          apdeud025 LIKE apde_t.apdeud025, #自定義欄位(日期時間)025
          apdeud026 LIKE apde_t.apdeud026, #自定義欄位(日期時間)026
          apdeud027 LIKE apde_t.apdeud027, #自定義欄位(日期時間)027
          apdeud028 LIKE apde_t.apdeud028, #自定義欄位(日期時間)028
          apdeud029 LIKE apde_t.apdeud029, #自定義欄位(日期時間)029
          apdeud030 LIKE apde_t.apdeud030, #自定義欄位(日期時間)030
          apde061 LIKE apde_t.apde061  #應付來源
   END RECORD
   #161111-00048#4 --e add
   DEFINE l_apee015     LIKE apee_t.apee015
   DEFINE r_success     LIKE type_t.num5

   LET r_success = TRUE   
   
   FOREACH s_aapt420_sel_apee_c2 USING p_apeadocno INTO 
      l_apde.apdeorga,l_apde.apde002,l_apde.apde006,l_apde.apde008,l_apde.apde021,
      l_apde.apde024,l_apee015,l_apde.apde100,l_apde.apde109,l_apde.apde101,
      l_apde.apde119,l_apde.apde032,l_apde.apde013,l_apde.apde014,l_apde.apde010,
      l_apde.apde009,l_apde.apde039,l_apde.apde040,l_apde.apde011,l_apde.apde012,
      l_apde.apdecomp,l_apde.apdesite,l_apde.apde046,l_apde.apde047,l_apde.apde038
      
      LET l_apde.apdeent = g_enterprise  
      LET l_apde.apdedocno = p_apdadocno
      LET l_apde.apdeld = p_ld
      LET l_apde.apde001 = g_prog
      #付款申請單借貸別資料轉換
      IF l_apee015 = '1' THEN
         LET l_apde.apde015 = 'C'
      ELSE
         LET l_apde.apde015 = 'D'
      END IF      
      
      SELECT MAX(apdeseq)+1 INTO l_apde.apdeseq
        FROM apde_t
       WHERE apdeent = g_enterprise
         AND apdedocno = p_apdadocno
         AND apdeld = p_ld
      IF cl_null(l_apde.apdeseq) THEN LET l_apde.apdeseq = 1 END IF

      #預帶沖銷科目
      IF l_apde.apde006 ='30' THEN
         LET l_apde.apde016 = s_aapt420_bring_acc_code2(l_apde.apdeld,l_apde.apdesite,l_apde.apde038,l_apde.apde002,l_apde.apde006,l_apde.apde021)
      ELSE
         LET l_apde.apde016 = s_aapt420_bring_acc_code2(l_apde.apdeld,l_apde.apdesite,l_apde.apde038,l_apde.apde002,l_apde.apde006,l_apde.apde008)
      END IF
      
      INSERT INTO apde_t
                 (apdeent,apdeld,
                  apdecomp,apdesite,apdeorga,apdedocno,apdeseq,
                  apde001,apde002,apde006,apde008,apde009,
                  apde010,apde011,apde012,apde013,apde014,
                  apde015,apde021,apde024,apde032,apde038,
                  apde039,apde040,apde046,apde047,apde100,
                  apde101,apde109,apde119,apde016)

           VALUES(l_apde.apdeent,l_apde.apdeld,
                  l_apde.apdecomp,l_apde.apdesite,l_apde.apdeorga,l_apde.apdedocno,l_apde.apdeseq,
                  l_apde.apde001,l_apde.apde002,l_apde.apde006,l_apde.apde008,l_apde.apde009,
                  l_apde.apde010,l_apde.apde011,l_apde.apde012,l_apde.apde013,l_apde.apde014,
                  l_apde.apde015,l_apde.apde021,l_apde.apde024,l_apde.apde032,l_apde.apde038,
                  l_apde.apde039,l_apde.apde040,l_apde.apde046,l_apde.apde047,l_apde.apde100,
                  l_apde.apde101,l_apde.apde109,l_apde.apde119,l_apde.apde016)      
                  
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins apde_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF      
   END FOREACH 
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 預帶付款沖銷會計科目
# Memo...........:
# Usage..........: CALL s_aapt420_bring_acc_code2(p_ld,p_site,p_apda005,p_apce002,p_apce006,p_glab003)
#                  RETURNING 回传参数
# Input parameter: p_ld           帳別
#                : p_site         營運據點
#                : p_apda005      付款對象
#                : p_apce002      帳款類型
#                : p_apce006      款別類型
# Return code....: r_apce016      沖銷科目
# Date & Author..: 14/10/19 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_bring_acc_code2(p_ld,p_site,p_apda005,p_apce002,p_apce006,p_glab003)
DEFINE p_ld          LIKE apda_t.apdald     #帳別
DEFINE p_site        LIKE apda_t.apdasite   #營運據點
DEFINE p_apda005     LIKE apda_t.apda005    #付款對象
DEFINE p_apce002     LIKE apce_t.apce002    #帳款類型
DEFINE p_apce006     LIKE apce_t.apce006    #款別類型
DEFINE p_glab003     LIKE glab_t.glab003    #付款帳戶or票據類型
DEFINE r_apce016     LIKE apce_t.apce016    #沖銷科目
DEFINE l_pmab055     LIKE pmab_t.pmab055    #付款對象帳款類型
DEFINE l_glab        RECORD
          glab001       LIKE glab_t.glab001,
          glab002       LIKE glab_t.glab002,
          glab003       LIKE glab_t.glab003
                     END RECORD
DEFINE l_sql         STRING                     
#160324-00032#2--s
DEFINE l_comp        LIKE apda_t.apdacomp
DEFINE l_sfin3008    LIKE type_t.chr1   
#160324-00032#2--e
   
   #160324-00032#2--s
   #抓所屬法人
   SELECT ooef017 INTO l_comp
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = p_site
      AND ooefstus = 'Y'   
   CALL cl_get_para(g_enterprise,l_comp,'S-FIN-3008') RETURNING l_sfin3008         
   #160324-00032#2--e
   
   #150817-00025#1 add ------
   CASE
      WHEN p_apce006 >= '30' #票據&其他都抓agli190/支付時預設科目
         LET l_sql = " SELECT glab006 FROM glab_t ",
                     "  WHERE glabent = '",g_enterprise,"' ",
                     "    AND glabld = '",p_ld,"' ",
                     "    AND glab001 = ? ",
                     "    AND glab002 = ? ",
                     "    AND glab003 = ? "
      OTHERWISE
   #150817-00025#1 add end--- 
         LET l_sql = " SELECT glab005 FROM glab_t ",
                     "  WHERE glabent = '",g_enterprise,"' ",
                     "    AND glabld = '",p_ld,"' ",
                     "    AND glab001 = ? ",
                     "    AND glab002 = ? ",
                     "    AND glab003 = ? "
   END CASE #150817-00025#1 add
   PREPARE s_aapt420_sel_glab_p FROM l_sql 
   
   CASE 
      #10
      WHEN p_apce002 = '10' 
          #CASE WHEN p_apce006 = '10' OR p_apce006 = '20' OR p_apce006 = '40' OR  #150629-00028#1 mark
           CASE WHEN p_apce006 = '10' OR p_apce006 = '40' OR                      #150629-00028#1
                     p_apce006 = '50' OR p_apce006 = '60' OR p_apce006 = '29'
                   LET l_glab.glab001 = '40'
                   LET l_glab.glab002 = '40'
                #150629-00028#1--(s)
                #付款款別為20:電匯款,取anmi152匯款科目為預設值
                WHEN p_apce006 = '20'
                   #151009--s
                  #IF g_prog[1,5] = 'aapt3' THEN   #160324-00032#2 mark
                   IF l_sfin3008 = 'Y' THEN        #160324-00032#2
                      LET l_glab.glab001 = '40'
                      LET l_glab.glab002 = '40'                   
                   ELSE
                   #151009--e
                      LET l_glab.glab001 = '41'
                      LET l_glab.glab002 = '8718'                
                      LET l_glab.glab003 = s_aap_get_acc_str('8718',"gzcb004 = 'Y'")
                   END IF   #151009
                #150629-00028#1--(e)
                WHEN p_apce006 = '30'
                   LET l_glab.glab001 = '21'
                   LET l_glab.glab002 = '30'            
                WHEN p_apce006 = '70'
           END CASE
          #IF p_apce006 <> '20' THEN                            #151007 mark   #150629-00028#1  
          #IF p_apce006 <> '20' OR g_prog[1,5] = 'aapt3' THEN   #160324-00032#2 mark   #151007 
           IF p_apce006 <> '20' OR l_sfin3008 = 'Y' THEN        #160324-00032#2 
              LET l_glab.glab003 = p_glab003
           END IF                      #150629-00028#1
           EXECUTE s_aapt420_sel_glab_p USING l_glab.* INTO r_apce016
           
      #16
      WHEN p_apce002 = '16' 
           LET l_glab.glab001 = '21'
           LET l_glab.glab002 = '30'            
           LET l_glab.glab003 = p_glab003
           EXECUTE s_aapt420_sel_glab_p USING l_glab.* INTO r_apce016      
      
      #30/31/32/40/41/42
      WHEN p_apce002 = '30' OR p_apce002 = '31' OR p_apce002 = '32' OR
           p_apce002 = '40' OR p_apce002 = '41' OR p_apce002 = '42'
           
      #11/12/13/14/15     
      WHEN p_apce002 = '11' OR p_apce002 = '12' OR p_apce002 = '13' OR
           p_apce002 = '14' OR p_apce002 = '15'
           CASE p_apce002
              WHEN '11' LET l_glab.glab003 = '9711_11' 
              WHEN '12' LET l_glab.glab003 = '9711_12'
              WHEN '13' LET l_glab.glab003 = '9711_22'
              WHEN '14' LET l_glab.glab003 = '9711_21'
              #WHEN '15' LET l_glab.glab003 = '9711_24'   #161129-00040#1 mark
              WHEN '15' LET l_glab.glab003 = '9711_23'   #161129-00040#1 add
              END CASE
           LET l_glab.glab001 = '12'
           LET l_glab.glab002 = '9711'           
           EXECUTE s_aapt420_sel_glab_p USING l_glab.* INTO r_apce016
      
      #20/21/22
      WHEN p_apce002 = '20' OR p_apce002 = '21' OR p_apce002 = '22'      
           CASE p_apce002
              WHEN '20' LET l_glab.glab003 = '8504_13' 
              WHEN '21' LET l_glab.glab003 = '8504_14'
              WHEN '22' LET l_glab.glab003 = '8504_26'              
           END CASE   
           LET l_glab.glab001 = '13'
           
           SELECT pmab055 INTO l_pmab055
            FROM pmab_t
           WHERE pmabent = g_enterprise 
             AND pmabsite = p_site
             AND pmab001 = p_apda005
             
           LET l_glab.glab002 = l_pmab055  
           
           EXECUTE s_aapt420_sel_glab_p USING l_glab.* INTO r_apce016                 
   END CASE
   RETURN r_apce016

END FUNCTION

################################################################################
# Descriptions...: 預帶帳款沖銷會計科目
# Memo...........:
# Usage..........: s_aapt420_bring_acc_code(p_ld,p_apce002,p_apce003,p_apce004,p_flag)
#                  RETURNING r_apce016
# Input parameter: p_ld           帳別
#                : p_apce002      帳款類型
#                : p_apce003      沖銷帳款單號
#                : p_apce004      沖銷帳款單項次
#                : p_flag         沖銷參數S-FIN-2002(1/2/3)
# Return code....: r_apce016      沖銷科目
# Date & Author..: 14/10/19 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_bring_acc_code(p_ld,p_apce002,p_apce003,p_apce004,p_flag)
DEFINE  p_ld         LIKE apce_t.apceld    #帳別
DEFINE  p_apce002    LIKE apce_t.apce002   #帳款類型
DEFINE  p_apce003    LIKE apce_t.apce003   #沖銷帳款單號
DEFINE  p_apce004    LIKE apce_t.apce004   #沖銷帳款單項次
DEFINE  p_flag       LIKE type_t.chr1      #沖銷參數S-FIN-2002(1/2/3)
DEFINE  r_apce016    LIKE apce_t.apce016   #沖銷科目

   #沖銷參數為 1:沖銷至單據/2:沖銷至多帳期
   IF p_flag = '1' OR p_flag = '2' THEN
     #IF p_apce002[1,1] = '4' THEN            #160509-00004#89 mark
      IF p_apce002[1,1] MATCHES '[48]' THEN   #160509-00004#89 
         #應付
         SELECT apca035 INTO r_apce016 FROM apca_t
          WHERE apcaent = g_enterprise
            AND apcald = p_ld
            AND apcadocno = p_apce003
      ELSE
         #應收
         SELECT xrca035 INTO r_apce016 FROM xrca_t
          WHERE xrcaent = g_enterprise
            AND xrcald = p_ld
            AND xrcadocno = p_apce003      
      END IF
   ELSE
   #沖銷參數為 3:沖銷至明細
     #IF p_apce002[1,1] = '4' THEN            #160509-00004#89 mark
      IF p_apce002[1,1] MATCHES '[48]' THEN   #160509-00004#89 
         #應付
         SELECT apcb029 INTO r_apce016 FROM apcb_t
          WHERE apcbent = g_enterprise
            AND apcbld = p_ld
            AND apcbdocno = p_apce003
            AND apcbseq = p_apce004
      ELSE
         #應收
         SELECT xrcb029 INTO r_apce016 FROM xrcb_t
          WHERE xrcbent = g_enterprise
            AND xrcbld = p_ld
            AND xrcbdocno = p_apce003
            AND xrcbseq = p_apce004    
      END IF   
   END IF
   RETURN r_apce016

END FUNCTION

################################################################################
# Descriptions...: 產生待抵單
# Memo...........:
# Usage..........: CALL s_aapt420_create_contra_doc(p_apde)
#                  RETURNING r_apde014
# Input parameter: p_apde       付款單資訊
# Date & Author..: 14/10/20 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_create_contra_doc(p_apde)
DEFINE p_apde           type_g_apde2
#DEFINE l_apca           RECORD LIKE apca_t.* #161111-00048#4 mark
#DEFINE l_apcb           RECORD LIKE apcb_t.* #161111-00048#4 mark
#161111-00048#4 --s add
DEFINE l_apca RECORD  #應付憑單單頭
       apcaent LIKE apca_t.apcaent, #企業編號
       apcaownid LIKE apca_t.apcaownid, #資料所有者
       apcaowndp LIKE apca_t.apcaowndp, #資料所有部門
       apcacrtid LIKE apca_t.apcacrtid, #資料建立者
       apcacrtdp LIKE apca_t.apcacrtdp, #資料建立部門
       apcacrtdt LIKE apca_t.apcacrtdt, #資料創建日
       apcamodid LIKE apca_t.apcamodid, #資料修改者
       apcamoddt LIKE apca_t.apcamoddt, #最近修改日
       apcacnfid LIKE apca_t.apcacnfid, #資料確認者
       apcacnfdt LIKE apca_t.apcacnfdt, #資料確認日
       apcapstid LIKE apca_t.apcapstid, #資料過帳者
       apcapstdt LIKE apca_t.apcapstdt, #資料過帳日
       apcastus LIKE apca_t.apcastus, #狀態碼
       apcald LIKE apca_t.apcald, #帳套
       apcacomp LIKE apca_t.apcacomp, #法人
       apcadocno LIKE apca_t.apcadocno, #應付帳款單號碼
       apcadocdt LIKE apca_t.apcadocdt, #帳款日期
       apcasite LIKE apca_t.apcasite, #帳務中心
       apca001 LIKE apca_t.apca001, #帳款單性質
       apca003 LIKE apca_t.apca003, #帳務人員
       apca004 LIKE apca_t.apca004, #帳款對象編號
       apca005 LIKE apca_t.apca005, #付款對象
       apca006 LIKE apca_t.apca006, #供應商分類
       apca007 LIKE apca_t.apca007, #帳款類別
       apca008 LIKE apca_t.apca008, #付款條件編號
       apca009 LIKE apca_t.apca009, #應付款日/應扣抵日
       apca010 LIKE apca_t.apca010, #容許票據到期日
       apca011 LIKE apca_t.apca011, #稅別
       apca012 LIKE apca_t.apca012, #稅率
       apca013 LIKE apca_t.apca013, #含稅否
       apca014 LIKE apca_t.apca014, #人員編號
       apca015 LIKE apca_t.apca015, #部門編號
       apca016 LIKE apca_t.apca016, #來源作業類型
       apca017 LIKE apca_t.apca017, #產生方式
       apca018 LIKE apca_t.apca018, #來源參考單號
       apca019 LIKE apca_t.apca019, #系統產生對應單號(待抵帳款-預付)
       apca020 LIKE apca_t.apca020, #信用狀付款否
       apca021 LIKE apca_t.apca021, #商業發票號碼(IV no.)
       apca022 LIKE apca_t.apca022, #進口報單號碼
       apca025 LIKE apca_t.apca025, #差異處理(發票與帳款差異)
       apca026 LIKE apca_t.apca026, #原幣未稅差異
       apca027 LIKE apca_t.apca027, #原幣稅額差異
       apca028 LIKE apca_t.apca028, #本幣未稅差異
       apca029 LIKE apca_t.apca029, #本幣幣稅額差異
       apca030 LIKE apca_t.apca030, #差異科目
       apca031 LIKE apca_t.apca031, #產生之差異折讓單號
       apca032 LIKE apca_t.apca032, #發票類型
       apca033 LIKE apca_t.apca033, #專案編號
       apca034 LIKE apca_t.apca034, #責任中心
       apca035 LIKE apca_t.apca035, #應付(貸方)科目編號
       apca036 LIKE apca_t.apca036, #費用(借方)科目編號
       apca037 LIKE apca_t.apca037, #產生傳票否
       apca038 LIKE apca_t.apca038, #拋轉傳票號碼
       apca039 LIKE apca_t.apca039, #會計檢核附件份數
       apca040 LIKE apca_t.apca040, #留置否
       apca041 LIKE apca_t.apca041, #留置理由碼
       apca042 LIKE apca_t.apca042, #留置設定日期
       apca043 LIKE apca_t.apca043, #留置解除日期
       apca044 LIKE apca_t.apca044, #留置原幣金額
       apca045 LIKE apca_t.apca045, #留置說明
       apca046 LIKE apca_t.apca046, #關係人否
       apca047 LIKE apca_t.apca047, #多角序號
       apca048 LIKE apca_t.apca048, #集團代付/代付單號
       apca049 LIKE apca_t.apca049, #來源營運中心編號
       apca050 LIKE apca_t.apca050, #交易原始單據份數
       apca051 LIKE apca_t.apca051, #作廢理由碼
       apca052 LIKE apca_t.apca052, #列印次數
       apca053 LIKE apca_t.apca053, #備註
       apca054 LIKE apca_t.apca054, #多帳期設定
       apca055 LIKE apca_t.apca055, #繳款優惠條件
       apca056 LIKE apca_t.apca056, #會計檢核附件狀態
       apca057 LIKE apca_t.apca057, #交易對象識別碼
       apca058 LIKE apca_t.apca058, #稅別交易類型
       apca059 LIKE apca_t.apca059, #預算編號
       apca060 LIKE apca_t.apca060, #發票開立方式
       apca061 LIKE apca_t.apca061, #預開發票基準日
       apca062 LIKE apca_t.apca062, #多角性質
       apca063 LIKE apca_t.apca063, #整帳批序號
       apca064 LIKE apca_t.apca064, #訂金序次
       apca065 LIKE apca_t.apca065, #發票編號
       apca066 LIKE apca_t.apca066, #發票號碼
       apca100 LIKE apca_t.apca100, #交易原幣別
       apca101 LIKE apca_t.apca101, #原幣匯率
       apca103 LIKE apca_t.apca103, #原幣未稅金額
       apca104 LIKE apca_t.apca104, #原幣稅額
       apca106 LIKE apca_t.apca106, #原幣應稅折抵合計金額
       apca107 LIKE apca_t.apca107, #原幣直接沖帳(調整)合計金額
       apca108 LIKE apca_t.apca108, #原幣應付金額
       apca113 LIKE apca_t.apca113, #本幣未稅金額
       apca114 LIKE apca_t.apca114, #本幣稅額
       apca116 LIKE apca_t.apca116, #本幣應稅折抵合計金額
       apca117 LIKE apca_t.apca117, #NO USE
       apca118 LIKE apca_t.apca118, #本幣應付金額
       apca120 LIKE apca_t.apca120, #本位幣二幣別
       apca121 LIKE apca_t.apca121, #本位幣二匯率
       apca123 LIKE apca_t.apca123, #本位幣二未稅金額
       apca124 LIKE apca_t.apca124, #本位幣二稅額
       apca126 LIKE apca_t.apca126, #本位幣二應稅折抵合計金額
       apca127 LIKE apca_t.apca127, #NO USE
       apca128 LIKE apca_t.apca128, #本位幣二應付金額
       apca130 LIKE apca_t.apca130, #本位幣三幣別
       apca131 LIKE apca_t.apca131, #本位幣三匯率
       apca133 LIKE apca_t.apca133, #本位幣三未稅金額
       apca134 LIKE apca_t.apca134, #本位幣三稅額
       apca136 LIKE apca_t.apca136, #本位幣三應稅折抵合計金額
       apca137 LIKE apca_t.apca137, #NO USE
       apca138 LIKE apca_t.apca138, #本位幣三應付金額
       apcaud001 LIKE apca_t.apcaud001, #自定義欄位(文字)001
       apcaud002 LIKE apca_t.apcaud002, #自定義欄位(文字)002
       apcaud003 LIKE apca_t.apcaud003, #自定義欄位(文字)003
       apcaud004 LIKE apca_t.apcaud004, #自定義欄位(文字)004
       apcaud005 LIKE apca_t.apcaud005, #自定義欄位(文字)005
       apcaud006 LIKE apca_t.apcaud006, #自定義欄位(文字)006
       apcaud007 LIKE apca_t.apcaud007, #自定義欄位(文字)007
       apcaud008 LIKE apca_t.apcaud008, #自定義欄位(文字)008
       apcaud009 LIKE apca_t.apcaud009, #自定義欄位(文字)009
       apcaud010 LIKE apca_t.apcaud010, #自定義欄位(文字)010
       apcaud011 LIKE apca_t.apcaud011, #自定義欄位(數字)011
       apcaud012 LIKE apca_t.apcaud012, #自定義欄位(數字)012
       apcaud013 LIKE apca_t.apcaud013, #自定義欄位(數字)013
       apcaud014 LIKE apca_t.apcaud014, #自定義欄位(數字)014
       apcaud015 LIKE apca_t.apcaud015, #自定義欄位(數字)015
       apcaud016 LIKE apca_t.apcaud016, #自定義欄位(數字)016
       apcaud017 LIKE apca_t.apcaud017, #自定義欄位(數字)017
       apcaud018 LIKE apca_t.apcaud018, #自定義欄位(數字)018
       apcaud019 LIKE apca_t.apcaud019, #自定義欄位(數字)019
       apcaud020 LIKE apca_t.apcaud020, #自定義欄位(數字)020
       apcaud021 LIKE apca_t.apcaud021, #自定義欄位(日期時間)021
       apcaud022 LIKE apca_t.apcaud022, #自定義欄位(日期時間)022
       apcaud023 LIKE apca_t.apcaud023, #自定義欄位(日期時間)023
       apcaud024 LIKE apca_t.apcaud024, #自定義欄位(日期時間)024
       apcaud025 LIKE apca_t.apcaud025, #自定義欄位(日期時間)025
       apcaud026 LIKE apca_t.apcaud026, #自定義欄位(日期時間)026
       apcaud027 LIKE apca_t.apcaud027, #自定義欄位(日期時間)027
       apcaud028 LIKE apca_t.apcaud028, #自定義欄位(日期時間)028
       apcaud029 LIKE apca_t.apcaud029, #自定義欄位(日期時間)029
       apcaud030 LIKE apca_t.apcaud030, #自定義欄位(日期時間)030
       apca067 LIKE apca_t.apca067, #管理品類
       apca068 LIKE apca_t.apca068, #經營方式
       apca069 LIKE apca_t.apca069, #no use
       apca070 LIKE apca_t.apca070, #no use
       apca071 LIKE apca_t.apca071, #no use
       apca072 LIKE apca_t.apca072, #no use
       apca073 LIKE apca_t.apca073  #L/C No.
END RECORD
DEFINE l_apcb RECORD  #應付憑單單身
       apcbent LIKE apcb_t.apcbent, #企業編號
       apcbld LIKE apcb_t.apcbld, #帳套
       apcblegl LIKE apcb_t.apcblegl, #核算組織
       apcborga LIKE apcb_t.apcborga, #帳務歸屬組織(來源組織)
       apcbsite LIKE apcb_t.apcbsite, #應付帳務組織
       apcbdocno LIKE apcb_t.apcbdocno, #單號
       apcbseq LIKE apcb_t.apcbseq, #項次
       apcb001 LIKE apcb_t.apcb001, #來源類型
       apcb002 LIKE apcb_t.apcb002, #來源業務單據號碼
       apcb003 LIKE apcb_t.apcb003, #來源業務單據項次
       apcb004 LIKE apcb_t.apcb004, #產品編號
       apcb005 LIKE apcb_t.apcb005, #品名規格
       apcb006 LIKE apcb_t.apcb006, #單位
       apcb007 LIKE apcb_t.apcb007, #計價數量
       apcb008 LIKE apcb_t.apcb008, #參考單據號碼
       apcb009 LIKE apcb_t.apcb009, #參考單據項次
       apcb010 LIKE apcb_t.apcb010, #業務部門
       apcb011 LIKE apcb_t.apcb011, #責任中心
       apcb012 LIKE apcb_t.apcb012, #產品類別
       apcb013 LIKE apcb_t.apcb013, #搭贈
       apcb014 LIKE apcb_t.apcb014, #理由碼
       apcb015 LIKE apcb_t.apcb015, #專案編號
       apcb016 LIKE apcb_t.apcb016, #WBS編號
       apcb017 LIKE apcb_t.apcb017, #預算細項
       apcb018 LIKE apcb_t.apcb018, #专柜编号
       apcb019 LIKE apcb_t.apcb019, #開票性質
       apcb020 LIKE apcb_t.apcb020, #稅別
       apcb021 LIKE apcb_t.apcb021, #費用會計科目
       apcb022 LIKE apcb_t.apcb022, #正負值
       apcb023 LIKE apcb_t.apcb023, #沖暫估單否
       apcb024 LIKE apcb_t.apcb024, #區域
       apcb025 LIKE apcb_t.apcb025, #傳票號碼
       apcb026 LIKE apcb_t.apcb026, #傳票項次
       apcb027 LIKE apcb_t.apcb027, #發票編號
       apcb028 LIKE apcb_t.apcb028, #發票號碼
       apcb029 LIKE apcb_t.apcb029, #應付帳款科目
       apcb030 LIKE apcb_t.apcb030, #付款條件
       apcb032 LIKE apcb_t.apcb032, #訂金序次
       apcb033 LIKE apcb_t.apcb033, #經營方式
       apcb034 LIKE apcb_t.apcb034, #通路
       apcb035 LIKE apcb_t.apcb035, #品牌
       apcb036 LIKE apcb_t.apcb036, #客群
       apcb037 LIKE apcb_t.apcb037, #自由核算項一
       apcb038 LIKE apcb_t.apcb038, #自由核算項二
       apcb039 LIKE apcb_t.apcb039, #自由核算項三
       apcb040 LIKE apcb_t.apcb040, #自由核算項四
       apcb041 LIKE apcb_t.apcb041, #自由核算項五
       apcb042 LIKE apcb_t.apcb042, #自由核算項六
       apcb043 LIKE apcb_t.apcb043, #自由核算項七
       apcb044 LIKE apcb_t.apcb044, #自由核算項八
       apcb045 LIKE apcb_t.apcb045, #自由核算項九
       apcb046 LIKE apcb_t.apcb046, #自由核算項十
       apcb047 LIKE apcb_t.apcb047, #摘要
       apcb048 LIKE apcb_t.apcb048, #來源訂購單號
       apcb049 LIKE apcb_t.apcb049, #開票單號
       apcb050 LIKE apcb_t.apcb050, #開票項次
       apcb051 LIKE apcb_t.apcb051, #業務人員
       apcb100 LIKE apcb_t.apcb100, #交易原幣
       apcb101 LIKE apcb_t.apcb101, #交易原幣單價
       apcb102 LIKE apcb_t.apcb102, #原幣匯率
       apcb103 LIKE apcb_t.apcb103, #交易原幣未稅金額
       apcb104 LIKE apcb_t.apcb104, #交易原幣稅額
       apcb105 LIKE apcb_t.apcb105, #交易原幣含稅金額
       apcb106 LIKE apcb_t.apcb106, #交易幣標準成本金額
       apcb107 LIKE apcb_t.apcb107, #入庫單單價
       apcb108 LIKE apcb_t.apcb108, #交易原幣成本認列金額
       apcb111 LIKE apcb_t.apcb111, #本幣單價
       apcb113 LIKE apcb_t.apcb113, #本幣未稅金額
       apcb114 LIKE apcb_t.apcb114, #本幣稅額
       apcb115 LIKE apcb_t.apcb115, #本幣含稅金額
       apcb116 LIKE apcb_t.apcb116, #本幣標準成本金額
       apcb117 LIKE apcb_t.apcb117, #NO USE
       apcb118 LIKE apcb_t.apcb118, #本幣成本認列金額
       apcb119 LIKE apcb_t.apcb119, #應開發票含稅金額
       apcb121 LIKE apcb_t.apcb121, #本位幣二匯率
       apcb123 LIKE apcb_t.apcb123, #本位幣二未稅金額
       apcb124 LIKE apcb_t.apcb124, #本位幣二稅額
       apcb125 LIKE apcb_t.apcb125, #本位幣二含稅金額
       apcb126 LIKE apcb_t.apcb126, #本幣二標準成本金額
       apcb127 LIKE apcb_t.apcb127, #NO USE
       apcb128 LIKE apcb_t.apcb128, #本位幣二成本認列金額
       apcb131 LIKE apcb_t.apcb131, #本位幣三匯率
       apcb133 LIKE apcb_t.apcb133, #本位幣三未稅金額
       apcb134 LIKE apcb_t.apcb134, #本位幣三稅額
       apcb135 LIKE apcb_t.apcb135, #本位幣三含稅金額
       apcb136 LIKE apcb_t.apcb136, #本幣三標準成本金額
       apcb137 LIKE apcb_t.apcb137, #NO USE
       apcb138 LIKE apcb_t.apcb138, #本位幣三成本認列金額
       apcbud001 LIKE apcb_t.apcbud001, #自定義欄位(文字)001
       apcbud002 LIKE apcb_t.apcbud002, #自定義欄位(文字)002
       apcbud003 LIKE apcb_t.apcbud003, #自定義欄位(文字)003
       apcbud004 LIKE apcb_t.apcbud004, #自定義欄位(文字)004
       apcbud005 LIKE apcb_t.apcbud005, #自定義欄位(文字)005
       apcbud006 LIKE apcb_t.apcbud006, #自定義欄位(文字)006
       apcbud007 LIKE apcb_t.apcbud007, #自定義欄位(文字)007
       apcbud008 LIKE apcb_t.apcbud008, #自定義欄位(文字)008
       apcbud009 LIKE apcb_t.apcbud009, #自定義欄位(文字)009
       apcbud010 LIKE apcb_t.apcbud010, #自定義欄位(文字)010
       apcbud011 LIKE apcb_t.apcbud011, #自定義欄位(數字)011
       apcbud012 LIKE apcb_t.apcbud012, #自定義欄位(數字)012
       apcbud013 LIKE apcb_t.apcbud013, #自定義欄位(數字)013
       apcbud014 LIKE apcb_t.apcbud014, #自定義欄位(數字)014
       apcbud015 LIKE apcb_t.apcbud015, #自定義欄位(數字)015
       apcbud016 LIKE apcb_t.apcbud016, #自定義欄位(數字)016
       apcbud017 LIKE apcb_t.apcbud017, #自定義欄位(數字)017
       apcbud018 LIKE apcb_t.apcbud018, #自定義欄位(數字)018
       apcbud019 LIKE apcb_t.apcbud019, #自定義欄位(數字)019
       apcbud020 LIKE apcb_t.apcbud020, #自定義欄位(數字)020
       apcbud021 LIKE apcb_t.apcbud021, #自定義欄位(日期時間)021
       apcbud022 LIKE apcb_t.apcbud022, #自定義欄位(日期時間)022
       apcbud023 LIKE apcb_t.apcbud023, #自定義欄位(日期時間)023
       apcbud024 LIKE apcb_t.apcbud024, #自定義欄位(日期時間)024
       apcbud025 LIKE apcb_t.apcbud025, #自定義欄位(日期時間)025
       apcbud026 LIKE apcb_t.apcbud026, #自定義欄位(日期時間)026
       apcbud027 LIKE apcb_t.apcbud027, #自定義欄位(日期時間)027
       apcbud028 LIKE apcb_t.apcbud028, #自定義欄位(日期時間)028
       apcbud029 LIKE apcb_t.apcbud029, #自定義欄位(日期時間)029
       apcbud030 LIKE apcb_t.apcbud030, #自定義欄位(日期時間)030
       apcb052 LIKE apcb_t.apcb052, #稅額
       apcb053 LIKE apcb_t.apcb053, #含稅金額
       apcb054 LIKE apcb_t.apcb054, #帳款對象
       apcb055 LIKE apcb_t.apcb055  #付款對象
END RECORD
#161111-00048#4 --e add
DEFINE l_nouse          STRING
DEFINE l_apcb105        LIKE apcb_t.apcb105
DEFINE l_apcc002        LIKE apcc_t.apcc002
DEFINE r_apde014        LIKE apde_t.apde014
DEFINE r_success        LIKE type_t.num5
#151125-00006#2--S
DEFINE l_success         LIKE type_t.num5
DEFINE l_doc_success     LIKE type_t.num5
DEFINE l_slip            LIKE ooba_t.ooba002
DEFINE l_dfin0031        LIKE type_t.chr1
DEFINE l_count           LIKE type_t.num5
#151125-00006#2--E
#160901-00012#1 add ------
DEFINE l_sql             STRING
DEFINE l_ooef019         LIKE ooef_t.ooef019
#160901-00012#1 add end---
#161226-00067#1-----s
DEFINE l_apdesite        LIKE apde_t.apdesite
#161226-00067#1-----e
   
   WHENEVER ERROR CONTINUE   #161226-00067#1
   LET r_success = TRUE
   #單別為空
   IF cl_null(p_apde.apde014) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00532'
      LET g_errparam.extend = s_fin_get_colname('','apdeseq') CLIPPED,p_apde.apdeseq,"/" CLIPPED,s_fin_get_colname('','apde014')
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success,r_apde014
   END IF
   
   #161226-00067#1-----s
   IF cl_null(p_apde.apdesite)THEN
      LET l_apdesite = NULL
      SELECT apcasite INTO l_apdesite FROM apde_t
       WHERE apcaent = g_enterprise
         AND apcald = p_apde.apdeld
         AND apcadocno = p_apde.apdedocno
      IF cl_null(l_apdesite)THEN
         SELECT apdasite INTO l_apdesite FROM apde_t
          WHERE apdaent = g_enterprise
            AND apdald = p_apde.apdeld
            AND apdadocno = p_apde.apdedocno
      END IF
      
      LET p_apde.apdesite = l_apdesite
   END IF
	#161226-00067#1-----e
   
   ###寫入單頭apca_t###
	LET l_apca.apcaent  = g_enterprise
	LET l_apca.apcald   = p_apde.apdeld
	LET l_apca.apcacomp = p_apde.apdecomp
	
   CASE p_apde.apde002
      WHEN '20'
         LET l_apca.apca001  = '24'   #aapq343
         LET l_apca.apca016  = '2A'
         CALL s_aooi200_fin_gen_docno(p_apde.apdeld,'','',p_apde.apde014,p_apde.apdadocdt,'aapq343')
              RETURNING g_sub_success,l_apca.apcadocno
      WHEN '22'
         LET l_apca.apca001  = '19'   #aapt301
         LET l_apca.apca016  = '1A'
         CALL s_aooi200_fin_gen_docno(p_apde.apdeld,'','',p_apde.apde014,p_apde.apdadocdt,'aapt301')
              RETURNING g_sub_success,l_apca.apcadocno
      #albireo 160729 #160428-00001#6-----s
      WHEN '23'
         LET l_apca.apca001  = '23'   #aapq342
         LET l_apca.apca016  = '10'
         CALL s_aooi200_fin_gen_docno(p_apde.apdeld,'','',p_apde.apde014,p_apde.apdadocdt,'aapq342')
              RETURNING g_sub_success,l_apca.apcadocno
      #albireo 160729 #160428-00001#6-----e
   END CASE
   IF NOT g_sub_success THEN LET r_success = FALSE END IF
	
	LET l_apca.apcadocdt = p_apde.apdadocdt
	LET l_apca.apcasite  = p_apde.apdesite
	LET l_apca.apca003   = p_apde.apda003
	LET l_apca.apca004   = p_apde.apda005
	LET l_apca.apca005   = p_apde.apda005
	

	
   #帳款資訊
   CALL s_aap_get_payment_term(l_apca.apcald,l_apca.apcacomp,l_apca.apca004,l_apca.apca001)
        RETURNING g_sub_success,g_errno,l_apca.apca007,l_apca.apca008,l_nouse,
                  l_nouse,l_apca.apca058,l_nouse,l_nouse,l_nouse
   
   #應付款日/票到期日
   LET l_apca.apca009 = p_apde.apdadocdt
   LET l_apca.apca010 = p_apde.apdadocdt
   
   #暫估款預設稅別
   #LET l_apca.apca011  = cl_get_para(g_enterprise,l_apca.apcasite,'S-FIN-2010')
   #160901-00012#1 add ------
   IF p_apde.apde002 = '22' THEN
      #轉第三方稅別取用取同一稅區(aooi610)零稅率的第一筆(oodb008課稅別=2)
      CALL s_tax_get_ooef019(l_apca.apcacomp) RETURNING g_sub_success,l_ooef019
      LET l_sql = "SELECT oodb002",
                  "  FROM oodb_t",
                  " WHERE oodbent = ",g_enterprise,
                  "   AND oodb001 = '",l_ooef019,"'",
                  "   AND oodb008 = '2'",
                  " ORDER BY oodb002"
      PREPARE sel_oodb_p1 FROM l_sql
      DECLARE sel_oodb_c1 SCROLL CURSOR FOR sel_oodb_p1
      OPEN sel_oodb_c1
      FETCH FIRST sel_oodb_c1 INTO l_apca.apca011
   ELSE
   #160901-00012#1 add end---
      LET l_apca.apca011  = cl_get_para(g_enterprise,l_apca.apcasite,'S-FIN-3010')
   END IF #160901-00012#1
   
   #稅別
   CALL s_tax_chk(l_apca.apcacomp,l_apca.apca011)
        RETURNING g_sub_success,l_nouse,l_apca.apca013,l_apca.apca012,l_nouse
   
	LET l_apca.apca014  = p_apde.apde017
	LET l_apca.apca015  = p_apde.apde018
	LET l_apca.apca017  = '1'
	LET l_apca.apca018  = p_apde.apdedocno
	LET l_apca.apca035  = p_apde.apde016
   LET l_apca.apca037  = 'N' 	#產生傳票否
   LET l_apca.apca040  = 'N' 	#留置否
   #關係人否
   SELECT pmaa047 INTO l_apca.apca046 FROM pmaa_t
    WHERE pmaaent = g_enterprise AND pmaa001 = p_apde.apda005
	LET l_apca.apca054  = ''
   LET l_apca.apca057  = p_apde.apda005
	LET l_apca.apca060  = '1'
	LET l_apca.apca100  = p_apde.apde100
	LET l_apca.apca101  = p_apde.apde101
	
	LET l_apca.apca103  = p_apde.apde109
	LET l_apca.apca104  = 0
	LET l_apca.apca106  = 0
	LET l_apca.apca107  = 0
	LET l_apca.apca108  = p_apde.apde109
	
	LET l_apca.apca113  = p_apde.apde119
	LET l_apca.apca114  = 0
	LET l_apca.apca116  = 0
	LET l_apca.apca117  = 0
	LET l_apca.apca118  = p_apde.apde119
	
	LET l_apca.apca121  = 1
	LET l_apca.apca131  = 1
	
	LET l_apca.apcaownid = g_user
	LET l_apca.apcaowndp = g_dept
	LET l_apca.apcacrtid = g_user
	LET l_apca.apcacrtdp = g_dept
	LET l_apca.apcacrtdt = cl_get_current()
	LET l_apca.apcacnfid = g_user
	LET l_apca.apcacnfdt = cl_get_current()
	#LET l_apca.apcastus  = 'Y' #170926-00004#1 mark
	LET l_apca.apcastus  = 'N'  #170926-00004#1 add
	
   INSERT INTO apca_t
              (apcaent,
               apcald,apcacomp,apcadocno,apcadocdt,apcasite,
               apca001,apca003,apca004,apca005,apca007,
               apca008,apca009,apca010,apca058,apca011,
               apca013,apca012,apca014,apca015,apca016,
               apca017,apca018,apca035,apca037,apca040,
               apca046,apca054,apca057,apca060,apca100,
               apca101,apca103,apca104,apca106,apca107,
               apca108,apca113,apca114,apca116,apca117,
               apca118,apca121,apca131,
               apcaownid,apcaowndp,apcacrtid,apcacrtdp,apcacrtdt,
               apcacnfid,apcacnfdt,apcastus
              )
        VALUES(l_apca.apcaent,
               l_apca.apcald,l_apca.apcacomp,l_apca.apcadocno,l_apca.apcadocdt,l_apca.apcasite,
               l_apca.apca001,l_apca.apca003,l_apca.apca004,l_apca.apca005,l_apca.apca007,
               l_apca.apca008,l_apca.apca009,l_apca.apca010,l_apca.apca058,l_apca.apca011,
               l_apca.apca013,l_apca.apca012,l_apca.apca014,l_apca.apca015,l_apca.apca016,
               l_apca.apca017,l_apca.apca018,l_apca.apca035,l_apca.apca037,l_apca.apca040,
               l_apca.apca046,l_apca.apca054,l_apca.apca057,l_apca.apca060,l_apca.apca100,
               l_apca.apca101,l_apca.apca103,l_apca.apca104,l_apca.apca106,l_apca.apca107,
               l_apca.apca108,l_apca.apca113,l_apca.apca114,l_apca.apca116,l_apca.apca117,
               l_apca.apca118,l_apca.apca121,l_apca.apca131,
               l_apca.apcaownid,l_apca.apcaowndp,l_apca.apcacrtid,l_apca.apcacrtdp,l_apca.apcacrtdt,
               l_apca.apcacnfid,l_apca.apcacnfdt,l_apca.apcastus
              )
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins apca_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   ###寫入單身apcb_t###
	LET l_apcb.apcbent  = g_enterprise
	LET l_apcb.apcbld   = l_apca.apcald
	LET l_apcb.apcblegl = l_apca.apcasite
	LET l_apcb.apcborga = l_apca.apcasite
	LET l_apcb.apcbsite = l_apca.apcasite
	
	LET l_apcb.apcbdocno= l_apca.apcadocno
	LET l_apcb.apcbseq  = 1
   LET l_apcb.apcb001  = l_apca.apca016
	LET l_apcb.apcb005  = p_apde.apde002,s_desc_gzcbl004_desc('8506',p_apde.apde002)
	LET l_apcb.apcb007  = 1
	
	LET l_apcb.apcb002  = p_apde.apdedocno
	LET l_apcb.apcb003  = p_apde.apdeseq
	LET l_apcb.apcb020  = l_apca.apca011
	LET l_apcb.apcb022  = s_fin_get_scc_value('8540',l_apcb.apcb001,'4')
	
	LET l_apcb.apcb023  = 'N'
	LET l_apcb.apcb029  = l_apca.apca035
	LET l_apcb.apcb030  = l_apca.apca008
	LET l_apcb.apcb100  = l_apca.apca100
	LET l_apcb.apcb101  = p_apde.apde109
	
	LET l_apcb.apcb102  = l_apca.apca101
	LET l_apcb.apcb103  = p_apde.apde109
	LET l_apcb.apcb104  = 0
	LET l_apcb.apcb105  = p_apde.apde109
	
   #交易單據交易稅明細檔計算及寫入
   IF l_apca.apca013 = 'Y' THEN  #含稅否
      LET l_apcb105 = l_apcb.apcb105
   ELSE
      LET l_apcb105 = l_apcb.apcb103
   END IF
   CALL s_tax_ins(l_apca.apcadocno,l_apcb.apcbseq,'0',l_apcb.apcborga,l_apcb105,
                  l_apcb.apcb020,l_apcb.apcb007,l_apca.apca100,l_apca.apca101,l_apca.apcald,l_apca.apca121,l_apca.apca131)
        RETURNING l_apcb.apcb103,l_apcb.apcb104,l_apcb.apcb105,
                  l_apcb.apcb113,l_apcb.apcb114,l_apcb.apcb115,
                  l_apcb.apcb123,l_apcb.apcb124,l_apcb.apcb125,
                  l_apcb.apcb133,l_apcb.apcb134,l_apcb.apcb135
   
	LET l_apcb.apcb111  = p_apde.apde119
	LET l_apcb.apcb113  = p_apde.apde119
	LET l_apcb.apcb114  = 0
	LET l_apcb.apcb115  = p_apde.apde119
   LET l_apcb.apcb106 = 0
   
   LET l_apcb.apcb107 = 0
   LET l_apcb.apcb108 = 0
   LET l_apcb.apcb116 = 0
   
   #核算項
   LET l_apcb.apcb010 = p_apde.apde018
   LET l_apcb.apcb011 = p_apde.apde019
   LET l_apcb.apcb012 = p_apde.apde020
   LET l_apcb.apcb015 = p_apde.apde022
   LET l_apcb.apcb016 = p_apde.apde023
   
   LET l_apcb.apcb024 = p_apde.apde035
   LET l_apcb.apcb036 = p_apde.apde036
   LET l_apcb.apcb033 = p_apde.apde042
   LET l_apcb.apcb034 = p_apde.apde043
   LET l_apcb.apcb035 = p_apde.apde044
   
   LET l_apcb.apcb037 = p_apde.apde051
   LET l_apcb.apcb038 = p_apde.apde052
   LET l_apcb.apcb039 = p_apde.apde053
   LET l_apcb.apcb040 = p_apde.apde054
   LET l_apcb.apcb041 = p_apde.apde055
   
   LET l_apcb.apcb042 = p_apde.apde056
   LET l_apcb.apcb043 = p_apde.apde057
   LET l_apcb.apcb044 = p_apde.apde058
   LET l_apcb.apcb045 = p_apde.apde059
   LET l_apcb.apcb046 = p_apde.apde060
   LET l_apcb.apcb047 = p_apde.apde010    #170112-00056#1
   INSERT INTO apcb_t
              (apcbent,
               apcbld,apcblegl,apcborga,apcbsite,apcbdocno,
               apcbseq,apcb001,apcb002,apcb003,apcb005,
               apcb007,apcb020,apcb022,apcb023,
               apcb029,apcb030,apcb100,apcb101,apcb102,
               apcb103,apcb104,apcb105,apcb106,apcb107,
               apcb108,apcb111,apcb113,apcb114,apcb115,
               apcb116,apcb010,apcb011,apcb012,apcb015,
               apcb016,apcb024,apcb036,apcb033,apcb034,
               apcb035,apcb037,apcb038,apcb039,apcb040,
               apcb041,apcb042,apcb043,apcb044,apcb045,
               apcb047,   #170112-00056#1
               apcb046,apcb118,apcb128,apcb138)  #增加apcb1*8
        VALUES(l_apcb.apcbent,
               l_apcb.apcbld,l_apcb.apcblegl,l_apcb.apcborga,l_apcb.apcbsite,l_apcb.apcbdocno,
               l_apcb.apcbseq,l_apcb.apcb001,l_apcb.apcb002,l_apcb.apcb003,l_apcb.apcb005,
               l_apcb.apcb007,l_apcb.apcb020,l_apcb.apcb022,l_apcb.apcb023,
               l_apcb.apcb029,l_apcb.apcb030,l_apcb.apcb100,l_apcb.apcb101,l_apcb.apcb102,
               l_apcb.apcb103,l_apcb.apcb104,l_apcb.apcb105,l_apcb.apcb106,l_apcb.apcb107,
               l_apcb.apcb103,l_apcb.apcb111,l_apcb.apcb113,l_apcb.apcb114,l_apcb.apcb115,
               l_apcb.apcb116,l_apcb.apcb010,l_apcb.apcb011,l_apcb.apcb012,l_apcb.apcb015,
               l_apcb.apcb016,l_apcb.apcb024,l_apcb.apcb036,l_apcb.apcb033,l_apcb.apcb034,
               l_apcb.apcb035,l_apcb.apcb037,l_apcb.apcb038,l_apcb.apcb039,l_apcb.apcb040,
               l_apcb.apcb041,l_apcb.apcb042,l_apcb.apcb043,l_apcb.apcb044,l_apcb.apcb045,
               l_apcb.apcb047,   #170112-00056#1 
               l_apcb.apcb046,l_apcb.apcb113,l_apcb.apcb123,l_apcb.apcb133)
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins apcb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   ###寫入一期多帳期apcc_t###
   CALL s_aap_multi_bill_period(l_apca.apcald,l_apca.apcadocno ) RETURNING g_sub_success,g_errno
   IF NOT g_sub_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins apcc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   #回寫應付款別性質、應付款日、票到期日
   SELECT ooib004 INTO l_apcc002        #應付款別性質
     FROM ooib_t
    WHERE ooibent = g_enterprise  AND ooib001 = '1'   #付款
      AND ooib002 = l_apca.apca008  #付款條件
   
   UPDATE apcc_t SET apcc003 = l_apca.apcadocdt,
                     apcc004 = l_apca.apcadocdt,
                     apcc002 = l_apcc002
    WHERE apccent = g_enterprise
      AND apccdocno = l_apca.apcadocno
      AND apccld = l_apca.apcald
    #151125-00006#2--str--
   IF r_success THEN
      LET l_count = 0
      #SELECT COUNT(*) INTO l_count FROM apcb_t          #161114-00009#1 mark
      SELECT COUNT(apcbdocno) INTO l_count FROM apcb_t   #161114-00009#1 add
       WHERE apcbent = g_enterprise
         AND apcbdocno = l_apca.apcadocno
         AND apcbld = l_apca.apcald
      IF cl_null(l_count) THEN LET l_count = 0 END IF
      IF NOT cl_null(l_apca.apcald) AND NOT cl_null(l_apca.apcacomp) AND NOT cl_null(l_apca.apcadocno) AND l_count > 0 THEN
         #170926-00004#1 --s mark
         ##取得單別
         #CALL s_aooi200_fin_get_slip(l_apca.apcadocno) RETURNING l_success,l_slip
         ##取得單別設置的"是否直接審核"參數
         #CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,l_slip,'D-FIN-0031') RETURNING l_dfin0031
         #IF l_dfin0031 = 'Y' THEN
         #170926-00004#1 --e mark
         CALL s_aapt420_contra_doc_immediately_conf(l_apca.apcald,l_apca.apcacomp,l_apca.apcadocno)
              RETURNING r_success
         #END IF #170926-00004#1 mark 
      END IF
   END IF
   #151125-00006#2--end--
   
   LET r_apde014 = l_apca.apcadocno
   
   RETURN r_success,r_apde014
   
END FUNCTION
################################################################################
# Descriptions...: 將付款資料寫進銀存收支檔
# Memo...........:
# Usage..........: CALL s_aapt420_ins_nmbc(p_apde)
#
# Input parameter: p_apde        apde資料
#
# Date & Author..: 14/10/11 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ins_nmbc(p_apde)
DEFINE p_apde           type_g_apde    
DEFINE l_apde017        LIKE apde_t.apde017   #151106
DEFINE l_nmbc           RECORD
  nmbcent      LIKE nmbc_t.nmbcent,
  nmbcownid    LIKE nmbc_t.nmbcownid,
  nmbcowndp    LIKE nmbc_t.nmbcowndp,
  nmbccrtid    LIKE nmbc_t.nmbccrtid,
  nmbccrtdp    LIKE nmbc_t.nmbccrtdp,
  nmbccrtdt    LIKE nmbc_t.nmbccrtdt,
  nmbcmodid    LIKE nmbc_t.nmbcmodid,
  nmbcmoddt    LIKE nmbc_t.nmbcmoddt,
  nmbccnfid    LIKE nmbc_t.nmbccnfid,
  nmbccnfdt    LIKE nmbc_t.nmbccnfdt,
  nmbcpstid    LIKE nmbc_t.nmbcpstid,
  nmbcpstdt    LIKE nmbc_t.nmbcpstdt,
  nmbcstus     LIKE nmbc_t.nmbcstus,
  nmbccomp     LIKE nmbc_t.nmbccomp,
  nmbcsite     LIKE nmbc_t.nmbcsite,
  nmbcdocno    LIKE nmbc_t.nmbcdocno,
  nmbcseq      LIKE nmbc_t.nmbcseq,
  nmbc001      LIKE nmbc_t.nmbc001,
  nmbc002      LIKE nmbc_t.nmbc002,
  nmbc003      LIKE nmbc_t.nmbc003,
  nmbc004      LIKE nmbc_t.nmbc004,
  nmbc005      LIKE nmbc_t.nmbc005,
  nmbc006      LIKE nmbc_t.nmbc006,
  nmbc007      LIKE nmbc_t.nmbc007,
  nmbc008      LIKE nmbc_t.nmbc008, 
  nmbc009      LIKE nmbc_t.nmbc009, 
  nmbc010      LIKE nmbc_t.nmbc010, 
  nmbc011      LIKE nmbc_t.nmbc011,
  nmbc012      LIKE nmbc_t.nmbc012, #151012-00014#6
  nmbc013      LIKE nmbc_t.nmbc013, #151012-00014#6
  nmbc014      LIKE nmbc_t.nmbc014, #151012-00014#6
  nmbc015      LIKE nmbc_t.nmbc015,
  nmbc016      LIKE nmbc_t.nmbc016,
  nmbc017      LIKE nmbc_t.nmbc017, #160202-00021#2
  nmbc100      LIKE nmbc_t.nmbc100, 
  nmbc101      LIKE nmbc_t.nmbc101, 
  nmbc103      LIKE nmbc_t.nmbc103, 
  nmbc113      LIKE nmbc_t.nmbc113, 
  nmbc121      LIKE nmbc_t.nmbc121, 
  nmbc123      LIKE nmbc_t.nmbc123,
  nmbc131      LIKE nmbc_t.nmbc131,
  nmbc133      LIKE nmbc_t.nmbc133,
  nmbcorga     LIKE nmbc_t.nmbcorga    #160322-00025#11 add lujh
                        END RECORD
DEFINE r_success        LIKE type_t.num5
#160517-00001#5--s
DEFINE ls_js         STRING   
DEFINE lc_param      RECORD  
       nmbccomp      LIKE nmbc_t.nmbccomp, 
       nmbcdocno     LIKE nmbc_t.nmbcdocno,
       nmbcseq       LIKE nmbc_t.nmbcseq,  
       nmbc005       LIKE nmbc_t.nmbc005,  
       nmbc006       LIKE nmbc_t.nmbc006,  
       nmbc003       LIKE nmbc_t.nmbc003,  
       nmbc100       LIKE nmbc_t.nmbc100,  
       nmbc101       LIKE nmbc_t.nmbc101,  
       nmbc103       LIKE nmbc_t.nmbc103,  
       nmbc113       LIKE nmbc_t.nmbc113,  
       nmbc121       LIKE nmbc_t.nmbc121,  
       nmbc123       LIKE nmbc_t.nmbc123,  
       nmbc131       LIKE nmbc_t.nmbc131,  
       nmbc133       LIKE nmbc_t.nmbc133,    
       nmbcstus      LIKE nmbc_t.nmbcstus,     
       glbcld        LIKE glbc_t.glbcld,  
       glbcseq1      LIKE glbc_t.glbcseq1, 
       glbc004       LIKE glbc_t.glbc004,  
       glbc010       LIKE glbc_t.glbc010  
END RECORD
#160517-00001#5--e
      LET r_success = TRUE            
      LET l_nmbc.nmbcent = g_enterprise
      LET l_nmbc.nmbccomp= p_apde.apdecomp
      LET l_nmbc.nmbcsite= p_apde.apdesite
      LET l_nmbc.nmbcdocno =p_apde.apdedocno
      LET l_nmbc.nmbcseq = p_apde.apdeseq
      LET l_nmbc.nmbc001 = p_apde.apde001
      LET l_nmbc.nmbc002 = p_apde.apde008
      IF cl_null(l_nmbc.nmbc002) THEN LET l_nmbc.nmbc002 = ' ' END IF
      LET l_nmbc.nmbc003 = p_apde.apde038
      #151106--s      
      IF l_nmbc.nmbc003 = 'EMPL' THEN
         #IF g_prog = 'aapt420' THEN   #170301-00021#1 by 09263 --mark
         IF g_prog MATCHES 'aapt420*' THEN   #170301-00021#1 by 09263 --add
            #如果付款對象是員工,則將付款單身業務人員帶入nmbc004
            SELECT apde017 INTO l_apde017
              FROM apde_t
             WHERE apdeent = g_enterprise
               AND apdeld = p_apde.apdeld
               AND apdedocno = p_apde.apdedocno
               AND apdeseq = p_apde.apdeseq
         ELSE
            #非aapt420之程式,取apca057帶入nmbc004
            SELECT apca057 INTO l_apde017
              FROM apca_t
             WHERE apcaent = g_enterprise
               AND apcald = p_apde.apdeld
               AND apcadocno = p_apde.apdedocno
         END IF
         LET l_nmbc.nmbc004 = l_apde017
      ELSE      
      #151106--e 
         LET l_nmbc.nmbc004 = p_apde.apde038
      END IF   #151106      
      LET l_nmbc.nmbc005 = p_apde.apde032
      LET l_nmbc.nmbc007 = p_apde.apde011
		SELECT nmaj002 INTO l_nmbc.nmbc006
		  FROM nmaj_t
		 WHERE nmajent = g_enterprise
		   AND nmaj001 = l_nmbc.nmbc007 
		LET l_nmbc.nmbc012 = p_apde.apde024    #150818-00032#3 
      LET l_nmbc.nmbc013 = p_apde.apde021    #150818-00032#3   
      LET l_nmbc.nmbc014 = p_apde.apde032    #151012-00014#6
      LET l_nmbc.nmbc015 = p_apde.apde039    #151012-00014#6
      LET l_nmbc.nmbc016 = p_apde.apde040    #151012-00014#6
      LET l_nmbc.nmbc017 = p_apde.apde041    #160202-00021#2
      LET l_nmbc.nmbc100 = p_apde.apde100
      LET l_nmbc.nmbc101 = p_apde.apde101
      LET l_nmbc.nmbc103 = p_apde.apde109
      LET l_nmbc.nmbc113 = p_apde.apde119      
      LET l_nmbc.nmbc121 = 1
      LET l_nmbc.nmbc123 = 0
      LET l_nmbc.nmbc131 = 1
      LET l_nmbc.nmbc133 = 0      
      
      LET l_nmbc.nmbcownid = g_user
      LET l_nmbc.nmbcowndp = g_dept
      LET l_nmbc.nmbccrtid = g_user
      LET l_nmbc.nmbccrtdp = g_dept
      LET l_nmbc.nmbccrtdt = cl_get_current()
      LET l_nmbc.nmbccnfid = g_user
      LET l_nmbc.nmbccnfdt = cl_get_current()
      LET l_nmbc.nmbcpstid = g_user
      LET l_nmbc.nmbcpstdt = p_apde.apde032      
      LET l_nmbc.nmbcstus = 'Y'      
      LET l_nmbc.nmbcorga = p_apde.apdeorga       #160322-00025#11 add lujh
      
      INSERT INTO nmbc_t
                 (nmbcent,
                  nmbccomp,nmbcsite,nmbcdocno,nmbcseq,
                  nmbc001,nmbc002,nmbc003,nmbc004,nmbc005,
                  nmbc006,nmbc007,nmbc100,nmbc101,nmbc103,
                  nmbc012,nmbc013,nmbc014,nmbc015,nmbc016,    #151012-00014#6 add nmbc014~nmbc016
                  nmbc017,                                    #160202-00021#2 add nmbc017
                  nmbc113,nmbc121,nmbc123,nmbc131,nmbc133,
                  nmbcownid,nmbcowndp,nmbccrtid,nmbccrtdp,nmbccrtdt,
                  nmbccnfid,nmbccnfdt,nmbcpstid,nmbcpstdt,nmbcstus,nmbcorga)   #160322-00025#11 add nmbcorga lujh

           VALUES(l_nmbc.nmbcent,
                  l_nmbc.nmbccomp,l_nmbc.nmbcsite,l_nmbc.nmbcdocno,l_nmbc.nmbcseq,
                  l_nmbc.nmbc001,l_nmbc.nmbc002,l_nmbc.nmbc003,l_nmbc.nmbc004,l_nmbc.nmbc005,
                  l_nmbc.nmbc006,l_nmbc.nmbc007,l_nmbc.nmbc100,l_nmbc.nmbc101,l_nmbc.nmbc103,
                  l_nmbc.nmbc012,l_nmbc.nmbc013,l_nmbc.nmbc014,l_nmbc.nmbc015,l_nmbc.nmbc016,   #151012-00014#6 add nmbc014~nmbc016
                  l_nmbc.nmbc017,                                                               #160202-00021#2 add nmbc017
                  l_nmbc.nmbc113,l_nmbc.nmbc121,l_nmbc.nmbc123,l_nmbc.nmbc131,l_nmbc.nmbc133,
                  l_nmbc.nmbcownid,l_nmbc.nmbcowndp,l_nmbc.nmbccrtid,l_nmbc.nmbccrtdp,l_nmbc.nmbccrtdt,
                  l_nmbc.nmbccnfid,l_nmbc.nmbccnfdt,l_nmbc.nmbcpstid,l_nmbc.nmbcpstdt,l_nmbc.nmbcstus,
                  l_nmbc.nmbcorga)          #160322-00025#11 add l_nmbc.nmbcorga lujh
                  
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins nmbc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      #160517-00001#5--s
      #將nmbc寫入一筆glbc
      LET lc_param.nmbccomp  = l_nmbc.nmbccomp    
      LET lc_param.nmbcdocno = l_nmbc.nmbcdocno   
      LET lc_param.nmbcseq   = l_nmbc.nmbcseq     
      LET lc_param.nmbc005   = l_nmbc.nmbc005     
      LET lc_param.nmbc006   = l_nmbc.nmbc006     
      LET lc_param.nmbc003   = l_nmbc.nmbc003     
      LET lc_param.nmbc100   = l_nmbc.nmbc100     
      LET lc_param.nmbc101   = l_nmbc.nmbc101     
      LET lc_param.nmbc103   = l_nmbc.nmbc103     
      LET lc_param.nmbc113   = l_nmbc.nmbc113     
      LET lc_param.nmbc121   = l_nmbc.nmbc121     
      LET lc_param.nmbc123   = l_nmbc.nmbc123     
      LET lc_param.nmbc131   = l_nmbc.nmbc131     
      LET lc_param.nmbc133   = l_nmbc.nmbc133     
      LET lc_param.nmbcstus  = l_nmbc.nmbcstus   
      LET lc_param.glbcld    = p_apde.apdeld  
      LET lc_param.glbcseq1  = '1'  
      LET lc_param.glbc004   = p_apde.apde012  
      LET lc_param.glbc010   = '2'
      LET ls_js = util.JSON.stringify(lc_param)
      CALL s_aapt420_ins_glbc(ls_js) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF
      #160517-00001#5--e
      RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 將付款資料寫進應付票據檔
# Memo...........:
# Usage..........: CALL s_aapt420_ins_nmck(p_apde)
#
# Input parameter: p_apde        apde資料
#
# Date & Author..: 14/10/11 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ins_nmck(p_apde)
DEFINE p_apde           type_g_apde   
DEFINE l_nmck           RECORD
   nmckent           LIKE nmck_t.nmckent,
   nmckcomp          LIKE nmck_t.nmckcomp,
   nmckdocno         LIKE nmck_t.nmckdocno,
   nmckdocdt         LIKE nmck_t.nmckdocdt,
   nmcksite          LIKE nmck_t.nmcksite,
   nmck001           LIKE nmck_t.nmck001,
   nmck002           LIKE nmck_t.nmck002,
   nmck003           LIKE nmck_t.nmck003,
   nmck004           LIKE nmck_t.nmck004,
   nmck005           LIKE nmck_t.nmck005,
   nmck006           LIKE nmck_t.nmck006,
   nmck007           LIKE nmck_t.nmck007,
   nmck008           LIKE nmck_t.nmck008,
   nmck009           LIKE nmck_t.nmck009,
   nmck010           LIKE nmck_t.nmck010,
   nmck011           LIKE nmck_t.nmck011,
   nmck012           LIKE nmck_t.nmck012,
   nmck013           LIKE nmck_t.nmck013,
   nmck014           LIKE nmck_t.nmck014,
   nmck015           LIKE nmck_t.nmck015,
   nmck016           LIKE nmck_t.nmck016,
   nmck017           LIKE nmck_t.nmck017,
   nmck018           LIKE nmck_t.nmck018,
   nmck019           LIKE nmck_t.nmck019,
   nmck020           LIKE nmck_t.nmck020,
   nmck021           LIKE nmck_t.nmck021,
   nmck022           LIKE nmck_t.nmck022,
   nmck023           LIKE nmck_t.nmck023,
   nmck024           LIKE nmck_t.nmck024,
   nmck025           LIKE nmck_t.nmck025,
   nmck026           LIKE nmck_t.nmck026,
   nmck027           LIKE nmck_t.nmck027,
   nmck028           LIKE nmck_t.nmck028,
   nmck029           LIKE nmck_t.nmck029,
   nmck030           LIKE nmck_t.nmck030,
   nmck031           LIKE nmck_t.nmck031,
   nmck032           LIKE nmck_t.nmck032,
   nmck033           LIKE nmck_t.nmck033,
   nmck034           LIKE nmck_t.nmck034,
   nmck035           LIKE nmck_t.nmck035,
   nmck036           LIKE nmck_t.nmck036,
   nmck100           LIKE nmck_t.nmck100,
   nmck101           LIKE nmck_t.nmck101,
   nmck103           LIKE nmck_t.nmck103,
   nmck113           LIKE nmck_t.nmck113,
   nmck114           LIKE nmck_t.nmck114,
   nmck121           LIKE nmck_t.nmck121,
   nmck124           LIKE nmck_t.nmck124,
   nmck123           LIKE nmck_t.nmck123,
   nmck131           LIKE nmck_t.nmck131,
   nmck133           LIKE nmck_t.nmck133,
   nmck134           LIKE nmck_t.nmck134,
   nmckstus          LIKE nmck_t.nmckstus,
   nmckownid         LIKE nmck_t.nmckownid,
   nmckowndp         LIKE nmck_t.nmckowndp,
   nmckcrtid         LIKE nmck_t.nmckcrtid,
   nmckcrtdp         LIKE nmck_t.nmckcrtdp,
   nmckcrtdt         LIKE nmck_t.nmckcrtdt,
   nmckmodid         LIKE nmck_t.nmckmodid,
   nmckmoddt         LIKE nmck_t.nmckmoddt,
   nmckcnfid         LIKE nmck_t.nmckcnfid,
   nmckcnfdt         LIKE nmck_t.nmckcnfdt 
                        END RECORD
DEFINE l_nmcl           RECORD
   nmclent     LIKE nmcl_t.nmclent,
   nmclcomp    LIKE nmcl_t.nmclcomp,
   nmcldocno   LIKE nmcl_t.nmcldocno,
   nmclseq     LIKE nmcl_t.nmclseq,
   nmclorga    LIKE nmcl_t.nmclorga,
   nmcl001     LIKE nmcl_t.nmcl001,
   nmcl002     LIKE nmcl_t.nmcl002,
   nmcl003     LIKE nmcl_t.nmcl003,
   nmcl103     LIKE nmcl_t.nmcl103,
   nmcl113     LIKE nmcl_t.nmcl113,
   nmcl121     LIKE nmcl_t.nmcl121,
   nmcl123     LIKE nmcl_t.nmcl123,
   nmcl131     LIKE nmcl_t.nmcl131,
   nmcl133     LIKE nmcl_t.nmcl133  
                        END RECORD
DEFINE r_success        LIKE type_t.num5
DEFINE l_apaa004        LIKE apaa_t.apaa004  #170620-00025#1 add
DEFINE l_apda005        LIKE apda_t.apda005  #170930-00038#1 add


      LET r_success = TRUE
      #寫入應付票據單頭nmck_t
      LET l_nmck.nmckent  = g_enterprise
      
      LET l_nmck.nmckcomp = p_apde.apdecomp
      #170620-00025#1 --s add
      IF p_apde.apde006 = '20' THEN #20:銀行電匯款
         CALL s_aooi200_fin_gen_docno(p_apde.apdeld,'','',p_apde.apde014,p_apde.apde032,'anmt460')
                  RETURNING g_sub_success,l_nmck.nmckdocno
      ELSE
      #170620-00025#1 --e add
      CALL s_aooi200_fin_gen_docno(p_apde.apdeld,'','',p_apde.apde014,p_apde.apde032,'anmt440')
                     RETURNING g_sub_success,l_nmck.nmckdocno
      END IF #170620-00025#1 add
      IF NOT g_sub_success THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-00003'
         LET g_errparam.extend = l_nmck.nmckdocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      LET l_nmck.nmckdocdt= p_apde.apdadocdt
      LET l_nmck.nmcksite = p_apde.apdesite
      LET l_nmck.nmck001 = 'AP'     #應付請款單  
      
      LET l_nmck.nmck002 = p_apde.apde021
      LET l_nmck.nmck003 = p_apde.apda003
      LET l_nmck.nmck004 = p_apde.apde008
      #LET l_nmck.nmck005 = p_apde.apde038 #170930-00038#1 mark
      
      #170930-00038#1 --s add
      #付款對象
      LET l_apda005 = '' 
      SELECT apda005 INTO l_apda005 
        FROM apda_t 
       WHERE apdaent = g_enterprise AND apdald = p_apde.apdeld AND apdadocno = p_apde.apdedocno
       
      LET l_nmck.nmck005 = l_apda005
      #170930-00038#1 --e add
      
      LET l_nmck.nmck006 = p_apde.apde038
      
      LET l_nmck.nmck007 = '0'     #0:批次產生   #1:人工產生
      LET l_nmck.nmck008 = ''      
      LET l_nmck.nmck009 = p_apde.apde011
      LET l_nmck.nmck010 = p_apde.apde012
      LET l_nmck.nmck011 = p_apde.apde032
      
      LET l_nmck.nmck012 = p_apde.apde032
      LET l_nmck.nmck013 = p_apde.apde039
      LET l_nmck.nmck014 = p_apde.apde040
      LET l_nmck.nmck015 = p_apde.apde041
      LET l_nmck.nmck017 = ''   #IBAN
      
      LET l_nmck.nmck018 = ''   #SWIFT
      LET l_nmck.nmck019 = p_apde.apdedocno
      LET l_nmck.nmck023 = p_apde.apde006
      #161221-00046#1---add--str--
      IF NOT cl_null(p_apde.apde024) THEN
         LET l_nmck.nmck025 = p_apde.apde024
      END IF
      #161221-00046#1---add---end--
      LET l_nmck.nmck026 = '0' 
      LET l_nmck.nmck027 = 'Y'
      
      LET l_nmck.nmck028 = 0
      LET l_nmck.nmck029 = 0
      LET l_nmck.nmck031 = 0
      LET l_nmck.nmck034 = '1' 
     
      LET l_nmck.nmck100 = p_apde.apde100   #幣別  
                          
      LET l_nmck.nmck101 = p_apde.apde101   #匯率
      LET l_nmck.nmck103 = p_apde.apde109 
      LET l_nmck.nmck113 = p_apde.apde119      
      LET l_nmck.nmck114 = p_apde.apde119     
      LET l_nmck.nmckownid = g_user
      
      LET l_nmck.nmckowndp = g_dept
      LET l_nmck.nmckcrtid = g_user
      LET l_nmck.nmckcrtdp = g_dept
      LET l_nmck.nmckcrtdt = cl_get_current()
      LET l_nmck.nmckstus = 'N'
      
      #170620-00025#1 --s add
      IF p_apde.apde006 = '20' THEN  #20:銀行電匯款
         LET l_nmck.nmck008 = '2'    #受款人支付手續費
         LET l_nmck.nmck012 = ''        
         LET l_nmck.nmck026 = '10'   #應付匯款單開立   
         
         LET l_apaa004 = ''
         SELECT apaa004 INTO l_apaa004
           FROM apaa_t
          WHERE apaaent = g_enterprise
            AND apaasite = l_nmck.nmcksite
            AND apaa001 = l_nmck.nmck005
            AND apaa002 = '1'
            AND apaastus = 'Y'
         IF NOT cl_null(l_apaa004) THEN
            LET l_nmck.nmck034 = l_apaa004
         ELSE         
            LET l_nmck.nmck034 = '2'    
         END IF            
      END IF
      LET l_nmck.nmckstus = 'Y'
      #170620-00025#1 --e add      
      
      INSERT INTO nmck_t
                 (nmckent,
                  nmckcomp,nmckdocno,nmckdocdt,nmcksite,nmck001,
                  nmck002,nmck003,nmck004,nmck005,nmck006,
                  nmck007,nmck008,nmck009,nmck010,nmck011,
                  nmck012,nmck013,nmck014,nmck015,nmck017,
                  nmck018,nmck019,nmck023,nmck026,nmck027,
                  nmck028,nmck029,nmck031,nmck034,nmck100,      
                  nmck101,nmck103,nmck113,nmck114,nmckownid,
                  #nmckowndp,nmckcrtid,nmckcrtdp,nmckcrtdt,nmckstus)   #161221-00046#1 mark
                  nmckowndp,nmckcrtid,nmckcrtdp,nmckcrtdt,nmckstus,    #161221-00046#1 add
                  nmck025)                                             #161221-00046#1 add

           VALUES(l_nmck.nmckent,
                  l_nmck.nmckcomp,l_nmck.nmckdocno,l_nmck.nmckdocdt,l_nmck.nmcksite,l_nmck.nmck001,
                  l_nmck.nmck002,l_nmck.nmck003,l_nmck.nmck004,l_nmck.nmck005,l_nmck.nmck006,
                  l_nmck.nmck007,l_nmck.nmck008,l_nmck.nmck009,l_nmck.nmck010,l_nmck.nmck011,
                  l_nmck.nmck012,l_nmck.nmck013,l_nmck.nmck014,l_nmck.nmck015,l_nmck.nmck017,
                  l_nmck.nmck018,l_nmck.nmck019,l_nmck.nmck023,l_nmck.nmck026,l_nmck.nmck027,
                  l_nmck.nmck028,l_nmck.nmck029,l_nmck.nmck031,l_nmck.nmck034,l_nmck.nmck100,      
                  l_nmck.nmck101,l_nmck.nmck103,l_nmck.nmck113,l_nmck.nmck114,l_nmck.nmckownid,
                  #l_nmck.nmckowndp,l_nmck.nmckcrtid,l_nmck.nmckcrtdp,l_nmck.nmckcrtdt,l_nmck.nmckstus)  #161221-00046#1 mark
                  l_nmck.nmckowndp,l_nmck.nmckcrtid,l_nmck.nmckcrtdp,l_nmck.nmckcrtdt,l_nmck.nmckstus,   #161221-00046#1 add
                  l_nmck.nmck025)                                                                        #161221-00046#1 add   
                  
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins nmck_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      #寫入應付票據單身nmcl_t
      LET l_nmcl.nmclent =	l_nmck.nmckent
      
      LET l_nmcl.nmclcomp = l_nmck.nmckcomp
      LET l_nmcl.nmcldocno	= l_nmck.nmckdocno
      LET l_nmcl.nmclseq =	1	
      LET l_nmcl.nmclorga = p_apde.apdeorga	
      LET l_nmcl.nmcl001 =	p_apde.apdedocno	
      
      LET l_nmcl.nmcl002 =	p_apde.apdeseq	
      LET l_nmcl.nmcl103 =	p_apde.apde109
      LET l_nmcl.nmcl113 =	p_apde.apde119
      LET l_nmcl.nmcl121 =	1	
      LET l_nmcl.nmcl123 =	0	
      
      LET l_nmcl.nmcl131 =	1	
      LET l_nmcl.nmcl133 =	0	
      LET l_nmcl.nmcl003 =	p_apde.apde016 #161222-00030#1 add
      
      INSERT INTO nmcl_t
                 (nmclent,
                  nmclcomp,nmcldocno,nmclseq,nmclorga,nmcl001,
                  nmcl002,nmcl103,nmcl113,nmcl121,nmcl123,
                  nmcl131,nmcl133,nmcl003)  #161222-00030#1 add nmcl003

           VALUES(l_nmcl.nmclent,
                  l_nmcl.nmclcomp,l_nmcl.nmcldocno,l_nmcl.nmclseq,l_nmcl.nmclorga,l_nmcl.nmcl001,
                  l_nmcl.nmcl002,l_nmcl.nmcl103,l_nmcl.nmcl113,l_nmcl.nmcl121,l_nmcl.nmcl123,
                  l_nmcl.nmcl131,l_nmcl.nmcl133,l_nmcl.nmcl003)  #161222-00030#1 add l_nmcl.nmcl003      
                  
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins nmcl_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
      
      ###3.回寫收支付款單號+項次###
      UPDATE apde_t SET apde003 = l_nmcl.nmcldocno,apde004 = l_nmcl.nmclseq
       WHERE apdeent = g_enterprise
         AND apdedocno = p_apde.apdedocno
         AND apdeld = p_apde.apdeld
         AND apdeseq = p_apde.apdeseq    
         
      RETURN r_success
      
END FUNCTION

################################################################################
# Descriptions...: 產生應收單
# Memo...........:
# Usage..........: CALL s_aapt420_create_contra_doc2(p_apde)
#                  RETURNING r_apde014
# Input parameter: p_apde       付款單資訊
# Date & Author..: 14/10/20 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_create_contra_doc2(p_apde)
DEFINE p_apde           type_g_apde2
DEFINE l_xrca           RECORD
   xrcaent      LIKE xrca_t.xrcaent,
   xrcaownid    LIKE xrca_t.xrcaownid,
   xrcaowndp    LIKE xrca_t.xrcaowndp,
   xrcacrtid    LIKE xrca_t.xrcacrtid,
   xrcacrtdp    LIKE xrca_t.xrcacrtdp,
   xrcacrtdt    LIKE xrca_t.xrcacrtdt,
   xrcamodid    LIKE xrca_t.xrcamodid,
   xrcamoddt    LIKE xrca_t.xrcamoddt,
   xrcacnfid    LIKE xrca_t.xrcacnfid,
   xrcacnfdt    LIKE xrca_t.xrcacnfdt,
   xrcapstid    LIKE xrca_t.xrcapstid,
   xrcapstdt    LIKE xrca_t.xrcapstdt,
   xrcastus     LIKE xrca_t.xrcastus ,
   xrcacomp     LIKE xrca_t.xrcacomp ,
   xrcald       LIKE xrca_t.xrcald   ,
   xrcadocno    LIKE xrca_t.xrcadocno,
   xrcadocdt    LIKE xrca_t.xrcadocdt,
   xrca001      LIKE xrca_t.xrca001,
   xrcasite     LIKE xrca_t.xrcasite,
   xrca003      LIKE xrca_t.xrca003,
   xrca004      LIKE xrca_t.xrca004,
   xrca005      LIKE xrca_t.xrca005,
   xrca006      LIKE xrca_t.xrca006,
   xrca007      LIKE xrca_t.xrca007,
   xrca008      LIKE xrca_t.xrca008,
   xrca009      LIKE xrca_t.xrca009,
   xrca010      LIKE xrca_t.xrca010,
   xrca011      LIKE xrca_t.xrca011,
   xrca012      LIKE xrca_t.xrca012,
   xrca013      LIKE xrca_t.xrca013,
   xrca014      LIKE xrca_t.xrca014,
   xrca015      LIKE xrca_t.xrca015,
   xrca016      LIKE xrca_t.xrca016,
   xrca017      LIKE xrca_t.xrca017,
   xrca018      LIKE xrca_t.xrca018,
   xrca019      LIKE xrca_t.xrca019,
   xrca020      LIKE xrca_t.xrca020,
   xrca021      LIKE xrca_t.xrca021,
   xrca022      LIKE xrca_t.xrca022,
   xrca023      LIKE xrca_t.xrca023,
   xrca024      LIKE xrca_t.xrca024,
   xrca025      LIKE xrca_t.xrca025,
   xrca026      LIKE xrca_t.xrca026,
   xrca028      LIKE xrca_t.xrca028,
   xrca029      LIKE xrca_t.xrca029,
   xrca030      LIKE xrca_t.xrca030,
   xrca031      LIKE xrca_t.xrca031,
   xrca032      LIKE xrca_t.xrca032,
   xrca033      LIKE xrca_t.xrca033,
   xrca034      LIKE xrca_t.xrca034,
   xrca035      LIKE xrca_t.xrca035,
   xrca036      LIKE xrca_t.xrca036,
   xrca037      LIKE xrca_t.xrca037,
   xrca038      LIKE xrca_t.xrca038,
   xrca039      LIKE xrca_t.xrca039,
   xrca040      LIKE xrca_t.xrca040,
   xrca041      LIKE xrca_t.xrca041,
   xrca042      LIKE xrca_t.xrca042,
   xrca043      LIKE xrca_t.xrca043,
   xrca044      LIKE xrca_t.xrca044,
   xrca045      LIKE xrca_t.xrca045,
   xrca046      LIKE xrca_t.xrca046,
   xrca047      LIKE xrca_t.xrca047,
   xrca048      LIKE xrca_t.xrca048,
   xrca049      LIKE xrca_t.xrca049,
   xrca050      LIKE xrca_t.xrca050,
   xrca051      LIKE xrca_t.xrca051,
   xrca052      LIKE xrca_t.xrca052,
   xrca053      LIKE xrca_t.xrca053,
   xrca054      LIKE xrca_t.xrca054,
   xrca055      LIKE xrca_t.xrca055,
   xrca056      LIKE xrca_t.xrca056,
   xrca057      LIKE xrca_t.xrca057,
   xrca058      LIKE xrca_t.xrca058,
   xrca059      LIKE xrca_t.xrca059,
   xrca060      LIKE xrca_t.xrca060,
   xrca061      LIKE xrca_t.xrca061,
   xrca062      LIKE xrca_t.xrca062,
   xrca063      LIKE xrca_t.xrca063,
   xrca064      LIKE xrca_t.xrca064,
   xrca065      LIKE xrca_t.xrca065,
   xrca066      LIKE xrca_t.xrca066,
   xrca100      LIKE xrca_t.xrca100,
   xrca101      LIKE xrca_t.xrca101,
   xrca103      LIKE xrca_t.xrca103,
   xrca104      LIKE xrca_t.xrca104,
   xrca106      LIKE xrca_t.xrca106,
   xrca107      LIKE xrca_t.xrca107,
   xrca108      LIKE xrca_t.xrca108,
   xrca113      LIKE xrca_t.xrca113,
   xrca114      LIKE xrca_t.xrca114,
   xrca116      LIKE xrca_t.xrca116,
   xrca117      LIKE xrca_t.xrca117,
   xrca118      LIKE xrca_t.xrca118,
   xrca120      LIKE xrca_t.xrca120,
   xrca121      LIKE xrca_t.xrca121,
   xrca123      LIKE xrca_t.xrca123,
   xrca124      LIKE xrca_t.xrca124,
   xrca126      LIKE xrca_t.xrca126,
   xrca127      LIKE xrca_t.xrca127,
   xrca128      LIKE xrca_t.xrca128,
   xrca130      LIKE xrca_t.xrca130,
   xrca131      LIKE xrca_t.xrca131,
   xrca133      LIKE xrca_t.xrca133,
   xrca134      LIKE xrca_t.xrca134,
   xrca136      LIKE xrca_t.xrca136,
   xrca137      LIKE xrca_t.xrca137,
   xrca138      LIKE xrca_t.xrca138    
                        END RECORD
DEFINE l_xrcb           RECORD 
   xrcbent        LIKE xrcb_t.xrcbent,    
   xrcbld         LIKE xrcb_t.xrcbld,     
   xrcbdocno      LIKE xrcb_t.xrcbdocno,  
   xrcbseq        LIKE xrcb_t.xrcbseq,    
   xrcbsite       LIKE xrcb_t.xrcbsite,   
   xrcborga       LIKE xrcb_t.xrcborga,  
   xrcb001        LIKE xrcb_t.xrcb001,    
   xrcb002        LIKE xrcb_t.xrcb002,    
   xrcb003        LIKE xrcb_t.xrcb003,    
   xrcb004        LIKE xrcb_t.xrcb004,    
   xrcb005        LIKE xrcb_t.xrcb005,    
   xrcb006        LIKE xrcb_t.xrcb006,    
   xrcb007        LIKE xrcb_t.xrcb007,    
   xrcb008        LIKE xrcb_t.xrcb008,    
   xrcb009        LIKE xrcb_t.xrcb009,    
   xrcblegl       LIKE xrcb_t.xrcblegl,   
   xrcb010        LIKE xrcb_t.xrcb010,    
   xrcb011        LIKE xrcb_t.xrcb011,    
   xrcb012        LIKE xrcb_t.xrcb012,    
   xrcb013        LIKE xrcb_t.xrcb013,    
   xrcb014        LIKE xrcb_t.xrcb014,    
   xrcb015        LIKE xrcb_t.xrcb015,    
   xrcb016        LIKE xrcb_t.xrcb016,    
   xrcb017        LIKE xrcb_t.xrcb017,    
   xrcb018        LIKE xrcb_t.xrcb018,    
   xrcb019        LIKE xrcb_t.xrcb019,    
   xrcb020        LIKE xrcb_t.xrcb020,    
   xrcb021        LIKE xrcb_t.xrcb021,    
   xrcb022        LIKE xrcb_t.xrcb022,    
   xrcb023        LIKE xrcb_t.xrcb023,    
   xrcb024        LIKE xrcb_t.xrcb024,    
   xrcb025        LIKE xrcb_t.xrcb025,    
   xrcb026        LIKE xrcb_t.xrcb026,    
   xrcb027        LIKE xrcb_t.xrcb027,    
   xrcb028        LIKE xrcb_t.xrcb028,    
   xrcb029        LIKE xrcb_t.xrcb029,    
   xrcb030        LIKE xrcb_t.xrcb030,    
   xrcb031        LIKE xrcb_t.xrcb031,    
   xrcb032        LIKE xrcb_t.xrcb032,    
   xrcb033        LIKE xrcb_t.xrcb033,    
   xrcb034        LIKE xrcb_t.xrcb034,    
   xrcb035        LIKE xrcb_t.xrcb035,    
   xrcb036        LIKE xrcb_t.xrcb036,    
   xrcb037        LIKE xrcb_t.xrcb037,    
   xrcb038        LIKE xrcb_t.xrcb038,    
   xrcb039        LIKE xrcb_t.xrcb039,    
   xrcb040        LIKE xrcb_t.xrcb040,    
   xrcb041        LIKE xrcb_t.xrcb041,    
   xrcb042        LIKE xrcb_t.xrcb042,    
   xrcb043        LIKE xrcb_t.xrcb043,    
   xrcb044        LIKE xrcb_t.xrcb044,    
   xrcb045        LIKE xrcb_t.xrcb045,    
   xrcb046        LIKE xrcb_t.xrcb046,    
   xrcb047        LIKE xrcb_t.xrcb047,    
   xrcb048        LIKE xrcb_t.xrcb048,    
   xrcb049        LIKE xrcb_t.xrcb049,    
   xrcb050        LIKE xrcb_t.xrcb050,    
   xrcb051        LIKE xrcb_t.xrcb051,    
   xrcb100        LIKE xrcb_t.xrcb100,    
   xrcb101        LIKE xrcb_t.xrcb101,    
   xrcb102        LIKE xrcb_t.xrcb102,    
   xrcb103        LIKE xrcb_t.xrcb103,    
   xrcb104        LIKE xrcb_t.xrcb104,    
   xrcb105        LIKE xrcb_t.xrcb105,    
   xrcb106        LIKE xrcb_t.xrcb106,    
   xrcb111        LIKE xrcb_t.xrcb111,    
   xrcb113        LIKE xrcb_t.xrcb113,    
   xrcb114        LIKE xrcb_t.xrcb114,    
   xrcb115        LIKE xrcb_t.xrcb115,    
   xrcb116        LIKE xrcb_t.xrcb116,    
   xrcb117        LIKE xrcb_t.xrcb117,    
   xrcb118        LIKE xrcb_t.xrcb118,    
   xrcb119        LIKE xrcb_t.xrcb119,    
   xrcb121        LIKE xrcb_t.xrcb121,    
   xrcb123        LIKE xrcb_t.xrcb123,    
   xrcb124        LIKE xrcb_t.xrcb124,    
   xrcb125        LIKE xrcb_t.xrcb125,    
   xrcb126        LIKE xrcb_t.xrcb126,    
   xrcb131        LIKE xrcb_t.xrcb131,    
   xrcb133        LIKE xrcb_t.xrcb133,    
   xrcb134        LIKE xrcb_t.xrcb134,    
   xrcb135        LIKE xrcb_t.xrcb135,    
   xrcb136        LIKE xrcb_t.xrcb136   
                        END RECORD
DEFINE l_nouse          STRING
DEFINE l_xrcb105        LIKE xrcb_t.xrcb105
DEFINE r_apde014        LIKE apde_t.apde014
DEFINE r_success        LIKE type_t.num5
#151125-00006#2--S
DEFINE l_success         LIKE type_t.num5
DEFINE l_doc_success     LIKE type_t.num5
DEFINE l_slip            LIKE ooba_t.ooba002
DEFINE l_dfin0031        LIKE type_t.chr1
DEFINE l_count           LIKE type_t.num5
#151125-00006#2--E
#171010-00013#1----add----str
DEFINE l_apda010     LIKE apda_t.apda010
DEFINE l_ooef019     LIKE ooef_t.ooef019 
DEFINE l_oodb002     LIKE oodb_t.oodb002
DEFINE l_apaf019     LIKE apaf_t.apaf019
#171010-00013#1----add----end

   LET r_success = TRUE
   ###寫入單頭xrca_t###
	LET l_xrca.xrcaent   = g_enterprise          
	LET l_xrca.xrcald    = p_apde.apdeld           
	LET l_xrca.xrcacomp  = p_apde.apdecomp      
   LET l_xrca.xrca001  = '19'   #axrt330
   LET l_xrca.xrca016  = '1B'    
   CALL s_aooi200_fin_gen_docno(p_apde.apdeld,'','',p_apde.apde014,p_apde.apdadocdt,'axrt330') 
                 RETURNING g_sub_success,l_xrca.xrcadocno         
   IF NOT g_sub_success THEN LET r_success = FALSE END IF	
	LET l_xrca.xrcadocdt = p_apde.apdadocdt        
	LET l_xrca.xrcasite  = p_apde.apdesite  
       
	LET l_xrca.xrca003   = p_apde.apda003          
	LET l_xrca.xrca004   = p_apde.apda005          
	LET l_xrca.xrca005   = p_apde.apda005     
   #帳款資訊
   #CALL s_apmm101_sel_pmab(l_xrca.xrcacomp,l_xrca.xrca004,'pmab055|pmab037|pmab039')   #161209-00034#1 mark
   CALL s_apmm101_sel_pmab(l_xrca.xrcacomp,l_xrca.xrca004,'pmab105|pmab087|pmab089')    #161209-00034#1 add
     RETURNING g_sub_success,g_errno,l_xrca.xrca007,l_xrca.xrca008,l_xrca.xrca058
   #應收款日/票到期日
   LET l_xrca.xrca009 = p_apde.apdadocdt   
   LET l_xrca.xrca010 = p_apde.apdadocdt   
   #暫估款預設稅別
#	LET l_xrca.xrca011  = cl_get_para(g_enterprise,l_xrca.xrcasite,'S-FIN-2010')    #171010-00013#1----mark 

   #171010-00013#1----add----str
   SELECT apda010 INTO l_apda010
   FROM apda_t
   WHERE apdaent = g_enterprise 
   AND apdald = p_apde.apdeld
   AND apdadocno = p_apde.apdedocno
  
   IF cl_null(l_apda010) THEN 
      SELECT ooef019 INTO l_ooef019
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = p_apde.apdecomp

      SELECT oodb002 INTO l_oodb002
        FROM oodb_t 
       WHERE oodb001 = l_ooef019
         AND oodb008 = '2' 
         AND oodb006 = 0 
         AND oodbent = g_enterprise
         
      LET l_xrca.xrca011 =  l_oodb002
   ELSE
      SELECT apaf019 INTO l_apaf019             
        FROM apaf_t 
       WHERE apafent = g_enterprise
         AND apaf001 = '1'             
         AND apaf011 = l_xrca.xrcacomp
         
      LET l_xrca.xrca011 = l_apaf019
   END IF
   
   #171010-00013#1----add----end	

   #稅別
   CALL s_tax_chk(l_xrca.xrcacomp,l_xrca.xrca011)
        RETURNING g_sub_success,l_nouse,l_xrca.xrca013,l_xrca.xrca012,l_nouse
	LET l_xrca.xrca014  = p_apde.apde017          
	LET l_xrca.xrca015  = p_apde.apde018          
        
	LET l_xrca.xrca017  = '1'               
	LET l_xrca.xrca018  = p_apde.apdedocno                     
	LET l_xrca.xrca035  = p_apde.apde016  
	LET l_xrca.xrca037  = 'N'  #產生傳票否
	LET l_xrca.xrca040  = 'N'  #留置否
   #關係人否
   SELECT pmaa047 INTO l_xrca.xrca046 FROM pmaa_t
    WHERE pmaaent = g_enterprise AND pmaa001 = p_apde.apda005  	
	LET l_xrca.xrca054  = ''              
   LET l_xrca.xrca057  = p_apde.apda005	
	LET l_xrca.xrca060  = '1'                               
	LET l_xrca.xrca100  = p_apde.apde100          
	LET l_xrca.xrca101  = p_apde.apde101          
	LET l_xrca.xrca103  = p_apde.apde109          
	LET l_xrca.xrca104  = 0                
	LET l_xrca.xrca106  = 0                
	LET l_xrca.xrca107  = 0                
	LET l_xrca.xrca108  = p_apde.apde109          
	LET l_xrca.xrca113  = p_apde.apde119          
	LET l_xrca.xrca114  = 0                
	LET l_xrca.xrca116  = 0                
	LET l_xrca.xrca117  = 0                
	LET l_xrca.xrca118  = p_apde.apde119
	LET l_xrca.xrcaownid = g_user          
	LET l_xrca.xrcaowndp = g_dept           
	LET l_xrca.xrcacrtid = g_user          
	LET l_xrca.xrcacrtdp = g_dept           
	LET l_xrca.xrcacrtdt = cl_get_current()
	LET l_xrca.xrcacnfid = g_user          
	LET l_xrca.xrcacnfdt = cl_get_current()    
	LET l_xrca.xrcastus  = 'Y'          	
	
   INSERT INTO xrca_t
              (xrcaent,
               xrcald,xrcacomp,xrcadocno,xrcadocdt,xrcasite,
               xrca001,xrca003,xrca004,xrca005,xrca007,
               xrca008,xrca009,xrca010,xrca058,xrca011,
               xrca013,xrca012,xrca014,xrca015,xrca016,
               xrca017,xrca018,xrca035,xrca037,xrca040,
               xrca046,xrca054,xrca057,xrca060,xrca100,
               xrca101,xrca103,xrca104,xrca106,xrca107,
               xrca108,xrca113,xrca114,xrca116,xrca117,
               xrca118,
               xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,xrcacrtdt,
               xrcacnfid,xrcacnfdt,xrcastus)

        VALUES(l_xrca.xrcaent,
               l_xrca.xrcald,l_xrca.xrcacomp,l_xrca.xrcadocno,l_xrca.xrcadocdt,l_xrca.xrcasite,
               l_xrca.xrca001,l_xrca.xrca003,l_xrca.xrca004,l_xrca.xrca005,l_xrca.xrca007,
               l_xrca.xrca008,l_xrca.xrca009,l_xrca.xrca010,l_xrca.xrca058,l_xrca.xrca011,
               l_xrca.xrca013,l_xrca.xrca012,l_xrca.xrca014,l_xrca.xrca015,l_xrca.xrca016,
               l_xrca.xrca017,l_xrca.xrca018,l_xrca.xrca035,l_xrca.xrca037,l_xrca.xrca040,
               l_xrca.xrca046,l_xrca.xrca054,l_xrca.xrca057,l_xrca.xrca060,l_xrca.xrca100,
               l_xrca.xrca101,l_xrca.xrca103,l_xrca.xrca104,l_xrca.xrca106,l_xrca.xrca107,
               l_xrca.xrca108,l_xrca.xrca113,l_xrca.xrca114,l_xrca.xrca116,l_xrca.xrca117,
               l_xrca.xrca118,
               l_xrca.xrcaownid,l_xrca.xrcaowndp,l_xrca.xrcacrtid,l_xrca.xrcacrtdp,l_xrca.xrcacrtdt,
               l_xrca.xrcacnfid,l_xrca.xrcacnfdt,l_xrca.xrcastus)
               
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins xrca_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   ###寫入單身xrcb_t###
	LET l_xrcb.xrcbent  = g_enterprise
	LET l_xrcb.xrcbld   = l_xrca.xrcald      
	LET l_xrcb.xrcblegl = l_xrca.xrcasite    
	LET l_xrcb.xrcborga = l_xrca.xrcasite    
	LET l_xrcb.xrcbsite = l_xrca.xrcasite    
	LET l_xrcb.xrcbdocno= l_xrca.xrcadocno   
	LET l_xrcb.xrcbseq  = 1   
   LET l_xrcb.xrcb001  = '1B'     
   LET l_xrcb.xrcb007 = 1  
	
	LET l_xrcb.xrcb002  = p_apde.apdedocno 
	LET l_xrcb.xrcb003  = p_apde.apdeseq     
	LET l_xrcb.xrcb020  = l_xrca.xrca011     
	LET l_xrcb.xrcb022  = s_fin_get_scc_value('8340',l_xrcb.xrcb001,'4')	
	LET l_xrcb.xrcb023  = 'N'
	LET l_xrcb.xrcb029  = l_xrca.xrca035     
	LET l_xrcb.xrcb031  = l_xrca.xrca008     
	LET l_xrcb.xrcb100  = l_xrca.xrca100     
	LET l_xrcb.xrcb101  = p_apde.apde109     
	LET l_xrcb.xrcb102  = l_xrca.xrca101     
	LET l_xrcb.xrcb103  = p_apde.apde109     
	LET l_xrcb.xrcb104  = 0           
	LET l_xrcb.xrcb105  = p_apde.apde109  
   #交易單據交易稅明細檔計算及寫入
   IF l_xrca.xrca013 = 'Y' THEN  #含稅否
      LET l_xrcb105 = l_xrcb.xrcb105
   ELSE
      LET l_xrcb105 = l_xrcb.xrcb103
   END IF		
   CALL s_tax_ins(l_xrca.xrcadocno,l_xrcb.xrcbseq,'0',l_xrcb.xrcborga,l_xrcb105,
                  l_xrcb.xrcb020,l_xrcb.xrcb007,l_xrca.xrca100,l_xrca.xrca101,l_xrca.xrcald,l_xrca.xrca121,l_xrca.xrca131)
        RETURNING l_xrcb.xrcb103,l_xrcb.xrcb104,l_xrcb.xrcb105,
                  l_xrcb.xrcb113,l_xrcb.xrcb114,l_xrcb.xrcb115,
                  l_xrcb.xrcb123,l_xrcb.xrcb124,l_xrcb.xrcb125,
                  l_xrcb.xrcb133,l_xrcb.xrcb134,l_xrcb.xrcb135	
	
   LET l_xrcb.xrcb106 = 0	
	LET l_xrcb.xrcb111  = p_apde.apde119     
	LET l_xrcb.xrcb113  = p_apde.apde119     
	LET l_xrcb.xrcb114  = 0           
	LET l_xrcb.xrcb115  = p_apde.apde119   
	LET l_xrcb.xrcb116 = 0

   #核算項
   LET l_xrcb.xrcb010 = p_apde.apde018   
   LET l_xrcb.xrcb011 = p_apde.apde019   
   LET l_xrcb.xrcb012 = p_apde.apde020   
   LET l_xrcb.xrcb015 = p_apde.apde022   
   LET l_xrcb.xrcb016 = p_apde.apde023 
   
   LET l_xrcb.xrcb024 = p_apde.apde035   
   LET l_xrcb.xrcb036 = p_apde.apde036   
   LET l_xrcb.xrcb033 = p_apde.apde042   
   LET l_xrcb.xrcb034 = p_apde.apde043   
   LET l_xrcb.xrcb035 = p_apde.apde044 
   
   LET l_xrcb.xrcb037 = p_apde.apde051   
   LET l_xrcb.xrcb038 = p_apde.apde052   
   LET l_xrcb.xrcb039 = p_apde.apde053   
   LET l_xrcb.xrcb040 = p_apde.apde054   
   LET l_xrcb.xrcb041 = p_apde.apde055  
   
   LET l_xrcb.xrcb042 = p_apde.apde056   
   LET l_xrcb.xrcb043 = p_apde.apde057   
   LET l_xrcb.xrcb044 = p_apde.apde058   
   LET l_xrcb.xrcb045 = p_apde.apde059   
   LET l_xrcb.xrcb046 = p_apde.apde060 

   LET l_xrcb.xrcb047 = p_apde.apde010   #170112-00056#1
   INSERT INTO xrcb_t
              (xrcbent,
               xrcbld,xrcblegl,xrcborga,xrcbsite,xrcbdocno,
               xrcbseq,xrcb001,xrcb002,xrcb003,xrcb007,
               xrcb020,xrcb022,xrcb023,xrcb029,xrcb030,
               xrcb100,xrcb101,xrcb102,xrcb103,xrcb104,
               xrcb105,xrcb106,xrcb111,xrcb113,xrcb114,
               xrcb115,xrcb010,xrcb011,xrcb012,xrcb015,
               xrcb016,xrcb024,xrcb036,xrcb033,xrcb034,
               xrcb035,xrcb037,xrcb038,xrcb039,xrcb040,
               xrcb041,xrcb042,xrcb043,xrcb044,xrcb045,
               xrcb047,    #170112-00056#1
               xrcb046,xrcb031)   #161209-00034#1 add xrcb031

        VALUES(l_xrcb.xrcbent,
               l_xrcb.xrcbld,l_xrcb.xrcblegl,l_xrcb.xrcborga,l_xrcb.xrcbsite,l_xrcb.xrcbdocno,
               l_xrcb.xrcbseq,l_xrcb.xrcb001,l_xrcb.xrcb002,l_xrcb.xrcb003,l_xrcb.xrcb007,
               l_xrcb.xrcb020,l_xrcb.xrcb022,l_xrcb.xrcb023,l_xrcb.xrcb029,l_xrcb.xrcb030,
               l_xrcb.xrcb100,l_xrcb.xrcb101,l_xrcb.xrcb102,l_xrcb.xrcb103,l_xrcb.xrcb104,
               l_xrcb.xrcb105,l_xrcb.xrcb106,l_xrcb.xrcb111,l_xrcb.xrcb113,l_xrcb.xrcb114,
               l_xrcb.xrcb115,l_xrcb.xrcb010,l_xrcb.xrcb011,l_xrcb.xrcb012,l_xrcb.xrcb015,
               l_xrcb.xrcb016,l_xrcb.xrcb024,l_xrcb.xrcb036,l_xrcb.xrcb033,l_xrcb.xrcb034,
               l_xrcb.xrcb035,l_xrcb.xrcb037,l_xrcb.xrcb038,l_xrcb.xrcb039,l_xrcb.xrcb040,
               l_xrcb.xrcb041,l_xrcb.xrcb042,l_xrcb.xrcb043,l_xrcb.xrcb044,l_xrcb.xrcb045,
               l_xrcb.xrcb047,    #170112-00056#1
               l_xrcb.xrcb046,l_xrcb.xrcb031)   #161209-00034#1 add l_xrcb.xrcb031
               
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins xrcb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF     
   
   
   ###寫入一期多帳期xrcc_t###
   CALL s_axrt300_create_tmp()   #161209-00034#1 add
   CALL s_axrt300_installments(l_xrca.xrcald,l_xrca.xrcadocno) RETURNING g_sub_success
   IF NOT g_sub_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins xrcc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE      
   END IF
   #151125-00006#2--str--  
    IF r_success THEN    
       LET l_count = 0
       #SELECT COUNT(*) INTO l_count FROM xrcb_t WHERE xrcbent = g_enterprise        #161114-00009#1 mark
       SELECT COUNT(xrcbdocno) INTO l_count FROM xrcb_t WHERE xrcbent = g_enterprise #161114-00009#1 add
          AND xrcbdocno = l_xrca.xrcadocno
          AND xrcbld = l_xrca.xrcald
       IF cl_null(l_count) THEN LET l_count = 0 END IF
        
       IF NOT cl_null(l_xrca.xrcald) AND NOT cl_null(l_xrca.xrcacomp) AND NOT cl_null(l_xrca.xrcadocno) AND l_count > 0 THEN
          #取得單別
          CALL s_aooi200_fin_get_slip(l_xrca.xrcadocno) RETURNING l_success,l_slip
          #取得單別設置的"是否直接審核"參數
          CALL s_fin_get_doc_para(l_xrca.xrcald,l_xrca.xrcacomp,l_slip,'D-FIN-0031') RETURNING l_dfin0031
          
          IF l_dfin0031 = 'Y' THEN
             CALL s_aapt420_contra_doc2_immediately_conf(l_xrca.xrcald,l_xrca.xrcacomp,l_xrca.xrcadocno)
             RETURNING r_success
          END IF
       END IF
   END IF
   #151125-00006#2--end--      
   LET r_apde014 = l_xrca.xrcadocno      
   RETURN r_success,r_apde014   
   
END FUNCTION

################################################################################
# Descriptions...: 取得主要付款銀行及帳戶
# Memo...........:
# Usage..........: CALL s_aapt420_get_primary_pay_bank(p_pmaf001)
#                  RETURNING r_pmaf002,r_pmaf003
# Input parameter: p_pmaf001      交易對象編號
# Return code....: r_pmaf002      銀行代號
#                : r_pmaf003      銀行帳戶
# Date & Author..: 14/10/28 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_get_primary_pay_bank(p_pmaf001)
DEFINE p_pmaf001     LIKE pmaf_t.pmaf001
DEFINE r_pmaf002     LIKE pmaf_t.pmaf002
DEFINE r_pmaf003     LIKE pmaf_t.pmaf003

    LET r_pmaf002 = ''
    LET r_pmaf003 = ''
    SELECT pmaf002,pmaf003 INTO r_pmaf002,r_pmaf003
      FROM pmaf_t
     WHERE pmafent = g_enterprise
       AND pmaf001 = p_pmaf001
       AND pmaf009 = 'Y'   #取主要付款帳戶
       AND pmafstus = 'Y'
    RETURN r_pmaf002,r_pmaf003

END FUNCTION

################################################################################
# Descriptions...: 檢核是否為有效的交易對象銀行
# Memo...........:
# Usage..........: CALL s_aapt420_pmaf002_chk(p_pmaf001,p_pmaf002)
#                  RETURNING r_success,r_errno
# Input parameter: p_pmaf001      交易對象
#                  p_pmaf002      銀行代碼
# Date & Author..: 14/10/28 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_pmaf002_chk(p_pmaf001,p_pmaf002)
DEFINE p_pmaf001    LIKE pmaf_t.pmaf001
DEFINE p_pmaf002    LIKE pmaf_t.pmaf002
DEFINE r_success    LIKE type_t.num10     #成功否
DEFINE r_errno      LIKE gzze_t.gzze001
DEFINE l_pmaf001    LIKE pmaf_t.pmaf001
DEFINE l_pmafstus   LIKE pmaf_t.pmafstus
DEFINE l_sql        STRING                #170123-00045#5 add

   WHENEVER ERROR CONTINUE

   LET r_errno = ''
   LET r_success = TRUE

   IF NOT cl_null(p_pmaf001) THEN   #160509-00004#89
      SELECT pmaf001,pmafstus INTO l_pmaf001,l_pmafstus
        FROM pmaf_t
       WHERE pmafent = g_enterprise
         AND pmaf001 = p_pmaf001
         AND pmaf002 = p_pmaf002
   #160509-00004#89--s
   ELSE
      #170123-00045#5 --s mark
      #SELECT pmaf001,pmafstus INTO l_pmaf001,l_pmafstus
      #  FROM pmaf_t
      # WHERE pmafent = g_enterprise
      #   AND pmaf002 = p_pmaf002   
      #   AND ROWNUM = 1
      #170123-00045#5 --e mark   
      #170123-00045#5 --s add
      LET l_pmaf001 = ''
      LET l_pmafstus = ''
      LET l_sql = " SELECT pmaf001,pmafstus FROM pmaf_t ",
                  "  WHERE pmafent = ",g_enterprise," AND pmaf002 = '",p_pmaf002,"' "         
      PREPARE s_aapt420_pmafp FROM l_sql
      DECLARE s_aapt420_pmafc SCROLL CURSOR FOR s_aapt420_pmafp
      OPEN s_aapt420_pmafc
      FETCH FIRST s_aapt420_pmafc INTO l_pmaf001,l_pmafstus
      CLOSE s_aapt420_pmafc        
      #170123-00045#5 --e add          
   END IF
   #160509-00004#89--e

   CASE
      WHEN SQLCA.SQLCODE = 100
         LET r_errno = 'aap-00232'
         LET r_success = FALSE
      WHEN l_pmafstus = 'N'
         #LET r_errno = 'aoo-00029' #160321-00016#2 mark
         LET r_errno = 'sub-01302'  #160321-00016#2 add
         LET r_success = FALSE
      WHEN l_pmaf001 <> p_pmaf001 AND NOT cl_null(p_pmaf001)    
         LET r_errno = 'aap-00233'
         LET r_success = FALSE         
   END CASE

RETURN r_success,r_errno
   
END FUNCTION
################################################################################
# Descriptions...: 檢核交易銀行+帳戶是否存在交易銀行檔
# Memo...........:
# Usage..........: CALL s_aapt420_pmaf003_chk(p_pmaf002,p_pmaf003)
#                  RETURNING r_success,r_errno
# Input parameter: p_pmaf002      銀行代碼
#                  p_pmaf003      銀行帳戶
# Date & Author..: 14/10/28 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_pmaf003_chk(p_pmaf002,p_pmaf003)
DEFINE p_pmaf002    LIKE pmaf_t.pmaf002
DEFINE p_pmaf003    LIKE pmaf_t.pmaf003
DEFINE r_success    LIKE type_t.num10     #成功否
DEFINE r_errno      LIKE gzze_t.gzze001
DEFINE l_pmaf002    LIKE pmaf_t.pmaf002
DEFINE l_pmafstus   LIKE pmaf_t.pmafstus

   WHENEVER ERROR CONTINUE

   LET r_errno = ''
   LET r_success = TRUE

   SELECT pmaf002,pmafstus INTO l_pmaf002,l_pmafstus
     FROM pmaf_t
    WHERE pmafent = g_enterprise
      AND pmaf003 = p_pmaf003

   CASE
      WHEN SQLCA.SQLCODE = 100
         LET r_errno = 'aap-00232'
         LET r_success = FALSE
      WHEN l_pmafstus = 'N'
         #LET r_errno = 'aoo-00029' #160321-00016#2 mark
         LET r_errno = 'sub-01302'  #160321-00016#2 add
         LET r_success = FALSE
      WHEN l_pmaf002 <> p_pmaf002 AND NOT cl_null(p_pmaf002)    
         LET r_errno = 'aap-00234'
         LET r_success = FALSE         
   END CASE

RETURN r_success,r_errno
END FUNCTION

################################################################################
# Descriptions...: 核算項檢核
# Memo...........:
# Usage..........: CALL s_aapt420_account_item_chk(p_ld,p_docno)
#                  RETURNING r_success
# Input parameter: p_ld           帳別
#                : p_docno        單號
# Return code....: r_success      通過否
# Date & Author..: 14/10/29 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_account_item_chk(p_ld,p_docno)
DEFINE p_ld             LIKE apda_t.apdald
DEFINE p_docno          LIKE apda_t.apdadocno
DEFINE r_success        LIKE type_t.num5
DEFINE l_sql            STRING
DEFINE l_apce           RECORD
            apda005     LIKE apda_t.apda005,
            apce038     LIKE apce_t.apce038,
            apceld      LIKE apce_t.apceld,
            apce016     LIKE apce_t.apce016,
            apceseq     LIKE apce_t.apceseq,
            apdadocdt   LIKE apda_t.apdadocdt,
            apce017     LIKE apce_t.apce017,
                        
            apce018     LIKE apce_t.apce018,
            apce019     LIKE apce_t.apce019,
            apce020     LIKE apce_t.apce020,
            apce022     LIKE apce_t.apce022,
            apce023     LIKE apce_t.apce023,
                        
            apce035     LIKE apce_t.apce035,
            apce036     LIKE apce_t.apce036,
            apce044     LIKE apce_t.apce044,
            apce045     LIKE apce_t.apce045,
            apce046     LIKE apce_t.apce046,
            
            apce051     LIKE apce_t.apce051,                        
            apce052     LIKE apce_t.apce052,
            apce053     LIKE apce_t.apce053,
            apce054     LIKE apce_t.apce054,
            apce055     LIKE apce_t.apce055,
            
            apce056     LIKE apce_t.apce056,
            apce057     LIKE apce_t.apce057,
            apce058     LIKE apce_t.apce058,
            apce059     LIKE apce_t.apce059,
            apce060     LIKE apce_t.apce060
                        END RECORD
                        
DEFINE l_apde           RECORD
            apda005     LIKE apda_t.apda005,
            apde038     LIKE apde_t.apde038,
            apdeld      LIKE apde_t.apdeld,
            apde016     LIKE apde_t.apde016,
            apdeseq     LIKE apde_t.apdeseq,
            apdadocdt   LIKE apda_t.apdadocdt,
            apde017     LIKE apde_t.apde017,
                        
            apde018     LIKE apde_t.apde018,
            apde019     LIKE apde_t.apde019,
            apde020     LIKE apde_t.apde020,
            apde022     LIKE apde_t.apde022,
            apde023     LIKE apde_t.apde023,
                        
            apde035     LIKE apde_t.apde035,
            apde036     LIKE apde_t.apde036,
            apde042     LIKE apde_t.apde042,
            apde043     LIKE apde_t.apde043,
            apde044     LIKE apde_t.apde044,
            
            apde051     LIKE apde_t.apde051,                        
            apde052     LIKE apde_t.apde052,
            apde053     LIKE apde_t.apde053,
            apde054     LIKE apde_t.apde054,
            apde055     LIKE apde_t.apde055,
            
            apde056     LIKE apde_t.apde056,                        
            apde057     LIKE apde_t.apde057,
            apde058     LIKE apde_t.apde058,
            apde059     LIKE apde_t.apde059,
            apde060     LIKE apde_t.apde060
                        END RECORD                        
                        
DEFINE l_account        DYNAMIC ARRAY OF RECORD
                f1      LIKE type_t.chr100,     #欄位值
                f2      LIKE type_t.chr7,       #欄位說明
                f3      LIKE apca_t.apcadocdt   #條件             
                        END RECORD                        
   WHENEVER ERROR CONTINUE

   LET r_success = TRUE
   LET l_sql = " SELECT apda005,apce038,apceld,apce016,apceseq,apdadocdt,apce017, ",
               "        apce018,apce019,apce020,apce022,apce023, ",
               "        apce035,apce036,apce044,apce045,apce046, ",
               "        apce051,apce052,apce053,apce054,apce055, ",
               "        apce056,apce057,apce058,apce059,apce060 ",
               "   FROM apce_t,apda_t ",
               "  WHERE apceent = apdaent ",
               "    AND apcedocno = apdadocno ",
               "    AND apceld = apdald ",
               "    AND apceent = '",g_enterprise,"' ",
               "    AND apcedocno = '",p_docno,"' ",
               "    AND apceld = '",p_ld,"' ",
               "  ORDER BY apceseq "

   PREPARE s_aapt420_sel_apce_chk_p FROM l_sql
   DECLARE s_aapt420_sel_apce_chk_c CURSOR FOR s_aapt420_sel_apce_chk_p
   FOREACH s_aapt420_sel_apce_chk_c INTO l_apce.*
      CALL l_account.clear()
      LET l_account[7].f1  = l_apce.apce018    LET l_account[7].f2 = "apce018"      LET l_account[7].f3 = l_apce.apdadocdt  #部門
      LET l_account[8].f1  = l_apce.apce019    LET l_account[8].f2 = "apce019"      #責任中心
      LET l_account[9].f1  = l_apce.apce035    LET l_account[9].f2 = "apce035"	   #區域
      LET l_account[10].f1 = l_apce.apce038    LET l_account[10].f2 = "apce038"	   #交易客商      
      LET l_account[11].f1 = l_apce.apce036    LET l_account[11].f2 = "apce036"	   #客群
      
      LET l_account[12].f1 = l_apce.apce020    LET l_account[12].f2 = "apce020"	   #產品類別      
      LET l_account[13].f1 = l_apce.apce017    LET l_account[13].f2 = "apce017"     #人員      
      LET l_account[15].f1 = l_apce.apce022    LET l_account[15].f2 = "apce022"     #專案管理      
      LET l_account[16].f1 = l_apce.apce023    LET l_account[16].f2 = "apce023"     #WBS    
      LET l_account[27].f1 = l_apce.apda005    LET l_account[27].f2 = "apda005"	   #帳款客商      

      LET l_account[31].f1 = l_apce.apce044    LET l_account[31].f2 = "apce044"	   #經營方式      
      LET l_account[32].f1 = l_apce.apce045    LET l_account[32].f2 = "apce045"     #渠道
      LET l_account[33].f1 = l_apce.apce046    LET l_account[33].f2 = "apce046"     #品牌
      
                                                                                    
      LET l_account[17].f1 = l_apce.apce051    LET l_account[17].f2 = "apce051"	   #自由核算項一
      LET l_account[18].f1 = l_apce.apce052    LET l_account[18].f2 = "apce052"	   #自由核算項二
      LET l_account[19].f1 = l_apce.apce053    LET l_account[19].f2 = "apce053"	   #自由核算項三
      LET l_account[20].f1 = l_apce.apce054    LET l_account[20].f2 = "apce054"	   #自由核算項四
      LET l_account[21].f1 = l_apce.apce055    LET l_account[21].f2 = "apce055"	   #自由核算項五
      
      LET l_account[22].f1 = l_apce.apce056    LET l_account[22].f2 = "apce056"	   #自由核算項六
      LET l_account[23].f1 = l_apce.apce057    LET l_account[23].f2 = "apce057"	   #自由核算項七
      LET l_account[24].f1 = l_apce.apce058    LET l_account[24].f2 = "apce058"	   #自由核算項八
      LET l_account[25].f1 = l_apce.apce059    LET l_account[25].f2 = "apce059"	   #自由核算項九
      LET l_account[26].f1 = l_apce.apce060    LET l_account[26].f2 = "apce060"	   #自由核算項十

      CALL s_fin_accting_chk(l_apce.apceld,l_apce.apce016,l_account) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF
   END FOREACH
   
   LET l_sql = " SELECT apda005,apde038,apdeld,apde016,apdeseq,apdadocdt,apde017, ",
               "        apde018,apde019,apde020,apde022,apde023, ",
               "        apde035,apde036,apde042,apde043,apde044, ",
               "        apde051,apde052,apde053,apde054,apde055, ",
               "        apde056,apde057,apde058,apde059,apde060 ",
               "   FROM apde_t,apda_t ",
               "  WHERE apdeent = apdaent ",
               "    AND apdedocno = apdadocno ",
               "    AND apdeld = apdald ",
               "    AND apdeent = '",g_enterprise,"' ",
               "    AND apdedocno = '",p_docno,"' ",
               "    AND apdeld = '",p_ld,"' ",
               "  ORDER BY apdeseq "

   PREPARE s_aapt420_sel_apde_chk_p FROM l_sql
   DECLARE s_aapt420_sel_apde_chk_c CURSOR FOR s_aapt420_sel_apde_chk_p
   FOREACH s_aapt420_sel_apde_chk_c INTO l_apde.*
      IF cl_null(l_apde.apde038) THEN LET l_apde.apde038 = l_apde.apda005 END IF
      CALL l_account.clear()
      LET l_account[7].f1  = l_apde.apde018    LET l_account[7].f2 = "apde018"      LET l_account[7].f3 = l_apde.apdadocdt  #部門
      LET l_account[8].f1  = l_apde.apde019    LET l_account[8].f2 = "apde019"      #責任中心
      LET l_account[9].f1  = l_apde.apde035    LET l_account[9].f2 = "apde035"	   #區域
      LET l_account[10].f1 = l_apde.apde038    LET l_account[10].f2 = "apde038"	   #交易客商      
      LET l_account[11].f1 = l_apde.apde036    LET l_account[11].f2 = "apde036"	   #客群
      
      LET l_account[12].f1 = l_apde.apde020    LET l_account[12].f2 = "apde020"	   #產品類別      
      LET l_account[13].f1 = l_apde.apde017    LET l_account[13].f2 = "apde017"     #人員      
      LET l_account[15].f1 = l_apde.apde022    LET l_account[15].f2 = "apde022"     #專案管理      
      LET l_account[16].f1 = l_apde.apde023    LET l_account[16].f2 = "apde023"     #WBS  
      LET l_account[27].f1 = l_apde.apde038    LET l_account[27].f2 = "apde038"	   #帳款客商        

      LET l_account[31].f1 = l_apde.apde042    LET l_account[31].f2 = "apde042"	   #經營方式      
      LET l_account[32].f1 = l_apde.apde043    LET l_account[32].f2 = "apde043"     #渠道
      LET l_account[33].f1 = l_apde.apde044    LET l_account[33].f2 = "apde044"     #品牌
                                                                                    
      LET l_account[17].f1 = l_apde.apde051    LET l_account[17].f2 = "apde051"	   #自由核算項一
      LET l_account[18].f1 = l_apde.apde052    LET l_account[18].f2 = "apde052"	   #自由核算項二
      LET l_account[19].f1 = l_apde.apde053    LET l_account[19].f2 = "apde053"	   #自由核算項三
      LET l_account[20].f1 = l_apde.apde054    LET l_account[20].f2 = "apde054"	   #自由核算項四
      LET l_account[21].f1 = l_apde.apde055    LET l_account[21].f2 = "apde055"	   #自由核算項五
      
      LET l_account[22].f1 = l_apde.apde056    LET l_account[22].f2 = "apde056"	   #自由核算項六
      LET l_account[23].f1 = l_apde.apde057    LET l_account[23].f2 = "apde057"	   #自由核算項七
      LET l_account[24].f1 = l_apde.apde058    LET l_account[24].f2 = "apde058"	   #自由核算項八
      LET l_account[25].f1 = l_apde.apde059    LET l_account[25].f2 = "apde059"	   #自由核算項九
      LET l_account[26].f1 = l_apde.apde060    LET l_account[26].f2 = "apde060"	   #自由核算項十

      CALL s_fin_accting_chk(l_apde.apdeld,l_apde.apde016,l_account) RETURNING g_sub_success
      IF NOT g_sub_success THEN
         LET r_success = FALSE
      END IF
   END FOREACH   
   
   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 取得應付匯款/應付票據可沖銷餘額
# Memo...........:
# Usage..........: CALL s_aapt420_get_payed_amount(p_apdeld,p_apdedocno,p_apdeseq,p_apdecomp,p_apde003)
#                  RETURNING r_apde109,r_apde119,r_apde129,r_apde139
# Input parameter: p_apdeld       帳別
#                : p_apdedocno    核銷單號
#                : p_apdeseq      核銷單項次
#                : p_apdecomp     法人
#                : p_apde003      已付款單號(匯款/票據)
# Return code....: r_apde109      原幣可沖金額
#                : r_apde119      本幣可沖金額
#                : r_apde129      本幣2可沖金額
#                : r_apde139      本幣3可沖金額
# Date & Author..: 14/11/05 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_get_payed_amount(p_apdeld,p_apdedocno,p_apdeseq,p_apdecomp,p_apde003)
DEFINE p_apdeld     LIKE apde_t.apdeld        #帳別
DEFINE p_apdedocno  LIKE apde_t.apdedocno     #核銷單號
DEFINE p_apdeseq    LIKE apde_t.apdeseq       #核銷單項次
DEFINE p_apdecomp   LIKE apde_t.apdecomp      #法人
DEFINE p_apde003    LIKE apde_t.apde003       #已付款單號(匯款/票據)
DEFINE r_apde109    LIKE apde_t.apde109       #原幣可沖金額
DEFINE r_apde119    LIKE apde_t.apde119       #本幣可沖金額
DEFINE r_apde129    LIKE apde_t.apde129       #本幣2可沖金額
DEFINE r_apde139    LIKE apde_t.apde139       #本幣3可沖金額
DEFINE l_nmck       RECORD
                    nmck103    LIKE nmck_t.nmck103,
                    nmck114    LIKE nmck_t.nmck114,
                    nmck124    LIKE nmck_t.nmck124,
                    nmck134    LIKE nmck_t.nmck134
                    END RECORD
DEFINE l_apde       RECORD
                    apde109    LIKE apde_t.apde109,
                    apde119    LIKE apde_t.apde119,
                    apde129    LIKE apde_t.apde129,
                    apde139    LIKE apde_t.apde139
                    END RECORD                    
DEFINE l_sql        STRING

   INITIALIZE l_nmck.* TO NULL
   #已付款單金額
   LET l_sql = " SELECT SUM(COALESCE(nmck103,0)),SUM(COALESCE(nmck114,0)), ",
               "        SUM(COALESCE(nmck124,0)),SUM(COALESCE(nmck134,0)) ",
               "   FROM nmck_t ",
               "  WHERE nmckent = ",g_enterprise," ",
               "    AND nmckcomp  = '",p_apdecomp,"' ",
               "    AND nmckdocno = '",p_apde003,"' "
   PREPARE s_aapt420_sum_nmckp1 FROM l_sql
   EXECUTE s_aapt420_sum_nmckp1 INTO l_nmck.*
   IF cl_null(l_nmck.nmck103) THEN LET l_nmck.nmck103 = 0 END IF
   IF cl_null(l_nmck.nmck114) THEN LET l_nmck.nmck114 = 0 END IF
   IF cl_null(l_nmck.nmck124) THEN LET l_nmck.nmck124 = 0 END IF
   IF cl_null(l_nmck.nmck134) THEN LET l_nmck.nmck134 = 0 END IF

   INITIALIZE l_apde.* TO NULL
   #已存在直接付款金額
   LET l_sql = " SELECT SUM(COALESCE(apde109,0)),SUM(COALESCE(apde119,0)), ",
               "        SUM(COALESCE(apde129,0)),SUM(COALESCE(apde139,0)) ",   
               "   FROM apde_t,apda_t ",
               "  WHERE apdeent = ",g_enterprise," ",
               "    AND apdeld  = '",p_apdeld,"' ",
               "    AND apde003 = '",p_apde003,"' ",
               "    AND apdaent = apdeent ",
               "    AND apdald  = apdeld ",
               "    AND apdadocno = apdedocno ",
               "    AND apdastus NOT IN ('X') ",    #排除自身且未作廢
               "    AND (( apdedocno <> '",p_apdedocno,"') ",
               "     OR (apdedocno = '",p_apdedocno,"' AND apdeseq <> ",p_apdeseq,")) "
   PREPARE s_aapt420_sum_apdep2 FROM l_sql
   EXECUTE s_aapt420_sum_apdep2 INTO l_apde.*
   IF cl_null(l_apde.apde109) THEN LET l_apde.apde109 = 0 END IF
   IF cl_null(l_apde.apde119) THEN LET l_apde.apde119 = 0 END IF
   IF cl_null(l_apde.apde129) THEN LET l_apde.apde129 = 0 END IF
   IF cl_null(l_apde.apde139) THEN LET l_apde.apde139 = 0 END IF
   
   LET r_apde109 = l_nmck.nmck103 - l_apde.apde109
   LET r_apde119 = l_nmck.nmck114 - l_apde.apde119
   LET r_apde129 = l_nmck.nmck124 - l_apde.apde129
   LET r_apde139 = l_nmck.nmck134 - l_apde.apde139
   
   RETURN r_apde109,r_apde119,r_apde129,r_apde139
   
END FUNCTION
################################################################################
# Descriptions...: 傳入金額檢核是否超過nmck剩餘可沖量
# Memo...........:          
# Usage..........: s_aapt420_nmck_used_chk(p_apdeld,p_apdedocno,p_apdeseq,p_apdecomp,p_apde003,p_chk_num,p_field)
#                  RETURNING r_success,r_errno
# Input parameter: p_apdeld       帳別
#                : p_apdedocno    核銷單號
#                : p_apdeseq      核銷單項次
#                : p_apdecomp     法人
#                : p_apde003      已付款單號(匯款/票據)
#                : p_chk_num      要檢查的金額
#                : p_field        檢查的欄位:0原幣/1本幣/2本幣二/3本幣三
# Return code....: r_success      
#                : r_errno 
# Date & Author..: 14/11/06 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_nmck_used_chk(p_apdeld,p_apdedocno,p_apdeseq,p_apdecomp,p_apde003,p_chk_num,p_field)
DEFINE p_apdeld     LIKE apde_t.apdeld        #帳別
DEFINE p_apdedocno  LIKE apde_t.apdedocno     #核銷單號
DEFINE p_apdeseq    LIKE apde_t.apdeseq       #核銷單項次
DEFINE p_apdecomp   LIKE apde_t.apdecomp      #法人
DEFINE p_apde003    LIKE apde_t.apde003       #已付款單號(匯款/票據)
DEFINE p_chk_num    LIKE type_t.num20_6       #要檢查的金額
DEFINE p_field      LIKE type_t.chr1
DEFINE r_success    LIKE type_t.num5
DEFINE r_errno      LIKE gzze_t.gzze001
DEFINE l_nmck_used  RECORD
                    nmck10x    LIKE type_t.num20_6,
                    nmck11x    LIKE type_t.num20_6,
                    nmck12x    LIKE type_t.num20_6,
                    nmck13x    LIKE type_t.num20_6
                    END RECORD
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   LET r_errno = ''
   
   INITIALIZE l_nmck_used.* TO NULL
   CALL s_aapt420_get_payed_amount(p_apdeld,p_apdedocno,p_apdeseq,p_apdecomp,p_apde003)
      RETURNING l_nmck_used.nmck10x,l_nmck_used.nmck11x,l_nmck_used.nmck12x,l_nmck_used.nmck13x
   #看是要檢核哪個欄位
   CASE
      WHEN p_field = '0'
         IF l_nmck_used.nmck10x < p_chk_num THEN
            LET r_success  = FALSE
            LET r_errno    = 'axr-00147'
         END IF
      WHEN p_field = '1'    
         IF l_nmck_used.nmck11x < p_chk_num THEN
            LET r_success = FALSE
            LET r_errno   = 'axr-00147'
         END IF
        
   END CASE
RETURN r_success,r_errno
END FUNCTION
################################################################################
# Descriptions...: 將付款單身資料回寫到應付票據/應付匯款單身檔
# Memo...........:
# Usage..........: CALL s_aapt420_ins_nmcl(p_apde)
#
# Input parameter: p_apde        付款單身apde資料
#
# Date & Author..: 14/11/06 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ins_nmcl(p_apde)
DEFINE p_apde           type_g_apde   
DEFINE l_nmcl           RECORD
   nmclent     LIKE nmcl_t.nmclent,
   nmclcomp    LIKE nmcl_t.nmclcomp,
   nmcldocno   LIKE nmcl_t.nmcldocno,
   nmclseq     LIKE nmcl_t.nmclseq,
   nmclorga    LIKE nmcl_t.nmclorga,
   nmcl001     LIKE nmcl_t.nmcl001,
   nmcl002     LIKE nmcl_t.nmcl002,
   nmcl003     LIKE nmcl_t.nmcl003,
   nmcl103     LIKE nmcl_t.nmcl103,
   nmcl113     LIKE nmcl_t.nmcl113,
   nmcl121     LIKE nmcl_t.nmcl121,
   nmcl123     LIKE nmcl_t.nmcl123,
   nmcl131     LIKE nmcl_t.nmcl131,
   nmcl133     LIKE nmcl_t.nmcl133  
                        END RECORD
DEFINE r_success        LIKE type_t.num5

      LET r_success = TRUE
      
      #寫入應付票據單身nmcl_t
      LET l_nmcl.nmclent =	g_enterprise      
      LET l_nmcl.nmclcomp = p_apde.apdecomp
      LET l_nmcl.nmcldocno	= p_apde.apde003

      #取最大項次
      SELECT MAX(nmclseq)+1 INTO l_nmcl.nmclseq
        FROM nmcl_t
       WHERE nmclent = g_enterprise
         AND nmclcomp = l_nmcl.nmclcomp       
         AND nmcldocno = l_nmcl.nmcldocno
      IF cl_null(l_nmcl.nmclseq) THEN LET l_nmcl.nmclseq = 1 END IF

      LET l_nmcl.nmclorga = p_apde.apdesite	
      LET l_nmcl.nmcl001 =	p_apde.apdedocno	      
      LET l_nmcl.nmcl002 =	p_apde.apdeseq	
      LET l_nmcl.nmcl003 =	p_apde.apde016
      LET l_nmcl.nmcl103 =	p_apde.apde109
      LET l_nmcl.nmcl113 =	p_apde.apde119
      LET l_nmcl.nmcl121 =	p_apde.apde121
      LET l_nmcl.nmcl123 =	p_apde.apde129	     
      LET l_nmcl.nmcl131 =	p_apde.apde131
      LET l_nmcl.nmcl133 =	p_apde.apde139

      INSERT INTO nmcl_t
                 (nmclent,
                  nmclcomp,nmcldocno,nmclseq,nmclorga,nmcl001,
                  nmcl002,nmcl003,nmcl103,nmcl113,nmcl121,
                  nmcl123,nmcl131,nmcl133)

           VALUES(l_nmcl.nmclent,
                  l_nmcl.nmclcomp,l_nmcl.nmcldocno,l_nmcl.nmclseq,l_nmcl.nmclorga,l_nmcl.nmcl001,
                  l_nmcl.nmcl002,l_nmcl.nmcl003,l_nmcl.nmcl103,l_nmcl.nmcl113,l_nmcl.nmcl121,
                  l_nmcl.nmcl123,l_nmcl.nmcl131,l_nmcl.nmcl133)      
                  
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = p_apde.apdedocno CLIPPED,"/ins nmcl_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
         
      RETURN r_success
      
END FUNCTION
################################################################################
# Descriptions...: 將付款資料寫進應收票據異動檔(anmt520)
# Memo...........:
# Usage..........: CALL s_aapt420_ins_nmcq(p_apde)
#
# Input parameter: p_apde        apde資料
#
# Date & Author..: 14/12/6 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ins_nmcq(p_apde)
DEFINE p_apde           type_g_apde3   
DEFINE l_nmcq           RECORD
   nmcqent           LIKE nmcq_t.nmcqent,   
   nmcqcomp          LIKE nmcq_t.nmcqcomp,  
   nmcqsite          LIKE nmcq_t.nmcqsite,  
   nmcqdocno         LIKE nmcq_t.nmcqdocno,
   nmcqdocdt         LIKE nmcq_t.nmcqdocdt, 
   nmcq001           LIKE nmcq_t.nmcq001,   
   nmcq002           LIKE nmcq_t.nmcq002,   
   nmcq003           LIKE nmcq_t.nmcq003,   
   nmcq004           LIKE nmcq_t.nmcq004,   
   nmcq005           LIKE nmcq_t.nmcq005,   
   nmcq006           LIKE nmcq_t.nmcq006,   
   nmcq007           LIKE nmcq_t.nmcq007,   
   nmcq008           LIKE nmcq_t.nmcq008,   
   nmcq009           LIKE nmcq_t.nmcq009,   
   nmcq100           LIKE nmcq_t.nmcq100,   
   nmcq101           LIKE nmcq_t.nmcq101,   
   nmcqstus          LIKE nmcq_t.nmcqstus,  
   nmcqownid         LIKE nmcq_t.nmcqownid, 
   nmcqowndp         LIKE nmcq_t.nmcqowndp, 
   nmcqcrtid         LIKE nmcq_t.nmcqcrtid, 
   nmcqcrtdp         LIKE nmcq_t.nmcqcrtdp, 
   nmcqcrtdt         LIKE nmcq_t.nmcqcrtdt, 
   nmcqmodid         LIKE nmcq_t.nmcqmodid, 
   nmcqmoddt         LIKE nmcq_t.nmcqmoddt 
                        END RECORD
DEFINE l_nmcr           RECORD
   nmcrent           LIKE nmcr_t.nmcrent,
   nmcrcomp          LIKE nmcr_t.nmcrcomp,
   nmcrdocno         LIKE nmcr_t.nmcrdocno,
   nmcrseq           LIKE nmcr_t.nmcrseq,
   nmcrorga          LIKE nmcr_t.nmcrorga,
   nmcr001           LIKE nmcr_t.nmcr001,
   nmcr002           LIKE nmcr_t.nmcr002,
   nmcr003           LIKE nmcr_t.nmcr003,
   nmcr004           LIKE nmcr_t.nmcr004,
   nmcr005           LIKE nmcr_t.nmcr005,
   nmcr006           LIKE nmcr_t.nmcr006,
   nmcr007           LIKE nmcr_t.nmcr007,
   nmcr008           LIKE nmcr_t.nmcr008,
   nmcr100           LIKE nmcr_t.nmcr100,
   nmcr101           LIKE nmcr_t.nmcr101,
   nmcr103           LIKE nmcr_t.nmcr103,
   nmcr104           LIKE nmcr_t.nmcr104,
   nmcr105           LIKE nmcr_t.nmcr105,
   nmcr106           LIKE nmcr_t.nmcr106,
   nmcr107           LIKE nmcr_t.nmcr107,
   nmcr113           LIKE nmcr_t.nmcr113,
   nmcr114           LIKE nmcr_t.nmcr114,
   nmcr115           LIKE nmcr_t.nmcr115,
   nmcr116           LIKE nmcr_t.nmcr116,
   nmcr117           LIKE nmcr_t.nmcr117,
   nmcr118           LIKE nmcr_t.nmcr118,
   nmcr121           LIKE nmcr_t.nmcr121,
   nmcr122           LIKE nmcr_t.nmcr122,
   nmcr131           LIKE nmcr_t.nmcr131,
   nmcr132           LIKE nmcr_t.nmcr132       
                        END RECORD  

DEFINE l_nmbasite       LIKE nmba_t.nmbasite
DEFINE l_nmbb042        LIKE nmbb_t.nmbb042
DEFINE r_success        LIKE type_t.num5
   LET r_success = TRUE
   
   SELECT nmbasite,nmbb042 INTO l_nmbasite,l_nmbb042
     FROM nmba_t,nmbb_t
    WHERE nmbbent  = g_enterprise
      AND nmbbcomp = p_apde.apdacomp
      AND nmbbdocno= p_apde.apde003
      AND nmbb030  = p_apde.apde024
      AND nmbbent  = nmbaent
      AND nmbbcomp = nmbacomp
      AND nmbbdocno= nmbadocno
   
   #寫入應收票據異動檔單頭nmcq_t  
   LET l_nmcq.nmcqent   = g_enterprise
   LET l_nmcq.nmcqcomp  = p_apde.apdacomp
   LET l_nmcq.nmcqsite  = l_nmbasite
   LET l_nmcq.nmcqdocno = p_apde.apdadocno
   LET l_nmcq.nmcqdocdt = p_apde.apdadocdt
   
   LET l_nmcq.nmcq001   = '5'
   LET l_nmcq.nmcq002   = g_user
   LET l_nmcq.nmcq004   = 'N'
   LET l_nmcq.nmcq005   = p_apde.apda005
   LET l_nmcq.nmcq100   = p_apde.apde100
   
   LET l_nmcq.nmcq101   = p_apde.apde101  
   LET l_nmcq.nmcqownid = g_user                                                      
   LET l_nmcq.nmcqowndp = g_dept             
   LET l_nmcq.nmcqcrtid = g_user             
   LET l_nmcq.nmcqcrtdp = g_dept   
             
   LET l_nmcq.nmcqcrtdt = cl_get_current()   
   LET l_nmcq.nmcqstus  = 'Y'      
   
   INSERT INTO nmcq_t
              (nmcqent  ,
               nmcqcomp ,nmcqsite ,nmcqdocno,nmcqdocdt,nmcq001  ,
               nmcq002  ,nmcq004  ,nmcq005  ,nmcq100  ,nmcq101  ,
               nmcqownid,nmcqowndp,nmcqcrtid,nmcqcrtdp,nmcqcrtdt,
               nmcqstus )

        VALUES(l_nmcq.nmcqent  ,
               l_nmcq.nmcqcomp ,l_nmcq.nmcqsite ,l_nmcq.nmcqdocno,l_nmcq.nmcqdocdt,l_nmcq.nmcq001  ,
               l_nmcq.nmcq002  ,l_nmcq.nmcq004  ,l_nmcq.nmcq005  ,l_nmcq.nmcq100  ,l_nmcq.nmcq101  ,
               l_nmcq.nmcqownid,l_nmcq.nmcqowndp,l_nmcq.nmcqcrtid,l_nmcq.nmcqcrtdp,l_nmcq.nmcqcrtdt,
               l_nmcq.nmcqstus )      
               
#160301-00003#1 mod--s
   IF SQLCA.sqlcode AND NOT cl_err_sql_dup_value(SQLCA.sqlcode) THEN   #排除insert重复的错误，另作处理
#  IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
#160301-00003#1 mod--e  
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdadocno CLIPPED,"/ins nmcq_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF

   #寫入應收票據異動檔單身nmcl_t
   LET l_nmcr.nmcrent  = l_nmcq.nmcqent
   LET l_nmcr.nmcrcomp = l_nmcq.nmcqcomp
   LET l_nmcr.nmcrdocno= l_nmcq.nmcqdocno
  #LET l_nmcr.nmcrseq  = 1                 #160301-00003#1 mark
   LET l_nmcr.nmcrseq  = p_apde.apdeseq    #160301-00003#1
   LET l_nmcr.nmcrorga = l_nmcq.nmcqcomp
   
   LET l_nmcr.nmcr001  = p_apde.apde024
   LET l_nmcr.nmcr002  = l_nmbb042
   LET l_nmcr.nmcr003  = p_apde.apde003
   LET l_nmcr.nmcr100  = p_apde.apde100
   LET l_nmcr.nmcr101  = p_apde.apde101
   
   LET l_nmcr.nmcr103  = p_apde.apde109
   LET l_nmcr.nmcr104  = 0
   LET l_nmcr.nmcr105  = 0
   LET l_nmcr.nmcr106  = 0
   LET l_nmcr.nmcr107  = 0
   
   LET l_nmcr.nmcr113  = p_apde.apde119
   LET l_nmcr.nmcr114  = 0
   LET l_nmcr.nmcr115  = 0
   LET l_nmcr.nmcr116  = 0
   LET l_nmcr.nmcr117  = 0
   
   LET l_nmcr.nmcr118  = 0
   LET l_nmcr.nmcr121  = p_apde.apde121
   LET l_nmcr.nmcr122  = 0
   LET l_nmcr.nmcr131  = p_apde.apde131
   LET l_nmcr.nmcr132  = 0

   INSERT INTO nmcr_t
              (nmcrent ,
               nmcrcomp,nmcrdocno,nmcrseq,nmcrorga,nmcr001,
               nmcr002 ,nmcr003  ,nmcr100,nmcr101 ,nmcr103,
               nmcr104 ,nmcr105  ,nmcr106,nmcr107 ,nmcr113,
               nmcr114 ,nmcr115  ,nmcr116,nmcr117 ,nmcr118,
               nmcr121 ,nmcr122  ,nmcr131,nmcr132)

        VALUES(l_nmcr.nmcrent ,
               l_nmcr.nmcrcomp,l_nmcr.nmcrdocno,l_nmcr.nmcrseq,l_nmcr.nmcrorga,l_nmcr.nmcr001,
               l_nmcr.nmcr002 ,l_nmcr.nmcr003  ,l_nmcr.nmcr100,l_nmcr.nmcr101 ,l_nmcr.nmcr103,
               l_nmcr.nmcr104 ,l_nmcr.nmcr105  ,l_nmcr.nmcr106,l_nmcr.nmcr107 ,l_nmcr.nmcr113,
               l_nmcr.nmcr114 ,l_nmcr.nmcr115  ,l_nmcr.nmcr116,l_nmcr.nmcr117 ,l_nmcr.nmcr118,
               l_nmcr.nmcr121 ,l_nmcr.nmcr122  ,l_nmcr.nmcr131,l_nmcr.nmcr132)     
               
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdadocno CLIPPED,"/ins nmcr_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF
   
   #更新票據檔nmbb_t				
   UPDATE nmbb_t SET nmbb042 = l_nmcq.nmcq001,     #收票轉付
                     nmbb046 = l_nmcq.nmcq005	   #轉付對象			
    WHERE nmbbent  = g_enterprise
      AND nmbbcomp = l_nmcq.nmcqcomp
      AND nmbbdocno= l_nmcr.nmcr003
      AND nmbb030  = l_nmcr.nmcr001				
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdadocno CLIPPED,"/upd nmbb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF   
   
   UPDATE nmba_t SET nmbamodid = g_user,         
                     nmbamoddt = l_nmcq.nmcqcrtdt	 
    WHERE nmbaent  = g_enterprise
      AND nmbacomp = l_nmcq.nmcqcomp
      AND nmbadocno= l_nmcr.nmcr003			
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = p_apde.apdadocno CLIPPED,"/upd nmba_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF        

   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 產生核銷單身apce_t
# Memo...........:
# Usage..........: CALL s_aapt420_ins_payable_detail(p_site,p_docno,p_comp,p_ld,p_apda005,p_apdadocdt,p_sfin2002,p_wc,p_type)
# Input parameter: p_site         據點
#                : p_docno        核銷單號
#                : p_ocmp         法人
#                : p_ld           帳別
#                : p_apda005      付款對象
#                : p_docdt        核銷日期
#                : p_sfin2002     應付沖銷參數
#                : p_wc           條件
#                : p_type         4:AP 3:AR
# Date & Author..: 14/12/14 By apo
# Modify.........: 
#150512-00036#1   2015/05/19  By apo      增加p_wc及p_type參數
################################################################################
PUBLIC FUNCTION s_aapt420_ins_payable_detail(p_site,p_docno,p_comp,p_ld,p_apda005,p_docdt,p_sfin2002,p_wc,p_type)
DEFINE p_site       LIKE apda_t.apdasite
DEFINE p_docno       LIKE apda_t.apdadocno
DEFINE p_comp        LIKE apda_t.apdacomp
DEFINE p_ld          LIKE apda_t.apdald
DEFINE p_apda005     LIKE apda_t.apda005
DEFINE p_docdt       LIKE apda_t.apdadocdt
DEFINE p_sfin2002    LIKE type_t.chr1         #S-FIN-2002-應付沖銷參數
DEFINE p_wc          STRING                   #150512-00036#1
DEFINE p_type        LIKE type_t.chr1         #150512-00036#1
DEFINE l_apeadocno   LIKE apea_t.apeadocno
DEFINE l_sql         STRING
DEFINE r_success     LIKE type_t.num5
DEFINE l_wc          STRING
DEFINE l_apca001     LIKE apca_t.apca001      #應付帳款單性質
#DEFINE l_apce        RECORD LIKE apce_t.* #161111-00048#4 mark
#161111-00048#4 --s add
DEFINE l_apce RECORD  #應付沖帳明細
       apceent LIKE apce_t.apceent, #企業編號
       apcecomp LIKE apce_t.apcecomp, #法人
       apcelegl LIKE apce_t.apcelegl, #核算組織
       apcesite LIKE apce_t.apcesite, #帳務組織
       apceld LIKE apce_t.apceld, #帳套
       apceorga LIKE apce_t.apceorga, #帳務歸屬組織
       apcedocno LIKE apce_t.apcedocno, #沖銷單單號
       apceseq LIKE apce_t.apceseq, #項次
       apce001 LIKE apce_t.apce001, #來源作業
       apce002 LIKE apce_t.apce002, #沖銷類型
       apce003 LIKE apce_t.apce003, #沖銷帳款單單號
       apce004 LIKE apce_t.apce004, #沖銷帳款單項次
       apce005 LIKE apce_t.apce005, #分期帳款序
       apce006 LIKE apce_t.apce006, #no use
       apce007 LIKE apce_t.apce007, #no use
       apce008 LIKE apce_t.apce008, #票據號碼/ 現金銀存帳戶
       apce009 LIKE apce_t.apce009, #no use
       apce010 LIKE apce_t.apce010, #摘要說明
       apce011 LIKE apce_t.apce011, #理由碼
       apce012 LIKE apce_t.apce012, #銀存存提碼
       apce013 LIKE apce_t.apce013, #現金異動碼
       apce014 LIKE apce_t.apce014, #no use
       apce015 LIKE apce_t.apce015, #沖銷加減項
       apce016 LIKE apce_t.apce016, #沖銷科目
       apce017 LIKE apce_t.apce017, #業務人員
       apce018 LIKE apce_t.apce018, #業務部門
       apce019 LIKE apce_t.apce019, #責任中心
       apce020 LIKE apce_t.apce020, #產品類別
       apce021 LIKE apce_t.apce021, #no use
       apce022 LIKE apce_t.apce022, #專案編號
       apce023 LIKE apce_t.apce023, #WBS編號
       apce024 LIKE apce_t.apce024, #第二參考單號
       apce025 LIKE apce_t.apce025, #第二參考單號項次
       apce026 LIKE apce_t.apce026, #no use
       apce027 LIKE apce_t.apce027, #應稅折抵否
       apce028 LIKE apce_t.apce028, #產生方式
       apce029 LIKE apce_t.apce029, #傳票號碼
       apce030 LIKE apce_t.apce030, #傳票項次
       apce031 LIKE apce_t.apce031, #付款(票)到期日
       apce032 LIKE apce_t.apce032, #應付款日
       apce033 LIKE apce_t.apce033, #no use
       apce034 LIKE apce_t.apce034, #no use
       apce035 LIKE apce_t.apce035, #區域
       apce036 LIKE apce_t.apce036, #客戶分類
       apce037 LIKE apce_t.apce037, #no use
       apce038 LIKE apce_t.apce038, #帳款對象
       apce039 LIKE apce_t.apce039, #no use
       apce040 LIKE apce_t.apce040, #no use
       apce041 LIKE apce_t.apce041, #no use
       apce042 LIKE apce_t.apce042, #no use
       apce043 LIKE apce_t.apce043, #no use
       apce044 LIKE apce_t.apce044, #經營方式
       apce045 LIKE apce_t.apce045, #通路
       apce046 LIKE apce_t.apce046, #品牌
       apce047 LIKE apce_t.apce047, #發票編號
       apce048 LIKE apce_t.apce048, #發票號碼
       apce049 LIKE apce_t.apce049, #付款申請單號碼
       apce050 LIKE apce_t.apce050, #付款申請單項次
       apce051 LIKE apce_t.apce051, #自由核算項一
       apce052 LIKE apce_t.apce052, #自由核算項二
       apce053 LIKE apce_t.apce053, #自由核算項三
       apce054 LIKE apce_t.apce054, #自由核算項四
       apce055 LIKE apce_t.apce055, #自由核算項五
       apce056 LIKE apce_t.apce056, #自由核算項六
       apce057 LIKE apce_t.apce057, #自由核算項七
       apce058 LIKE apce_t.apce058, #自由核算項八
       apce059 LIKE apce_t.apce059, #自由核算項九
       apce060 LIKE apce_t.apce060, #自由核算項十
       apce100 LIKE apce_t.apce100, #幣別
       apce101 LIKE apce_t.apce101, #匯率
       apce104 LIKE apce_t.apce104, #原幣應稅折抵稅額
       apce109 LIKE apce_t.apce109, #原幣沖帳金額
       apce114 LIKE apce_t.apce114, #本幣應稅折抵稅額
       apce119 LIKE apce_t.apce119, #本幣沖帳金額
       apce120 LIKE apce_t.apce120, #本位幣二幣別
       apce124 LIKE apce_t.apce124, #本位幣二應稅折抵稅額
       apce121 LIKE apce_t.apce121, #本位幣二匯率
       apce129 LIKE apce_t.apce129, #本位幣二沖帳金額
       apce130 LIKE apce_t.apce130, #本位幣三幣別
       apce131 LIKE apce_t.apce131, #本位幣三匯率
       apce134 LIKE apce_t.apce134, #本位幣三應稅折抵稅額
       apce139 LIKE apce_t.apce139, #本位幣三沖帳金額
       apceud001 LIKE apce_t.apceud001, #自定義欄位(文字)001
       apceud002 LIKE apce_t.apceud002, #自定義欄位(文字)002
       apceud003 LIKE apce_t.apceud003, #自定義欄位(文字)003
       apceud004 LIKE apce_t.apceud004, #自定義欄位(文字)004
       apceud005 LIKE apce_t.apceud005, #自定義欄位(文字)005
       apceud006 LIKE apce_t.apceud006, #自定義欄位(文字)006
       apceud007 LIKE apce_t.apceud007, #自定義欄位(文字)007
       apceud008 LIKE apce_t.apceud008, #自定義欄位(文字)008
       apceud009 LIKE apce_t.apceud009, #自定義欄位(文字)009
       apceud010 LIKE apce_t.apceud010, #自定義欄位(文字)010
       apceud011 LIKE apce_t.apceud011, #自定義欄位(數字)011
       apceud012 LIKE apce_t.apceud012, #自定義欄位(數字)012
       apceud013 LIKE apce_t.apceud013, #自定義欄位(數字)013
       apceud014 LIKE apce_t.apceud014, #自定義欄位(數字)014
       apceud015 LIKE apce_t.apceud015, #自定義欄位(數字)015
       apceud016 LIKE apce_t.apceud016, #自定義欄位(數字)016
       apceud017 LIKE apce_t.apceud017, #自定義欄位(數字)017
       apceud018 LIKE apce_t.apceud018, #自定義欄位(數字)018
       apceud019 LIKE apce_t.apceud019, #自定義欄位(數字)019
       apceud020 LIKE apce_t.apceud020, #自定義欄位(數字)020
       apceud021 LIKE apce_t.apceud021, #自定義欄位(日期時間)021
       apceud022 LIKE apce_t.apceud022, #自定義欄位(日期時間)022
       apceud023 LIKE apce_t.apceud023, #自定義欄位(日期時間)023
       apceud024 LIKE apce_t.apceud024, #自定義欄位(日期時間)024
       apceud025 LIKE apce_t.apceud025, #自定義欄位(日期時間)025
       apceud026 LIKE apce_t.apceud026, #自定義欄位(日期時間)026
       apceud027 LIKE apce_t.apceud027, #自定義欄位(日期時間)027
       apceud028 LIKE apce_t.apceud028, #自定義欄位(日期時間)028
       apceud029 LIKE apce_t.apceud029, #自定義欄位(日期時間)029
       apceud030 LIKE apce_t.apceud030, #自定義欄位(日期時間)030
       apce103 LIKE apce_t.apce103, #原幣未稅沖銷額
       apce113 LIKE apce_t.apce113, #本位未稅沖銷額
       apce123 LIKE apce_t.apce123, #本位幣二未稅沖銷額
       apce133 LIKE apce_t.apce133, #本位幣三未稅沖銷額
       apce061 LIKE apce_t.apce061  #付款對象
END RECORD
#161111-00048#4 --e add
#150622-00004#1--(s)
DEFINE l_glaa136     LIKE glaa_t.glaa136   
DEFINE l_glaa137     LIKE glaa_t.glaa137    #151027-00014#1
DEFINE l_slip        LIKE ooba_t.ooba002
DEFINE l_dfin0030    LIKE type_t.chr1 
DEFINE l_cnt         LIKE type_t.num5
#150622-00004#1--(e)
DEFINE l_docdt       LIKE apca_t.apcadocdt  #170531-00062#1 add
DEFINE l_pmaa004     LIKE pmaa_t.pmaa004    #170802-00061#1 add
DEFINE l_glaa015     LIKE glaa_t.glaa015    #170929-00040#1 add
DEFINE l_glaa019     LIKE glaa_t.glaa019    #170929-00040#1 add

   LET r_success = TRUE
   #150622-00004#1--(s)
   CALL s_ld_sel_glaa(p_ld,'glaa136|glaa137|glaa015|glaa019') RETURNING  g_sub_success,l_glaa136,l_glaa137,l_glaa015,l_glaa019   #151027-00014#1 add 137   #170929-00040#1 add glaa015|glaa019
   #150622-00004#1--(e)   
   IF cl_null(p_wc) THEN    #150512-00036#1
      #取得自動產生條件
      CALL aapt420_02(p_comp,p_ld,p_apda005,p_docdt) RETURNING l_wc
   ELSE                     #150512-00036#1
      LET l_wc = p_wc       #150512-00036#1
   END IF                   #150512-00036#1
   LET l_wc = l_wc CLIPPED," AND apcacomp = '",p_comp,"' ",
                           " AND apcald   = '",p_ld,"' ",
                          #" AND apca005  = '",p_apda005,"' ",                                                     #150819 by 03538 mark   #161107-00035#1 remark   #170802-00061#1 mark
                          #" AND ( (apca004 = '",p_apda005,"' AND apca001='15') OR apca005  = '",p_apda005,"') ",  #150819 by 03538        #161107-00035#1 mark
                           " AND apcadocdt<='",p_docdt,"' ",
                           " AND apca001 NOT LIKE '0%' "
   #170802-00061#1---add---str--
   LET l_pmaa004 = NULL
   SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t
    WHERE pmaaent = g_enterprise
      AND pmaa001 = p_apda005
   IF p_type = '4' THEN   #應付
      IF l_pmaa004 = '2' THEN
         LET l_wc = l_wc CLIPPED," AND apca005 ='",p_apda005,"' "
      ELSE
         LET l_wc = l_wc CLIPPED," AND ((apca004 = '",p_apda005,"' AND apca001='15') OR apca005 = '",p_apda005,"' ",
                           "         OR apca005 IN (SELECT pmac002 FROM pmac_t ",
                           "                     WHERE pmacent = ",g_enterprise,
                           "                       AND pmac001 = '",p_apda005,"' ",
                           "                       AND pmacstus = 'Y' )",
                           "     )"
      END IF
   END IF
   LET l_sql = l_sql,"  ORDER BY apca001,apccseq,apcc001 "
   #170802-00061#1---add---end--                        
   LET l_sql =  " SELECT DISTINCT apca001,apcadocno,apccseq,apcc001,apcc009 ",   #150501 mod apcbseq-->apccseq
               #"   FROM (SELECT DISTINCT apcadocno,apccseq,apcc001,apcc009, ",          #150819 by 03538 mark  #150501 mod apcbseq-->apccseq
                "   FROM (SELECT DISTINCT apcadocno,apccseq,apcc001,apcc009,apca004, ",  #150819 by 03538
                #扣除已存在非作廢的沖銷金額
               #"                         apcc108-COALESCE((SELECT SUM(apce109) FROM apce_t ",  #150317apo mark
               #"                         apcc108-apcc109",                                     #150317apo        ##170213-00023#1 mark
   #170213-00023#1 add --(S)--
                "                         apcc108-apcc109"
   IF p_type <> '3' THEN     
      LET l_sql = l_sql,                
   #170213-00023#1 add --(E)-- 
                #160705-00035#1-s
                #170615-00061#11 --s mark 將SQL中的空格縮減20個,避免長度過長
                #"                                -COALESCE((SELECT SUM(apba103) FROM apba_t ",  #aapt110
                #"                                             LEFT JOIN apbb_t ON apbaent=apbbent AND apbadocno=apbbdocno",
                #"                                            WHERE apbaent = apccent AND apba005 = apccdocno",
                #"                                              AND (apbbstus NOT IN ('X','Y')",
                #"                                                   OR (apbbstus = 'Y' AND apbbdocno NOT IN (SELECT apca018",
                #"                                                                                              FROM apca_t WHERE apcaent=apbaent",
                #"                                                                                               AND apcastus <> 'X') )  )",
                #170615-00061#11 --e mark
                #170615-00061#11 --s add 將SQL中的空格縮減,避免長度過長,未修改邏輯
                " -COALESCE((SELECT SUM(apba103) FROM apba_t ",  #aapt110
                "              LEFT JOIN apbb_t ON apbaent=apbbent AND apbadocno=apbbdocno",
                "             WHERE apbaent = apccent AND apba005 = apccdocno",
                "               AND (apbbstus NOT IN ('X','Y')",
                "                    OR (apbbstus = 'Y' AND apbbdocno NOT IN (SELECT apca018",
                "                                                               FROM apca_t WHERE apcaent=apbaent",
                "                                                                AND apcastus <> 'X') )  )",
                #170615-00061#11 --e add                
               #"                                              AND apba004 IN ('27') ),0)",     #170213-00023#1 mark
   #170213-00023#1 add --(S)--
                "                                              AND apba004 IN ('27') ),0)"
   END IF
   LET l_sql = l_sql,   
   #170213-00023#1 add --(E)--                 
                #160705-00035#1-e
                #170615-00061#11 --s mark 將SQL中的空格縮減,避免長度過長,未修改邏輯
                #"                                -COALESCE((SELECT SUM(apce109) FROM apce_t ",  #150317apo
                #"                                            WHERE apceent = apccent AND apceld  = apccld ",
                #"                                              AND apce003 = apccdocno AND apce004 = apccseq AND apce005 = apcc001 ",
                #170615-00061#11 --e mark 
                #170615-00061#11 --s add 將SQL中的空格縮減,避免長度過長,未修改邏輯
                " -COALESCE((SELECT SUM(apce109) FROM apce_t ",  #150317apo
                "             WHERE apceent = apccent AND apceld  = apccld ",
                "               AND apce003 = apccdocno AND apce004 = apccseq AND apce005 = apcc001 ",
                #170615-00061#11 --e add          
                #170615-00061#11 --s mark 將SQL中的空格縮減,避免長度過長,未修改邏輯                
                #150331 carol:來源為aapt430之沖銷紀錄(apda_t+apce_t),帳款單性質1*的要排除, 2*不排除(原因為aapt430只會回寫性質為2*之apcc)
                #"                                              AND NOT (apce001='aapt430' AND EXISTS(SELECT 1 FROM apca_t ",
                #"                                                                                     WHERE apcaent = apceent AND apcadocno = apce003 ",
                #"                                                                                       AND apcald = apceld AND apca001 LIKE '1%')) ",
                ##-150331apo--(e)
                #"                                              AND (EXISTS (SELECT 1 FROM apda_t ",     #aapt420
                #"                                                            WHERE apceent = apdaent AND apceld = apdald ",
                #"                                                              AND apcedocno = apdadocno ",
               ##"                                                              AND apdastus IN ('N','Y')) ",           #150317apo mark
                #"                                                              AND apdastus NOT IN ('X','Y')) ",       #150317apo
                #"                                                OR EXISTS (SELECT 1 FROM apca_t ",     #aapt300_02
                #"                                                            WHERE apceent = apcaent AND apceld = apcald ",
                #"                                                              AND apcedocno = apcadocno ",
               ##"                                                              AND apcastus IN('N','Y')))),0) AS apcc108, ",       #150317apo mark
                #"                                                              AND apcastus NOT IN ('X','Y'))",
                #"                                                  )",            #150317apo
                #"                                            ),0) AS apcc108, ",  #150317apo
                #"                         apcaent,apcald,apcacomp,apca001,apca005,apcadocdt,apcastus ",
                #170615-00061#11 --e mark
                #170615-00061#11 --s add 將SQL中的空格縮減,避免長度過長,未修改邏輯                
                #150331 carol:來源為aapt430之沖銷紀錄(apda_t+apce_t),帳款單性質1*的要排除, 2*不排除(原因為aapt430只會回寫性質為2*之apcc)
                "    AND NOT (apce001='aapt430' AND EXISTS(SELECT 1 FROM apca_t ",
                "                                           WHERE apcaent = apceent AND apcadocno = apce003 ",
                "                                             AND apcald = apceld AND apca001 LIKE '1%')) ",
                #-150331apo--(e) 
                "    AND (EXISTS (SELECT 1 FROM apda_t ",     #aapt420
                "                  WHERE apceent = apdaent AND apceld = apdald ",
                "                    AND apcedocno = apdadocno ",
               #"                    AND apdastus IN ('N','Y')) ",           #150317apo mark
                "                    AND apdastus NOT IN ('X','Y')) ",       #150317apo
                "      OR EXISTS (SELECT 1 FROM apca_t ",     #aapt300_02
                "                  WHERE apceent = apcaent AND apceld = apcald ",
                "                    AND apcedocno = apcadocno ",
               #"                    AND apcastus IN('N','Y')))),0) AS apcc108, ",       #150317apo mark
                "                    AND apcastus NOT IN ('X','Y'))",
                "        )",            #150317apo
                "  ),0) AS apcc108, ",  #150317apo
                "  apcaent,apcald,apcacomp,apca001,apca005,apcadocdt,apcastus ",
                #170615-00061#11 --e add                
                
               #-150501 mark--(s)
               #"           FROM apca_t,apcb_t,apcc_t ",
               #"          WHERE apcaent = apcbent ",
               #"            AND apcald = apcbld ",
               #"            AND apcadocno = apcbdocno ",
               #"            AND apcbent = apccent ",
               #"            AND apcbld  = apccld ",
               #"            AND apcbdocno = apccdocno ",
               #"            AND apcbseq = apccseq ",   
               #-150501 mark--(e)
                #-150501--(s)
                #170615-00061#11 --s mark 將SQL中的空格縮減,避免長度過長,未修改邏輯   
                #"           FROM apca_t,apcc_t ",
                #"          WHERE apcaent = apccent ",
                #"            AND apcald = apccld ",
                #"            AND apcadocno = apccdocno ",
                #170615-00061#11 --e mark
                #170615-00061#11 --s add 將SQL中的空格縮減,避免長度過長,未修改邏輯   
                "  FROM apca_t,apcc_t ",
                " WHERE apcaent = apccent ",
                "   AND apcald = apccld ",
                "   AND apcadocno = apccdocno ",
                #170615-00061#11 --e add                
                #-150501--(e)              
                "            AND ",l_wc CLIPPED,
                "        ) ",
                "  WHERE apcaent = ? ",
                "    AND apcc108 > 0 ",
                "    AND apcastus = 'Y' ",
                "    AND apcacomp = '",p_comp,"' ",
               #"    AND apca005 ='",p_apda005,"' ",                                                       #150819 by 03538 mark   #161107-00035#1 remark   #170802-00061#1 mark
               #"    AND ( (apca004 = '",p_apda005,"' AND apca001='15') OR apca005  = '",p_apda005,"') ",  #150819 by 03538        #161107-00035#1 mark
                "    AND apcald = '",p_ld,"' ",
                #"    AND ( apca001 LIKE '1%' OR apca001 LIKE '2%') ", #170308-00034#5 mark
                 "    AND ( apca001 LIKE '1%' OR apca001 LIKE '2%' OR apca001 LIKE '3%' ) "  #170308-00034#5 add 3%   #170802-00061#1 移除,
                #"  ORDER BY apca001,apccseq,apcc001 "   #150501 mod apcbseq-->apccseq   #170802-00061#1 mark    
   #150512-00036#1--(s)
   
   #170802-00061#1---add---str--
   IF p_type = '4' THEN   #應付
      IF l_pmaa004 = '2' THEN
         LET l_sql = l_sql," AND apca005 ='",p_apda005,"' "
      ELSE
         LET l_sql = l_sql," AND ((apca004 = '",p_apda005,"' AND apca001='15') OR apca005 = '",p_apda005,"' ",
                           "         OR apca005 IN (SELECT pmac002 FROM pmac_t ",
                           "                     WHERE pmacent = ",g_enterprise,
                           "                       AND pmac001 = '",p_apda005,"' ",
                           "                       AND pmacstus = 'Y' )",
                           "     )"
      END IF
   END IF
   LET l_sql = l_sql,"  ORDER BY apca001,apccseq,apcc001 "
   #170802-00061#1---add---end--
   
   #應收類型將sql做字元替換
   IF p_type = '3' THEN
      LET l_sql = cl_replace_str(l_sql,'ap','xr')
   END IF
   #150512-00036#1--(e)
   PREPARE s_aapt420_sel_apca_p FROM l_sql
   DECLARE s_aapt420_sel_apca_c CURSOR FOR s_aapt420_sel_apca_p  
   FOREACH s_aapt420_sel_apca_c USING g_enterprise INTO l_apca001,l_apce.apce003,l_apce.apce004,l_apce.apce005,l_apce.apce048
      #150622-00004#1--(s)
      #檢核1:帳別設定"核銷限定立帳單已產生傳票"為Y,且立帳單別"是否產生分錄"為Y,則立帳單需產生傳票才能核銷
      #IF l_glaa136 = 'Y' HEN                                                                      #151027-00014#1 mark
      IF (p_type[1,1] = '4' AND l_glaa137 = 'Y') OR (p_type[1,1] = '3' AND l_glaa136 = 'Y') THEN   #151027-00014#1         
         CALL s_aooi200_fin_get_slip(l_apce.apce003) RETURNING g_sub_success,l_slip
         CALL s_fin_get_doc_para(p_ld,p_comp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
         IF l_dfin0030 = 'Y' THEN
            LET l_cnt = 0
            CASE p_type[1,1]
               WHEN '4'
                  SELECT COUNT(apcadocno) INTO l_cnt
                    FROM apca_t
                   WHERE apcaent = g_enterprise
                     AND apcadocno = l_apce.apce003
                     AND apcald = p_ld
                    #AND apca038 IS NULL   #151027-00014#1 mark
                    #151027-00014#1--s
                     AND (
                           apca038 IS NULL OR 
                          (apca038 IS NOT NULL AND ( NOT EXISTS
                                                        (SELECT 1 FROM glap_t
                                                          WHERE glapent = apcaent 
                                                            AND glapdocno = apca038 
                                                            AND glapld = apcald 
                                                           #AND glapstus = 'Y') ))           #151105 mark
                                                            AND glapstus IN ('Y','S') ) ))   #151105                                                         
                         )
                    #151027-00014#1--e
                     
               WHEN '3'
                  SELECT COUNT(xrcadocno) INTO l_cnt
                    FROM xrca_t
                   WHERE xrcaent = g_enterprise
                     AND xrcadocno = l_apce.apce003
                     AND xrcald = p_ld
                     AND xrca038 IS NULL  
           
            END CASE
            IF l_cnt > 0 THEN
               CONTINUE FOREACH
            END IF 
         END IF
      END IF
      #檢核2:待抵單之來源預付/預收單據必須先收付款後,待抵單才可以被沖銷
      IF l_apca001[1,1] = 2 THEN
         #160816-00022#1--s
         #應付待抵單如果有做費用分攤,就不能做核銷
         #IF p_type[1,1] = '4' AND l_apca001 MATCHES '2*' THEN    #170618-00252#1 mark
         IF p_type[1,1] = '4' AND l_apca001 MATCHES '2*' AND l_apca001 NOT MATCHES '2[249]'  THEN    #170618-00252#1
            LET l_cnt = 0
            SELECT COUNT(apce001) INTO l_cnt
              FROM apce_t
             WHERE apceent = g_enterprise
               AND apceld = p_ld
               AND apce003 = l_apce.apce003
               AND apce001 = 'aapt430'   #存在分攤就不能核銷
               AND EXISTS (SELECT 1 FROM apda_t WHERE apceent = apdaent AND apceld = apdald 
                                                   AND apcedocno = apdadocno AND apdastus NOT IN('X'))                                                                                    
            IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF
            IF l_cnt > 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code   = 'aap-00584'
               LET g_errparam.extend = l_apce.apce003
               LET g_errparam.popup = TRUE
               CALL cl_err()               
               CONTINUE FOREACH        
            END IF            
         END IF
         #160816-00022#1--e          
         LET l_cnt = 0
         CASE p_type[1,1]
            WHEN '4'
               SELECT COUNT(apcadocno) INTO l_cnt
                 FROM apca_t,apcc_t
                WHERE apcaent = apccent
                  AND apcald = apccld
                  AND apcadocno = apccdocno
                  AND apcastus = 'Y'
                  #AND apcc108 - apcc109 > 0   #170823-00020#1 mark
                  AND ((apcc108 - apcc109 > 0 AND apca001 NOT IN ('11','14')) OR (apcc109 = 0  AND apca001 IN ('11','14')))   #170823-00020#1 add
                  AND apcaent = g_enterprise
                  AND apcald  = p_ld
                  AND apca019 = l_apce.apce003
            WHEN '3'
               SELECT COUNT(xrcadocno) INTO l_cnt
                 FROM xrca_t,xrcc_t
                WHERE xrcaent = xrccent
                  AND xrcald = xrccld
                  AND xrcadocno = xrccdocno
                  AND xrcastus = 'Y'
                  AND xrcc108 - xrcc109 > 0
                  AND xrcaent = g_enterprise
                  AND xrcald  = p_ld
                  AND xrca019 = l_apce.apce003
         END CASE
         IF l_cnt > 0 THEN
            CONTINUE FOREACH
         END IF
      END IF
      #150622-00004#1--(e)
      LET l_apce.apceent = g_enterprise
      LET l_apce.apceld  = p_ld
      LET l_apce.apcesite = p_site
      LET l_apce.apcecomp = p_comp
      LET l_apce.apceorga = p_comp  
      #170303-00003#1 add s---
      SELECT apccsite INTO l_apce.apceorga FROM apcc_t   
       WHERE apccent = g_enterprise
         AND apccld  = l_apce.apceld
         AND apccdocno = l_apce.apcedocno
         AND apccseq = l_apce.apce004
         AND apcc001 = l_apce.apce005
      #170303-00003#1 add e---         
      LET l_apce.apcedocno= p_docno
      #項次
      LET l_apce.apceseq = NULL
      SELECT MAX(apceseq) INTO l_apce.apceseq FROM apce_t
       WHERE apceent = g_enterprise
         AND apceld  = l_apce.apceld
         AND apcedocno = l_apce.apcedocno
      IF cl_null(l_apce.apceseq) THEN
         LET l_apce.apceseq = 0
      END IF
      LET l_apce.apceseq = l_apce.apceseq + 1
      
      LET l_apce.apce001 = g_prog      #來源作業
      #帳款類型
      #應付
      IF p_type = '4' THEN   #150512-00036#1
         CASE
            WHEN l_apca001[1,1] = 1
               LET l_apce.apce002 = '40'
            WHEN l_apca001[1,1] = 2 AND l_apca001 <> '25'
               LET l_apce.apce002 = '41'
            WHEN l_apca001 = '25'
               LET l_apce.apce002 = '42'
            WHEN l_apca001[1,1] = 3              #170308-00034#5 add 
               LET l_apce.apce002 = '40'         #170308-00034#5 add    
         END CASE
      #150512-00036#1--(S)
      #應收
      ELSE
         CASE
            WHEN l_apca001[1,1] = 1
               LET l_apce.apce002 = '30'
            WHEN l_apca001[1,1] = 2 AND l_apca001 <> '25'
               LET l_apce.apce002 = '31'
            WHEN l_apca001 = '25'
               LET l_apce.apce002 = '32'
         END CASE
      END IF
      #150512-00036#1--(E)
      #借貸別
      LET l_apce.apce015 = s_fin_get_scc_value('8506',l_apce.apce002,'1')
      #帶回開窗帳款單資訊
      CALL s_aapt420_source_doc_carry(l_apce.apce002,l_apce.apce003,l_apce.apce004,l_apce.apceld,
                                      l_apce.apcedocno,l_apce.apceseq,l_apce.apceld,
                                      l_apce.apce005,l_apce.apce048,p_sfin2002)
       RETURNING l_apce.apce038,l_apce.apce024,l_apce.apce100,l_apce.apce109,l_apce.apce101,
                 l_apce.apce119,l_apce.apce120,l_apce.apce121,l_apce.apce129,l_apce.apce130,
                 l_apce.apce131,l_apce.apce139,l_apce.apce031,l_apce.apce017,l_apce.apce018,
                 l_apce.apce019,l_apce.apce022,l_apce.apce020,l_apce.apce023,l_apce.apce035,
                 l_apce.apce036,l_apce.apce044,l_apce.apce045,l_apce.apce046,l_apce.apce051,
                 l_apce.apce052,l_apce.apce053,l_apce.apce054,l_apce.apce055,l_apce.apce056,
                 l_apce.apce057,l_apce.apce058,l_apce.apce059,l_apce.apce060,l_apce.apce010,
                 l_apce.apce048   #151029
     #160628-00002#2--add--str--
     #170531-00062#1 add(s)
     IF cl_null(l_apce.apce038) AND cl_null(l_apce.apce024)AND cl_null(l_apce.apce100)AND cl_null(l_apce.apce109)AND cl_null(l_apce.apce101)AND
        cl_null(l_apce.apce119) AND cl_null(l_apce.apce120)AND cl_null(l_apce.apce121)AND cl_null(l_apce.apce129)AND cl_null(l_apce.apce130)AND
        cl_null(l_apce.apce131)AND cl_null(l_apce.apce139)AND cl_null(l_apce.apce031)AND cl_null(l_apce.apce017)AND cl_null(l_apce.apce018)AND
        cl_null(l_apce.apce019)AND cl_null(l_apce.apce022)AND cl_null(l_apce.apce020)AND cl_null(l_apce.apce023)AND cl_null(l_apce.apce035)AND
        cl_null(l_apce.apce036)AND cl_null(l_apce.apce044)AND cl_null(l_apce.apce045)AND cl_null(l_apce.apce046)AND cl_null(l_apce.apce051)AND
        cl_null(l_apce.apce052)AND cl_null(l_apce.apce053)AND cl_null(l_apce.apce054)AND cl_null(l_apce.apce055)AND cl_null(l_apce.apce056)AND
        cl_null(l_apce.apce057)AND cl_null(l_apce.apce058)AND cl_null(l_apce.apce059)AND cl_null(l_apce.apce060)AND cl_null(l_apce.apce010)AND
        cl_null(l_apce.apce048) THEN
        CONTINUE FOREACH            
     END IF 
     #170531-00062#1 add(e)
     #當程序為aapt3*,執行直接沖帳時抓取金額
     IF g_prog[1,5] = 'aapt3' AND (l_apce.apce002 = '41' OR l_apce.apce002 = '42') THEN
        CALL s_aapt300_not_washed_amt(l_apce.apceld,l_apce.apcedocno,l_apce.apceseq,l_apce.apce003,l_apce.apce004,l_apce.apce005)
        RETURNING l_apce.apce103,l_apce.apce104,l_apce.apce109,l_apce.apce113,l_apce.apce114,l_apce.apce119,
                  l_apce.apce123,l_apce.apce124,l_apce.apce129,l_apce.apce133,l_apce.apce134,l_apce.apce139
     ELSE
        LET l_apce.apce103 = 0
        LET l_apce.apce104 = 0
        LET l_apce.apce113 = 0
        LET l_apce.apce114 = 0
        LET l_apce.apce123 = 0
        LET l_apce.apce124 = 0
        LET l_apce.apce133 = 0
        LET l_apce.apce134 = 0
     END IF
     #160628-00002#2--add--end
     #檢核金額不可超出可沖金額,超出則不寫入
     CALL s_aapt420_apcc_used_chk(l_apce.apce002,l_apce.apceld,l_apce.apceld,l_apce.apce003,l_apce.apce004,l_apce.apce005,
                                  l_apce.apce109,l_apce.apcedocno,l_apce.apceseq,'1','0')
        RETURNING g_sub_success,g_errno
     IF NOT g_sub_success THEN
        CONTINUE FOREACH
     END IF
     #帶預設會計科目
     LET l_apce.apce016 = s_aapt420_bring_acc_code(l_apce.apceld,l_apce.apce002,l_apce.apce003,l_apce.apce004,p_sfin2002)    
     #151001--s
     LET l_apce.apce027 = NULL
     #直接沖帳,要寫入應稅折抵否欄位
     IF g_prog[1,5] = 'aapt3' THEN
        #應稅折抵否
        LET l_apce.apce027 = aapt300_02_get_apce027(l_apce.apce003) 
        #170929-00040#1---add---str--
        IF l_apce.apce027 = 'N' THEN
           LET l_apce.apce103=l_apce.apce109
           LET l_apce.apce104=0
           LET l_apce.apce113=l_apce.apce119
           LET l_apce.apce114=0
           IF l_glaa015='Y' THEN
              LET l_apce.apce123=l_apce.apce129
              LET l_apce.apce124=0
           END IF
           IF l_glaa019='Y' THEN
              LET l_apce.apce133=l_apce.apce139
              LET l_apce.apce134=0
           END IF
        END IF
        #170929-00040#1---add---end--
     END IF
     #151001--e
     
     #寫入帳款單身
     INSERT INTO apce_t
                 (apceent,
                  apceld,apcedocno,
                  apceseq,
                  apce002,apceorga,apce003,apce004,apce005,
                  apce010,apce038,apce048,apce024,apce015,
                  apce100,apce109,apce101,apce119,apce031,
                  apce049,apcecomp,apcesite,apce001,apce016,
                  apce017,apce018,apce019,apce020,apce022,
                  apce023,apce035,apce036,apce044,apce045,
                  apce046,apce051,apce052,apce053,apce054,
                  apce055,apce056,apce057,apce058,apce059,
                  apce060,apce120,apce121,apce129,apce130,
                  apce103,apce104,apce113,apce114, #160628-00002#2 add
                  apce123,apce124,apce133,apce134, #160628-00002#2 add
                  apce131,apce139,apce027)    #151001 add apce027
           VALUES(g_enterprise,
                  l_apce.apceld,l_apce.apcedocno,
                  l_apce.apceseq,
                  l_apce.apce002,l_apce.apceorga,l_apce.apce003,l_apce.apce004,l_apce.apce005,
                  l_apce.apce010,l_apce.apce038,l_apce.apce048,l_apce.apce024,l_apce.apce015,
                  l_apce.apce100,l_apce.apce109,l_apce.apce101,l_apce.apce119,l_apce.apce031,
                  l_apce.apce049,l_apce.apcecomp,l_apce.apcesite,l_apce.apce001,l_apce.apce016,
                  l_apce.apce017,l_apce.apce018,l_apce.apce019,l_apce.apce020,l_apce.apce022,
                  l_apce.apce023,l_apce.apce035,l_apce.apce036,l_apce.apce044,l_apce.apce045,
                  l_apce.apce046,l_apce.apce051,l_apce.apce052,l_apce.apce053,l_apce.apce054,
                  l_apce.apce055,l_apce.apce056,l_apce.apce057,l_apce.apce058,l_apce.apce059,
                  l_apce.apce060,l_apce.apce120,l_apce.apce121,l_apce.apce129,l_apce.apce130,
                  l_apce.apce103,l_apce.apce104,l_apce.apce113,l_apce.apce114, #160628-00002#2 add
                  l_apce.apce123,l_apce.apce124,l_apce.apce133,l_apce.apce134, #160628-00002#2 add
                  l_apce.apce131,l_apce.apce139,l_apce.apce027)      #151001 add apce027
      IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins apce_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF                        
   END FOREACH                  
   RETURN r_success   
END FUNCTION

################################################################################
# Descriptions...: 預帶未沖金額
# Memo...........:
# Usage..........: CALL s_aapt420_amt_default(p_apdadocno,p_apdald)
# Input parameter: apdadocno   單號
#                : apdald      帳套
# Return code....: r_apce109   原幣沖帳金額
#                : r_apce119   本幣沖帳金額
#                : r_apce101   匯率
# Date & Author..: 2015/03/03 By Hans
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_amt_default(p_apdadocno,p_apdald)
DEFINE p_apdadocno LIKE apda_t.apdadocno
DEFINE p_apdald    LIKE apda_t.apdald
DEFINE l_apce109   LIKE apce_t.apce109
DEFINE l_apce119   LIKE apce_t.apce119
DEFINE r_apce109   LIKE apce_t.apce109
DEFINE r_apce119   LIKE apce_t.apce119
DEFINE r_apce101   LIKE apce_t.apce101
     
   SELECT SUM(CASE apce015 WHEN 'D' THEN apce119 ELSE 0 END) - SUM(CASE apce015 WHEN 'C' THEN apce119 ELSE 0 END),
          SUM(CASE apce015 WHEN 'D' THEN apce119 ELSE 0 END) - SUM(CASE apce015 WHEN 'C' THEN apce119 ELSE 0 END)               
     INTO l_apce109,l_apce119 
     FROM apce_t
    WHERE apceent = g_enterprise
      AND apcedocno = p_apdadocno
      AND apceld = p_apdald 
   IF cl_null(l_apce109) THEN LET l_apce109 = 0 END IF
   IF cl_null(l_apce119) THEN LET l_apce119 = 0 END IF
   
   SELECT SUM(CASE apde015 WHEN 'C' THEN apde119 ELSE 0 END) - SUM(CASE apde015 WHEN 'D' THEN apde119 ELSE 0 END), 
          SUM(CASE apde015 WHEN 'C' THEN apde119 ELSE 0 END) - SUM(CASE apde015 WHEN 'D' THEN apde119 ELSE 0 END)               
     INTO r_apce109,r_apce119 
     FROM apde_t
    WHERE apdeent = g_enterprise
      AND apdedocno = p_apdadocno
      AND apdeld = p_apdald 
   IF cl_null(r_apce109) THEN LET r_apce109 = 0 END IF
   IF cl_null(r_apce119) THEN LET r_apce119 = 0 END IF  

   LET r_apce109 = l_apce109 - r_apce109
   LET r_apce119 = l_apce119 - r_apce119
   
   #傳回絕對值
   LET r_apce109 = s_math_abs(r_apce109)
   LET r_apce119 = s_math_abs(r_apce109)


   LET r_apce101 = 1
   
   RETURN r_apce109,r_apce119,r_apce101
END FUNCTION
################################################################################
# Descriptions...: 檢核帳款單號+項次+期別存在否
# Memo...........:
# Usage..........: s_aapt420_exist_chk(p_type,p_ld,p_docno,p_seq,p_period)
#                  RETURNING r_success,r_errno
# Input parameter: p_type         類別(應付/應收)
#                : p_ld           帳別
#                : p_docno        單據號碼
#                : p_seq          項次
#                : p_period       期別
#                : p_apca005      付款對象
#                : p_apcadocno    立帳單號
# Return code....: r_success      正確否
#                : r_errno        錯誤訊息代碼
# Date & Author..: 14/10/13 By apo
# Modify.........:
#150602-00031#1   2015/06/02   By apo   增加傳入付款對象
#150622-00004#1   2015/06/26   By apo   帳套設定為核銷限定立帳已產生傳票,且立帳單別需產生分錄,則必須有傳票號碼才可以沖帳
#151006           151006       By albireo  kris,carol:核銷單身開窗限制核銷對象,可沖銷單據檢核限制核銷對象及其交易夥伴
#160816-00022#1   2016/08/22   By 03538    carol,kris:2*單據,於aapt420/aapt430中只能有一者存在
################################################################################
PUBLIC FUNCTION s_aapt420_exist_chk(p_type,p_ld,p_docno,p_seq,p_period,p_apca005,p_apcadocno)
   DEFINE p_type     LIKE apeb_t.apeb002
   DEFINE p_ld       LIKE apca_t.apcald
   DEFINE p_docno    LIKE apca_t.apcadocno
   DEFINE p_seq      LIKE apcb_t.apcbseq
   DEFINE p_period   LIKE apcc_t.apcc001
   DEFINE p_apca005  LIKE apca_t.apca005  #150602-00031#1
   DEFINE p_apcadocno LIKE apca_t.apcadocno #151130-00015#4
   DEFINE l_apca005  LIKE apca_t.apca005  #150602-00031#1
   DEFINE l_apca001  LIKE apca_t.apca001  #150819 by 03538
   DEFINE l_apca004  LIKE apca_t.apca004  #150819 by 03538
   DEFINE l_cnt      LIKE type_t.num5
   DEFINE l_cnt2     LIKE type_t.num5     #150602-00031#1
   #150622-00004#1--(s)
   DEFINE l_glaa136   LIKE glaa_t.glaa136
   DEFINE l_glaa137   LIKE glaa_t.glaa137   #151027-00014#1  
   DEFINE l_glaacomp  LIKE glaa_t.glaacomp
   DEFINE l_slip      LIKE ooba_t.ooba002
   DEFINE l_dfin0030  LIKE type_t.chr1 
   #150622-00004#1--(e)
   DEFINE l_apcastus LIKE apca_t.apcastus
   DEFINE r_success  LIKE type_t.num5
   DEFINE r_errno    LIKE gzze_t.gzze001
   
   #albireo 151006-----s
   DEFINE l_cnt3     LIKE type_t.num10
   #albireo 151006-----e
   DEFINE l_sfin3020  LIKE type_t.chr1       #151130-00015#4
   DEFINE l_apcacomp  LIKE apca_t.apcacomp   #151130-00015#4
   DEFINE l_count     LIKE type_t.num10      #160816-00022#1
   #160802-00007#2-----s
   DEFINE p_lsjs       STRING
   DEFINE l_par        RECORD
                       apca057   LIKE apca_t.apca057,
                       apcadocno LIKE apca_t.apcadocno
                       END RECORD
   DEFINE l_apca057    LIKE apca_t.apca057
   DEFINE l_pmaa004    LIKE pmaa_t.pmaa004
   #160802-00007#2-----e
   
   WHENEVER ERROR CONTINUE

   #160802-00007#2-----s   
   CALL util.JSON.parse(p_lsjs,l_par)

   IF cl_null(l_par.apcadocno) AND cl_null(l_par.apca057)THEN
      LET p_apcadocno = p_lsjs CLIPPED
   ELSE
      LET p_apcadocno = l_par.apcadocno
   END IF

   LET l_pmaa004 = NULL
   SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t
    WHERE pmaaent = g_enterprise
      AND pmaa001 = p_apca005
   #160802-00007#2-----e

   LET r_success = TRUE
   LET r_errno =''
   #檢核單號+項次+帳期是否存在
   CASE p_type[1,1]
      WHEN '4' #應付
         #SELECT COUNT(*) INTO l_cnt         #161114-00009#1 mark
         SELECT COUNT(apccdocno) INTO l_cnt  #161114-00009#1 add
           FROM apcc_t
          WHERE apccent = g_enterprise
            AND apccld  = p_ld
            AND apccdocno = p_docno
            AND apccseq = p_seq
            AND apcc001 = p_period
         #150602-00031#1--(s)
        #SELECT apca005 INTO l_apca005                                       #150819 by 03538 mark
         SELECT apca001,apca004,apca005,apcastus,apcacomp              #150921-00074 增加確認碼判斷 #151130-00015#4 增加apcacomp
               ,apca057     #160802-00007#2
           INTO l_apca001,l_apca004,l_apca005,l_apcastus,l_apcacomp    #150819 by 03538
               ,l_apca057   #160802-00007#2
           FROM apca_t
          WHERE apcaent = g_enterprise
            AND apcald  = p_ld
            AND apcadocno = p_docno
         #150921-00074
         IF l_apcastus <> 'Y' THEN
            LET r_success = FALSE
            LET r_errno = 'aap-00324'
            RETURN r_success,r_errno
         END IF
         #151009--s
         IF l_apca001[1,1] = '0' THEN
            LET r_success = FALSE
            LET r_errno = 'aap-00398'
            RETURN r_success,r_errno         
         END IF
         #151009--e
         #150921-00074
         #151130-00015#4--(S)
         IF g_prog[1,5] MATCHES 'aapt3' AND NOT cl_null(p_apcadocno) THEN
            CALL cl_get_para(g_enterprise,l_apcacomp,'S-FIN-3020') RETURNING l_sfin3020 
            IF cl_null(l_sfin3020) THEN LET l_sfin3020 = 'N' END IF
            IF l_sfin3020 = 'Y' THEN
               LET l_cnt = 0 
               LET l_cnt2 = 0   #161124-00029#1 add
               #SELECT count(*) INTO l_cnt  #161114-00009#1 mark
               SELECT count(1) INTO l_cnt   #161114-00009#1 add
                 FROM apcb_t,pmdt_t
                WHERE apcbent = g_enterprise 
                  AND apcbld  = p_ld AND apcbdocno = ''     #立帳單
                  AND apcbent = pmdtent AND apcb001 = '11'  
                  AND apcb002 = pmdtdocno AND apcb003 = pmdtseq
                  AND pmdt001 IN (SELECT apcb002 FROM apcb_t
                                   WHERE apcbent = g_enterprise AND apcbld = p_ld  
                                     AND apcbdocno = (SELECT apcadocno FROM apca_t  WHERE apcaent = g_enterprise AND apcald = p_ld AND apca019 = p_apcadocno)
                                  )
               #161124-00029#1---add---str--
               #SELECT COUNT(*) INTO l_cnt2         #161114-00009#1 mark
               SELECT COUNT(apcbdocno) INTO l_cnt2  #161114-00009#1 add
                 FROM apcb_t
                WHERE apcbent = g_enterprise 
                  AND apcbld = p_ld 
                  AND apcbdocno = p_apcadocno
                  AND apcb001 = '11'
               IF cl_null(l_cnt2) THEN LET l_cnt2 = 0 END IF
               #161124-00029#1---add---end--
               #IF l_cnt = 0 THEN                 #161124-00029#1 mark
               IF l_cnt = 0 AND l_cnt2 > 0 THEN   #161124-00029#1 add
                  LET r_success = FALSE
                  LET r_errno = 'aap-00424'
                  RETURN r_success,r_errno  
               END IF
            END IF
         END IF
         #151130-00015#4--(E)
         #160816-00022#1--s
         #待抵單
         #IF l_apca001 MATCHES '2*' THEN  #170618-00252#1 mark
         IF l_apca001 MATCHES '2*' AND l_apca001 NOT MATCHES '2[249]'  THEN    #170618-00252#1
            LET l_count = 0
            SELECT COUNT(apce001) INTO l_count
              FROM apce_t
             WHERE apceent = g_enterprise
               AND apceld = p_ld
               AND apce003 = p_docno
               AND apce001 = 'aapt430'   #存在分攤就不能核銷
               AND EXISTS (SELECT 1 FROM apda_t WHERE apceent = apdaent AND apceld = apdald 
                                                   AND apcedocno = apdadocno AND apdastus NOT IN('X'))                                                                                    
            IF cl_null(l_count) THEN LET l_count = 0 END IF
            IF l_count > 0 THEN
               LET r_success = FALSE
               LET r_errno = 'aap-00584'
               RETURN r_success,r_errno           
            END IF            
         END IF
         #160816-00022#1--e
         #150819 by 03538--s
         IF l_apca001 = '15' THEN   #員工報支
            IF l_apca004 <> p_apca005 THEN
               LET r_success = FALSE
               LET r_errno = 'aap-00370'
               RETURN r_success,r_errno
            END IF
         ELSE
         #150819 by 03538--e
            IF l_apca005 <> p_apca005 THEN
               #160802-00007#2-----s
               IF l_pmaa004 = '2' THEN
                  IF l_apca057 <> l_par.apca057 THEN
                     LET r_success = FALSE
                     LET r_errno = 'aap-00370'
                     RETURN r_success,r_errno                  
                  END IF
               ELSE
               #160802-00007#2-----e
                  #albireo 151008-----s
                  LET l_cnt3 = NULL
                  #SELECT COUNT(*) INTO l_cnt3 FROM pmac_t      #161114-00009#1 mark
                  SELECT COUNT(pmac001) INTO l_cnt3 FROM pmac_t #161114-00009#1 add
                   WHERE pmacent = g_enterprise
                     AND pmac001 = p_apca005
                     AND pmac002 = l_apca005
                     AND pmacstus = 'Y'
                  IF cl_null(l_cnt3)THEN LET l_cnt3 = 0 END IF       
                  IF l_cnt3 = 0 THEN
                     LET r_success = FALSE
                     LET r_errno = 'aap-00370'
                     RETURN r_success,r_errno     #150622-00004#1
                  END IF            
                  #albireo 151008-----e
               END IF    #160802-00007#2 add
            END IF
         END IF   #150819 by 03538
         LET l_cnt2 = 0                      #150616 apo
         IF p_type MATCHES '4[12]' THEN      #150616 apo
            SELECT COUNT(apcadocno) INTO l_cnt2
              FROM apca_t,apcc_t
             WHERE apcaent = apccent
               AND apcald = apccld
               AND apcadocno = apccdocno
               AND apcastus = 'Y'
               #AND apcc108 - apcc109 > 0   #170627-00020#1 mark
               AND ((apcc108 - apcc109 > 0 AND apca001 NOT IN ('11','14')) OR (apcc109 = 0  AND apca001 IN ('11','14')))   #170627-00020#1 add
               AND apcaent = g_enterprise
               AND apcald  = p_ld
               AND apca019 = p_docno         
         END IF  #150616 apo
         #150602-00031#1--(e)
      WHEN '3' #應收
         #SELECT COUNT(*) INTO l_cnt          #161114-00009#1 mark
         SELECT COUNT(xrccdocno) INTO l_cnt   #161114-00009#1 add
           FROM xrcc_t
          WHERE xrccent = g_enterprise
            AND xrccld  = p_ld
            AND xrccdocno = p_docno
            AND xrccseq = p_seq
            AND xrcc001 = p_period
         #150602-00031#1--(s)
        #SELECT xrca004 INTO l_apca005    #151009 mark  #albireo 151006  modify  xrca005=>xrca004
         SELECT xrca004,xrca001,xrcastus 
               ,xrca057     #160802-00007#2
           INTO l_apca005,l_apca001,l_apcastus    #151009 add xrca001,xrcastus
               ,l_apca057   #160802-00007#2
           FROM xrca_t
          WHERE xrcaent = g_enterprise
            AND xrcald  = p_ld
            AND xrcadocno = p_docno 
         #151009--s
         IF l_apcastus <> 'Y' THEN
            LET r_success = FALSE
            LET r_errno = 'aap-00324'
            RETURN r_success,r_errno
         END IF

         IF l_apca001[1,1] = '0' THEN
            LET r_success = FALSE
            LET r_errno = 'aap-00398'
            RETURN r_success,r_errno         
         END IF
         #151009--e
         IF l_apca005 <> p_apca005 THEN
            #160802-00007#2-----s
            IF l_pmaa004 = '2' THEN
               IF l_apca057 <> l_par.apca057 THEN
                  LET r_success = FALSE
                  LET r_errno = 'aap-00370'
                  RETURN r_success,r_errno                  
               END IF
            ELSE
            #160802-00007#2-----e
               #albireo 151006-----s
               LET l_cnt3 = NULL
               #SELECT COUNT(*) INTO l_cnt3 FROM pmac_t      #161114-00009#1 mark
               SELECT COUNT(pmac001) INTO l_cnt3 FROM pmac_t #161114-00009#1 add
                WHERE pmacent = g_enterprise
                  AND pmac001 = p_apca005
                  AND pmac002 = l_apca005
                  AND pmacstus = 'Y'
               IF cl_null(l_cnt3)THEN LET l_cnt3 = 0 END IF       
               IF l_cnt3 = 0 THEN
                  LET r_success = FALSE
                  LET r_errno = 'aap-00370'
                  RETURN r_success,r_errno     #150622-00004#1
               END IF            
            #albireo 151006-----e
            END IF   #160802-00007#2
         END IF           
         LET l_cnt2 = 0                      #150616 apo
         IF p_type MATCHES '3[12]' THEN      #150616 apo
            SELECT COUNT(xrcadocno) INTO l_cnt2
              FROM xrca_t,xrcc_t
             WHERE xrcaent = xrccent
               AND xrcald = xrccld
               AND xrcadocno = xrccdocno
               AND xrcastus = 'Y'
               AND xrcc108 - xrcc109 > 0
               AND xrcaent = g_enterprise
               AND xrcald  = p_ld
               AND xrca019 = p_docno
         END IF  #150616 apo
         #150602-00031#1--(e)            
   END CASE
   IF l_cnt = 0 THEN
      LET r_success = FALSE
      LET r_errno    = 'aap-00196'
      RETURN r_success,r_errno     #150622-00004#1
   END IF
   #150602-00031#1--(s)
   IF l_cnt > 0 AND l_cnt2 > 0 THEN
      LET r_success = FALSE
      CASE p_type[1,1]
         WHEN '4'
            LET r_errno    = 'aap-00368'
         WHEN '3'
            LET r_errno    = 'aap-00369'         
      END CASE      
      RETURN r_success,r_errno     #150622-00004#1
   END IF   
   #150602-00031#1--(e)
   #150622-00004#1--(s)
   CALL s_ld_sel_glaa(p_ld,'glaa136|glaa137|glaacomp') RETURNING  g_sub_success,l_glaa136,l_glaa137,l_glaacomp   #151027-00014#1 add 137
  #IF l_glaa136 = 'Y' THEN                                                                     #151027-00014#1 mark
   IF (p_type[1,1] = '4' AND l_glaa137 = 'Y') OR (p_type[1,1] = '3' AND l_glaa136 = 'Y') THEN   #151027-00014#1 
      CALL s_aooi200_fin_get_slip(p_docno) RETURNING g_sub_success,l_slip
      CALL s_fin_get_doc_para(p_ld,l_glaacomp,l_slip,'D-FIN-0030') RETURNING l_dfin0030
      IF l_dfin0030 = 'Y' THEN
         LET l_cnt = 0
         CASE p_type[1,1]
            WHEN '4'
               SELECT COUNT(apcadocno) INTO l_cnt
                 FROM apca_t
                WHERE apcaent = g_enterprise
                  AND apcadocno = p_docno
                  AND apcald = p_ld
                 #AND apca038 IS NULL  #151027-00014#1 mark
                 #151027-00014#1--s
                  AND 
                 (
                     apca038 IS NULL OR 
                    (apca038 IS NOT NULL AND ( NOT EXISTS
                                                  (SELECT 1 FROM glap_t
                                                    WHERE glapent = apcaent 
                                                      AND glapdocno = apca038 
                                                      AND glapld = apcald 
                                                     #AND glapstus = 'Y') ))           #151105 mark
                                                      AND glapstus IN ('Y','S') ) ))   #151105                                                      
                 )
                 #151027-00014#1--e                  
            WHEN '3'
               SELECT COUNT(xrcadocno) INTO l_cnt
                 FROM xrca_t
                WHERE xrcaent = g_enterprise
                  AND xrcadocno = p_docno
                  AND xrcald = p_ld
                  AND xrca038 IS NULL         
         END CASE
         IF l_cnt > 0 THEN
            LET r_success = FALSE
            #151027-00014#1--s
            IF p_type[1,1] = '4' THEN
               LET r_errno = 'aap-00401'
            ELSE
            #151027-00014#1--e
               LET r_errno = 'aap-00376'
            END IF   #151027-00014#1
            RETURN r_success,r_errno    
         END IF 
      END IF
   END IF
   #150622-00004#1--(e)
   RETURN r_success,r_errno     
END FUNCTION
################################################################################
# Descriptions...: 依帳款類型進行帳款單號開窗
# Memo...........:
# Usage..........: CALL s_aapt420_source_doc_query(p_ld,p_apeb002,p_apeb003,p_comp,p_apea005,p_docdt,p_lsjs)
#                  RETURNING r_apeb003,r_apeb004,r_apeb005,r_apeb008
# Input parameter: p_ld           帳套
#                : p_apeb002      帳款類型
#                : p_apeb003      單號預設值
#                : p_comp         來源組織所屬法人
#                : p_apea005      付款對象
#                : p_docdt        核銷日期
#                : p_lsjs
# Return code....: r_apeb003      帳款單號
#                : r_apeb004      帳款項次
#                : r_apeb005      帳期
#                : r_apeb008      發票號碼
# Date & Author..: 14/10/10 By apo
# Modify.........: #161206-00042#8 By 08732 傳入參數p_apcadocno改成p_lsjs
################################################################################
PUBLIC FUNCTION s_aapt420_source_doc_query(p_ld,p_apeb002,p_apeb003,p_comp,p_apea005,p_docdt,p_lsjs)
DEFINE p_ld        LIKE apda_t.apdald   #150622-00004#1
DEFINE p_apeb002   LIKE apeb_t.apeb002
DEFINE p_apeb003   LIKE apeb_t.apeb003
DEFINE p_comp      LIKE apca_t.apcacomp
DEFINE p_apea005   LIKE apea_t.apea005
DEFINE p_apcadocno LIKE apca_t.apcadocno     #151130-00015#4
DEFINE p_docdt     LIKE apda_t.apdadocdt
DEFINE r_apeb003   LIKE apeb_t.apeb003
DEFINE r_apeb004   LIKE apeb_t.apeb004
DEFINE r_apeb005   LIKE apeb_t.apeb005
DEFINE r_apeb008   LIKE apeb_t.apeb008
#150512-00036#1--(s)
DEFINE r_wc        STRING
#150512-00036#1--(e)
#150622-00004#1--(s)
DEFINE l_glaa024   LIKE glaa_t.glaa024
DEFINE l_glaa136   LIKE glaa_t.glaa136   
DEFINE l_glaa137   LIKE glaa_t.glaa137     #151027-00014#1
DEFINE l_str       LIKE type_t.num5
DEFINE l_end       LIKE type_t.num5
#150622-00004#1--(e)
DEFINE l_sfin3020  LIKE type_t.chr1       #151130-00015#4
#160802-00007#2-----s
DEFINE p_lsjs       STRING
DEFINE l_par        RECORD
                    apca057   LIKE apca_t.apca057,
                    apcadocno LIKE apca_t.apcadocno
                    END RECORD
DEFINE l_apca057    LIKE apca_t.apca057
DEFINE l_pmaa004    LIKE pmaa_t.pmaa004
#160802-00007#2-----e
DEFINE l_apca100    LIKE apca_t.apca100   #170621-00044#1 add

WHENEVER ERROR CONTINUE
   #160802-00007#2-----s   
   CALL util.JSON.parse(p_lsjs,l_par)

   IF cl_null(l_par.apcadocno) AND cl_null(l_par.apca057)THEN
      LET p_apcadocno = p_lsjs CLIPPED
   ELSE
      LET p_apcadocno = l_par.apcadocno
   END IF

   LET l_pmaa004 = NULL
   SELECT pmaa004 INTO l_pmaa004 FROM pmaa_t
    WHERE pmaaent = g_enterprise
      AND pmaa001 = p_apea005
   #160802-00007#2-----e

   INITIALIZE g_qryparam.* TO NULL
   LET g_qryparam.state = 'm'   #150512-00036#1 mod c-->m
   LET g_qryparam.reqry = FALSE
   LET g_qryparam.arg1 = p_comp
   LET g_qryparam.arg2 = p_apea005
   LET g_qryparam.arg3 = p_docdt
   LET g_qryparam.default1 = p_apeb003
   #150622-00004#1--(s)
   CALL s_ld_sel_glaa(p_ld,'glaa024|glaa136|glaa137') RETURNING  g_sub_success,l_glaa024,l_glaa136,l_glaa137   #151027-00014#1 add 137
   #帳套設定:應付核銷限定立帳己產生傳票
  #IF l_glaa136 = 'Y' THEN                                                                            #151027-00014#1 mark
   IF (p_apeb002[1,1] = '4' AND l_glaa137 = 'Y') OR (p_apeb002[1,1] = '3' AND l_glaa136 = 'Y') THEN   #151027-00014#1
      CALL s_aapt420_get_slip_pos('') RETURNING l_str,l_end
      LET g_qryparam.where = 
      #排除所屬單別參數"產生分錄傳票否"為Y,但尚未產生傳票者
      " NOT (",
      "      EXISTS (SELECT 1 FROM ooac_t ",
      "               WHERE ooacent = apcaent ",
      "                 AND ooac001 = '",l_glaa024,"' ",
      "                 AND ooac002 = SUBSTR(apcadocno,",l_str,",",l_end,") ",
      "                 AND ooac003 = 'D-FIN-0030' ",
      "                 AND ooac004 ='Y') "
     #"         AND apca038 IS NULL",   #151027-00014#1 mark
      #151027-00014#1--s
      IF p_apeb002[1,1] = '4' THEN
         LET g_qryparam.where = g_qryparam.where,
      "         AND ",
      "        ( ",
      "            apca038 IS NULL OR ", 
      "           (apca038 IS NOT NULL AND ( NOT EXISTS ",
      "                                         (SELECT 1 FROM glap_t ",
      "                                           WHERE glapent = apcaent ", 
      "                                             AND glapdocno = apca038 ", 
      "                                             AND glapld = apcald ", 
     #"                                             AND glapstus = 'Y') )) ",           #151105 mark
      "                                             AND glapstus IN ('Y','S') ) )) ",   #151105      
      "         ) "
      ELSE
         LET g_qryparam.where = g_qryparam.where,
      "         AND apca038 IS NULL "
      END IF
      LET g_qryparam.where = g_qryparam.where,
      #151027-00014#1--e          
      "     )  ",
      " AND "
      IF p_apeb002[1,1] = '3' THEN
         LET g_qryparam.where = cl_replace_str(g_qryparam.where,'apca','xrca')
      END IF
   END IF
   #150622-00004#1--(e)

   CASE
      ###應付###
      WHEN p_apeb002[1,1] = '4'
         #160802-00007#2-----s
         IF l_pmaa004 = '2' THEN
            LET g_qryparam.where = g_qryparam.where CLIPPED,                             
                                " apcacomp ='",p_comp,"' ",
                                " AND apca005 = '",p_apea005,"' ",
                                " AND apca057 = '",l_par.apca057,"' ",
                                " AND apcadocdt <= '",p_docdt,"' AND "   
         ELSE
         #160802-00007#2-----e
            LET g_qryparam.where = g_qryparam.where CLIPPED,                             
                                #" apcacomp ='",p_comp,"' AND ( (apca004 = '",p_apea005,"' AND apca001='15') OR apca005 ='",p_apea005,"') AND ",    #150819 by 03538
                                #albireo 151016-----s
                                " apcacomp ='",p_comp,"' ",
                                " AND ((apca004 = '",p_apea005,"' AND apca001='15') OR apca005 = '",p_apea005,"' ",
                                "         OR apca005 IN (SELECT pmac002 FROM pmac_t ",
                                "                     WHERE pmacent = ",g_enterprise,
                                "                       AND pmac001 = '",p_apea005,"' ",
                                "                       AND pmacstus = 'Y' )",                                    
                                "     )",
                                #albireo 151016-----e
                                " AND apcadocdt <= '",p_docdt,"' AND "   #150819 by 03538   #151020 by 03538 add AND
         END IF  #160802-00007#2 
         CASE p_apeb002
            WHEN '40'
               #LET g_qryparam.where = g_qryparam.where CLIPPED," apca001 LIKE '1%' "       #150512-00036#1         #170308-00034#5 mark               
               #LET g_qryparam.where = g_qryparam.where CLIPPED," (apca001 LIKE '2%' OR apca001 IN ('31') ) "        #170308-00034#5 add     
               LET g_qryparam.where = g_qryparam.where CLIPPED," (apca001 LIKE '1%' OR apca001 IN ('31') ) "#170324-00128#1 add               
            WHEN '41'
               LET g_qryparam.where = g_qryparam.where CLIPPED," apca001 LIKE '2%' AND apca001 <> '25' "   #150512-00036#1
               #151130-00015#4
               IF g_prog[1,5] MATCHES 'aapt3' AND NOT cl_null(p_apcadocno) THEN
                  CALL cl_get_para(g_enterprise,p_comp,'S-FIN-3020') RETURNING l_sfin3020 
                  IF cl_null(l_sfin3020) THEN LET l_sfin3020 = 'N' END IF
                  IF l_sfin3020 = 'Y' THEN
                     LET g_qryparam.where = g_qryparam.where CLIPPED,
                         " AND ((apca001 <>'21' AND apca001 LIKE '2%') OR ",
                               "(apca001 ='21'  AND apcadocno IN (",
                                                    " SELECT apca019 FROM apcb_t,pmdt_t,apca_t", #apcb:立帳單的單身,apca:訂金單的待抵單號
                                                    "  WHERE apcbdocno = '",p_apcadocno,"' AND apcb001 = '11'",
                                                    "    AND apcbent = ",g_enterprise," ", #170615-00061#11 add
                                                    "    AND apcb002 = pmdtdocno AND apcb003 = pmdtseq AND apcbent = pmdtent ",
                                                    "    AND apcaent = pmdtent AND pmdt001 = apca018  AND apcacomp = '",p_comp,"')",
                               ")",
                              ")"
                  END IF
               END IF
               #151130-00015#4
               
            WHEN '42'
               LET g_qryparam.where = g_qryparam.where CLIPPED," apca001 = '25' "                          #150512-00036#1
         END CASE
         #160628-00002#2--add--str--
         #IF g_prog = 'aapt420' AND (p_apeb002='41' OR p_apeb002='42') THEN   #170301-00021#1 by 09263 --mark
         IF g_prog MATCHES 'aapt420*' AND (p_apeb002='41' OR p_apeb002='42') THEN   #170301-00021#1 by 09263 --add
            #LET g_qryparam.where = g_qryparam.where CLIPPED," AND apca060 <> '2'"    #161209-00035#1 mark
            #161209-00035#1-----s
            LET g_qryparam.where = g_qryparam.where CLIPPED,
                                   #"  AND (apca060 <> '2' OR (apca060 = '2' AND apca001 IN ('22','24','29')))"        #170330-00083#1  add '29'   #170802-00061#1 mark
                                   "  AND (apca060 <> '2' OR apca060 IS NULL OR (apca060 = '2' AND apca001 IN ('22','24','29')))"   #170802-00061#1 add
            #161209-00035#1-----e
         END IF
         #160628-00002#2--add--end
  
         #CALL q_apcadocno_3()        #應付帳款單號查詢   #161201-00031#1 mark
         
         #170621-00044#1 --s add aapt3*沖帳來源單幣別限定與原幣相同
         IF g_prog[1,5] MATCHES 'aapt3' AND NOT cl_null(p_apcadocno) THEN 
            LET l_apca100 = ''
            SELECT apca100 INTO l_apca100 FROM apca_t 
             WHERE apcaent = g_enterprise AND apcald = p_ld AND apcadocno = p_apcadocno
             
            IF NOT cl_null(l_apca100) THEN
               LET g_qryparam.where = g_qryparam.where CLIPPED," AND apcc100 = '",l_apca100,"' "
            END IF 
         END IF         
         #170621-00044#1 --e add
         
         CALL aapt420_03()                             #161201-00031#1 add
     ###應收###
      WHEN p_apeb002[1,1] = '3'
         #160802-00007#2-----s
         IF l_pmaa004 = '2' THEN
            LET g_qryparam.where = g_qryparam.where CLIPPED,
                                 " xrcacomp ='",p_comp,"' ",
                    "                                 AND xrca004 = '",p_apea005,"'  ",
                                 "                    AND xrca057 = '",l_par.apca057,"' ",
                                 " AND xrcadocdt <= '",p_docdt,"' AND " 
         ELSE
         #160802-00007#2-----e
            LET g_qryparam.where = g_qryparam.where CLIPPED,
                                 #" xrcacomp ='",p_comp,"' AND xrca005 ='",p_apea005,"' AND xrcadocdt <= '",p_docdt,"' AND "  #150512-00036#1
                                 #albireo 151016-----s
                                 " xrcacomp ='",p_comp,"' ",
                    "                                 AND (xrca004 = '",p_apea005,"'  ",
                                 "                                      OR xrca004 IN(SELECT pmac002 FROM pmac_t ",
                                 "                                                     WHERE pmacent = ",g_enterprise,
                                 "                                                       AND pmac001 = '",p_apea005,"' ",
                                 "                                                       AND pmacstus = 'Y' ",
                                 "                                     )) ",
                                 " AND xrcadocdt <= '",p_docdt,"' AND " 
                                 #albireo 151016-----e
         END IF  #160802-00007#2
         CASE p_apeb002
            WHEN '30'
               LET g_qryparam.where = g_qryparam.where CLIPPED," xrca001 LIKE '1%' "                      #150512-00036#1
            WHEN '31'
               LET g_qryparam.where = g_qryparam.where CLIPPED," xrca001 LIKE '2%' AND xrca001 <> '25' "  #150512-00036#1
            WHEN '32'
               LET g_qryparam.where = g_qryparam.where CLIPPED," xrca001 = '25' "                         #150512-00036#1
         END CASE
         #160628-00002#2--add--str--
         #IF g_prog = 'aapt420' AND (p_apeb002='31' OR p_apeb002='32') THEN   #170301-00021#1 by 09263 --mark
         IF g_prog MATCHES 'aapt420*' AND (p_apeb002='31' OR p_apeb002='32') THEN   #170301-00021#1 by 09263 --add
            #LET g_qryparam.where = g_qryparam.where CLIPPED," AND xrca060 <> '2'"    161209-00035#1 mark
            #161209-00035#1-----s
            LET g_qryparam.where = g_qryparam.where CLIPPED,
                                   "  AND (xrca060 <> '2' OR (xrca060 = '2' AND xrca001 IN ('22','24')))"
            #161209-00035#1-----e
         END IF
         #160628-00002#2--add--end
         #CALL q_xrcadocno_8()        #應收帳款單號查詢     #161201-00031#1 mark
         CALL aapt420_04()                             #161201-00031#1 add
   END CASE
   #150512-00036#1--(S) 
   CALL s_aapt420_get_contolp_wc(g_qryparam.str_array) RETURNING r_wc
   #如果是應收單號開窗,將回傳條件替換成應收欄位
   IF p_apeb002[1,1] = '3' THEN
      LET r_wc = cl_replace_str(r_wc,'apcc','xrcc')
   END IF
   RETURN r_wc 
   #150512-00036#1--(E)    
   #150512-00036#1--mark--(S)
   ##將開窗取得的值回傳到變數
   #LET r_apeb003 = g_qryparam.return1
   #LET r_apeb004 = g_qryparam.return2
   #LET r_apeb005 = g_qryparam.return3
   #LET r_apeb008 = g_qryparam.return4
   #RETURN r_apeb003,r_apeb004,r_apeb005,r_apeb008               
   #150512-00036#1--mark--(E)
END FUNCTION

################################################################################
# Descriptions...: 更新核銷單借貸方金額欄位
# Memo...........:
# Usage..........: CALL s_aapt420_upd_dc_money(p_apdald,p_apdadocno)
#                  RETURNING r_success 
# Input parameter: p_apdald       帳套
#                : p_apdadocno    單號
# Return code....: r_success
# Date & Author..: 15/03/25 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_upd_dc_money(p_apdald,p_apdadocno)
DEFINE p_apdald         LIKE apda_t.apdald
DEFINE p_apdadocno      LIKE apda_t.apdadocno
DEFINE r_success        LIKE type_t.num5
#借方金額
DEFINE l_apce109_d      LIKE apde_t.apde109
DEFINE l_apce119_d      LIKE apde_t.apde119
DEFINE l_apce129_d      LIKE apde_t.apde129
DEFINE l_apce139_d      LIKE apde_t.apde139
DEFINE l_apde109_d      LIKE apde_t.apde109
DEFINE l_apde119_d      LIKE apde_t.apde119
DEFINE l_apde129_d      LIKE apde_t.apde129
DEFINE l_apde139_d      LIKE apde_t.apde139
DEFINE g_amt_d          LIKE apde_t.apde109
DEFINE g_amt1_d         LIKE apde_t.apde109
DEFINE g_amt2_d         LIKE apde_t.apde109
DEFINE g_amt3_d         LIKE apde_t.apde109
#貸方金額
DEFINE l_apce109_c      LIKE apde_t.apde109
DEFINE l_apce119_c      LIKE apde_t.apde119
DEFINE l_apce129_c      LIKE apde_t.apde129
DEFINE l_apce139_c      LIKE apde_t.apde139
DEFINE l_apde109_c      LIKE apde_t.apde109
DEFINE l_apde119_c      LIKE apde_t.apde119
DEFINE l_apde129_c      LIKE apde_t.apde129
DEFINE l_apde139_c      LIKE apde_t.apde139
DEFINE g_amt_c          LIKE apde_t.apde109
DEFINE g_amt1_c         LIKE apde_t.apde109
DEFINE g_amt2_c         LIKE apde_t.apde109
DEFINE g_amt3_c         LIKE apde_t.apde109

   LET r_success = TRUE
   #借方合計
   SELECT SUM(apce109),SUM(apce119),SUM(apce129),SUM(apce139)
     INTO  l_apce109_d,l_apce119_d,l_apce129_d,l_apce139_d   
     FROM apce_t
    WHERE apceent = g_enterprise
      AND apcedocno = p_apdadocno
      AND apceld = p_apdald
      AND apce015 = 'D' 
   IF cl_null(l_apce109_d)THEN LET l_apce109_d = 0 END IF
   IF cl_null(l_apce119_d)THEN LET l_apce119_d = 0 END IF
   IF cl_null(l_apce129_d)THEN LET l_apce129_d = 0 END IF
   IF cl_null(l_apce139_d)THEN LET l_apce139_d = 0 END IF   
   
   SELECT SUM(apde109),SUM(apde119),SUM(apde129),SUM(apde139)
     INTO l_apde109_d,l_apde119_d,l_apde129_d,l_apde139_d   
     FROM apde_t
    WHERE apdeent = g_enterprise
      AND apdedocno = p_apdadocno
      AND apdeld = p_apdald
      AND apde015 = 'D' 
   IF cl_null(l_apde109_d)THEN LET l_apde109_d = 0 END IF
   IF cl_null(l_apde119_d)THEN LET l_apde119_d = 0 END IF
   IF cl_null(l_apde129_d)THEN LET l_apde129_d = 0 END IF
   IF cl_null(l_apde139_d)THEN LET l_apde139_d = 0 END IF   
   
   #貸方合計
   SELECT SUM(apce109),SUM(apce119),SUM(apce129),SUM(apce139)
     INTO  l_apce109_c,l_apce119_c,l_apce129_c,l_apce139_c   
     FROM apce_t
    WHERE apceent = g_enterprise
      AND apcedocno = p_apdadocno
      AND apceld = p_apdald
      AND apce015 = 'C' 
   IF cl_null(l_apce109_c)THEN LET l_apce109_c = 0 END IF
   IF cl_null(l_apce119_c)THEN LET l_apce119_c = 0 END IF
   IF cl_null(l_apce129_c)THEN LET l_apce129_c = 0 END IF
   IF cl_null(l_apce139_c)THEN LET l_apce139_c = 0 END IF  
   
   SELECT SUM(apde109),SUM(apde119),SUM(apde129),SUM(apde139)
     INTO  l_apde109_c,l_apde119_c,l_apde129_c,l_apde139_c   
     FROM apde_t
    WHERE apdeent = g_enterprise
      AND apdedocno = p_apdadocno
      AND apdeld = p_apdald
      AND apde015 = 'C' 
   IF cl_null(l_apde109_c)THEN LET l_apde109_c = 0 END IF
   IF cl_null(l_apde119_c)THEN LET l_apde119_c = 0 END IF
   IF cl_null(l_apde129_c)THEN LET l_apde129_c = 0 END IF
   IF cl_null(l_apde139_c)THEN LET l_apde139_c = 0 END IF   
   
   #借方合計   
   LET g_amt_d  = l_apce109_d + l_apde109_d      #原幣
   LET g_amt1_d = l_apce119_d + l_apde119_d      #本幣
   LET g_amt2_d = l_apce129_d + l_apde129_d      #本幣二
   LET g_amt3_d = l_apce139_d + l_apde139_d      #本幣三

   #貸方合計                                     
   LET g_amt_c  = l_apce109_c + l_apde109_c      #原幣
   LET g_amt1_c = l_apce119_c + l_apde119_c      #本幣
   LET g_amt2_c = l_apce129_c + l_apde129_c      #本幣二
   LET g_amt3_c = l_apce139_c + l_apde139_c      #本幣三   
   
   UPDATE apda_t SET (apda104,apda105,apda114,apda115,
                      apda124,apda125,apda134,apda135)
                   = (g_amt_d,g_amt_c,g_amt1_d,g_amt1_c,
                      g_amt2_d,g_amt2_c,g_amt3_d,g_amt3_c)
    WHERE apdaent   = g_enterprise
      AND apdadocno = p_apdadocno
      AND apdald    = p_apdald
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "upd apda_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
   END IF         
   RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: 多選回傳條件拆解
# Memo...........:
# Usage..........: CALL s_aapt420_get_contolp_wc(p_str_array)
#                  RETURNING r_array 
# Date & Author..: 15/05/20 By apo(#150512-00036#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_get_contolp_wc(p_str_array)
DEFINE p_str_array     DYNAMIC ARRAY OF STRING
DEFINE r_wc           STRING
DEFINE tok            base.StringTokenizer
DEFINE l_str          LIKE type_t.chr100 
DEFINE l_cnt          LIKE type_t.num5
DEFINE l_i            LIKE type_t.num5

   LET r_wc = " 1=2 "
   FOR l_i = 1 TO p_str_array.getLength()
      
      LET tok = base.StringTokenizer.create(p_str_array[l_i],"|")
      LET l_cnt = 0
      WHILE tok.hasMoreTokens()
         LET l_cnt = l_cnt + 1
         CASE l_cnt
            WHEN "1"
               LET r_wc = r_wc CLIPPED," OR ( apccdocno = '",tok.nextToken(),"'"
            WHEN "2"
               LET r_wc = r_wc CLIPPED," AND apccseq = '",tok.nextToken(),"'"
            WHEN "3"
               LET r_wc = r_wc CLIPPED," AND apcc001 = '",tok.nextToken(),"')"   #151029 add)
           #151029 mark --s
           #WHEN "4"
           #   LET l_str = tok.nextToken()
           #   IF NOT cl_null(l_str) THEN 
           #      LET r_wc = r_wc CLIPPED," AND apcc009 = '",l_str,"')"
           #   ELSE
           #      LET r_wc = r_wc CLIPPED," AND (apcc009 IS NULL OR apcc009 = ' ')) "
           #   END IF
           #151029 mark --e
            OTHERWISE
               EXIT WHILE
         END CASE
      END WHILE
   END FOR
   LET r_wc = "(",r_wc CLIPPED,")"
   RETURN r_wc
END FUNCTION
################################################################################
# Descriptions...: 依帳款類型進行帳款單號開窗
# Memo...........:
# Usage..........: CALL s_aapt420_source_doc_query2(p_apeb002,p_apeb003,p_comp,p_apea005,p_docdt)
#                  RETURNING r_apeb003,r_apeb004,r_apeb005,r_apeb008
# Input parameter: p_apeb002      帳款類型
#                : p_apeb003      單號預設值
#                : p_comp         來源組織所屬法人
#                : p_apea005      付款對象
#                : p_docdt        核銷日期
# Return code....: r_apeb003      帳款單號
#                : r_apeb004      帳款項次
#                : r_apeb005      帳期
#                : r_apeb008      發票號碼      
# Date & Author..: 14/10/10 By apo
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_source_doc_query2(p_apeb002,p_apeb003,p_comp,p_apea005,p_docdt)
DEFINE p_apeb002   LIKE apeb_t.apeb002
DEFINE p_apeb003   LIKE apeb_t.apeb003
DEFINE p_comp      LIKE apca_t.apcacomp
DEFINE p_apea005   LIKE apea_t.apea005
DEFINE p_docdt     LIKE apda_t.apdadocdt
DEFINE r_apeb003   LIKE apeb_t.apeb003
DEFINE r_apeb004   LIKE apeb_t.apeb004
DEFINE r_apeb005   LIKE apeb_t.apeb005
DEFINE r_apeb008   LIKE apeb_t.apeb008

   INITIALIZE g_qryparam.* TO NULL
   LET g_qryparam.state = 'i'
   LET g_qryparam.reqry = FALSE
   LET g_qryparam.arg1 = p_comp
   LET g_qryparam.arg2 = p_apea005
   LET g_qryparam.arg3 = p_docdt
   LET g_qryparam.default1 = p_apeb003
   
   CASE
      ###應付###
      WHEN p_apeb002[1,1] = '4'  
         CASE p_apeb002
            WHEN '40'   
               LET g_qryparam.where = " apca001 LIKE '1%' "
            WHEN '41'
               LET g_qryparam.where = " apca001 LIKE '2%' AND apca001 <> '25' "
            WHEN '42'
               LET g_qryparam.where = " apca001 = '25' "
         END CASE
         LET g_qryparam.where = g_qryparam.where CLIPPED," AND apca005 ='",p_apea005,"' "   #170802-00061#1 add
         #CALL q_apcadocno_3()        #應付帳款單號查詢 #161201-00031#1 mark
         CALL aapt420_03()                             #161201-00031#1 add
     ###應收###         
      WHEN p_apeb002[1,1] = '3'   
         CASE p_apeb002
            WHEN '30'
               LET g_qryparam.where = " xrca001 LIKE '1%' "
            WHEN '31'
               LET g_qryparam.where = " xrca001 LIKE '2%' AND xrca001 <> '25' "
            WHEN '32'
               LET g_qryparam.where = " xrca001 = '25' "
         END CASE
         #CALL q_xrcadocno_8()        #應收帳款單號查詢   #161201-00031#1 mark
         CALL aapt420_04()                             #161201-00031#1 add     
   END CASE
   #將開窗取得的值回傳到變數
   LET r_apeb003 = g_qryparam.return1       
   LET r_apeb004 = g_qryparam.return2
   LET r_apeb005 = g_qryparam.return3
   LET r_apeb008 = g_qryparam.return4
   
   RETURN r_apeb003,r_apeb004,r_apeb005,r_apeb008
END FUNCTION

################################################################################
# Descriptions...: 自動產生付款明細
# Memo...........:
# Usage..........: CALL s_aapt420_auto_ins_apde()
# Date & Author..: 2015/06/12 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_auto_ins_apde(p_array)
DEFINE p_array       DYNAMIC ARRAY OF RECORD
                        chr  LIKE type_t.chr1000,
                        dat  LIKE type_t.dat
                     END RECORD
DEFINE l_tmp         RECORD
                        apdecomp   LIKE apde_t.apdecomp,
                        apdeld     LIKE apde_t.apdeld,
                        apdedocno  LIKE apde_t.apdedocno,
                        apdeseq    LIKE apde_t.apdeseq,
                        apdesite   LIKE apde_t.apdesite,
                        apdeorga   LIKE apde_t.apdeorga,
                        apde001    LIKE apde_t.apde001,
                        apde002    LIKE apde_t.apde002,
                        apde003    LIKE apde_t.apde003,
                        apde006    LIKE apde_t.apde006,
                        apde008    LIKE apde_t.apde008,
                        apde009    LIKE apde_t.apde009,
                        apde011    LIKE apde_t.apde011,
                        apde012    LIKE apde_t.apde012,
                        apde015    LIKE apde_t.apde015,
                        apde016    LIKE apde_t.apde016,
                        apde017    LIKE apde_t.apde017,  #150825-00004#1
                        apde021    LIKE apde_t.apde021,
                        apde032    LIKE apde_t.apde032,
                        apde038    LIKE apde_t.apde038,
                        apde039    LIKE apde_t.apde039,
                        apde040    LIKE apde_t.apde040,
                        apde041    LIKE apde_t.apde041,  #160202-00021#2
                        apde100    LIKE apde_t.apde100,
                        apde101    LIKE apde_t.apde101,
                        apde109    LIKE apde_t.apde109,
                        apde119    LIKE apde_t.apde119,
                        apde121    LIKE apde_t.apde121,
                        apde129    LIKE apde_t.apde129,
                        apde131    LIKE apde_t.apde131,
                        apde139    LIKE apde_t.apde139
                     END RECORD
DEFINE l_apce        RECORD
                        apce100    LIKE apce_t.apce100,
                        apce109    LIKE apce_t.apce109,
                        apcc002    LIKE apcc_t.apcc002,
                        apcc004    LIKE apcc_t.apcc004,
                        apda005    LIKE apda_t.apda005
                       ,apce119    LIKE apce_t.apce119  #170322-00076#1
                     END RECORD
DEFINE l_wc          STRING
DEFINE l_wc2         STRING
DEFINE l_sql         STRING
DEFINE r_success     LIKE type_t.num5
DEFINE l_apce003     LIKE apce_t.apce003  #來源帳款單號  #150825-00004#1
#151012-00014#2-----s
#交易對象資料轉換
DEFINE ls_js         STRING
DEFINE lc_param      RECORD
         apca004     LIKE apca_t.apca004
                     END RECORD
#151012-00014#2-----e
DEFINE l_glaa001     LIKE glaa_t.glaa001   #170221-00016#1 add
DEFINE l_sfin4012    LIKE type_t.chr80     #170221-00016#1 add
DEFINE l_sfin3008    LIKE type_t.chr1      #S-FIN-3008-付款單直接產生銀存支付帳   #170316-00024#1 add

   LET r_success = TRUE
   
   #p_array[1].chr   帳務中心
   #p_array[2].chr   帳套
   #p_array[3].chr   法人
   #p_array[4].chr   單據編號
   #p_array[1].dat   單據日期
   #p_array[5].chr   銀存異動碼
   #p_array[6].chr   現金變動碼
   #p_array[7].chr   同對象付款金額彙總方式
   #p_array[8].chr   現金及即期匯款指定帳戶  #160729-00010#1 add
   #p_array[9].chr   應付票據開票指定帳戶    #160729-00010#1 add


   CASE
      WHEN p_array[7].chr = "a" #應付款日
         LET l_wc  = " GROUP BY apce100,apcc002,apcc004,apda005"
         LET l_wc2 = " GROUP BY apce100,xrcc002,xrcc004,apda005"
      WHEN p_array[7].chr = "b" #個別產生
         LET l_wc  = " GROUP BY apceseq,apce100,apcc002,apcc004,apda005"
         LET l_wc2 = " GROUP BY apceseq,apce100,xrcc002,xrcc004,apda005"
      OTHERWISE
         LET l_wc  = ""
         LET l_wc2 = ""
   END CASE
   

   #LET l_sql = " SELECT apce100,SUM(apce109),",   #170328-00099#2 mark
   LET l_sql = " SELECT apce100,SUM(CASE apce015 WHEN 'D' THEN apce109 ELSE 0 END) - SUM(CASE apce015 WHEN 'C' THEN apce109 ELSE 0 END),",    #170328-00099#2
               "        apcc002,apcc004,",
               "        apda005",
               "       ,SUM(CASE apce015 WHEN 'D' THEN apce119 ELSE 0 END) - SUM(CASE apce015 WHEN 'C' THEN apce119 ELSE 0 END)", #170322-00076#1
               "   FROM apce_t ",
               "   LEFT JOIN apcc_t ON apceent = apccent AND apceld = apccld ",
               "         AND apce003 = apccdocno AND apce004 = apccseq AND apce005 = apcc001",
               "   LEFT JOIN apda_t ON apceent = apdaent AND apceld = apdald AND apcedocno = apdadocno",
               "  WHERE apceent = ",g_enterprise,
               "    AND apcesite = '",p_array[1].chr,"' ",
               "    AND apceld  = '",p_array[2].chr,"' ",
               "    AND apcecomp = '",p_array[3].chr,"' ",
               "    AND apcedocno = '",p_array[4].chr,"' ",
               "    AND apce002 LIKE '4%' ",
               l_wc,
               " UNION ALL",
               #" SELECT apce100,SUM(apce109),",    #170328-00099#2 mark
               " SELECT apce100,SUM(CASE apce015 WHEN 'D' THEN apce109 ELSE 0 END) - SUM(CASE apce015 WHEN 'C' THEN apce109 ELSE 0 END),",    #170328-00099#2
               "        xrcc002,xrcc004,",
               "        apda005",
               "       ,SUM(CASE apce015 WHEN 'D' THEN apce119 ELSE 0 END) - SUM(CASE apce015 WHEN 'C' THEN apce119 ELSE 0 END)", #170322-00076#1
               "   FROM apce_t ",
               "   LEFT JOIN xrcc_t ON apceent = xrccent AND apceld = xrccld ",
               "         AND apce003 = xrccdocno AND apce004 = xrccseq AND apce005 = xrcc001",
               "   LEFT JOIN apda_t ON apceent = apdaent AND apceld = apdald AND apcedocno = apdadocno",
               "  WHERE apceent = ",g_enterprise,
               "    AND apcesite = '",p_array[1].chr,"' ",
               "    AND apceld  = '",p_array[2].chr,"' ",
               "    AND apcecomp = '",p_array[3].chr,"' ",
               "    AND apcedocno = '",p_array[4].chr,"' ",
               "    AND apce002 LIKE '3%' ",
               l_wc2

   PREPARE s_aapt420_sel_p FROM l_sql
   DECLARE s_aapt420_sel_c CURSOR FOR s_aapt420_sel_p
   FOREACH s_aapt420_sel_c INTO l_apce.*
      IF SQLCA.SQLCODE THEN EXIT FOREACH END IF
      
      INITIALIZE l_tmp.* TO NULL
      LET l_tmp.apdecomp  = p_array[3].chr
      LET l_tmp.apdeld    = p_array[2].chr
      LET l_tmp.apdedocno = p_array[4].chr
      #項次
      SELECT MAX(apdeseq)+1 INTO l_tmp.apdeseq FROM apde_t
       WHERE apdeent = g_enterprise AND apdeld = l_tmp.apdeld AND apdedocno = l_tmp.apdedocno
      IF cl_null(l_tmp.apdeseq) OR l_tmp.apdeseq = 0 THEN
         LET l_tmp.apdeseq = 1
      END IF

      LET l_tmp.apdesite = p_array[1].chr
      LET l_tmp.apdeorga = p_array[3].chr
      
      #付款對象
      LET l_tmp.apde038  = l_apce.apda005
      
      LET l_tmp.apde001  = "aapt420"
      
      #付款類型
      LET l_tmp.apde002  = '10'
      
      #款別性質
      LET l_tmp.apde006  = l_apce.apcc002
      
      #幣別
      LET l_tmp.apde100  = l_apce.apce100
      
      #付款帳戶/票據類型
      CALL s_aapt420_take_apde008(l_tmp.apdecomp,l_tmp.apde100,l_tmp.apde006) RETURNING l_tmp.apde008,l_tmp.apde021

      #160729-00010#1 add --s
      #傳入_現金及即期匯款指定帳戶
      IF NOT cl_null(p_array[8].chr) THEN
         CASE l_tmp.apde006
            WHEN 10 #現金
               LET l_tmp.apde008 = p_array[8].chr
               #檢核帳戶是否在該款別下可使用
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = l_tmp.apde008
               LET g_chkparam.arg2 = l_tmp.apdecomp
               LET g_chkparam.arg3 = "5','1"
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="ade-00010:sub-01302|anmi120|",cl_get_progname("anmi120",g_lang,"2"),"|:EXEPROGanmi120"
               IF NOT cl_chk_exist("v_nmas002_4") THEN
                  #檢查失敗時後續處理
                  CONTINUE FOREACH
               END IF
               
            WHEN 20 #銀行電匯款
               LET l_tmp.apde008 = p_array[8].chr
               #檢核帳戶是否在該款別下可使用
               INITIALIZE g_chkparam.* TO NULL
               LET g_chkparam.arg1 = l_tmp.apde008
               LET g_chkparam.arg2 = l_tmp.apdecomp
               LET g_chkparam.arg3 = '1'
               LET g_errshow = TRUE #是否開窗                   
               LET g_chkparam.err_str[1] ="ade-00010:sub-01302|anmi120|",cl_get_progname("anmi120",g_lang,"2"),"|:EXEPROGanmi120"
               IF NOT cl_chk_exist("v_nmas002_4") THEN
                  #檢查失敗時後續處理
                  CONTINUE FOREACH
               END IF
         END CASE
      END IF
      
      #傳入_應付票據開票指定帳戶
      IF NOT cl_null(p_array[9].chr) THEN
         IF l_tmp.apde006 = '30' THEN #票據
            LET l_tmp.apde008 = p_array[9].chr
            #檢核帳戶是否在該款別下可使用
            INITIALIZE g_chkparam.* TO NULL
            LET g_chkparam.arg1 = l_tmp.apde008
            LET g_chkparam.arg2 = l_tmp.apdecomp
            LET g_chkparam.arg3 = "4','1"
            LET g_errshow = TRUE                
            LET g_chkparam.err_str[1] ="ade-00010:sub-01302|anmi120|",cl_get_progname("anmi120",g_lang,"2"),"|:EXEPROGanmi120"
            IF NOT cl_chk_exist("v_nmas002_4") THEN
               #檢查失敗時後續處理
               CONTINUE FOREACH
            END IF
         END IF
      END IF
      
      #僅款別<>30票據時,不須指定票據類型
      IF l_tmp.apde006 <> '30' THEN
         LET l_tmp.apde021 = ''
      END IF
      #160729-00010#1 add --e

      IF l_tmp.apde006 = '30' THEN
         #沖銷科目
         LET l_tmp.apde016 = s_aapt420_bring_acc_code2(p_array[2].chr,p_array[1].chr,l_tmp.apde038,l_tmp.apde002,l_tmp.apde006,l_tmp.apde021)
      ELSE
         LET l_tmp.apde016 = s_aapt420_bring_acc_code2(p_array[2].chr,p_array[1].chr,l_tmp.apde038,l_tmp.apde002,l_tmp.apde006,l_tmp.apde008)
      END IF
      
      
      #原幣金額
      LET l_tmp.apde109  = l_apce.apce109
      
      #170322-00076#1 add ------
      #如果有指定帳戶，依照帳戶設定給予幣別
      IF NOT cl_null(p_array[8].chr) OR NOT cl_null(p_array[9].chr)THEN
         IF NOT cl_null(p_array[8].chr) THEN
            LET l_tmp.apde100 = s_anm_get_nmas003(p_array[8].chr)
         ELSE
            LET l_tmp.apde100 = s_anm_get_nmas003(p_array[9].chr)
         END IF
      END IF
      #170322-00076#1 add end---
      
      #170221-00016#1---add---str--
      IF NOT cl_null(l_tmp.apde008) THEN
         CALL cl_get_para(g_enterprise,l_tmp.apdecomp,'S-FIN-4012') RETURNING l_sfin4012
      ELSE
         LET l_sfin4012 = ''
      END IF
      #170221-00016#1---add---end--

      #推算各本位幣-匯率
      #170221-00016#1---add---str--
      IF l_sfin4012 = '23' THEN
         CALL s_ld_sel_glaa(l_tmp.apdeld,'glaa001') RETURNING r_success,l_glaa001
         #銀行日平均匯率
         CALL s_anm_get_exrate(l_tmp.apdeld,l_tmp.apdecomp,l_tmp.apde008,l_tmp.apde100,l_glaa001,p_array[1].dat) RETURNING l_tmp.apde101
      ELSE
      #170221-00016#1---add---end--
         #151012-00014#2-----s
         LET lc_param.apca004 = l_apce.apda005
         LET ls_js = util.JSON.stringify(lc_param)      
         CALL s_fin_get_curr_rate(p_array[3].chr,p_array[2].chr,p_array[1].dat,l_tmp.apde100,ls_js)
         #CALL s_fin_get_curr_rate(p_array[3].chr,p_array[2].chr,p_array[1].dat,l_tmp.apde100,'')
              RETURNING l_tmp.apde101,l_tmp.apde121,l_tmp.apde131
         #151012-00014#2-----e
      END IF   #170221-00016#1 add
     
      #170322-00076#1 add ------
      #如果有指定帳戶，依照帳戶設定的幣別，利用本幣金額回推原幣金額
      IF NOT cl_null(p_array[8].chr) OR NOT cl_null(p_array[9].chr)THEN
         LET l_tmp.apde109 = l_apce.apce119 / l_tmp.apde101
         CALL s_curr_round_ld('1',p_array[2].chr,l_tmp.apde100,l_tmp.apde109,2) RETURNING g_sub_success,g_errno,l_tmp.apde109
         #推算各本位幣-金額
         CALL s_afm_rate_money(p_array[2].chr,l_tmp.apde101,l_tmp.apde121,l_tmp.apde131,l_tmp.apde109)
              RETURNING l_tmp.apde119,l_tmp.apde129,l_tmp.apde139
         #因這邊用原幣推本幣可能有誤差，dido說為了維持本幣一致性，這邊放原本的本幣金額
         LET l_tmp.apde119 = l_apce.apce119
      ELSE
      #170322-00076#1 add end---
         #推算各本位幣-金額
         CALL s_afm_rate_money(p_array[2].chr,l_tmp.apde101,l_tmp.apde121,l_tmp.apde131,l_tmp.apde109)
              RETURNING l_tmp.apde119,l_tmp.apde129,l_tmp.apde139
      END IF #170322-00076#1
      
      #170316-00024#1---mark---str--
      ##付款到期日
      #LET l_tmp.apde032  = l_apce.apcc004
      #170316-00024#1---mark---end--
      #170316-00024#1---add---str--
      #根據款別性質(apde006),決定付款日(apde032)預帶規則:
      #1.款別性質10,給請款核銷日(apdadocdt)
      #2.款別性質20,視參數S-FIN-3008
      #  當參數為Y,給請款核銷日(apdadocdt)
      #  當參數為N,給多帳期付款到期日(apcc004)
      #3.非上述款別,則給多帳期付款到期日(apcc004)
      CALL cl_get_para(g_enterprise,l_tmp.apdecomp,'S-FIN-3008') RETURNING l_sfin3008
      CASE l_tmp.apde006
         WHEN "10"
            LET l_tmp.apde032  = p_array[1].dat
         WHEN "20"
            IF l_sfin3008 = "Y" THEN
               LET l_tmp.apde032  = p_array[1].dat 
            ELSE
               LET l_tmp.apde032  = l_apce.apcc004
            END IF
         OTHERWISE
            LET l_tmp.apde032  = l_apce.apcc004
      END CASE 
      #170316-00024#1---add---end--
      
      #已轉
      LET l_tmp.apde009  = 'N'
      
      #借貸
      LET l_tmp.apde015  = s_fin_get_scc_value('8506',l_tmp.apde002,'1')
            
      #受款銀行/受款帳戶
      CALL s_aapt420_get_primary_pay_bank(l_apce.apda005) RETURNING l_tmp.apde039,l_tmp.apde040
      #160202-00021#2--(S)
      #SELECT pmaf004 INTO l_tmp.apde040   #170217-00039#1 mark
      SELECT pmaf004 INTO l_tmp.apde041    #170217-00039#1 add
        FROM pmaf_t
       WHERE pmafent = g_enterprise AND pmaf001 = l_apce.apda005
         AND pmaf009 = 'Y' AND pmafstus = 'Y'  #取主要付款帳戶
      #160202-00021#2--(E) 

      #存提碼
      LET l_tmp.apde011 = p_array[5].chr
      
      #現金變動碼
      LET l_tmp.apde012 = p_array[6].chr
      
      #150825-00004#1 add ------
      #如果付款對象(apda005)是EMPL，那要寫入業務人員(apde017)=員工
      IF l_apce.apda005 = 'EMPL' THEN
         SELECT apce003 INTO l_apce003
           FROM apce_t
          WHERE apceent = g_enterprise
            AND apcedocno = l_tmp.apdedocno
            AND apceseq = l_tmp.apdeseq
         SELECT apca057 INTO l_tmp.apde017
           FROM apca_t
          WHERE apcaent = g_enterprise
            AND apcadocno = l_apce003
      ELSE
         LET l_tmp.apde017 = ""
      END IF
      #150825-00004#1 add end---
      
      #150825-00004#1 add apde017
      INSERT INTO apde_t (apdeent,apdecomp,apdeld,apdedocno,apdeseq,apdesite,apdeorga,
                          apde001,apde002,apde003,apde006,apde008,
                          apde009,apde011,apde012,apde015,apde016,apde017,
                          apde021,apde032,apde038,apde039,apde040,apde041, #160202-00021#2
                          apde100,apde101,apde109,apde119,apde121,
                          apde129,apde131,apde139)
                  VALUES (g_enterprise,l_tmp.apdecomp,l_tmp.apdeld,l_tmp.apdedocno,l_tmp.apdeseq,l_tmp.apdesite,l_tmp.apdeorga,
                          l_tmp.apde001,l_tmp.apde002,l_tmp.apde003,l_tmp.apde006,l_tmp.apde008,
                          l_tmp.apde009,l_tmp.apde011,l_tmp.apde012,l_tmp.apde015,l_tmp.apde016,l_tmp.apde017,
                          l_tmp.apde021,l_tmp.apde032,l_tmp.apde038,l_tmp.apde039,l_tmp.apde040,l_tmp.apde041,    #160202-00021#2
                          l_tmp.apde100,l_tmp.apde101,l_tmp.apde109,l_tmp.apde119,l_tmp.apde121,
                          l_tmp.apde129,l_tmp.apde131,l_tmp.apde139)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.extend = "g_apde_m"
         LET g_errparam.code   = SQLCA.sqlcode
         LET g_errparam.popup  = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   
   END FOREACH
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取得據點預設的銀行帳戶&款別編號
# Memo...........:
# Usage..........: CALL s_aapt420_take_apde008()

# Date & Author..: 2015/06/17 By Reanna
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_take_apde008(p_apccsite,p_apcc100,p_apcc002)
DEFINE p_apccsite    LIKE apcc_t.apccsite
DEFINE p_apcc100     LIKE apcc_t.apcc100
DEFINE p_apcc002     LIKE apcc_t.apcc002
DEFINE l_sql         STRING
DEFINE l_cnt         LIKE type_t.num5
DEFINE l_apde008     LIKE apde_t.apde008
DEFINE l_apde021     LIKE apde_t.apde021
DEFINE r_apde008     LIKE apde_t.apde008
DEFINE r_apde021     LIKE apde_t.apde021

   LET r_apde008 = ""
   LET r_apde021 = ""
   
   #170123-00045#5 --s mark
   #LET l_sql = "SELECT ooie030,ooie001",
   #            "  FROM ooie_t",
   #            "  LEFT OUTER JOIN ooia_t ON ooieent = ooiaent AND ooie001 = ooia001",
   #            " WHERE ooieent = ",g_enterprise,
   #            "   AND ooiesite = '",p_apccsite,"'",
   #            "   AND ooie002  = '",p_apcc100,"'",
   #            "   AND ooia002  = '",p_apcc002,"'",
   #            "   AND rownum = '1' ",                        #160729-00010#1 add
   #            " ORDER BY ooiesite,ooia002,ooie002 DESC"
   #PREPARE s_aapt420_sel_ooie_p FROM l_sql
   #DECLARE s_aapt420_sel_ooie_c CURSOR FOR s_aapt420_sel_ooie_p
   #LET l_cnt = 1
   #FOREACH s_aapt420_sel_ooie_c INTO l_apde008,l_apde021
   #   IF SQLCA.SQLCODE THEN EXIT FOREACH END IF
   #   IF l_cnt > 1 THEN
   #      EXIT FOREACH
   #   ELSE
   #      LET r_apde008 = l_apde008
   #      LET r_apde021 = l_apde021
   #   END IF
   #   LET l_cnt = l_cnt + 1
   #END FOREACH
   #170123-00045#5 --e mark
   
   #170123-00045#5 --s add
   LET l_sql = "SELECT ooie030,ooie001",
               "  FROM ooie_t",
               "  LEFT OUTER JOIN ooia_t ON ooieent = ooiaent AND ooie001 = ooia001",
               " WHERE ooieent = ",g_enterprise,
               "   AND ooiesite = '",p_apccsite,"'",
               "   AND ooie002  = '",p_apcc100,"'",
               "   AND ooia002  = '",p_apcc002,"'",
               " ORDER BY ooiesite,ooia002,ooie002 DESC"
   PREPARE s_aapt420_sel_ooie_p FROM l_sql
   DECLARE s_aapt420_sel_ooie_c SCROLL CURSOR FOR s_aapt420_sel_ooie_p     
   OPEN s_aapt420_sel_ooie_c
   FETCH FIRST s_aapt420_sel_ooie_c INTO r_apde008,r_apde021
   CLOSE s_aapt420_sel_ooie_c        
   #170123-00045#5 --e add     
   
   
   RETURN r_apde008,r_apde021
   
END FUNCTION
################################################################################
# Descriptions...: 取單別之起始與往後算的單別位數
# Memo...........:
# Usage..........: CALL s_aapt420_get_slip_pos(p_docno)
#                  RETURNING r_str,r_end
# INPUT parameter: p_type    保留參數
# RETURN code....: r_str     起始位置
#                  r_end     單別位數
# Date & Author..: 2015/06/25 By apo(#150622-00004#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_get_slip_pos(p_type)
DEFINE p_type      STRING                            #保留參數
DEFINE r_str       LIKE type_t.num5                  #單別起始位置
DEFINE r_end       LIKE type_t.num5                  #單別位數
DEFINE l_ecom001   LIKE type_t.num5                  #單別長度
DEFINE l_ecom003   LIKE type_t.num5                  #據點長度
DEFINE l_ecom008   LIKE type_t.num5                  #編號格式

   WHENEVER ERROR CONTINUE
   
   LET l_ecom001 = cl_get_para(g_enterprise,g_site,'E-COM-0001')  #單別長度
   LET l_ecom003 = cl_get_para(g_enterprise,g_site,'E-COM-0003')  #據點長度
   LET l_ecom008 = cl_get_para(g_enterprise,g_site,'E-COM-0008')  #編號格式
   IF l_ecom008 = '1' THEN    #編號格式1:據點+單別
      LET r_str = l_ecom003 + 1
      IF cl_get_para(g_enterprise,'','E-COM-0002') = 'Y' THEN     #有分隔符號 
         LET r_str = r_str + 1
      END IF  
   ELSE                       #編號格式2:單別+據點
      LET r_str = 1      
   END IF
   LET r_end = l_ecom001

   RETURN r_str,r_end

END FUNCTION

################################################################################
# Descriptions...: 立即审核
# Memo...........:
# Usage..........: CALL s_aapt420_contra_doc_immediately_conf(p_apcald,p_apcacomp,p_apcadocno)
#                  RETURNING r_success
# Input parameter: p_apcald     帐别
#                : p_apcacomp   法人
#                ：p_apcadocno  编号
# Return code....: r_success   TRUE/FALSE
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/12/09 By 06421
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_contra_doc_immediately_conf(p_apcald,p_apcacomp,p_apcadocno)
   DEFINE p_apcald          LIKE apca_t.apcald
   DEFINE p_apcadocno      LIKE apca_t.apcadocno
   DEFINE p_apcacomp       LIKE apca_t.apcacomp
   DEFINE r_success        LIKE type_t.num5      #处理状态TRUE/FALSE
  #DEFINE l_apca           RECORD LIKE apca_t.*  #161111-00048#4 mark
   #161111-00048#4 --s add
   DEFINE l_apca RECORD  #應付憑單單頭
          apcaent LIKE apca_t.apcaent, #企業編號
          apcaownid LIKE apca_t.apcaownid, #資料所有者
          apcaowndp LIKE apca_t.apcaowndp, #資料所有部門
          apcacrtid LIKE apca_t.apcacrtid, #資料建立者
          apcacrtdp LIKE apca_t.apcacrtdp, #資料建立部門
          apcacrtdt LIKE apca_t.apcacrtdt, #資料創建日
          apcamodid LIKE apca_t.apcamodid, #資料修改者
          apcamoddt LIKE apca_t.apcamoddt, #最近修改日
          apcacnfid LIKE apca_t.apcacnfid, #資料確認者
          apcacnfdt LIKE apca_t.apcacnfdt, #資料確認日
          apcapstid LIKE apca_t.apcapstid, #資料過帳者
          apcapstdt LIKE apca_t.apcapstdt, #資料過帳日
          apcastus LIKE apca_t.apcastus, #狀態碼
          apcald LIKE apca_t.apcald, #帳套
          apcacomp LIKE apca_t.apcacomp, #法人
          apcadocno LIKE apca_t.apcadocno, #應付帳款單號碼
          apcadocdt LIKE apca_t.apcadocdt, #帳款日期
          apcasite LIKE apca_t.apcasite, #帳務中心
          apca001 LIKE apca_t.apca001, #帳款單性質
          apca003 LIKE apca_t.apca003, #帳務人員
          apca004 LIKE apca_t.apca004, #帳款對象編號
          apca005 LIKE apca_t.apca005, #付款對象
          apca006 LIKE apca_t.apca006, #供應商分類
          apca007 LIKE apca_t.apca007, #帳款類別
          apca008 LIKE apca_t.apca008, #付款條件編號
          apca009 LIKE apca_t.apca009, #應付款日/應扣抵日
          apca010 LIKE apca_t.apca010, #容許票據到期日
          apca011 LIKE apca_t.apca011, #稅別
          apca012 LIKE apca_t.apca012, #稅率
          apca013 LIKE apca_t.apca013, #含稅否
          apca014 LIKE apca_t.apca014, #人員編號
          apca015 LIKE apca_t.apca015, #部門編號
          apca016 LIKE apca_t.apca016, #來源作業類型
          apca017 LIKE apca_t.apca017, #產生方式
          apca018 LIKE apca_t.apca018, #來源參考單號
          apca019 LIKE apca_t.apca019, #系統產生對應單號(待抵帳款-預付)
          apca020 LIKE apca_t.apca020, #信用狀付款否
          apca021 LIKE apca_t.apca021, #商業發票號碼(IV no.)
          apca022 LIKE apca_t.apca022, #進口報單號碼
          apca025 LIKE apca_t.apca025, #差異處理(發票與帳款差異)
          apca026 LIKE apca_t.apca026, #原幣未稅差異
          apca027 LIKE apca_t.apca027, #原幣稅額差異
          apca028 LIKE apca_t.apca028, #本幣未稅差異
          apca029 LIKE apca_t.apca029, #本幣幣稅額差異
          apca030 LIKE apca_t.apca030, #差異科目
          apca031 LIKE apca_t.apca031, #產生之差異折讓單號
          apca032 LIKE apca_t.apca032, #發票類型
          apca033 LIKE apca_t.apca033, #專案編號
          apca034 LIKE apca_t.apca034, #責任中心
          apca035 LIKE apca_t.apca035, #應付(貸方)科目編號
          apca036 LIKE apca_t.apca036, #費用(借方)科目編號
          apca037 LIKE apca_t.apca037, #產生傳票否
          apca038 LIKE apca_t.apca038, #拋轉傳票號碼
          apca039 LIKE apca_t.apca039, #會計檢核附件份數
          apca040 LIKE apca_t.apca040, #留置否
          apca041 LIKE apca_t.apca041, #留置理由碼
          apca042 LIKE apca_t.apca042, #留置設定日期
          apca043 LIKE apca_t.apca043, #留置解除日期
          apca044 LIKE apca_t.apca044, #留置原幣金額
          apca045 LIKE apca_t.apca045, #留置說明
          apca046 LIKE apca_t.apca046, #關係人否
          apca047 LIKE apca_t.apca047, #多角序號
          apca048 LIKE apca_t.apca048, #集團代付/代付單號
          apca049 LIKE apca_t.apca049, #來源營運中心編號
          apca050 LIKE apca_t.apca050, #交易原始單據份數
          apca051 LIKE apca_t.apca051, #作廢理由碼
          apca052 LIKE apca_t.apca052, #列印次數
          apca053 LIKE apca_t.apca053, #備註
          apca054 LIKE apca_t.apca054, #多帳期設定
          apca055 LIKE apca_t.apca055, #繳款優惠條件
          apca056 LIKE apca_t.apca056, #會計檢核附件狀態
          apca057 LIKE apca_t.apca057, #交易對象識別碼
          apca058 LIKE apca_t.apca058, #稅別交易類型
          apca059 LIKE apca_t.apca059, #預算編號
          apca060 LIKE apca_t.apca060, #發票開立方式
          apca061 LIKE apca_t.apca061, #預開發票基準日
          apca062 LIKE apca_t.apca062, #多角性質
          apca063 LIKE apca_t.apca063, #整帳批序號
          apca064 LIKE apca_t.apca064, #訂金序次
          apca065 LIKE apca_t.apca065, #發票編號
          apca066 LIKE apca_t.apca066, #發票號碼
          apca100 LIKE apca_t.apca100, #交易原幣別
          apca101 LIKE apca_t.apca101, #原幣匯率
          apca103 LIKE apca_t.apca103, #原幣未稅金額
          apca104 LIKE apca_t.apca104, #原幣稅額
          apca106 LIKE apca_t.apca106, #原幣應稅折抵合計金額
          apca107 LIKE apca_t.apca107, #原幣直接沖帳(調整)合計金額
          apca108 LIKE apca_t.apca108, #原幣應付金額
          apca113 LIKE apca_t.apca113, #本幣未稅金額
          apca114 LIKE apca_t.apca114, #本幣稅額
          apca116 LIKE apca_t.apca116, #本幣應稅折抵合計金額
          apca117 LIKE apca_t.apca117, #NO USE
          apca118 LIKE apca_t.apca118, #本幣應付金額
          apca120 LIKE apca_t.apca120, #本位幣二幣別
          apca121 LIKE apca_t.apca121, #本位幣二匯率
          apca123 LIKE apca_t.apca123, #本位幣二未稅金額
          apca124 LIKE apca_t.apca124, #本位幣二稅額
          apca126 LIKE apca_t.apca126, #本位幣二應稅折抵合計金額
          apca127 LIKE apca_t.apca127, #NO USE
          apca128 LIKE apca_t.apca128, #本位幣二應付金額
          apca130 LIKE apca_t.apca130, #本位幣三幣別
          apca131 LIKE apca_t.apca131, #本位幣三匯率
          apca133 LIKE apca_t.apca133, #本位幣三未稅金額
          apca134 LIKE apca_t.apca134, #本位幣三稅額
          apca136 LIKE apca_t.apca136, #本位幣三應稅折抵合計金額
          apca137 LIKE apca_t.apca137, #NO USE
          apca138 LIKE apca_t.apca138, #本位幣三應付金額
          apcaud001 LIKE apca_t.apcaud001, #自定義欄位(文字)001
          apcaud002 LIKE apca_t.apcaud002, #自定義欄位(文字)002
          apcaud003 LIKE apca_t.apcaud003, #自定義欄位(文字)003
          apcaud004 LIKE apca_t.apcaud004, #自定義欄位(文字)004
          apcaud005 LIKE apca_t.apcaud005, #自定義欄位(文字)005
          apcaud006 LIKE apca_t.apcaud006, #自定義欄位(文字)006
          apcaud007 LIKE apca_t.apcaud007, #自定義欄位(文字)007
          apcaud008 LIKE apca_t.apcaud008, #自定義欄位(文字)008
          apcaud009 LIKE apca_t.apcaud009, #自定義欄位(文字)009
          apcaud010 LIKE apca_t.apcaud010, #自定義欄位(文字)010
          apcaud011 LIKE apca_t.apcaud011, #自定義欄位(數字)011
          apcaud012 LIKE apca_t.apcaud012, #自定義欄位(數字)012
          apcaud013 LIKE apca_t.apcaud013, #自定義欄位(數字)013
          apcaud014 LIKE apca_t.apcaud014, #自定義欄位(數字)014
          apcaud015 LIKE apca_t.apcaud015, #自定義欄位(數字)015
          apcaud016 LIKE apca_t.apcaud016, #自定義欄位(數字)016
          apcaud017 LIKE apca_t.apcaud017, #自定義欄位(數字)017
          apcaud018 LIKE apca_t.apcaud018, #自定義欄位(數字)018
          apcaud019 LIKE apca_t.apcaud019, #自定義欄位(數字)019
          apcaud020 LIKE apca_t.apcaud020, #自定義欄位(數字)020
          apcaud021 LIKE apca_t.apcaud021, #自定義欄位(日期時間)021
          apcaud022 LIKE apca_t.apcaud022, #自定義欄位(日期時間)022
          apcaud023 LIKE apca_t.apcaud023, #自定義欄位(日期時間)023
          apcaud024 LIKE apca_t.apcaud024, #自定義欄位(日期時間)024
          apcaud025 LIKE apca_t.apcaud025, #自定義欄位(日期時間)025
          apcaud026 LIKE apca_t.apcaud026, #自定義欄位(日期時間)026
          apcaud027 LIKE apca_t.apcaud027, #自定義欄位(日期時間)027
          apcaud028 LIKE apca_t.apcaud028, #自定義欄位(日期時間)028
          apcaud029 LIKE apca_t.apcaud029, #自定義欄位(日期時間)029
          apcaud030 LIKE apca_t.apcaud030, #自定義欄位(日期時間)030
          apca067 LIKE apca_t.apca067, #管理品類
          apca068 LIKE apca_t.apca068, #經營方式
          apca069 LIKE apca_t.apca069, #no use
          apca070 LIKE apca_t.apca070, #no use
          apca071 LIKE apca_t.apca071, #no use
          apca072 LIKE apca_t.apca072, #no use
          apca073 LIKE apca_t.apca073  #L/C No.
   END RECORD
   #161111-00048#4 --e add
   
   LET r_success = TRUE

   
   #SELECT * INTO l_apca.* FROM apca_t WHERE apcaent = g_enterprise AND apcald = p_apcald AND apcadocno = p_apcadocno   #161208-00026#25   mark
   #161208-00026#25   add---s
   SELECT apcaent,apcaownid,apcaowndp,apcacrtid,apcacrtdp,
          apcacrtdt,apcamodid,apcamoddt,apcacnfid,apcacnfdt,
          apcapstid,apcapstdt,apcastus,apcald,apcacomp,
          apcadocno,apcadocdt,apcasite,apca001,apca003,
          apca004,apca005,apca006,apca007,apca008,
          apca009,apca010,apca011,apca012,apca013,
          apca014,apca015,apca016,apca017,apca018,
          apca019,apca020,apca021,apca022,apca025,
          apca026,apca027,apca028,apca029,apca030,
          apca031,apca032,apca033,apca034,apca035,
          apca036,apca037,apca038,apca039,apca040,
          apca041,apca042,apca043,apca044,apca045,
          apca046,apca047,apca048,apca049,apca050,
          apca051,apca052,apca053,apca054,apca055,
          apca056,apca057,apca058,apca059,apca060,
          apca061,apca062,apca063,apca064,apca065,
          apca066,apca100,apca101,apca103,apca104,
          apca106,apca107,apca108,apca113,apca114,
          apca116,apca117,apca118,apca120,apca121,
          apca123,apca124,apca126,apca127,apca128,
          apca130,apca131,apca133,apca134,apca136,
          apca137,apca138,apcaud001,apcaud002,apcaud003,
          apcaud004,apcaud005,apcaud006,apcaud007,apcaud008,
          apcaud009,apcaud010,apcaud011,apcaud012,apcaud013,
          apcaud014,apcaud015,apcaud016,apcaud017,apcaud018,
          apcaud019,apcaud020,apcaud021,apcaud022,apcaud023,
          apcaud024,apcaud025,apcaud026,apcaud027,apcaud028,
          apcaud029,apcaud030,apca067,apca068,apca069,
          apca070,apca071,apca072,apca073
     INTO l_apca.*
     FROM apca_t 
    WHERE apcaent = g_enterprise 
      AND apcald = p_apcald 
      AND apcadocno = p_apcadocno
   #161208-00026#25   add---e
   
   CALL s_aapt300_prepare_declare()  #aapt300 aapt310 aapt320 aapt340 
   
  
   IF NOT s_aapt300_conf_chk(l_apca.apcald,l_apca.apcadocno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   IF NOT s_aapt300_conf_upd(l_apca.apcald,l_apca.apcadocno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   

  #異動狀態碼欄位/修改人/修改日期
   LET l_apca.apcamoddt = cl_get_current()
   LET l_apca.apcacnfdt = cl_get_current()
   UPDATE apca_t SET apcastus = 'Y',
                     apcamodid= g_user,
                     apcamoddt= l_apca.apcamoddt,
                     apcacnfid= g_user,
                     apcacnfdt= l_apca.apcacnfdt
    WHERE apcaent = g_enterprise AND apcald = l_apca.apcald
      AND apcadocno = l_apca.apcadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: axrt3*立即审核
# Memo...........:
# Usage..........: CALL s_aapt420_contra_doc2_immediately_conf(p_xrcald,p_xrcacomp,p_xrcadocno)
#                  RETURNING 回传参数
# Input parameter: p_xrcald       账套
#                : p_xrcacomp     法人
#                : p_xrcadocno    单据编号
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/12/09 By 06421
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_contra_doc2_immediately_conf(p_xrcald,p_xrcacomp,p_xrcadocno)
   DEFINE p_xrcald          LIKE xrca_t.xrcald
   DEFINE p_xrcadocno      LIKE xrca_t.xrcadocno
   DEFINE p_xrcacomp       LIKE xrca_t.xrcacomp
   DEFINE r_success        LIKE type_t.num5      #处理状态TRUE/FALSE
  #DEFINE l_xrca           RECORD LIKE xrca_t.* #161111-00048#4 mark
   #161111-00048#4 --s add
   DEFINE l_xrca RECORD  #應收憑單單頭
          xrcaent LIKE xrca_t.xrcaent, #企業編號
          xrcaownid LIKE xrca_t.xrcaownid, #資料所有者
          xrcaowndp LIKE xrca_t.xrcaowndp, #資料所屬部門
          xrcacrtid LIKE xrca_t.xrcacrtid, #資料建立者
          xrcacrtdp LIKE xrca_t.xrcacrtdp, #資料建立部門
          xrcacrtdt LIKE xrca_t.xrcacrtdt, #資料創建日
          xrcamodid LIKE xrca_t.xrcamodid, #資料修改者
          xrcamoddt LIKE xrca_t.xrcamoddt, #最近修改日
          xrcacnfid LIKE xrca_t.xrcacnfid, #資料確認者
          xrcacnfdt LIKE xrca_t.xrcacnfdt, #資料確認日
          xrcapstid LIKE xrca_t.xrcapstid, #資料過帳者
          xrcapstdt LIKE xrca_t.xrcapstdt, #資料過帳日
          xrcastus LIKE xrca_t.xrcastus, #狀態碼
          xrcacomp LIKE xrca_t.xrcacomp, #法人
          xrcald LIKE xrca_t.xrcald, #帳套
          xrcadocno LIKE xrca_t.xrcadocno, #應收帳款單號碼
          xrcadocdt LIKE xrca_t.xrcadocdt, #帳款日期
          xrca001 LIKE xrca_t.xrca001, #帳款單性質
          xrcasite LIKE xrca_t.xrcasite, #帳務中心
          xrca003 LIKE xrca_t.xrca003, #帳務人員
          xrca004 LIKE xrca_t.xrca004, #帳款客戶編號
          xrca005 LIKE xrca_t.xrca005, #收款客戶
          xrca006 LIKE xrca_t.xrca006, #客戶分類
          xrca007 LIKE xrca_t.xrca007, #帳款類別
          xrca008 LIKE xrca_t.xrca008, #收款條件編號
          xrca009 LIKE xrca_t.xrca009, #應收款日/應扣抵日
          xrca010 LIKE xrca_t.xrca010, #容許票據到期日
          xrca011 LIKE xrca_t.xrca011, #稅別
          xrca012 LIKE xrca_t.xrca012, #稅率
          xrca013 LIKE xrca_t.xrca013, #含稅否
          xrca014 LIKE xrca_t.xrca014, #人員編號
          xrca015 LIKE xrca_t.xrca015, #部門編號
          xrca016 LIKE xrca_t.xrca016, #來源作業類型
          xrca017 LIKE xrca_t.xrca017, #產生方式
          xrca018 LIKE xrca_t.xrca018, #來源參考單號
          xrca019 LIKE xrca_t.xrca019, #系統產生對應單號(待抵帳款-預收)
          xrca020 LIKE xrca_t.xrca020, #信用狀申請流程否
          xrca021 LIKE xrca_t.xrca021, #商業發票號碼(IV no.)
          xrca022 LIKE xrca_t.xrca022, #出口報單號碼
          xrca023 LIKE xrca_t.xrca023, #發票客戶編號
          xrca024 LIKE xrca_t.xrca024, #發票客戶統一編號
          xrca025 LIKE xrca_t.xrca025, #發票客戶全名
          xrca026 LIKE xrca_t.xrca026, #發票客戶地址
          xrca028 LIKE xrca_t.xrca028, #發票類型
          xrca029 LIKE xrca_t.xrca029, #發票匯率
          xrca030 LIKE xrca_t.xrca030, #發票應開未稅金額
          xrca031 LIKE xrca_t.xrca031, #發票應開稅額
          xrca032 LIKE xrca_t.xrca032, #發票應開含稅金額
          xrca033 LIKE xrca_t.xrca033, #專案編號
          xrca034 LIKE xrca_t.xrca034, #責任中心
          xrca035 LIKE xrca_t.xrca035, #應收(借方)科目編號
          xrca036 LIKE xrca_t.xrca036, #收入(貸方)科目編號
          xrca037 LIKE xrca_t.xrca037, #分錄傳票產生否
          xrca038 LIKE xrca_t.xrca038, #拋轉傳票號碼
          xrca039 LIKE xrca_t.xrca039, #會計檢核附件份數
          xrca040 LIKE xrca_t.xrca040, #留置否
          xrca041 LIKE xrca_t.xrca041, #留置理由碼
          xrca042 LIKE xrca_t.xrca042, #留置設定日期
          xrca043 LIKE xrca_t.xrca043, #留置解除日期
          xrca044 LIKE xrca_t.xrca044, #留置原幣金額
          xrca045 LIKE xrca_t.xrca045, #留置說明
          xrca046 LIKE xrca_t.xrca046, #關係人否
          xrca047 LIKE xrca_t.xrca047, #多角序號
          xrca048 LIKE xrca_t.xrca048, #集團代收/代付單號
          xrca049 LIKE xrca_t.xrca049, #來源營運中心編號
          xrca050 LIKE xrca_t.xrca050, #交易原始單據份數
          xrca051 LIKE xrca_t.xrca051, #作廢理由碼
          xrca052 LIKE xrca_t.xrca052, #列印次數
          xrca053 LIKE xrca_t.xrca053, #備註
          xrca054 LIKE xrca_t.xrca054, #多帳期設定
          xrca055 LIKE xrca_t.xrca055, #繳款優惠條件
          xrca056 LIKE xrca_t.xrca056, #會計檢核附件狀態
          xrca057 LIKE xrca_t.xrca057, #交易對象識別碼
          xrca058 LIKE xrca_t.xrca058, #銷售分類
          xrca059 LIKE xrca_t.xrca059, #預算編號
          xrca060 LIKE xrca_t.xrca060, #發票開立原則
          xrca061 LIKE xrca_t.xrca061, #預計開立發票日期
          xrca062 LIKE xrca_t.xrca062, #多角性質
          xrca063 LIKE xrca_t.xrca063, #整帳批序號
          xrca064 LIKE xrca_t.xrca064, #訂金序次
          xrca065 LIKE xrca_t.xrca065, #發票編號
          xrca066 LIKE xrca_t.xrca066, #發票號碼
          xrca100 LIKE xrca_t.xrca100, #交易原幣別
          xrca101 LIKE xrca_t.xrca101, #原幣匯率
          xrca103 LIKE xrca_t.xrca103, #原幣未稅金額
          xrca104 LIKE xrca_t.xrca104, #原幣稅額
          xrca106 LIKE xrca_t.xrca106, #原幣直接折抵合計金額
          xrca107 LIKE xrca_t.xrca107, #原幣直接沖帳(調整)合計金額
          xrca108 LIKE xrca_t.xrca108, #原幣應收金額
          xrca113 LIKE xrca_t.xrca113, #本幣未稅金額
          xrca114 LIKE xrca_t.xrca114, #本幣稅額
          xrca116 LIKE xrca_t.xrca116, #本幣直接沖帳(調整)合計金額
          xrca117 LIKE xrca_t.xrca117, #本幣直接沖帳(調整)合計金額
          xrca118 LIKE xrca_t.xrca118, #本幣應收金額
          xrca120 LIKE xrca_t.xrca120, #本位幣二幣別
          xrca121 LIKE xrca_t.xrca121, #本位幣二匯率
          xrca123 LIKE xrca_t.xrca123, #本位幣二未稅金額
          xrca124 LIKE xrca_t.xrca124, #本位幣二稅額
          xrca126 LIKE xrca_t.xrca126, #本位幣二直接折抵合計金額
          xrca127 LIKE xrca_t.xrca127, #本位幣二直接沖帳(調整)合計金額
          xrca128 LIKE xrca_t.xrca128, #本位幣二應收金額
          xrca130 LIKE xrca_t.xrca130, #本位幣三幣別
          xrca131 LIKE xrca_t.xrca131, #本位幣三匯率
          xrca133 LIKE xrca_t.xrca133, #本位幣三未稅金額
          xrca134 LIKE xrca_t.xrca134, #本位幣三稅額
          xrca136 LIKE xrca_t.xrca136, #本位幣三直接折抵合計金額
          xrca137 LIKE xrca_t.xrca137, #本位幣三直接沖帳(調整)合計金額
          xrca138 LIKE xrca_t.xrca138, #本位幣三應收金額
          xrcaud001 LIKE xrca_t.xrcaud001, #自定義欄位(文字)001
          xrcaud002 LIKE xrca_t.xrcaud002, #自定義欄位(文字)002
          xrcaud003 LIKE xrca_t.xrcaud003, #自定義欄位(文字)003
          xrcaud004 LIKE xrca_t.xrcaud004, #自定義欄位(文字)004
          xrcaud005 LIKE xrca_t.xrcaud005, #自定義欄位(文字)005
          xrcaud006 LIKE xrca_t.xrcaud006, #自定義欄位(文字)006
          xrcaud007 LIKE xrca_t.xrcaud007, #自定義欄位(文字)007
          xrcaud008 LIKE xrca_t.xrcaud008, #自定義欄位(文字)008
          xrcaud009 LIKE xrca_t.xrcaud009, #自定義欄位(文字)009
          xrcaud010 LIKE xrca_t.xrcaud010, #自定義欄位(文字)010
          xrcaud011 LIKE xrca_t.xrcaud011, #自定義欄位(數字)011
          xrcaud012 LIKE xrca_t.xrcaud012, #自定義欄位(數字)012
          xrcaud013 LIKE xrca_t.xrcaud013, #自定義欄位(數字)013
          xrcaud014 LIKE xrca_t.xrcaud014, #自定義欄位(數字)014
          xrcaud015 LIKE xrca_t.xrcaud015, #自定義欄位(數字)015
          xrcaud016 LIKE xrca_t.xrcaud016, #自定義欄位(數字)016
          xrcaud017 LIKE xrca_t.xrcaud017, #自定義欄位(數字)017
          xrcaud018 LIKE xrca_t.xrcaud018, #自定義欄位(數字)018
          xrcaud019 LIKE xrca_t.xrcaud019, #自定義欄位(數字)019
          xrcaud020 LIKE xrca_t.xrcaud020, #自定義欄位(數字)020
          xrcaud021 LIKE xrca_t.xrcaud021, #自定義欄位(日期時間)021
          xrcaud022 LIKE xrca_t.xrcaud022, #自定義欄位(日期時間)022
          xrcaud023 LIKE xrca_t.xrcaud023, #自定義欄位(日期時間)023
          xrcaud024 LIKE xrca_t.xrcaud024, #自定義欄位(日期時間)024
          xrcaud025 LIKE xrca_t.xrcaud025, #自定義欄位(日期時間)025
          xrcaud026 LIKE xrca_t.xrcaud026, #自定義欄位(日期時間)026
          xrcaud027 LIKE xrca_t.xrcaud027, #自定義欄位(日期時間)027
          xrcaud028 LIKE xrca_t.xrcaud028, #自定義欄位(日期時間)028
          xrcaud029 LIKE xrca_t.xrcaud029, #自定義欄位(日期時間)029
          xrcaud030 LIKE xrca_t.xrcaud030  #自定義欄位(日期時間)030
   END RECORD
   #161111-00048#4 --e add
   
   LET r_success = TRUE

   
   #SELECT * INTO l_xrca.* FROM xrca_t WHERE xrcaent = g_enterprise AND xrcald = p_xrcald AND xrcadocno = p_xrcadocno   #161208-00026#25   mark
   #161208-00026#25   add---s
   SELECT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,
          xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,xrcacnfdt,
          xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,
          xrcadocno,xrcadocdt,xrca001,xrcasite,xrca003,
          xrca004,xrca005,xrca006,xrca007,xrca008,
          xrca009,xrca010,xrca011,xrca012,xrca013,
          xrca014,xrca015,xrca016,xrca017,xrca018,
          xrca019,xrca020,xrca021,xrca022,xrca023,
          xrca024,xrca025,xrca026,xrca028,xrca029,
          xrca030,xrca031,xrca032,xrca033,xrca034,
          xrca035,xrca036,xrca037,xrca038,xrca039,
          xrca040,xrca041,xrca042,xrca043,xrca044,
          xrca045,xrca046,xrca047,xrca048,xrca049,
          xrca050,xrca051,xrca052,xrca053,xrca054,
          xrca055,xrca056,xrca057,xrca058,xrca059,
          xrca060,xrca061,xrca062,xrca063,xrca064,
          xrca065,xrca066,xrca100,xrca101,xrca103,
          xrca104,xrca106,xrca107,xrca108,xrca113,
          xrca114,xrca116,xrca117,xrca118,xrca120,
          xrca121,xrca123,xrca124,xrca126,xrca127,
          xrca128,xrca130,xrca131,xrca133,xrca134,
          xrca136,xrca137,xrca138,xrcaud001,xrcaud002,
          xrcaud003,xrcaud004,xrcaud005,xrcaud006,xrcaud007,
          xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,
          xrcaud013,xrcaud014,xrcaud015,xrcaud016,xrcaud017,
          xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,
          xrcaud023,xrcaud024,xrcaud025,xrcaud026,xrcaud027,
          xrcaud028,xrcaud029,xrcaud030
     INTO l_xrca.* 
     FROM xrca_t 
    WHERE xrcaent = g_enterprise 
      AND xrcald = p_xrcald 
      AND xrcadocno = p_xrcadocno
   #161208-00026#25   add---e
   
   CALL s_aapt300_prepare_declare()  #aapt300 aapt310 aapt320 aapt340 
   
  
   IF NOT s_axrt300_conf_chk(l_xrca.xrcald,l_xrca.xrcadocno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   IF NOT s_axrt300_conf_upd(l_xrca.xrcald,l_xrca.xrcadocno) THEN
      LET r_success = FALSE
      RETURN r_success
   END IF
   

  #異動狀態碼欄位/修改人/修改日期
   LET l_xrca.xrcamoddt = cl_get_current()
   LET l_xrca.xrcacnfdt = cl_get_current()
   UPDATE xrca_t SET xrcastus = 'Y',
                     xrcamodid= g_user,
                     xrcamoddt= l_xrca.xrcamoddt,
                     xrcacnfid= g_user,
                     xrcacnfdt= l_xrca.xrcacnfdt
    WHERE xrcaent = g_enterprise AND xrcald = l_xrca.xrcald
      AND xrcadocno = l_xrca.xrcadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: aapt3*立即抛转凭证
# Memo...........:
# Usage..........: CALL s_aapt420_contra_doc_immediately_gen(p_apcald,p_apcadocno)
#                  RETURNING ---
# Input parameter: p_apcald      账套
#                : p_apcadocno   编号
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/12/10 By 06421
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_contra_doc_immediately_gen(p_apcald,p_apcadocno)
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_doc_success     LIKE type_t.num5
   DEFINE l_slip            LIKE ooba_t.ooba002
   DEFINE l_dfin0032        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   DEFINE l_glap001         LIKE glap_t.glap001
   DEFINE la_param          RECORD
          prog              STRING,
          param             DYNAMIC ARRAY OF STRING
                            END RECORD
   DEFINE ls_js             STRING
   DEFINE l_glaa024         LIKE glaa_t.glaa024
   DEFINE l_ooac004         LIKE ooac_t.ooac004
   DEFINE l_chr             LIKE type_t.chr1       #狀態碼
   DEFINE l_gl_slip         LIKE ooba_t.ooba002      #總帳單別
   DEFINE p_apcald          LIKE apca_t.apcald
   DEFINE p_apcadocno      LIKE apca_t.apcadocno
   DEFINE p_apcacomp       LIKE apca_t.apcacomp
   DEFINE r_success        LIKE type_t.num5      #处理状态TRUE/FALSE
  #DEFINE l_apca           RECORD LIKE apca_t.*  #161111-00048#4 mark
   #161111-00048#4 --s add
   DEFINE l_apca RECORD  #應付憑單單頭
          apcaent LIKE apca_t.apcaent, #企業編號
          apcaownid LIKE apca_t.apcaownid, #資料所有者
          apcaowndp LIKE apca_t.apcaowndp, #資料所有部門
          apcacrtid LIKE apca_t.apcacrtid, #資料建立者
          apcacrtdp LIKE apca_t.apcacrtdp, #資料建立部門
          apcacrtdt LIKE apca_t.apcacrtdt, #資料創建日
          apcamodid LIKE apca_t.apcamodid, #資料修改者
          apcamoddt LIKE apca_t.apcamoddt, #最近修改日
          apcacnfid LIKE apca_t.apcacnfid, #資料確認者
          apcacnfdt LIKE apca_t.apcacnfdt, #資料確認日
          apcapstid LIKE apca_t.apcapstid, #資料過帳者
          apcapstdt LIKE apca_t.apcapstdt, #資料過帳日
          apcastus LIKE apca_t.apcastus, #狀態碼
          apcald LIKE apca_t.apcald, #帳套
          apcacomp LIKE apca_t.apcacomp, #法人
          apcadocno LIKE apca_t.apcadocno, #應付帳款單號碼
          apcadocdt LIKE apca_t.apcadocdt, #帳款日期
          apcasite LIKE apca_t.apcasite, #帳務中心
          apca001 LIKE apca_t.apca001, #帳款單性質
          apca003 LIKE apca_t.apca003, #帳務人員
          apca004 LIKE apca_t.apca004, #帳款對象編號
          apca005 LIKE apca_t.apca005, #付款對象
          apca006 LIKE apca_t.apca006, #供應商分類
          apca007 LIKE apca_t.apca007, #帳款類別
          apca008 LIKE apca_t.apca008, #付款條件編號
          apca009 LIKE apca_t.apca009, #應付款日/應扣抵日
          apca010 LIKE apca_t.apca010, #容許票據到期日
          apca011 LIKE apca_t.apca011, #稅別
          apca012 LIKE apca_t.apca012, #稅率
          apca013 LIKE apca_t.apca013, #含稅否
          apca014 LIKE apca_t.apca014, #人員編號
          apca015 LIKE apca_t.apca015, #部門編號
          apca016 LIKE apca_t.apca016, #來源作業類型
          apca017 LIKE apca_t.apca017, #產生方式
          apca018 LIKE apca_t.apca018, #來源參考單號
          apca019 LIKE apca_t.apca019, #系統產生對應單號(待抵帳款-預付)
          apca020 LIKE apca_t.apca020, #信用狀付款否
          apca021 LIKE apca_t.apca021, #商業發票號碼(IV no.)
          apca022 LIKE apca_t.apca022, #進口報單號碼
          apca025 LIKE apca_t.apca025, #差異處理(發票與帳款差異)
          apca026 LIKE apca_t.apca026, #原幣未稅差異
          apca027 LIKE apca_t.apca027, #原幣稅額差異
          apca028 LIKE apca_t.apca028, #本幣未稅差異
          apca029 LIKE apca_t.apca029, #本幣幣稅額差異
          apca030 LIKE apca_t.apca030, #差異科目
          apca031 LIKE apca_t.apca031, #產生之差異折讓單號
          apca032 LIKE apca_t.apca032, #發票類型
          apca033 LIKE apca_t.apca033, #專案編號
          apca034 LIKE apca_t.apca034, #責任中心
          apca035 LIKE apca_t.apca035, #應付(貸方)科目編號
          apca036 LIKE apca_t.apca036, #費用(借方)科目編號
          apca037 LIKE apca_t.apca037, #產生傳票否
          apca038 LIKE apca_t.apca038, #拋轉傳票號碼
          apca039 LIKE apca_t.apca039, #會計檢核附件份數
          apca040 LIKE apca_t.apca040, #留置否
          apca041 LIKE apca_t.apca041, #留置理由碼
          apca042 LIKE apca_t.apca042, #留置設定日期
          apca043 LIKE apca_t.apca043, #留置解除日期
          apca044 LIKE apca_t.apca044, #留置原幣金額
          apca045 LIKE apca_t.apca045, #留置說明
          apca046 LIKE apca_t.apca046, #關係人否
          apca047 LIKE apca_t.apca047, #多角序號
          apca048 LIKE apca_t.apca048, #集團代付/代付單號
          apca049 LIKE apca_t.apca049, #來源營運中心編號
          apca050 LIKE apca_t.apca050, #交易原始單據份數
          apca051 LIKE apca_t.apca051, #作廢理由碼
          apca052 LIKE apca_t.apca052, #列印次數
          apca053 LIKE apca_t.apca053, #備註
          apca054 LIKE apca_t.apca054, #多帳期設定
          apca055 LIKE apca_t.apca055, #繳款優惠條件
          apca056 LIKE apca_t.apca056, #會計檢核附件狀態
          apca057 LIKE apca_t.apca057, #交易對象識別碼
          apca058 LIKE apca_t.apca058, #稅別交易類型
          apca059 LIKE apca_t.apca059, #預算編號
          apca060 LIKE apca_t.apca060, #發票開立方式
          apca061 LIKE apca_t.apca061, #預開發票基準日
          apca062 LIKE apca_t.apca062, #多角性質
          apca063 LIKE apca_t.apca063, #整帳批序號
          apca064 LIKE apca_t.apca064, #訂金序次
          apca065 LIKE apca_t.apca065, #發票編號
          apca066 LIKE apca_t.apca066, #發票號碼
          apca100 LIKE apca_t.apca100, #交易原幣別
          apca101 LIKE apca_t.apca101, #原幣匯率
          apca103 LIKE apca_t.apca103, #原幣未稅金額
          apca104 LIKE apca_t.apca104, #原幣稅額
          apca106 LIKE apca_t.apca106, #原幣應稅折抵合計金額
          apca107 LIKE apca_t.apca107, #原幣直接沖帳(調整)合計金額
          apca108 LIKE apca_t.apca108, #原幣應付金額
          apca113 LIKE apca_t.apca113, #本幣未稅金額
          apca114 LIKE apca_t.apca114, #本幣稅額
          apca116 LIKE apca_t.apca116, #本幣應稅折抵合計金額
          apca117 LIKE apca_t.apca117, #NO USE
          apca118 LIKE apca_t.apca118, #本幣應付金額
          apca120 LIKE apca_t.apca120, #本位幣二幣別
          apca121 LIKE apca_t.apca121, #本位幣二匯率
          apca123 LIKE apca_t.apca123, #本位幣二未稅金額
          apca124 LIKE apca_t.apca124, #本位幣二稅額
          apca126 LIKE apca_t.apca126, #本位幣二應稅折抵合計金額
          apca127 LIKE apca_t.apca127, #NO USE
          apca128 LIKE apca_t.apca128, #本位幣二應付金額
          apca130 LIKE apca_t.apca130, #本位幣三幣別
          apca131 LIKE apca_t.apca131, #本位幣三匯率
          apca133 LIKE apca_t.apca133, #本位幣三未稅金額
          apca134 LIKE apca_t.apca134, #本位幣三稅額
          apca136 LIKE apca_t.apca136, #本位幣三應稅折抵合計金額
          apca137 LIKE apca_t.apca137, #NO USE
          apca138 LIKE apca_t.apca138, #本位幣三應付金額
          apcaud001 LIKE apca_t.apcaud001, #自定義欄位(文字)001
          apcaud002 LIKE apca_t.apcaud002, #自定義欄位(文字)002
          apcaud003 LIKE apca_t.apcaud003, #自定義欄位(文字)003
          apcaud004 LIKE apca_t.apcaud004, #自定義欄位(文字)004
          apcaud005 LIKE apca_t.apcaud005, #自定義欄位(文字)005
          apcaud006 LIKE apca_t.apcaud006, #自定義欄位(文字)006
          apcaud007 LIKE apca_t.apcaud007, #自定義欄位(文字)007
          apcaud008 LIKE apca_t.apcaud008, #自定義欄位(文字)008
          apcaud009 LIKE apca_t.apcaud009, #自定義欄位(文字)009
          apcaud010 LIKE apca_t.apcaud010, #自定義欄位(文字)010
          apcaud011 LIKE apca_t.apcaud011, #自定義欄位(數字)011
          apcaud012 LIKE apca_t.apcaud012, #自定義欄位(數字)012
          apcaud013 LIKE apca_t.apcaud013, #自定義欄位(數字)013
          apcaud014 LIKE apca_t.apcaud014, #自定義欄位(數字)014
          apcaud015 LIKE apca_t.apcaud015, #自定義欄位(數字)015
          apcaud016 LIKE apca_t.apcaud016, #自定義欄位(數字)016
          apcaud017 LIKE apca_t.apcaud017, #自定義欄位(數字)017
          apcaud018 LIKE apca_t.apcaud018, #自定義欄位(數字)018
          apcaud019 LIKE apca_t.apcaud019, #自定義欄位(數字)019
          apcaud020 LIKE apca_t.apcaud020, #自定義欄位(數字)020
          apcaud021 LIKE apca_t.apcaud021, #自定義欄位(日期時間)021
          apcaud022 LIKE apca_t.apcaud022, #自定義欄位(日期時間)022
          apcaud023 LIKE apca_t.apcaud023, #自定義欄位(日期時間)023
          apcaud024 LIKE apca_t.apcaud024, #自定義欄位(日期時間)024
          apcaud025 LIKE apca_t.apcaud025, #自定義欄位(日期時間)025
          apcaud026 LIKE apca_t.apcaud026, #自定義欄位(日期時間)026
          apcaud027 LIKE apca_t.apcaud027, #自定義欄位(日期時間)027
          apcaud028 LIKE apca_t.apcaud028, #自定義欄位(日期時間)028
          apcaud029 LIKE apca_t.apcaud029, #自定義欄位(日期時間)029
          apcaud030 LIKE apca_t.apcaud030, #自定義欄位(日期時間)030
          apca067 LIKE apca_t.apca067, #管理品類
          apca068 LIKE apca_t.apca068, #經營方式
          apca069 LIKE apca_t.apca069, #no use
          apca070 LIKE apca_t.apca070, #no use
          apca071 LIKE apca_t.apca071, #no use
          apca072 LIKE apca_t.apca072, #no use
          apca073 LIKE apca_t.apca073  #L/C No.
   END RECORD
   #161111-00048#4 --e add
   DEFINE l_glaa013        LIKE glaa_t.glaa013
   DEFINE l_glaa121        LIKE glaa_t.glaa121
   DEFINE l_glaa102        LIKE glaa_t.glaa102
   DEFINE l_glaa003        LIKE glaa_t.glaa003
   DEFINE l_start_no      LIKE glap_t.glapdocno
   DEFINE l_end_no        LIKE glap_t.glapdocno
   DEFINE l_year          LIKE type_t.num5
   DEFINE l_month         LIKE type_t.num5
   DEFINE l_pdate_s       LIKE glav_t.glav004   #當期起始日
   DEFINE l_pdate_e       LIKE glav_t.glav004   #當期截止日
   DEFINE l_glav002       LIKE glav_t.glav002
   DEFINE l_glav005       LIKE glav_t.glav005
   DEFINE l_glav006       LIKE glav_t.glav006
   DEFINE l_glav007       LIKE glav_t.glav007
   DEFINE l_wdate         LIKE glav_t.glav004
   IF cl_null(p_apcald)    THEN RETURN END IF   #無資料直接返回不做處理
   #IF cl_null(p_apcacomp)  THEN RETURN END IF   #無資料直接返回不做處理
   IF cl_null(p_apcadocno) THEN RETURN END IF   #無資料直接返回不做處理
   
  

   #SELECT * INTO l_apca.*   #161208-00026#25   mark
   #161208-00026#25   add---s
   SELECT apcaent,apcaownid,apcaowndp,apcacrtid,apcacrtdp,
          apcacrtdt,apcamodid,apcamoddt,apcacnfid,apcacnfdt,
          apcapstid,apcapstdt,apcastus,apcald,apcacomp,
          apcadocno,apcadocdt,apcasite,apca001,apca003,
          apca004,apca005,apca006,apca007,apca008,
          apca009,apca010,apca011,apca012,apca013,
          apca014,apca015,apca016,apca017,apca018,
          apca019,apca020,apca021,apca022,apca025,
          apca026,apca027,apca028,apca029,apca030,
          apca031,apca032,apca033,apca034,apca035,
          apca036,apca037,apca038,apca039,apca040,
          apca041,apca042,apca043,apca044,apca045,
          apca046,apca047,apca048,apca049,apca050,
          apca051,apca052,apca053,apca054,apca055,
          apca056,apca057,apca058,apca059,apca060,
          apca061,apca062,apca063,apca064,apca065,
          apca066,apca100,apca101,apca103,apca104,
          apca106,apca107,apca108,apca113,apca114,
          apca116,apca117,apca118,apca120,apca121,
          apca123,apca124,apca126,apca127,apca128,
          apca130,apca131,apca133,apca134,apca136,
          apca137,apca138,apcaud001,apcaud002,apcaud003,
          apcaud004,apcaud005,apcaud006,apcaud007,apcaud008,
          apcaud009,apcaud010,apcaud011,apcaud012,apcaud013,
          apcaud014,apcaud015,apcaud016,apcaud017,apcaud018,
          apcaud019,apcaud020,apcaud021,apcaud022,apcaud023,
          apcaud024,apcaud025,apcaud026,apcaud027,apcaud028,
          apcaud029,apcaud030,apca067,apca068,apca069,
          apca070,apca071,apca072,apca073
     INTO l_apca.*
   #161208-00026#25   add---e
     FROM apca_t 
    WHERE apcaent = g_enterprise 
      AND apcadocno = p_apcadocno 
      AND apcald = p_apcald 
     # AND apcacomp = p_apcacomp

   IF l_apca.apcastus <> 'Y' OR cl_null(l_apca.apcastus)  THEN RETURN END IF

   IF NOT cl_null(l_apca.apca038)  THEN RETURN END IF #传票号码已经存在返回不做处理



  #取得單別
   CALL s_aooi200_fin_get_slip(l_apca.apcadocno) RETURNING l_success,l_slip
  #取得單別設置的"是否直接抛转凭证"參數
   CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,l_slip,'D-FIN-0032') RETURNING l_dfin0032

   IF cl_null(l_dfin0032) OR l_dfin0032 MATCHES '[Nn]' THEN #參數值為空或為N則不做直接抛转凭证邏輯
      RETURN 
   END IF 

   #是否产生分录传票
   CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,l_slip,'D-FIN-0030') RETURNING l_chr
   IF l_chr <> 'Y'  THEN
      RETURN 
   END IF
   
   #取得傳票單別(D-FIN-2002:產生之總帳傳票單別)
   LET l_gl_slip = ''
   CALL s_fin_get_doc_para(l_apca.apcald,l_apca.apcacomp,l_slip,'D-FIN-2002') RETURNING l_gl_slip

   #IF NOT cl_ask_confirm('aap-00404') THEN RETURN END IF  #询问是否直接抛转凭证

   IF NOT cl_null(l_gl_slip) THEN 
        #LET la_param.param[6] = 'Y' #不弹窗
        #生成凭证
         CALL s_transaction_begin()   
         DELETE  FROM s_voucher_tmp
         CALL cl_err_collect_init()
        
         #若以原單據日期立帳
         SELECT glaa013,glaa121,glaa102,glaa003 INTO l_glaa013,l_glaa121,l_glaa102,l_glaa003
              FROM glaa_t
             WHERE glaaent = g_enterprise AND glaald = l_apca.apcald
         IF cl_null(l_apca.apcadocdt) OR l_apca.apcadocdt < = l_glaa013 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'aap-00077'
           
            LET g_errparam.extend = ''                                  
            LET g_errparam.popup = TRUE
            LET g_errparam.coll_vals[1]  = l_apca.apcadocno
            CALL cl_err()
                                              
            CALL s_transaction_end('N','Y')                               
         END IF
         
         #判斷傳票日期有值否，有值用此來推算出當期會計週期起始日，單據的立帳日必須在這區間內
         IF NOT cl_null(l_apca.apcadocdt) THEN
            #取得會計週期參照表
            LET l_year = YEAR(l_apca.apcadocdt)
            LET l_month = MONTH(l_apca.apcadocdt)
            #取得會計當期起始日
            CALL s_get_accdate(l_glaa003,'',l_year,l_month)
                  RETURNING g_sub_success,g_errno,l_glav002,l_glav005,l_wdate,l_wdate,
                            l_glav006,l_pdate_s,l_pdate_e,l_glav007,l_wdate,l_wdate
            IF NOT cl_null(l_pdate_s) AND NOT cl_null(l_pdate_e) THEN
               IF l_apca.apcadocdt < l_pdate_s OR l_apca.apcadocdt > l_pdate_e THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code ='aap-00340'
                 
                  LET g_errparam.extend = ''                                  
                  LET g_errparam.popup = TRUE
                  LET g_errparam.coll_vals[1]  = l_apca.apcadocno
                  CALL cl_err()
                                                    
                  CALL s_transaction_end('N','Y')             
               END IF
            END IF
         END IF
               
         CALL cl_err_collect_show()
      
         INSERT INTO s_voucher_tmp (docno,type)
               VALUES ( l_apca.apcadocno , '0' )
        
         IF NOT l_glaa121 = 'Y' THEN                 
            CALL s_aapp330_gen_ac('1','P10',l_apca.apcald,'','','1','!#@','Y') RETURNING g_sub_success,l_start_no,l_end_no
         END IF
         IF g_sub_success THEN
            CALL s_transaction_end('Y','Y')
         ELSE
            CALL s_transaction_end('N','Y')
         END IF   
               
         CALL s_transaction_begin()               
         CALL cl_err_collect_init()
         CALL s_aapp330_generate_voucher('P10',l_gl_slip,l_apca.apcadocdt,l_apca.apcald,'1','Y',l_glaa102,'AP')
              RETURNING g_sub_success,l_apca.apca038,l_apca.apca038
         CALL cl_err_collect_show()   
         IF g_sub_success AND NOT cl_null(l_apca.apca038) THEN
            CALL s_transaction_end('Y','Y')

         ELSE
            CALL s_transaction_end('N','Y')
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'adz-00218'
            LET g_errparam.popup = TRUE
            CALL cl_err()
            RETURN
         END IF  
         #生成凭证
      ELSE
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aap-00054'
         LET g_errparam.extend = l_gl_slip
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN
   END IF
END FUNCTION

################################################################################
# Descriptions...: axrt3*立即抛转凭证
# Memo...........:
# Usage..........: CALL s_aapt420_contra_doc2_immediately_gen(p_xrcald,p_xrcadocno)
#                  RETURNING 回传参数
# Input parameter: p_xrcald    帐别
#                : p_xrdocno   单据编号
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2015/12/10 By 06421
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_contra_doc2_immediately_gen(p_xrcald,p_xrcadocno)
   DEFINE p_xrcald          LIKE xrca_t.xrcald
   DEFINE p_xrcadocno       LIKE xrca_t.xrcadocno
   DEFINE l_success         LIKE type_t.num5
   DEFINE l_doc_success     LIKE type_t.num5
   DEFINE l_slip            LIKE ooba_t.ooba002
   DEFINE l_dfin0032        LIKE type_t.chr1
   DEFINE l_count           LIKE type_t.num5
   DEFINE l_glap001         LIKE glap_t.glap001
   DEFINE la_param          RECORD
          prog              STRING,
          param             DYNAMIC ARRAY OF STRING
                            END RECORD
   DEFINE ls_js             STRING
   DEFINE l_glaa024         LIKE glaa_t.glaa024
   DEFINE l_ooac004         LIKE ooac_t.ooac004
  #DEFINE l_xrca            RECORD LIKE xrca_t.* #161111-00048#4 mark
   #161111-00048#4 --s add
   DEFINE l_xrca RECORD  #應收憑單單頭
          xrcaent LIKE xrca_t.xrcaent, #企業編號
          xrcaownid LIKE xrca_t.xrcaownid, #資料所有者
          xrcaowndp LIKE xrca_t.xrcaowndp, #資料所屬部門
          xrcacrtid LIKE xrca_t.xrcacrtid, #資料建立者
          xrcacrtdp LIKE xrca_t.xrcacrtdp, #資料建立部門
          xrcacrtdt LIKE xrca_t.xrcacrtdt, #資料創建日
          xrcamodid LIKE xrca_t.xrcamodid, #資料修改者
          xrcamoddt LIKE xrca_t.xrcamoddt, #最近修改日
          xrcacnfid LIKE xrca_t.xrcacnfid, #資料確認者
          xrcacnfdt LIKE xrca_t.xrcacnfdt, #資料確認日
          xrcapstid LIKE xrca_t.xrcapstid, #資料過帳者
          xrcapstdt LIKE xrca_t.xrcapstdt, #資料過帳日
          xrcastus LIKE xrca_t.xrcastus, #狀態碼
          xrcacomp LIKE xrca_t.xrcacomp, #法人
          xrcald LIKE xrca_t.xrcald, #帳套
          xrcadocno LIKE xrca_t.xrcadocno, #應收帳款單號碼
          xrcadocdt LIKE xrca_t.xrcadocdt, #帳款日期
          xrca001 LIKE xrca_t.xrca001, #帳款單性質
          xrcasite LIKE xrca_t.xrcasite, #帳務中心
          xrca003 LIKE xrca_t.xrca003, #帳務人員
          xrca004 LIKE xrca_t.xrca004, #帳款客戶編號
          xrca005 LIKE xrca_t.xrca005, #收款客戶
          xrca006 LIKE xrca_t.xrca006, #客戶分類
          xrca007 LIKE xrca_t.xrca007, #帳款類別
          xrca008 LIKE xrca_t.xrca008, #收款條件編號
          xrca009 LIKE xrca_t.xrca009, #應收款日/應扣抵日
          xrca010 LIKE xrca_t.xrca010, #容許票據到期日
          xrca011 LIKE xrca_t.xrca011, #稅別
          xrca012 LIKE xrca_t.xrca012, #稅率
          xrca013 LIKE xrca_t.xrca013, #含稅否
          xrca014 LIKE xrca_t.xrca014, #人員編號
          xrca015 LIKE xrca_t.xrca015, #部門編號
          xrca016 LIKE xrca_t.xrca016, #來源作業類型
          xrca017 LIKE xrca_t.xrca017, #產生方式
          xrca018 LIKE xrca_t.xrca018, #來源參考單號
          xrca019 LIKE xrca_t.xrca019, #系統產生對應單號(待抵帳款-預收)
          xrca020 LIKE xrca_t.xrca020, #信用狀申請流程否
          xrca021 LIKE xrca_t.xrca021, #商業發票號碼(IV no.)
          xrca022 LIKE xrca_t.xrca022, #出口報單號碼
          xrca023 LIKE xrca_t.xrca023, #發票客戶編號
          xrca024 LIKE xrca_t.xrca024, #發票客戶統一編號
          xrca025 LIKE xrca_t.xrca025, #發票客戶全名
          xrca026 LIKE xrca_t.xrca026, #發票客戶地址
          xrca028 LIKE xrca_t.xrca028, #發票類型
          xrca029 LIKE xrca_t.xrca029, #發票匯率
          xrca030 LIKE xrca_t.xrca030, #發票應開未稅金額
          xrca031 LIKE xrca_t.xrca031, #發票應開稅額
          xrca032 LIKE xrca_t.xrca032, #發票應開含稅金額
          xrca033 LIKE xrca_t.xrca033, #專案編號
          xrca034 LIKE xrca_t.xrca034, #責任中心
          xrca035 LIKE xrca_t.xrca035, #應收(借方)科目編號
          xrca036 LIKE xrca_t.xrca036, #收入(貸方)科目編號
          xrca037 LIKE xrca_t.xrca037, #分錄傳票產生否
          xrca038 LIKE xrca_t.xrca038, #拋轉傳票號碼
          xrca039 LIKE xrca_t.xrca039, #會計檢核附件份數
          xrca040 LIKE xrca_t.xrca040, #留置否
          xrca041 LIKE xrca_t.xrca041, #留置理由碼
          xrca042 LIKE xrca_t.xrca042, #留置設定日期
          xrca043 LIKE xrca_t.xrca043, #留置解除日期
          xrca044 LIKE xrca_t.xrca044, #留置原幣金額
          xrca045 LIKE xrca_t.xrca045, #留置說明
          xrca046 LIKE xrca_t.xrca046, #關係人否
          xrca047 LIKE xrca_t.xrca047, #多角序號
          xrca048 LIKE xrca_t.xrca048, #集團代收/代付單號
          xrca049 LIKE xrca_t.xrca049, #來源營運中心編號
          xrca050 LIKE xrca_t.xrca050, #交易原始單據份數
          xrca051 LIKE xrca_t.xrca051, #作廢理由碼
          xrca052 LIKE xrca_t.xrca052, #列印次數
          xrca053 LIKE xrca_t.xrca053, #備註
          xrca054 LIKE xrca_t.xrca054, #多帳期設定
          xrca055 LIKE xrca_t.xrca055, #繳款優惠條件
          xrca056 LIKE xrca_t.xrca056, #會計檢核附件狀態
          xrca057 LIKE xrca_t.xrca057, #交易對象識別碼
          xrca058 LIKE xrca_t.xrca058, #銷售分類
          xrca059 LIKE xrca_t.xrca059, #預算編號
          xrca060 LIKE xrca_t.xrca060, #發票開立原則
          xrca061 LIKE xrca_t.xrca061, #預計開立發票日期
          xrca062 LIKE xrca_t.xrca062, #多角性質
          xrca063 LIKE xrca_t.xrca063, #整帳批序號
          xrca064 LIKE xrca_t.xrca064, #訂金序次
          xrca065 LIKE xrca_t.xrca065, #發票編號
          xrca066 LIKE xrca_t.xrca066, #發票號碼
          xrca100 LIKE xrca_t.xrca100, #交易原幣別
          xrca101 LIKE xrca_t.xrca101, #原幣匯率
          xrca103 LIKE xrca_t.xrca103, #原幣未稅金額
          xrca104 LIKE xrca_t.xrca104, #原幣稅額
          xrca106 LIKE xrca_t.xrca106, #原幣直接折抵合計金額
          xrca107 LIKE xrca_t.xrca107, #原幣直接沖帳(調整)合計金額
          xrca108 LIKE xrca_t.xrca108, #原幣應收金額
          xrca113 LIKE xrca_t.xrca113, #本幣未稅金額
          xrca114 LIKE xrca_t.xrca114, #本幣稅額
          xrca116 LIKE xrca_t.xrca116, #本幣直接沖帳(調整)合計金額
          xrca117 LIKE xrca_t.xrca117, #本幣直接沖帳(調整)合計金額
          xrca118 LIKE xrca_t.xrca118, #本幣應收金額
          xrca120 LIKE xrca_t.xrca120, #本位幣二幣別
          xrca121 LIKE xrca_t.xrca121, #本位幣二匯率
          xrca123 LIKE xrca_t.xrca123, #本位幣二未稅金額
          xrca124 LIKE xrca_t.xrca124, #本位幣二稅額
          xrca126 LIKE xrca_t.xrca126, #本位幣二直接折抵合計金額
          xrca127 LIKE xrca_t.xrca127, #本位幣二直接沖帳(調整)合計金額
          xrca128 LIKE xrca_t.xrca128, #本位幣二應收金額
          xrca130 LIKE xrca_t.xrca130, #本位幣三幣別
          xrca131 LIKE xrca_t.xrca131, #本位幣三匯率
          xrca133 LIKE xrca_t.xrca133, #本位幣三未稅金額
          xrca134 LIKE xrca_t.xrca134, #本位幣三稅額
          xrca136 LIKE xrca_t.xrca136, #本位幣三直接折抵合計金額
          xrca137 LIKE xrca_t.xrca137, #本位幣三直接沖帳(調整)合計金額
          xrca138 LIKE xrca_t.xrca138, #本位幣三應收金額
          xrcaud001 LIKE xrca_t.xrcaud001, #自定義欄位(文字)001
          xrcaud002 LIKE xrca_t.xrcaud002, #自定義欄位(文字)002
          xrcaud003 LIKE xrca_t.xrcaud003, #自定義欄位(文字)003
          xrcaud004 LIKE xrca_t.xrcaud004, #自定義欄位(文字)004
          xrcaud005 LIKE xrca_t.xrcaud005, #自定義欄位(文字)005
          xrcaud006 LIKE xrca_t.xrcaud006, #自定義欄位(文字)006
          xrcaud007 LIKE xrca_t.xrcaud007, #自定義欄位(文字)007
          xrcaud008 LIKE xrca_t.xrcaud008, #自定義欄位(文字)008
          xrcaud009 LIKE xrca_t.xrcaud009, #自定義欄位(文字)009
          xrcaud010 LIKE xrca_t.xrcaud010, #自定義欄位(文字)010
          xrcaud011 LIKE xrca_t.xrcaud011, #自定義欄位(數字)011
          xrcaud012 LIKE xrca_t.xrcaud012, #自定義欄位(數字)012
          xrcaud013 LIKE xrca_t.xrcaud013, #自定義欄位(數字)013
          xrcaud014 LIKE xrca_t.xrcaud014, #自定義欄位(數字)014
          xrcaud015 LIKE xrca_t.xrcaud015, #自定義欄位(數字)015
          xrcaud016 LIKE xrca_t.xrcaud016, #自定義欄位(數字)016
          xrcaud017 LIKE xrca_t.xrcaud017, #自定義欄位(數字)017
          xrcaud018 LIKE xrca_t.xrcaud018, #自定義欄位(數字)018
          xrcaud019 LIKE xrca_t.xrcaud019, #自定義欄位(數字)019
          xrcaud020 LIKE xrca_t.xrcaud020, #自定義欄位(數字)020
          xrcaud021 LIKE xrca_t.xrcaud021, #自定義欄位(日期時間)021
          xrcaud022 LIKE xrca_t.xrcaud022, #自定義欄位(日期時間)022
          xrcaud023 LIKE xrca_t.xrcaud023, #自定義欄位(日期時間)023
          xrcaud024 LIKE xrca_t.xrcaud024, #自定義欄位(日期時間)024
          xrcaud025 LIKE xrca_t.xrcaud025, #自定義欄位(日期時間)025
          xrcaud026 LIKE xrca_t.xrcaud026, #自定義欄位(日期時間)026
          xrcaud027 LIKE xrca_t.xrcaud027, #自定義欄位(日期時間)027
          xrcaud028 LIKE xrca_t.xrcaud028, #自定義欄位(日期時間)028
          xrcaud029 LIKE xrca_t.xrcaud029, #自定義欄位(日期時間)029
          xrcaud030 LIKE xrca_t.xrcaud030  #自定義欄位(日期時間)030
   END RECORD
   #161111-00048#4 --e add
   DEFINE l_chr             LIKE type_t.chr1       #狀態碼
   
   IF cl_null(p_xrcald)    THEN RETURN END IF   #無資料直接返回不做處理
   IF cl_null(p_xrcadocno) THEN RETURN END IF   #無資料直接返回不做處理
   #SELECT * INTO l_xrca.* FROM xrca_t WHERE xrcaent = g_enterprise AND xrcald = p_xrcald and xrcadocno = p_xrcadocno   #161208-00026#25   mark
   #161208-00026#25   add---s
   SELECT xrcaent,xrcaownid,xrcaowndp,xrcacrtid,xrcacrtdp,
          xrcacrtdt,xrcamodid,xrcamoddt,xrcacnfid,xrcacnfdt,
          xrcapstid,xrcapstdt,xrcastus,xrcacomp,xrcald,
          xrcadocno,xrcadocdt,xrca001,xrcasite,xrca003,
          xrca004,xrca005,xrca006,xrca007,xrca008,
          xrca009,xrca010,xrca011,xrca012,xrca013,
          xrca014,xrca015,xrca016,xrca017,xrca018,
          xrca019,xrca020,xrca021,xrca022,xrca023,
          xrca024,xrca025,xrca026,xrca028,xrca029,
          xrca030,xrca031,xrca032,xrca033,xrca034,
          xrca035,xrca036,xrca037,xrca038,xrca039,
          xrca040,xrca041,xrca042,xrca043,xrca044,
          xrca045,xrca046,xrca047,xrca048,xrca049,
          xrca050,xrca051,xrca052,xrca053,xrca054,
          xrca055,xrca056,xrca057,xrca058,xrca059,
          xrca060,xrca061,xrca062,xrca063,xrca064,
          xrca065,xrca066,xrca100,xrca101,xrca103,
          xrca104,xrca106,xrca107,xrca108,xrca113,
          xrca114,xrca116,xrca117,xrca118,xrca120,
          xrca121,xrca123,xrca124,xrca126,xrca127,
          xrca128,xrca130,xrca131,xrca133,xrca134,
          xrca136,xrca137,xrca138,xrcaud001,xrcaud002,
          xrcaud003,xrcaud004,xrcaud005,xrcaud006,xrcaud007,
          xrcaud008,xrcaud009,xrcaud010,xrcaud011,xrcaud012,
          xrcaud013,xrcaud014,xrcaud015,xrcaud016,xrcaud017,
          xrcaud018,xrcaud019,xrcaud020,xrcaud021,xrcaud022,
          xrcaud023,xrcaud024,xrcaud025,xrcaud026,xrcaud027,
          xrcaud028,xrcaud029,xrcaud030
     INTO l_xrca.* 
     FROM xrca_t 
    WHERE xrcaent = g_enterprise 
      AND xrcald = p_xrcald 
      AND xrcadocno = p_xrcadocno
   #161208-00026#25   add---e
   IF NOT cl_null(l_xrca.xrca038)   THEN RETURN END IF   #無傳票單號不做處理

    #取得單別
    CALL s_aooi200_fin_get_slip(p_xrcadocno) RETURNING l_success,l_slip
    SELECT glaa024 INTO l_glaa024 FROM glaa_t WHERE glaaent = g_enterprise AND glaald = p_xrcald
   
   #取得單別設置的"是否直接抛转凭证"參數
   CALL s_fin_get_doc_para(l_xrca.xrcald,l_xrca.xrcacomp,l_slip,'D-FIN-0032') RETURNING l_dfin0032

   IF cl_null(l_dfin0032) OR l_dfin0032 MATCHES '[Nn]' THEN #參數值為空或為N則不做直接抛转凭证邏輯
      RETURN 
   END IF 

   #是否产生分录传票
   CALL s_fin_get_doc_para(l_xrca.xrcald,l_xrca.xrcacomp,l_slip,'D-FIN-0030') RETURNING l_chr
   IF l_chr <> 'Y'  THEN RETURN END IF
   
    SELECT ooac004 INTO l_ooac004
      FROM ooac_t
     WHERE ooacent = g_enterprise
       AND ooac001 = l_glaa024
       AND ooac002 = l_slip
       AND ooac003 = 'D-FIN-2002'
   IF NOT cl_null(l_ooac004) THEN
       LET la_param.prog = "axrp330"
       LET la_param.param[1] = p_xrcald
       LET la_param.param[2] = p_xrcadocno
       LET la_param.param[3] = l_xrca.xrcasite
       LET la_param.param[4] = l_ooac004
       LET la_param.param[5] = l_xrca.xrcadocdt
       LET la_param.param[6] = 'Y'
       LET ls_js = util.JSON.stringify(la_param)
       CALL cl_cmdrun_wait(ls_js)
    ELSE 
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = 'aap-00054'
       LET g_errparam.extend = l_ooac004
       LET g_errparam.popup = TRUE
       CALL cl_err()
       RETURN
    END IF 
    
END FUNCTION
################################################################################
# Descriptions...: 檢核交易銀行+帳戶是否存在交易銀行檔
# Memo...........:
# Usage..........: CALL s_aapt420_pmaf003_chk2(p_pmaf001,p_pmaf002,p_pmaf003)
#                  RETURNING r_success,r_errno
# Input parameter: p_pmaf001      交易對象
#                : p_pmaf002      銀行代碼
#                  p_pmaf003      銀行帳戶
# Date & Author..: 16/04/29 By apo(#160429-00010#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_pmaf003_chk2(p_pmaf001,p_pmaf002,p_pmaf003)
DEFINE p_pmaf001    LIKE pmaf_t.pmaf001
DEFINE p_pmaf002    LIKE pmaf_t.pmaf002
DEFINE p_pmaf003    LIKE pmaf_t.pmaf003
DEFINE r_success    LIKE type_t.num10     #成功否
DEFINE r_errno      LIKE gzze_t.gzze001
DEFINE l_pmaf002    LIKE pmaf_t.pmaf002
DEFINE l_pmafstus   LIKE pmaf_t.pmafstus
DEFINE l_sql        STRING                #170123-00045#5 add

   WHENEVER ERROR CONTINUE

   LET r_errno = ''
   LET r_success = TRUE

   IF NOT cl_null(p_pmaf001) THEN   #160509-00004#89
      SELECT pmaf002,pmafstus INTO l_pmaf002,l_pmafstus
        FROM pmaf_t
       WHERE pmafent = g_enterprise
         AND pmaf001 = p_pmaf001
         AND pmaf003 = p_pmaf003
   #160509-00004#89--s
   ELSE 
      #170123-00045#5 --s mark
      #SELECT pmaf002,pmafstus INTO l_pmaf002,l_pmafstus
      #  FROM pmaf_t
      # WHERE pmafent = g_enterprise
      #   AND pmaf002 = p_pmaf002
      #   AND pmaf003 = p_pmaf003   
      #   AND ROWNUM = 1
      #170123-00045#5 --e mark    
      #170123-00045#5 --s add
      LET l_pmaf002 = ''
      LET l_pmafstus = ''
      LET l_sql = " SELECT pmaf002,pmafstus FROM pmaf_t ",
                  "  WHERE pmafent = ",g_enterprise," AND pmaf002 = '",p_pmaf002,"' AND pmaf003 = '",p_pmaf003,"'  "
      PREPARE s_aapt420_pmaf1p FROM l_sql
      DECLARE s_aapt420_pmaf1c SCROLL CURSOR FOR s_aapt420_pmaf1p
      OPEN s_aapt420_pmaf1c
      FETCH FIRST s_aapt420_pmaf1c INTO l_pmaf002,l_pmafstus
      CLOSE s_aapt420_pmaf1c        
      #170123-00045#5 --e add              
   END IF
   #160509-00004#89--e

   CASE
      WHEN SQLCA.SQLCODE = 100
         LET r_errno = 'aap-00232'
         LET r_success = FALSE
      WHEN l_pmafstus = 'N'
         LET r_errno = 'sub-01302' 
         LET r_success = FALSE
      WHEN l_pmaf002 <> p_pmaf002 AND NOT cl_null(p_pmaf002)    
         LET r_errno = 'aap-00234'
         LET r_success = FALSE         
   END CASE

   RETURN r_success,r_errno
END FUNCTION

################################################################################
# Descriptions...: 取得該張立帳單號扣除留置金額後可沖金額(原幣)
# Memo...........:
# Usage..........: CALL s_aapt420_get_lien_money(p_apccld,p_apccdocno,p_apcedocno,p_apceseq,p_str)
#                  RETURNING r_amt
# Input parameter: p_apccld       帳套
#                : p_apccdocno    立帳單號
#                : p_apcedocno    目前所在核銷單號
#                : p_apceseq      目前所在核銷單項次
#                : p_str          保留參數
# Return code....: r_amt1         留置金額
#                : r_amt2         扣除留置後可沖金額
# Date & Author..: 160718 By 03538(#160704-00022#1)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_get_lien_money(p_apccld,p_apccdocno,p_apcedocno,p_apceseq,p_str)
DEFINE p_apccld    LIKE apcc_t.apccld
DEFINE p_apccdocno LIKE apcc_t.apccdocno
DEFINE p_apcedocno LIKE apce_t.apcedocno
DEFINE p_apceseq   LIKE apce_t.apceseq
DEFINE p_str       STRING
DEFINE r_amt1      LIKE apcc_t.apcc108
DEFINE r_amt2      LIKE apcc_t.apcc108
DEFINE l_apca044   LIKE apca_t.apca044
DEFINE l_apcc108   LIKE apcc_t.apcc108
DEFINE l_nouse     LIKE apcc_t.apcc108

   WHENEVER ERROR CONTINUE
   LET r_amt1 = 0
   LET r_amt2 = 0
   
   SELECT apca044 INTO l_apca044
     FROM apca_t
    WHERE apcaent = g_enterprise
      AND apcald = p_apccld
      AND apcadocno = p_apccdocno
   IF cl_null(l_apca044) THEN LET l_apca044 = 0 END IF

   LET r_amt1 = l_apca044
   #以整張單號角度取得可沖金額(但不含現在所在核銷單號+項次的金額)
   CALL s_aapt420_apcc_used_num('40',p_apccld,p_apccld,p_apccdocno,'','',p_apcedocno,p_apceseq,'2')   
    RETURNING g_sub_success,g_errno,l_apcc108,l_nouse,l_nouse,l_nouse
   LET r_amt2 = l_apcc108 - l_apca044
   IF r_amt2 < 0 THEN LET r_amt2 = 0 END IF     

   RETURN r_amt1,r_amt2
END FUNCTION
################################################################################
# Descriptions...: 將nmbc_t寫入glbc_t
# Memo...........:
# Usage..........: s_aapt420_ins_glbc(ls_js)
#                
# Input parameter: ls_js          glbc寫入所需資訊
# 
# Date & Author..: 16/07/24 By 03538(#160517-00001#5)
# Modify.........:
################################################################################
PUBLIC FUNCTION s_aapt420_ins_glbc(ls_js)
DEFINE ls_js         STRING
DEFINE lc_param      RECORD  
       nmbccomp      LIKE nmbc_t.nmbccomp, 
       nmbcdocno     LIKE nmbc_t.nmbcdocno,
       nmbcseq       LIKE nmbc_t.nmbcseq,  
       nmbc005       LIKE nmbc_t.nmbc005,  
       nmbc006       LIKE nmbc_t.nmbc006,  
       nmbc003       LIKE nmbc_t.nmbc003,  
       nmbc100       LIKE nmbc_t.nmbc100,  
       nmbc101       LIKE nmbc_t.nmbc101,  
       nmbc103       LIKE nmbc_t.nmbc103,  
       nmbc113       LIKE nmbc_t.nmbc113,  
       nmbc121       LIKE nmbc_t.nmbc121,  
       nmbc123       LIKE nmbc_t.nmbc123,  
       nmbc131       LIKE nmbc_t.nmbc131,  
       nmbc133       LIKE nmbc_t.nmbc133,    
       nmbcstus      LIKE nmbc_t.nmbcstus,     
       glbcld        LIKE glbc_t.glbcld,  
       glbcseq1      LIKE glbc_t.glbcseq1, 
       glbc004       LIKE glbc_t.glbc004,  
       glbc010       LIKE glbc_t.glbc010  
END RECORD
DEFINE l_glbc        RECORD  
       glbcent       LIKE glbc_t.glbcent,    #企業編號
       glbcld        LIKE glbc_t.glbcld,     #帳套
       glbccomp      LIKE glbc_t.glbccomp,   #營運據點
       glbcdocno     LIKE glbc_t.glbcdocno,  #傳票編號
       glbcseq       LIKE glbc_t.glbcseq,    #項次
       glbcseq1      LIKE glbc_t.glbcseq1,   #序號
       glbc001       LIKE glbc_t.glbc001,    #年度
       glbc002       LIKE glbc_t.glbc002,    #期別
       glbc003       LIKE glbc_t.glbc003,    #借貸別
       glbc004       LIKE glbc_t.glbc004,    #現金變動碼
       glbc005       LIKE glbc_t.glbc005,    #關係人
       glbc006       LIKE glbc_t.glbc006,    #交易幣別
       glbc007       LIKE glbc_t.glbc007,    #匯率
       glbc008       LIKE glbc_t.glbc008,    #原幣金額
       glbc009       LIKE glbc_t.glbc009,    #本幣金額
       glbc010       LIKE glbc_t.glbc010,    #資料來源
       glbc011       LIKE glbc_t.glbc011,    #匯率(本位幣二)
       glbc012       LIKE glbc_t.glbc012,    #金額(本位幣二)
       glbc013       LIKE glbc_t.glbc013,    #匯率(本位幣三)
       glbc014       LIKE glbc_t.glbc014,    #金額(本位幣三)
       glbc015       LIKE glbc_t.glbc015     #狀態碼
END RECORD
DEFINE r_success     LIKE type_t.num10     
   
   WHENEVER ERROR CONTINUE
   LET r_success = TRUE
   
   CALL util.JSON.parse(ls_js,lc_param)   
   LET l_glbc.glbcent = g_enterprise
   LET l_glbc.glbcld  = lc_param.glbcld
   LET l_glbc.glbccomp  = lc_param.nmbccomp
   LET l_glbc.glbcdocno = lc_param.nmbcdocno
   LET l_glbc.glbcseq   = lc_param.nmbcseq
   LET l_glbc.glbcseq1  = lc_param.glbcseq1 
   LET l_glbc.glbc001   = YEAR(lc_param.nmbc005)
   LET l_glbc.glbc002   = MONTH(lc_param.nmbc005)
   LET l_glbc.glbc003   = lc_param.nmbc006
   LET l_glbc.glbc004   = lc_param.glbc004   
   LET l_glbc.glbc005   = lc_param.nmbc003
   LET l_glbc.glbc006   = lc_param.nmbc100
   LET l_glbc.glbc007   = lc_param.nmbc101
   LET l_glbc.glbc008   = lc_param.nmbc103
   LET l_glbc.glbc009   = lc_param.nmbc113
   LET l_glbc.glbc010   = lc_param.glbc010 
   LET l_glbc.glbc011   = lc_param.nmbc121
   LET l_glbc.glbc012   = lc_param.nmbc123
   LET l_glbc.glbc013   = lc_param.nmbc131
   LET l_glbc.glbc014   = lc_param.nmbc133  
   LET l_glbc.glbc015   = lc_param.nmbcstus      
   
   INSERT INTO glbc_t
              (glbcent,
               glbcld,glbccomp,glbcdocno,glbcseq,glbcseq1,
               glbc001,glbc002,glbc003,glbc004,glbc005,
               glbc006,glbc007,glbc008,glbc009,glbc010,
               glbc011,glbc012,glbc013,glbc014,glbc015)                

        VALUES(l_glbc.glbcent,
               l_glbc.glbcld,l_glbc.glbccomp,l_glbc.glbcdocno,l_glbc.glbcseq,l_glbc.glbcseq1,
               l_glbc.glbc001,l_glbc.glbc002,l_glbc.glbc003,l_glbc.glbc004,l_glbc.glbc005,
               l_glbc.glbc006,l_glbc.glbc007,l_glbc.glbc008,l_glbc.glbc009,l_glbc.glbc010,
               l_glbc.glbc011,l_glbc.glbc012,l_glbc.glbc013,l_glbc.glbc014,l_glbc.glbc015)         
               
   IF SQLCA.SQLcode OR SQLCA.SQLERRD[3]=0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins glbc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE   
   END IF   
   RETURN r_success
END FUNCTION
################################################################################
# Descriptions...: 自動確認交易前處理
# Memo...........: BPM整合用，在自動確認的transaction之前調用
#                  用途例如可在確認段前調用建立temp table的函式
# Usage..........: CALL s_aapt420_ws_preprocess()
# Date & Author..: 2017/05/22 By Jessica
# Modify.........: 170522-00006#6
################################################################################
PUBLIC FUNCTION s_aapt420_ws_preprocess()
   CALL s_aap_create_multi_bill_perod_tmp()  #新增多帳期FUNCTION用的暫存檔
   CALL s_fin_create_account_center_tmp()    #展組織下階成員所需之暫存檔

   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_success = 'N' #若有異常會影響確認段結果，故返回N
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "s_aapt420_ws_preprocess()"
      LET g_errparam.popup = FALSE
      CALL cl_err()      
   END IF 
END FUNCTION

 
{</section>}
 
