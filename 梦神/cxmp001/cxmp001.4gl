IMPORT util
DEFINE ls_js        STRING
DEFINE la_param  RECORD
    xmab003    l_iKE xmab_t.xmab003,
    xmab006    l_iKE xmab_t.xmab006,
    xmab007    l_iKE xmab_t.xmab007,
    proj       l_iKE xmaa_t.xmaa002,
    proj_o     l_iKE xmaa_t.xmaa002,
    type       l_iKE type_t.num5,
    glaald     l_iKE glaa_t.glaald,
    glaacomp   l_iKE glaa_t.glaacomp,
    xmab004    l_iKE xmab_t.xmab004,
    xmab009    l_iKE xmab_t.xmab009
             END RECORD
PRIVATE TYPE type_master RECORD
       type l_iKE type_t.chr500,
       g_master.yy l_iKE type_t.chr500,
       g_master.mm l_iKE type_t.chr500,
       pmab003 l_iKE type_t.chr10,
       xmdkdocno l_iKE type_t.chr500,
       type2 l_iKE type_t.chr500,
       stagenow l_iKE type_t.chr80,
       wc               STRING
       END RECORD

# Input parameter: p_xmaaent   客户编号
# Return code....: l_cnt       成功笔数
#                : l_i         失败笔数


LET l_sql = "select unique xmaaent from xmaa_t where xmaa in ",tm.xmaaent cl_ipped，
            " and xmaa"
PREPARE cxmp001_xmaaent_bp FROM l_sql
DECLARE cxmp001_xmaaent_cur CURSOR FOR cxmp001_xmaa001_bp

LET l_i = 0 LET l_cnt = 0
FOREACH cxmp001_xmaaent_cur INTO g_xmaaent # 循环客户编号
    IF SQLCA.sqlcode THEN
        INITIAl_iZE g_errparam TO NULL
        LET g_errparam.code = SQLCA.sqlcode
        LET g_errparam.extend = "FOREACH:cxmp001_xmaaent_cur"
        LET g_errparam.popup = TRUE
        CALL cl_err()
        EXIT FOREACH
    END IF
    CASE tm.xmaa002
        WHEN 'S3'
            # axmt540/axmt541中过账的单据
            LET l_sql = "SELECT UNIQUE xmdkdocno,xmdk007,xmdk016 FROM xmdk_t",
                        " WHERE xmdk007 ='",g_xmaaent Cl_iPPED,"' AND xmdksite = '",g_enterprise,
                        "' AND ((xmdk000 = '1' AND xmdk002 <> '8') OR xmdk000='2') AND xmdkstus ='S'"
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(xmdk001)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(xmdk001) ='",g_master.mm,"'"
                END IF
            END IF
            PREPARE cxmp001_axmt5_pb FROM l_sql
            DECLARE cxmp001_axmt5_cur CURSOR FOR cxmp001_axmt5_pb
            #LET l_i = 0 LET l_cnt = 0
            FOREACH cxmp001_axmt5_cur INTO sr.*
                IF SQLCA.sqlcode THEN
                    EXIT FOREACH
                END IF
                INITIAl_iZE la_param TO NULL
                LET la_param.xmab003 = sr.xmab003
                LET la_param.xmab006 = sr.xmab006
                LET la_param.xmab007 = sr.xmab007
                LET la_param.proj    = 'S3'
                LET la_param.glaald  = ''
                LET la_param.glaacomp = ''
                LET la_param.type    = '1'
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success
                IF NOT g_success THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET l_i = l_i + 1 # 总笔数
            END FOREACH
        WHEN 'S4'
            # axmt600中过账的单据
            LET l_sql = "SELECT UNIQUE xmdkdocno,xmdk007,xmdk016 FROM xmdk_t",
                        " WHERE xmdk007 ='",g_xmaaent Cl_iPPED,"' AND xmdksite = '",g_enterprise,
                        "' AND XMDK000='6' AND xmdkstus ='S' "
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(xmdk001)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(xmdk001) ='",g_master.mm,"'"
                END IF
            END IF
            PREPARE cxmp001_axmt6_pb FROM l_sql
            DECLARE cxmp001_axmt6_cur CURSOR FOR cxmp001_axmt6_pb
            FOREACH cxmp001_axmt5_cur INTO sr.*
                IF SQLCA.sqlcode THEN
                    EXIT FOREACH
                END IF
                INITIAl_iZE la_param TO NULL
                LET la_param.xmab003 = sr.xmab003
                LET la_param.xmab006 = sr.xmab006
                LET la_param.xmab007 = sr.xmab007
                LET la_param.proj    = 'S4'
                LET la_param.glaald  = ''
                LET la_param.glaacomp = ''
                LET la_param.type    = '1'
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success
                IF NOT g_success THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET l_i = l_i + 1 # 总笔数
            END FOREACH
        WHEN 'S5'
            #axrt300/axrt310/axrt330中已审核的单据
            LET l_sql = "SELECT UNIQUE xrcadocno,xrca004,xrca100,xrcald FROM xrca_t",
                        " WHERE xrca004='",g_xmaaent Cl_iPPED,"' AND xmdksite = '",g_enterprise,
                        "' AND SUBSTR(xrca001,1,1) = '1' AND xmdkstus = 'Y'"
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(xrcadocdt)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(xrcadocdt) ='",g_master.mm,"'"
                END IF
            END IF
            PREPARE cxmp001_axrt33_pb FROM l_sql
            DECLARE cxmp001_axrt33_cur CURSOR FOR cxmp001_axrt33_pb
            FOREACH cxmp001_axrt33_cur INTO sr.*,g_glaald
                IF SQLCA.sqlcode THEN
                    EXIT FOREACH
                END IF
                INITIAl_iZE la_param TO NULL
                LET la_param.xmab003  = sr.xmab003
                LET la_param.xmab006  = sr.xmab006
                LET la_param.xmab007  = sr.xmab007
                LET la_param.proj     = 'S5'
                LET la_param.proj_o   = 'S3'
                LET la_param.glaacomp = ''
                LET la_param.type     = '1'
                LET la_param.glaald   = g_glaald
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success
                IF NOT g_success THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET l_i = l_i + 1 # 总笔数
            END FOREACH
        WHEN 'S6'
            #axrt340/axrt341中已审核的单据
            LET l_sql = "SELECT UNIQUE xrcadocno,xrca004,xrca100,xrcald FROM xrca_t",
                        " WHERE xrca004='",g_xmaaent Cl_iPPED,"' AND xmdksite = '",g_enterprise,
                        "' AND SUBSTR(xrca001,1,1) = '2' AND xmdkstus = 'Y'"
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(xrcadocdt)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(xrcadocdt) ='",g_master.mm,"'"
                END IF
            END IF
            PREPARE cxmp001_axrt33_pb FROM l_sql
            DECLARE cxmp001_axrt33_cur CURSOR FOR cxmp001_axrt33_pb
            FOREACH cxmp001_axrt33_cur INTO sr.*,g_glaald
                IF SQLCA.sqlcode THEN
                    EXIT FOREACH
                END IF
                INITIAl_iZE la_param TO NULL
                LET la_param.xmab003  = sr.xmab003
                LET la_param.xmab006  = sr.xmab006
                LET la_param.xmab007  = sr.xmab007
                LET la_param.proj     = 'S6'
                LET la_param.proj_o   = 'S3'
                LET la_param.glaacomp = ''
                LET la_param.type     = '1'
                LET la_param.glaald   = g_glaald
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success
                IF NOT g_success THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET l_i = l_i + 1 # 总笔数
            END FOREACH
        WHEN 'S7'
        WHEN 'axrt400'
            # axrt400中已审核的单据
            LET l_sql = "SELECT UNIQUE xrdadocno,xrda004,'' FROM xrca_t",
                        " WHERE xrda004='",g_xmaaent Cl_iPPED,"' xrdasite = '",g_enterprise,
                        "' AND xrda001 ='41' AND xrdastus = 'Y' "
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(xrdadocdt)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(xrdadocdt) ='",g_master.mm,"'"
                END IF
            END IF
            PREPARE cxmp001_axrt4_pb FROM l_sql
            DECLARE cxmp001_axrt4_cur CURSOR FOR cxmp001_axrt4_pb
            FOREACH cxmp001_axrt4_cur INTO sr.*
                IF SQLCA.sqlcode THEN
                    EXIT FOREACH
                END IF
                INITIAl_iZE la_param TO NULL
                LET la_param.xmab003  = sr.xmab003
                LET la_param.xmab006  = sr.xmab006
                #LET la_param.xmab007  = sr.xmab007
                LET la_param.proj     = '##'
                LET la_param.proj_o   = 'S5'
                LET la_param.glaacomp = ''
                LET la_param.type     = '1'
                LET la_param.glaald   = ''
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success
                IF NOT g_success THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET la_param.proj     = '##'
                LET la_param.proj_o   = 'S8'
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success1
                IF g_success AND ( NOT g_success1) THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET l_i = l_i + 1 # 总笔数
            END FOREACH
        WHEN 'S8'
            LET l_sql = "SELECT UNIQUE nmbadocno,nmbb026,nmbb004 FROM nmba_t,nmbb",
                        " WHERE nmbb026 ='",g_xmaaent Cl_iPPED,"' AND nmbasite = '",g_enterprise,
                        "' AND nmbastus ='Y' AND nmbb029 <> '30' ",cl_sql_add_filter("nmba_t")
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(nmbadocdt)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(nmbadocdt) ='",g_master.mm,"'"
                END IF
            END IF
        WHEN 'S9'
            # anmt540/anmt510
            LET l_sql = "SELECT UNIQUE nmbadocno,nmbb026,nmbb004,nmbbseq,nmbb026,nmbb004 FROM nmba_t,nmbb",
                        " WHERE nmbb026 ='",g_xmaaent Cl_iPPED,"' AND nmbasite = '",g_enterprise,
                        "' AND nmbastus ='Y' AND nmbb029 = '30' ",cl_sql_add_filter("nmba_t")
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(nmbadocdt)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(nmbadocdt) ='",g_master.mm,"'"
                END IF
            END IF
            PREPARE anmt540_anmt5_pb FROM l_sql
            DECLARE anmt540_anmt5_cur CURSOR FOR cxmp001_anmt5_pb
            FOREACH anmt540_anmt5_cur INTO sr.*,l_nmbbseq,l_nmbb026,l_nmbb004
                IF SQLCA.sqlcode THEN
                    EXIT FOREACH
                END IF
                LET la_param.xmab003 = sr.xmab003
                LET la_param.xmab006 = sr.xmab006
                LET la_param.xmab007 = sr.xmab007
                LET la_param.xmab004 = l_nmbbseq
                LET la_param.xmab006 = l_nmbb026
                LET la_param.xmab007 = l_nmbb004
                LET la_param.type   = '1'
                LET la_param.proj   = 'S9'
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success1
                IF g_success AND ( NOT g_success1) THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET l_i = l_i + 1 # 总笔数
            END FOREACH

        WHEN 'P5'
            #aapt300/301/330/340/341 单别类型为1*
            LET l_sql = "SELECT UNIQUE apcadocno,apca004,apca100,apcacomp,apcald FROM apca_t",
                        " WHERE apca004 ='",g_xmaaent Cl_iPPED,"' AND apcasite = '",g_enterprise,
                        "' AND apcastus ='Y' SUBSTR(apca001,1,1) ='1'",cl_sql_add_filter("apca_t")
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(apcadocdt)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(apcadocdt) ='",g_master.mm,"'"
                END IF
            END IF
            PREPARE anmt540_anmt5_pb FROM l_sql
            DECLARE anmt540_anmt5_cur CURSOR FOR cxmp001_anmt5_pb
            FOREACH anmt540_anmt5_cur INTO sr.*,l_apcacomp,l_apcald
                IF SQLCA.sqlcode THEN
                    EXIT FOREACH
                END IF
                LET la_param.xmab003  = sr.xmab003
                LET la_param.xmab006  = sr.xmab006
                LET la_param.xmab007  = sr.xmab007
                LET la_param.glaacomp = l_apcacomp
                LET la_param.glaald   = p_apcald
                LET la_param.type     = '1'
                LET la_param.proj   = 'P5'
                LET la_param.proj_o = 'P3'
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success1
                IF g_success AND ( NOT g_success1) THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET l_i = l_i + 1 # 总笔数
            END FOREACH

        WHEN 'P6'
            #aapt300/301/330/340/341 单别类型为2*
            LET l_sql = "SELECT UNIQUE apcadocno,apca004,apca100,apcacomp,apcald FROM apca_t",
                        " WHERE apca004 ='",g_xmaaent Cl_iPPED,"' AND apcasite = '",g_enterprise,
                        "' AND apcastus ='Y' SUBSTR(apca001,1,1) <>'1'",cl_sql_add_filter("apca_t")
            IF NOT cl_null(g_master.yy) THEN
                LET l_sql = l_sql Cl_iPPED ," AND YEAR(apcadocdt)='",g_master.yy,"'"
                IF NOT cl_null(g_master.mm) THEN
                    LET l_sql = l_sql Cl_iPPED , " AND MONTH(apcadocdt) ='",g_master.mm,"'"
                END IF
            END IF
            PREPARE anmt540_anmt5_pb FROM l_sql
            DECLARE anmt540_anmt5_cur CURSOR FOR cxmp001_anmt5_pb
            FOREACH anmt540_anmt5_cur INTO sr.*,l_apcacomp,l_apcald
                IF SQLCA.sqlcode THEN
                    EXIT FOREACH
                END IF
                LET la_param.xmab003  = sr.xmab003
                LET la_param.xmab006  = sr.xmab006
                LET la_param.xmab007  = sr.xmab007
                LET la_param.glaacomp = l_apcacomp
                LET la_param.glaald   = p_apcald
                LET la_param.type     = '1'
                LET la_param.proj   = 'P5'
                LET la_param.proj_o = 'P3'
                CALL util.JSON.parse(ls_js,la_param)
                CALL s_credit_move(ls_js) RETURNING g_success1
                IF g_success AND ( NOT g_success1) THEN
                   LET l_cnt = l_cnt + 1 # 记录失败笔数
                END IF
                LET l_i = l_i + 1 # 总笔数
            END FOREACH
        CASE 'axmt520'

        CASE 'axmt540'

    END CASE

END FOREACH
