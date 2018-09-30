# Prog. Version..: '2.00.01-05.07.01(00000)'     #
# Pattern name...: UpdateBOM(p_Param)
# Descriptions...: PDM传入的参数对TIPTOP中的BOM变更生成相应的ECN单
# Date & Author..: 2006-07-20 by heartheros




DATABASE ds
#引入全局变量
GLOBALS "../../config/top.global"
#UpdataBOM操作全局变量定义区
DEFINE l_errcode           STRING,                 
       i,l_check,j,l_headi       SMALLINT                #l_headi表示单头是否已经被插入1,插入，２。未插

DEFINE g_bma    RECORD LIKE bma_file.*,                  #从xml中抓出的数据
       g_bma_o  RECORD LIKE bma_file.*,                  #数据库中抓出的数据用以比对
       g_bma_t  RECORD LIKE bma_file.*,                  #存单头中异动数据
       #g_bmb_pdm_rowid  LIKE bmb_file.bmb_pdm_rowid,     #传入的单身数据不在数据库中存在则失效
       g_bmb_bmb03  LIKE bmb_file.bmb03,                 #传入的单身数据不在数据库中存在则失效
       g_bmb    DYNAMIC ARRAY OF RECORD LIKE bmb_file.*, #从xml中抓出的数据
                # l_bmb  RECORD LIKE bmb_file.*
                #END RECORD
       g_bmb_o  RECORD LIKE bmb_file.*,                  #数据库中抓出的数据用以比对
       g_bmb_t  RECORD LIKE bmb_file.*                   #存有异动的单身数据
DEFINE g_bmx    RECORD LIKE bmx_file.*,
       g_bmy    RECORD LIKE bmy_file.*,
       g_bmz    RECORD LIKE bmz_file.*
DEFINE g_bmy03_t LIKE bmy_file.bmy03
#UpdataBOM操作全局变量定义区END

#add by bugbin for bmb13 begin
DEFINE l_bmt         DYNAMIC ARRAY OF RECORD LIKE bmt_file.*
DEFINE l_bmt06_t     LIKE bmt_file.bmt06 
DEFINE l_bmb13_length,l_bmb13_index,l_bmt_i,l_bmt_n,l_bmt_total       INTEGER
DEFINE l_bmb13_sep   VARCHAR(1)
DEFINE bmt_arr_data  DYNAMIC ARRAY OF STRING
DEFINE l_bmb13_tmp_data  DYNAMIC ARRAY OF STRING
DEFINE l_bmt_tmp_data,l_bmt_data       STRING
#add by bugbin for bmb13 end

#UpdateBOM函数区
FUNCTION UpdateBOM(p_Param)
DEFINE 
  l_ObjectID   STRING,
  l_Separator  STRING,
  l_Factory    LIKE azp_file.azp01,
  l_db         LIKE azp_file.azp03,  
  l_User       STRING,
  l_FieldList  STRING,
  l_Condition  STRING,
  l_DataSource STRING,
  l_xmlFile    STRING,
  l_DataFormat STRING,
  l_rexml      STRING,
  l_Format     STRING,
  l_bodyCount  SMALLINT,
  transfer_xml STRING,
  l_tag       SMALLINT,
   l_errCode   STRING,
   l_errDesc   STRING,
  headNode    om.DomNode,
  bodyNode    om.DomNode,
  dataNode    om.DomNode,
  dataSetNode om.DomNode,
  transferData om.DomDocument,
  ch    base.channel,
  p_Param    DYNAMIC ARRAY OF RECORD
    Tag       STRING,  
    Attribute STRING,    
    Value     STRING  
              END RECORD,
  l_checkHeadField STRING,
  l_checkBodyField DYNAMIC ARRAY OF RECORD
                     FIELD  STRING
                   END RECORD,
  l_checkHeadData  STRING,
  l_checkBodyData  DYNAMIC ARRAY OF RECORD
                     DATA   STRING
                   END RECORD     
DEFINE
  head_cur,head_old,tmpnode,body_cur,body_old  om.DomNode,
  value_old,value_cur,l_data_att       STRING,
  l_pos                                SMALLINT
DEFINE 
  h_wso03         LIKE wso_file.wso03,
  h_wso15         LIKE wso_file.wso15,
  b_wso03         LIKE wso_file.wso03,
  b_wso15         LIKE wso_file.wso15,
  hd_field        STRING,
  hd_data         STRING,
  bd_field        STRING,
  bd_data         STRING,
  f_tok           base.StringTokenizer,
  d_tok           base.StringTokenizer,
  l_field         STRING,
  l_data          STRING,
  bf_tok          base.StringTokenizer,
  bd_tok          base.StringTokenizer,
  l_bmb10         LIKE bmb_file.bmb10,
  l_bmb03         LIKE bmb_file.bmb03,
  l_ima25         LIKE ima_file.ima25,
  l_flag          varchar(1),
  l_bmb10_fac     LIKE bmb_file.bmb10_fac,
  b_field         STRING,
  b_data          STRING
  
  #检查服务私有参数列表中是否包含ObjectId的定义
  #如果没有则使用全局变量  
  LET l_ObjectID = FindValue("ObjectID",p_Param)
  IF cl_null(l_ObjectID) THEN
     LET l_ObjectID = 'BOM'
  END IF

  #检查服务私有参数列表中是否包含Seperator的定义
  #如果没有则使用全局变量  
  LET l_Separator = FindValue("Separator",p_Param)
  IF cl_null(l_Separator) THEN
     LET l_Separator = '|'
     #LET l_Separator = g_Separator
  END IF

  #检查服务私有参数列表中是否包含Factory的定义
  #如果没有则使用全局变量  
  LET l_Factory = FindValue("Factory",p_Param)
  IF cl_null(l_Factory) THEN
     LET l_Factory = 'DEMO-1'
  END IF
  IF cl_null(l_Factory) THEN
     RETURN 'aws-252','缺少Factory参数'
  END IF

  #检查服务私有参数列表中是否包含User的定义
  #如果没有则使用全局变量  
  LET l_User = FindValue("User",p_Param)
  IF cl_null(l_User) THEN
     LET l_User = 'tiptop'
  END IF
  IF cl_null(l_User) THEN
     RETURN 'aws-253','缺少User参数'
  END IF
  LET g_user = l_User
  SELECT zx03 INTO g_grup FROM zx_file WHERE zx01=g_user
  LET g_today = TODAY

  #检查指定用户是否有权限操作该数据库
  CALL aws_check_db_right(l_User,l_Factory) RETURNING l_errCode,l_errDesc
  IF NOT cl_null(l_errCode) THEN 
     RETURN l_errCode,l_errDesc
  END IF 

  #切换数据库
  SELECT azp03 INTO l_db FROM azp_file WHERE
    azp01 = l_Factory
  IF l_db <> 'ds' THEN
     CLOSE DATABASE
     DATABASE l_db
     IF SQLCA.sqlcode THEN 
        RETURN 'aws-257','切换数据库发生错误'
     END IF 
  END IF 
  
  LET l_FieldList = FindValue("FieldList",p_Param)     #得到FieldList参数
  LET l_Condition = FindValue("Condition",p_Param)     #得到Condition参数
  LET l_DataFormat = FindValue("Format",p_Param)       #得到Format参数
  
  #获得Data参数(实际上是存放Data的XML文件名)
  LET l_xmlFile = FindValue("Data",p_Param)
  IF cl_null(l_xmlFile) THEN 
     RETURN 'aws-206','缺少Data参数'
  END IF 

{  #获得Data对应的Format参数(前面在TIPTOPGateWay会将它作为一个额外参数填充到p_Param中)
  LET l_Format = FindValue("DATA_FORMAT",p_Param)
  IF cl_null(l_Format) THEN 
     RETURN 'aws-207','缺少Format参数'
  END IF }

  #将Data存放的XML文件转换为Logic格式
  CALL aws_transfer_xml(l_ObjectID,l_xmlFile,l_Separator,'Join','Logic') 
  RETURNING l_errCode,l_errDesc
  IF NOT cl_null(l_errCode) THEN 
     RETURN l_errCode,l_errDesc
  END IF 
    
  #LET l_DataSource = FindValue("Data",p_param)
  LET transferData = om.DomDocument.createFromXmlFile(l_xmlFile) 
  LET dataNode = transferData.getDocumentElement()
  
  #得到dataSet节点
  LET datasetNode = dataNode.getFirstChild()
  WHILE dataSetNode.getTagName() <> "DataSet"
   LET dataSetNode = dataSetNode.getNext()
  END WHILE 
  
  ###############################################################
  #Add By Lifeng , 合并相同主键的单身 
  IF dataSetNode IS NULL THEN 
     RETURN 'xxxxxx','dataSet Node cannot be null'
  END IF 
  LET head_old = dataSetNode.getFirstChild()
  LET value_old = head_old.getAttribute('Data')
  LET l_pos = value_old.getIndexOf('|',1)
  LET value_old = value_old.subString(1,l_pos-1)

  LET head_cur = head_old.getNext()
  #循环比较每一个Head节点
  WHILE NOT head_cur IS NULL
    LET value_cur = head_cur.getAttribute('Data')
    LET l_pos = value_cur.getIndexOf('|',1)
    LET value_cur = value_cur.subString(1,l_pos-1)
 
    #比较上一个节点的主键值value_old和当前节点的主键值是否相同 ，如果相同
    #则进行合并
    IF value_old = value_cur THEN
       #把当前节点的所有子节点的Data值复制到上一个节点的新增子节点中
       LET body_cur = head_cur.getFirstChild()
       WHILE NOT body_cur IS NULL 
          LET l_data_att = body_cur.getAttribute('Data')

          #在head_cur中增加一个子节点
          LET body_old = head_old.createChild('Body')
          CALL body_old.setAttribute('Data',l_data_att)

          LET body_cur = body_cur.getNext()
       END WHILE
       #先得到下一个Head节点
       LET tmpnode = head_cur.getNext()
       #删除当前节点
       CALL datasetNode.removeChild(head_cur)
       LET head_cur = tmpnode
    #如果不相同则把当前的主键值更新到上一个节点的变量中
    ELSE
      LET head_old = head_cur
      LET value_old = value_cur
      #循环下一个Head节点
      LET  head_cur = head_cur.getNext()
    END IF

  END WHILE
      
  CALL dataNode.writeXml('/u1/out/lifeng.xml')

  ###############################################################

  BEGIN WORK   #add by zqj 060726  
  
  
  ##add by chenzhong begin
  ##取单头单身需要给默认值的栏位及相应的默认值
  DECLARE h_default CURSOR FOR
     SELECT wso03,wso15  FROM wso_file
        WHERE wso01 ='BOM' AND wso02='bma_file'
          AND wso09='Y' AND wso15 IS NOT NULL
          
  FOREACH h_default INTO h_wso03,h_wso15
     IF cl_null(hd_field) THEN 
        LET hd_field = h_wso03
        LET hd_data = h_wso15
        IF cl_null(hd_data) THEN 
           LET hd_data = ' '
        END IF 
     ELSE 
     	LET hd_field = hd_field,l_Separator,h_wso03
     	LET hd_data = hd_data,l_Separator,h_wso15
     END IF 
  END FOREACH 
  
  DECLARE b_default CURSOR FOR 
     SELECT wso03,wso15 FROM wso_file
        WHERE wso01 ='BOM' AND wso02 ='bmb_file'
           AND wso09='Y' AND wso15 IS NOT NULL 
  FOREACH b_default INTO b_wso03,b_wso15
     IF cl_null (bd_field) THEN 
        LET bd_field = b_wso03
        LET bd_data = b_wso15
        IF cl_null(bd_data) THEN 
           LET bd_data = ' '
        END IF 
     ELSE 
     	LET bd_field = bd_field,l_Separator,b_wso03
     	LET bd_data = bd_data,l_Separator,b_wso15
     END IF 
  END FOREACH 
  ##add end  
           
    
  #取单头单身栏位
  LET l_checkHeadField = dataSetNode.getAttribute("Head")
  LET l_checkBodyField[1].FIELD =dataSetNode.getAttribute("Body")
  
   ##add by chenzhong begin
   ##在CALL UpdateOpBom之前把需要默认值的栏位l_checkHeadField,l_checkBodyField前面
 IF cl_null (hd_field) THEN 
   LET l_checkHeadField = l_checkHeadField
 ELSE
   LET l_checkHeadField = hd_field,l_Separator,l_checkHeadField
 END IF 
 IF cl_null (bd_field) THEN 
   LET l_checkBodyField[1].FIELD = l_checkBodyField[1].FIELD
 ELSE
   LET l_checkBodyField[1].FIELD = bd_field,l_Separator,l_checkBodyField[1].FIELD
 END IF 
   ##add end 
            
  #取单头单身栏位对应值
  LET headNode = dataSetNode.getFirstChild()
  WHILE headNode IS NOT NULL
    WHILE headNode.getTagName() <> "Head"
       LET headNode = headNode.getNext()
    END WHILE
    LET l_checkHeadData=''
    CALL l_checkBodyData.CLEAR()
    LET l_checkHeadData = headNode.getAttribute("Data")
    
    ##add by chenzhong
 IF cl_null (hd_data) THEN 
    LET l_checkHeadData = l_checkHeadData
 ELSE
    LET l_checkHeadData = hd_data,l_Separator,l_checkHeadData
 END IF 
    ##add end
     
    ##add by chenzhong  begin 
    ##通过bma05 给bmb04赋值
    LET f_tok = base.StringTokenizer.createExt(l_checkHeadField,l_Separator,"",TRUE)
    LET d_tok = base.StringTokenizer.createExt(l_checkHeadData,l_Separator,"",TRUE)
    WHILE f_tok.hasMoreTokens()
       LET l_field = f_tok.nextToken()
       LET l_data = d_tok.nextToken()
       IF l_field ='bma05' THEN 
          EXIT WHILE 
       END IF 
    END WHILE
#    LET l_checkBodyField[1].FIELD =l_checkBodyField[1].FIELD,l_Separator,"bmb04"
    ##add end
      
    LET bodyNode=headNode.getFirstChild()
    LET l_bodyCount=1
    WHILE bodyNode IS NOT NULL
       WHILE bodyNode.getTagName() <> "Body"
          LET bodyNode = bodyNode.getNext()
       END WHILE
       LET l_checkBodyData[l_bodyCount].DATA=bodyNode.getAttribute("Data")
       ##add by chenzhong 
     IF cl_null (bd_data) THEN 
       LET l_checkBodyData[l_bodyCount].DATA=l_checkBodyData[l_bodyCount].DATA
     ELSE
       LET l_checkBodyData[l_bodyCount].DATA=bd_data,l_Separator,l_checkBodyData[l_bodyCount].DATA
     END IF 
       LET l_checkBodyData[l_bodyCount].DATA = l_checkBodyData[l_bodyCount].DATA
       LET bf_tok =base.StringTokenizer.createExt(l_checkBodyField[1].FIELD,l_Separator,"",TRUE)
       LET bd_tok =base.StringTokenizer.createExt(l_checkBodyData[l_bodyCount].DATA,l_Separator,"",TRUE)
       WHILE bf_tok.hasMoreTokens()
           LET b_field = bf_tok.nextToken()
           LET b_data = bd_tok.nextToken()
           IF b_field ='bmb10' THEN 
              LET l_bmb10 = b_data
           END IF 
        
          IF b_field ='bmb03' THEN 
             LET l_bmb03 = b_data
          END IF  
          
          IF NOT cl_null(l_bmb03) AND NOT cl_null(l_bmb10) THEN 
              SELECT  ima25 INTO l_ima25 FROM ima_file where ima01 =l_bmb03
              CALL s_umfchk(l_bmb03,l_bmb10,l_ima25) RETURNING l_flag,l_bmb10_fac
              IF l_flag=1 THEN 
                 LET l_bmb10_fac=1 
              ELSE
                 LET l_bmb10_fac=1 
              END IF
              EXIT WHILE
          END IF	 
       END WHILE
       LET   l_checkBodyData[l_bodyCount].DATA = l_checkBodyData[l_bodyCount].DATA
       ##add end 
       LET l_bodyCount=l_bodyCount+1
       LET bodyNode = bodyNode.getNext()
    END WHILE
        
    CALL UpdateOpBom(l_Separator,'',l_checkHeadField,l_checkHeadData,l_checkBodyField,l_checkBodyData)
    RETURNING l_errCode,l_errDesc                                     #l_tag为0没有出错，为-1则出错，且errcode不为空，为错误码
    IF l_errCode IS NOT NULL THEN
       EXIT WHILE
    ELSE
    	LET HeadNode = HeadNode.getNext()
      CONTINUE WHILE
    END IF
  END WHILE
  IF cl_null(l_errCode) THEN
    COMMIT WORK
  END IF
  RETURN l_errCode,l_errDesc
END FUNCTION
#********************************************************
FUNCTION UpdateOpBom(l_sep,l_checkID,bHeadField,bHeadData,bBodyField,bBodyData)
DEFINE l_fen     SMALLINT                    #若为１则更改单头和单身若为2则更改单头若为3则更改单身不更改单头
DEFINE l_Operatecode  CHAR(20)               
DEFINE g_i         SMALLINT                  #自动分配单号的错误码
DEFINE l_sep               STRING            #分隔字符
DEFINE l_errCode STRING                      #用以返回错误码，为ze_file中的错误码
DEFINE l_errDesc STRING                      #用以返回错误描述，若是系统中有的错误，则为错误代码，如mfg0077，若非系统中的错误，则为详细描述
DEFINE bBodyField  DYNAMIC ARRAY OF RECORD   #单身栏位
                     FIELD STRING
                   END RECORD,
       bBodyData   DYNAMIC ARRAY OF RECORD   #单身对应值
                     DATA STRING
                   END RECORD,
       l_checkID   DYNAMIC ARRAY OF RECORD   #标ID 对应传入的记录，若有单头l_checkID[1].ID,其余为单身的ID 
                     ID   STRING
                   END RECORD
DEFINE bHeadField          STRING,
       bHeadData           STRING
DEFINE arr_data    DYNAMIC ARRAY OF RECORD
       tables        STRING,
       fields        STRING,
       data          STRING,
       body            DYNAMIC ARRAY OF RECORD
         tables        STRING,
         fields        STRING,
         data          STRING,
         detail           DYNAMIC ARRAY OF RECORD
           tables         STRING,
           fields         STRING,
           data           STRING,
           subdetail        DYNAMIC ARRAY OF RECORD
             tables           STRING,
             fields           STRING,
             data             STRING
                            END RECORD       
                          END RECORD
                       END RECORD
                   END RECORD
                  
 INITIALIZE g_bmb[1].* TO NULL
 INITIALIZE g_bma.* TO NULL
 INITIALIZE g_bma_o.* TO NULL
 INITIALIZE g_bmb_o.* TO NULL
 INITIALIZE g_bmx.* TO NULL
 INITIALIZE g_bmb_t.* TO NULL
 INITIALIZE g_bma_t.* TO NULL
 LET l_errCode = NULL
 LET l_errDesc = NULL

 CALL bmx_default()
#Add By chenzhong 20071008
 SELECT * INTO g_aza.* FROM aza_file WHERE aza01='0'
 IF SQLCA.SQLCODE THEN
    RETURN 'aws-227','单别与单号码数无设定，请到%1(aoos010)设定'
 END IF    
   CASE g_aza.aza41                    
      WHEN "1"   LET g_doc_len = 3      
                 LET g_no_sp = 3 + 2     
      WHEN "2"   LET g_doc_len = 4        
                 LET g_no_sp = 4 + 2       
      WHEN "3"   LET g_doc_len = 5          
                 LET g_no_sp = 5 + 2         
   END CASE                                   
   CASE g_aza.aza42                            
      WHEN "1"   LET g_no_ep = g_doc_len + 1 + 8
      WHEN "2"   LET g_no_ep = g_doc_len + 1 + 9
      WHEN "3"   LET g_no_ep = g_doc_len + 1 + 10
   END CASE                      

 CALL s_check_no("abm",g_bmx.bmx01,"","1","bmx_file","bmx001","")
      RETURNING g_i,g_bmx.bmx01 
 IF NOT g_i THEN
    RETURN 'aws-228','单据编号检查错误'
 END IF    

 CALL s_auto_assign_no("abm",g_bmx.bmx01,g_bmx.bmx02,"1","bmx_file","bmx01","","","") RETURNING g_i,g_bmx.bmx01 
#End Add
# CALL s_smyauno(g_bmx.bmx01,g_bmx.bmx02) RETURNING g_i,g_bmx.bmx01
 IF NOT g_i THEN
    ROLLBACK WORK
    RETURN 'aws-226','ECN单号自动生成错误'
 END IF    
 LET l_headi=2
 LET l_fen=1
 CALL g_bmb.CLEAR()
 CALL bomInit(l_sep,bHeadField,bHeadData,bBodyField,bBodyData)
 
 #若无值
#IF g_bma.bma01 IS NULL AND g_bmb[1].bmb_pdm_rowid IS NULL THEN
 IF g_bma.bma01 IS NULL AND g_bmb[1].bmb03 IS NULL THEN
    ROLLBACK WORK
    RETURN 'aws-226','主件料号为空且bmb_pdm_rowid为空'
 END IF
 
 #若单头无值
#IF g_bma.bma01 IS NULL AND NOT cl_null(g_bmb[1].bmb_pdm_rowid) THEN
 IF g_bma.bma01 IS NULL AND NOT cl_null(g_bmb[1].bmb03) THEN
    LET l_fen=3
 END IF
 
 #若单身无值单头有，只修改单头
#IF g_bma.bma01 IS NOT NULL AND g_bmb[1].bmb_pdm_rowid IS NULL THEN
 IF g_bma.bma01 IS NOT NULL AND g_bmb[1].bmb03 IS NULL THEN
    LET l_fen=2
 END IF
 
 #若数据库中不存在穿来的单头，则调用其他函数新增，不在此处理
 IF NOT cl_null(g_bma.bma01) THEN
    LET i=1
    SELECT COUNT(*) INTO i FROM bma_file WHERE bma01=g_bma.bma01
    IF i=0 THEN
       CALL arr_data.CLEAR()
       LET arr_data[1].tables = "bma_file"
       LET arr_data[1].fields = bHeadField
       LET arr_data[1].data = bHeadData
       LET j=1
      #WHILE NOT cl_null(g_bmb[j].bmb_pdm_rowid)
       WHILE NOT cl_null(g_bmb[j].bmb03)
          LET arr_data[1].body[j].tables = "bmb_file"
          LET arr_data[1].body[j].fields = bBodyField[1].FIELD
          LET arr_data[1].body[j].data = bBodyData[j].DATA
          LET j=j+1
       END WHILE
       
       #本来用于控制在调用DB_INSERT不传入空置
       #但DB_INSERT改为可传空值
       CALL arr_data[1].body.deleteElement(j)           
       CALL BeforeOperation("BOM","INSERT",l_Sep,arr_data,1) RETURNING l_errCode,l_errDesc 
       IF NOT cl_null(l_errCode) THEN
          ROLLBACK WORK
          RETURN l_errCode,l_errDesc
       ELSE
       	  CALL DB_INSERT("BOM",l_Sep,arr_data,1,"YYYY-MM-DD HH24:MI:SS") RETURNING l_errCode,l_errDesc
       	  IF NOT cl_null(l_errCode) THEN
       	     ROLLBACK WORK
       	     RETURN l_errCode,l_errDesc
       	  ELSE
       	     CALL AfterOperation("BOM","INSERT",l_Sep,arr_data,1) RETURNING l_errCode,l_errDesc
       	     IF NOT cl_null(l_errCode) THEN
       	        ROLLBACK WORK
       	        RETURN l_errCode,l_errDesc
       	     END IF
       	     RETURN l_errCode,l_errDesc 
       	  END IF  
       END IF 
    END IF
 END IF
#对调用UpdateBOM删除的不予处理
#是否UpdateBom的管控END
 CASE l_fen
    WHEN 3       
       LET i=1
      #WHILE NOT cl_null(g_bmb[i].bmb_pdm_rowid)
       WHILE NOT cl_null(g_bmb[i].bmb03)
       #FOR i=1 TO g_bmb.getLenth()
         #IF NOT cl_null(g_bmb[i].bmb_pdm_rowid) THEN
          IF NOT cl_null(g_bmb[i].bmb03) THEN
             SELECT * INTO g_bmb_o.* FROM bmb_file
              #WHERE bmb_pdm_rowid=g_bmb[i].bmb_pdm_rowid
              WHERE bmb01=g_bmb[i].bmb01 AND bmb03=g_bmb[i].bmb03    #Add By bugbin080825
                AND (bmb04<=TODAY OR bmb04 IS NULL)   #Add By bugbin080825
                AND (bmb05> TODAY OR bmb05 IS NULL)   #Add By bugbin080825
             IF NOT cl_null(SQLCA.SQLCODE) THEN
                CASE SQLCA.SQLCODE
                   WHEN 100
                      LET g_bmy03_t='2'
                      LET g_bmb_t.* =g_bmb[i].*
                      CALL OperateEcn() RETURNING l_Operatecode,l_errcode            #新元件新增
                      IF cl_null(l_errcode) THEN
                         CALL adjustbmt() RETURNING l_errcode,l_errDesc
                      END IF
                      IF cl_null(l_Operatecode) THEN
                         LET i=i+1
                         CONTINUE WHILE
                         #CONTINUE FOR
                         #RETURN 0
                      ELSE
                      	 CALL errZhuhe("bmb_file",bBodyField[1].FIELD,bBodyData[i].DATA,l_errcode,"DB err!")
                      	 RETURNING l_errDesc
                      	 ROLLBACK WORK
                  	     RETURN 'aws-208',l_errDesc
                      END IF
                   OTHERWISE
                      CALL errZhuhe("bmb_file",bBodyField[1].FIELD,bBodyData[i].DATA,SQLCA.SQLCODE,"DB err!")
                      RETURNING l_errDesc
                      ROLLBACK WORK
                      RETURN 'aws-210',l_errDesc
                END CASE
             END IF
             LET g_bmy03_t='3'
             CALL CompareBomBody(g_bmb[i].*,g_bmb_o.*) RETURNING l_check                            #rowid在tiptop中存在，旧元件更改
             IF l_check==0 THEN
                LET i=i+1
                CONTINUE WHILE
                #CONTINUE FOR
             END IF
             CALL OperateEcn() RETURNING l_Operatecode,l_errcode
             IF cl_null(l_errcode) THEN
                CALL adjustbmt() RETURNING l_Operatecode,l_errcode 
             END IF
             #CALL OperateEcn()　RETURNING l_Operatecode,l_errcode          #利用全局g_bmb_t操作,此时其为更改后的值
             IF cl_null(l_Operatecode) THEN
                LET i=i+1
                CONTINUE WHILE
                #CONTINUE FOR
                #RETURN 0
             ELSE
             	  CALL errZhuhe("bmb_file",bBodyField[1].FIELD,bBodyData[i].DATA,l_errcode,"DB err!")
                RETURNING l_errDesc
                ROLLBACK WORK
                RETURN 'aws-210',l_errDesc
             END IF
          END IF
          LET i=i+1
       END WHILE
       #END FOR
       #若单头未传入，不操作                                           #旧元件失效
    WHEN 2
       IF NOT cl_null(g_bma.bma01) THEN
          SELECT * INTO g_bma_o.* FROM bma_file
           WHERE bma01=g_bma.bma01
          IF SQLCA.SQLCODE THEN
             CALL errZhuhe("bma_file",bHeadField,bHeadData,SQLCA.SQLCODE,"DB err!")
             RETURNING l_errDesc
             ROLLBACK WORK       
             RETURN 'aws-210',l_errDesc
          END IF
          CALL CompareBomHead(g_bma.*,g_bma_o.*) RETURNING l_check
          IF l_check==0 THEN
             RETURN 0,''
          END IF
          UPDATE bma_file SET bma_file.*=g_bma_t.*
          IF SQLCA.SQLCODE THEN
             CALL errZhuhe("bma_file",bHeadField,bHeadData,SQLCA.SQLCODE,"DB err!")
             RETURNING l_errDesc
             ROLLBACK WORK
             RETURN 'aws-210',l_errDesc
          ELSE
          	 RETURN 0,''
          END IF
       END IF
    WHEN 1
       WHILE TRUE
          IF NOT cl_null(g_bma.bma01) THEN
             SELECT * INTO g_bma_o.* FROM bma_file
              WHERE bma01=g_bma.bma01
             IF SQLCA.SQLCODE THEN
                CALL errZhuhe("bma_file",bHeadField,bHeadData,SQLCA.SQLCODE,"DB err!")
                RETURNING l_errDesc
                ROLLBACK WORK       
                RETURN 'aws-210',l_errDesc
             END IF
             CALL CompareBomHead(g_bma.*,g_bma_o.*) RETURNING l_check
             IF l_check==0 THEN
                EXIT WHILE
                #RETURN 0,''
             END IF
             #bom头除主键外的小修改
             UPDATE bma_file SET bma02=g_bma_t.bma02,bma03=g_bma_t.bma03,
             bma04=g_bma_t.bma04,bma05=g_bma_t.bma05,bmauser=g_bma_t.bmauser,
             bmagrup=g_bma_t.bmagrup,bmamodu=g_bma_t.bmamodu,bmadate=g_bma_t.bmadate,
             bmaacti=g_bma_t.bmaacti
             WHERE bma01=g_bma_t.bma01
             IF SQLCA.SQLCODE THEN
                CALL errZhuhe("bma_file",bHeadField,bHeadData,SQLCA.SQLCODE,"DB err!")
                RETURNING l_errDesc
                ROLLBACK WORK       
                RETURN 'aws-210',l_errDesc
             ELSE
             	 EXIT WHILE
             	 #RETURN 0,''
             END IF
          END IF
       END WHILE
       LET i=1
      #WHILE NOT cl_null(g_bmb[i].bmb_pdm_rowid)
       WHILE NOT cl_null(g_bmb[i].bmb03)
       #FOR i=1 TO g_bmb.getLenth()
         #IF NOT cl_null(g_bmb[i].bmb_pdm_rowid) THEN
          IF NOT cl_null(g_bmb[i].bmb03) THEN
             SELECT * INTO g_bmb_o.* FROM bmb_file
              #WHERE bmb_pdm_rowid=g_bmb[i].bmb_pdm_rowid
              WHERE bmb01=g_bmb[i].bmb01 AND bmb03=g_bmb[i].bmb03    #Add By bugbin080825
                AND (bmb04<=TODAY OR bmb04 IS NULL)   #Add By bugbin080825
                AND (bmb05> TODAY OR bmb05 IS NULL)   #Add By bugbin080825
             IF SQLCA.SQLCODE THEN
                CASE SQLCA.SQLCODE
                   WHEN 100
                      LET g_bmy03_t='2'
                      LET g_bmb_t.* =g_bmb[i].*
                      CALL OperateEcn() RETURNING l_Operatecode,l_errcode            #新元件新增
                      IF cl_null(l_errcode) THEN
                         CALL adjustbmt() RETURNING l_Operatecode,l_errcode 
                      END IF
                      IF cl_null(l_Operatecode) THEN
                         LET i=i+1
                         CONTINUE WHILE
                         #CONTINUE FOR
                         #RETURN 0
                      ELSE
                      	 CALL errZhuhe("bmb_file",bBodyField[1].FIELD,bBodyData[i].DATA,l_errcode,"DB err!")
                         RETURNING l_errDesc
                         ROLLBACK WORK
                         RETURN 'aws-210',l_errDesc
                      END IF
                   OTHERWISE
                      CALL errZhuhe("bmb_file",bBodyField[1].FIELD,bBodyData[i].DATA,SQLCA.SQLCODE,"DB err!")
                      RETURNING l_errDesc
                      ROLLBACK WORK
                      RETURN 'aws-210',l_errDesc
                END CASE
             END IF
             LET g_bmy03_t='3'
             CALL CompareBomBody(g_bmb[i].*,g_bmb_o.*) RETURNING l_check  #rowid在tiptop中存在，旧元件更改
             IF l_check==0 THEN                                           
                LET i=i+1                                                 
                CONTINUE WHILE                                            
                #CONTINUE FOR                                             
             END IF                                                       
             CALL OperateEcn() RETURNING l_Operatecode,l_errcode          
             IF cl_null(l_errcode) THEN
                CALL adjustbmt() RETURNING l_Operatecode,l_errcode 
             END IF
             #CALL OperateEcn()　RETURN l_Operatecode,l_errcode           #利用全局g_bmb_t操作,此时其为更改后的值
             IF cl_null(l_Operatecode) THEN
                LET i=i+1
                CONTINUE WHILE
                #CONTINUE FOR
                #RETURN 0
             ELSE
             	  CALL errZhuhe("bmb_file",bBodyField[1].FIELD,bBodyData[i].DATA,l_errcode,"DB err!")
                RETURNING l_errDesc
                ROLLBACK WORK
                RETURN 'aws-210',l_errDesc
             END IF
          END IF
          LET i=i+1
       END WHILE
       #END FOR                            
       #旧元件失效
       #DECLARE bom_curs CURSOR FOR SELECT bmb_pdm_rowid FROM bmb_file
       DECLARE bom_curs CURSOR FOR SELECT bmb03 FROM bmb_file
                                    WHERE bmb01=g_bma.bma01
                                      AND (bmb04 IS NULL OR bmb04<=TODAY)   ##modify by chenzhong
                                      AND (bmb05 IS NULL OR bmb05 >TODAY)   ##modify by chenzhong
          LET i=1    ##by chenzhong 071011
       #FOREACH bom_curs INTO g_bmb_pdm_rowid
       FOREACH bom_curs INTO g_bmb_bmb03 
          LET l_check=1  
          LET i=1   ##by chenzhong 071011
         #WHILE NOT cl_null(g_bmb[i].bmb_pdm_rowid)
          WHILE NOT cl_null(g_bmb[i].bmb03)
             #IF g_bmb[i].bmb_pdm_rowid=g_bmb_pdm_rowid THEN
             IF g_bmb[i].bmb03=g_bmb_bmb03 THEN
                LET l_check=0
                LET i=i+1  #Add By chenzhong 071011
                EXIT WHILE
             END IF
             LET i=i+1
          END WHILE

          IF l_check==1 THEN             #该bmb_pdm_rowid在数据库中不存在
             LET g_bmy03_t='1'
             SELECT * INTO g_bmb_t.* FROM bmb_file
              #WHERE bmb_pdm_rowid = g_bmb_pdm_rowid
              WHERE bmb01=g_bma.bma01 AND bmb03=g_bmb_bmb03 
               AND (bmb04 IS NULL OR bmb04<=TODAY)   ##modify by chenzhong
               AND (bmb05 IS NULL OR bmb05 >TODAY)   ##modify by chenzhong
             CALL OperateEcn() RETURNING l_Operatecode,l_errcode
             IF cl_null(l_errcode) THEN
                CALL adjustbmt() RETURNING l_Operatecode,l_errcode 
             END IF
             IF cl_null(l_Operatecode) THEN
                 CONTINUE FOREACH
                 #RETURN 0
             ELSE
             	   CALL errZhuhe("bmb_file",bBodyField[1].FIELD,bBodyData[i].DATA,l_errcode,"DB err!")
                 RETURNING l_errDesc
                 ROLLBACK WORK
                 RETURN 'aws-210',l_errDesc
             END IF
          END IF
       END FOREACH
 END CASE
# COMMIT WORK
 RETURN l_errCode,l_errDesc
END FUNCTION
#************************************************************
FUNCTION OperateEcn()
DEFINE l_OperateCode SMALLINT
DEFINE l_sql         STRING
DEFINE l_bmz_n       SMALLINT

LET l_OperateCode=NULL
IF l_headi!=1 THEN
   INSERT INTO bmx_file VALUES(g_bmx.*)
   IF SQLCA.SQLCODE THEN
         LET l_OperateCode=1
         RETURN l_OperateCode,SQLCA.SQLCODE
   END IF
   LET l_headi=1
END IF
CASE 
   WHEN g_bmy03_t='1'
      CALL bmy_default()
      INSERT INTO bmy_file VALUES(g_bmy.*)
      IF SQLCA.SQLCODE THEN
         LET l_OperateCode=1
         RETURN l_OperateCode,SQLCA.SQLCODE
      END IF
      SELECT COUNT(*) INTO l_bmz_n FROM bmz_file WHERE bmz01=g_bmx.bmx01 AND bmz02=g_bma.bma01 
      IF l_bmz_n==0 THEN
         CALL bmz_default()
         INSERT INTO bmz_file VALUES(g_bmz.*)
         IF SQLCA.SQLCODE THEN
            LET l_OperateCode=1
            RETURN l_OperateCode,SQLCA.SQLCODE
         END IF
      END IF
   WHEN g_bmy03_t='2'
      CALL bmy_default()
      IF cl_null(g_bmy.bmy01) THEN  
         #CALL cl_err('','',1)
         LET l_OperateCode=1
         RETURN l_OperateCode,"ECN NO IS NULL"
      END IF
      INSERT INTO bmy_file VALUES(g_bmy.*)
      IF SQLCA.SQLCODE THEN
         LET l_OperateCode=1
         RETURN l_OperateCode,SQLCA.SQLCODE
      END IF
      SELECT COUNT(*) INTO l_bmz_n FROM bmz_file WHERE bmz01=g_bmx.bmx01 AND bmz02=g_bma.bma01 
      IF l_bmz_n==0 THEN
         CALL bmz_default()
         IF cl_null(g_bmz.bmz01) THEN  
            LET l_OperateCode=1
            RETURN l_OperateCode,"ECN NO IS NULL"
         END IF
         INSERT INTO bmz_file VALUES(g_bmz.*)
         IF SQLCA.SQLCODE THEN
            LET l_OperateCode=1
            RETURN l_OperateCode,SQLCA.SQLCODE
         END IF
      END IF
   WHEN g_bmy03_t='3'
      CALL bmy_default()
      IF cl_null(g_bmy.bmy01) THEN
         #CALL cl_err('','',1)
         LET l_OperateCode=1
         RETURN l_OperateCode,"ECN NO IS NULL"
      END IF
      INSERT INTO bmy_file VALUES(g_bmy.*)
      IF SQLCA.SQLCODE THEN
         LET l_OperateCode=1
         RETURN l_OperateCode,SQLCA.SQLCODE
      END IF
      SELECT COUNT(*) INTO l_bmz_n FROM bmz_file WHERE bmz01=g_bmx.bmx01 AND bmz02=g_bma.bma01 
      IF l_bmz_n==0 THEN
         CALL bmz_default()
         IF cl_null(g_bmz.bmz01) THEN
            LET l_OperateCode=1
            RETURN l_OperateCode,"ECN NO IS NULL"
         END IF
         INSERT INTO bmz_file VALUES(g_bmz.*)
         IF SQLCA.SQLCODE THEN
            LET l_OperateCode=1
            RETURN l_OperateCode,SQLCA.SQLCODE
         END IF
      END IF
END CASE
RETURN l_OperateCode,''
END FUNCTION

#add by bugbin for bmb13 080820 begin
FUNCTION adjustbmt()
DEFINE l_bmt_count         SMALLINT
DEFINE l_bmt_rowid         LIKE type_file.chr18 
DEFINE l_sql,l_errDesc     STRING

 IF NOT cl_null(l_bmb13_tmp_data[i]) THEN
    LET l_bmb13_length = l_bmb13_tmp_data[i].getLength()
    IF l_bmb13_length>80 THEN 
       LET l_bmb13_Sep=','
       CALL aws_Tokenizer(l_bmb13_tmp_data[i],l_bmb13_Sep,bmt_arr_data)
       FOR l_bmt_i = 1 TO bmt_arr_data.getLength()
          LET l_bmt_tmp_data = bmt_arr_data[l_bmt_i]
          IF cl_null(l_bmt_data) THEN
             LET l_bmt_data=l_bmt_tmp_data
          ELSE
             LET l_bmt_data=l_bmt_data,",",l_bmt_tmp_data
          END IF 
          IF (l_bmt_i mod 11)==0 AND l_bmt_i!=bmt_arr_data.getLength() THEN 
         #IF (l_bmt_i mod (80/(l_bmt_tmp_data.getLength()+1)))==0 AND l_bmt_i!=bmt_arr_data.getLength() THEN 
             LET l_bmt_n=(l_bmt_i/11)
            #LET l_bmt_n=(l_bmt_i/(80/(l_bmt_tmp_data.getLength()+1)))
             LET l_bmt[l_bmt_n].bmt06=l_bmt_data
             LET l_bmt[l_bmt_n].bmt07=11
            #LET l_bmt[l_bmt_n].bmt07=(80/(l_bmt_tmp_data.getLength()+1))
             LET l_bmt[l_bmt_n].bmt05=(l_bmt_n*10)
             LET l_bmt_data=''                #clear l_bmt_data for next bmt06
          ELSE 
             IF l_bmt_i==bmt_arr_data.getLength() THEN 
                LET l_bmt_n=l_bmt_n+1
                LET l_bmt[l_bmt_n].bmt06=l_bmt_data
                LET l_bmt[l_bmt_n].bmt07=(l_bmt_i mod 11)
               #LET l_bmt[l_bmt_n].bmt07=(l_bmt_i mod (80/(l_bmt_tmp_data.getLength()+1)))
                LET l_bmt[l_bmt_n].bmt05=(l_bmt_n*10)
                LET l_bmt_data=''                #clear l_bmt_data for next bmt06
                LET l_bmt_total=l_bmt_n          #save the total lines of bmt_file to l_bmt_total for use to insert into bmt_file
                LET l_bmt_n=0
             END IF 
          END IF 
       END FOR 
    ELSE 
       LET l_bmt_n=1
       LET l_bmt[l_bmt_n].bmt05=(l_bmt_n*10)
       LET l_bmt[l_bmt_n].bmt06=l_bmb13_tmp_data[i]
       LET l_bmb13_Sep=','
       CALL aws_Tokenizer(l_bmb13_tmp_data[i],l_bmb13_Sep,bmt_arr_data)
       LET l_bmt[l_bmt_n].bmt07=bmt_arr_data.getLength()
       LET l_bmt_total=l_bmt_n          #save the total lines of bmt_file to l_bmt_total for use to insert into bmt_file
       LET l_bmt_n=0
    END IF 

    FOR l_bmt_n=1 TO l_bmt_total
       SELECT COUNT(*) INTO l_bmt_count FROM bmt_file WHERE bmt01=g_bmb[i].bmb01 AND bmt02=g_bmb[i].bmb02 AND bmt03=g_bmb[i].bmb03 AND bmt04=g_bmb[i].bmb04 AND bmt05=l_bmt[l_bmt_n].bmt05
       IF l_bmt_count=0 THEN
          {LET l_sql = "INSERT INTO bmt_file(bmt01,bmt02,bmt03,bmt04,bmt05,bmt06,bmt07,bmt08) values('",g_bmb[i].bmb01,"','",g_bmb[i].bmb02,"','",g_bmb[i].bmb03,"','",g_bmb[i].bmb04,"','",l_bmt[l_bmt_n].bmt05,"','",l_bmt[l_bmt_n].bmt06,"','",l_bmt[l_bmt_n].bmt07,"',' ')"
          PREPARE bmt_cs_insert FROM l_sql
          EXECUTE bmt_cs_insert}
          IF SQLCA.sqlcode THEN
             ROLLBACK WORK
             LET l_errDesc = 'insert into bmt_file failed, add by bugbin 080820 for bmb13'
             RETURN 'aws-9528',l_errDesc
          ELSE
             INSERT INTO bmw_file(bmw01,bmw02,bmw03,bmw04,bmw05) VALUES(g_bmy.bmy01,g_bmy.bmy02,l_bmt[l_bmt_n].bmt05,l_bmt[l_bmt_n].bmt06,l_bmt[l_bmt_n].bmt07) 
          END IF 
       ELSE
          IF l_bmt_count=1 THEN
             SELECT bmt_file.ROWID INTO l_bmt_rowid FROM bmt_file WHERE bmt01=g_bmb[i].bmb01 AND bmt02=g_bmb[i].bmb02 AND bmt03=g_bmb[i].bmb03 AND bmt04=g_bmb[i].bmb04 AND bmt05=l_bmt[l_bmt_n].bmt05
             SELECT bmt06 INTO l_bmt06_t FROM bmt_file WHERE ROWID=l_bmt_rowid 
             IF l_bmt06_t<>l_bmt[l_bmt_n].bmt06 THEN
                {DELETE FROM bmt_file WHERE ROWID=l_bmt_rowid
                LET l_sql = "INSERT INTO bmt_file(bmt01,bmt02,bmt03,bmt04,bmt05,bmt06,bmt07,bmt08) values('",g_bmb[i].bmb01,"','",g_bmb[i].bmb02,"','",g_bmb[i].bmb03,"','",g_bmb[i].bmb04,"','",l_bmt[l_bmt_n].bmt05,"','",l_bmt[l_bmt_n].bmt06,"','",l_bmt[l_bmt_n].bmt07,"',' ')"
                PREPARE bmt_cs_adjust FROM l_sql
                EXECUTE bmt_cs_adjust}
                IF SQLCA.sqlcode THEN
                   ROLLBACK WORK
                   LET l_errDesc = 'adjust bmt_file failed, add by bugbin 080820 for bmb13'
                   RETURN 'aws-9527',l_errDesc
                ELSE
                   INSERT INTO bmw_file(bmw01,bmw02,bmw03,bmw04,bmw05) VALUES(g_bmy.bmy01,g_bmy.bmy02,l_bmt[l_bmt_n].bmt05,l_bmt[l_bmt_n].bmt06,l_bmt[l_bmt_n].bmt07) 
                END IF 
             ELSE
                INSERT INTO bmw_file(bmw01,bmw02,bmw03,bmw04,bmw05) VALUES(g_bmy.bmy01,g_bmy.bmy02,l_bmt[l_bmt_n].bmt05,l_bmt[l_bmt_n].bmt06,l_bmt[l_bmt_n].bmt07) 
             END IF 
          END IF
          IF l_bmt_count>1 THEN
             {DELETE FROM bmt_file WHERE bmt01=g_bmb[i].bmb01 AND bmt02=g_bmb[i].bmb02 AND bmt03=g_bmb[i].bmb03 AND bmt04=g_bmb[i].bmb04 AND bmt05=l_bmt[l_bmt_n].bmt05
             LET l_sql = "INSERT INTO bmt_file(bmt01,bmt02,bmt03,bmt04,bmt05,bmt06,bmt07,bmt08) values('",g_bmb[i].bmb01,"','",g_bmb[i].bmb02,"','",g_bmb[i].bmb03,"','",g_bmb[i].bmb04,"','",l_bmt[l_bmt_n].bmt05,"','",l_bmt[l_bmt_n].bmt06,"','",l_bmt[l_bmt_n].bmt07,"',' ')"
             PREPARE bmt_adjust FROM l_sql
             EXECUTE bmt_adjust}
             IF SQLCA.sqlcode THEN
                ROLLBACK WORK
                LET l_errDesc = 'adjust bmt_file failed, add by bugbin 080820 for bmb13'
                RETURN 'aws-9527',l_errDesc
             ELSE
                INSERT INTO bmw_file(bmw01,bmw02,bmw03,bmw04,bmw05) VALUES(g_bmy.bmy01,g_bmy.bmy02,l_bmt[l_bmt_n].bmt05,l_bmt[l_bmt_n].bmt06,l_bmt[l_bmt_n].bmt07) 
             END IF 
          END IF
       END IF
    END FOR 
 END IF 

 RETURN '',''

END FUNCTION
#add by bugbin for bmb13 080820 end

#************************************************************
FUNCTION bmx_default()
DEFINE li_result STRING

 INITIALIZE g_bmx.* TO NULL
 LET g_bmx.bmx02 = TODAY
 LET g_bmx.bmx07 = TODAY
 LET g_bmx.bmx04 = 'N'
 LET g_bmx.bmx06 ='1'
 LET g_bmx.bmx05=''
 LET g_bmx.bmxuser=g_bma.bmauser
 LET g_bmx.bmxmodu=g_bma.bmauser
 LET g_bmx.bmxgrup=g_bma.bmagrup
 LET g_bmx.bmxdate=g_bma.bmadate
 LET g_bmx.bmxacti='Y'
 LET g_bmx.bmx09='0'
 #先给单头赋予单号，要求TIPTOP中存在’ECN'单别
 #若不存在会出错
 #LET g_bmx.bmx01='ECN-'
 LET g_bmx.bmx01='121-'
 SELECT smyapr INTO g_bmx.bmxmksg FROM smy_file 
  #WHERE smyslip = 'ECN'
   WHERE smyslip = '121'
END FUNCTION
#******************************************************************
FUNCTION bmy_default()
DEFINE l_bmx01 like bmx_file.bmx01
 INITIALIZE g_bmy.* TO NULL
 LET g_bmy.bmy01=g_bmx.bmx01
 #bmy02项次自动给为项次中最大值
 IF cl_null(g_bmy.bmy02) OR g_bmy.bmy02 = 0 THEN
    SELECT max(bmy02)+1 INTO g_bmy.bmy02
      FROM bmy_file WHERE bmy01 = g_bmx.bmx01
    IF g_bmy.bmy02 IS NULL THEN
       LET g_bmy.bmy02 = 1
    END IF
 END IF
 LET g_bmy.bmy03=g_bmy03_t
 LET g_bmy.bmy04=g_bmb_t.bmb02
 LET g_bmy.bmy05=g_bmb_t.bmb03
 LET g_bmy.bmy06=g_bmb_t.bmb06
 LET g_bmy.bmy07=g_bmb_t.bmb07
 LET g_bmy.bmy08=0
 LET g_bmy.bmy09=''
 LET g_bmy.bmy10=g_bmb_t.bmb10
 LET g_bmy.bmy10_fac=g_bmb_t.bmb10_fac
 LET g_bmy.bmy10_fac2=g_bmb_t.bmb10_fac2
 LET g_bmy.bmy11=g_bmb_t.bmb11
 LET g_bmy.bmy13=g_bmb_t.bmb13
 LET g_bmy.bmy14=g_bma.bma01
 #LET g_bmy.bmy15=g_bmb_t.bmb15
 LET g_bmy.bmy16=g_bmb_t.bmb16
 LET g_bmy.bmy18=g_bmb_t.bmb18
 LET g_bmy.bmy20=g_bmb_t.bmb19
 LET g_bmy.bmy21=g_bmb_t.bmb15
 LET g_bmy.bmy23=g_bmb_t.bmb28
 LET g_bmy.bmy25=g_bmb_t.bmb25
 LET g_bmy.bmy26=g_bmb_t.bmb26
 ##Add by chenzhong
 LET g_bmy.bmy29=' '
 ##End add
#LET g_bmy.bmy_pdm_rowid = g_bmb_t.bmb_pdm_rowid
 IF cl_null(g_bmy.bmy16) THEN LET g_bmy.bmy16 = '0' END IF 
 IF cl_null(g_bmy.bmy07) THEN LET g_bmy.bmy07 = 1 END IF 
 
 DECLARE bmx_cur CURSOR FOR 
   SELECT bmx01 FROM bmy_file,bmx_file WHERE bmx01=bmy01 AND bmx04='N' AND bmy14=g_bmy.bmy14 and bmx01 <> g_bmx.bmx01
 FOREACH bmx_cur INTO l_bmx01 
   UPDATE bmx_file SET bmx04='X',bmx09='9' WHERE bmx01=l_bmx01
   IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN      
   END IF    
 END FOREACH 
END FUNCTION

#******************************************************************
FUNCTION bmz_default()
 INITIALIZE g_bmz.* TO NULL
 LET g_bmz.bmz01=g_bmx.bmx01
 LET g_bmz.bmz02=g_bma.bma01
 #LET g_bmz.bmz04=g_bmy.bmy02
 LET g_bmz.bmz05=' '
 #LET g_bmz.bmz03=g_bmz.bmz04 CLIPPED,'1'
END FUNCTION
#************************************************************************

#************************************************************************
#l_sep,l_checkID,bHeadField,bHeadData,bBodyField,bBodyData
FUNCTION bomInit(l_sep,bHeadField,bHeadData,bBodyField,bBodyData) 
DEFINE tok   base.StringTokenizer
DEFINE head1    STRING                            #字段属性
DEFINE count1   SMALLINT                          
DEFINE l_detail SMALLINT                          
DEFINE field1,data1  DYNAMIC ARRAY OF STRING      #暂存字段#暂存数据
DEFINE l_sep               STRING                 #分隔字符
DEFINE bBodyField  DYNAMIC ARRAY OF RECORD        #单身栏位
                     FIELD STRING                 
                   END RECORD,                    
       bBodyData   DYNAMIC ARRAY OF RECORD        #单身对应值
                     DATA STRING
                   END RECORD
DEFINE bHeadField          STRING,
       bHeadData           STRING

 LET head1=bHeadField
 LET tok = base.StringTokenizer.createExt(head1,l_sep,"",TRUE)
 LET count1=tok.countTokens()
 WHILE tok.hasMoreTokens()
    LET i = tok.countTokens()
    LET field1[i] = tok.nextToken()
 END WHILE
 LET head1=bHeadData
 LET tok = base.StringTokenizer.createExt(head1,l_sep,"",TRUE)
 WHILE tok.hasMoreTokens()
    LET i = tok.countTokens()
    LET data1[i] = tok.nextToken()
 END WHILE
 
 #add by zqj 06/07/27若为'%%'则将之置空，就不影响操作
 FOR i=1 TO count1
    IF data1[i] = '%%' THEN
       LET data1[i] = NULL
    END IF
 END FOR
 #end add
 
 #给g_bma赋值
 FOR i=1 TO count1
    CASE field1[i]
       WHEN "bma01"
          LET g_bma.bma01=data1[i]
       WHEN "bma02"
          LET g_bma.bma02=data1[i]
       WHEN "bma03"
          LET g_bma.bma03=data1[i]
       WHEN "bma04"
          LET g_bma.bma04=data1[i]
       WHEN "bma05"
          #LET g_bma.bma05=data1[i]
          LET g_bma.bma05=''
       WHEN "bmauser"
          LET g_bma.bmauser=data1[i]
       WHEN "bmagrup"
          LET g_bma.bmagrup=data1[i]
       WHEN "bmamodu"
          LET g_bma.bmamodu=data1[i]
       WHEN "bmadate"
          LET g_bma.bmadate=data1[i]
       WHEN "bmaacti"
          LET g_bma.bmaacti=data1[i]
    END CASE
 END FOR
 
 #给g_bmb[i]赋值
 CALL field1.CLEAR()
 CALL data1.CLEAR()
 LET l_detail=1
 WHILE(bBodyData[l_detail].DATA IS NOT NULL) 
    LET head1=bBodyField[1].FIELD
    LET tok = base.StringTokenizer.createExt(head1,l_sep,"",TRUE)
    LET count1=tok.countTokens()
    WHILE tok.hasMoreTokens()
       LET i = tok.countTokens()
       LET field1[i] = tok.nextToken()
    END WHILE
    LET head1=bBodyData[l_detail].DATA
    LET tok = base.StringTokenizer.createExt(head1,l_sep,"",TRUE)
    WHILE tok.hasMoreTokens()
       LET i = tok.countTokens()
       LET data1[i] = tok.nextToken()
    END WHILE
    
    #add by zqj 06/07/27若为'%%'则将之置空，就不影响操作
    FOR i=1 TO count1
       IF data1[i] = '%%' THEN
          LET data1[i] = NULL
       END IF
    END FOR
    #end add
    
    FOR i=1 TO count1 
       CASE field1[i]
          WHEN "bmb01"
             LET g_bmb[l_detail].bmb01=data1[i]
          WHEN "bmb02"
             LET g_bmb[l_detail].bmb02=data1[i]
          WHEN "bmb03"
             LET g_bmb[l_detail].bmb03=data1[i]
          WHEN "bmb04"
             LET g_bmb[l_detail].bmb04=data1[i]
          WHEN "bmb05"
             LET g_bmb[l_detail].bmb05=data1[i]
          WHEN "bmb06"
             LET g_bmb[l_detail].bmb06=data1[i]
          WHEN "bmb07"
             LET g_bmb[l_detail].bmb07=data1[i]
          WHEN "bmb08"
             LET g_bmb[l_detail].bmb08=data1[i]
#Add By chenzhong
          WHEN "bmb09"
             LET g_bmb[l_detail].bmb09=data1[i]
          WHEN "bmb14"
             LET g_bmb[l_detail].bmb14=data1[i]
          WHEN "bmb15"
             LET g_bmb[l_detail].bmb15=data1[i]
          WHEN "bmb16"
             LET g_bmb[l_detail].bmb16=data1[i]
          WHEN "bmb17"
             LET g_bmb[l_detail].bmb17=data1[i]
          WHEN "bmb18"
             LET g_bmb[l_detail].bmb18=data1[i]
          WHEN "bmb19"
             LET g_bmb[l_detail].bmb19=data1[i]
          WHEN "bmb27"
             LET g_bmb[l_detail].bmb27=data1[i]
          WHEN "bmb28"
             LET g_bmb[l_detail].bmb28=data1[i]
          WHEN "bmb29"
             LET g_bmb[l_detail].bmb29=data1[i]
          WHEN "bmb31"
             LET g_bmb[l_detail].bmb31=data1[i]
          WHEN "bmb10_fac"
             LET g_bmb[l_detail].bmb10_fac=data1[i]
          WHEN "bmb10_fac2"
             LET g_bmb[l_detail].bmb10_fac2=data1[i]
#End Add
          WHEN "bmb10"
             LET g_bmb[l_detail].bmb10=data1[i]
          WHEN "bmb11"
             LET g_bmb[l_detail].bmb11=data1[i]
          WHEN "bmb13"
             LET g_bmb[l_detail].bmb13=data1[i]
             
             #add by bugbin for bmb13 080820 begin
             LET l_bmb13_tmp_data[l_detail]=data1[i]
             {LET l_bmb13_length = l_bmb13_tmp_data[l_detail].getLength()
             IF l_bmb13_length>80 THEN 
                LET l_bmb13_Sep=','
                CALL aws_Tokenizer(l_bmb13_tmp_data[l_detail],l_bmb13_Sep,bmt_arr_data)
                FOR l_bmt_i = 1 TO bmt_arr_data.getLength()
                   LET l_bmt_tmp_data = bmt_arr_data[l_bmt_i]
                   IF cl_null(l_bmt_data) THEN
                      LET l_bmt_data=l_bmt_tmp_data
                   ELSE
                      LET l_bmt_data=l_bmt_data,",",l_bmt_tmp_data
                   END IF 
                   IF (l_bmt_i mod 13)==0 AND l_bmt_i!=bmt_arr_data.getLength() THEN 
                      LET l_bmt_n=(l_bmt_i/13)
                      IF l_bmt_n==1 THEN 
                         LET g_bmb[l_detail].bmb13=l_bmt_data     #now the l_tmp_data is bmt_file first line data bmt06 for insert into bmb13 
                         LET l_bmt_i=bmt_arr_data.getLength()
                      END IF 
                      LET l_bmt_data=''                #clear l_bmt_data for next bmt06
                   ELSE 
                      IF l_bmt_i==bmt_arr_data.getLength() THEN 
                         LET l_bmt_data=''                #clear l_bmt_data for next bmt06
                      END IF 
                   END IF 
                END FOR 
             ELSE 
                LET g_bmb[l_detail].bmb13=data1[i]
             END IF}
             #add by bugbin for bmb13 080820 end

             
          #WHEN "PDM_ROWID"
             #LET g_bmb_rowid=data1[i]
          WHEN "bmbmodu"
             LET g_bmb[l_detail].bmbmodu=data1[i]
          WHEN "bmbdate"
             LET g_bmb[l_detail].bmbdate=data1[i]
          WHEN "bmbcomm"
             LET g_bmb[l_detail].bmbcomm=data1[i]
         #WHEN "bmb_pdm_rowid"
         #   LET g_bmb[l_detail].bmb_pdm_rowid=data1[i]
       END CASE

       IF g_bmb[l_detail].bmb10=='G' THEN
          SELECT ima25 INTO g_bmb[l_detail].bmb10 FROM ima_file WHERE ima01=g_bmb[l_detail].bmb03
       END IF

    END FOR
    
    LET l_detail=l_detail+1
 END WHILE
END FUNCTION

#*************************************************
#g_bmb_t存更改后的数据，返回０无更改，返回１有更改
FUNCTION CompareBomBody(l_bmb1,l_bmb2)
DEFINE l_bmb1    RECORD LIKE bmb_file.*,   #Pdm 资料	
       l_bmb2    RECORD LIKE bmb_file.*    #tiptop数据库中资料 
DEFINE l_bmb04   CHAR(8)                   #add by chenzhong
      
 IF l_bmb1.*==l_bmb2.* THEN
    RETURN 0
 END IF
 
 INITIALIZE g_bmb_t.* TO NULL
 LET g_bmb_t.*=l_bmb2.*	
 IF NOT cl_null(l_bmb1.bmb01) THEN
    IF cl_null(l_bmb2.bmb01) THEN
       LET g_bmb_t.bmb01=l_bmb1.bmb01
    ELSE
    	 IF l_bmb1.bmb01<>l_bmb2.bmb01 THEN 
    	    LET g_bmb_t.bmb01=l_bmb1.bmb01 
    	 END IF
    END IF 
 END IF
 {IF NOT cl_null(l_bmb1.bmb02) THEN
    IF cl_null(l_bmb2.bmb02) THEN
       LET g_bmb_t.bmb02=l_bmb1.bmb02
    ELSE
       IF l_bmb1.bmb02<>l_bmb2.bmb02 THEN 
          LET g_bmb_t.bmb02=l_bmb1.bmb02 
       END IF 
    END IF
 END IF}
 IF NOT cl_null(l_bmb1.bmb03) THEN
    IF cl_null(l_bmb2.bmb03) THEN
       LET g_bmb_t.bmb03=l_bmb1.bmb03
    ELSE
    	 IF l_bmb1.bmb03<>l_bmb2.bmb03 THEN 
    	    LET g_bmb_t.bmb03=l_bmb1.bmb03
    	 END IF 
    END IF
 END IF
{ IF NOT cl_null(l_bmb1.bmb04) THEN         
    IF cl_null(l_bmb2.bmb04) THEN                                   
       LET g_bmb_t.bmb04=l_bmb1.bmb04                               
    ELSE                                                             
       LET l_bmb04=l_bmb2.bmb04                      ###modify by chenzhong 
#    	 IF l_bmb1.bmb04<>l_bmb2.bmb04 THEN          ###modify by chenzhong
    	 IF l_bmb1.bmb04<>l_bmb04 THEN               ###modify by chenzhong
    	    LET g_bmb_t.bmb04=l_bmb1.bmb04 
    	 END IF 
    END IF
 END IF}
 IF NOT cl_null(l_bmb1.bmb05) THEN
    IF cl_null(l_bmb2.bmb05) THEN
       LET g_bmb_t.bmb05=l_bmb1.bmb05
    ELSE
    	 IF l_bmb1.bmb05<>l_bmb2.bmb05 THEN 
    	    LET g_bmb_t.bmb05=l_bmb1.bmb05 
    	 END IF 
    END IF
 END IF
 IF NOT cl_null(l_bmb1.bmb06) THEN 
    IF cl_null(l_bmb2.bmb06) THEN
       LET g_bmb_t.bmb06=l_bmb1.bmb06
    ELSE
    	 IF l_bmb1.bmb06<>l_bmb2.bmb06 THEN 
    	    LET g_bmb_t.bmb06=l_bmb1.bmb06 
    	 END IF 
    END IF
 END IF
 IF NOT cl_null(l_bmb1.bmb07) THEN
    IF cl_null(l_bmb2.bmb07) THEN
       LET g_bmb_t.bmb07=l_bmb1.bmb07
    ELSE
    	 IF l_bmb1.bmb07<>l_bmb2.bmb07 THEN 
    	    LET g_bmb_t.bmb07=l_bmb1.bmb07 
    	 END IF 
    END IF
 END IF         
 IF NOT cl_null(l_bmb1.bmb08) THEN 
    IF cl_null(l_bmb2.bmb08) THEN
       LET g_bmb_t.bmb08=l_bmb1.bmb08
    ELSE
    	 IF l_bmb1.bmb08<>l_bmb2.bmb08 THEN 
    	    LET g_bmb_t.bmb08=l_bmb1.bmb08 
    	 END IF 
    END IF
 END IF
 IF NOT cl_null(l_bmb1.bmb09) THEN 
    IF cl_null(l_bmb2.bmb09) THEN
       LET g_bmb_t.bmb09=l_bmb1.bmb09
    ELSE
    	 IF l_bmb1.bmb09<>l_bmb2.bmb09 THEN 
    	    LET g_bmb_t.bmb09=l_bmb1.bmb09 
    	 END IF 
    END IF
 END IF       
 IF NOT cl_null(l_bmb1.bmb10) THEN
    IF cl_null(l_bmb2.bmb10) THEN
       LET g_bmb_t.bmb10=l_bmb1.bmb10
    ELSE
    	 IF l_bmb1.bmb10<>l_bmb2.bmb10 THEN 
    	    LET g_bmb_t.bmb10=l_bmb1.bmb10 
    	 END IF 
    END IF
 END IF
 IF NOT cl_null(l_bmb1.bmb11) THEN 
    IF cl_null(l_bmb2.bmb11) THEN
       LET g_bmb_t.bmb11=l_bmb1.bmb11
    ELSE
    	 IF l_bmb1.bmb11<>l_bmb2.bmb11 THEN 
    	    LET g_bmb_t.bmb11=l_bmb1.bmb11 
    	 END IF 
    END IF
 END IF
 IF NOT cl_null(l_bmb1.bmb13) THEN
    IF cl_null(l_bmb2.bmb13) THEN
       LET g_bmb_t.bmb13=l_bmb1.bmb13
    ELSE 
    	 IF l_bmb1.bmb13<>l_bmb2.bmb13 THEN 
    	    LET g_bmb_t.bmb13=l_bmb1.bmb13 
    	 END IF 
    END IF
 END IF
 IF NOT cl_null(l_bmb1.bmb16) THEN
    IF cl_null(l_bmb2.bmb16) THEN
       LET g_bmb_t.bmb16=l_bmb1.bmb16
    ELSE 
    	 IF l_bmb1.bmb16<>l_bmb2.bmb16 THEN 
    	    LET g_bmb_t.bmb16=l_bmb1.bmb16 
    	 END IF 
    END IF
 END IF
 
 IF g_bmb_t.*!=l_bmb2.* THEN
    RETURN 1
 ELSE
 	 RETURN 0
 END IF
END FUNCTION
#*******************************************************
FUNCTION CompareBomHead(l_bma1,l_bma2)
DEFINE l_bma1     RECORD LIKE bma_file.*,   #pdm资料
       l_bma2     RECORD LIKE bma_file.*  #tiptop数据资料

 IF l_bma1.*=l_bma2.* THEN
    RETURN 0
 END IF
 INITIALIZE g_bma_t.* TO NULL
 LET g_bma_t.*=l_bma2.*
 IF NOT cl_null(l_bma1.bma01) THEN 
    IF l_bma1.bma01<>l_bma2.bma01 THEN 
       LET g_bma_t.bma01=l_bma1.bma01 
    END IF
 END IF
 IF NOT cl_null(l_bma1.bma02) THEN
    IF cl_null(l_bma2.bma02) THEN 
       LET g_bma_t.bma02=l_bma1.bma02 
    ELSE 
       IF l_bma1.bma02!=l_bma2.bma02 THEN 
          LET g_bma_t.bma02=l_bma1.bma02 
       END IF
    END IF
 END IF
 IF NOT cl_null(l_bma1.bma03) THEN
    IF cl_null(l_bma2.bma03) THEN
       LET g_bma_t.bma02=l_bma1.bma03
    ELSE
       IF l_bma1.bma03<>l_bma2.bma03 THEN 
          LET g_bma_t.bma03=l_bma1.bma03
       END IF 
    END IF
 END IF
 IF NOT cl_null(l_bma1.bma04) THEN
    IF cl_null(l_bma2.bma04) THEN
       LET g_bma_t.bma04=l_bma1.bma04
    ELSE
    	 IF l_bma1.bma04<>l_bma2.bma04 THEN
    	    LET g_bma_t.bma04=l_bma1.bma04
    	 END IF
    END IF
  END IF
 IF NOT cl_null(l_bma1.bma05) THEN
    IF cl_null(l_bma2.bma05) THEN
       LET g_bma_t.bma05=l_bma1.bma05
    ELSE
    	 IF l_bma1.bma05<>l_bma2.bma05 THEN
    	    LET g_bma_t.bma05=l_bma1.bma05 
    	 END IF 
    END IF
 END IF
 IF NOT cl_null(l_bma1.bmauser) THEN 
    IF cl_null(l_bma2.bmauser) THEN
       LET g_bma_t.bmauser=l_bma1.bmauser
    ELSE
    	 IF l_bma1.bmauser<>l_bma2.bmauser THEN 
    	    LET g_bma_t.bmauser=l_bma1.bmauser 
    	 END IF 
    END IF
 END IF
 IF NOT cl_null(l_bma1.bmagrup) THEN
    IF cl_null(l_bma2.bmagrup) THEN
       LET g_bma_t.bmagrup=l_bma1.bmagrup
    ELSE
    	 IF l_bma1.bmagrup<>l_bma2.bmagrup THEN 
    	    LET g_bma_t.bmagrup=l_bma1.bmagrup 
    	 END IF 
    END IF
 END IF          
 {IF NOT cl_null(l_bma1.bmadate) THEN
    IF cl_null(l_bma2.bmadate) THEN
       LET g_bma_t.bmadate=l_bma1.bmadate
    ELSE
    	 IF l_bma1.bmadate<>l_bma2.bmadate THEN 
    	    LET g_bma_t.bmadate=l_bma1.bmadate 
    	 END IF 
    END IF
 END IF}
 IF NOT cl_null(l_bma1.bmamodu) THEN
    IF cl_null(l_bma2.bmamodu) THEN
       LET g_bma_t.bmamodu=l_bma1.bmamodu
    ELSE
    	 IF l_bma1.bmamodu<>l_bma2.bmamodu THEN 
    	    LET g_bma_t.bmamodu=l_bma1.bmamodu 
    	 END IF 
    END IF
 END IF      
 IF NOT cl_null(l_bma1.bmaacti) THEN 
    IF cl_null(l_bma2.bmaacti) THEN
       LET g_bma_t.bmaacti=l_bma1.bmaacti
    ELSE
    	 IF l_bma1.bmaacti<>l_bma2.bmaacti THEN 
    	    LET g_bma_t.bmaacti=l_bma1.bmaacti 
    	 END IF 
    END IF
 END IF  
 IF g_bma_t.*!=l_bma2.* THEN
    RETURN 1
 ELSE
    RETURN 0
 END IF
END FUNCTION
#********************************************************      
#此functtion根据错误，
#生成类似<Table=”xxx” Field=”xxx|...|xxx” Data=”mmm|...|mmm” Code=”xxx” Desc=”xxx”/>
#的STRING
FUNCTION errZhuhe(table3e,field3e,data3e,code3e,desc3e)
DEFINE table3e     STRING,
       field3e     STRING,
       data3e      STRING,
       code3e      STRING,
       desc3e      STRING
DEFINE errstring   base.StringBuffer

 LET errstring = base.StringBuffer.CREATE()
 CALL errstring.append('<Row Table="'||table3e||'" Field="'||field3e||'" Data="'||data3e||'" Error="'||code3e||'" Desc="'||desc3e||'"/>')
 RETURN errstring.toString()
END FUNCTION
#*********************************************************
