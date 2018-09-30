# Prog. Version..: '5.25.03-11.07.21(00001)'     #
#
# Pattern name...: anmp013.4gl
# Descriptions...: 網銀整批支付作業
# Date & Author..: No.FUN-B30213 11/04/01 By lixia
# Modify.........: By Exia  只留下直接支付和更新状态功能
# Modify.........: ERP-20170511  17/05/11 by Wangyue  对于新建程式cnmp120自动更新支付状态时，不需要弹出是否确认的弹框
# Modify.........: #No:180808    18/08/08 by pulf  请求应答报文对应
# Modify.........: #No:180921    18/09/21 By lixwz  在更新状态时,若无资料返回,可以选择重新提交支付.
#                                                   由于多笔不能判断那笔是没有资料返回的,限制单选时才能提交支付.

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

DEFINE g_sql        STRING
DEFINE g_nme27      LIKE nme_file.nme27 #流水号
DEFINE g_nma01      LIKE nma_file.nma01 #银行编号
DEFINE g_nma47      LIKE nma_file.nma47 #网银编号
DEFINE g_noa05      LIKE noa_file.noa05 #交易類型
DEFINE g_noa02      LIKE noa_file.noa02 #版本编号
DEFINE l_n          LIKE type_file.num5
DEFINE g_msg        STRING
DEFINE g_argv1      LIKE type_file.chr1
#DEFINE g_nme_tt     RECORD LIKE nme_t_file.*
DEFINE g_nme_tt      RECORD
									    CHK      LIKE nme_t_file.chk,
										  NME25    LIKE nme_t_file.NME25,
										  NME13    LIKE nme_t_file.NME13,
										  NMEUD09  LIKE nme_t_file.NMEUD09,
										  NME12    LIKE nme_t_file.NME12,
										  NME01    LIKE nme_t_file.NME01,
										  NMA02    LIKE nme_t_file.NMA02,
										  NMA04    LIKE nme_t_file.NMA04,
										  NMEUD01  LIKE nme_t_file.NMEUD01,
										  NMEUD02  LIKE nme_t_file.NMEUD02,
										  NMEUD03  LIKE nme_t_file.NMEUD03,
										  NMEUD04  LIKE nme_t_file.NMEUD04,
										  NMEUD05  LIKE nme_t_file.NMEUD05,
										  NMEUD06  LIKE nme_t_file.NMEUD06,
										  NMEUD07  LIKE nme_t_file.NMEUD07,
										  NMEUD08  LIKE nme_t_file.NMEUD08,
										  NME05    LIKE nme_t_file.NME05,
										  NME02    LIKE nme_t_file.NME02,
										  NME04    LIKE nme_t_file.NME04,
										  NME08    LIKE nme_t_file.NME08,
										  NME24    LIKE nme_t_file.NME24,
										  TC_STF03 LIKE nme_t_file.TC_STF03,
										  NME22    LIKE nme_t_file.NME22,
										  NME27    LIKE nme_t_file.NME27,
										  NOA05    LIKE nme_t_file.NOA05,
										  NOA02    LIKE nme_t_file.NOA02,
										  NME19    LIKE nme_t_file.NME19,
										  TC_STD03 LIKE nme_t_file.TC_STD03,
										  NOA05C   LIKE nme_t_file.NOA05C,
										  NOA02C   LIKE nme_t_file.NOA02C
										  END RECORD
DEFINE g_xh         LIKE type_file.num5

#保存文件
DEFINE l_file         STRING
DEFINE l_channel      base.Channel

#当前时间-具体到微秒
DEFINE day_now  DATETIME YEAR TO DAY
DEFINE time_now DATETIME HOUR TO FRACTION(5)

DEFINE packgeid    LIKE type_file.chr50
DEFINE packgeid_new    LIKE type_file.chr50
DEFINE sendtime    STRING

MAIN
   OPTIONS
      INPUT NO WRAP
   DEFER INTERRUPT

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CNM")) THEN
      EXIT PROGRAM
   END IF

   DROP TABLE nme_tmp1

  {
   CREATE TEMP TABLE nme_tmp1(
                       chk       LIKE type_file.chr1,
                       nme25     LIKE nme_file.nme25,
                       nme13     LIKE nme_file.nme13,
                       nmeud09   LIKE nme_file.nmeud09,
                       nme12     LIKE nme_file.nme12,
                       nme01     LIKE nme_file.nme01,
                       nma02     LIKE nma_file.nma02,
                       nma04     LIKE nma_file.nma04,
                       nmeud01   LIKE nme_file.nmeud01,
                       nmeud02   LIKE nme_file.nmeud02,
                       nmeud03   LIKE nme_file.nmeud03,
                       nmeud04   LIKE nme_file.nmeud04,
                       nmeud05   LIKE nme_file.nmeud05,
                       nmeud06   LIKE nme_file.nmeud06,
                       nmeud07   LIKE nme_file.nmeud07,
                       nmeud08   LIKE nme_file.nmeud08,
                       nme05     LIKE nme_file.nme05,
                       nme02     LIKE nme_file.nme02,
                       nme04     LIKE nme_file.nme04,
                       nme08     LIKE nme_file.nme08,
                       nme24     LIKE nme_file.nme24,
                       tc_stf03  LIKE tc_stf_file.tc_stf03,
                       nme22     LIKE nme_file.nme22,
                       nme27     LIKE nme_file.nme27,
                       noa05     LIKE noa_file.noa05,
                       noa02     LIKE noa_file.noa02,
                       nme19     LIKE nme_file.nme19,
                       tc_std03  LIKE tc_std_file.tc_std03,
                       noa05c    LIKE noa_file.noa05,
                       noa02c    LIKE noa_file.noa02a)
   }
   CREATE TEMP TABLE nme_tmp1(
                       chk       varchar(1),
                       nme25     varchar(15),
                       nme13     varchar(40),
                       nmeud09   varchar(500),
                       nme12     varchar(20),
                       nme01     varchar(11),
                       nma02     varchar(40),
                       nma04     varchar(30),
                       nmeud01   varchar(255),
                       nmeud02   varchar(500),
                       nmeud03   varchar(40),
                       nmeud04   varchar(1000),
                       nmeud05   varchar(40),
                       nmeud06   varchar(40),
                       nmeud07   varchar(50),
                       nmeud08   varchar(50),
                       nme05     varchar(80),
                       nme02     date,
                       nme04     DEC(20,6),
                       nme08     DEC(20,6),
                       nme24     varchar(5),
                       tc_stf03  varchar(500),
                       nme22     varchar(2),
                       nme27     varchar(30),
                       noa05     varchar(10),
                       noa02     varchar(10),
                       nme19     varchar(1),
                       tc_std03  varchar(255),
                       noa05c    varchar(10),
                       noa02c    varchar(10))
   LET g_sql="INSERT INTO nme_tmp1 VALUES(?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?)"
   PREPARE ins_nme_tmp1_pre FROM g_sql

   IF g_aza.aza73 = 'N' THEN
      CALL cl_err('','anm-980',1)
      EXIT PROGRAM
   END IF

   LET g_argv1=ARG_VAL(1)
   LET g_nma47=ARG_VAL(2)

   CALL cl_used(g_prog,g_time,1) RETURNING g_time
   OPEN WINDOW p011_w WITH FORM "cnm/42f/cnmp012_t"
         ATTRIBUTE (STYLE = g_win_style CLIPPED)

   CALL cl_ui_init()
   #No:180921 add
   UPDATE nme_need_batch
      SET need = 'N'
   #No:180921 add


   IF g_argv1 IS NOT NULL THEN
      IF g_argv1='p' THEN
         CALL p011_batch()
      END IF

      IF g_argv1='q' OR g_argv1='m'  THEN   #ERP-20170523
         CALL p011_upd_pay_status()
      END IF
   END IF

   CLOSE WINDOW p011_w

   CALL cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

#整批支付时使用
#拆解拆解
FUNCTION p011_s(param_str,p_id)
DEFINE param_str  STRING              #分析字符串
DEFINE p_nma01    LIKE nma_file.nma01 #银行编号
DEFINE p_cmd      LIKE type_file.chr1
DEFINE l_noa      RECORD LIKE noa_file.*
DEFINE l_cmd      LIKE type_file.chr1000
DEFINE p_id       LIKE type_file.chr50  #包ID

   INITIALIZE l_noa.* TO NULL

   #取得选择的银行编号
   SELECT DISTINCT nme01 INTO p_nma01 FROM nme_tmp1

   #抓取传输规格资料(anmi012)
   SELECT noa_file.* INTO l_noa.* FROM noa_file,nma_file
    WHERE noa01 = nma47     #网银编号
      AND nma01 = p_nma01   #银行编号
      AND nmaacti  = 'Y'    #有效资料
      AND noa04 = '2'       #网银传输规则
      AND noa05 = g_noa05   #交易类型
      AND noa02 = g_noa02   #版本号
      AND noa14='2'         #应答类型
   IF cl_null(l_noa.noa01) THEN
      CALL s_errmsg('nma01',p_nma01,'2','anm1024',1)
      LET g_success = 'N'
      RETURN
   END IF

   CALL p011_fromXml(p_id,l_file,l_noa.*)

END FUNCTION

#拆分XML
FUNCTION p011_fromXml(p_id,p_file,p_noa)
DEFINE p_file      STRING
DEFINE p_noa       RECORD LIKE noa_file.*
DEFINE r           om.XmlReader
DEFINE e           STRING
DEFINE a           om.SaxAttributes
DEFINE i,j,k,i_bak LIKE type_file.num5
DEFINE l_value1    STRING
DEFINE l_value2    STRING
DEFINE p_id        LIKE type_file.chr50  #包ID

DEFINE value_str   RECORD
              value_str_head STRING,
              value_str STRING
                   END RECORD

DEFINE field_str   RECORD
              field_str_head STRING,
              field_str STRING
                   END RECORD

DEFINE value_array DYNAMIC ARRAY OF RECORD
              nod     LIKE type_file.chr20,
              val     LIKE type_file.chr50
                 END RECORD

DEFINE l_nob       DYNAMIC ARRAY OF RECORD
              nob06     LIKE nob_file.nob06,
              nob08     LIKE nob_file.nob08,
              nob11     LIKE nob_file.nob11,
              nob21     LIKE nob_file.nob21,
              nob22     LIKE nob_file.nob22
                  END RECORD
DEFINE l_flag      LIKE type_file.chr1
DEFINE l_tag       LIKE type_file.chr1
DEFINE l_count     SMALLINT
DEFINE l_tc_xml    RECORD LIKE tc_xml_file.*,
       l_n         LIKE type_file.num5
DEFINE l_RetCode   LIKE type_file.chr50  #错误代码
DEFINE g_msg1      LIKE type_file.chr1000 #错误信息
DEFINE l_nme01     LIKE nme_file.nme01,
       l_nme27     LIKE nme_file.nme27

   CALL l_nob.clear()
   CALL value_array.clear()


   #讀取xml信息
   LET r = om.XmlReader.createFileReader(p_file)
   LET a = r.getAttributes()
   LET i = 0
   LET e = r.read()

   WHILE e IS NOT NULL
      CASE e
         WHEN "StartElement"
            LET i = i + 1
            LET value_array[i].nod = r.getTagName()

         WHEN "Characters"
            LET value_array[i].val = r.getCharacters()

         WHEN "EndElement"

            IF i>=1 AND i<>i_bak THEN
               #1.重复字段的行序(已存在的字段，项次在原来基础上加1)
               SELECT COUNT(*) INTO l_n FROM tc_xml_file
                WHERE tc_xml01=p_id #包ID
                  AND tc_xml03=value_array[i].nod
               IF l_n >0 THEN
                  LET l_tc_xml.tc_xml06=l_n+1
               ELSE
               	 LET l_tc_xml.tc_xml06=1
               END IF

               #2.erp字段
               LET l_tc_xml.tc_xml07=""
               SELECT nob11 INTO l_tc_xml.tc_xml07 FROM nob_file
                WHERE nob01 = p_noa.noa01
                  AND nob02 = p_noa.noa02
                  AND nob03 = p_noa.noa05
                  AND nob04 = '2'
                  AND nob24 = p_noa.noa14
                  AND nob21 <> 'Y'
                  AND nob06 = value_array[i].nod

               #3.保存报文资料
               INSERT INTO tc_xml_file VALUES(p_id,i,value_array[i].nod,value_array[i].val,'N',l_tc_xml.tc_xml06,l_tc_xml.tc_xml07)
               IF STATUS THEN
                  CALL cl_err('insert tc_xml_file',STATUS,1)
               END IF

               #4.备份i,防止重复插入数据
               LET i_bak=i

            END IF
      END CASE

      LET e = r.read()

   END WHILE
   IF i = 0 THEN
      CALL s_errmsg('','','','azz1063',1)
      LET g_success = 'N'
      RETURN
   END IF

   #4.更新临时表的是否单身字段
   LET g_sql="UPDATE tc_xml_file SET tc_xml05='Y' ",
             " WHERE tc_xml03 IN (SELECT DISTINCT tc_xml03",
             "                      FROM tc_xml_file, nob_file A, nob_file B",
             "                     WHERE tc_xml03 = A.nob06",
             "                       AND A.nob04 = '2'",
             "                       AND B.nob04 = '1'",
             "                       AND A.nob01 = B.nob01",
             "                       AND A.nob02 = B.nob02",
             "                       AND A.nob03 = B.nob03",
             "                       AND A.nob24 = B.nob24",
             "                       AND A.nob13 = B.nob13",
             "                       AND A.nob01 = '",p_noa.noa01,"'",
             "                       AND A.nob02 = '",p_noa.noa02,"'",
             "                       AND A.nob03 = '",p_noa.noa05,"'",
             "                       AND A.nob24='2'",
             "                       AND B.ta_nob01='Y'",
             "                       AND tc_xml01='",p_id,"')",
             "   AND tc_xml01='",p_id,"'"
   PREPARE upd_xml04_pre FROM g_sql
   EXECUTE upd_xml04_pre
   IF STATUS THEN
      CALL cl_err('insert xml_tmp',STATUS,1)
   END IF

   #1.先组合出单头值
   LET g_sql="SELECT tc_xml04,tc_xml07 FROM tc_xml_file ",
             " WHERE tc_xml01='",p_id,"'",
             "   AND tc_xml05='N' ",
             "   AND tc_xml07 IS NOT NULL",
             " ORDER BY tc_xml01,tc_xml02"
   DECLARE sel_head_cur CURSOR FROM g_sql

   FOREACH sel_head_cur INTO l_tc_xml.tc_xml04,l_tc_xml.tc_xml07

      IF cl_null(field_str.field_str_head) THEN
         LET field_str.field_str_head=l_tc_xml.tc_xml07
      ELSE
         LET field_str.field_str_head=field_str.field_str_head,",",l_tc_xml.tc_xml07
      END IF

      IF cl_null(value_str.value_str_head) THEN
         LET value_str.value_str_head="'",l_tc_xml.tc_xml04 CLIPPED,"'"
      ELSE
         LET value_str.value_str_head=value_str.value_str_head,",'",l_tc_xml.tc_xml04 CLIPPED,"'"
      END IF

   END FOREACH

   #2.取得单身最大项次编号
   SELECT MAX(tc_xml06) INTO l_n FROM tc_xml_file WHERE tc_xml01=p_id AND tc_xml05='Y'

   LET g_sql="SELECT tc_xml04,tc_xml07 FROM tc_xml_file ",
             "  WHERE tc_xml01='",p_id,"'",
             "    AND tc_xml05='Y'",
             "    AND tc_xml06=? ",
             "    AND tc_xml07 IS NOT NULL ",
             " ORDER BY tc_xml01,tc_xml02"
   DECLARE sel_body_cur CURSOR FROM g_sql

   #3.把每个项次对应的字段和值分别组合到字符串，插入到数据库nmu_file
   FOR i=1 TO l_n

      #初始化
      LET l_tc_xml.tc_xml04=''
      LET l_tc_xml.tc_xml07=''

      LET field_str.field_str=field_str.field_str_head
      LET value_str.value_str=value_str.value_str_head

      FOREACH sel_body_cur USING i INTO l_tc_xml.tc_xml04,l_tc_xml.tc_xml07

         IF cl_null(field_str.field_str) THEN
            LET field_str.field_str=l_tc_xml.tc_xml07
         ELSE
            LET field_str.field_str=field_str.field_str,",",l_tc_xml.tc_xml07
         END IF

         IF cl_null(value_str.value_str) THEN
            LET value_str.value_str="'",l_tc_xml.tc_xml04 CLIPPED,"'"
         ELSE
            LET value_str.value_str=value_str.value_str,",'",l_tc_xml.tc_xml04 CLIPPED,"'"
         END IF

      END FOREACH

      #把資料插入臨時表
      CALL p011_insnpstemp(field_str.field_str,value_str.value_str)

   END FOR

   #如果没有单身数据,报错
   IF cl_null(l_n) THEN

      #错误代码
      SELECT tc_xml04 INTO l_RetCode
        FROM tc_xml_file
       WHERE tc_xml01=p_id  #包ID
         AND tc_xml03='RetCode'  #错误代码
      IF l_RetCode <>'0' THEN

         #错误信息
         SELECT tc_xml04 INTO g_msg1
           FROM tc_xml_file
          WHERE tc_xml01=p_id  #包ID
            AND tc_xml03='RetMsg'  #报错信息
         #CALL cl_err(g_msg1,'!',1) #No:180921 mark by lixwz 180921

         # 提示是否重新提交
         # #No:180921 add by lixwz 180920 s---
         IF g_argv1 = 'q' AND g_user = 'tiptop'THEN
         # 判断为cnmp100更新状态操作
            IF cl_confirm('cnm-005') THEN
                UPDATE nme_need_batch
                   SET need = 'Y'
                #LET g_qryparam.arg1 = 'need_batch'
            END IF
         END IF
         CALL cl_err(g_msg1,'!',1)
         # #No:180921 add by lixwz 180920 e---
         LET g_success='N'

      END IF

   END IF

END FUNCTION

#拆分多域串
FUNCTION p011_fromcomplex(p_noa,p_value)
DEFINE p_noa       RECORD LIKE noa_file.*
DEFINE p_value     STRING
DEFINE value_str   STRING
DEFINE field_str   STRING
DEFINE i,j         LIKE type_file.num5
DEFINE l_nob06     LIKE nob_file.nob06
DEFINE l_nob11     LIKE nob_file.nob11
DEFINE l_nob22     LIKE nob_file.nob22
DEFINE l_tok_field base.StringTokenizer
DEFINE l_cnt_field LIKE type_file.num5
DEFINE data_array  DYNAMIC ARRAY OF STRING

   LET l_nob06 = ""
   LET l_nob11 = ""
   LET l_nob22 = ""
   LET value_str = ""
   LET field_str = ""
   CALL data_array.clear()

   LET g_sql ="SELECT nob06,nob11,nob22 FROM nob_file ",
              " WHERE nob01 = '",p_noa.noa01,"'",
              "   AND nob02 = '",p_noa.noa02,"'",
              "   AND nob03 = '",p_noa.noa05,"'",
              "   AND nob24 = '",p_noa.noa14,"'",
              "   AND nob04 = '2'",
              "   AND nob21 = 'Y' ",
              " ORDER BY nob05"
   PREPARE nob_pre_c  FROM g_sql
   DECLARE nob_curs_c CURSOR FOR nob_pre_c
   LET i = 1
   FOREACH nob_curs_c INTO l_nob06,l_nob11,l_nob22
      IF i = 1 THEN
         LET p_value = p_value.trim()
         IF p_value.subString(p_value.getLength(),p_value.getLength()) = l_nob22 THEN
            LET p_value = p_value.subString(1,p_value.getLength()-1)
         END IF
         LET l_tok_field = base.StringTokenizer.createExt(p_value,l_nob22,'',TRUE)
         LET l_cnt_field = l_tok_field.countTokens()
         IF l_cnt_field >0 THEN
             LET j=0
             WHILE l_tok_field.hasMoreTokens()
                LET j = j + 1
                LET data_array[j] = l_tok_field.nextToken()
             END WHILE
         END IF
      END IF
      IF NOT cl_null(l_nob11) AND l_nob11 MATCHES "nmu*" THEN
         LET field_str = field_str,",",l_nob11
         LET value_str = value_str,",'",data_array[i + j/2],"'"
      END IF
      LET i = i + 1
   END FOREACH
   LET field_str = field_str.subString(2,field_str.getLength())
   LET value_str = value_str.subString(2,value_str.getLength())
   RETURN field_str,value_str

END FUNCTION

#資料插入到nps_file
FUNCTION p011_insnpstemp(p_field_str,p_value_str)
DEFINE p_value_str  STRING
DEFINE p_field_str  STRING

   LET g_sql ="INSERT INTO npstemp(",p_field_str,") VALUES(",p_value_str,")"
   PREPARE ins_npstemp_pre FROM g_sql
   EXECUTE ins_npstemp_pre
   IF SQLCA.sqlcode THEN
      CALL s_errmsg('insert into npstemptable','','',SQLCA.sqlcode,1)
      LET g_success = 'N'
      RETURN
   END IF
END FUNCTION

#整批支付
FUNCTION p011_batch()
DEFINE l_nma47       LIKE nma_file.nma47 #接口銀行編碼
DEFINE l_nma01       LIKE nma_file.nma01
DEFINE l_noa06       LIKE noa_file.noa06
DEFINE l_noa07       LIKE noa_file.noa07
DEFINE l_nme01       LIKE nme_file.nme01
DEFINE l_nme27       LIKE nme_file.nme27
DEFINE l_str12       STRING              #完整的報文XML
DEFINE l_str13       STRING              #報文內容XML
DEFINE l_i           LIKE type_file.num10
DEFINE l_success     LIKE type_file.chr1
DEFINE l_str_today   LIKE type_file.chr8
DEFINE l_sql         STRING
DEFINE l_tc_nps04    LIKE tc_nps_file.tc_nps04 #指令状态
DEFINE l_str12_temp  STRING,
       l_apa06       LIKE apa_file.apa06,
       l_nme13       LIKE nme_file.nme13,
       l_apa06_name  LIKE type_file.chr1000,
       l_nmeud03     LIKE nme_file.nmeud03,
       l_nmeud04     LIKE nme_file.nmeud04,
       l_nme08       LIKE nme_file.nme08,
       l_nme05       LIKE nme_file.nme05,
       l_tc_nps05    LIKE tc_nps_file.tc_nps05,
       l_tc_nps06    LIKE tc_nps_file.tc_nps06,
       g_msg         STRING

#银行接口信息
DEFINE server_ip   LIKE type_file.chr50
DEFINE server_port INTEGER
DEFINE sign_port   INTEGER
DEFINE sign_flag   INTEGER
DEFINE userid      LIKE type_file.chr50
DEFINE send_data   STRING
DEFINE recv_len    INTEGER
DEFINE recv_data   STRING
DEFINE cis         STRING
DEFINE id          STRING
DEFINE transcode   LIKE type_file.chr50
DEFINE bankcode    LIKE type_file.chr50
DEFINE TotalNum    LIKE type_file.num5
DEFINE TotalAmt    LIKE type_file.num10
DEFINE l_msg       LIKE type_file.chr1000
DEFINE l_xml   STRING
DEFINE l_noa05    LIKE noa_file.noa05
DEFINE l_noa02    LIKE noa_file.noa02
DEFINE l_noa05c   LIKE noa_file.noa05
DEFINE l_noa02c   LIKE noa_file.noa02
DEFINE l_length    LIKE type_file.num5    #No:180808 add
DEFINE l_flag_1    LIKE type_file.chr50   #No:180808 add
DEFINE l_flag_2    LIKE type_file.chr50   #No:180808 add

   LET l_i = 0
   LET l_nma47 = ''
   LET l_nma01 = ''


   #删除npstemp临时表
   DROP TABLE npstemp

   #创建npstemp临时表
   SELECT * FROM tc_nps_file INTO TEMP npstemp

   #删除npstemp临时表数据
   DELETE FROM npstemp

   #删除临时表数据
   DELETE FROM nme_tmp1 WHERE 1=1

   LET l_sql="SELECT nme_t_file.* FROM nme_t_file,nma_file WHERE chk='Y' AND nme01=nma01 AND nma47='",g_nma47,"' "
             ," ORDER BY nme12 "       #add by liyjf180917
   PREPARE p012_nme_t_pre FROM l_sql
   DECLARE p012_nme_t_cs CURSOR FOR p012_nme_t_pre
   FOREACH p012_nme_t_cs INTO g_nme_tt.*
      EXECUTE ins_nme_tmp1_pre USING g_nme_tt.*
   END FOREACH

   #没有数据不继续
   SELECT COUNT(*) INTO l_n
     FROM nme_tmp1
   IF l_n =0 THEN
      CALL cl_err('没有符合支付条件的资料，不执行支付动作','!',1)
      RETURN
   END IF

   #确认支付
   IF NOT cl_sure(18,20) THEN RETURN END IF
   CALL s_showmsg_init()

   #银行编号和网银编号
   LET g_sql = " SELECT DISTINCT nma01,nma47 FROM nma_file,nme_tmp1 ",
               "  WHERE nme01 = nma01 "
   PREPARE p011_pre_n12 FROM g_sql
   EXECUTE p011_pre_n12 INTO g_nma01,g_nma47
   IF cl_null(g_nma47) THEN
      CALL cl_err(g_nma01,'anm1019',1)
      RETURN
   END IF

   LET g_success = 'Y'


   #初始交易类型和版本

   LET l_sql="SELECT DISTINCT noa05,noa02,noa05c,noa02c FROM nme_tmp1 ORDER BY noa05,noa02"
   PREPARE p011_nme_tmp_pre FROM l_sql
   DECLARE p011_nme_tmp_cs CURSOR FOR p011_nme_tmp_pre

   FOREACH p011_nme_tmp_cs INTO g_noa05,g_noa02,l_noa05c,l_noa02c

      #包序号=日期+7位流水号
      LET l_str_today=g_today USING 'YYYYMMDD'
      LET l_sql="SELECT MAX(tc_xml01) FROM tc_xml_file WHERE tc_xml01 LIKE '",l_str_today,"%'"
      PREPARE packgeid_pre12 FROM l_sql
      EXECUTE packgeid_pre12 INTO packgeid
      IF cl_null(packgeid) THEN
         LET packgeid=l_str_today,'0000001'
      ELSE
         LET packgeid=packgeid[1,8],packgeid[9,15]+1 USING '&&&&&&&'
      END IF

      #发送时间
      LET sendtime=g_today USING 'YYYYMMDD',g_time[1,2],g_time[4,5],g_time[7,8],"000"
      #1.报文格式(1.表示xml，2表示分隔符)
      SELECT noa06 INTO l_noa06
        FROM noa_file
       WHERE noa01=g_nma47  #网银编号
         AND noa04='2'      #数据类型：报文字段定义
         AND noa05=g_noa05  #交易类型
         AND noa02=g_noa02  #版本

      #2.组合xml报文(条件：网银编号)
      LET l_str12 = ''  #初始
      IF l_noa06 = '1' THEN
         LET l_str12 = p011_getxml('1') #组合出的报文
      END IF

      #主机地址
      SELECT nob09 INTO server_ip
        FROM nob_file
       WHERE nob01='001'
         AND nob04='3' #数据类型：通讯信息定义
         AND nob06='server_ip'
      IF cl_null(server_ip) THEN
         LET g_success='N'
         CALL s_errmsg('','','工行的server_ip不能为空，请到anmi013维护','!',1)
      END IF

      #主机端口
      SELECT nob09 INTO server_port
        FROM nob_file
       WHERE nob01='001'
         AND nob04='3' #数据类型：通讯信息定义
         AND nob06='server_port'
      IF cl_null(server_port) THEN
         LET g_success='N'
         CALL s_errmsg('','','工行的server_port不能为空，请到anmi013维护','!',1)
      END IF

      #签名端口
      SELECT nob09 INTO sign_port
        FROM nob_file
       WHERE nob01='001'
         AND nob04='3' #数据类型：通讯信息定义
         AND nob06='sign_port'
      IF cl_null(sign_port) THEN
         LET g_success='N'
         CALL s_errmsg('','','工行的sign_port不能为空，请到anmi013维护','!',1)
      END IF

      #用户ID
      SELECT nob09 INTO userid
        FROM nob_file
       WHERE nob01='001'
         AND nob04='3' #数据类型：通讯信息定义
         AND nob06='userid'
      IF cl_null(userid) THEN
         LET g_success='N'
         CALL s_errmsg('','','工行的userid不能为空，请到anmi013维护','!',1)
      END IF

      #如果报错，返回
      IF g_success='N' THEN
         RETURN
      END IF

      #签名
      LET sign_flag=1

      #CIS
      LET cis=l_str12.substring(l_str12.getIndexOf('<CIS>',1)+5,l_str12.getIndexOf('</CIS>',1)-1)

      #ID
      LET id=l_str12.substring(l_str12.getIndexOf('<ID>',1)+4,l_str12.getIndexOf('</ID>',1)-1)

      #fSeqno
      LET l_str12_temp=l_str12.substring(1,(l_str12.getIndexOf('<fSeqno>',1))+7)
      LET l_str12=l_str12_temp.append(packgeid),l_str12.substring((l_str12.getIndexOf('</fSeqno>',1)),l_str12.getLength())

      #替换总金额
      SELECT SUM(nme08)*100 INTO TotalAmt FROM nme_tmp1

      LET l_str12_temp=l_str12.substring(1,(l_str12.getIndexOf('<TotalAmt>',1))+9)
      LET l_str12=l_str12_temp.append(TotalAmt),l_str12.substring((l_str12.getIndexOf('</TotalAmt>',1)),l_str12.getLength())

      #替换总笔数
      SELECT COUNT(*) INTO TotalNum FROM nme_tmp1

      LET l_str12_temp=l_str12.substring(1,(l_str12.getIndexOf('<TotalNum>',1))+9)
      LET l_str12=l_str12_temp.append(TotalNum),l_str12.substring((l_str12.getIndexOf('</TotalNum>',1)),l_str12.getLength())

      #从报文取出transcode
      LET transcode=l_str12.substring(l_str12.getIndexOf('<TransCode>',1)+11,l_str12.getIndexOf('</TransCode>',1)-1)

      #从报文取出bankcode
      LET bankcode=l_str12.substring(l_str12.getIndexOf('<BankCode>',1)+10,l_str12.getIndexOf('</BankCode>',1)-1)

      #发送数据(报头+xml)
      LET send_data="Version=0.0.0.1&TransCode=",transcode,"&BankCode=",bankcode,
                  "&GroupCIS=",cis,"&ID=",id,"&PackageID=",packgeid,"&Cert=&reqData=",
                  "<?xml  version=\"1.0\" encoding=\"GBK\" ?>",
                  l_str12
      #替换回车符
      LET send_data= cl_replace_str(send_data,"\n","")

      DISPLAY send_data

      #请求报文保存
      LET day_now = CURRENT YEAR TO DAY
      LET time_now = CURRENT HOUR TO FRACTION(5)
      #No:180808 add begin-------
      LET l_flag_1 = ''
      LET l_flag_1 = time_now
      LET l_length= LENGTH(l_flag_1)
      LET l_flag_2 = l_flag_1[l_length-4,l_length]
      LET l_file = "/tmp/pay_p013_",day_now,"_",time_now,"_",l_flag_2,"_require.xml"
      #No:180808 add end---------
      #LET l_file = "/tmp/pay_p013_",day_now,"_",time_now,"_require.xml"   #No:180808 mark
      LET l_channel = base.Channel.create()
      CALL l_channel.openFile(l_file,"a" )
      CALL l_channel.setDelimiter("")
      CALL l_channel.write(send_data)
      CALL l_channel.close()

      #插入资料到支付记录
      #DECLARE sel_nme_tmp1 CURSOR FROM SELECT nme27 FROM nme_tmp1 WHERE noa05=g_noa05 AND noa02=g_noa02
      LET l_sql=" SELECT nme27 FROM nme_tmp1 WHERE noa05='",g_noa05,"' AND noa02='",g_noa02,"'"
      PREPARE sel_nme_tmp1_pre FROM l_sql
      DECLARE sel_nme_tmp1 CURSOR FOR sel_nme_tmp1_pre

      FOREACH sel_nme_tmp1 INTO g_nme27
         INSERT INTO tc_nps_file(tc_nps01,tc_nps02,tc_nps03)
         VALUES(packgeid,g_nme27,'1')
      END FOREACH


      #调用银行接口方法
       CALL fgl_icbc(server_ip,server_port,sign_port,userid,packgeid,sendtime,send_data,sign_flag) RETURNING recv_len,recv_data

      IF recv_len=-1 THEN
         #INSERT INTO tc_xml_file VALUES(packgeid,1,'ERROR',l_err_msg,'N',1,'')
         #INSERT INTO tc_nps_file(tc_nps01,tc_nps02,tc_nps03,tc_nps05) VALUES(packgeid,g_nme27,'1',l_err_msg)
         CALL cl_err('没有收到银行应答','!',1)
         RETURN
      END IF

      #应答报文保存
      LET day_now = CURRENT YEAR TO DAY
      LET time_now = CURRENT HOUR TO FRACTION(5)
      LET l_file = "/tmp/pay_p013_",day_now,"_",time_now,"_",l_flag_2,"_answer.xml"    #No:180808 add
      #LET l_file = "/tmp/pay_p013_",day_now,"_",time_now,"_answer.xml" #xf mod 120629 #No:180808 mark
      LET l_channel = base.Channel.create()
      CALL l_channel.openFile(l_file,"a" )
      CALL l_channel.setDelimiter("")
      CALL l_channel.write(recv_data)
      CALL l_channel.close()

      #包序号
      LET packgeid_new=packgeid[1,8],packgeid[9,15]+1 USING '&&&&&&&'

      #签名
      LET sign_flag=0

      #发送时间
      LET sendtime=g_today USING 'YYYYMMDD',g_time[1,2],g_time[4,5],g_time[7,8],"000"

      #查询指令状态
      LET send_data="Version=0.0.0.1&TransCode=QPAYENT&BankCode=102&GroupCIS=100190006197802",
                    "&ID=chenguang001.y.1001&PackageID=",packgeid_new,"&Cert=&reqData=",
                    "<?xml  version=\"1.0\" encoding=\"GBK\" ?>",
                    "<CMS>",
                    "<eb>",
                    "<pub>",
                    "<TransCode>QPAYENT</TransCode>",
                    "<CIS>100190006197802</CIS>",
                    "<BankCode>102</BankCode>",
                    "<ID>chenguang001.y.1001</ID>",
                    "<TranDate>",g_today USING 'YYYYMMDD',"</TranDate>",
                    "<TranTime>",g_time[1,2],g_time[4,5],g_time[7,8],"000000","</TranTime>",
                    "<fSeqno>",packgeid_new,"</fSeqno>",
                    "</pub>",
                    "<in><QryfSeqno>",packgeid,"</QryfSeqno>",
                    "<QrySerialNo></QrySerialNo>",
                    "<ReqReserved1></ReqReserved1>",
                    "<ReqReserved2></ReqReserved2>",
                    "</in></eb></CMS>"

      CALL fgl_icbc(server_ip,server_port,sign_port,userid,packgeid_new,sendtime,send_data,sign_flag) RETURNING recv_len,recv_data

      #应答报文保存
      LET day_now = CURRENT YEAR TO DAY
      LET time_now = CURRENT HOUR TO FRACTION(5)
      LET l_file = "/tmp/pay_p013_",day_now,"_",time_now,"_answer.xml" #xf mod 120629
      LET l_channel = base.Channel.create()
      CALL l_channel.openFile(l_file,"a" )
      CALL l_channel.setDelimiter("")
      CALL l_channel.write(recv_data)
      CALL l_channel.close()

      #解析返回的报文
      #LET g_noa05='QPAYENT' #交易类型
      #LET g_noa02='01'  #版本号

      SELECT tc_stc08 INTO g_noa05 FROM tc_stc_file WHERE tc_stc01=g_nma47 AND tc_stc06='Y' AND tc_stc05=g_noa05

      CALL p011_s(recv_data,packgeid_new)

      #记录历史记录（参数：请求包ID）
      CALL p011_insert_tc_nps(packgeid_new,'2')

      #记录到信息档，方便弹出显示
      SELECT apa06,nme13,apa06_name,nmeud03,nmeud04,nme08,nme05,nme27
        INTO l_apa06,l_nme13,l_apa06_name,l_nmeud03,l_nmeud04,l_nme08,l_nme05,l_nme27
        FROM nme_tmp1
       WHERE nme27=l_nme27

      SELECT tc_nps05,tc_nps06 INTO l_tc_nps05,l_tc_nps06
        FROM tc_nps_file
       WHERE tc_nps01=packgeid_new

   END FOREACH
END FUNCTION

#更新支付状态
FUNCTION p011_upd_pay_status()
DEFINE l_nma47       LIKE nma_file.nma47 #接口銀行編碼
DEFINE l_nma01       LIKE nma_file.nma01
DEFINE l_noa06       LIKE noa_file.noa06
DEFINE l_noa07       LIKE noa_file.noa07
DEFINE l_nme01       LIKE nme_file.nme01
DEFINE l_nme27       LIKE nme_file.nme27
DEFINE l_str12       STRING              #完整的報文XML
DEFINE l_str13       STRING              #報文內容XML
DEFINE l_i           LIKE type_file.num10
DEFINE l_success     LIKE type_file.chr1
DEFINE l_str_today   LIKE type_file.chr8
DEFINE l_sql         STRING
DEFINE l_tc_nps04    LIKE tc_nps_file.tc_nps04 #指令状态
DEFINE l_str12_temp  STRING
DEFINE l_tc_nps01    LIKE tc_nps_file.tc_nps01,
       l_tc_nps19    LIKE tc_nps_file.tc_nps19

#银行接口信息
DEFINE server_ip   LIKE type_file.chr50
DEFINE server_port INTEGER
DEFINE sign_port   INTEGER
DEFINE sign_flag   INTEGER
DEFINE userid      LIKE type_file.chr50
DEFINE send_data   STRING
DEFINE recv_len    INTEGER
DEFINE recv_data   STRING
DEFINE cis         STRING
DEFINE id          STRING
DEFINE transcode   LIKE type_file.chr50
DEFINE bankcode    LIKE type_file.chr50
DEFINE l_noa05     LIKE noa_file.noa05
DEFINE l_noa02     LIKE noa_file.noa02
DEFINE l_nmeud05   LIKE nme_file.nmeud05
DEFINE l_nmeud08   LIKE nme_file.nmeud08
DEFINE l_length    LIKE type_file.num5    #No:180808 add
DEFINE l_flag_1    LIKE type_file.chr50   #No:180808 add
DEFINE l_flag_2    LIKE type_file.chr50   #No:180808 add

   LET l_i = 0
   LET g_noa05 = ''
   LET g_noa02 = ''
   LET l_nma47 = ''
   LET l_nma01 = ''

   ###ERP-20170511
   #确认更新
  { IF NOT cl_sure(18,20) THEN RETURN END IF }
    IF g_argv1<>'m' THEN     ####如果是cnmp100中调用的，g_argv1='m'，否则为null
       IF NOT cl_sure(18,20) THEN RETURN END IF
    END IF

   CALL s_showmsg_init()

   #删除npstemp临时表
   DROP TABLE npstemp

   #创建npstemp临时表
   SELECT * FROM tc_nps_file INTO TEMP npstemp

   #删除npstemp临时表数据
   DELETE FROM npstemp

   #删除临时表数据
   DELETE FROM nme_tmp1

   LET l_sql="SELECT nme_t_file.* FROM nme_t_file,nma_file WHERE chk='Y' AND nme01=nma01 AND nma47='",g_nma47,"'"
   PREPARE p012_nme_t_pre2 FROM l_sql
   DECLARE p012_nme_t_cs2 CURSOR FOR p012_nme_t_pre2

   FOREACH p012_nme_t_cs2 INTO g_nme_tt.*
      EXECUTE ins_nme_tmp1_pre USING g_nme_tt.*
   END FOREACH

   #抓取单身勾选的明细
   LET g_sql="SELECT nme27,noa05,noa02",
             "  FROM nme_tmp1",
             " WHERE chk = 'Y'",
            # " ORDER BY nme27" #mark by liyjf180919
            " ORDER BY nme12" #add by liyjf180919
   PREPARE p011_nme_pre2 FROM g_sql
   DECLARE p011_nme_cs2 CURSOR WITH HOLD FOR p011_nme_pre2

   LET g_success = 'Y'
   #找出唯一的流水号
   FOREACH p011_nme_cs2 INTO g_nme27,g_noa05,g_noa02

      #银行编号和网银编号
      LET g_sql = " SELECT DISTINCT nma01,nma47 FROM nma_file,nme_tmp1 ",
                  "  WHERE nme01 = nma01 ",
                  "    AND nme27='",g_nme27,"'"
      PREPARE p011_pre_n2 FROM g_sql
      EXECUTE p011_pre_n2 INTO g_nma01,g_nma47
      IF cl_null(g_nma47) THEN
         CALL cl_err(g_nma01,'anm1019',1)
         RETURN
      END IF

      #包序号=日期+7位流水号
      LET l_str_today=g_today USING 'YYYYMMDD'
      LET l_sql="SELECT MAX(tc_xml01) FROM tc_xml_file WHERE tc_xml01 LIKE '",l_str_today,"%'"
      PREPARE packgeid_pre2 FROM l_sql
      EXECUTE packgeid_pre2 INTO packgeid
      IF cl_null(packgeid) THEN
         LET packgeid=l_str_today,'0000001'
      ELSE
         LET packgeid=packgeid[1,8],packgeid[9,15]+1 USING '&&&&&&&'
      END IF

      #发送时间
      LET sendtime=g_today USING 'YYYYMMDD',g_time[1,2],g_time[4,5],g_time[7,8],"000"

      SELECT noa06 INTO l_noa06
        FROM noa_file
       WHERE noa01=g_nma47  #网络银行
         AND noa04='2'      #anmi112
         AND noa05=g_noa05  #交易类型
         AND noa02=g_noa02  #版本

      #2.组合出xml
      IF l_noa06 = '1' THEN
         LET l_str12 = ''
         LET l_str12 = p011_getxml('2')
      END IF

      #主机地址
      SELECT nob09 INTO server_ip
        FROM nob_file
       WHERE nob01='001'
         AND nob04='3'
         AND nob06='server_ip'
      IF cl_null(server_ip) THEN
         LET g_success='N'
         CALL s_errmsg('','','工行的server_ip不能为空，请到anmi013维护','!',1)
      END IF

      #主机端口
      SELECT nob09 INTO server_port
        FROM nob_file
       WHERE nob01='001'
         AND nob04='3'
         AND nob06='server_port'
      IF cl_null(server_port) THEN
         LET g_success='N'
         CALL s_errmsg('','','工行的server_port不能为空，请到anmi013维护','!',1)
      END IF

      #签名端口
      SELECT nob09 INTO sign_port
        FROM nob_file
       WHERE nob01='001'
         AND nob04='3'
         AND nob06='sign_port'
      IF cl_null(sign_port) THEN
         LET g_success='N'
         CALL s_errmsg('','','工行的sign_port不能为空，请到anmi013维护','!',1)
      END IF

      #用户ID
      SELECT nob09 INTO userid
        FROM nob_file
       WHERE nob01='001'
         AND nob04='3'
         AND nob06='userid'
      IF cl_null(userid) THEN
         LET g_success='N'
         CALL s_errmsg('','','工行的userid不能为空，请到anmi013维护','!',1)
      END IF

      #如果报错，返回
      IF g_success='N' THEN
         RETURN
      END IF

      #签名
      LET sign_flag=0

      #CIS
      LET cis=l_str12.substring(l_str12.getIndexOf('<CIS>',1)+5,l_str12.getIndexOf('</CIS>',1)-1)

      #ID
      LET id=l_str12.substring(l_str12.getIndexOf('<ID>',1)+4,l_str12.getIndexOf('</ID>',1)-1)

      #包号
      LET l_str12_temp=l_str12.substring(1,(l_str12.getIndexOf('<fSeqno>',1))+7)
      LET l_str12=l_str12_temp.append(packgeid),l_str12.substring((l_str12.getIndexOf('</fSeqno>',1)),l_str12.getLength())


      #待查的包序号
      SELECT MAX(tc_nps01) INTO l_tc_nps01 FROM tc_nps_file
       WHERE tc_nps02=g_nme27 AND tc_nps03='1'

      LET l_str12_temp=l_str12.substring(1,(l_str12.getIndexOf('<QryfSeqno>',1))+10)
      LET l_str12=l_str12_temp.append(l_tc_nps01),l_str12.substring((l_str12.getIndexOf('</QryfSeqno>',1)),l_str12.getLength())


      #待查的包顺序号
      SELECT tc_nps19 INTO l_tc_nps19 FROM tc_nps_file
       WHERE tc_nps02=g_nme27 AND tc_nps03='1'
         AND tc_nps01=l_tc_nps01

      LET l_str12_temp=l_str12.substring(1,(l_str12.getIndexOf('<QryiSeqno>',1))+10)
      LET l_str12=l_str12_temp.append(l_tc_nps19),l_str12.substring((l_str12.getIndexOf('</QryiSeqno>',1)),l_str12.getLength())


      #从报文取出transcode
      LET transcode=l_str12.substring(l_str12.getIndexOf('<TransCode>',1)+11,l_str12.getIndexOf('</TransCode>',1)-1)

      #从报文取出bankcode
      LET bankcode=l_str12.substring(l_str12.getIndexOf('<BankCode>',1)+10,l_str12.getIndexOf('</BankCode>',1)-1)

      #发送数据(报头+xml)
      LET send_data="Version=0.0.0.1&TransCode=QPAYENT&BankCode=",bankcode,
                  "&GroupCIS=",cis,"&ID=",id,"&PackageID=",packgeid,"&Cert=&reqData=",
                  "<?xml  version=\"1.0\" encoding=\"GBK\" ?>",
                  l_str12

      #替换回车符
      LET send_data= cl_replace_str(send_data,"\n","")

      #请求报文保存
      LET day_now = CURRENT YEAR TO DAY
      LET time_now = CURRENT HOUR TO FRACTION(5)
      #No:180808 add begin-------
      LET l_flag_1 = ''
      LET l_flag_1 = time_now
      LET l_length= LENGTH(l_flag_1)
      LET l_flag_2 = l_flag_1[l_length-4,l_length]
      LET l_file = "/tmp/qry_p013_",day_now,"_",time_now,"_",l_flag_2,"_require.xml"
      #No:180808 add end---------
      #LET l_file = "/tmp/qry_p013_",day_now,"_",time_now,"_require.xml"   #No:180808 mark
      LET l_channel = base.Channel.create()
      CALL l_channel.openFile(l_file,"a" )
      CALL l_channel.setDelimiter("")
      CALL l_channel.write(send_data)
      CALL l_channel.close()

      #调用银行接口方法
      CALL fgl_icbc(server_ip,server_port,sign_port,userid,packgeid,sendtime,send_data,sign_flag) RETURNING recv_len,recv_data

      IF recv_len=-1 THEN
         CALL cl_err('没有收到银行应答','!',1)
         CONTINUE FOREACH
      END IF

      #应答报文保存
      LET day_now = CURRENT YEAR TO DAY
      LET time_now = CURRENT HOUR TO FRACTION(5)
      LET l_file = "/tmp/qry_p013_",day_now,"_",time_now,"_",l_flag_2,"_answer.xml"   #No:180808 add
      #LET l_file = "/tmp/qry_p013_",day_now,"_",time_now,"_answer.xml"               #No:180808 mark
      LET l_channel = base.Channel.create()
      CALL l_channel.openFile(l_file,"a" )
      CALL l_channel.setDelimiter("")
      CALL l_channel.write(recv_data)
      CALL l_channel.close()

      #解析返回的报文
      CALL p011_s(recv_data,packgeid)

      #记录历史记录（参数：请求包ID）
      CALL p011_insert_tc_nps(packgeid,'2')
   END FOREACH

   IF g_success = 'N' THEN
      CALL s_showmsg()
   END IF

END FUNCTION

#根據anmi012和anmi013中單身的內容組合成srting
#anmi013 默認為組成XML形式
#anmi012 nob13不為空，則為根據anmi011的類別進行組合
#        noa06 區別組合的形式 xml或者分隔符noa07隔開
# noa04  2：anmi012
#        3: anmi013
FUNCTION p011_getstr(p_nme01,p_nme27,p_noa01,p_noa04,p_noa06,p_noa07,p_nob13)
DEFINE p_nme01  LIKE nme_file.nme01  #銀行編號
DEFINE p_nme27  LIKE nme_file.nme27  #流水號
DEFINE p_noa01  LIKE noa_file.noa01  #銀行接口編碼
DEFINE p_noa04  LIKE noa_file.noa04  #資料類型
DEFINE p_nob13  LIKE nob_file.nob13
DEFINE p_noa06  LIKE noa_file.noa06
DEFINE p_noa07  LIKE noa_file.noa07
DEFINE l_nob24  LIKE nob_file.nob24
DEFINE l_nob    RECORD LIKE nob_file.*
DEFINE l_value  LIKE type_file.chr1000
DEFINE l_str    STRING
DEFINE l_sql    STRING

   IF g_success = 'N' THEN
      RETURN  ''
   END IF
   INITIALIZE l_nob.* TO NULL
   LET l_sql = "SELECT nob_file.* FROM nob_file ",
               " WHERE nob01 = '",p_noa01,"'",
               "   AND nob04 = '",p_noa04,"'",
               "   AND nob21 <> 'Y' "

   IF p_noa04 = '2' THEN
      IF NOT cl_null(p_nob13) THEN
         LET l_sql = l_sql,"   AND nob13 = '",p_nob13,"'"
      END IF
      LET l_sql = l_sql,"   AND nob02 = '",g_noa02,"' ",
                        "   AND nob03 = '",g_noa05,"'",
                        "   AND nob24 = '1'",
                        " ORDER BY nob05,nob06 "
   ELSE
      LET l_sql = l_sql,"   AND nob02 = ' ' ",
                        "   AND nob03 = ' '",
                        "   AND nob24 = '3'",
                        " ORDER BY nob05,nob06 "
   END IF
   PREPARE nob_pre2  FROM l_sql
   DECLARE nob_curs2 CURSOR FOR nob_pre2
   LET l_str = ""
   FOREACH nob_curs2 INTO l_nob.*
      #获取银行字段对应的值
      LET l_value = p011_getvalue(l_nob.*,p_nme01,p_nme27)
      IF g_success = 'N' THEN
         RETURN  ''
      END IF

      #組合字符串
      IF p_noa06 = '1' THEN #XML
         LET l_str = l_str,"<",l_nob.nob06,">",l_value CLIPPED,"</",l_nob.nob06,">" , ASCII 10
      ELSE                  #分隔符
         LET l_str = l_str,l_value CLIPPED,p_noa07
      END IF
   END FOREACH
   RETURN l_str
END FUNCTION

#组合XML
FUNCTION p011_getxml(p_cmd)
DEFINE l_nob    RECORD LIKE nob_file.*
DEFINE l_nme01  LIKE nme_file.nme01  #銀行編號
DEFINE l_nme27  LIKE nme_file.nme27  #流水號
DEFINE p_cmd    LIKE type_file.chr10  #支付和查询区分
DEFINE l_str1   STRING
DEFINE l_str2   STRING
DEFINE l_sql    STRING

   IF g_success = 'N' THEN
      RETURN  ''
   END IF

   #1.anmi011的為根節點，首先列出anmi011的資料
   LET l_sql = "SELECT nob_file.* FROM nob_file ",
               " WHERE nob01 = '",g_nma47,"'", #网银编号
               "   AND nob02 = '",g_noa02,"'", #交易类型
               "   AND nob03 = '",g_noa05,"'", #版本号
               "   AND nob04 = '1'",
               "   AND nob24 = '1'",
               " ORDER BY nob05 "
   PREPARE nob_pre1  FROM l_sql
   DECLARE nob_curs1 CURSOR FOR nob_pre1

   LET g_sql="SELECT nme01,nme27",
             "  FROM nme_tmp1",
             " WHERE chk = 'Y'",
             "   AND noa05='",g_noa05,"'",
             "   AND noa02='",g_noa02,"'",
             " ORDER BY nme12 "

   PREPARE p011_nme_pre12 FROM g_sql
   DECLARE p011_nme_cs1 CURSOR WITH HOLD FOR p011_nme_pre12

   LET l_str1 = ""
   LET l_str2 = ""
   SELECT count(nme27) INTO l_n
               FROM nme_tmp1
              WHERE chk = 'Y'
                AND noa05=g_noa05
                AND noa02=g_noa02
   DISPLAY l_n

   FOREACH nob_curs1 INTO l_nob.*

      #如果是可以重复节点 并且 支付
      #查询时，不需要考虑重复节点
      IF l_nob.ta_nob01='Y' AND p_cmd='1' THEN

         #如果是结束节点，则不再组合节点里面的字符串
         IF l_nob.nob09  MATCHES "</*"  THEN
            CONTINUE FOREACH
         END IF

         #取出勾选的记录
         FOREACH p011_nme_cs1 INTO l_nme01,l_nme27

            SELECT COUNT(*) INTO l_n
              FROM tc_stf_file,nma_file,nme_tmp1
             WHERE nme01=nma01
               AND tc_stf01=nma47
               AND tc_stf02=nme24
               AND tc_stf04='Y'
               AND nme27=l_nme27
            IF l_n =0 THEN
               CONTINUE FOREACH
            END IF

            #检查1.流水號作為唯一標誌，不能為空
            IF cl_null(l_nme27) OR l_nme27 = ' ' THEN
               LET g_success = 'N'
               CALL s_errmsg('nme27',l_nme27,'','anm1026',1)
            END IF

            #组合报文1.报文开始节点
            SELECT nob09 INTO l_nob.nob09
              FROM nob_file
             WHERE nob01 = g_nma47
               AND nob02 = g_noa02
               AND nob03 = g_noa05
               AND nob04 = '1'
               AND nob13=l_nob.nob13    #节点类型编号
               AND nob09 NOT LIKE '</%' #不以'</'开始

            #组合报文2.开始节点组合到字符串
            IF NOT cl_null(l_nob.nob09) THEN
               LET l_str1 = l_str1,l_nob.nob09 , ASCII 10
            END IF

            #组合报文3.抓取节点内字段和内容|参数：银行编号+流水号+接口银行+报文作业‘2’+xml格式‘1’+节点类型编号
            LET l_str2 = p011_getstr(l_nme01,l_nme27,g_nma47,'2','1','',l_nob.nob13)
            IF NOT cl_null(l_str2) THEN
               LET l_str1 = l_str1,l_str2
            END IF

            #没有子节点的时候才封闭
            SELECT COUNT(*) INTO l_n
              FROM nob_file
             WHERE nob01 = g_nma47
               AND nob02 = g_noa02
               AND nob03 = g_noa05
               AND nob04 = '1'
               AND nob13>l_nob.nob13    #节点类型
            IF l_n=0 THEN
              #组合报文4.结束节点组合到字符串
              SELECT nob09 INTO l_nob.nob09
                FROM nob_file
               WHERE nob01 = g_nma47
                 AND nob02 = g_noa02
                 AND nob03 = g_noa05
                 AND nob04 = '1'
                 AND nob13=l_nob.nob13    #节点类型
                 AND nob09 LIKE '</%'     #以'</'开始

              #组合报文5.结束节点组合到字符串
              IF NOT cl_null(l_nob.nob09) THEN
                 LET l_str1 = l_str1,l_nob.nob09 , ASCII 10
              END IF
            END IF

         END FOREACH


      #如果是不可以重复节点
      ELSE

      	 #先将节点组合到字符串
         IF NOT cl_null(l_nob.nob09) THEN
            LET l_str1 = l_str1,l_nob.nob09 #, ASCII 10
         END IF

         #如果是结束节点，则不再组合节点里面的字符串
         IF l_nob.nob09  MATCHES "</*"  THEN
            CONTINUE FOREACH
         ELSE
            #参数：银行编号+流水号+接口银行+‘2’+‘1’+类型
            LET l_str2 = p011_getstr(l_nme01,l_nme27,g_nma47,'2','1','',l_nob.nob13)
            IF NOT cl_null(l_str2) THEN
               LET l_str1 = l_str1, l_str2
            END IF
         END IF

      END IF
   END FOREACH

   RETURN l_str1
END FUNCTION

FUNCTION p011_getvalue(p_nob,p_nme01,p_nme27)
DEFINE p_nob      RECORD LIKE nob_file.*
DEFINE l_nob1     RECORD LIKE nob_file.*
DEFINE p_nme01    LIKE nme_file.nme01  #銀行編號
DEFINE p_nme27    LIKE nme_file.nme27  #流水號
DEFINE l_value    LIKE type_file.chr1000
DEFINE l_diff     LIKE type_file.num10
DEFINE l_i        LIKE type_file.num5
DEFINE l_time     LIKE type_file.chr8
DEFINE l_time2    DATETIME YEAR TO SECOND
DEFINE l_str      STRING
DEFINE l_sql      STRING
DEFINE l_addstr   STRING
DEFINE l_tabstr   STRING
DEFINE field_val  STRING
DEFINE data_val   STRING

   LET l_value = ""
   LET data_val = ""
   LET field_val = ""
   CASE p_nob.nob08 #取值來源
      WHEN "1"     #1 固定值
         LET l_value = p_nob.nob09

      WHEN "2"     #2 從TIPTOP取值
         IF cl_null(p_nob.nob12) THEN
            LET p_nob.nob12 = " 1=1 "
         END IF
         IF p_nob.nob10 NOT MATCHES 'nme_file' THEN
            LET l_tabstr = "  nme_file, ",p_nob.nob10
         ELSE
            LET l_tabstr = p_nob.nob10
         END IF
         LET l_sql = "SELECT UNIQUE ",p_nob.nob11,"  FROM ",l_tabstr,
                     " WHERE ",p_nob.nob12,
                     "   AND nme01= '",p_nme01,"'",
                     "   AND nme27 = '",p_nme27,"' "
         PREPARE i011_pre1 FROM l_sql
         EXECUTE i011_pre1 INTO l_value
         IF p_nob.nob11 ='nme08' THEN
            LET l_value=l_value*100 USING '<<<<<<<<&&'
         END IF
         IF SQLCA.sqlcode THEN
            CALL s_errmsg('nob11',p_nob.nob11,'exe p011_pre1',SQLCA.sqlcode,1)
            LET g_success = 'N'
            RETURN  ''
         END IF

      WHEN "3"     #3 序號
         LET g_xh = g_xh + 1
         LET l_value = g_xh

      WHEN "4"     #4 從畫面取值#该取值方式暂时只用于anmq035

         IF p_nob.nob09='pmf02' THEN
            SELECT pmf02 INTO l_value FROM nme_tmp2
             WHERE nme27=p_nme27
         END IF

         IF p_nob.nob09='nmt02' THEN
            SELECT nmt02 INTO l_value FROM nme_tmp2
             WHERE nme27=p_nme27
         END IF

         IF p_nob.nob09='pmf03' THEN
            SELECT pmf03 INTO l_value FROM nme_tmp2
             WHERE nme27=p_nme27
         END IF

         IF p_nob.nob09='pmf04' THEN
            SELECT pmf04 INTO l_value FROM nme_tmp2
             WHERE nme27=p_nme27
         END IF

      WHEN "5"     #5 多域串
         DECLARE nob_curs_1 CURSOR FOR SELECT * FROM nob_file
           WHERE nob01 = p_nob.nob01 AND nob02 = p_nob.nob02
             AND nob03 = p_nob.nob03 AND nob04 = p_nob.nob04
             AND nob24 = p_nob.nob24 AND nob21 = 'Y'
             AND nob08 <> '5'
           ORDER BY nob05
         FOREACH nob_curs_1 INTO l_nob1.*
            LET field_val =  field_val,l_nob1.nob06,l_nob1.nob22
            LET l_value = p011_getvalue(l_nob1.*,p_nme01,p_nme27)
            LET data_val = data_val,l_value,l_nob1.nob22
            IF g_success = 'N' THEN
               RETURN  ''
            END IF
         END FOREACH
         LET l_value =  field_val CLIPPED,data_val CLIPPED

      WHEN "6"    #當前日期
         IF NOT cl_null(p_nob.nob09) THEN
            LET l_value = g_today USING p_nob.nob09
         ELSE
            LET l_value = g_today
         END IF
         LET g_sql="select to_char(to_date('",l_value,"','YY/MM/DD'),'",p_nob.nob09,"') from dual"
         PREPARE l_value_pre1e FROM g_sql
         EXECUTE l_value_pre1e INTO l_value

      WHEN "7"    #當前時間
         IF NOT cl_null(p_nob.nob09) THEN
           LET l_i = LENGTH(p_nob.nob09)
           LET l_time = TIME
           IF p_nob.nob09 MATCHES "*:*" THEN
              LET l_value = l_time
           ELSE
              LET l_value = l_time[1,2],l_time[4,5],l_time[7,8]
           END IF
           LET l_value = l_value[1,l_i]
         ELSE
            LET l_value = l_time
         END IF
      WHEN "8"    #当前日期+时间
         IF NOT cl_null(p_nob.nob09) THEN
            LET l_time2= CURRENT YEAR TO SECOND
            LET g_sql="SELECT to_char(to_date('",l_time2,"','yyyy-mm-dd hh24:mi:ss'),'",p_nob.nob09,"') FROM DUAL"
            PREPARE l_time2_pre FROM g_sql
            EXECUTE l_time2_pre INTO l_value
         END IF

      WHEN "9"  #包序号
         LET l_value = packgeid
   END CASE
   IF p_nob.nob04 = '2' AND p_nob.nob08 <> '5'  THEN
      #是否必輸nob14
      IF cl_null(l_value) AND p_nob.nob14 = 'Y' THEN
         LET g_success = 'N'
         CALL s_errmsg('nob06',p_nob.nob06,"nob14 = Y",'anm1021',1)
         RETURN ''
      END IF
      #是否控制小數位數nob19 nob20
      IF p_nob.nob19 = 'Y' THEN
         LET l_value = cl_set_num_value(l_value,p_nob.nob20)
      END IF
      #是否需補字符nob16 nob17 nob18
      LET l_diff = 0
      LET l_addstr = ''
      IF p_nob.nob16 = 'Y' THEN
         IF LENGTH(p_nob.nob17) > 1 THEN
            LET g_success = 'N'
            CALL s_errmsg('nob17',p_nob.nob17,"",'abm-811',1)
            RETURN ''
         END IF
         LET l_diff = p_nob.nob15 - LENGTH(l_value)
         IF l_diff > 0 THEN
            FOR l_i = 1 TO l_diff
               LET l_addstr = l_addstr,p_nob.nob17
            END FOR
            IF p_nob.nob18 = '01' THEN
               lET l_value = l_addstr,l_value
            ELSE
               LET l_value = l_value,l_addstr
            END IF
         END IF
      END IF
      #最大長度nob15
      IF NOT cl_null(p_nob.nob15) AND LENGTH(l_value) > p_nob.nob15 THEN
         LET g_success = 'N'
         CALL s_errmsg('nob06',p_nob.nob06,p_nob.nob15,'anm1020',1)
         RETURN  ''
      END IF
   END IF

   RETURN l_value

END FUNCTION

#支付完成后，tc_nps_file寫入資料
FUNCTION p011_insert_tc_nps(p_id,p_flag)
DEFINE p_id       LIKE nps_file.nps01
DEFINE p_nme27    LIKE nme_file.nme27
DEFINE p_noa05    LIKE noa_file.noa05
DEFINE p_flag     LIKE type_file.chr1
DEFINE l_tc_nps   RECORD LIKE tc_nps_file.*
DEFINE p_name     STRING
DEFINE l_sql      STRING
DEFINE l_str      STRING

   IF cl_null(p_id) THEN
      RETURN
   END IF

   INITIALIZE l_tc_nps.* TO NULL

   #查询出所有该包ID的返回明细
   LET g_sql="SELECT * FROM npstemp",
             " WHERE tc_nps01='",p_id,"'"
   DECLARE sel_npstemp_cur CURSOR FROM g_sql

   FOREACH sel_npstemp_cur INTO l_tc_nps.*

      LET l_tc_nps.tc_nps03 = p_flag    #支付类型

      #网络银行,付款对象编号,付款对象简称,付款对象全称
      SELECT nma_file.nma47,nme_tmp1.apa06,nme_tmp1.nme13,
             nme_tmp1.apa06_name
        INTO l_tc_nps.tc_nps09,l_tc_nps.tc_nps10,l_tc_nps.tc_nps11,l_tc_nps.tc_nps12
        FROM nme_tmp1,nma_file
       WHERE nme27=l_tc_nps.tc_nps02
         AND nme01=nma01
      LET l_tc_nps.tc_nps17 = l_tc_nps.tc_nps17/100
      INSERT INTO tc_nps_file VALUES(l_tc_nps.*)
      IF SQLCA.sqlcode THEN
         CALL s_errmsg('nps01',l_tc_nps.tc_nps01,'ins tc_nps_file',SQLCA.sqlcode,1)
         LET g_success = 'N'
      END IF

      IF NOT cl_null(l_tc_nps.tc_nps04) THEN

         #更新支付状态（条件：nme27=l_tc_nps.tc_nps02)
         UPDATE nme_file SET nme24=l_tc_nps.tc_nps04
          WHERE nme27=l_tc_nps.tc_nps02
         IF SQLCA.sqlcode THEN
            CALL s_errmsg('nme27',l_tc_nps.tc_nps04,'upd nme_file',SQLCA.sqlcode,1)
            LET g_success = 'N'
         END IF

         #更新支付请求里的支付单号和项次
         UPDATE tc_nps_file SET tc_nps19=l_tc_nps.tc_nps21
          WHERE tc_nps01=l_tc_nps.tc_nps20
            AND tc_nps02=l_tc_nps.tc_nps02

      END IF
   END FOREACH
END FUNCTION
