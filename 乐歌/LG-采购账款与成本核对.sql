--成本明细清单拉取
select xccc006,sum(xccc202+xccc204+xccc206+xccc208+xccc210+xccc212+xccc214+xccc216+xccc218+xccc302+xccc304) from xccc_t 
select xccc006,sum(xccc202) from xccc_t 
where xcccent=5 
and xcccld='LG' and xccc004=2018 and xccc005=5
and xccc202<>0
group by xccc006
order by xccc006

--采购账款明细清单拉取
select apcbdocno,apca038,apcb002,apcb003,
select-- apcb004,
sum(apcb113*apcb022) from apca_t,apcb_t 
where apcadocno=apcbdocno and apcaent=apcbent and apcald=apcbld
and apca038 in (select glapdocno
  from glap_t, glaq_t
 where glapdocno = glaqdocno and glapent=glaqent and glapld=glaqld
   and glap002 = 2018
   and glap004 = 5
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
   AND (xccc004 * 12 + xccc005 BETWEEN 2018 * 12 + 5 AND 2018 * 12 + 5) 
   and xccc202<>0)
   
   and apcb021 like '140%'
   and apcb023='N'
  -- and apcb004='7.0302.03.000342'
  --and apca038='QU-G310-1711000039'
group by apcb004
order by apcb004

--SQL1 1、	抓取总账中来源码为XC的各项凭证，科目为14%，总金额借-贷。SQL如下：
select glaqdocno,sum(glaq003 - glaq004)
  from glap_t, glaq_t
 where glapdocno = glaqdocno
   and glap002 = 2017
   and glap004 = 12
   and glaq002 like '14%'
   and glap007= 'XC'
   and glapent = '5'
   and glapld = 'QU'
   group by glaqdocno
order by glaqdocno


--SQL2 总账抓取采购金额
select glapdocno,sum(glaq003 - glaq004)
  from glap_t, glaq_t
 where glapdocno = glaqdocno
   and glap002 = 2018
   and glap004 = 5
   and glaq002 like '14%'
   and glap007= 'AP'
   and glapent = '5'
       and glapld = 'LG' --and glapdocno='LG-G310-1805000662'
      -- and glapdocno<>'LG-G310-1712002111'
      -- and glapdocno<>'QU-G310-1711000181'
      group by glapdocno
      order by glapdocno
