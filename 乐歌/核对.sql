-- 核对采购和成本
select xccc006 
  from (select unique xccc006, xccc202, apcb113
          from xccc_t, pmds_t, pmdt_t, APCB_T
         where xcccent = 5
           and xcccld = 'LG'
           and xccc004 = 2018
           and xccc005 = 9
           and xccc202 <> 0
              --and xccc006 ='2.143.101.00.068.08.01'     
           and pmds001 between to_date('180901', 'yymmdd') and
               to_date('180930', 'yymmdd')
           and pmdsstus = 'S'
           and pmdssite = 'LG'
           and pmdtdocno = pmdsdocno
           and pmdt006 = xccc006
           and apcb002 = pmdsdocno
           and apcb004 = xccc006) 


-- 核对采购金额


select * from (
select    apca038   ,a ,   sum(glaq003-glaq004) b
from (
select    apca038   ,
sum(apcb113*apcb022) a 
   from apca_t 
  ,apcb_t 
where apcadocno=apcbdocno and apcaent=apcbent and apcald=apcbld
and apca038 in (select glapdocno
  from glap_t, glaq_t
 where glapdocno = glaqdocno and glapent=glaqent and glapld=glaqld
   and glap002 = 2018
   and glap004 = 9
   and glaq002 like '14%'
   and glap007= 'AP'
   and glapent = '5'
   and glapld = 'LG')
   --and glapdocno<>'QU-G310-1710000143' )
   --and glapdocno <> 'QU-G310-1711000181')
   and apcb004  in (SELECT xccc006
  FROM xccc_t
 WHERE xcccent = '5'
   AND xccccomp = 'LG'
   AND xcccld = 'LG'
   AND xccc001 = '1'
   AND xccc003 = 'AXC01'
   AND (xccc004 * 12 + xccc005 BETWEEN 2018 * 12 + 9 AND 2018 * 12 +9) 
   and xccc202<>0)
   
   and apcb021 like '140%'
   and apcb023='N'
  -- and apcb004='7.0302.03.000342'
  --and apca038='QU-G310-1711000039'
group by apca038
order by apca038
)                 left join glaq_t on glaq002 like '140%' and glaqdocno = apca038
group by       apca038   ,a 
)                 

-- 成本和采购金额差异

select sum(xccc202),sum(a) from ( 
select  apcb004,xccc202,a from xccc_t 
left join (
--select apcbdocno,apca038,apcb002,apcb003,
select  apcb004,
sum(apcb113*apcb022) a from apca_t,apcb_t 
where apcadocno=apcbdocno and apcaent=apcbent and apcald=apcbld
and apca038 in (select glapdocno
  from glap_t, glaq_t
 where glapdocno = glaqdocno and glapent=glaqent and glapld=glaqld
   and glap002 = 2018
   and glap004 = 9
   and glaq002 like '14%'
   and glap007= 'AP'
   and glapent = '5'
   and glapld = 'LG')
   --and glapdocno<>'QU-G310-1710000143' )
   --and glapdocno <> 'QU-G310-1711000181')
   and apcb004  in (SELECT xccc006
  FROM xccc_t
 WHERE xcccent = '5'
   AND xccccomp = 'LG'
   AND xcccld = 'LG'
   AND xccc001 = '1'
   AND xccc003 = 'AXC01'
   AND (xccc004 * 12 + xccc005 BETWEEN 2018 * 12 + 9 AND 2018 * 12 +9) 
   and xccc202<>0)
   
   and apcb021 like '140%'
   and apcb023='N'
  -- and apcb004='7.0302.03.000342'
  --and apca038='QU-G310-1711000039'
group by apcb004
order by apcb004
)  on xccc006 =   apcb004 
         where xcccent = 5
           and xcccld = 'LG'
           and xccc004 = 2018
           and xccc005 = 9
           and xccc202 <> 0
)               