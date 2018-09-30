# Prog. Version..: '5.30.23-16.12.05(00002)'     #
#
# Library name...: aws_plmcli
# Descriptions...: PLM Web Service Client
# Input parameter:
# Return code....:
# Usage .........:
# Date & Author..: No:FUN-F50011 15/05/11 By Rayhu
# Modify.........: 
# Modify.........: No.FUN-F50005 15/06/07 By Lisa aws_plmcli參數回傳值修正

IMPORT com
DATABASE ds

GLOBALS "../4gl/aws_plmgw.inc"
GLOBALS "../4gl/awsef.4gl"
GLOBALS "../../config/top.global"
GLOBALS "../../aws/4gl/aws_ttsrv2_global.4gl"   #TIPTOP Service Gateway 使用的全域變數檔  
GLOBALS "../4gl/aws_crossgw.inc"

DEFINE g_result_xml     om.DomNode
DEFINE g_request        om.DomNode
DEFINE g_snode          om.DomNode
DEFINE g_dnode          om.DomNode
DEFINE g_rnode          om.DomNode
DEFINE g_tnode          om.DomNode
DEFINE g_unode          om.DomNode
DEFINE g_vnode          om.DomNode
DEFINE g_wnode          om.DomNode
DEFINE g_xnode          om.DomNode
DEFINE g_req_doc        om.DomDocument
DEFINE g_status         LIKE type_file.num10    #aws_plmcli() return status
DEFINE g_plmsoap        STRING                  #PLM SOAP URL
DEFINE g_plmhttp        STRING                  #PLM HTTP URL
DEFINE g_client         STRING                  #PLM Client IP (TIPTOP Host)
DEFINE g_plmsiteip      STRING                  #PLM Server IP
DEFINE g_result         STRING                  #PLM result XML document
DEFINE g_result_value   STRING                  #PLM result value in XML
DEFINE g_result_desc    STRING                  #PLM result describe in XML
DEFINE g_ws_status      LIKE type_file.num10    #ws_status
DEFINE g_jobid          LIKE wcf_file.wcf19     #傳輸的plm隊列主key
DEFINE g_userid         LIKE zx_file.zx01       #使用者代號
DEFINE g_jobstatus      LIKE type_file.chr1     #處理狀態碼
DEFINE g_message        STRING                  #處理訊息
DEFINE g_showmsg        LIKE type_file.num5
DEFINE g_success_msg    STRING                  #PLM success msg
DEFINE g_wap            RECORD LIKE wap_file.*

#------------------------------------------------------------------------------
# Library name...: aws_plmcli
# Descriptions...: PLM web service client
# Input Parameter:
# Return code....: -2   Client error
#                  -1   PLM return except   #FUN-F50005 mark
#                   0   PLM return false    #FUN-F50005 mark
#                   1   PLM return true     #FUN-F50005 mark
#                   0   PLM return true     #FUN-F50005 add
#                 100   PLM return false    #FUN-F50005 add
# Usage .........: call aws_plmcli(p_jobid,p_userid,p_jobstatus,p_message) returing l_status
#------------------------------------------------------------------------------
FUNCTION aws_plmcli(p_jobid,p_userid,p_jobstatus,p_message)
  DEFINE p_jobid         LIKE wcf_file.wcf19     #傳輸的plm隊列主key
  DEFINE p_userid        LIKE zx_file.zx01       #使用者代號
  DEFINE p_jobstatus     LIKE type_file.chr1     #處理狀態碼
  DEFINE p_message       STRING                  #處理訊息
  DEFINE l_status        LIKE type_file.num10

    IF (cl_null(g_aza.aza121) OR g_aza.aza121 <> 'Y') AND g_aza.aza122 <> '3' THEN  RETURN 0 END IF

    IF cl_null(g_user) THEN LET g_user = 'TP' END IF

    CALL cl_getmsg('aws-975',g_lang) RETURNING g_success_msg  #更新PLM JOB處理狀態成功

    LET g_jobid = p_jobid
    LET g_userid = p_userid
    LET g_jobstatus = p_jobstatus
    LET g_message = p_message
 
    LET g_showmsg = 1

    CALL aws_plmcli_1()
    RETURNING l_status

    RETURN l_status

END FUNCTION

FUNCTION aws_plmcli_1()
  DEFINE buf             base.StringBuffer
  DEFINE l_str           STRING
  DEFINE l_status        LIKE type_file.num10
  DEFINE l_cnt           LIKE type_file.num10
  DEFINE l_str2          STRING                  
  DEFINE l_cross_status  LIKE type_file.num5   

    LET g_return_desc = NULL                     
    LET g_strXMLInput = NULL
    LET g_result_value = NULL
    LET g_result_desc = NULL
    LET g_status = 0                             
    CALL aws_plmcli_prepareRequest()
    IF g_status <> 0 THEN RETURN g_status END IF 

    CALL aws_plmcli_setERPJobStatus()
  
    CALL aws_plmcli_processRequest()

    LET g_strXMLInput = aws_xml_replace(g_strXMLInput)
    LET g_strXMLInput = aws_xml_replace_attribute(g_strXMLInput)

    SELECT wap02 INTO g_wap.wap02 FROM wap_file
    IF g_wap.wap02 = 'Y' THEN  #使用CROSS整合平台
       LET l_str = "PLM"
       LET l_str2 = "setERPJobStatus"
       LET g_strXMLInput = "Data|<![CDATA[",g_strXMLInput,"]]>"
      #呼叫 CROSS 平台發出整合活動請求
       CALL aws_cross_invokeSrv(l_str,l_str2,"sync",g_strXMLInput)
            RETURNING l_cross_status, l_status, g_result
       IF NOT l_cross_status  THEN
          LET g_result_desc = "拋轉失敗"
          RETURN -2
       END IF
    ELSE
       LET plmService_ERPIService_ERPIServiceHttpSoap11EndpointLocation = g_plmsoap  #set Soap server location
       CALL fgl_ws_setOption("http_invoketimeout", 60)     #set web service timeout

       CALL plmService_setERPJobStatus(g_strXMLInput) RETURNING l_status, g_result

    END IF

    LET g_ws_status = l_status

    CALL aws_plmcli_logfile()

    IF l_status = 0 THEN
       CALL aws_plmcli_processResult(g_showmsg)
    ELSE
       IF fgl_getenv('FGLGUI') = '1' THEN
          LET l_str = "Connection failed:\n\n",
                      "  [Code]: ", wsError.code, "\n",
                      "  [Action]: ", wsError.action, "\n",
                      "  [Description]: ", wsError.description
       ELSE
          LET l_str = "Connection failed: ", wsError.description
       END IF

       IF g_bgjob='N' OR cl_null(g_bgjob) THEN
          CALL cl_err(l_str, '!', 1)   #connection failed
       ELSE
          CALL cl_err(l_str, '!',0)
       END IF

       LET g_return_desc = l_str
       LET g_status = -2
       RETURN g_status
    END IF
    RETURN g_status
END FUNCTION

#------------------------------------------------------------------------------
# Generate XML Request Header
#------------------------------------------------------------------------------
FUNCTION aws_plmcli_prepareRequest()
  DEFINE l_code      LIKE type_file.num5
  DEFINE l_sendtime  LIKE type_file.chr30
  DEFINE l_transid   LIKE type_file.chr30
  DEFINE l_today     LIKE type_file.chr30
  DEFINE l_time      LIKE type_file.chr30
  DEFINE l_tpip      STRING
  DEFINE l_lang      STRING

    CALL aws_plmcli_siteinfo() RETURNING l_code

    IF l_code = 0 THEN
       LET g_status = -2
       RETURN
    END IF

    IF cl_null(g_user) THEN LET g_user = 'TP' END IF

    LET l_sendtime = TODAY USING 'yyyy/mm/dd',' ',TIME

    LET l_transid  = CURRENT HOUR TO FRACTION(2)
    LET l_transid  = cl_replace_str(l_transid,':','')
    LET l_transid  = cl_replace_str(l_transid,'.','')
    LET l_transid  = TODAY USING 'yyyymmdd',cl_replace_str(l_transid,':','')

    LET l_tpip = cl_get_tpserver_ip()    #TIPTOP IP

    CASE
       WHEN g_lang='0' LET l_lang = 'zh_TW'
       WHEN g_lang='1' LET l_lang = 'en_US'
       WHEN g_lang='2' LET l_lang = 'zh_CN'
    END CASE

    LET g_strXMLInput =                           #組 XML Header
        "<Request>", ASCII 10,
        "  <Access>", ASCII 10,
        "    <Authentication user='PLM' password='PLM' />", ASCII 10,
        "    <Connection application='TIPTOP' source='",l_tpip CLIPPED,"' />", ASCII 10,
        "    <COMPANY name='", g_plant CLIPPED,"' />", ASCII 10,
        "    <Locale language='",l_lang CLIPPED,"' />", ASCII 10,
        "  </Access>", ASCII 10

END FUNCTION

#------------------------------------------------------------------------------
# Generate XML Request Body
#------------------------------------------------------------------------------
#更新PLM JOB處理狀態(JobStatus)
FUNCTION aws_plmcli_setERPJobStatus()

   LET g_strXMLInput = g_strXMLInput CLIPPED,
                      "<RequestContent>", ASCII 10,
                      "  <Parameter>", ASCII 10,
                      "    <Master name = 'UpdateJob'>", ASCII 10,
                      "       <Field name='JobID' value='",g_jobid CLIPPED,"' />", ASCII 10,
                      "       <Field name='UserId' value='",g_userid CLIPPED,"' />", ASCII 10,
                      "       <Field name='JobStatus' value='",g_jobstatus CLIPPED,"' />", ASCII 10,
                      "       <Field name='Message' value='",g_message CLIPPED,"' />", ASCII 10,
                      "    </Master>", ASCII 10,
                      "  </Parameter>", ASCII 10,
                      "</RequestContent>", ASCII 10,
                      "</Request>", ASCII 10

END FUNCTION

#------------------------------------------------------------------------------
# DOM to xml string
#------------------------------------------------------------------------------
FUNCTION aws_plmcli_processRequest()
  DEFINE l_msg      STRING
  DEFINE l_status   STRING
  DEFINE l_ch       base.Channel
  DEFINE l_buf      STRING
  DEFINE l_i        LIKE type_file.num10
  DEFINE l_file     STRING
  DEFINE l_handle   om.SaxDocumentHandler

    LET l_file = fgl_getenv("TEMPDIR"), "/", fgl_getpid() USING '<<<<<<<<<<', ".xml"
    LET l_handle = om.XmlWriter.createFileWriter(l_file)
    CALL l_handle.setIndent(FALSE)
    LET l_ch = base.Channel.create()
    CALL l_ch.openFile(l_file, "r")
    CALL l_ch.setDelimiter(NULL)
    LET l_i = 1
    WHILE l_ch.read(l_buf)
       IF l_i != 1 THEN
           LET g_strXMLInput = g_strXMLInput, '\n'
       END IF
       LET g_strXMLInput = g_strXMLInput, l_buf CLIPPED
       LET l_i = l_i + 1
    END WHILE
    CALL l_ch.close()
    RUN "rm -f " || l_file || " >/dev/null 2>&1"

END FUNCTION

#------------------------------------------------------------------------------
# get response xml string and parsing xml content
#------------------------------------------------------------------------------
FUNCTION aws_plmcli_processResult(p_showmsg)
  DEFINE p_showmsg    LIKE type_file.num5
  DEFINE l_ch         base.Channel
  DEFINE l_file       STRING
  DEFINE l_doc        om.DomDocument
  DEFINE l_node_lisa  om.NodeList
  DEFINE l_snode      om.DomNode
  DEFINE l_str        STRING
  DEFINE l_result     STRING  
  DEFINE l_result1    STRING  
  DEFINE ln_node      om.DomNode

   #--------------------------------------------------------------------------
   # generate temp xml file
   #--------------------------------------------------------------------------

    LET g_result_desc = ''
    LET g_result_xml = aws_ttsrv_stringToXml(g_result)
    LET g_status = aws_xml_getTag(g_result_xml,"ExecutionCode")
    LET g_result_desc = aws_xml_getTag(g_result_xml,"Message")

    IF cl_null(g_status) THEN
       LET g_status = 0
    END IF

    IF p_showmsg != 1 THEN
       LET p_showmsg = 0
    END IF

    IF g_status <> 0 THEN
       IF fgl_getenv('FGLGUI') = '1' THEN
          LET l_str = "PLM return error:\n\n", g_result_desc 
       ELSE
          LET l_str = "PLM return error: ", g_result_desc  
       END IF
       IF g_bgjob = 'N' OR cl_null(g_bgjob) THEN
          CALL cl_err(l_str, '!', 1)    #PLM Server return except
       ELSE
          CALL cl_err(l_str, '!',0)
       END IF
       LET g_status = -1  #fail
    ELSE
       IF cl_null(g_result_desc) THEN
          LET l_str = g_success_msg
       END IF
       LET g_status = 0  #success 
       IF g_bgjob = 'N' OR cl_null(g_bgjob) THEN
          CALL cl_err(l_str, '!', 1)
       ELSE
          CALL cl_err(l_str, '!',0)
       END IF
    END IF

    LET g_return_desc = l_str   

END FUNCTION

FUNCTION aws_plmcli_siteinfo()
  DEFINE l_code  LIKE type_file.num5
  DEFINE l_wge02 LIKE wge_file.wge02
  DEFINE l_wge03 LIKE wge_file.wge03
  DEFINE l_wge08 LIKE wge_file.wge08

    LET l_code = 1

    SELECT wge02,wge03,wge08 INTO l_wge02,l_wge03,l_wge08
      FROM wge_file
     WHERE wge01 = 'P' AND wge06 = g_plant
       AND wge05 = '*' AND wge07 = '*'

    IF l_wge02 IS NULL THEN
        IF g_bgjob = 'N' OR cl_null(g_bgjob) THEN
           CALL cl_err3('sel','wge_file',g_plant,'',100,'','',1)
        ELSE
           CALL cl_err3('sel','wge_file',g_plant,'',100,'','',0)
        END IF
        LET g_return_desc = "Sel wge_file failed"
        LET l_code = 0
        RETURN l_code
    ELSE
        LET g_plmsoap = l_wge03 CLIPPED       #WIP SOAP URL
        LET g_plmsiteip = l_wge02 CLIPPED     #WIP Server IP
        LET g_plmhttp = l_wge08 CLIPPED       #WIP HTTP URL
    END IF

    LET g_client = cl_getClientIP()       #Client IP
    RETURN l_code

END FUNCTION

#------------------------------------------------------------------------------
# write xml to log
#------------------------------------------------------------------------------
FUNCTION aws_plmcli_logfile()
  DEFINE l_str    STRING
  DEFINE l_file   STRING
  DEFINE l_cmd    STRING
  DEFINE l_ch     base.Channel

    LET l_file = fgl_getenv("TEMPDIR"), "/aws_plmcli-", TODAY USING 'YYYYMMDD', ".log"
    LET l_ch = base.Channel.create()
    CALL l_ch.openFile(l_file, "a")
    CALL l_ch.setDelimiter("")
    IF STATUS = 0 THEN
        LET l_str = "#--------------------------- (", CURRENT YEAR TO SECOND, ") ----------------------------#"
        CALL l_ch.write(l_str)
        CALL l_ch.write("")
        LET l_str = "Program: ", g_prog CLIPPED
        CALL l_ch.write(l_str)

        CALL l_ch.write("Request XML:")
        CALL l_ch.write(g_strXMLInput)
        CALL l_ch.write("")

        CALL l_ch.write("Response XML:")
        IF g_ws_status = 0 THEN
            CALL l_ch.write(g_result)
            CALL l_ch.write("")
        ELSE
            CALL l_ch.write("")
            IF fgl_getenv('FGLGUI') = '1' THEN
                LET l_str = "   Connection failed:\n\n",
                            "     [Code]: ", wserror.code, "\n",
                            "     [Action]: ", wserror.action, "\n",
                            "     [Description]: ", wserror.description
            ELSE
                LET l_str = "   Connection failed: ", wserror.description
            END IF
            CALL l_ch.write(l_str)
            CALL l_ch.write("")
        END IF
        CALL l_ch.write("#------------------------------------------------------------------------------#")
        CALL l_ch.write("")
        CALL l_ch.write("")
        CALL l_ch.close()

        LET l_cmd = "chmod 666 ", l_file CLIPPED, " >/dev/null 2>&1"
        RUN l_cmd
    ELSE
        DISPLAY "Can't open log file."
    END IF

END FUNCTION
#FUN-F50011
