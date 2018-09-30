# Prog. Version..: '5.30.27-18.04.16(00002)'     #
#
# Pattern name...: s_taxchk.4gl
# Descriptions...: 取得標準, 現時, 預設成本
# Date & Author..: 18.04.12 
# Usage..........: LET l_flag = s_taxchk(p_tax_old,p_tax_new,p_date)
# Input Parameter: p_tax_old  原單據稅別 
#                  p_tax_new  更改後新稅別  
#                  p_date     單據日期
# Return code....: l_flag     成功否 
# Modify.........: No.FUN-I40010 18/04/13 By yihsuan 大陸財務帳款單稅率變更功能
# Modify.........: No.FUN-I40012 18/04/13 By yihsuan 包patch用程式註記

DATABASE ds

GLOBALS "../../config/top.global"  

FUNCTION s_taxchk(p_tax_old,p_tax_new,p_date)
   DEFINE p_tax_old    LIKE hsc_file.hsc01
   DEFINE p_tax_new    LIKE hsc_file.hsc01
   DEFINE p_date       LIKE hsc_file.hscdate
   DEFINE l_cnt        LIKE type_file.num5
   DEFINE l_flag       LIKE type_file.chr1

   LET l_cnt = 0
   SELECT COUNT(hsc02) INTO l_cnt
     FROM hsc_file
    WHERE hsc01    = p_tax_old
      AND hsc02    = p_tax_new
      AND hsc03   <= p_date
      AND hscacti  = 'Y' 
   IF cl_null(l_cnt) THEN LET l_cnt = 0 END IF

   IF l_cnt = 0 THEN
      CALL cl_err('','aoo-083',1)
      LET l_flag = 'N'
   ELSE
      LET l_flag = 'Y'
   END IF
  
   RETURN l_flag
END FUNCTION

#FUN-I40010 add
#FUN-I40012 add
