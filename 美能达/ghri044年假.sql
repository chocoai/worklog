 
 update hrcp_file
 set hrcp10 ='010' , hrcp11 =8
 where hrcp03 = to_date('180930','yymmdd') and hrcp10 is null  and  hrcp02 in (
 select hrcd09 from HRCD_FILE where hrcd02 =to_date('180930','yymmdd') and hrcd01='010'
 )
 
update hrch_file
set hrch20 =  hrch20 + 1 
  where hrch02=2018 and hrch03 = '   in(
 
 select hrcd09 from HRCD_FILE where hrcd02 =to_date('180930','yymmdd') and hrcd01='010'
 )
 
 
 
