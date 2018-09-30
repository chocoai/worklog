# Prog. Version..: '5.30.03-12.09.18(00007)'     #
#
# Pattern name...: ghrp056.4gl
# Descriptions...: 点名批处理作业
# Date & Author..: 13/07/17 By jiangxt
# Modify.........: by zhuzw 20150205 整体逻辑重写
DATABASE ds

GLOBALS "../../config/top.global"
DEFINE b_date  LIKE type_file.dat
DEFINE e_date  LIKE type_file.dat
DEFINE l_type  LIKE type_file.chr1
DEFINE g_date  LIKE type_file.dat
DEFINE g_date1 LIKE type_file.dat
DEFINE l_name  LIKE type_file.chr100
DEFINE l_namet LIKE type_file.chr100
DEFINE l_last  DYNAMIC ARRAY OF RECORD
       typtyp  LIKE type_file.chr100,
       valval  LIKE hrcp_file.hrcp11,
       valcha  LIKE hrcp_file.hrcp11,
       valchb  LIKE hrcp_file.hrcp11
               END RECORD
DEFINE g_hrbo  RECORD LIKE hrbo_file.*
DEFINE l_pro  LIKE type_file.num10
DEFINE g_hrat01 LIKE hrat_file.hrat01
DEFINE g_hrat02 LIKE hrat_file.hrat02
DEFINE g_hrat03 LIKE hrat_file.hrat03
DEFINE g_hratid LIKE hrat_file.hratid
DEFINE g_hrbk03 LIKE hrbk_file.hrbk03
DEFINE g_hrbn02 LIKE hrbn_file.hrbn02
DEFINE g_hrbo02 LIKE hrbo_file.hrbo02
DEFINE g_bgjob LIKE type_file.chr1
DEFINE g_hrby06 LIKE hrby_file.hrby06
DEFINE g_ff LIKE type_file.chr1     #add by wangwy 20160310 标记要不要显示加班刷卡
MAIN
DEFINE l_sql   STRING
DEFINE l_sql1   STRING
DEFINE l_num   LIKE type_file.num10
DEFINE l_hratid LIKE hrat_file.hratid
DEFINE l_hrby05 LIKE hrby_file.hrby05
DEFINE l_hrby06 LIKE hrby_file.hrby06
DEFINE l_hrby10 LIKE hrby_file.hrby10
DEFINE l_hrboa02  LIKE hrboa_file.hrboa02
DEFINE l_hrboa03  LIKE hrboa_file.hrboa03
DEFINE l_hrboa04  LIKE hrboa_file.hrboa04
DEFINE l_hrboa05  LIKE hrboa_file.hrboa05
DEFINE l_hrboa06  LIKE hrboa_file.hrboa06
DEFINE l_hrboa07  LIKE hrboa_file.hrboa07
DEFINE l_hrbo06   LIKE hrbo_file.hrbo06
DEFINE l_hrbo08   LIKE hrbo_file.hrbo08
DEFINE l_rank  DYNAMIC ARRAY OF RECORD
       rcode   LIKE hrbo_file.hrbo02,
       cbnum   LIKE type_file.num10,
       rbnum   LIKE type_file.num10,
       renum   LIKE type_file.num10,
       cenum   LIKE type_file.num10,
       chk     LIKE type_file.num10
               END RECORD
DEFINE l_bdate  LIKE type_file.dat
DEFINE l_n     LIKE type_file.num5
   OPTIONS
       INPUT NO WRAP
   DEFER INTERRUPT

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("GHR")) THEN
      EXIT PROGRAM
   END IF
   CALL cl_used(g_prog,g_time,1) RETURNING g_time
   LET g_bgjob = ARG_VAL(1)#是否背景作业
   LET b_date  = ARG_VAL(2)#分析开始日期
   LET e_date  = ARG_VAL(3)#分析结束日期
   IF e_date >=g_today THEN
      LET e_date = g_today - 1
   END IF
   LET l_type  = ARG_VAL(4)#人员类型【1：人员、2：群组(暂不支持)】
   LET l_namet = ARG_VAL(5)#分析人员【"-"表示所有人】
   LET g_hrat03= ARG_VAL(6)#分析人员所在的公司
   IF l_namet = '-' THEN
      LET l_namet=''
   END IF
   #存储考勤区间
   DROP TABLE temp1
   CREATE TEMP TABLE temp1 (
       hraa01   LIKE hraa_file.hraa01,
       bdat     LIKE type_file.dat,
       edat     DATE
   );
   DELETE FROM temp1
   DROP TABLE temp2
   CREATE TEMP TABLE temp2 (
       hraa01   LIKE hraa_file.hraa01,
       dat      DATE
   );
   DELETE FROM temp2
   CALL p056_kqqj()
   SELECT COUNT(*) INTO l_n FROM TEMP1
   IF l_n = 0 AND (g_bgjob='G' OR g_bgjob='Y') THEN
      RETURN
   END IF
   #add by zhuzw 20150921 start
   UPDATE hrcp_file SET hrcp35 = 'N'
    WHERE hrcp03 >= g_today - 2
      AND hrcp08 = '92'
   #add by zhuzw 20150921 end
   CALL p056_table() #临时表
   IF NOT cl_null(l_namet) THEN
      CALL cl_replace_str(l_namet,',',''',''') RETURNING l_namet
   END IF
   #add by zhuzw 20150923 start
   DELETE FROM hrcp_file
    WHERE exists(SELECT 1 FROM hrat_file WHERE hratid = hrcp02 AND hrcp03 < hrat25)
   #add by zhuzw 20150923 end
   #add by zhuzw 20150823 start 删除离职之后还存在点名的数据
   DELETE   FROM hrcp_file
    WHERE EXISTS (SELECT 1
          FROM hrat_file
         WHERE hratid = hrcp02
           AND hrcp03 > hrat77
           AND hrat19 LIKE '3%')
   #add by zhuzw 20150823 end
   IF g_bgjob='G' OR g_bgjob='Y' THEN
      LET l_sql =  " SELECT hratid,hrat01,hrat02,dat FROM temp2                                                                                 ",
          " LEFT JOIN hrat_file ON dat BETWEEN hrat25 AND NVL(hrat77,to_date('2099/12/31','yyyy/mm/dd')) and hraa01 = hrat03    ",
          " LEFT JOIN hrcp_file ON hrcp02=hratid AND hrcp03=dat                                                                            ",
          " WHERE (HRCPCONF != 'Y' OR HRCPCONF IS NULL) and dat BETWEEN to_date('",b_date,"','yy/mm/dd') AND to_date('",e_date,"','yy/mm/dd') "
   ELSE
      LET l_sql =  " SELECT hratid,hrat01,hrat02,dat FROM temp2                                                                                 ",
          " LEFT JOIN hrat_file ON dat BETWEEN hrat25 AND NVL(hrat77,to_date('2099/12/31','yyyy/mm/dd'))     ",
          " LEFT JOIN hrcp_file ON hrcp02=hratid AND hrcp03=dat                                                                            ",
          " WHERE (HRCPCONF != 'Y' OR HRCPCONF IS NULL) and  dat BETWEEN to_date('",b_date,"','yy/mm/dd') AND to_date('",e_date,"','yy/mm/dd') "
   END IF
   IF g_bgjob != 'X' THEN
      LET l_sql = l_sql," AND (hrcp35 <> 'Y' OR hrcp35 IS NULL)"
   END IF
   IF NOT cl_null(g_hrat03) THEN
      LET l_sql = l_sql," AND hrat03 = '",g_hrat03,"' "
   END IF
   IF NOT cl_null(l_namet) THEN
      LET l_sql = l_sql,"  AND hrat01 in ('",l_namet,"') "
   END IF
   PREPARE p056_p2 FROM l_sql
   DECLARE p056_c2 CURSOR FOR p056_p2
   FOREACH p056_c2 INTO l_name,g_hrat01,g_hrat02,g_date
        LET g_date1=g_date+1
        CALL p056_p()
   END FOREACH
   #add by zhuzw 20150825 start
   DROP TABLE temp3
   DROP TABLE temp4
   DROP TABLE temp5
   DROP TABLE temp6
   DROP TABLE temp7
   DROP TABLE temp8
   DROP TABLE temp9
   #add by zhuzw 20150825 end
   CALL cl_used(g_prog,g_time,2) RETURNING g_time
END MAIN

FUNCTION p056_table()#临时表
#存储请假出差信息 #正常
DROP TABLE temp3
CREATE TEMP TABLE temp3(
        hrcd01   LIKE hrcd_file.hrcd01,
        hrcda05  LIKE hrcda_file.hrcda05,
        hrcda06  LIKE hrcda_file.hrcda06,
        hrcda07  LIKE hrcda_file.hrcda07,
        hrcda08  LIKE hrcda_file.hrcda08,
        hrcda09  LIKE hrcda_file.hrcda09,
        lhour    DECIMAL(15,3)
         );

DELETE FROM temp3
#存储请假出差信息 #异常
DROP TABLE temp4
CREATE TEMP TABLE temp4(
        hrcd01   LIKE hrcd_file.hrcd01,
        hrcda05  LIKE hrcda_file.hrcda05,
        hrcda06  LIKE hrcda_file.hrcda06,
        hrcda07  LIKE hrcda_file.hrcda07,
        hrcda08  LIKE hrcda_file.hrcda08,
        lhour    LIKE hrcda_file.hrcda09,
        hrcda10  VARCHAR(20)

         );
DELETE FROM TEMP4
#存储新班段
DROP TABLE temp5
CREATE TEMP TABLE temp5(
        hrboa01  LIKE hrboa_file.hrboa01,
        hrboa02  LIKE hrboa_file.hrboa02,
        hrboa03  LIKE hrboa_file.hrboa03,
        hrboa04  LIKE hrboa_file.hrboa04,
        hrboa05  LIKE hrboa_file.hrboa05,
        hrboa06  LIKE hrboa_file.hrboa06,
        hrboa07  LIKE hrboa_file.hrboa07,
        hrboa11  LIKE hrboa_file.hrboa11,
        hrboa12  LIKE hrboa_file.hrboa12,
        hrboa13  DECIMAL(4,2)
         );
DELETE FROM TEMP5
#存储考勤异常数据
DROP TABLE TEMP6
CREATE TEMP TABLE TEMP6(
        hrboa01  LIKE hrboa_file.hrboa01,
        fz       LIKE hrboa_file.hrboa04,
        hrbm02   VARCHAR(20)

         );
DELETE FROM TEMP6
#存储考勤异常数据 #整理
DROP TABLE TEMP7
CREATE TEMP TABLE TEMP7(
        hrboa01  LIKE hrboa_file.hrboa01,
        fz       LIKE hrboa_file.hrboa04,
        hrbm02   VARCHAR(20)
         );
DELETE FROM TEMP7
#add by zhuzw 20150629 start
#存储考勤异常数据 #整理
DROP TABLE temp_jb
CREATE TEMP TABLE temp_jb(
        time1 VARCHAR(10),
        time2 VARCHAR(10)
         );
DELETE FROM temp_jb
#add by zhuzw 20150710 start
#存储考勤异常数据 #整理
DROP TABLE TEMP8
CREATE TEMP TABLE TEMP8(
        time1 VARCHAR(10),
        time2 VARCHAR(10)
         );
DELETE FROM TEMP8
#存储考勤异常数据 #整理
DROP TABLE TEMP9
CREATE TEMP TABLE TEMP9(
        hrboa01  LIKE hrboa_file.hrboa01,
        time1 VARCHAR(10),
        time2 VARCHAR(10)
         );
DELETE FROM TEMP9
#add by zhuzw 20150710 end
#add end
END FUNCTION
FUNCTION p056_kqqj() #考勤区间抓取
DEFINE l_sql STRING
DEFINE l_hrbl01 LIKE hrbl_file.hrbl01
DEFINE l_date1,l_date2,l_date3  LIKE type_file.dat
DEFINE l_n,l_i LIKE type_file.num5
   LET l_i = 1
   IF g_bgjob='G' THEN
      LET l_sql = " SELECT hrbl01,hrbl06,hrbl07 FROM hrbl_file WHERE  hrbl08='Y' AND hrbl07 >= TRUNC(SYSDATE)-6 "
   END IF
   IF g_bgjob='Y' THEN
      LET l_sql = " SELECT hrbl01,min(hrbl06),TRUNC(SYSDATE)-1 FROM hrbl_file  WHERE hrbl08='N' AND hrbl06 <= TRUNC(SYSDATE)-1 GROUP BY hrbl01 "
   END IF
   PREPARE p056_kqqj1 FROM l_sql
   DECLARE p056_kqqj1_s CURSOR FOR p056_kqqj1
   FOREACH p056_kqqj1_s INTO l_hrbl01,l_date1,l_date2
      INSERT INTO temp1 VALUES (l_hrbl01,l_date1,l_date2)
      CALL p056_hraa01(l_hrbl01,l_date1,l_date2)
   END FOREACH
   IF g_bgjob = 'G' OR g_bgjob ='Y' THEN
      LET l_sql = " SELECT * FROM temp1 "
      PREPARE p056_kqqj2 FROM l_sql
      DECLARE p056_kqqj1_s1 CURSOR FOR p056_kqqj2
      FOREACH p056_kqqj1_s1 INTO l_hrbl01,l_date1,l_date2
         INSERT INTO temp2 VALUES (l_hrbl01,l_date1)
         FOR l_i = 1 TO l_date2 - l_date1
            LET l_date3 = l_date1 + l_i
            INSERT INTO temp2 VALUES (l_hrbl01,l_date3)
         END FOR
      END FOREACH
   ELSE
      INSERT INTO temp2 VALUES ('',b_date)
      FOR l_i = 1 TO e_date - b_date
         LET l_date3 = b_date + l_i
         INSERT INTO temp2 VALUES ('',l_date3)
      END FOR
      select count(*) into l_n from temp2
   END IF
END FUNCTION

FUNCTION p056_hraa01(p_hraa01,p_date1,p_date2) #循环抓取公司，保证每个公司都有对应的考勤区间
DEFINE p_hraa01,l_hraa01 LIKE hraa_file.hraa01
DEFINE l_n,l_m LIKE type_file.num5
DEFINE p_date1,p_date2  LIKE type_file.dat
DEFINE l_sql1 STRING
      SELECT COUNT(*) INTO l_n FROM hraa_file
       WHERE hraa10 = p_hraa01
      IF l_n >0 THEN
         LET l_sql1 = " SELECT hraa01 FROM hraa_file  WHERE hraa10 = '",p_hraa01,"' "
         PREPARE p056_hraa011 FROM l_sql1
         DECLARE p056_hraa011_s CURSOR FOR p056_hraa011
         FOREACH  p056_hraa011_s INTO l_hraa01
           SELECT COUNT(*) INTO l_m FROM hrbl_file WHERE hrbl01 = l_hraa01 AND hrbl08='N' AND hrbl06 <= TRUNC(SYSDATE)-1
           IF l_m = 0 THEN
              INSERT INTO temp1 VALUES (l_hraa01,p_date1,p_date2)
              CALL p056_hraa01(l_hraa01,p_date1,p_date2)
           END IF
         END FOREACH
      END IF
END FUNCTION
FUNCTION p056_p()    #插入记录
DEFINE l_hrat25 LIKE hrat_file.hrat25
DEFINE l_hrat77 LIKE hrat_file.hrat77
DEFINE l_hrbn02 LIKE hrbn_file.hrbn02
DEFINE l_cnt    LIKE type_file.num5
DEFINE l_hrcp   RECORD LIKE hrcp_file.*
DEFINE l_hrcp04 LIKE hrcp_file.hrcp04
DEFINE l_hrbm02 LIKE hrbm_file.hrbm02
DEFINE l_hrcp10 LIKE hrcp_file.hrcp10
DEFINE l_hrcp08 LIKE hrcp_file.hrcp08  #add by wangwy 20160218 start
DEFINE l_hrcp09 LIKE hrcp_file.hrcp09  #add by wangwy 20160218 start
DEFINE l_hrcp11 LIKE hrcp_file.hrcp11  #add by wangwy 20160218 start
DEFINE l_hrcp22 LIKE hrcp_file.hrcp22
DEFINE l_hrcp23 LIKE hrcp_file.hrcp23
DEFINE l_hrcpud03 LIKE hrcp_file.hrcpud03  #wangwy 20160922
# add by lixwz180507 s---
DEFINE l_hrcp12    LIKE hrcp_file.hrcp10
DEFINE l_hrcp14    LIKE hrcp_file.hrcp10
DEFINE l_hrcp16    LIKE hrcp_file.hrcp10
DEFINE l_hrcp18    LIKE hrcp_file.hrcp10
DEFINE l_hrcp20    LIKE hrcp_file.hrcp10
DEFINE l_s         LIKE type_file.chr20
DEFINE l_s1        LIKE type_file.chr20
DEFINE l_sql       STRING
# add by lixwz180507 e---
  #插入记录
  INITIALIZE l_hrcp.* TO NULL
#add by zhuzw 20150825 start
  DELETE FROM temp3
  DELETE FROM temp4
  DELETE FROM temp5
  DELETE FROM temp6
  DELETE FROM temp7
  DELETE FROM temp8
  DELETE FROM temp9
#add by zhuzw 20150825 end

  SELECT to_char(systimestamp, 'yy/mm/dd hh24:mi:ss') INTO  l_hrcpud03 FROM dual    #wangwy 20160922
  SELECT count(*) INTO l_cnt FROM hrcp_file
   WHERE hrcp02=l_name AND hrcp03=g_date
  IF l_cnt=0 THEN
     SELECT max(hrcp01)+1 INTO l_hrcp.hrcp01 FROM hrcp_file
     IF cl_null(l_hrcp.hrcp01) THEN LET l_hrcp.hrcp01=1 END IF
     LET l_hrcp.hrcp02=l_name
     LET l_hrcp.hrcp03=g_date
     LET l_hrcp.hrcp04=' '
     LET l_hrcp.hrcp05=' '
     LET l_hrcp.hrcp07='N'
     LET l_hrcp.hrcp35='N'
     LET l_hrcp.hrcp36='N'
     LET l_hrcp.hrcpconf='N'
     LET l_hrcp.hrcpacti='Y'
     LET l_hrcp.hrcpud03=l_hrcpud03
     LET l_hrcp.hrcpuser=g_user
     LET l_hrcp.hrcpgrup=g_grup
     LET l_hrcp.hrcpmodu=g_user
     LET l_hrcp.hrcpdate=g_today
     LET l_hrcp.hrcporig=g_grup
     LET l_hrcp.hrcporiu=g_user
     INSERT INTO hrcp_file VALUES (l_hrcp.*)
  ELSE
   UPDATE hrcp_file SET hrcpud03 = l_hrcpud03,hrcpmodu = g_user,hrcpdate=g_today WHERE hrcp02=l_name AND hrcp03=g_date
  END IF
  SELECT hrbn02 INTO l_hrbn02 FROM hrbn_file WHERE hrbn01=l_name AND g_date BETWEEN hrbn04 AND hrbn05
  IF STATUS=100 THEN
     UPDATE hrcp_file SET hrcp08='92',hrcp10='93',hrcp35='Y'
      WHERE hrcp02=l_name AND hrcp03=g_date
     RETURN
  END IF

  # 更新 4.28 和 9.30 日的假期项目1为年休
  # add by lixwz180507 s---
  SELECT hrcp10,hrcp12,hrcp14,hrcp16,hrcp18,hrcp20
    INTO l_hrcp10,l_hrcp12,l_hrcp14,l_hrcp16,l_hrcp18,l_hrcp20
    FROM hrcp_file
   WHERE hrcp02=l_name
     AND hrcp03=g_date
  IF cl_null(l_hrcp10) THEN
      LET l_s = 'hrcp10'
      LET l_s1 = 'hrcp10'
  ELSE
      IF cl_null(l_hrcp12) THEN
          LET l_s = 'hrcp12'
          LET l_s1 = 'hrcp12'
      ELSE
          IF cl_null(l_hrcp14) THEN
              LET l_s = 'hrcp14'
              LET l_s1 = 'hrcp14'
          ELSE
              IF cl_null(l_hrcp16) THEN
                  LET l_s = 'hrcp16'
                  LET l_s1 = 'hrcp16'
              ELSE
                  IF cl_null(l_hrcp18) THEN
                      LET l_s = 'hrcp18'
                      LET l_s1 = 'hrcp18'
                  ELSE
                      LET l_s = 'hrcp20'
                      LET l_s1 = 'hrcp20'
                  END IF
              END IF
          END IF
      END IF
  END IF

  LET l_sql = "UPDATE hrcp_file SET ",l_s CLIPPED,"='010',",l_s1 CLIPPED,"=8 ",
              " WHERE hrcp02='",l_name CLIPPED,"' AND hrcp03=",g_date,#" AND hrcp04 ='REST' ",
              " AND (( MONTH(hrcp03)=4 AND DAY(hrcp03)=28) OR ( MONTH(hrcp03)=9 AND DAY(hrcp03)=30))",
              " AND EXISTS (SELECT 1 FROM hrcd_file WHERE hrcd09 = hrcp02 AND hrcd01 ='010' AND hrcp03 = hrcd02)"
  # add by lixwz180507 e---

  #逆向考勤（手工考勤）
  IF l_hrbn02='002' THEN
     UPDATE hrcp_file SET hrcp08='91',hrcp10=NULL,hrcp11=NULL,hrcp12=NULL,hrcp13=NULL,hrcp14=NULL,hrcp15=NULL,hrcp16=NULL,hrcp17=NULL,hrcp18=NULL,hrcp19=NULL,hrcp20=NULL,hrcp21=NULL,hrcp22=NULL,hrcp23=NULL,hrcp24=NULL,hrcp25=NULL,hrcp26=NULL,hrcp27=NULL,hrcp28=NULL,hrcp29=NULL,hrcp30=NULL,hrcp31=NULL,hrcp32=NULL,hrcp33=NULL,hrcp34=NULL,hrcp35='Y'
      WHERE hrcp02=l_name AND hrcp03=g_date
  END IF
  #不考勤
  IF l_hrbn02='001' THEN
     UPDATE hrcp_file SET hrcp04=' ',hrcp05=' ',hrcp08='91',hrcp09 = NULL ,hrcp10=NULL,hrcp11=NULL,hrcp12=NULL,hrcp13=NULL,hrcp14=NULL,hrcp15=NULL,hrcp16=NULL,hrcp17=NULL,hrcp18=NULL,hrcp19=NULL,
           hrcp20=NULL,hrcp21=NULL,hrcp22=NULL,hrcp23=NULL,hrcp24=NULL,hrcp25=NULL,hrcp26=NULL,hrcp27=NULL,hrcp28=NULL,hrcp29=NULL,
           hrcp30=NULL,hrcp31=NULL,hrcp32=NULL,hrcp33=NULL,hrcp34=NULL,hrcp35='Y'
      WHERE hrcp02=l_name AND hrcp03=g_date
     RETURN
  ELSE
#add by zhuzw 20140924 start #从新抓取班次
     CALL p056_p1()
#add by zhzuw 20140924 end
     #add by zhuzw 20140921 start  #增加异常判断
     SELECT hrcp10 INTO l_hrcp10 FROM hrcp_file
      WHERE  hrcp02=l_name AND hrcp03=g_date
     IF NOT cl_null(l_hrcp10) AND l_hrbn02='003' OR NOT cl_null(l_hrcp10) AND l_hrbn02='002'  THEN
        SELECT hrbm02 INTO l_hrbm02 FROM hrbm_file
         WHERE hrbm03 = l_hrcp10
        IF l_hrbm02 != '008' THEN
           UPDATE hrcp_file SET hrcp08 ='92' WHERE  hrcp02=l_name AND hrcp03=g_date
        END IF
     END IF
#     IF NOT cl_null(l_hrcp10) AND l_hrbm02 = '003' THEN
#        SELECT hrcp22,hrcp23 INTO l_jin1,l_chu1 FROM hrcp_file WHERE hrcp02=l_name AND hrcp03=g_date
#        IF cl_null(l_jin1) AND NOT cl_null(l_chu1) OR NOT cl_null(l_jin1) AND cl_null(l_chu1) THEN
#            UPDATE hrcp_file SET hrcp10='',hrcp11='',hrcp12='',hrcp13='',hrcp14='',hrcp15='',hrcp16='',
#                                 hrcp17='',hrcp18='',hrcp19='',hrcp20='',hrcp21=''
#             WHERE hrcp02=l_name
#             AND hrcp03=g_date
#            UPDATE hrcp_file SET hrcp10='034',hrcp11='1' WHERE hrcp02=l_name AND hrcp03=g_date
#        END IF
#     END IF
     #add by zhuzw 20140921 end
  END IF
#add by zhuzw 20150923 start
   SELECT hrcp10 INTO l_hrcp10 FROM hrcp_file
    WHERE hrcp02=l_name AND hrcp03=g_date
   IF l_hrcp10= '001' OR l_hrcp10= '002' OR l_hrcp10 = '003' OR l_hrcp10 = '034' OR l_hrcp10 = '048' THEN
       UPDATE hrcp_file SET hrcp08='92'
         WHERE hrcp02=l_name AND hrcp03=g_date
   ELSE
       UPDATE hrcp_file SET hrcp08='91'
         WHERE hrcp02=l_name AND hrcp03=g_date
   END IF

#add by zhuzw 20150923 end
#add by wangwy 20160218 start
IF l_hrbn02='002' THEN
   SELECT hrcp08,hrcp09,hrcp11 INTO l_hrcp08,l_hrcp09,l_hrcp11 FROM hrcp_file
    WHERE hrcp02=l_name AND hrcp03=g_date
    IF l_hrcp08='92' AND l_hrcp09=8 AND l_hrcp11=8 THEN
       UPDATE hrcp_file SET hrcp09=0
         WHERE hrcp02=l_name AND hrcp03=g_date
    END IF
END IF
#add by wangwy 20160218 end
END FUNCTION

FUNCTION p056_p1()   #确认班次
DEFINE l_hrcp04  LIKE hrcp_file.hrcp04
DEFINE l_hrcp22  LIKE hrcp_file.hrcp22
DEFINE l_hrcp33  LIKE hrcp_file.hrcp33
DEFINE l_hrdq08  LIKE hrdq_file.hrdq08
DEFINE l_hrdq09  LIKE hrdq_file.hrdq09
DEFINE l_hrcp05  LIKE hrcp_file.hrcp05
DEFINE l_hrcb01  LIKE hrcb_file.hrcb01
DEFINE l_str     LIKE type_file.chr100
DEFINE l_sql     STRING
DEFINE l_flag    LIKE type_file.num5
DEFINE l_cnt    LIKE type_file.num5
DEFINE l_i      LIKE type_file.num5    #循环刷卡数据控制
DEFINE l_j      LIKE type_file.num5    #循环刷卡数据控制
DEFINE l_t      LIKE type_file.num5    #临时记录刷卡时间点，方便对比
DEFINE l_rs      LIKE type_file.num5   #记录循环各班段得出的异常分钟数，负数为异常，数非异常
DEFINE l_s      LIKE type_file.num5    #临时记录循环各班段得出的异常分钟数，负数为异常，数非异常
DEFINE l_min    LIKE type_file.num5
DEFINE l_max    LIKE type_file.num5
DEFINE l_hrboa  DYNAMIC ARRAY OF RECORD
          l_cardbegin   LIKE type_file.num5,
          l_rankbegin   LIKE type_file.num5,
          l_begincheck  LIKE hrboa_file.hrboa06,
          l_cardend     LIKE type_file.num5,
          l_rankend     LIKE type_file.num5,
          l_endcheck    LIKE hrboa_file.hrboa06,
          l_hrboa15     LIKE hrboa_file.hrboa15
                        END RECORD
DEFINE l_cards DYNAMIC ARRAY OF RECORD
          l_cardtime   LIKE type_file.num5,
          l_type       LIKE type_file.num5
                        END RECORD
DEFINE    l_carddate   LIKE type_file.dat
DEFINE    l_cardtime   LIKE type_file.chr100
DEFINE    l_type       LIKE type_file.num5
DEFINE l_hrboa02 LIKE hrboa_file.hrboa02
DEFINE l_hrboa03 LIKE hrboa_file.hrboa03
DEFINE l_hrboa04 LIKE hrboa_file.hrboa04
DEFINE l_hrboa05 LIKE hrboa_file.hrboa05
DEFINE l_hrboa06 LIKE hrboa_file.hrboa06
DEFINE l_hrboa07 LIKE hrboa_file.hrboa07
DEFINE l_hrboa15 LIKE hrboa_file.hrboa15
DEFINE l_lastDay LIKE hrcp_file.hrcp03
DEFINE l_hrcp07  LIKE hrcp_file.hrcp07
#   查询员工排班信息
   #add by zhuzw 20140925 start
   SELECT hrcp07 INTO l_hrcp07 FROM hrcp_file
    WHERE hrcp02=l_name AND hrcp03=g_date
   #add by zhuzw 20140925 end
   IF l_hrcp07 = 'Y' THEN
      SELECT hrcp04 INTO l_hrcp04 FROM hrcp_file
       WHERE hrcp02=l_name AND hrcp03=g_date
      LET  l_hrdq08 ='N'
      LET l_hrdq09 =''
   ELSE
      SELECT NVL(d.hrdq06,NVL(e.hrdq06,NVL(f.hrdq06,g.hrdq06))),NVL(d.hrdq08,NVL(e.hrdq08,NVL(f.hrdq08,g.hrdq08))),
                NVL(d.hrdq09,NVL(e.hrdq09,NVL(f.hrdq09,g.hrdq09))) INTO l_hrcp04,l_hrdq08,l_hrdq09
          FROM hrat_file a
          LEFT JOIN hrcp_file b ON b.hrcp02 = a.hratid AND b.hrcp03 = g_date
          LEFT JOIN hrcb_file c ON c.hrcb05 = a.hratid AND g_date BETWEEN c.hrcb06 AND c.hrcb07
          LEFT JOIN hrdq_file d ON d.hrdq03 = a.hratid AND d.hrdq05 = g_date AND d.hrdq02=1
          LEFT JOIN hrdq_file e ON e.hrdq03 = c.hrcb01 AND e.hrdq05 = g_date AND e.hrdq02=4
          LEFT JOIN hrdq_file f ON f.hrdq03 = a.hrat03 AND f.hrdq05 = g_date AND f.hrdq02=3
          LEFT JOIN hrdq_file g ON g.hrdq03 = a.hrat04 AND g.hrdq05 = g_date AND g.hrdq02=2
          WHERE a.hratid = l_name
   END IF
   IF cl_null(l_hrdq08) OR l_hrdq08=' ' THEN
     UPDATE hrcp_file SET hrcp08='92',hrcp10='94',hrcp35='Y'
      WHERE hrcp02=l_name AND hrcp03=g_date
      RETURN
   END IF

   IF l_hrdq08 = 'Y' THEN
#      智能排班
#      取上一天的班次
#r.d2+ ghrp056 Y 2014-08-20 2014-08-20 1 100659 0000
   SELECT g_date - 1 INTO l_lastDay FROM dual
   SELECT hrcp04,hrcp22,NVL(hrcp33,NVL(hrcp32,NVL(hrcp31,NVL(hrcp30,NVL(hrcp29,NVL(hrcp28,NVL(hrcp27,NVL(hrcp26,NVL(hrcp25,NVL(hrcp24,hrcp23))))))))))
      INTO l_hrcp04,l_hrcp22,l_hrcp33
   FROM hrcp_file WHERE hrcp02 = l_name AND hrcp03 = l_lastDay
   IF NOT cl_null(l_hrcp04) THEN
#      存在上一天的点名结果,并且判断出当天的班次
      LET l_sql="SELECT hrboa02,hrboa03,hrboa04,hrboa05,hrboa06,hrboa07,hrboa15 FROM hrboa_file",
            +" WHERE hrboa15= '",l_hrcp04,"'",
            +" ORDER BY hrboa01"
      LET l_cnt = 1
      LET l_min = 9999
      LET l_max = -9999
      PREPARE hrboa05_p FROM l_sql
      DECLARE hrboa05_c CURSOR FOR hrboa05_p
      FOREACH hrboa05_c INTO l_hrboa02,l_hrboa03,l_hrboa04,l_hrboa05,l_hrboa06,l_hrboa07,l_hrboa15
         SELECT substr(l_hrboa02,1,2)*60+substr(l_hrboa02,4,2) INTO l_hrboa[l_cnt].l_rankbegin FROM dual
         SELECT substr(l_hrboa05,1,2)*60+substr(l_hrboa05,4,2) INTO l_hrboa[l_cnt].l_rankend FROM dual
         IF(l_cnt > 1) THEN
            IF (l_hrboa[l_cnt].l_rankbegin < l_hrboa[l_cnt - 1].l_rankend) THEN
               LET l_hrboa[l_cnt].l_rankbegin = l_hrboa[l_cnt].l_rankbegin + 24*60
            END IF
         END IF
         IF(l_hrboa[l_cnt].l_rankend < l_hrboa[l_cnt].l_rankbegin) THEN
            LET l_hrboa[l_cnt].l_rankend = l_hrboa[l_cnt].l_rankend + 24*60
         END IF
         LET l_hrboa[l_cnt].l_cardbegin = l_hrboa[l_cnt].l_rankbegin - l_hrboa04
         LET l_hrboa[l_cnt].l_cardend = l_hrboa[l_cnt].l_cardend + l_hrboa07
         LET l_hrboa[l_cnt].l_begincheck = l_hrboa03
         LET l_hrboa[l_cnt].l_endcheck = l_hrboa06
         LET l_hrboa[l_cnt].l_hrboa15 = l_hrboa15
         IF(l_hrboa[l_cnt].l_cardbegin < l_min) THEN
            LET l_min = l_hrboa[l_cnt].l_cardbegin
         END IF
         IF (l_hrboa[l_cnt].l_cardend > l_max) THEN
            LET l_max = l_hrboa[l_cnt].l_cardend
         END IF
         LET l_cnt=l_cnt+1
      END FOREACH
#      查询刷卡数据
      LET l_sql="SELECT hrboa02,hrboa03,hrboa04,hrboa05,hrboa06,hrboa07,hrboa15 FROM hrboa_file",
            +" WHERE hrboa15= '",l_hrcp04,"'",
            +" ORDER BY hrboa01"
   END IF
#      不存在上一天的点名结果
   IF cl_null(l_hrcp04) THEN
      LET l_sql="SELECT hrboa02,hrboa03,hrboa04,hrboa05,hrboa06,hrboa07,hrboa15 FROM hrbza_file",
               +" LEFT JOIN hrboa_file ON hrboa15=hrbza02",
               +" WHERE hrbza05= '",l_hrdq09,"'",
               +" ORDER BY hrbza01,hrboa01"
      LET l_cnt = 1
      LET l_min = 9999
      LET l_max = -9999
      PREPARE hrbza05_p FROM l_sql
      DECLARE hrbza05_c CURSOR FOR hrbza05_p
      FOREACH hrbza05_c INTO l_hrboa02,l_hrboa03,l_hrboa04,l_hrboa05,l_hrboa06,l_hrboa07,l_hrboa15
         SELECT substr(l_hrboa02,1,2)*60+substr(l_hrboa02,4,2) INTO l_hrboa[l_cnt].l_rankbegin FROM dual
         SELECT substr(l_hrboa05,1,2)*60+substr(l_hrboa05,4,2) INTO l_hrboa[l_cnt].l_rankend FROM dual
         IF(l_cnt > 1) THEN
            IF (l_hrboa[l_cnt].l_rankbegin < l_hrboa[l_cnt - 1].l_rankend) THEN
               LET l_hrboa[l_cnt].l_rankbegin = l_hrboa[l_cnt].l_rankbegin + 24*60
            END IF
         END IF
         IF(l_hrboa[l_cnt].l_rankend < l_hrboa[l_cnt].l_rankbegin) THEN
            LET l_hrboa[l_cnt].l_rankend = l_hrboa[l_cnt].l_rankend + 24*60
         END IF
         LET l_hrboa[l_cnt].l_cardbegin = l_hrboa[l_cnt].l_rankbegin - l_hrboa04
         LET l_hrboa[l_cnt].l_cardend = l_hrboa[l_cnt].l_rankend + l_hrboa07
         LET l_hrboa[l_cnt].l_begincheck = l_hrboa03
         LET l_hrboa[l_cnt].l_endcheck = l_hrboa06
         LET l_hrboa[l_cnt].l_hrboa15 = l_hrboa15
         IF(l_hrboa[l_cnt].l_cardbegin < l_min) THEN
            LET l_min = l_hrboa[l_cnt].l_cardbegin
         END IF
         IF (l_hrboa[l_cnt].l_cardend > l_max) THEN
            LET l_max = l_hrboa[l_cnt].l_cardend
         END IF
         LET l_cnt=l_cnt+1
      END FOREACH
#      查询数据
      LET l_sql = "SELECT hrby05, hrby06, hrby10",
               +" FROM hrby_file WHERE hrby09 = '",l_name,"' AND",
               +" to_date(to_char(hrby05,'yyyymmdd')||' '||hrby06,'yyyymmdd hh24:mi:ss') BETWEEN",
               +" to_date('",g_date,"','yy/mm/dd')+",l_min,"/24/60 AND to_date('",g_date,"','yy/mm/dd')+",l_max,"/24/60",
               +" ORDER BY hrby05,hrby06"
      LET l_cnt = 1
      PREPARE cardtime_p FROM l_sql
      DECLARE cardtime_c CURSOR FOR cardtime_p
      FOREACH cardtime_c INTO l_carddate,l_cardtime,l_type
         IF(l_carddate < g_date) THEN
            SELECT substr(l_cardtime,1,2)*60+substr(l_cardtime,4,2)-24*60 INTO l_cards[l_cnt].l_cardtime FROM dual
         END IF
         IF(l_carddate = g_date) THEN
            SELECT substr(l_cardtime,1,2)*60+substr(l_cardtime,4,2) INTO l_cards[l_cnt].l_cardtime FROM dual
         END IF
         IF(l_carddate > g_date) THEN
            SELECT substr(l_cardtime,1,2)*60+substr(l_cardtime,4,2)+24*60 INTO l_cards[l_cnt].l_cardtime FROM dual
         END IF
         LET l_cards[l_cnt].l_type = l_type
         LET l_cnt=l_cnt+1
      END FOREACH
#      匹配多个班次，智能决定员工上班班次 l_hrboa.getLength()
      LET l_cnt = 1
      LET l_i = 1
      LET l_j = 1
      LET l_s = 0
      LET l_rs = -999
      LET l_t = -999
      FOR l_cnt = 1 TO l_hrboa.getLength()
         IF(l_hrboa[l_cnt].l_hrboa15 != l_hrboa15) THEN
            IF(l_s > l_rs) THEN
               IF(l_cnt = 1) THEN
                  LET l_hrcp04 = l_hrboa[l_cnt].l_hrboa15
               ELSE
                  LET l_hrcp04 = l_hrboa15
               END IF
            END IF
            LET l_hrboa15 = l_hrboa[l_cnt].l_hrboa15
            LET l_i = 1
            LET l_j = 1
            LET l_s = 0
         END IF
         LET l_flag = 0
         IF(l_cards.getLength() >= l_j) THEN
            FOR l_i=l_j TO l_cards.getLength()
               #暂时不区分所有刷卡
               IF((l_cards[l_i].l_cardtime - l_t) > 5) THEN
                  LET l_t = l_cards[l_i].l_cardtime
                  LET l_j = l_j + 1
               END IF
               IF(l_hrboa[l_cnt].l_begincheck = 'Y' AND l_flag = 0) THEN
                  IF(l_hrboa[l_cnt].l_rankbegin - l_t <= 0) THEN
                     LET l_s = l_s + l_hrboa[l_cnt].l_rankbegin - l_t
                  END IF
                  LET l_flag = 1
               ELSE
                  IF (l_hrboa[l_cnt].l_endcheck = 'Y') THEN
                     IF(l_t - l_hrboa[l_cnt].l_rankend <= 0) THEN
                        LET l_s = l_s + l_t - l_hrboa[l_cnt].l_rankend
                     END IF
                     EXIT FOR
                  ELSE
                     LET l_j = l_j - 1
                     EXIT FOR
                  END IF
               END IF
            END FOR
         END IF
      END FOR
   END IF

#      比对刷卡是否与上一天的班次吻合
#      取所有候选班次

      LET l_sql="SELECT hrboa02,hrboa05 FROM hrboa_file",
              " WHERE hrboa15='",l_hrcp04,"' AND hrboa08='001'",
              " ORDER BY hrboa01"
   END IF

    IF cl_null(l_hrcp04) OR l_hrcp04=' ' THEN
       RETURN
    END IF

   SELECT hrbo15 INTO l_hrcp05 FROM hrbo_file WHERE hrbo02 = l_hrcp04

    UPDATE hrcp_file SET hrcp04=l_hrcp04,hrcp05=l_hrcp05
     WHERE hrcp02=l_name AND hrcp03=g_date

    CALL p056_p2(l_hrcp04)
END FUNCTION

FUNCTION p056_p2(p_hrcp04)   #请假出差
DEFINE l_sql      STRING
DEFINE l_hrcda    RECORD LIKE hrcda_file.*
DEFINE p_hrcda    RECORD LIKE hrcda_file.*
DEFINE p_hrcp04   LIKE hrcp_file.hrcp04
DEFINE l_hour     LIKE hrcp_file.hrcp11   #当日请假时长
DEFINE l_houra    LIKE hrcp_file.hrcp11   #次日请假时长
DEFINE l_total    LIKE hrcp_file.hrcp11
DEFINE l_cnt      LIKE type_file.num5
DEFINE l_cnta     LIKE type_file.num5
DEFINE l_cnm      LIKE type_file.num5
DEFINE l_cnma     LIKE type_file.num5
DEFINE l_hrbn02   LIKE hrbn_file.hrbn02
DEFINE l_hrcd01   LIKE hrcd_file.hrcd01
DEFINE l_num      LIKE type_file.num5
DEFINE l_num1     LIKE type_file.num5
DEFINE l_s        LIKE type_file.chr100
DEFINE l_s1       LIKE type_file.chr100
DEFINE l_hrcec    RECORD LIKE hrcec_file.*
DEFINE p_hrcec    RECORD LIKE hrcec_file.*
DEFINE l_hrbm05   LIKE hrbm_file.hrbm05
DEFINE l_hrbm06   LIKE hrbm_file.hrbm06
DEFINE l_a        LIKE type_file.num5
DEFINE l_hrbm14   LIKE hrbm_file.hrbm14
DEFINE l_hrboa12  LIKE hrboa_file.hrboa12 #add by zhuzw 20150202
DEFINE l_bo07     LIKE hrbo_file.hrbo07
DEFINE l_bo05     LIKE hrbo_file.hrbo05
    LET l_num=10
    LET l_num1=11
    INITIALIZE l_hrcda.* TO NULL
    INITIALIZE p_hrcda.* TO NULL

   # 获取员工当天的考勤方式
    SELECT hrbn02 INTO l_hrbn02 FROM hrbn_file WHERE hrbn01=l_name AND g_date BETWEEN hrbn04 AND hrbn05
    #获取当天班次的累计小时数
    SELECT sum(hrboa12) INTO l_total FROM hrboa_file WHERE hrboa15=p_hrcp04 AND hrboa08='001'
    #获取当天班次所有字段信息
    SELECT * INTO g_hrbo.* FROM hrbo_file WHERE hrbo02=p_hrcp04

    #存在当天请假单
    #add by zhuzw 20140925 start
    IF g_hrbo.hrbo06 = 'Y' THEN
       SELECT count(*) INTO l_cnt FROM hrcd_file,hrcda_file,hrbm_file
        WHERE hrcd09=l_name AND hrcda02=hrcd10 AND hrcda16!='Y'
           AND (hrcda05=g_date OR hrcda05=g_date +1) #add by zhuzw 20141030
          AND hrbm02 = hrcd01 AND hrbm14 = 'N'
    #add by zhuzw 20140925 end
    ELSE
       SELECT count(*) INTO l_cnt FROM hrcd_file,hrcda_file
        WHERE hrcd09=l_name AND hrcda02=hrcd10 AND hrcda16!='Y'
           AND (hrcda05=g_date OR hrcda05=g_date +1) #add by zhuzw 20141030
    END IF
    IF l_cnt>0 THEN
      LET l_sql="SELECT hrcda_file.*,hrcd01 FROM hrcda_file,hrcd_file",
                " WHERE hrcda02=hrcd10 AND hrcd09='",l_name,"' AND hrcda16!='Y' AND  hrcdconf = 'Y'" ,
                 "   AND (hrcda05='",g_date,"' OR hrcda05='",g_date + 1,"') "
       PREPARE p056_get_p FROM l_sql
       DECLARE p056_get_c CURSOR FOR p056_get_p
       FOREACH p056_get_c INTO l_hrcda.*,l_hrcd01

         LET l_hour=0
          LET l_houra=0
          SELECT hrbm05,hrbm06 INTO l_hrbm05,l_hrbm06 FROM hrbm_file WHERE hrbm03=l_hrcd01
         IF  NOT cl_null(l_hrcda.hrcda09) THEN
            CASE l_hrcda.hrcda10
              WHEN '001' LET l_hour=l_hrcda.hrcda09*l_total
              WHEN '002' LET l_hour=l_hrcda.hrcda09*l_total/2
              WHEN '003' LET l_hour=l_hrcda.hrcda09
              WHEN '004' LET l_hour=l_hrcda.hrcda09/60
            END CASE
            LET l_hrcda.hrcda09 = l_hour * 60
         ELSE
            CALL p056_p2_1(l_hrcda.*,p_hrcp04) RETURNING l_hour
         END IF
         IF g_hrbo.hrbo07 = 'N' AND l_hrcda.hrcda05 = g_date + 1  THEN
            CONTINUE FOREACH
         END IF
        #  LT l_hour=l_hour+l_houra
          CASE l_hrbm06
            WHEN '001'
              SELECT ceil(l_hour/(l_hrbm05*l_total)) INTO l_a FROM dual
              LET l_hour=l_hrbm05*l_total*l_a
            WHEN '002'
              SELECT ceil(l_hour*2/(l_hrbm05*l_total)) INTO l_a FROM dual
              LET l_hour=l_hrbm05*l_total*l_a/2
            WHEN '003'
              SELECT ceil(l_hour/l_hrbm05) INTO l_a FROM dual
              LET l_hour=l_hrbm05*l_a
          END CASE
          IF l_hour>0 THEN
#             IF l_hrbn02='002' THEN #逆向考勤
#                IF g_hrbo.hrbo06='Y' THEN
#                   SELECT hrbm14 INTO l_hrbm14 FROM hrbm_file
#                    WHERE hrcbm02 = l_hrcd01
#                   IF l_hrbm14 = 'N' THEN
#                      LET l_s=l_num
#                      LET l_s='hrcp',l_s
#                      LET l_s1=l_num1
#                      LET l_s1='hrcp',l_s1
#                      LET l_sql= "UPDATE hrcp_file SET hrcp08='92',",
#                                 "",l_s,"='",l_hrcd01,"',hrcp34=NULL,",
#                                 "",l_s1,"='",l_hour,"',hrcp35='Y'",
#                                 " WHERE hrcp02='",l_name,"' ",
#                                 "   AND hrcp03='",g_date,"'"
#                      PREPARE pp_p1 FROM l_sql
#                      EXECUTE pp_p1
#                      LET l_num=l_num+2
#                      LET l_num1=l_num1+2
#                   END IF
#                ELSE
#                   LET l_s=l_num
#                   LET l_s='hrcp',l_s
#                   LET l_s1=l_num1
#                   LET l_s1='hrcp',l_s1
#                   LET l_sql= "UPDATE hrcp_file SET hrcp08='92',",
#                              "",l_s,"='",l_hrcd01,"',hrcp34=NULL,",
#                              "",l_s1,"='",l_hour,"',hrcp35='Y'",
#                              " WHERE hrcp02='",l_name,"' ",
#                              "   AND hrcp03='",g_date,"'"
#                   PREPARE pp_p FROM l_sql
#                   EXECUTE pp_p
#                   LET l_num=l_num+2
#                   LET l_num1=l_num1+2
#                END IF
#             ELSE
    #add by wangwy 2015-1028 start

#             SELECT hrcp04 INTO l_bc04 FROM hrcp_file WHERE hrcp02=l_name AND hrcp03=g_date
             SELECT hrbo07 INTO l_bo07 FROM hrbo_file WHERE hrbo02=p_hrcp04
                #IF l_hrcda.hrcda08 = '00:00' AND l_hrcda.hrcda05 = l_hrcda.hrcda07 THEN
                IF l_hrcda.hrcda08 = '00:00' THEN
                   LET l_hrcda.hrcda08 = '24:00'
                END IF
                IF l_bo07 = 'Y' THEN
                 SELECT hrbo05 INTO l_bo05 FROM hrbo_file WHERE hrbo02=p_hrcp04
                 IF g_date = l_hrcda.hrcda05 THEN
                   IF (cl_null(l_hrcda.hrcda06) AND NOT cl_null(l_hrcda.hrcda08)) OR
                      (NOT cl_null(l_hrcda.hrcda06) AND cl_null(l_hrcda.hrcda08)) OR
                      l_hrcda.hrcda06 = l_hrcda.hrcda08 THEN
                      INSERT INTO TEMP4 VALUES(l_hrcd01,l_hrcda.hrcda05,l_hrcda.hrcda06,l_hrcda.hrcda07,l_hrcda.hrcda08,l_hour,l_hrcda.hrcda10)
                   END IF
                   IF  NOT cl_null(l_hrcda.hrcda06) AND NOT cl_null(l_hrcda.hrcda08) AND l_hrcda.hrcda06 != l_hrcda.hrcda08 THEN
                      INSERT INTO TEMP3 VALUES(l_hrcd01,l_hrcda.hrcda05,l_hrcda.hrcda06,l_hrcda.hrcda07,l_hrcda.hrcda08,l_hrcda.hrcda09,l_hour)
                   END IF
                 END IF
                ELSE
                  IF (cl_null(l_hrcda.hrcda06) AND NOT cl_null(l_hrcda.hrcda08)) OR
                     (NOT cl_null(l_hrcda.hrcda06) AND cl_null(l_hrcda.hrcda08)) OR
                     l_hrcda.hrcda06 = l_hrcda.hrcda08 THEN
                     INSERT INTO TEMP4 VALUES(l_hrcd01,l_hrcda.hrcda05,l_hrcda.hrcda06,l_hrcda.hrcda07,l_hrcda.hrcda08,l_hour,l_hrcda.hrcda10)
                  END IF
                  IF  NOT cl_null(l_hrcda.hrcda06) AND NOT cl_null(l_hrcda.hrcda08) AND l_hrcda.hrcda06 != l_hrcda.hrcda08 THEN
                    INSERT INTO TEMP3 VALUES(l_hrcd01,l_hrcda.hrcda05,l_hrcda.hrcda06,l_hrcda.hrcda07,l_hrcda.hrcda08,l_hrcda.hrcda09,l_hour)
                  END IF
                END IF
    #add by wangwy 2015-1028 end


#                 IF l_hrcda.hrcda08 = '00:00'THEN
#                    LET l_hrcda.hrcda08 = '24:00'
#                 END IF
#                 IF (cl_null(l_hrcda.hrcda06) AND NOT cl_null(l_hrcda.hrcda08))OR (NOT cl_null(l_hrcda.hrcda06) AND cl_null(l_hrcda.hrcda08)) OR  l_hrcda.hrcda06 = l_hrcda.hrcda08 THEN
#                   INSERT INTO TEMP4 VALUES(l_hrcd01,l_hrcda.hrcda05,l_hrcda.hrcda06,l_hrcda.hrcda07,l_hrcda.hrcda08,l_hour,l_hrcda.hrcda10)
#                END IF
#                IF  NOT cl_null(l_hrcda.hrcda06) AND NOT cl_null(l_hrcda.hrcda08) AND l_hrcda.hrcda06 != l_hrcda.hrcda08 THEN
#                  INSERT INTO TEMP3 VALUES(l_hrcd01,l_hrcda.hrcda05,l_hrcda.hrcda06,l_hrcda.hrcda07,l_hrcda.hrcda08,l_hrcda.hrcda09,l_hour)
#                END IF
            # END IF
          END IF
       END FOREACH
    END IF

    INITIALIZE l_hrcec.* TO NULL
    INITIALIZE p_hrcec.* TO NULL

    #存在当天出差单
    SELECT count(*) INTO l_cnm FROM hrcec_file
     WHERE hrcec04=l_name AND hrcec16!='Y'
       AND (hrcec05=g_date OR (hrcec05 IS NULL AND hrcec07=g_date))

    IF l_cnm>0 THEN
       LET l_sql="SELECT hrcec_file.* FROM hrcec_file,hrce_file  ",
                 " WHERE hrcec04='",l_name,"' AND hrcec16!='Y' AND hrceconf = 'Y' and hrce01 = hrcec01 ",
                 "   AND (hrcec05='",g_date,"' OR (hrcec05 IS NULL AND hrcec07='",g_date,"'))"
       PREPARE p056_get_pm FROM l_sql
       DECLARE p056_get_cm CURSOR FOR p056_get_pm
       FOREACH p056_get_cm INTO l_hrcec.*
          LET l_hour=0
          LET l_houra=0
          SELECT hrbm05,hrbm06 INTO l_hrbm05,l_hrbm06 FROM hrbm_file WHERE hrbm03=l_hrcec.hrcec03
          IF NOT cl_null(l_hrcec.hrcec09) THEN
             CASE l_hrcec.hrcec10
               WHEN '001' LET l_hour=l_hrcec.hrcec09*l_total
               WHEN '002' LET l_hour=l_hrcec.hrcec09*l_total/2
               WHEN '003' LET l_hour=l_hrcec.hrcec09
               WHEN '004' LET l_hour=l_hrcec.hrcec09/60
             END CASE
             LET l_hrcec.hrcec09 = l_hour *60
#          ELSE
#             #存在次日出差单
#             IF g_hrbo.hrbo07='Y' THEN
#                SELECT count(*) INTO l_cnma FROM hrcec_file
#                 WHERE hrcec01=l_hrcec.hrcec01 AND hrcec16!='Y'
#                   AND (hrcec05=g_date1 OR (hrcec05 IS NULL AND hrcec07=g_date1))
#                IF l_cnma>0 THEN
#                   SELECT * INTO p_hrcec.* FROM hrcec_file
#                    WHERE hrcec01=l_hrcec.hrcec01 AND hrcec16!='Y'
#                      AND (hrcec05=g_date1 OR (hrcec05 IS NULL AND hrcec07=g_date1))
#                   CALL p056_p2_4(p_hrcec.*) RETURNING p_hrcec.*
#                   UPDATE hrcec_file SET hrcec.*=p_hrcec.* WHERE hrcec01=p_hrcec.hrcec01 AND hrcec02=p_hrcec.hrcec02
#                   CALL p056_p2_6(p_hrcec.*,p_hrcp04) RETURNING l_houra
#                END IF
#             END IF
          ELSE
             CALL p056_p2_2(l_hrcec.*,p_hrcp04) RETURNING l_hour
          END IF

          #LET l_hour=l_hour+l_houra
           CASE l_hrbm06
            WHEN '001'
              SELECT ceil(l_hour/(l_hrbm05*l_total)) INTO l_a FROM dual
              LET l_hour=l_hrbm05*l_total*l_a
            WHEN '002'
              SELECT ceil(l_hour*2/(l_hrbm05*l_total)) INTO l_a FROM dual
              LET l_hour=l_hrbm05*l_total*l_a/2
            WHEN '003'
              SELECT ceil(l_hour/l_hrbm05) INTO l_a FROM dual
              LET l_hour=l_hrbm05*l_a
          END CASE
          IF l_hour>0 THEN
#             IF l_hrbn02='002' THEN #逆向考勤
#                IF g_hrbo.hrbo06='Y' THEN
#                    SELECT hrbm14 INTO l_hrbm14 FROM hrbm_file
#                     WHERE hrcbm02 = l_hrcec.hrcec03
#                    IF l_hrbm14 = 'N' THEN
#                       LET l_s=l_num
#                       LET l_s='hrcp',l_s
#                       LET l_s1=l_num1
#                       LET l_s1='hrcp',l_s1
#                       LET l_sql= "UPDATE hrcp_file SET hrcp08='92',",
#                                  "",l_s,"='",l_hrcec.hrcec03,"',hrcp34=NULL,",
#                                  "",l_s1,"='",l_hour,"',hrcp35='Y'",
#                                  " WHERE hrcp02='",l_name,"' ",
#                                  "   AND hrcp03='",g_date,"'"
#                       PREPARE pp_pm2 FROM l_sql
#                       EXECUTE pp_pm2
#                       LET l_num=l_num+2
#                       LET l_num1=l_num1+2
#                    END IF
#                ELSE
#                   LET l_s=l_num
#                   LET l_s='hrcp',l_s
#                   LET l_s1=l_num1
#                   LET l_s1='hrcp',l_s1
#                   LET l_sql= "UPDATE hrcp_file SET hrcp08='92',",
#                              "",l_s,"='",l_hrcec.hrcec03,"',hrcp34=NULL,",
#                              "",l_s1,"='",l_hour,"',hrcp35='Y'",
#                              " WHERE hrcp02='",l_name,"' ",
#                              "   AND hrcp03='",g_date,"'"
#                   PREPARE pp_pm FROM l_sql
#                   EXECUTE pp_pm
#                   LET l_num=l_num+2
#                   LET l_num1=l_num1+2
#                END IF
#             ELSE
                IF l_hrcec.hrcec08 = '00:00'THEN
                   LET l_hrcec.hrcec08 = '24:00'
                END IF
                IF cl_null(l_hrcec.hrcec06) OR cl_null(l_hrcec.hrcec08) OR  l_hrcec.hrcec06 = l_hrcec.hrcec08 THEN
                   INSERT INTO TEMP4 VALUES(l_hrcec.hrcec03,l_hrcec.hrcec05,l_hrcec.hrcec06,l_hrcec.hrcec07,l_hrcec.hrcec08,l_hour,l_hrcec.hrcec10)
                ELSE
                   INSERT INTO TEMP3 VALUES(l_hrcec.hrcec03,l_hrcec.hrcec05,l_hrcec.hrcec06,l_hrcec.hrcec07,l_hrcec.hrcec08,l_hrcec.hrcec09,l_hour)
                END IF
          #   END IF
          END IF
       END FOREACH
    END IF

    IF l_hrbn02='002' THEN #逆向考勤
       IF l_cnt=0 AND l_cnm=0 THEN
          UPDATE hrcp_file SET hrcp08='91',hrcp34=null,hrcp35='Y'
           WHERE hrcp02=l_name AND hrcp03=g_date
       END IF
       CALL p056_p3(p_hrcp04)   #add by wangwy 2015-09-07
    ELSE
       CALL p056_p3(p_hrcp04)
    END IF
END FUNCTION

FUNCTION p056_p3(p_hrcp04)#重新排版班段
DEFINE l_sql  STRING
DEFINE p_hrcp04   LIKE hrcp_file.hrcp04
DEFINE l_hrboa,l_hrboa_1 RECORD LIKE hrboa_file.*
DEFINE l_hrbo RECORD LIKE hrbo_file.*
DEFINE l_bd    DYNAMIC ARRAY of RECORD
               a LIKE hrcda_file.hrcda06,
               b LIKE hrcda_file.hrcda06,
               c LIKE hrcda_file.hrcda09
               END RECORD
DEFINE l_i,l_j,l_n,l_a,l_b,l_hrcda06_n,l_hrcda08_n   LIKE type_file.num5
DEFINE l_hrboa03,l_hrboa06 LIKE hrboa_file.hrboa03
DEFINE l_hrboa02,l_hrboa05 LIKE hrboa_file.hrboa02
DEFINE l_hrcda08  LIKE hrcda_file.hrcda08
DEFINE l_hrcda06  LIKE hrcda_file.hrcda06
DEFINE l_hrcda09  LIKE hrcda_file.hrcda09
DEFINE l_hrboa04 LIKE hrboa_file.hrboa04
DEFINE l_a1,l_b1   LIKE hrboa_file.hrboa05
   SELECT * INTO l_hrbo.* FROM hrbo_file
    WHERE hrbo02 = p_hrcp04
   IF l_hrbo.hrbo06 != 'Y' THEN
       LET l_sql = " select * from hrboa_file where hrboa15 = '",p_hrcp04,"' and hrboa10 = 'Y' order by hrboa01 "
       PREPARE p056_p3_1 FROM l_sql
       DECLARE p056_p3_1s CURSOR FOR p056_p3_1
       FOREACH p056_p3_1s INTO  l_hrboa.*
          CALL l_bd.clear()
          LET l_i = 1
          IF l_hrbo.hrbo07 = 'N' THEN #跨天班段否
             SELECT COUNT(*) INTO l_n FROM  temp3
              WHERE (hrcda06 <=l_hrboa.hrboa02 AND hrcda08 > l_hrboa.hrboa02 ) OR  (hrcda06 > l_hrboa.hrboa02 AND hrcda06 < l_hrboa.hrboa05)
             IF l_n >0 THEN
                LET l_sql = " SELECT hrcda06,hrcda08,hrcda09  FROM temp3 ",
                            "  WHERE (hrcda06 <='",l_hrboa.hrboa02,"' AND hrcda08 > '",l_hrboa.hrboa02,"') or (hrcda06 > '",l_hrboa.hrboa02,"' AND hrcda06  < '",l_hrboa.hrboa05,"')  order by hrcda06 "
                PREPARE p056_p3_2 FROM l_sql
                DECLARE p056_p3_1s1 CURSOR FOR p056_p3_2
                FOREACH p056_p3_1s1  INTO l_hrcda06,l_hrcda08,l_hrcda09
                   IF l_hrcda06 <= l_hrboa.hrboa02 AND l_hrcda08 < l_hrboa.hrboa05 THEN
                      LET l_j = 1
                      IF l_bd.getlength() >0 THEN
                         FOR l_j = 1 TO l_bd.getlength()
                           IF (l_hrcda08 <=l_bd[l_j].a  AND l_hrboa.hrboa05 > l_bd[l_j].a  ) OR (l_hrcda08 >=l_bd[l_j].a  AND l_hrboa.hrboa05 <= l_bd[l_j].a)  OR (l_hrcda08 >l_bd[l_j].a  AND l_hrcda08 < l_bd[l_j].b)THEN
                              IF l_bd[l_j].a >= l_hrcda08 THEN
                                 LET l_bd[l_j].a = l_bd[l_j].a
                              ELSE
                                LET l_bd[l_j].a = l_hrcda08
                              END IF
                              IF l_bd[l_j].b >=l_hrboa.hrboa05  THEN
                                 LET l_bd[l_j].b = l_hrboa.hrboa05
                              ELSE
                                 LET l_bd[l_j].b = l_bd[l_j].b
                              END IF
                           ELSE
                              LET l_bd[l_i].a = l_hrcda08
                              LET l_bd[l_i].b = l_hrboa.hrboa05
                              LET l_i = l_i +1
                           END IF

                         END FOR
                      ELSE
                         LET l_bd[l_i].a = l_hrcda08
                         LET l_bd[l_i].b = l_hrboa.hrboa05
                         LET l_i = l_i +1
                      END IF
                   END IF
                   IF l_hrcda06 > l_hrboa.hrboa02 AND l_hrcda08 >= l_hrboa.hrboa05 THEN
                      LET l_j = 1
                      IF l_bd.getlength() >0 THEN
                         FOR l_j = 1 TO l_bd.getlength()
                           IF (l_hrboa.hrboa02 <=l_bd[l_j].a  AND l_hrcda06 > l_bd[l_j].a  ) OR (l_hrboa.hrboa02 >=l_bd[l_j].a  AND l_hrcda06 <= l_bd[l_j].a)  OR (l_hrboa.hrboa02 >l_bd[l_j].a  AND l_hrboa.hrboa02 < l_bd[l_j].b)THEN
                              IF l_bd[l_j].a >= l_hrboa.hrboa02 THEN
                                 LET l_bd[l_j].a = l_bd[l_j].a
                              ELSE
                                LET l_bd[l_j].a = l_hrboa.hrboa02
                              END IF
                              IF l_bd[l_j].b >=l_hrcda06  THEN
                                 LET l_bd[l_j].b = l_hrcda06
                              ELSE
                                 LET l_bd[l_j].b = l_bd[l_j].b
                              END IF
                           ELSE
                              LET l_bd[l_i].a = l_hrboa.hrboa02
                              LET l_bd[l_i].b = l_hrcda06
                              LET l_i = l_i +1
                           END IF

                         END FOR
                      ELSE
                         LET l_bd[l_i].a = l_hrboa.hrboa02
                         LET l_bd[l_i].b = l_hrcda06
                         LET l_i = l_i +1
                      END IF
                   END IF
                   IF l_hrcda06 > l_hrboa.hrboa02 AND l_hrcda08 < l_hrboa.hrboa05 THEN
                      LET l_j = 1
                      IF l_bd.getlength() >0 THEN
                         FOR l_j = 1 TO l_bd.getlength()
                           IF (l_hrboa.hrboa02 <=l_bd[l_j].a  AND l_hrcda06 > l_bd[l_j].a  ) OR (l_hrboa.hrboa02 >=l_bd[l_j].a  AND l_hrcda06 <= l_bd[l_j].a)  OR (l_hrboa.hrboa02 >l_bd[l_j].a  AND l_hrboa.hrboa02 < l_bd[l_j].b)THEN
                              IF l_bd[l_j].a >= l_hrboa.hrboa02 THEN
                                 LET l_bd[l_j].a = l_bd[l_j].a
                              ELSE
                                LET l_bd[l_j].a = l_hrboa.hrboa02
                              END IF
                              IF l_bd[l_j].b >=l_hrcda06  THEN
                                 LET l_bd[l_j].b = l_hrcda06
                              ELSE
                                 LET l_bd[l_j].b = l_bd[l_j].b
                              END IF
                           ELSE
                              LET l_bd[l_i].a = l_hrboa.hrboa02
                              LET l_bd[l_i].b = l_hrcda06
                              LET l_i = l_i +1
                           END IF

                         END FOR
                      ELSE
                         LET l_bd[l_i].a = l_hrboa.hrboa02
                         LET l_bd[l_i].b = l_hrcda06
                         LET l_i = l_i +1
                      END IF
                      LET l_j = 1
                      IF l_bd.getlength() >0 THEN
                         FOR l_j = 1 TO l_bd.getlength()
                           IF (l_hrcda08 <=l_bd[l_j].a  AND l_hrboa.hrboa05 > l_bd[l_j].a  ) OR (l_hrcda08 >=l_bd[l_j].a  AND l_hrboa.hrboa05 <= l_bd[l_j].a)  OR (l_hrcda08 >l_bd[l_j].a  AND l_hrcda08 < l_bd[l_j].b)THEN
                              IF l_bd[l_j].a >= l_hrcda08 THEN
                                 LET l_bd[l_j].a = l_bd[l_j].a
                              ELSE
                                LET l_bd[l_j].a = l_hrcda08
                              END IF
                              IF l_bd[l_j].b >=l_hrboa.hrboa05  THEN
                                 LET l_bd[l_j].b = l_hrboa.hrboa05
                              ELSE
                                 LET l_bd[l_j].b = l_bd[l_j].b
                              END IF
                           ELSE
                              LET l_bd[l_i].a = l_hrcda08
                              LET l_bd[l_i].b = l_hrboa.hrboa05
                              LET l_i = l_i +1
                           END IF

                         END FOR
                      ELSE
                         LET l_bd[l_i].a = l_hrcda08
                         LET l_bd[l_i].b = l_hrboa.hrboa05
                         LET l_i = l_i +1
                      END IF
                   END IF
                END FOREACH
            ELSE #本班段无假勤处理
               LET l_bd[l_i].a = l_hrboa.hrboa02
               LET l_bd[l_i].b = l_hrboa.hrboa05
               LET l_i = l_i +1
            END IF
          ELSE #跨天班次待续
              SELECT COUNT(*) INTO l_n FROM  temp3
              WHERE (hrcda06 <= hrcda08 AND hrcda06 <=l_hrboa.hrboa02 AND (substr(hrcda08,1,2)*60+substr(hrcda08,4,2)) <= 1440 AND hrcda08 >= l_hrboa.hrboa02 )
              OR  (hrcda06 <= hrcda08 AND hrcda06 >l_hrboa.hrboa02 AND (substr(hrcda08,1,2)*60+substr(hrcda08,4,2)) <= 1440)
              OR  (hrcda06 <= hrcda08 AND hrcda06 <= l_hrboa.hrboa05 AND hrcda08 >= l_hrboa.hrboa05)
              OR  (hrcda06 <= hrcda08 AND hrcda08 <= l_hrboa.hrboa05)
              OR  (hrcda06 > hrcda08 AND hrcda06 <= l_hrboa.hrboa02 AND hrcda08 < l_hrboa.hrboa05)
              OR  (hrcda06 > hrcda08 AND hrcda06 > l_hrboa.hrboa02 AND (substr(hrcda06,1,2)*60+substr(hrcda06,4,2)) <= 1440 AND hrcda08 <= l_hrboa.hrboa05)
              OR  (hrcda06 > hrcda08 AND hrcda06 > l_hrboa.hrboa02 AND (substr(hrcda06,1,2)*60+substr(hrcda06,4,2)) <= 1440 AND hrcda08 > l_hrboa.hrboa05)
              IF l_n >0 THEN
                LET l_sql = " SELECT hrcda06,hrcda08,hrcda09  FROM temp3 ",
                            " WHERE (hrcda06 <= hrcda08 AND hrcda06 <='",l_hrboa.hrboa02,"' AND (substr(hrcda08,1,2)*60+substr(hrcda08,4,2)) <= 1440 AND hrcda08 >=",l_hrboa.hrboa02, "')",
                            " OR (hrcda06 <= hrcda08 AND hrcda06 >'",l_hrboa.hrboa02,"' AND (substr(hrcda08,1,2)*60+substr(hrcda08,4,2)) <= 1440 )",
                            " OR (hrcda06 <= hrcda08 AND hrcda06 <='",l_hrboa.hrboa05,"' AND hrcda08 >='",l_hrboa.hrboa05,"')",
                            " OR (hrcda06 <= hrcda08 AND hrcda08 <='",l_hrboa.hrboa05,"')" ,
                            " OR (hrcda06 > hrcda08 AND hrcda06 <= '",l_hrboa.hrboa02,"' AND hrcda08 < '",l_hrboa.hrboa05,"')",
                            " OR (hrcda06 > hrcda08 AND hrcda06 > '",l_hrboa.hrboa02,"' AND (substr(hrcda06,1,2)*60+substr(hrcda06,4,2)) <= 1440 AND hrcda08 <= '",l_hrboa.hrboa05,"')",
                            " OR (hrcda06 > hrcda08 AND hrcda06 > '",l_hrboa.hrboa02,"' AND (substr(hrcda06,1,2)*60+substr(hrcda06,4,2)) <= 1440 AND hrcda08 > '",l_hrboa.hrboa05,"') order by hrcda06"

                PREPARE p056_p3_31 FROM l_sql
                DECLARE p056_p3_1s21 CURSOR FOR p056_p3_31
                FOREACH p056_p3_1s21  INTO l_hrcda06,l_hrcda08,l_hrcda09
                SELECT substr(l_hrcda08,1,2)*60+substr(l_hrcda08,4,2) INTO l_hrcda08_n FROM dual
               IF l_hrcda06 <= l_hrcda08 AND l_hrcda06 <=l_hrboa.hrboa02 AND l_hrcda08_n <= 1440 AND l_hrcda08 >= l_hrboa.hrboa02 THEN
                  LET l_bd[l_i].a = l_hrcda08
                  LET l_bd[l_i].b = l_hrboa.hrboa05
                  LET l_i = l_i +1
               END IF

               IF l_hrcda06 <= l_hrcda08 AND l_hrcda06 >l_hrboa.hrboa02 AND l_hrcda08_n <= 1440 THEN
                  LET l_bd[l_i].a = l_hrboa.hrboa02
                  LET l_bd[l_i].b = l_hrcda06
                  LET l_i = l_i +1
                  LET l_bd[l_i].a = l_hrcda08
                  LET l_bd[l_i].b = l_hrboa.hrboa05
                  LET l_i = l_i +1
               END IF

               IF l_hrcda06 <= l_hrcda08 AND l_hrcda06 <= l_hrboa.hrboa05 AND l_hrcda08 >= l_hrboa.hrboa05 THEN
                  LET l_bd[l_i].a = l_hrboa.hrboa02
                  LET l_bd[l_i].b = l_hrcda06
                  LET l_i = l_i +1
               END IF

               IF l_hrcda06 <= l_hrcda08 AND l_hrcda06 <= l_hrboa.hrboa05 AND l_hrcda08 < l_hrboa.hrboa05 THEN
                  LET l_bd[l_i].a = l_hrboa.hrboa02
                  LET l_bd[l_i].b = l_hrcda06
                  LET l_i = l_i +1
                  LET l_bd[l_i].a = l_hrcda08
                  LET l_bd[l_i].b = l_hrboa.hrboa05
                  LET l_i = l_i +1
               END IF

               IF l_hrcda06 > l_hrcda08 AND l_hrcda06 <= l_hrboa.hrboa02 AND l_hrcda08 < l_hrboa.hrboa05 THEN
                  LET l_bd[l_i].a = l_hrcda08
                  LET l_bd[l_i].b = l_hrboa.hrboa05
                  LET l_i = l_i +1
               END IF
               SELECT substr(l_hrcda06,1,2)*60+substr(l_hrcda06,4,2) INTO l_hrcda06_n FROM dual
               IF l_hrcda06 > l_hrcda08 AND l_hrcda06 > l_hrboa.hrboa02 AND l_hrcda06_n <= 1440 AND l_hrcda08 <= l_hrboa.hrboa05 THEN
                  LET l_bd[l_i].a = l_hrboa.hrboa02
                  LET l_bd[l_i].b = l_hrcda06
                  LET l_i = l_i +1
                  LET l_bd[l_i].a = l_hrcda08
                  LET l_bd[l_i].b = l_hrboa.hrboa05
                  LET l_i = l_i +1
               END IF

               IF l_hrcda06 > l_hrcda08 AND l_hrcda06 > l_hrboa.hrboa02 AND l_hrcda06_n <= 1440 AND l_hrcda08 > l_hrboa.hrboa05 THEN
                  LET l_bd[l_i].a = l_hrboa.hrboa02
                  LET l_bd[l_i].b = l_hrcda06
                  LET l_i = l_i +1
               END IF
               END FOREACH
            ELSE
               LET l_bd[l_i].a = l_hrboa.hrboa02
               LET l_bd[l_i].b = l_hrboa.hrboa05
               LET l_i = l_i +1
            END IF
          END IF
          LET l_a = 1
          FOR  l_a = 1 TO l_bd.getlength()
              IF l_bd[l_a].a != l_hrboa.hrboa02 THEN
                 LET l_hrboa03 = 'Y'
              ELSE
                 LET l_hrboa03 = l_hrboa.hrboa03
              END IF
              IF l_bd[l_a].b != l_hrboa.hrboa05 THEN
                 LET l_hrboa06 = 'Y'
              ELSE
                 LET l_hrboa06 = l_hrboa.hrboa06
              END IF
              IF NOT cl_null(l_bd[l_a].a) AND NOT cl_null(l_bd[l_a].b) THEN
              INSERT INTO temp5 VALUES(l_hrboa.hrboa01,l_bd[l_a].a,l_hrboa03,l_hrboa.hrboa04,l_bd[l_a].b ,l_hrboa06,l_hrboa.hrboa07,l_hrboa.hrboa11,l_hrboa.hrboa12,l_hrboa.hrboa13)
              END IF
          END FOR
          SELECT MIN(hrboa02) INTO l_hrboa02 FROM TEMP5
           WHERE hrboa01 = l_hrboa.hrboa01
           IF l_hrboa02 != l_hrboa.hrboa02 THEN
              UPDATE temp5 SET hrboa03 = l_hrboa.hrboa03
              WHERE  hrboa02 = l_hrboa02
                AND  hrboa01 = l_hrboa.hrboa01
           END IF
           SELECT MAX(hrboa05) INTO l_hrboa05 FROM TEMP5
            WHERE hrboa01 = l_hrboa.hrboa01
           IF l_hrboa05 != l_hrboa.hrboa05 THEN
              UPDATE temp5 SET hrboa06 = l_hrboa.hrboa06
              WHERE  hrboa05 = l_hrboa05
                AND  hrboa01 = l_hrboa.hrboa01
           END IF
       END FOREACH
       #-------------------更新取卡提前，取卡退后时间 star
       LET l_sql = " SELECT hrboa02,hrboa05 from temp5 "
       PREPARE p056_p3_3 FROM l_sql
       DECLARE p056_p3_1s2 CURSOR FOR p056_p3_3
       LET l_n = 1
       FOREACH p056_p3_1s2  INTO l_hrboa02,l_hrboa05
          IF l_n = 1 THEN
             LET l_a1 = l_hrboa02
             LET l_b1 = l_hrboa05
          ELSE
             CALL  p056_mi(l_hrboa02,l_hrboa05) RETURNING l_hrboa04
             UPDATE temp5 SET hrboa04 = l_hrboa04/2
              WHERE hrboa02 = l_hrboa02
             UPDATE temp5 SET hrboa07 = l_hrboa04/2
              WHERE hrboa02 = l_a1
          END IF
          LET l_a1 = l_hrboa02
          LET l_b1 = l_hrboa05
          LET l_n = l_n +1
       END FOREACH
           #-------------------更新取卡提前，取卡退后时间 end
       CALL p056_p3_1()
   END IF
   #CALL p056_p4(p_hrcp04)
   CALL p056_p4_0(p_hrcp04)
END FUNCTION
FUNCTION p056_p3_1() #补充时间班段生成
DEFINE l_hrcp06   LIKE hrcp_file.hrcp06
DEFINE l_n        LIKE type_file.num5
DEFINE l_a,l_b    LIKE hrboa_file.hrboa02
   SELECT hrcp06 INTO l_hrcp06 FROM hrcp_file
    WHERE hrcp02=l_name
      AND hrcp03=g_date
   IF NOT cl_null(l_hrcp06) THEN
      SELECT instr(l_hrcp06,'-',1,1) INTO l_n FROM  dual
      IF l_n > 0 THEN
         SELECT  substr(l_hrcp06,1,instr(l_hrcp06,'-',1,1) - 1) INTO l_a FROM  dual
         SELECT  substr(l_hrcp06,instr(l_hrcp06,'-',1,1) +1 ,5) INTO l_b FROM  dual
         INSERT INTO temp5 VALUES('a',l_a,'Y',30,l_b,'Y',30,0,0,0)
      END IF
      SELECT instr(l_hrcp06,'-',1,2) INTO l_n FROM  dual
      IF l_n > 0 THEN
         SELECT  substr(l_hrcp06,13,instr(l_hrcp06,'-',1,2) - 1) INTO l_a FROM  dual
         SELECT  substr(l_hrcp06,instr(l_hrcp06,'-',1,2) +1 ,5) INTO l_b FROM  dual
         INSERT INTO temp5 VALUES('a',l_a,'Y',30,l_b,'Y',30,0,0,0)
      END IF
      SELECT instr(l_hrcp06,'-',1,3) INTO l_n FROM  dual
      IF l_n > 0 THEN
         SELECT  substr(l_hrcp06,25,instr(l_hrcp06,'-',1,3) - 1) INTO l_a FROM  dual
         SELECT  substr(l_hrcp06,instr(l_hrcp06,'-',1,3) +1 ,5) INTO l_b FROM  dual
         INSERT INTO temp5 VALUES('a',l_a,'Y',30,l_b,'Y',30,0,0,0)
      END IF
   END IF
END FUNCTION

FUNCTION p056_p4_pre(l_hrcp04)
DEFINE l_hrcp04       LIKE hrcp_file.hrcp04
DEFINE l_sql          STRING
DEFINE l_head_col1    LIKE type_file.num10
DEFINE l_head_col2    LIKE type_file.num10
DEFINE l_head_cc      LIKE type_file.num10
DEFINE l_cc           LIKE type_file.num10
DEFINE l_hrcp22       LIKE hrcp_file.hrcp22
DEFINE l_hrcp23       LIKE hrcp_file.hrcp23
DEFINE l_hrcp24       LIKE hrcp_file.hrcp24
DEFINE l_hrcp25       LIKE hrcp_file.hrcp25
DEFINE l_hrcp26       LIKE hrcp_file.hrcp26
DEFINE l_hrcp27       LIKE hrcp_file.hrcp27
DEFINE l_hrcp28       LIKE hrcp_file.hrcp28
DEFINE l_hrcp29       LIKE hrcp_file.hrcp29
DEFINE l_hrcp30       LIKE hrcp_file.hrcp30
DEFINE l_hrcp31       LIKE hrcp_file.hrcp31
DEFINE l_hrcp32       LIKE hrcp_file.hrcp32
DEFINE l_hrcp33       LIKE hrcp_file.hrcp33

  SELECT col1,col2,cc INTO l_head_col1,l_head_col2,l_head_cc FROM HRBO_HEAD WHERE hrboa15=l_hrcp04

  LET l_sql = "
  SELECT COUNT(*)
    FROM (SELECT ROW_NUMBER() OVER(ORDER BY HRBY05, HRBY06) COL0,
                 HRBY05, HRBY06, (HRBY05 - to_date('",g_date,"','yy/mm/dd')) * 24 * 60 + TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2)) COL1
            FROM HRBY_FILE
           WHERE HRBY09 = '",l_name,"' AND HRBYACTI = 'Y'
             AND ((HRBY05 - to_date('",g_date,"','yy/mm/dd')) * 24 * 60 + TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2))) BETWEEN ",l_head_col1," AND ",l_head_col2,") A
    LEFT JOIN (SELECT ROW_NUMBER() OVER(ORDER BY COL1, CF) COL0, HRBO_BODY.* FROM HRBO_BODY WHERE HRBOA15 = '",l_hrcp04,"') B
      ON A.COL0 = B.COL0
   WHERE A.COL0 <= 4 AND A.COL1 BETWEEN B.COL1 AND B.COL2"
  PREPARE get_p4_pre FROM l_sql
  DECLARE get_c4_pre CURSOR FOR get_p4_pre
  FOREACH get_c4_pre INTO l_cc
    IF l_cc = l_head_cc THEN
      LET l_sql = "SELECT *
        FROM (SELECT ROW_NUMBER() OVER(ORDER BY HRBY05, HRBY06) COL0, HRBY06
                FROM HRBY_FILE
               WHERE HRBY09 = '",l_name,"' AND HRBYACTI = 'Y'
                 AND ((HRBY05 - to_date('",g_date,"','yy/mm/dd')) * 24 * 60 + TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2))) BETWEEN ",l_head_col1," AND ",l_head_col2,")
               PIVOT(MAX(HRBY06) FOR COL0 IN(1,2,3,4,5,6,7,8,9,10,11,12))"
      PREPARE get_p4_pre1 FROM l_sql
      DECLARE get_c4_pre1 CURSOR FOR get_p4_pre1
      FOREACH get_c4_pre1 INTO l_hrcp22,l_hrcp23,l_hrcp24,l_hrcp25,l_hrcp26,l_hrcp27,l_hrcp28,l_hrcp29,l_hrcp30,l_hrcp31,l_hrcp32,l_hrcp33
        UPDATE hrcp_file SET hrcp22=l_hrcp22,
                         hrcp23=l_hrcp23,
                         hrcp24=l_hrcp24,
                         hrcp25=l_hrcp25,
                         hrcp26=l_hrcp26,
                         hrcp27=l_hrcp27,
                         hrcp28=l_hrcp28,
                         hrcp29=l_hrcp29,
                         hrcp30=l_hrcp30,
                         hrcp31=l_hrcp31,
                         hrcp32=l_hrcp32,
                         hrcp33=l_hrcp33
        WHERE hrcp02=l_name AND hrcp03=g_date
      END FOREACH
    END IF
  END FOREACH

END FUNCTION

FUNCTION p056_p4_0(l_hrcp04)
DEFINE l_hrcp04 LIKE hrcp_file.hrcp04
DEFINE l_sql      STRING
DEFINE l_ct,t_ct          LIKE type_file.chr1
DEFINE l_rt,l_bt,l_et     LIKE type_file.num5
DEFINE l_hrby06,t_hrby06_1,t_hrby06_2,t_hrby06_3,l_w1,l_w2  LIKE hrby_file.hrby06
DEFINE l_minutes  LIKE type_file.num10
DEFINE l_n        LIKE type_file.num5
DEFINE l_s        LIKE type_file.chr100
DEFINE l_time LIKE type_file.num10
DEFINE l_flag LIKE type_file.chr1 #标记班段刷卡点有没有取到刷卡
DEFINE l_min1,l_max1 LIKE hrby_file.hrby06
DEFINE l_cp22,l_cp221 LIKE hrcp_file.hrcp22
DEFINE l_cp23 LIKE hrcp_file.hrcp23
DEFINE l_cc   LIKE type_file.num5
DEFINE l_bc   LIKE hrcp_file.hrcp04
DEFINE l_kais,l_jies,l_qi,l_mo LIKE type_file.num5
DEFINE l_tiq LIKE hrboa_file.hrboa04
DEFINE l_tui LIKE hrboa_file.hrboa07
DEFINE l_jb_1 LIKE type_file.num5   #add by wangwy 20160310
DEFINE l_hrcn05_j LIKE hrcn_file.hrcn05    #add by wangwy 20160310
DEFINE l_hrcn07_j LIKE hrcn_file.hrcn07    #add by wangwy 20160310

    UPDATE hrcp_file SET hrcp22='', hrcp23='', hrcp24='', hrcp25='', hrcp26='', hrcp27='',
                         hrcp28='', hrcp29='', hrcp30='', hrcp31='', hrcp32='', hrcp33=''
    WHERE hrcp02=l_name AND hrcp03=g_date
  #CALL p056_p4_pre(l_hrcp04)
  LET l_sql = "
  SELECT C.*,D.*
   FROM (SELECT A.CT, CASE WHEN RT < RB THEN RT + 1440 ELSE RT END RT,
             CASE WHEN BT < RB AND RT <> RB THEN BT + 1440 ELSE BT END BT,
             CASE WHEN ET < RB THEN ET + 1440 ELSE ET END ET
        FROM (SELECT HRBOA15, 'B' CT,
                     TO_NUMBER(SUBSTR(HRBOA02, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA02, 4, 2)) - HRBOA04 BT,
                     TO_NUMBER(SUBSTR(HRBOA02, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA02, 4, 2)) RT,
                     TO_NUMBER(SUBSTR(HRBOA05, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA05, 4, 2)) ET
                FROM HRBOA_FILE WHERE HRBOA03 = 'Y'
              UNION
              SELECT HRBOA15, '' CT,
                     TO_NUMBER(SUBSTR(HRBOA02, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA02, 4, 2)) BT,
                     TO_NUMBER(SUBSTR(HRBOA02, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA02, 4, 2)) RT,
                     TO_NUMBER(SUBSTR(HRBOA05, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA05, 4, 2)) ET
                FROM HRBOA_FILE WHERE HRBOA10 = 'N'
              UNION
              SELECT HRBOA15, 'E' CT,
                     TO_NUMBER(SUBSTR(HRBOA02, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA02, 4, 2)) BT,
                     TO_NUMBER(SUBSTR(HRBOA05, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA05, 4, 2)) RT,
                     TO_NUMBER(SUBSTR(HRBOA05, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBOA05, 4, 2)) + HRBOA07 ET
                FROM HRBOA_FILE WHERE HRBOA06 = 'Y') A
        LEFT JOIN (SELECT HRBO02, TO_NUMBER(SUBSTR(HRBO04, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBO04, 4, 2)) RB FROM HRBO_FILE) B
          ON HRBO02 = HRBOA15
       WHERE A.HRBOA15 = '",l_hrcp04,"') C
   LEFT JOIN (SELECT HRBY06, TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2)) MINUTES
                FROM HRBY_FILE WHERE HRBY09 = '",l_name,"' AND HRBY05 = TO_DATE('",g_date,"', 'yy/mm/dd') AND HRBYACTI = 'Y' AND HRBY10 IN ('1','6')
              UNION
              SELECT HRBY06, TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2)) - 24 * 60 MINUTES
                FROM HRBY_FILE WHERE HRBY09 = '",l_name,"' AND HRBY05 = TO_DATE('",g_date,"', 'yy/mm/dd') - 1 AND HRBYACTI = 'Y' AND HRBY10 IN ('1','6')
              UNION
              SELECT HRBY06, TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2)) + 24 * 60 MINUTES
                FROM HRBY_FILE WHERE HRBY09 = '",l_name,"' AND HRBY05 = TO_DATE('",g_date,"', 'yy/mm/dd') + 1 AND HRBYACTI = 'Y' AND HRBY10 IN ('1','6')) D
      ON D.MINUTES BETWEEN C.BT AND C.ET
   ORDER BY C.BT,D.MINUTES"
  LET l_n=21
  LET l_time = -2000
  LET t_ct = 'X'
  LET l_flag = "Y"
  PREPARE get_hrby_p0 FROM l_sql
  DECLARE get_hrby_c0 CURSOR FOR get_hrby_p0
  FOREACH get_hrby_c0 INTO l_ct,l_rt,l_bt,l_et,l_hrby06,l_minutes
#    IF cl_null(l_hrby06) THEN
#      CONTINUE FOREACH
#    END IF
    IF l_minutes - l_time < 0 THEN
      #新取出的时间与一笔时间间隔时间在6分钟之内时跳过
      CONTINUE FOREACH
    END IF
    IF l_minutes - l_time < 1 AND t_ct = l_ct AND l_minutes>l_rt AND l_time>l_rt THEN  #add l_minutes &l_time by nihuan 20160712
      #新取出的时间与一笔时间间隔时间在6分钟之内时跳过  #mod by kuangxj170921 改成1分钟
      CONTINUE FOREACH
    END IF
    #add by zhuzw 20150922 start
    IF l_minutes - l_time > 0 AND t_ct = l_ct AND l_ct = 'B' THEN #上班时，取最小一笔
        CONTINUE FOREACH
    END IF
    #add by zhuzw 20150922 end
    IF t_ct = 'X' THEN
      LET t_ct = l_ct
    END IF
    IF t_ct = l_ct THEN
      CASE l_ct
        WHEN 'B'
          IF l_minutes <= l_rt THEN #刷卡发生在班段开始之前
            LET t_hrby06_1 = l_hrby06
          ELSE
            IF cl_null(t_hrby06_2) THEN
              LET t_hrby06_2 = l_hrby06
   #           LET l_w1 = t_hrby06_2               #add by wangwy 2015-09-11    用于下午班段不到刷卡记录是取上午班段得记录作为下班卡
            ELSE
              LET t_hrby06_3 = l_hrby06
            END IF
          END IF
        WHEN 'E'
          IF l_minutes <= l_rt THEN #刷卡发生在班段开始之前
            LET t_hrby06_1 = l_hrby06
          ELSE
            IF cl_null(t_hrby06_2) THEN
              LET t_hrby06_2 = l_hrby06
            ELSE
              LET t_hrby06_3 = l_hrby06
            END IF
          END IF
        OTHERWISE
          LET t_hrby06_2 = l_hrby06
      END CASE
    ELSE
      CASE t_ct
        WHEN 'B'  #循环完上班段所有刷卡时
          IF NOT cl_null(t_hrby06_1) THEN     #如果上班时间点前取到了刷卡，则将上班前的刷卡时间更新到系统
            IF l_flag = "N" THEN
              LET l_n = l_n + 2               #上班卡没有处理到时，将上班刷卡栏位空出
            ELSE
              LET l_n = l_n + 1
            END IF
            LET l_s = l_n
            LET l_s='hrcp',l_s
            LET l_sql="UPDATE hrcp_file SET ",l_s,"='",t_hrby06_1,"'",
                     " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
            PREPARE upd_p0_0 FROM l_sql
            EXECUTE upd_p0_0
            LET l_flag = "Y"
            LET t_hrby06_1 = ""
            LET t_hrby06_2 = ""
          ELSE
            IF NOT cl_null(t_hrby06_2) THEN   #如果上班前没有取到刷卡，将将上班后第一笔卡视为上班卡
              IF l_flag = "N" THEN
                LET l_n = l_n + 2               #上班卡没有处理到时，将上班刷卡栏位空出
              ELSE
                LET l_n = l_n + 1
              END IF
              LET l_s = l_n
              LET l_s='hrcp',l_s
              LET l_sql="UPDATE hrcp_file SET ",l_s,"='",t_hrby06_2,"'",
                       " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
              PREPARE upd_p0_1 FROM l_sql
              EXECUTE upd_p0_1
              LET l_flag = "Y"
              LET t_hrby06_1 = ""
              LET t_hrby06_2 = ""
            ELSE                              #整个上班班段都没有取到上班卡，打下标记，以备后续方案处理。
              LET l_flag = "N"
            END IF
          END IF
        WHEN 'E'
          IF NOT cl_null(t_hrby06_2) THEN     #取到第一笔刷卡后，将其视为下班卡
            IF l_flag = "N" THEN
              LET l_n = l_n + 2               #上班卡没有处理到时，将上班刷卡栏位空出
            ELSE
              LET l_n = l_n + 1
            END IF
            LET l_s = l_n
            LET l_s='hrcp',l_s
            LET l_sql="UPDATE hrcp_file SET ",l_s,"='",t_hrby06_2,"'",
                     " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
            PREPARE upd_p0_2 FROM l_sql
            EXECUTE upd_p0_2
            LET l_flag = "Y"
            LET t_hrby06_1 = ""
            LET t_hrby06_2 = ""
          ELSE    #班段结束时间点后，没有取到刷卡
            IF NOT cl_null(t_hrby06_1) THEN   #如果在前一班段取卡区间内刷卡有盈余，将取出作为员工早退的刷卡使用
              IF l_flag = "N" THEN
                LET l_n = l_n + 2               #上班卡没有处理到时，将上班刷卡栏位空出
              ELSE
                LET l_n = l_n + 1
              END IF
              LET l_s = l_n
              LET l_s='hrcp',l_s
              LET l_sql="UPDATE hrcp_file SET ",l_s,"='",t_hrby06_1,"'",
                       " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
              PREPARE upd_p0_3 FROM l_sql
              EXECUTE upd_p0_3
              LET l_flag = "Y"
              LET t_hrby06_1 = ""
              LET t_hrby06_2 = ""
            ELSE
              LET l_flag = "N"
            END IF
          END IF
        OTHERWISE
      END CASE
      CASE l_ct
        WHEN 'B'
        WHEN 'E'    #更换班段后，如果当前班段为上班刷卡区间段时
          LET t_hrby06_1 = l_hrby06           #将更换后的刷卡记录下来，此刷卡为班段结束时间后的第一笔刷卡
        OTHERWISE
          LET t_hrby06_1 = l_hrby06           #进入非上下班班段的中间地带
  #        LET l_w2 = t_hrby06_1
          IF l_flag = "N" THEN
            IF NOT cl_null(t_hrby06_1) THEN   #如果在前一班段取卡区间内刷卡有盈余，将取出作为员工早退的刷卡使用
              LET l_n = l_n + 1
              LET l_s = l_n
              LET l_s='hrcp',l_s
              LET l_sql="UPDATE hrcp_file SET ",l_s,"='",t_hrby06_1,"'",
                       " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
              PREPARE upd_p0_6 FROM l_sql
              EXECUTE upd_p0_6
              LET l_flag = "Y"
              LET t_hrby06_1 = ""
            ELSE
              LET l_flag = "N"
            END IF
          END IF
#          LET t_hrby06_2 = ""
      END CASE
    END IF

    LET l_time = l_minutes
    LET t_ct = l_ct
  END FOREACH
  SELECT hrcp22,hrcp23 INTO l_cp22,l_cp23 FROM hrcp_file WHERE hrcp02 = l_name AND hrcp03 = g_date
  IF NOT cl_null(t_hrby06_1) THEN
   LET l_cp23 = t_hrby06_1
  END IF
#add by wangwy 20160224 start
  IF NOT cl_null(t_hrby06_2) THEN
   LET l_cp23 = t_hrby06_2
  END IF
#add by wangwy 20160224 end
  SELECT hrcp04 INTO l_bc FROM hrcp_file WHERE hrcp02 = l_name AND hrcp03 = g_date
  SELECT COUNT(*) INTO l_cc FROM hrby_file WHERE hrby09 = l_name AND hrby05 = g_date AND hrby10 IN ('1','6') AND hrbyacti = 'Y'
  IF l_cc > 1 THEN
   SELECT substr(hrboa02,1,2)*60+substr(hrboa02,4,2),hrboa04 INTO l_kais,l_tiq FROM hrboa_file WHERE hrboa15 = l_bc AND hrboa03 = 'Y'
   SELECT substr(hrboa05,1,2)*60+substr(hrboa05,4,2),hrboa07 INTO l_jies,l_tui FROM hrboa_file WHERE hrboa15 = l_bc AND hrboa06 = 'Y'
   LET l_qi = l_kais - l_tiq
   LET l_mo = l_jies + l_tui
   IF cl_null(l_cp22) THEN
    SELECT MIN(hrby06) INTO l_min1 from hrby_file WHERE hrby09 = l_name AND hrby05 = g_date AND hrbyacti = 'Y' AND hrby10 IN ('1','6') AND (substr(hrby06,1,2)*60+substr(hrby06,4,5))>=l_qi AND (substr(hrby06,1,2)*60+substr(hrby06,4,5))<=l_mo
    IF NOT cl_null(l_cp23) THEN
      IF l_cp23 != l_min1 THEN
        UPDATE hrcp_file SET hrcp22 = l_min1 WHERE hrcp02 = l_name AND hrcp03 = g_date
        UPDATE hrcp_file SET hrcp23 = l_cp23 WHERE hrcp02 = l_name AND hrcp03 = g_date
      ELSE
        UPDATE hrcp_file SET hrcp23 = l_cp23 WHERE hrcp02 = l_name AND hrcp03 = g_date
      END IF
    ELSE
      UPDATE hrcp_file SET hrcp22 = l_min1 WHERE hrcp02 = l_name AND hrcp03 = g_date
    END IF
    LET t_hrby06_2 = ""
    LET t_hrby06_1 = ""
   END IF
   IF cl_null(l_cp23) THEN
    SELECT hrcp22 INTO l_cp221 FROM hrcp_file WHERE hrcp02 = l_name AND hrcp03 = g_date
    SELECT max(hrby06) INTO l_max1 from hrby_file WHERE hrby09 = l_name AND hrby05 = g_date AND hrbyacti = 'Y' AND hrby10 IN ('1','6') AND (substr(hrby06,1,2)*60+substr(hrby06,4,5))>=l_qi AND (substr(hrby06,1,2)*60+substr(hrby06,4,5))<=l_mo
    IF l_max1 != l_cp221 THEN
    UPDATE hrcp_file SET hrcp23 = l_max1 WHERE hrcp02 = l_name AND hrcp03 = g_date
    LET t_hrby06_2 = ""
    LET t_hrby06_1 = ""
    END IF
   END IF
  END IF

#add by wangwy 20160310 start
  SELECT COUNT(*) INTO l_jb_1 FROM hrcn_file WHERE hrcn03=l_name AND hrcn14=g_date AND hrcnconf='Y'
   IF l_jb_1 > 0 THEN
      SELECT hrcn05,hrcn07 INTO l_hrcn05_j,l_hrcn07_j FROM hrcn_file WHERE hrcn03=l_name AND hrcn14=g_date AND hrcnconf='Y'
      IF l_hrcn05_j = t_hrby06_2 AND l_hrcn07_j = t_hrby06_3 THEN
         LET t_hrby06_2 = t_hrby06_1
         LET g_ff = "Y"
      END IF
   END IF
#add by wangwy 20160310 end

  IF NOT cl_null(t_hrby06_2) THEN     #取到第一笔刷卡后，将其视为下班卡
    IF l_flag = "N" THEN
      LET l_n = l_n + 2               #上班卡没有处理到时，将上班刷卡栏位空出
    ELSE
      LET l_n = l_n + 1
    END IF
    LET l_s = l_n
    LET l_s='hrcp',l_s
    LET l_sql="UPDATE hrcp_file SET ",l_s,"='",t_hrby06_2,"'",
             " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
    PREPARE upd_p0_4 FROM l_sql
    EXECUTE upd_p0_4
    LET l_flag = "Y"
    LET t_hrby06_1 = ""
    LET t_hrby06_2 = ""
  ELSE    #班段结束时间点后，没有取到刷卡
    IF NOT cl_null(t_hrby06_1) THEN   #如果在前一班段取卡区间内刷卡有盈余，将取出作为员工早退的刷卡使用
      LET l_n = l_n + 1
      LET l_s = l_n
      LET l_s='hrcp',l_s
      LET l_sql="UPDATE hrcp_file SET ",l_s,"='",t_hrby06_1,"'",
               " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
      PREPARE upd_p0_5 FROM l_sql
      EXECUTE upd_p0_5
      LET l_flag = "Y"
      LET t_hrby06_1 = ""
      LET t_hrby06_2 = ""
    ELSE
      LET l_flag = "N"
    END IF
  END IF
  #add by zhuzw 20150921 start
  IF g_hrbo.hrbo06 = 'Y' THEN
    UPDATE hrcp_file SET hrcp22='', hrcp23='', hrcp24='', hrcp25='', hrcp26='', hrcp27='',
                         hrcp28='', hrcp29='', hrcp30='', hrcp31='', hrcp32='', hrcp33=''
    WHERE hrcp02=l_name AND hrcp03=g_date
  END IF
  #add by zhuzw 20150921 end
  CALL p056_p5()
END FUNCTION

#FUNCTION p056_p4_0(l_hrcp04)
#DEFINE l_hrcp04  LIKE hrcp_file.hrcp04
#DEFINE l_sql      STRING
#DEFINE l_hrby06  LIKE hrby_file.hrby06
#DEFINE l_minutes LIKE type_file.num10
#DEFINE l_n        LIKE type_file.num5
#DEFINE l_s        LIKE type_file.chr100
#DEFINE l_time  LIKE type_file.num10
#  LET l_sql = "
#  SELECT HRBY06, MINUTES
#    FROM (SELECT HRBY06, TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2)) MINUTES
#            FROM HRBY_FILE
#           WHERE HRBY09 = '",l_name,"' AND HRBY05 = to_date('",g_date,"','yy/mm/dd') AND HRBYACTI='Y'
#          UNION
#          SELECT HRBY06, TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2)) - 24 * 60 MINUTES
#            FROM HRBY_FILE
#           WHERE HRBY09 = '",l_name,"' AND HRBY05 = to_date('",g_date,"','yy/mm/dd') - 1 AND HRBYACTI='Y'
#          UNION
#          SELECT HRBY06, TO_NUMBER(SUBSTR(HRBY06, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBY06, 4, 2)) + 24 * 60 MINUTES
#            FROM HRBY_FILE
#           WHERE HRBY09 = '",l_name,"' AND HRBY05 = to_date('",g_date,"','yy/mm/dd') + 1 AND HRBYACTI='Y') A
#   RIGHT JOIN (SELECT MAX(CASE WHEN HRBO04 = HRBOA02 THEN TO_NUMBER(SUBSTR(HRBO04, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBO04, 4, 2)) - HRBOA04 ELSE 0 END) MBE,
#                      MAX(CASE WHEN HRBO05 = HRBOA05 THEN TO_NUMBER(SUBSTR(HRBO05, 1, 2)) * 60 + TO_NUMBER(SUBSTR(HRBO05, 4, 2)) + HRBOA07 + NVL(HRBOB07,0) ELSE 0 END) MAF
#                 FROM HRBO_FILE
#                 LEFT JOIN HRBOA_FILE ON HRBOA15 = HRBO02
#                 LEFT JOIN hrbob_file ON hrbob09=hrbo02 AND hrbob10=hrboa01
#                WHERE HRBO02 = '",l_hrcp04,"' GROUP BY HRBO02) B
#      ON A.MINUTES BETWEEN MBE AND MAF
#   ORDER BY MINUTES"
#  LET l_n=22
#  LET l_time = -1500
#  PREPARE get_hrby_p0 FROM l_sql
#  DECLARE get_hrby_c0 CURSOR FOR get_hrby_p0
#  FOREACH get_hrby_c0 INTO l_hrby06,l_minutes
#    IF l_minutes-l_time < 15 THEN
#      CONTINUE FOREACH
#    END IF
#    LET l_s = l_n
#    LET l_s='hrcp',l_s
#    LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
#             " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
#    PREPARE upd_0 FROM l_sql
#    EXECUTE upd_0
#    LET l_time=l_minutes
#    LET l_n = l_n + 1
#  END FOREACH
#  CALL p056_p5()
#END FUNCTION

FUNCTION p056_p4(l_hrcp04)   #刷卡记录
DEFINE l_hrbtud02  LIKE hrbt_file.hrbtud02
DEFINE l_hrcp04    LIKE hrcp_file.hrcp04
DEFINE p_hrbo04    LIKE type_file.num5
DEFINE p_hrbo05    LIKE type_file.num5
DEFINE l_hrboa04   LIKE hrboa_file.hrboa04
DEFINE l_hrboa07   LIKE hrboa_file.hrboa07
DEFINE l_hrbo06    LIKE hrbo_file.hrbo06
      #add by zhuzw 20140924 start
    UPDATE hrcp_file SET hrcp22='',hrcp23='',hrcp24='',hrcp25='',hrcp26='',hrcp27='',hrcp28='',
                        hrcp29='',hrcp30='',hrcp31='',hrcp32='',hrcp33=''
    WHERE hrcp02=l_name
    AND hrcp03=g_date
      #add by zhuzw 20140924 end
      SELECT hrbo06 INTO l_hrbo06 FROM hrbo_file WHERE hrbo02 = l_hrcp04
      IF l_hrbo06 != 'Y' THEN
         #最早有效时间
         SELECT hrboa04 INTO l_hrboa04 FROM hrboa_file
                WHERE hrboa15=l_hrcp04 AND hrboa02=g_hrbo.hrbo04
         LET p_hrbo04 = g_hrbo.hrbo04[1,2] * 60 + g_hrbo.hrbo04[4,5]
         LET p_hrbo04 = p_hrbo04-l_hrboa04
         #最晚有效时间
         SELECT hrboa07 INTO l_hrboa07 FROM hrboa_file
                WHERE hrboa15=l_hrcp04 AND hrboa05=g_hrbo.hrbo05
         LET p_hrbo05 = g_hrbo.hrbo05[1,2] * 60 + g_hrbo.hrbo05[4,5]
         LET p_hrbo05 = p_hrbo05+l_hrboa07
         #刷卡方式
         SELECT hrbtud02 INTO l_hrbtud02 FROM hrbt_file
         CASE l_hrbtud02
            WHEN '001'
               CALL p056_p4_1(p_hrbo04,p_hrbo05)
            WHEN '002'
               CALL p056_p4_2(p_hrbo04,p_hrbo05)
            WHEN '003'
               CALL p056_p4_3(l_hrcp04)
               CALL p056_p4_4(l_hrcp04)
         END CASE
      END IF
      CALL p056_p5()
END FUNCTION
FUNCTION p056_mi(p_btime,p_etime)
DEFINE p_btime,p_etime  LIKE type_file.chr5
DEFINE l_a,l_b,l_c          LIKE type_file.num5
   LET l_a = p_btime[1,2] * 60 + p_btime[4,5]
   LET l_b = p_etime[1,2] * 60 + p_etime[4,5]
   LET l_c = l_b - l_a
   IF l_c < 0 THEN
      LET l_c = l_b + 1440 - l_a
   END IF
   RETURN l_c
END FUNCTION
FUNCTION p056_p4_1(l_hrbo04,l_hrbo05)
DEFINE l_sql      STRING
DEFINE l_s        LIKE type_file.chr100
DEFINE l_hrbo04   LIKE type_file.num5
DEFINE l_hrbo05   LIKE type_file.num5
DEFINE l_num      LIKE type_file.num5
DEFINE l_hrby06,l_hrby06_1,l_hrby06_2  LIKE hrby_file.hrby06
DEFINE l_hrby10   LIKE hrby_file.hrby10
DEFINE l_hrby10_t LIKE hrby_file.hrby10
DEFINE l_hrboa02  LIKE hrboa_file.hrboa02
DEFINE l_hrboa05_1 LIKE hrboa_file.hrboa05
   LET l_num=22
   IF g_hrbo.hrbo07='Y' THEN
      LET l_sql="SELECT hrby06,hrby10 FROM hrby_file WHERE hrbyacti='Y'",
                "   AND hrby05='",g_date,"' AND hrby09='",l_name,"' ",
                "   AND (hrby10='2' OR hrby10='3') AND hrby11='1'",
                "   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>='",l_hrbo04,"'",
                " ORDER BY hrby06"
      PREPARE get_hrby_p1 FROM l_sql
      DECLARE get_hrby_c1 CURSOR FOR get_hrby_p1
      FOREACH get_hrby_c1 INTO l_hrby06,l_hrby10
         IF l_hrby10_t=l_hrby10 THEN
            LET l_num=l_num-1
         END IF
         LET l_s=l_num
         LET l_s='hrcp',l_s
         LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                   " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
         PREPARE upd_1 FROM l_sql
         EXECUTE upd_1
         LET l_num=l_num+1
         LET l_hrby10_t=l_hrby10
         LET g_hrby06 = l_hrby06 #add by zhuzw 20150624
      END FOREACH
      LET l_sql="SELECT hrby06,hrby10 FROM hrby_file WHERE hrbyacti='Y'",
                "   AND hrby05='",g_date1,"' AND hrby09='",l_name,"' ",
                "   AND (hrby10='2' OR hrby10='3') AND hrby11='1'",
                "   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<='",l_hrbo05,"'",
                " ORDER BY hrby06"
      PREPARE get_hrby_p2 FROM l_sql
      DECLARE get_hrby_c2 CURSOR FOR get_hrby_p2
      FOREACH get_hrby_c2 INTO l_hrby06,l_hrby10
         IF l_hrby10_t=l_hrby10 THEN
            LET l_num=l_num-1
         END IF
         LET l_s=l_num
         LET l_s='hrcp',l_s
         LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                   " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
         PREPARE upd_2 FROM l_sql
         EXECUTE upd_2
         LET l_num=l_num+1
         LET l_hrby10_t=l_hrby10
         LET g_hrby06 = l_hrby06 #add by zhuzw 20150624
      END FOREACH
   ELSE
      LET l_sql="SELECT hrby06,hrby10 FROM hrby_file WHERE hrbyacti='Y'",
                "   AND hrby05='",g_date,"' AND hrby09='",l_name,"' ",
                "   AND (hrby10='2' OR hrby10='3') AND hrby11='1'",
                "   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>='",l_hrbo04,"'",
                "   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<='",l_hrbo05,"'",
                " ORDER BY hrby06"
      PREPARE get_hrby_p3 FROM l_sql
      DECLARE get_hrby_c3 CURSOR FOR get_hrby_p3
      FOREACH get_hrby_c3 INTO l_hrby06,l_hrby10
         IF l_hrby10_t=l_hrby10 THEN
            LET l_num=l_num-1
         END IF
         SELECT MIN(hrboa02) INTO l_hrboa02 FROM TEMP5
         SELECT MAX(hrby06) INTO l_hrby06_1 FROM hrby_file WHERE hrbyacti='Y'
                   AND hrby05=g_date AND  hrby09=l_name
                   AND hrby10='2'  AND hrby11='1'
                   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>=l_hrbo04
                   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<=l_hrboa02
         IF l_hrby06 >= l_hrby06_1  OR cl_null(l_hrby06_1) THEN #取提前中最大一笔进刷卡
            LET l_s=l_num
            LET l_s='hrcp',l_s
            LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                      " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
            PREPARE upd_3 FROM l_sql
            EXECUTE upd_3
            LET l_num=l_num+1
            LET l_hrby10_t=l_hrby10
            LET g_hrby06 = l_hrby06 #add by zhuzw 20150624
         END IF
#考虑调整
#         SELECT MAX(hrboa05) INTO l_hrboa05_1 FROM TEMP5
#         SELECT MIN(hrby06) INTO l_hrby06_2 FROM hrby_file WHERE hrbyacti='Y'
#                   AND hrby05=g_date AND  hrby09=l_name
#                   AND hrby10='3'  AND hrby11='1'
#                   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>=l_hrboa05
#                   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<=l_hrbo05
#         IF  NOT cl_null(l_hrby06_2) THEN #取退后中最大一笔出刷卡
#           IF l_hrby06 > l_hrby06_2  THEN
#              EXIT FOREACH
#           END IF
#         ELSE
#            SELECT MIN(hrby06) INTO l_hrby06_2 FROM hrby_file WHERE hrbyacti='Y'
#                   AND hrby05=g_date AND  hrby09=l_name
#                   AND hrby10='3'  AND hrby11='1'
#                   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>l_hrbo05
#            IF  NOT cl_null(l_hrby06_2) THEN #取退后中最大一笔出刷卡
#              IF l_hrby06 > l_hrby06_2  THEN
#                 EXIT FOREACH
#              END IF
#            ELSE
#               SELECT MIN(hrby06) INTO l_hrby06_2 FROM hrby_file WHERE hrbyacti='Y'
#                   AND hrby05=g_date AND  hrby09=l_name
#                   AND hrby10='3'  AND hrby11='1'
#                   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>l_hrbo05
#            END IF
#         END IF
      END FOREACH
   END IF
END FUNCTION
FUNCTION p056_p4_2(l_hrbo04,l_hrbo05)
DEFINE l_sql    STRING
DEFINE l_s      LIKE type_file.chr100
DEFINE l_hrbo04 LIKE type_file.num5
DEFINE l_hrbo05 LIKE type_file.num5
DEFINE l_num    LIKE type_file.num5
DEFINE l_hrby06 LIKE hrby_file.hrby06

   LET l_num=22
   IF g_hrbo.hrbo07='Y' THEN
      LET l_sql="SELECT hrby06 FROM hrby_file WHERE hrbyacti='Y'",
                "   AND hrby05='",g_date,"' AND hrby09='",l_name,"' ",
                "   AND hrby10='1' AND hrby11='1'",
                "   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>='",l_hrbo04,"'",
                " ORDER BY hrby06"
      PREPARE get_hrby_p12 FROM l_sql
      DECLARE get_hrby_c12 CURSOR FOR get_hrby_p12
      FOREACH get_hrby_c12 INTO l_hrby06
         LET l_s=l_num
         LET l_s='hrcp',l_s
         LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                   " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
         PREPARE upd_12 FROM l_sql
         EXECUTE upd_12
         LET l_num=l_num+1
         LET g_hrby06 = l_hrby06 #add by zhuzw 20150624
      END FOREACH
      LET l_sql="SELECT hrby06 FROM hrby_file WHERE hrbyacti='Y'",
                "   AND hrby05='",g_date1,"' AND hrby09='",l_name,"' ",
                "   AND hrby10='1' AND hrby11='1'",
                "   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<='",l_hrbo05,"'",
                " ORDER BY hrby06"
      PREPARE get_hrby_p13 FROM l_sql
      DECLARE get_hrby_c13 CURSOR FOR get_hrby_p13
      FOREACH get_hrby_c13 INTO l_hrby06
         LET l_s=l_num
         LET l_s='hrcp',l_s
         LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                   " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
         PREPARE upd_13 FROM l_sql
         EXECUTE upd_13
         LET l_num=l_num+1
         LET g_hrby06 = l_hrby06 #add by zhuzw 20150624
      END FOREACH
   ELSE
      LET l_sql="SELECT hrby06 FROM hrby_file WHERE hrbyacti='Y'",
                "   AND hrby05='",g_date,"' AND hrby09='",l_name,"' ",
                "   AND hrby10='1' AND hrby11='1'",
                "   AND(substr(hrby06,1,2)*60+substr(hrby06,4,2))>='",l_hrbo04,"'",
                "   AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<='",l_hrbo05,"'",
                " ORDER BY hrby06"
      PREPARE get_hrby_p14 FROM l_sql
      DECLARE get_hrby_c14 CURSOR FOR get_hrby_p14
      FOREACH get_hrby_c14 INTO l_hrby06
         LET l_s=l_num
         LET l_s='hrcp',l_s
         LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                   " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
         PREPARE upd_14 FROM l_sql
         EXECUTE upd_14
         LET l_num=l_num+1
         LET g_hrby06 = l_hrby06 #add by zhuzw 20150624
      END FOREACH
   END IF
END FUNCTION
FUNCTION p056_p4_3(l_hrcp04)
DEFINE l_hrcp04  LIKE hrcp_file.hrcp04
DEFINE l_sql     STRING
DEFINE l_hrboa01 LIKE hrboa_file.hrboa01
DEFINE l_hrboa02 LIKE type_file.num5
DEFINE l_hrboa04 LIKE hrboa_file.hrboa04
DEFINE l_hrboa05 LIKE type_file.num5
DEFINE l_hrboa07 LIKE hrboa_file.hrboa07
DEFINE l_hrby06  LIKE hrby_file.hrby06
DEFINE l_s,l_ss  LIKE type_file.chr100
DEFINE l_n,l_n1       LIKE type_file.num5
DEFINE l_tt      LIKE type_file.num5
DEFINE l_k       LIKE hrboa_file.hrboa02 #add by zhuzw 20150128
   LET l_n=22
   IF g_hrbo.hrbo07='Y' THEN
      LET l_sql="SELECT hrboa01,(substr(hrboa02,1,2)*60+substr(hrboa02,4,2)),hrboa04,",
                " (substr(hrboa05,1,2)*60+substr(hrboa05,4,2)),hrboa07 FROM temp5 ",
                " WHERE hrboa03='Y' ",
                " ORDER by hrboa01"
      PREPARE get_hrby06_p1 FROM l_sql
      DECLARE get_hrby06_c1 CURSOR FOR get_hrby06_p1
      FOREACH get_hrby06_c1 INTO l_hrboa01,l_hrboa02,l_hrboa04,l_hrboa05,l_hrboa07
         LET l_s=l_n
         LET l_s='hrcp',l_s
         LET l_hrboa02=l_hrboa02-l_hrboa04
         LET l_hrboa05=l_hrboa05+l_hrboa07
         IF l_hrboa05 < l_hrboa02 THEN
            LET l_hrboa05 = l_hrboa05 + 24*60
         END IF
         SELECT min((substr(hrby06,1,2)*60+substr(hrby06,4,2)+(hrby05-g_date)*60*24)) INTO l_tt FROM hrby_file
          WHERE hrbyacti='Y' AND (hrby05=g_date OR hrby05=g_date+1) AND hrby11='1'
            AND hrby09=l_name
            AND (substr(hrby06,1,2)*60+substr(hrby06,4,2)+(hrby05-g_date)*60*24) BETWEEN l_hrboa02 AND l_hrboa05
         IF l_tt >= 24*60 THEN
            LET l_tt = l_tt - 24 * 60
         END IF
         SELECT lPAD(FLOOR(l_tt/60),2,0)||':'||lPAD(mod(l_tt,60),2,0) INTO l_hrby06 FROM dual
         IF NOT cl_null(l_hrby06) THEN
            LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                      " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
            PREPARE upd_a FROM l_sql
            EXECUTE upd_a

         END IF
         LET l_n=l_n+2

      END FOREACH
   ELSE
      LET l_sql="SELECT hrboa01,(substr(hrboa02,1,2)*60+substr(hrboa02,4,2)),hrboa04,",
                " (substr(hrboa05,1,2)*60+substr(hrboa05,4,2)),hrboa07 FROM temp5 ",
                " WHERE hrboa03='Y' ",
                " ORDER by hrboa01"
      PREPARE get_hrby06_p2 FROM l_sql
      DECLARE get_hrby06_c2 CURSOR FOR get_hrby06_p2
      FOREACH get_hrby06_c2 INTO l_hrboa01,l_hrboa02,l_hrboa04,l_hrboa05,l_hrboa07
         LET l_s=l_n
         LET l_ss = l_n - 1
         LET l_s='hrcp',l_s
         LET l_ss = 'hrcp',l_ss
         LET l_k = l_hrboa02 #add by zhuzw 20150128
         LET l_hrboa02=l_hrboa02-l_hrboa04
        # LET l_hrboa05=l_hrboa05+l_hrboa07
#add by zhuzw 20150128 start
         SELECT MAX(hrby06) INTO l_hrby06 FROM hrby_file
          WHERE hrbyacti='Y' AND hrby05=g_date AND hrby11='1'
            AND hrby09=l_name
            AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>=l_hrboa02
            AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<=l_k
         IF cl_null(l_hrby06) THEN
#add by zhuzw 20150128 end
            SELECT min(hrby06) INTO l_hrby06 FROM hrby_file
             WHERE hrbyacti='Y' AND hrby05=g_date AND hrby11='1'
               AND hrby09=l_name
               AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>=l_hrboa02
               AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<=l_hrboa05
         END IF    #add by zhuzw 20150128
         IF NOT cl_null(l_hrby06) THEN
            LET l_sql="select  count(*) from   hrcp_file ",
                      " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"' ",
                       "  AND ",l_ss," = '",l_hrby06,"' "
            PREPARE upd_71 FROM l_sql
            EXECUTE upd_71 INTO l_n1
            IF l_n1 = 0 THEN
               LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                         " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
               PREPARE upd_7 FROM l_sql
               EXECUTE upd_7
            END IF
         END IF
         LET l_n=l_n+2
      END FOREACH

   END IF
END FUNCTION

FUNCTION p056_p4_4(l_hrcp04)
DEFINE l_hrcp04  LIKE hrcp_file.hrcp04
DEFINE l_sql     STRING
DEFINE l_hrboa01 LIKE hrboa_file.hrboa01
DEFINE l_hrboa02 LIKE type_file.num5
DEFINE l_hrboa04 LIKE hrboa_file.hrboa04
DEFINE l_hrboa05 LIKE type_file.num5
DEFINE l_hrboa07 LIKE hrboa_file.hrboa07
DEFINE l_hrby06  LIKE hrby_file.hrby06
DEFINE l_s,l_ss       LIKE type_file.chr100
DEFINE l_n,l_tt,l_n1       LIKE type_file.num5
DEFINE l_k       LIKE hrboa_file.hrboa02 #add by zhuzw 20150128
   LET l_n=23
   IF g_hrbo.hrbo07='Y' THEN
      LET l_sql="SELECT hrboa01,(substr(hrboa02,1,2)*60+substr(hrboa02,4,2)),hrboa04,",
                " (substr(hrboa05,1,2)*60+substr(hrboa05,4,2)),hrboa07 FROM temp5",
                " WHERE hrboa06='Y'",
                " ORDER by hrboa01"
      PREPARE get_hrby06_p3 FROM l_sql
      DECLARE get_hrby06_c3 CURSOR FOR get_hrby06_p3
      FOREACH get_hrby06_c3 INTO l_hrboa01,l_hrboa02,l_hrboa04,l_hrboa05,l_hrboa07
         LET l_s=l_n
         LET l_s='hrcp',l_s
         LET l_hrboa02=l_hrboa02-l_hrboa04
         LET l_k = l_hrboa05 #add by zhuzw 20150128
         LET l_hrboa05=l_hrboa05+l_hrboa07

         IF l_hrboa05 < l_hrboa02 THEN
            LET l_hrboa05 = l_hrboa05 + 24*60
         END IF
         SELECT MAX((substr(hrby06,1,2)*60+substr(hrby06,4,2)+(hrby05-g_date)*60*24)) INTO l_tt FROM hrby_file
          WHERE hrbyacti='Y' AND (hrby05=g_date OR hrby05=g_date+1) AND hrby11='1'
            AND hrby09=l_name
            AND (substr(hrby06,1,2)*60+substr(hrby06,4,2)+(hrby05-g_date)*60*24) BETWEEN l_hrboa02 AND l_hrboa05
         IF l_tt >= 24*60 THEN
            LET l_tt = l_tt - 24 * 60
         END IF
         SELECT lPAD(FLOOR(l_tt/60),2,0)||':'||lPAD(mod(l_tt,60),2,0) INTO l_hrby06 FROM dual
         IF NOT cl_null(l_hrby06) THEN
            LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"'",
                      " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
            PREPARE upd_a1 FROM l_sql
            EXECUTE upd_a1

         END IF
         LET l_n=l_n+2
         LET g_hrby06 = l_hrby06 #add by zhuzw 20150624
      END FOREACH
   ELSE
      LET l_sql="SELECT hrboa01,(substr(hrboa02,1,2)*60+substr(hrboa02,4,2)),hrboa04,",
                " (substr(hrboa05,1,2)*60+substr(hrboa05,4,2)),hrboa07 FROM temp5 ",
                " WHERE hrboa06='Y'",
                " ORDER by hrboa01"
      PREPARE get_hrby06_p4 FROM l_sql
      DECLARE get_hrby06_c4 CURSOR FOR get_hrby06_p4
      FOREACH get_hrby06_c4 INTO l_hrboa01,l_hrboa02,l_hrboa04,l_hrboa05,l_hrboa07
         LET l_s=l_n
         LET l_ss = l_n - 1
         LET l_s='hrcp',l_s
         LET l_ss = 'hrcp',l_ss
        # LET l_hrboa02=l_hrboa02-l_hrboa04
         LET l_k = l_hrboa05 #add by zhuzw 20150128
         LET l_hrboa05=l_hrboa05+l_hrboa07

#add by zhuzw 20150128 start
         SELECT min(hrby06) INTO l_hrby06 FROM hrby_file
          WHERE hrbyacti='Y' AND hrby05=g_date AND hrby11='1'
            AND hrby09=l_name
            AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>=l_k
            AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<=l_hrboa05
         IF cl_null(l_hrby06) THEN
#add by zhuzw 20150128 end
            SELECT max(hrby06) INTO l_hrby06 FROM hrby_file
             WHERE hrbyacti='Y' AND hrby05=g_date AND hrby11='1'
               AND hrby09=l_name
               AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))>=l_hrboa02
               AND (substr(hrby06,1,2)*60+substr(hrby06,4,2))<=l_hrboa05
         END IF #add by zhuzw 20150128
         IF NOT cl_null(l_hrby06) THEN
            LET l_sql="select  count(*) from   hrcp_file ",
                      " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"' ",
                       "  AND ",l_ss," = '",l_hrby06,"' "
            PREPARE upd_72 FROM l_sql
            EXECUTE upd_72 INTO l_n1
            IF l_n1 = 0 THEN
               LET l_sql="UPDATE hrcp_file SET ",l_s,"='",l_hrby06,"' ",
                         " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
               PREPARE upd_11 FROM l_sql
               EXECUTE upd_11
            END IF

         END IF
         LET l_n=l_n+2
         LET g_hrby06 = l_hrby06 #add by zhuzw 20150624
      END FOREACH
   END IF
END FUNCTION
#FUNCTION p056_p5()#处理迟到，早退，旷工情况
#DEFINE l_hrcp RECORD LIKE hrcp_file.*
#DEFINE l_sql STRING
#DEFINE l_i,l_fz LIKE type_file.num5
#DEFINE l_t5  DYNAMIC ARRAY OF RECORD
#        hrboa01  LIKE hrboa_file.hrboa01,
#        hrboa02  LIKE hrboa_file.hrboa02,
#        hrboa03  LIKE hrboa_file.hrboa03,
#        hrboa04  LIKE hrboa_file.hrboa04,
#        hrboa05  LIKE hrboa_file.hrboa05,
#        hrboa06  LIKE hrboa_file.hrboa06,
#        hrboa07  LIKE hrboa_file.hrboa07,
#        hrboa11  LIKE hrboa_file.hrboa11,
#        hrboa12  LIKE hrboa_file.hrboa12,
#        hrboa13  LIKE hrboa_file.hrboa13
#             END RECORD
#   SELECT * INTO l_hrcp.* FROM hrcp_file
#    WHERE hrcp02=l_name
#      AND hrcp03=g_date
#   LET l_i = 1
#
#   IF g_hrbo.hrbo06 != 'Y' THEN
#      LET l_sql = " SELECT * FROM temp5 "
#      PREPARE p056_p5_1 FROM l_sql
#      DECLARE p056_p5_s1 CURSOR FOR p056_p5_1
#      FOREACH p056_p5_s1 INTO l_t5[l_i].*
#         IF l_i >6 THEN
#            EXIT FOREACH
#         END IF
#         IF l_i = 1 THEN #第一笔进出
#            IF l_t5[l_i].hrboa03='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp22) THEN
#                  IF l_hrcp.hrcp22 > l_t5[l_i].hrboa02 THEN  #迟到
#                     CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp22) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#                  END IF
#               END IF
#            END IF
#            IF l_t5[l_i].hrboa06='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp23) THEN
#                  IF l_hrcp.hrcp23 < l_t5[l_i].hrboa05 THEN #早退
#                     CALL  p056_mi(l_hrcp.hrcp23,l_t5[l_i].hrboa05) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
#                  END IF
#               END IF
#            END IF
#            IF (l_t5[l_i].hrboa03='Y' AND cl_null(l_hrcp.hrcp22)) OR (l_t5[l_i].hrboa06='Y' AND cl_null(l_hrcp.hrcp23))THEN #可能旷工
#                CALL  p056_mi(l_t5[l_i].hrboa02,l_t5[l_i].hrboa05) RETURNING l_fz
#                INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#            END IF
#         END IF
#         IF l_i = 2 THEN #第2笔进出
#            IF l_t5[l_i].hrboa03='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp24) THEN
#                  IF l_hrcp.hrcp24 > l_t5[l_i].hrboa02 THEN
#                     CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp24) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#                  END IF
#               END IF
#            END IF
#            IF l_t5[l_i].hrboa06='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp25) THEN
#                  IF l_hrcp.hrcp25 < l_t5[l_i].hrboa05 THEN
#                     CALL  p056_mi(l_hrcp.hrcp25,l_t5[l_i].hrboa05) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
#                  END IF
#               END IF
#            END IF
#            IF (l_t5[l_i].hrboa03='Y' AND cl_null(l_hrcp.hrcp24)) OR (l_t5[l_i].hrboa06='Y' AND cl_null(l_hrcp.hrcp25))THEN #可能旷工
#                CALL  p056_mi(l_t5[l_i].hrboa02,l_t5[l_i].hrboa05) RETURNING l_fz
#                INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#            END IF
#         END IF
#         IF l_i = 3 THEN #第3笔进出
#            IF l_t5[l_i].hrboa03='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp26) THEN
#                  IF l_hrcp.hrcp26 > l_t5[l_i].hrboa02 THEN
#                     CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp26) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#                  END IF
#               END IF
#            END IF
#            IF l_t5[l_i].hrboa06='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp27) THEN
#                  IF l_hrcp.hrcp27 < l_t5[l_i].hrboa05 THEN
#                     CALL  p056_mi(l_hrcp.hrcp27,l_t5[l_i].hrboa05) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
#                  END IF
#               END IF
#            END IF
#            IF (l_t5[l_i].hrboa03='Y' AND cl_null(l_hrcp.hrcp26)) OR (l_t5[l_i].hrboa06='Y' AND cl_null(l_hrcp.hrcp27))THEN #可能旷工
#                CALL  p056_mi(l_t5[l_i].hrboa02,l_t5[l_i].hrboa05) RETURNING l_fz
#                INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#            END IF
#         END IF
#         IF l_i = 4 THEN #第4笔进出
#            IF l_t5[l_i].hrboa03='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp28) THEN
#                  IF l_hrcp.hrcp28 > l_t5[l_i].hrboa02 THEN
#                     CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp28) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#                  END IF
#               END IF
#            END IF
#            IF l_t5[l_i].hrboa06='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp29) THEN
#                  IF l_hrcp.hrcp29 < l_t5[l_i].hrboa05 THEN
#                     CALL  p056_mi(l_hrcp.hrcp29,l_t5[l_i].hrboa05) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
#                  END IF
#               END IF
#            END IF
#            IF (l_t5[l_i].hrboa03='Y' AND cl_null(l_hrcp.hrcp28)) OR (l_t5[l_i].hrboa06='Y' AND cl_null(l_hrcp.hrcp29))THEN #可能旷工
#                CALL  p056_mi(l_t5[l_i].hrboa02,l_t5[l_i].hrboa05) RETURNING l_fz
#                INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#            END IF
#         END IF
#         IF l_i = 5 THEN #第5笔进出
#            IF l_t5[l_i].hrboa03='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp30) THEN
#                  IF l_hrcp.hrcp30 > l_t5[l_i].hrboa02 THEN
#                     CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp30) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#                  END IF
#               END IF
#            END IF
#            IF l_t5[l_i].hrboa06='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp31) THEN
#                  IF l_hrcp.hrcp31 < l_t5[l_i].hrboa05 THEN
#                     CALL  p056_mi(l_hrcp.hrcp31,l_t5[l_i].hrboa05) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
#                  END IF
#               END IF
#            END IF
#            IF (l_t5[l_i].hrboa03='Y' AND cl_null(l_hrcp.hrcp30)) OR (l_t5[l_i].hrboa06='Y' AND cl_null(l_hrcp.hrcp31))THEN #可能旷工
#                CALL  p056_mi(l_t5[l_i].hrboa02,l_t5[l_i].hrboa05) RETURNING l_fz
#                INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#            END IF
#         END IF
#         IF l_i = 6 THEN #第6笔进出
#            IF l_t5[l_i].hrboa03='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp32) THEN
#                  IF l_hrcp.hrcp32 > l_t5[l_i].hrboa02 THEN
#                     CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp32) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#                  END IF
#               END IF
#            END IF
#            IF l_t5[l_i].hrboa06='Y' THEN
#               IF NOT cl_null(l_hrcp.hrcp33) THEN
#                  IF l_hrcp.hrcp33 < l_t5[l_i].hrboa05 THEN
#                     CALL  p056_mi(l_hrcp.hrcp33,l_t5[l_i].hrboa05) RETURNING l_fz
#                     INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
#                  END IF
#               END IF
#            END IF
#            IF (l_t5[l_i].hrboa03='Y' AND cl_null(l_hrcp.hrcp32)) OR (l_t5[l_i].hrboa06='Y' AND cl_null(l_hrcp.hrcp33))THEN #可能旷工
#                CALL  p056_mi(l_t5[l_i].hrboa02,l_t5[l_i].hrboa05) RETURNING l_fz
#                INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
#            END IF
#         END IF
#         LET l_i = l_i +1
#      END FOREACH
#   END IF
#   CALL p056_p5_1()#判断最终异常状态
#END FUNCTION
FUNCTION p056_p5_beifen()#处理迟到，早退，旷工情况 #modify 20150709 暂时无法使用p056_p5()
DEFINE l_hrcp RECORD LIKE hrcp_file.*
DEFINE l_sql STRING
DEFINE l_i,l_fz,l_n,l_fz_1,l_fz_2,l_fz1,l_fz2 LIKE type_file.num5
DEFINE  l_hrboa01,l_hrboa01_1  LIKE hrboa_file.hrboa01,
        l_hrboa02,l_hrboa02_1,l_hrboa02_2  LIKE hrboa_file.hrboa02,
        l_hrboa05,l_hrboa05_1,l_hrboa05_2  LIKE hrboa_file.hrboa05,
        l_hrboa11,l_hrboa11_1 LIKE hrboa_file.hrboa11
DEFINE l_t5  DYNAMIC ARRAY OF RECORD
        hrboa01  LIKE hrboa_file.hrboa01,
        hrboa02  LIKE hrboa_file.hrboa02,
        hrboa03  LIKE hrboa_file.hrboa03,
        hrboa04  LIKE hrboa_file.hrboa04,
        hrboa05  LIKE hrboa_file.hrboa05,
        hrboa06  LIKE hrboa_file.hrboa06,
        hrboa07  LIKE hrboa_file.hrboa07,
        hrboa11  LIKE hrboa_file.hrboa11,
        hrboa12  LIKE hrboa_file.hrboa12,
        hrboa13  LIKE hrboa_file.hrboa13
             END RECORD
   UPDATE hrcp_file SET hrcp10='',hrcp11='',hrcp12='',hrcp13='',hrcp14='',hrcp15='',hrcp16='',
                        hrcp17='',hrcp18='',hrcp19='',hrcp20='',hrcp21=''
    WHERE hrcp02=l_name
    AND hrcp03=g_date
   SELECT * INTO l_hrcp.* FROM hrcp_file
    WHERE hrcp02=l_name
      AND hrcp03=g_date
   LET l_i = 1
   CALL l_t5.clear()
   IF g_hrbo.hrbo06 != 'Y' THEN
   LET l_sql = " SELECT * FROM temp5 where hrboa03 = 'Y' order by hrboa02 "
   PREPARE p056_p5_1 FROM l_sql
   DECLARE p056_p5_s1 CURSOR FOR p056_p5_1
   FOREACH p056_p5_s1 INTO l_t5[l_i].*
      IF l_i >6 THEN
         EXIT FOREACH
      END IF
      IF l_i = 1 THEN
         IF NOT cl_null(l_hrcp.hrcp22) THEN
            IF l_hrcp.hrcp22 >= l_t5[l_i].hrboa05 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_hrcp.hrcp22,l_t5[l_i].hrboa05) RETURNING l_fz1
               LET l_fz = l_t5[l_i].hrboa11 - l_fz1
            END IF
            IF  cl_null(l_hrcp.hrcp23) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 2 THEN
         IF NOT cl_null(l_hrcp.hrcp24) THEN
            IF l_hrcp.hrcp24 >= l_t5[l_i].hrboa05 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_hrcp.hrcp24,l_t5[l_i].hrboa05) RETURNING l_fz1
               LET l_fz = l_t5[l_i].hrboa11 - l_fz1
            END IF
            IF  cl_null(l_hrcp.hrcp25) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 3 THEN
         IF NOT cl_null(l_hrcp.hrcp26) THEN
            IF l_hrcp.hrcp26 >= l_t5[l_i].hrboa05 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_hrcp.hrcp26,l_t5[l_i].hrboa05) RETURNING l_fz1
               LET l_fz = l_t5[l_i].hrboa11 - l_fz1
            END IF
            IF  cl_null(l_hrcp.hrcp27) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 4 THEN
         IF NOT cl_null(l_hrcp.hrcp28) THEN
            IF l_hrcp.hrcp28 >= l_t5[l_i].hrboa05 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_hrcp.hrcp28,l_t5[l_i].hrboa05) RETURNING l_fz1
               LET l_fz = l_t5[l_i].hrboa11 - l_fz1
            END IF
            IF  cl_null(l_hrcp.hrcp29) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 5 THEN
         IF NOT cl_null(l_hrcp.hrcp30) THEN
            IF l_hrcp.hrcp30 >= l_t5[l_i].hrboa05 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_hrcp.hrcp30,l_t5[l_i].hrboa05) RETURNING l_fz1
               LET l_fz = l_t5[l_i].hrboa11 - l_fz1
            END IF
            IF  cl_null(l_hrcp.hrcp31) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 6 THEN
         IF NOT cl_null(l_hrcp.hrcp32) THEN
            IF l_hrcp.hrcp32 >= l_t5[l_i].hrboa05 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_hrcp.hrcp32,l_t5[l_i].hrboa05) RETURNING l_fz1
               LET l_fz = l_t5[l_i].hrboa11 - l_fz1
            END IF
            IF  cl_null(l_hrcp.hrcp33) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'001')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      LET l_i = l_i +1
   END FOREACH
#下班卡
   CALL l_t5.clear()
   LET l_i = 1
   LET l_sql = " SELECT * FROM temp5 where hrboa06 = 'Y' order by hrboa02 "
   PREPARE p056_p5_22 FROM l_sql
   DECLARE p056_p5_s22 CURSOR FOR p056_p5_22
   FOREACH p056_p5_s22 INTO l_t5[l_i].*
      IF l_i >6 THEN
         EXIT FOREACH
      END IF
      IF l_i = 1 THEN
         IF NOT cl_null(l_hrcp.hrcp23) THEN
            IF l_hrcp.hrcp23 <= l_t5[l_i].hrboa02 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp23) RETURNING l_fz2
               LET l_fz = l_t5[l_i].hrboa11 - l_fz2
            END IF
            IF  cl_null(l_hrcp.hrcp22) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 2 THEN
         IF NOT cl_null(l_hrcp.hrcp25) THEN
            IF l_hrcp.hrcp25 <= l_t5[l_i].hrboa02 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp25) RETURNING l_fz2
               LET l_fz = l_t5[l_i].hrboa11 - l_fz2
            END IF
            IF  cl_null(l_hrcp.hrcp24) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 3 THEN
         IF NOT cl_null(l_hrcp.hrcp27) THEN
            IF l_hrcp.hrcp27 <= l_t5[l_i].hrboa02 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp27) RETURNING l_fz2
               LET l_fz = l_t5[l_i].hrboa11 - l_fz2
            END IF
            IF  cl_null(l_hrcp.hrcp26) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 4 THEN
         IF NOT cl_null(l_hrcp.hrcp29) THEN
            IF l_hrcp.hrcp29 <= l_t5[l_i].hrboa02 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp29) RETURNING l_fz2
               LET l_fz = l_t5[l_i].hrboa11 - l_fz2
            END IF
            IF  cl_null(l_hrcp.hrcp28) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 5 THEN
         IF NOT cl_null(l_hrcp.hrcp31) THEN
            IF l_hrcp.hrcp31 <= l_t5[l_i].hrboa02 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp31) RETURNING l_fz2
               LET l_fz = l_t5[l_i].hrboa11 - l_fz2
            END IF
            IF  cl_null(l_hrcp.hrcp30) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      IF l_i = 6 THEN
         IF NOT cl_null(l_hrcp.hrcp33) THEN
            IF l_hrcp.hrcp33 <= l_t5[l_i].hrboa02 THEN
               LET  l_fz = l_t5[l_i].hrboa11
            ELSE
               CALL  p056_mi(l_t5[l_i].hrboa02,l_hrcp.hrcp33) RETURNING l_fz2
               LET l_fz = l_t5[l_i].hrboa11 - l_fz2
            END IF
            IF  cl_null(l_hrcp.hrcp32) THEN
               LET  l_fz = l_t5[l_i].hrboa11
            END IF
            IF l_fz > 0 THEN
               IF l_fz = l_t5[l_i].hrboa11 THEN
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'003')
               ELSE
                  INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_fz,'002')
               END IF
            END IF
         ELSE
            INSERT INTO TEMP6 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa11,'003')
         END IF
      END IF
      LET l_i = l_i +1
   END FOREACH
   END IF
   #add by zhuzw 20150708 end

   CALL p056_p5_1()#判断最终异常状态
END FUNCTION
FUNCTION p056_p5_1() #判断最终异常状态
DEFINE l_sql STRING
DEFINE l_n,l_num1,l_num     LIKE type_file.num5
DEFINE l_t6   RECORD
         hrboa01  LIKE hrboa_file.hrboa01,
        fz       LIKE hrboa_file.hrboa04,
        hrbm02   LIKE hrbm_file.hrbm02
             END RECORD
   LET l_num=10
   LET l_num1=11
   SELECT COUNT(*) INTO l_n FROM TEMP4
   IF l_n >0 THEN
      CALL p056_p5_2()
   END IF
   LET l_sql = " SELECT distinct * FROM temp6 "
   PREPARE p056_p5_4 FROM l_sql
   DECLARE p056_p5_s4 CURSOR FOR p056_p5_4
   FOREACH p056_p5_s4 INTO l_t6.*
      CALL p056_p5_3(l_t6.fz,l_t6.hrbm02,l_num,l_num1)
      LET l_num=l_num+2
      LET l_num1=l_num1+2
   END FOREACH
   CALL p056_p6(l_num,l_num1)
END FUNCTION
FUNCTION p056_p5_2()#请假出差异常数据冲抵考勤异常
DEFINE l_sql STRING
DEFINE l_hrboa01 LIKE hrboa_file.hrboa01
DEFINE l_ss,l_bs,l_i,l_j,l_zj,l_i1      LIKE type_file.num5
DEFINE l_t4 RECORD
        hrcd01   LIKE hrcd_file.hrcd01,
        hrcda05  LIKE hrcda_file.hrcda05,
        hrcda06  LIKE hrcda_file.hrcda06,
        hrcda07  LIKE hrcda_file.hrcda07,
        hrcda08  LIKE hrcda_file.hrcda08,
        hrcda09    LIKE hrcda_file.hrcda09,
        hrcda10    LIKE hrcda_file.hrcda10

            END RECORD
DEFINE l_t6    DYNAMIC ARRAY OF RECORD
         hrboa01  LIKE hrboa_file.hrboa01,
        fz       LIKE hrboa_file.hrboa04,
        hrbm02   LIKE hrbm_file.hrbm02
             END RECORD
   LET l_ss = 0
   LET l_i = 1
   LET l_i1 = 0
   LET l_sql = " SELECT * FROM temp4   "
   PREPARE p056_p5_2 FROM l_sql
   DECLARE p056_p5_s2 CURSOR FOR p056_p5_2
   FOREACH p056_p5_s2 INTO l_t4.*
      IF l_t4.hrcda10 = '001' THEN
         IF l_t4.hrcda09 = 1 OR cl_null(l_t4.hrcda09) THEN  #单位天且时数为1，或控，清空所有异常
            DELETE FROM temp6
            EXIT FOREACH
         ELSE
            SELECT hrboa01 INTO l_hrboa01 FROM (SELECT hrboa01,COUNT(hrboa01) bs FROM TEMP6 GROUP BY hrboa01 order by bs desc ) #半天时，清空异常最多的班段
             WHERE rownum = 1
            DELETE FROM temp6 WHERE hrboa01 = l_hrboa01
         END IF
      END IF
      IF l_t4.hrcda10 = '003' THEN #小时
         IF NOT cl_null(l_t4.hrcda09) THEN
            LET l_ss = l_ss + l_t4.hrcda09
         END IF
      END IF
   END FOREACH
   SELECT COUNT(*) INTO l_bs FROM temp6
   IF l_ss >0 AND  l_bs > 0 THEN
      LET l_ss = l_ss * 60
      SELECT SUM(fz) INTO l_zj FROM TEMP6
      LET l_sql = " SELECT * from temp6 order by fz "
      PREPARE p056_p5_3 FROM l_sql
      DECLARE p056_p5_s3 CURSOR FOR p056_p5_3
      FOREACH p056_p5_s3 INTO l_t6[l_i].*
         IF l_ss >= l_t6[l_i].fz THEN
            LET l_ss = l_ss - l_t6[l_i].fz
            LET l_zj = l_zj - l_t6[l_i].fz
            LET l_i1 = l_i +1
         END IF
         LET l_i = l_i +1
      END FOREACH
      IF l_ss >0 AND l_zj > 0 THEN
         FOR l_j = l_i1 TO l_bs
             IF l_j = l_i1 THEN
                LET l_t6[l_j].fz = l_t6[l_j].fz - l_ss
                INSERT INTO temp7  VALUES( l_t6[l_j].hrboa01,l_t6[l_j].fz,l_t6[l_j].hrbm02)
             ELSE
                INSERT INTO temp7  VALUES( l_t6[l_j].hrboa01,l_t6[l_j].fz,l_t6[l_j].hrbm02)
             END IF
         END FOR
      END IF
      IF l_ss = 0 AND l_zj > 0 THEN
         FOR l_j = l_i1 TO l_bs
             INSERT INTO temp7  VALUES( l_t6[l_j].hrboa01,l_t6[l_j].fz,l_t6[l_j].hrbm02)
         END FOR
      END IF
      IF l_zj = 0 THEN
         DELETE FROM temp6
      END IF
      DELETE FROM TEMP6
      INSERT INTO temp6 SELECT * FROM temp7
   END IF
END FUNCTION
FUNCTION p056_p5_3(l_minus,l_p,l_num,l_num1)
DEFINE l_hrbm03 LIKE hrbm_file.hrbm03
DEFINE l_hrcp04 LIKE hrcp_file.hrcp04
DEFINE l_p      LIKE type_file.chr100
DEFINE l_s      LIKE type_file.chr100
DEFINE l_s1     LIKE type_file.chr100
DEFINE l_num    LIKE type_file.num5
DEFINE l_num1   LIKE type_file.num5
DEFINE l_minus  LIKE type_file.num5
DEFINE l_minust LIKE hrcp_file.hrcp11
DEFINE l_sql    STRING
DEFINE l_hrbm05 LIKE hrbm_file.hrbm05
DEFINE l_hrbm06 LIKE hrbm_file.hrbm06
DEFINE l_a      LIKE type_file.num5
DEFINE l_hrboa13 LIKE hrboa_file.hrboa13
   LET l_s=l_num
   LET l_s='hrcp',l_s
   LET l_s1=l_num1
   LET l_s1='hrcp',l_s1
   SELECT hrbm03,hrbm05,hrbm06 INTO l_hrbm03,l_hrbm05,l_hrbm06 FROM hrbm_file
    WHERE hrbm02=l_p AND hrbm11<=l_minus AND hrbm12>=l_minus
   IF cl_null(l_hrbm03) THEN
      SELECT hrbm03,hrbm05,hrbm06 INTO l_hrbm03,l_hrbm05,l_hrbm06 FROM hrbm_file
       WHERE hrbm02=l_p AND hrbm11=0 AND hrbm12=0
   END IF
   IF cl_null(l_hrbm03) THEN
      SELECT hrbm03,hrbm05,hrbm06 INTO l_hrbm03,l_hrbm05,l_hrbm06 FROM hrbm_file
       WHERE hrbm02='003' AND hrbm11<l_minus AND hrbm12>=l_minus
   END IF
   IF cl_null(l_hrbm03) THEN
      SELECT hrbm03,hrbm05,hrbm06 INTO l_hrbm03,l_hrbm05,l_hrbm06 FROM hrbm_file
       WHERE hrbm02='003' AND hrbm11=0 AND hrbm12=0
   END IF

   CASE l_hrbm06
     WHEN '001'
      LET g_hrbo.hrbo08=g_hrbo.hrbo08*l_hrbm05
      SELECT ceil(l_minus/g_hrbo.hrbo08) INTO l_a FROM dual
      LET l_minus=g_hrbo.hrbo08*l_a
     WHEN '002'
      LET g_hrbo.hrbo08=g_hrbo.hrbo08*l_hrbm05/2
      SELECT ceil(l_minus/g_hrbo.hrbo08) INTO l_a FROM dual
      LET l_minus=g_hrbo.hrbo08*l_a
     WHEN '003'
       LET l_minust = l_minus/60
   END CASE

   IF l_hrbm06='003' THEN
      LET l_sql="UPDATE hrcp_file SET ",l_s1,"='",l_minust,"'"
   ELSE
      LET l_sql="UPDATE hrcp_file SET ",l_s1,"='",l_minus,"'"
   END IF
   LET l_sql=l_sql,",",l_s,"='",l_hrbm03,"' WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'  "
   PREPARE upd_hrcp10_1 FROM l_sql
   EXECUTE upd_hrcp10_1
END FUNCTION
FUNCTION p056_p6(p_num,p_num1)#存储点名结果
DEFINE  l_sql,l_sql1 STRING
DEFINE l_hrcd01 LIKE hrcd_file.hrcd01
#DEFINE l_hour   LIKE hrcda_file.hrcda09                          #mark by wangwy 2015-09-07
DEFINE l_hour,l_sum,l_total,l_sh,l_total_1   LIKE hrcda_file.hrcda09       #add by wangwy 2015-09-07
DEFINE l_s,l_s1      LIKE type_file.chr100
#DEFINE p_num1,p_num,l_sum,l_total  LIKE type_file.num5           #mark by wangwy 2015-09-07
DEFINE p_num1,p_num  LIKE type_file.num5                    #add by wangwy 2015-09-07
DEFINE l_hrcn08 LIKE hrcn_file.hrcn08
DEFINE l_hrcn09 LIKE hrcn_file.hrcn09
DEFINE l_hrcda10 LIKE hrcda_file.hrcda10
DEFINE l_hrbm02 LIKE hrbm_file.hrbm02
DEFINE l_hrcp10 LIKE hrcp_file.hrcp10
DEFINE l_min,l_max  LIKE hrby_file.hrby06
DEFINE l_hrbn02 LIKE hrbn_file.hrbn02
#add by zhuzw 20150624 start
define l_hrcp  RECORD LIKE hrcp_file.*
DEFINE l_fz,l_n,l_a,l_b,l_jh     LIKE type_file.num5
DEFINE l_hrby06,l_hrby06_1,l_hrby06_2 LIKE hrby_file.hrby06
DEFINE l_hrbob  RECORD LIKE hrbob_file.*
DEFINE l_hrbo10 LIKE hrbo_file.hrbo10,
       l_hrbo04 like hrbo_file.hrbo04,
       l_hrcp04 like hrcp_file.hrcp04,
       l_hrcma05 like hrcma_file.hrcma05,
       l_hrcma09 like hrcma_file.hrcma09
DEFINE l_bdate,l_edate LIKE type_file.dat
DEFINE l_z      LIKE type_file.chr1
DEFINE l_hrbo05,l_btime,l_etime LIKE hrbo_file.hrbo05
#add end
DEFINE l_t6   RECORD
         hrboa01  LIKE hrboa_file.hrboa01,
        fz       LIKE hrboa_file.hrboa04,
        hrbm02   LIKE hrbm_file.hrbm02
             END RECORD
#add by zhuzw 20150921 start
DEFINE l_hrcp22 LIKE hrcp_file.hrcp22
DEFINE l_hrcp23 LIKE hrcp_file.hrcp23
DEFINE l_hrby12 LIKE hrby_file.hrby12
#add by zhuzw 20150921 end
#DEFINE l_jin1 LIKE hrcp_file.hrcp22
#DEFINE l_chu1 LIKE hrcp_file.hrcp23
DEFINE l_hrcn05,l_hrcn07 LIKE hrcn_file.hrcn07
DEFINE l_yj    LIKE type_file.num5                        #add by wangwy 2015-12-07
let  l_sum = 0
   #-----add by wangwy 2015-09-07 start-----------
   SELECT sum(hrboa12) INTO l_total FROM hrboa_file,hrcp_file
    WHERE hrboa15=hrcp04 AND hrboa08='001' AND hrcp02=l_name AND hrcp03=g_date
    IF g_hrbo.hrbo06 = 'Y' THEN
      LET l_total = 0
    END IF
    #add by wangwy 2015-12-07 start
    SELECT COUNT(*) INTO l_yj FROM TEMP3
    IF l_yj = 0 THEN
    #add by wangwy 2015-12-07 end
   #add by zhuzw 20150921 start #只有一笔刷卡是处理方式，1：判断为进1 or 出1;2：更新状态为奇次刷卡
   SELECT hrcp22,hrcp23 INTO l_hrcp22,l_hrcp23 FROM hrcp_file
    WHERE hrcp02=l_name AND hrcp03=g_date
    IF l_hrcp22 = l_hrcp23 OR (NOT cl_null(l_hrcp22) AND  cl_null(l_hrcp23)) OR ( cl_null(l_hrcp22) AND  NOT cl_null(l_hrcp23))THEN
       UPDATE hrcp_file SET hrcp23 = '',hrcp22 = ''
        WHERE hrcp02=l_name
          AND hrcp03=g_date
       IF cl_null(l_hrcp22) THEN
          LET l_hrcp22 = l_hrcp23
       END IF
       SELECT  abs((substr(hrbo04,1,2)*60+substr(hrbo04,4,2)) -  (substr(l_hrcp22,1,2)*60+substr(l_hrcp22,4,2))) INTO l_a from hrbo_file,hrcp_file
        WHERE  hrbo02 = hrcp04
          AND  hrcp02=l_name AND hrcp03=g_date
       SELECT  abs((substr(hrbo05,1,2)*60+substr(hrbo05,4,2)) -  (substr(l_hrcp22,1,2)*60+substr(l_hrcp22,4,2))) INTO l_b from hrbo_file,hrcp_file
        WHERE  hrbo02 = hrcp04
          AND  hrcp02=l_name AND hrcp03=g_date
       IF l_a >l_b THEN
          UPDATE hrcp_file SET hrcp23 = l_hrcp22
           WHERE hrcp02=l_name
             AND hrcp03=g_date
       ELSE
          UPDATE hrcp_file SET hrcp22 = l_hrcp22
           WHERE hrcp02=l_name
             AND hrcp03=g_date
       END IF
       #更新奇次刷卡
       SELECT hrby12 INTO l_hrby12 FROM hrby_file
        WHERE hrby09 = l_name
          AND (hrby05 = g_date OR hrby05 = g_date + 1 )
          AND hrby06 = l_hrcp22
       IF l_hrby12 = '1' THEN     #只有当该笔刷卡为数据采集的时候才处理为奇次刷卡
          UPDATE hrcp_file SET hrcp10='',hrcp11='',hrcp12='',hrcp13='',hrcp14='',hrcp15='',hrcp16='',
                              hrcp17='',hrcp18='',hrcp19='',hrcp20='',hrcp21=''
           WHERE hrcp02=l_name
             AND hrcp03=g_date
          LET p_num = 10
          LET p_num1 = 11
          LET l_s=p_num
          LET l_s='hrcp',l_s
          LET l_s1=p_num1
          LET l_s1='hrcp',l_s1
          LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='034',",
                    "                     ",l_s1,"='",1,"'",
                    " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
          PREPARE p_pp2_111 FROM l_sql1
          EXECUTE p_pp2_111
          LET p_num=p_num+2
          LET p_num1=p_num1+2
       END IF
    END IF
   #add by zhuzw 20150921 end
   END IF                                  #add by wangwy 2015-12-07             有请假信息不看刷卡（奇次刷卡）
   SELECT hrbn02 INTO l_hrbn02 FROM hrbn_file WHERE hrbn01=l_name AND g_date BETWEEN hrbn04 AND hrbn05
   IF l_hrbn02 = '002' THEN
    IF g_hrbo.hrbo06='Y' THEN
       UPDATE hrcp_file SET hrcp09=0,hrcp10='',hrcp11='',hrcp12='',hrcp13='',hrcp14='',hrcp15='',hrcp16='',
                            hrcp17='',hrcp18='',hrcp19='',hrcp20='',hrcp21=''
        WHERE hrcp02=l_name
        AND hrcp03=g_date
    ELSE
       UPDATE hrcp_file SET hrcp09=8,hrcp10='',hrcp11='',hrcp12='',hrcp13='',hrcp14='',hrcp15='',hrcp16='',
                            hrcp17='',hrcp18='',hrcp19='',hrcp20='',hrcp21=''
        WHERE hrcp02=l_name
        AND hrcp03=g_date
    END IF

    LET p_num = 10
    LET p_num1 = 11
      SELECT COUNT(*) INTO l_a FROM TEMP3
     # SELECT COUNT(distinct hrby06) INTO l_b FROM hrby_file WHERE (hrby09 = l_name AND hrby05 = g_date AND substr(hrby06,1,2)*60+substr(hrby06,4,2)>=360 AND hrby10 IN ('1','6') AND hrbyacti = 'Y') OR (hrby09 = l_name AND hrby05 = g_date+1 AND substr(hrby06,1,2)*60+substr(hrby06,4,2)<=170 AND hrby10 IN ('1','6') AND hrbyacti = 'Y')   #markbywangww180211
      SELECT COUNT(distinct hrby06) INTO l_b FROM hrby_file WHERE (hrby09 = l_name AND hrby05 = g_date AND substr(hrby06,1,2)*60+substr(hrby06,4,2)>=300 AND hrby10 IN ('1','6') AND hrbyacti = 'Y') OR (hrby09 = l_name AND hrby05 = g_date+1 AND substr(hrby06,1,2)*60+substr(hrby06,4,2)<=170 AND hrby10 IN ('1','6') AND hrbyacti = 'Y')   #addbywangww180211
      IF l_a = 0 THEN
        IF l_b = 0 THEN
         IF g_hrbo.hrbo06 != 'Y' THEN
           LET l_s=p_num
           LET l_s='hrcp',l_s
           LET l_s1=p_num1
           LET l_s1='hrcp',l_s1
           LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='003',",
                     "                     ",l_s1,"='",l_total,"'",
                     " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
           PREPARE p_pp2_4 FROM l_sql1
           EXECUTE p_pp2_4
           LET p_num=p_num+2
           LET p_num1=p_num1+2
         END IF
        END IF
        IF l_b = 1 THEN
          IF g_hrbo.hrbo06 != 'Y' THEN
           LET l_s=p_num
           LET l_s='hrcp',l_s
           LET l_s1=p_num1
           LET l_s1='hrcp',l_s1
           LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='034',",
                     "                     ",l_s1,"='",1,"'",
                     " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
           PREPARE p_pp2_1 FROM l_sql1
           EXECUTE p_pp2_1
           LET p_num=p_num+2
           LET p_num1=p_num1+2
           END IF
        END IF
#        IF l_b >= 2 THEN
#          IF g_hrbo.hrbo06 != 'Y' THEN
#           SELECT MIN(hrby06),MAX(hrby06) INTO l_min,l_max FROM hrby_file WHERE (hrby09 = l_name AND hrby05 = g_date AND substr(hrby06,1,2)*60+substr(hrby06,4,2)>=360 AND hrby10 IN ('1','6') AND hrbyacti = 'Y') OR (hrby09 = l_name AND hrby05 = g_date+1 AND substr(hrby06,1,2)*60+substr(hrby06,4,2)<=170 AND hrby10 IN ('1','6') AND hrbyacti = 'Y')
#           IF l_min >=0 AND l_min <=170 THEN
#              UPDATE hrcp_file SET hrcp09=l_total,hrcp22 = l_max,hrcp23 = l_min WHERE hrcp02=l_name AND hrcp03=g_date
#            ELSE
#             UPDATE hrcp_file SET hrcp09=l_total,hrcp22 = l_min,hrcp23 = l_max WHERE hrcp02=l_name AND hrcp03=g_date
#           END IF
#          END IF
#        END IF
      ELSE
        SELECT SUM(l_hour) INTO l_sh FROM TEMP3
        IF l_sh < l_total THEN
          IF l_b = 0 THEN
             LET l_s=p_num
             LET l_s='hrcp',l_s
             LET l_s1=p_num1
             LET l_s1='hrcp',l_s1
             LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='003',",
                       "                     ",l_s1,"='",l_total,"'",
                       " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
             PREPARE p_pp2_2 FROM l_sql1
             EXECUTE p_pp2_2
             LET l_sum = l_sum + l_sh
             LET p_num=p_num+2
             LET p_num1=p_num1+2
          END IF
          IF l_b = 1 THEN
             LET l_s=p_num
             LET l_s='hrcp',l_s
             LET l_s1=p_num1
             LET l_s1='hrcp',l_s1
             LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='034',",
                       "                     ",l_s1,"='",1,"'",
                       " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
             PREPARE p_pp2_3 FROM l_sql1
             EXECUTE p_pp2_3
             LET l_sum = l_sum + l_sh
             LET p_num=p_num+2
             LET p_num1=p_num1+2
          END IF
          IF l_b >= 2 THEN
            LET l_total = l_total - l_sh
            UPDATE hrcp_file SET hrcp09=l_total WHERE hrcp02=l_name AND hrcp03=g_date
          END IF
        ELSE
          LET l_sql = "select hrcd01,lhour from temp3 "
          PREPARE p056_p6_1w FROM l_sql
          DECLARE p056_p6_s1w CURSOR FOR p056_p6_1w
          FOREACH p056_p6_s1w INTO l_hrcd01,l_hour
             LET l_s=p_num
             LET l_s='hrcp',l_s
             LET l_s1=p_num1
             LET l_s1='hrcp',l_s1
             LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='",l_hrcd01,"',",
                       "                     ",l_s1,"='",l_hour,"'",
                       " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
             PREPARE p_pp2w FROM l_sql1
             EXECUTE p_pp2w
             LET l_sum = l_sum + l_hour
             LET p_num=p_num+2
             LET p_num1=p_num1+2
          END FOREACH
        END IF
      END IF
   ELSE

   #-----add by wangwy 2015-09-07 end-------------
#   #-----add by wangwy 2015-09-09 start-----------
#        SELECT hrcp22,hrcp23 INTO l_jin1,l_chu1 FROM hrcp_file WHERE hrcp02=l_name AND hrcp03=g_date
#        IF cl_null(l_jin1) AND NOT cl_null(l_chu1) OR NOT cl_null(l_jin1) AND cl_null(l_chu1) THEN
#            UPDATE hrcp_file SET hrcp10='',hrcp11='',hrcp12='',hrcp13='',hrcp14='',hrcp15='',hrcp16='',
#                                 hrcp17='',hrcp18='',hrcp19='',hrcp20='',hrcp21=''
#             WHERE hrcp02=l_name
#             AND hrcp03=g_date
#       #     UPDATE hrcp_file SET hrcp10='034',hrcp11='1' WHERE hrcp02=l_name AND hrcp03=g_date
#         LET p_num = 10
#         LET p_num1 = 11
#         LET l_s=p_num
#         LET l_s='hrcp',l_s
#         LET l_s1=p_num1
#         LET l_s1='hrcp',l_s1
#         LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='034',",
#                   "                     ",l_s1,"='",1,"'",
#                   " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
#         PREPARE p_pp2s FROM l_sql1
#         EXECUTE p_pp2s
#         LET p_num=p_num+2
#         LET p_num1=p_num1+2
#        END IF
#   #-----add by wangwy 2015-09-09 end-------------
   LET l_sql = "select hrcd01,lhour from temp3 "
   PREPARE p056_p6_1 FROM l_sql
   DECLARE p056_p6_s1 CURSOR FOR p056_p6_1
   FOREACH p056_p6_s1 INTO l_hrcd01,l_hour
      LET l_s=p_num
      LET l_s='hrcp',l_s
      LET l_s1=p_num1
      LET l_s1='hrcp',l_s1
      LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='",l_hrcd01,"',",
                "                     ",l_s1,"='",l_hour,"'",
                " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
      PREPARE p_pp2 FROM l_sql1
      EXECUTE p_pp2
      LET l_sum = l_sum + l_hour
      LET p_num=p_num+2
      LET p_num1=p_num1+2
   END FOREACH
   LET l_sql = "select hrcd01,lhour,hrcda10 from temp4 "
   PREPARE p056_p6_3 FROM l_sql
   DECLARE p056_p6_s3 CURSOR FOR p056_p6_3
   FOREACH p056_p6_s3 INTO l_hrcd01,l_hour,l_hrcda10
      LET l_s=p_num
      LET l_s='hrcp',l_s
      LET l_s1=p_num1
      LET l_s1='hrcp',l_s1
      IF NOT cl_null(l_hour) THEN
         LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='",l_hrcd01,"',",
                   "                     ",l_s1,"='",l_hour,"'",
                   " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
         PREPARE p_pp3 FROM l_sql1
         EXECUTE p_pp3
         LET p_num=p_num+2
         LET p_num1=p_num1+2
         LET l_sum = l_sum + l_hour
      ELSE
         IF l_hrcda10 = '001' THEN
            LET l_sql1 ="UPDATE hrcp_file SET ",l_s,"='",l_hrcd01,"',",
                      "                     ",l_s1,"='",g_hrbo.hrbo08/60,"'",
                      " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
            PREPARE p_pp4 FROM l_sql1
            EXECUTE p_pp4
            LET p_num=p_num+2
            LET p_num1=p_num1+2
            LET l_sum = l_sum + g_hrbo.hrbo08/60
         END IF
      END IF
   END FOREACH
    #插入加班信息
    LET l_sql="SELECT hrcn08,hrcn09,hrcn05,hrcn07 FROM hrcn_file",
              " WHERE hrcn03='",l_name,"' AND hrcn14='",g_date,"'",
              "   AND hrcnacti='Y' AND hrcnconf='Y'"
    PREPARE hrcn_p FROM l_sql
    DECLARE hrcn_c CURSOR FOR hrcn_p
    FOREACH hrcn_c INTO l_hrcn08,l_hrcn09,l_hrcn05,l_hrcn07
        LET l_s=p_num
        LET l_s='hrcp',l_s
        LET l_s1=p_num1
        LET l_s1='hrcp',l_s1
        LET l_sql="UPDATE hrcp_file SET ",l_s,"= '",l_hrcn09,"',",
                  "                     ",l_s1,"= '",l_hrcn08,"'",
                  " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
        PREPARE p_pp8 FROM l_sql
        EXECUTE p_pp8
        LET p_num=p_num+2
        LET p_num1=p_num1+2
        IF l_hrcn09 = '016' OR l_hrcn09 = '017' THEN
           UPDATE hrcp_file SET hrcp22= l_hrcn05,hrcp23 = l_hrcn07
            WHERE hrcp02=l_name AND hrcp03=g_date
        END IF
        IF g_ff = "Y" THEN
           UPDATE hrcp_file SET hrcp24= l_hrcn05,hrcp25 = l_hrcn07
            WHERE hrcp02=l_name AND hrcp03=g_date
        END IF
    END FOREACH
    #add by wangwy 20151201 start
    SELECT COUNT(*) INTO l_jh FROM hrcma_file WHERE hrcma03 = l_name AND hrcma04 = g_date
    #add by nihuan 20160822----start
    select hrcma05,hrcma09 into l_hrcma05,l_hrcma09 from hrcma_file where hrcma03 = l_name AND hrcma04 = g_date
    select hrcp04 into l_hrcp04 from hrcp_file where hrcp02=l_name AND hrcp03=g_date
    select hrbo04 into l_hrbo04 from hrbo_file where hrbo02=l_hrcp04
    if l_jh>0 and l_hrcma09='015' and l_hrcma05<=l_hrbo04 then
       let l_jh=0
    end if
#add by nihuan 20160822------end
    IF cl_null(l_hrcn08) AND l_jh > 0 THEN
#      UPDATE hrcp_file SET hrcp10 = '048',hrcp11='1' WHERE hrcp02 = l_name AND hrcp03 = g_date
        LET l_s=p_num
        LET l_s='hrcp',l_s
        LET l_s1=p_num1
        LET l_s1='hrcp',l_s1
        LET l_sql="UPDATE hrcp_file SET ",l_s,"='048',",
                    "                     ",l_s1,"='",1,"'",
                  " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
        PREPARE p_pp81 FROM l_sql
        EXECUTE p_pp81
        LET p_num=p_num+2
        LET p_num1=p_num1+2
    END IF
    #add by wangwy 20151201 end
    SELECT sum(hrboa12) INTO l_total FROM hrboa_file,hrcp_file
     WHERE hrboa15=hrcp04 AND hrboa08='001' AND hrcp02=l_name AND hrcp03=g_date
    IF l_sum > l_total THEN
       LET l_total  = 0
    ELSE
       LET l_total = l_total -  l_sum
    END IF
 #add by zhuzw 20150708 start
 LET l_sql = "select distinct * from temp6 "
 PREPARE p_pp23 FROM l_sql
 DECLARE p_pp23_s CURSOR FOR p_pp23
 FOREACH p_pp23_s INTO l_t6.*
    LET l_total = l_total - l_t6.fz/60
 END FOREACH
 IF l_total < 0 THEN
    LET l_total = 0
 END IF
 #add by zhuzw 20150708 end
 #add by zhuzw 20150623 start
    SELECT * INTO l_hrcp.* FROM hrcp_file
     WHERE hrcp02=l_name AND hrcp03=g_date

    SELECT hrbo05,hrbo10 INTO l_hrbo05,l_hrbo10 FROM hrbo_file
     WHERE hrbo02 = l_hrcp.hrcp04
    LET l_z = 'N'
    IF NOT cl_null(l_hrcp.hrcp23) THEN
       IF l_hrcp.hrcp23 >= l_hrbo05 THEN
          IF NOT cl_null(l_hrcp.hrcp24) AND NOT cl_null(l_hrcp.hrcp25) THEN
             INSERT INTO temp_jb VALUES(l_hrcp.hrcp24,l_hrcp.hrcp25)
             LET l_z = 'Y'
          END IF
       END IF
    END IF
    IF NOT cl_null(l_hrcp.hrcp25)  THEN
       IF l_hrcp.hrcp25 >= l_hrbo05 THEN
          IF NOT cl_null(l_hrcp.hrcp26) AND NOT cl_null(l_hrcp.hrcp27) THEN
             INSERT INTO temp_jb VALUES(l_hrcp.hrcp26,l_hrcp.hrcp27)
             LET l_z = 'Y'
          END IF
       END IF
    END IF
    IF NOT cl_null(l_hrcp.hrcp27)  THEN
       IF l_hrcp.hrcp27 >= l_hrbo05 THEN
          IF NOT cl_null(l_hrcp.hrcp28) AND NOT cl_null(l_hrcp.hrcp29) THEN
             INSERT INTO temp_jb VALUES(l_hrcp.hrcp28,l_hrcp.hrcp29)
             LET l_z = 'Y'
          END IF
       END IF
    END IF
    IF NOT cl_null(l_hrcp.hrcp29)  THEN
       IF l_hrcp.hrcp29 >= l_hrbo05 THEN
          IF NOT cl_null(l_hrcp.hrcp30) AND NOT cl_null(l_hrcp.hrcp31) THEN
             INSERT INTO temp_jb VALUES(l_hrcp.hrcp30,l_hrcp.hrcp31)
             LET l_z = 'Y'
          END IF
       END IF
    END IF
    IF NOT cl_null(l_hrcp.hrcp31) THEN
       IF l_hrcp.hrcp31 >= l_hrbo05 THEN
          IF NOT cl_null(l_hrcp.hrcp32) AND NOT cl_null(l_hrcp.hrcp33) THEN
             INSERT INTO temp_jb VALUES(l_hrcp.hrcp32,l_hrcp.hrcp33)
             LET l_z = 'Y'
          END IF
       END IF
    END IF


    IF l_hrbo10 = 'Y' AND l_z = 'Y' THEN
       SELECT hrbob_file.* INTO l_hrbob.* FROM hrbob_file
        WHERE hrbob09 = l_hrcp.hrcp04
       LET l_sql = " select * from temp_jb"
       PREPARE p056_p66 FROM l_sql
       DECLARE p056_p66_s CURSOR FOR p056_p66
       FOREACH p056_p66_s INTO l_btime,l_etime
             CALL p056_mi(l_btime,l_etime) RETURNING l_fz
             SELECT  l_fz - mod(l_fz,l_hrbob.hrbob06) INTO l_fz FROM dual
             IF l_fz >= l_hrbob.hrbob05  AND l_fz <= l_hrbob.hrbob07 THEN
                LET l_s=p_num
                LET l_s='hrcp',l_s
                LET l_s1=p_num1
                LET l_s1='hrcp',l_s1
                LET l_sql="UPDATE hrcp_file SET ",l_s,"=  '015', ",
                          "                     ",l_s1,"= '",l_fz/60,"'",
                          " WHERE hrcp02='",l_name,"' AND hrcp03='",g_date,"'"
                PREPARE p_pp9 FROM l_sql
                EXECUTE p_pp9
                LET p_num=p_num+2
                LET p_num1=p_num1+2
             END IF
       END FOREACH
    END IF
    IF g_hrbo.hrbo06='Y' THEN
       UPDATE hrcp_file SET hrcp08='91',hrcp09=0,hrcp34=NULL,hrcp35='Y'
         WHERE hrcp02=l_name AND hrcp03=g_date
    ELSE
       UPDATE hrcp_file SET hrcp08='91',hrcp09=l_total,hrcp34=NULL,hrcp35='Y'
        WHERE hrcp02=l_name AND hrcp03=g_date
    END IF
     SELECT hrcp10 INTO l_hrcp10 FROM hrcp_file
      WHERE  hrcp02=l_name AND hrcp03=g_date
     IF NOT cl_null(l_hrcp10) AND l_hrbn02='003' THEN
        SELECT hrbm02 INTO l_hrbm02 FROM hrbm_file
         WHERE hrbm03 = l_hrcp10
        IF l_hrbm02 != '008' THEN
           UPDATE hrcp_file SET hrcp08 ='92' WHERE  hrcp02=l_name AND hrcp03=g_date
        END IF
     END IF
  END IF   #add by wangwy
  #add by wangwy 20160106 start
  IF l_hrbn02='002' AND g_hrbo.hrbo06='N' THEN
     LET l_total_1 = l_total-l_sum
     UPDATE hrcp_file SET hrcp09 =l_total_1 WHERE  hrcp02=l_name AND hrcp03=g_date
  END IF
  #add by wangwy 20160106 end
END FUNCTION
FUNCTION p056_p2_1(p_hrcda,l_hrcp04)
DEFINE p_hrcda     RECORD LIKE hrcda_file.*
DEFINE l_hrcp04    LIKE hrcp_file.hrcp04
DEFINE l_hrboa02   LIKE type_file.num5
DEFINE l_hrboa05   LIKE type_file.num5
DEFINE l_hrcda06   LIKE hrcda_file.hrcda06
DEFINE l_hrcda08   LIKE hrcda_file.hrcda08
DEFINE l_sql       STRING
DEFINE l_sum       LIKE type_file.num5
DEFINE l_flag      LIKE type_file.chr1
    LET l_hrcda06=p_hrcda.hrcda06[1,2] * 60 + p_hrcda.hrcda06[4,5]
    LET l_hrcda08=p_hrcda.hrcda08[1,2] * 60 + p_hrcda.hrcda08[4,5]
    LET l_flag='Y'
    LET p_hrcda.hrcda09=0
########add by yinbq 20150711
    #IF p_hrcda.hrcda07>p_hrcda.hrcda05 AND g_hrbo.hrbo07 = 'Y' THEN
    #   LET l_hrcda08=24*60
    #END IF
    IF l_hrcda08 <= l_hrcda06 THEN
      LET l_hrcda08 = l_hrcda08 + 24 * 60
    END IF
########add by yinbq 20150711

    #确认时间
    LET l_sql=" SELECT (substr(hrboa02,1,2)*60+substr(hrboa02,4,2)),",
              "        (substr(hrboa05,1,2)*60+substr(hrboa05,4,2))",
              "   FROM hrboa_file",
              "  WHERE hrboa15='",l_hrcp04,"'",
              "    AND hrboa08='001' ORDER BY hrboa01"
    PREPARE get_hour_p FROM l_sql
    DECLARE get_hour_c CURSOR FOR get_hour_p
    FOREACH get_hour_c INTO l_hrboa02,l_hrboa05
       IF l_flag='N' THEN
          EXIT FOREACH
       END IF
       IF l_hrboa05<l_hrboa02 THEN
          LET l_hrboa05=24*60
          LET l_flag='N'
       END IF
       IF l_hrcda08<=l_hrboa02 OR l_hrcda06>=l_hrboa05 THEN
          LET l_sum=0
       END IF
       IF l_hrcda06<=l_hrboa02 AND l_hrcda08>l_hrboa02 AND l_hrcda08<=l_hrboa05 THEN
          LET l_sum=l_hrcda08-l_hrboa02
       END IF
       IF l_hrcda06<=l_hrboa02 AND l_hrcda08>l_hrboa05 THEN
          LET l_sum=l_hrboa05-l_hrboa02
       END IF
       IF l_hrcda06>l_hrboa02 AND l_hrcda06<l_hrboa05 AND l_hrcda08<=l_hrboa05 THEN
          LET l_sum=l_hrcda08-l_hrcda06
       END IF
       IF l_hrcda06>l_hrboa02 AND l_hrcda06<l_hrboa05 AND l_hrcda08>l_hrboa05 THEN
          LET l_sum=l_hrboa05-l_hrcda06
       END IF
       LET p_hrcda.hrcda09=p_hrcda.hrcda09+l_sum
    END FOREACH
    LET p_hrcda.hrcda09=p_hrcda.hrcda09/60
    RETURN p_hrcda.hrcda09
END FUNCTION

FUNCTION p056_p2_2(p_hrcec,l_hrcp04)
DEFINE p_hrcec     RECORD LIKE hrcec_file.*
DEFINE l_hrcp04    LIKE hrcp_file.hrcp04
DEFINE l_hrboa02   LIKE type_file.num5
DEFINE l_hrboa05   LIKE type_file.num5
DEFINE l_hrcec06   LIKE hrcec_file.hrcec06
DEFINE l_hrcec08   LIKE hrcec_file.hrcec08
DEFINE l_sql       STRING
DEFINE l_sum       LIKE type_file.num5
DEFINE l_flag      LIKE type_file.chr1
    LET l_hrcec06=p_hrcec.hrcec06[1,2] * 60 + p_hrcec.hrcec06[4,5]
    LET l_hrcec08=p_hrcec.hrcec08[1,2] * 60 + p_hrcec.hrcec08[4,5]
    LET l_flag='Y'
    LET p_hrcec.hrcec09=0
    IF p_hrcec.hrcec07>p_hrcec.hrcec05 THEN
       LET l_hrcec08=24*60
    END IF

    #确认时间
    LET l_sql=" SELECT (substr(hrboa02,1,2)*60+substr(hrboa02,4,2)),",
              "        (substr(hrboa05,1,2)*60+substr(hrboa05,4,2))",
              "   FROM hrboa_file",
              "  WHERE hrboa15='",l_hrcp04,"'",
              "    AND hrboa08='001' ORDER BY hrboa01"
    PREPARE get_hour_pm FROM l_sql
    DECLARE get_hour_cm CURSOR FOR get_hour_pm
    FOREACH get_hour_cm INTO l_hrboa02,l_hrboa05
       IF l_flag='N' THEN
          EXIT FOREACH
       END IF
       IF l_hrboa05<l_hrboa02 THEN
          LET l_hrboa05=24*60
          LET l_flag='N'
       END IF
       IF l_hrcec08<=l_hrboa02 OR l_hrcec06>=l_hrboa05 THEN
          LET l_sum=0
       END IF
       IF l_hrcec06<=l_hrboa02 AND l_hrcec08>l_hrboa02 AND l_hrcec08<=l_hrboa05 THEN
          LET l_sum=l_hrcec08-l_hrboa02
       END IF
       IF l_hrcec06<=l_hrboa02 AND l_hrcec08>l_hrboa05 THEN
          LET l_sum=l_hrboa05-l_hrboa02
       END IF
       IF l_hrcec06>l_hrboa02 AND l_hrcec06<l_hrboa05 AND l_hrcec08<=l_hrboa05 THEN
          LET l_sum=l_hrcec08-l_hrcec06
       END IF
       IF l_hrcec06>l_hrboa02 AND l_hrcec06<l_hrboa05 AND l_hrcec08>l_hrboa05 THEN
          LET l_sum=l_hrboa05-l_hrcec06
       END IF
       LET p_hrcec.hrcec09=p_hrcec.hrcec09+l_sum
    END FOREACH
    LET p_hrcec.hrcec09=p_hrcec.hrcec09/60
    RETURN p_hrcec.hrcec09
END FUNCTION
FUNCTION p056_p5()#处理迟到，早退，旷工情况
DEFINE l_hrcp RECORD LIKE hrcp_file.*
DEFINE l_sql STRING
DEFINE l_i,l_fz,l_n,l_fz_1,l_fz_2,l_fz1,l_fz2 LIKE type_file.num5
DEFINE  l_hrboa01,l_hrboa01_1  LIKE hrboa_file.hrboa01,
        l_hrboa02,l_hrboa02_1,l_hrboa02_2  LIKE hrboa_file.hrboa02,
        l_hrboa05,l_hrboa05_1,l_hrboa05_2  LIKE hrboa_file.hrboa05,
        l_hrboa11,l_hrboa11_1 LIKE hrboa_file.hrboa11
DEFINE l_t5  DYNAMIC ARRAY OF RECORD
        hrboa01  LIKE hrboa_file.hrboa01,
        hrboa02  LIKE hrboa_file.hrboa02,
        hrboa03  LIKE hrboa_file.hrboa03,
        hrboa04  LIKE hrboa_file.hrboa04,
        hrboa05  LIKE hrboa_file.hrboa05,
        hrboa06  LIKE hrboa_file.hrboa06,
        hrboa07  LIKE hrboa_file.hrboa07,
        hrboa11  LIKE hrboa_file.hrboa11,
        hrboa12  LIKE hrboa_file.hrboa12,
        hrboa13  LIKE hrboa_file.hrboa13
             END RECORD
DEFINE l_z   LIKE type_file.chr1
DEFINE l_b1,l_b2 LIKE hrboa_file.hrboa05
   UPDATE hrcp_file SET hrcp10='',hrcp11='',hrcp12='',hrcp13='',hrcp14='',hrcp15='',hrcp16='',
                        hrcp17='',hrcp18='',hrcp19='',hrcp20='',hrcp21=''
    WHERE hrcp02=l_name
    AND hrcp03=g_date
   SELECT * INTO l_hrcp.* FROM hrcp_file
    WHERE hrcp02=l_name
      AND hrcp03=g_date
   INSERT INTO temp8 VALUES(l_hrcp.hrcp22,l_hrcp.hrcp23)
   INSERT INTO temp8 VALUES(l_hrcp.hrcp24,l_hrcp.hrcp25)
   INSERT INTO temp8 VALUES(l_hrcp.hrcp26,l_hrcp.hrcp27)
   INSERT INTO temp8 VALUES(l_hrcp.hrcp28,l_hrcp.hrcp29)
   INSERT INTO temp8 VALUES(l_hrcp.hrcp30,l_hrcp.hrcp31)
   INSERT INTO temp8 VALUES(l_hrcp.hrcp32,l_hrcp.hrcp33)
   LET l_i = 1
   CALL l_t5.clear()
   IF g_hrbo.hrbo06 != 'Y' THEN
      LET l_sql = " SELECT * FROM temp5 order by hrboa01 "
      PREPARE p056_p5_11 FROM l_sql
      DECLARE p056_p5_s11 CURSOR FOR p056_p5_11
      FOREACH p056_p5_s11 INTO l_t5[l_i].*
         IF l_i >6 THEN
            EXIT FOREACH
         END IF
         LET l_z = 'N'
         LET l_sql = " SELECT * FROM temp8"
         PREPARE p5_pp3 FROM l_sql
         DECLARE p5_ps3 CURSOR FOR p5_pp3
         FOREACH p5_ps3 INTO l_b1,l_b2
           # IF l_t5[l_i].hrboa05 > l_t5[l_i].hrboa02 THEN
           IF g_hrbo.hrbo07 != 'Y' THEN
               IF NOT cl_null(l_b1) AND NOT cl_null(l_b2) THEN
                  IF (l_t5[l_i].hrboa02 >=l_b2  AND l_b2 > l_b1 ) OR l_t5[l_i].hrboa05<= l_b1 THEN
                     CONTINUE FOREACH
                  END IF

                  IF l_t5[l_i].hrboa06 = 'Y' AND  l_t5[l_i].hrboa05 > l_b2 AND l_b2 > l_b1   THEN
                     INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_b2,l_t5[l_i].hrboa05)
                     LET l_z = 'Y'
                  END IF
                  IF l_t5[l_i].hrboa03 = 'Y' AND  l_t5[l_i].hrboa02 <  l_b1 AND l_b2 > l_b1   THEN
                     INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa02,l_b1)
                     LET l_z = 'Y'
                  END IF
                  IF l_b1 > l_t5[l_i].hrboa02 AND l_b2 <l_t5[l_i].hrboa05  AND l_b2 > l_b1  THEN
                     INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa02,l_b1)
                     INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_b2,l_t5[l_i].hrboa05)
                     LET l_z = 'Y'
                  END IF
                  IF l_t5[l_i].hrboa02 >=l_b1 AND  ((l_t5[l_i].hrboa05<= l_b2 AND  l_b2 > l_b1 ) OR (l_t5[l_i].hrboa05> l_b2 AND  l_b2 < l_b1 ) )THEN
                     LET l_z = 'Y'
                  END IF
               END IF
             ELSE
               IF NOT cl_null(l_b1) AND NOT cl_null(l_b2) THEN
                  IF l_t5[l_i].hrboa05 < l_t5[l_i].hrboa02 THEN
                     IF l_t5[l_i].hrboa02 <=l_b2  OR l_t5[l_i].hrboa05>= l_b1 THEN
                        CONTINUE FOREACH
                     END IF
                     IF l_t5[l_i].hrboa02 >= l_b1 AND ((l_t5[l_i].hrboa05 > l_b2  AND l_t5[l_i].hrboa02 > l_b2 ) OR (l_t5[l_i].hrboa05 < l_b2  AND l_t5[l_i].hrboa02 < l_b2 ))  THEN
                        INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_b2,l_t5[l_i].hrboa05)
                        LET l_z = 'Y'
                     END IF
                     IF l_t5[l_i].hrboa05 <= l_b2 AND ((l_t5[l_i].hrboa02 < l_b1 AND  l_t5[l_i].hrboa05 < l_b1) OR  (l_t5[l_i].hrboa02 > l_b1 AND  l_t5[l_i].hrboa05 > l_b1)) THEN
                        INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa02,l_b1)
                        LET l_z = 'Y'
                     END IF
                     IF (l_b1 > l_t5[l_i].hrboa02 AND l_b2 <l_t5[l_i].hrboa05) OR (l_b1 < l_t5[l_i].hrboa02 AND l_b2 <l_t5[l_i].hrboa05 AND l_b1 < l_t5[l_i].hrboa05 ) OR (l_b1 > l_t5[l_i].hrboa02 AND l_b2 > l_t5[l_i].hrboa05 AND  l_b2 > l_t5[l_i].hrboa02) THEN
                        INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa02,l_b1)
                        INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_b2,l_t5[l_i].hrboa05)
                        LET l_z = 'Y'
                     END IF
                     IF l_t5[l_i].hrboa02 >= l_b1 AND  l_t5[l_i].hrboa05<= l_b2 THEN
                        LET l_z = 'Y'
                     END IF
                  ELSE
#                     IF l_t5[l_i].hrboa02 >=l_b2   THEN
#                        CONTINUE FOREACH
#                     END IF
                     IF l_t5[l_i].hrboa06 = 'Y' AND l_t5[l_i].hrboa05 > l_b2  THEN
                        INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_b2,l_t5[l_i].hrboa05)
                        LET l_z = 'Y'
                     END IF
                     IF l_t5[l_i].hrboa03 = 'Y' AND l_t5[l_i].hrboa02 < l_b1  THEN
                        INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa02,l_b1)
                        LET l_z = 'Y'
                     END IF
                     IF (l_t5[l_i].hrboa06 = 'Y' AND l_t5[l_i].hrboa05 > l_b2) AND  (l_t5[l_i].hrboa03 = 'Y' AND l_t5[l_i].hrboa02 < l_b1) THEN
                        INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa02,l_b1)
                        INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_b2,l_t5[l_i].hrboa05)
                        LET l_z = 'Y'
                     END IF
                     IF  (l_t5[l_i].hrboa03 = 'Y' AND l_t5[l_i].hrboa02 >= l_b1 AND l_t5[l_i].hrboa06 = 'N') OR (l_t5[l_i].hrboa06 = 'Y' AND l_t5[l_i].hrboa05<= l_b2 )   THEN
                        LET l_z = 'Y'
                     END IF
                  END IF
               END IF
             END IF
         END FOREACH
         IF l_z = 'N' THEN
            INSERT INTO temp9 VALUES(l_t5[l_i].hrboa01,l_t5[l_i].hrboa02,l_t5[l_i].hrboa05)
         END IF
      END FOREACH
      LET l_sql = " SELECT * FROM temp9 "
      PREPARE p5_pp2 FROM l_sql
      DECLARE p5_ps2 CURSOR FOR p5_pp2
      FOREACH p5_ps2 INTO l_hrboa01,l_b1,l_b2
         SELECT COUNT(*) INTO l_n FROM TEMP5
          WHERE hrboa02 = l_b1
            AND hrboa05 != l_b2
         IF l_n > 0 THEN
            CALL  p056_mi(l_b1,l_b2) RETURNING l_fz
            INSERT INTO TEMP6 VALUES(l_hrboa01,l_fz,'001')
         END IF
         SELECT COUNT(*) INTO l_n FROM TEMP5
          WHERE hrboa02 != l_b1
            AND hrboa05   = l_b2
         IF l_n > 0 THEN
            CALL  p056_mi(l_b1,l_b2) RETURNING l_fz
            INSERT INTO TEMP6 VALUES(l_hrboa01,l_fz,'002')
         END IF
         SELECT COUNT(*) INTO l_n FROM TEMP5
          WHERE hrboa02 = l_b1 AND hrboa05 = l_b2
         IF l_n > 0 THEN
            CALL  p056_mi(l_b1,l_b2) RETURNING l_fz
            INSERT INTO TEMP6 VALUES(l_hrboa01,l_fz,'003')
         END IF
      END FOREACH
   END IF
   #add by zhuzw 20150708 end

   CALL p056_p5_1()#判断最终异常状态
END FUNCTION
