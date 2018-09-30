Windows自带VPN
IP：61.164.139.170
账号密码：linxm


服务器地址192.168.2.194 tiptop tiptop
能
连上系统后需要额外配置珠城IP地址


 SELECT oma00,oma01,oma02,oma23,omc06,omc09, omc11,omc07,       omc13,0,omc08 -omc10-omc14,omc09 -omc11-omc15,azj07,omc02   FROM oma_file,OUTER azj_file,occ_file,omc_file WHERE oma23 != 'RMB'   AND azj_file.azj01 = oma_file.oma23 AND azj_file.azj02='201710'   AND oma01 = omc01    AND occ01 = oma03 AND occ40 = 'Y'    AND oma00 like '1%' AND omaconf='Y' AND omavoid='N'   AND oma02 <= '17/10/31'   AND (oma54t>oma55 OR omc13 <>0 OR        oma01 IN (SELECT oob06 FROM ooa_file,oob_file                   WHERE ooa01=oob01 AND ooaconf !='X'                      AND ooa02 > '17/10/31' )) UNION ALL SELECT oma00,oma01,oma02,oma23,omc06,omc09, omc11,omc07,       omc13,0,omc08 -omc10-omc14,omc09 -omc11-omc15,azj07,omc02   FROM oma_file,azj_file,occ_file,omc_file WHERE oma23 != 'RMB'   AND azj_file.azj01 = oma_file.oma23 AND azj_file.azj02='201710'   AND oma01 = omc01    AND occ01 = oma03 AND occ40 = 'Y'    AND oma00 LIKE '2%' AND omaconf='Y' AND omavoid='N'   AND oma02 <= '17/10/31'   AND (oma54t>oma55 OR       omc13 <>0 OR         oma01 IN (SELECT oob06 FROM ooa_file,oob_file                   WHERE ooa01=oob01 AND ooaconf !='X'                      AND ooa02 > '17/10/31' )) ORDER BY 1,9,14  

sr.oma00 = "24"
sr.oma01 = "ZR24-171010024"
sr.oma02 = 17/10/10
sr.oma23 = "1"
sr.oma24 = 1.0000000000
sr.oma56t = 200000.000000
sr.oma57 = 0.000000
sr.oma60 = 1.0000000000
sr.oma61 = 200000.000000
sr.omb03 = 0
sr.amt1 = 200000.000000
sr.amt2 = 200000.000000
sr.azj07 = (null)
sr.omc02 = 1
