   DISPLAY 'call ',g_datakey.DocProp CLIPPED, 'confirm()'
   CASE g_datakey.DocProp
       WHEN "aapt300" 
            CALL s_aapt300_ws_confirm(p_docno) RETURNING r_success

       WHEN "aapt330" 
            CALL s_aapt300_ws_confirm(p_docno) RETURNING r_success

       WHEN "aapt331" 
            CALL s_aapt331_ws_confirm(p_docno) RETURNING r_success

       WHEN "aapt420" 
            CALL s_aapt420_ws_confirm(p_docno) RETURNING r_success

       WHEN "abmt300" 
            CALL s_abmt300_ws_confirm(p_docno) RETURNING r_success

       WHEN "abmt301" 
            CALL s_abmt301_ws_confirm(p_docno) RETURNING r_success

       WHEN "abmt400" 
            CALL s_abmt400_ws_confirm(p_docno) RETURNING r_success

       WHEN "abmt500" 
            CALL s_abmt500_ws_confirm(p_docno) RETURNING r_success

       WHEN "adbt510" 
            CALL s_adbt510_ws_confirm(p_docno) RETURNING r_success

       WHEN "agct300" 
            CALL s_agct300_ws_confirm(p_docno) RETURNING r_success

       WHEN "aimt300" 
            CALL s_aimt300_ws_confirm(p_docno) RETURNING r_success

       WHEN "aint170" 
            CALL s_aint170_ws_confirm(p_docno) RETURNING r_success

       WHEN "aint180" 
            CALL s_aint180_ws_confirm(p_docno) RETURNING r_success

       WHEN "aint301" 
            CALL s_aint302_ws_confirm(p_docno) RETURNING r_success

       WHEN "aint302" 
            CALL s_aint302_ws_confirm(p_docno) RETURNING r_success

       WHEN "aint310" 
            CALL s_aint310_ws_confirm(p_docno) RETURNING r_success

       WHEN "aint311" 
            CALL s_aint311_ws_confirm(p_docno) RETURNING r_success

       WHEN "aint320" 
            CALL s_aint320_ws_confirm(p_docno) RETURNING r_success

       WHEN "aint820" 
            CALL s_aint820_ws_confirm(p_docno) RETURNING r_success

       WHEN "ammt320" 
            CALL s_ammt320_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt100" 
            CALL s_apmt100_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt128" 
            CALL s_apmt128_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt129" 
            CALL s_apmt129_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt400" 
            CALL s_apmt400_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt410" 
            CALL s_apmt410_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt420" 
            CALL s_apmt420_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt440" 
            CALL s_apmt440_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt480" 
            CALL s_apmt480_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt500" 
            CALL s_apmt500_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt501" 
            CALL s_apmt500_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt510" 
            CALL s_apmt510_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt520" 
            CALL s_apmt520_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt560" 
            CALL s_apmt520_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt570" 
            CALL s_apmt520_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt580" 
            CALL s_apmt520_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt800" 
            CALL s_apmt800_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt811" 
            CALL s_apmt811_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt814" 
            CALL s_apmt814_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt830" 
            CALL s_apmt830_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt832" 
            CALL s_apmt832_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt835" 
            CALL s_apmt835_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt840" 
            CALL s_apmt840_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt850" 
            CALL s_apmt850_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt860" 
            CALL s_apmt860_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt861" 
            CALL s_apmt860_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt862" 
            CALL s_apmt860_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt863" 
            CALL s_apmt860_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt870" 
            CALL s_apmt860_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt880" 
            CALL s_apmt860_ws_confirm(p_docno) RETURNING r_success

       WHEN "apmt890" 
            CALL s_apmt860_ws_confirm(p_docno) RETURNING r_success

       WHEN "aprt111" 
            CALL s_aprt111_ws_confirm(p_docno) RETURNING r_success

       WHEN "aprt112" 
            CALL s_aprt111_ws_confirm(p_docno) RETURNING r_success

       WHEN "aprt113" 
            CALL s_aprt111_ws_confirm(p_docno) RETURNING r_success

       WHEN "aprt121" 
            CALL s_aprt121_ws_confirm(p_docno) RETURNING r_success

       WHEN "aprt601" 
            CALL s_aprt601_ws_confirm(p_docno) RETURNING r_success

       WHEN "aprt602" 
            CALL s_aprt601_ws_confirm(p_docno) RETURNING r_success

       WHEN "aqct300" 
            CALL s_aqct300_ws_confirm(p_docno) RETURNING r_success

       WHEN "artt300" 
            CALL s_artt300_ws_confirm(p_docno) RETURNING r_success

       WHEN "artt405" 
            CALL s_artt405_ws_confirm(p_docno) RETURNING r_success

       WHEN "artt406" 
            CALL s_artt406_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft300" 
            CALL s_asft300_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft311" 
            CALL s_asft310_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft312" 
            CALL s_asft310_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft313" 
            CALL s_asft310_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft314" 
            CALL s_asft310_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft321" 
            CALL s_asft310_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft322" 
            CALL s_asft310_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft323" 
            CALL s_asft310_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft324" 
            CALL s_asft310_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft336" 
            CALL s_asft336_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft338" 
            CALL s_asft338_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft339" 
            CALL s_asft339_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft340" 
            CALL s_asft340_ws_confirm(p_docno) RETURNING r_success

       WHEN "asft800" 
            CALL s_asft800_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt301" 
            CALL s_astt301_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt320" 
            CALL s_astt320_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt340" 
            CALL s_astt340_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt601" 
            CALL s_astt601_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt602" 
            CALL s_astt602_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt603" 
            CALL s_astt603_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt604" 
            CALL s_astt604_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt605" 
            CALL s_astt605_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt606" 
            CALL s_astt606_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt620" 
            CALL s_astt620_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt640" 
            CALL s_astt640_ws_confirm(p_docno) RETURNING r_success

       WHEN "astt740" 
            CALL s_astt740_ws_confirm(p_docno) RETURNING r_success

       WHEN "axct950" 
            CALL cs_axct950_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt128" 
            CALL s_axmt128_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt129" 
            CALL s_axmt129_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt400" 
            CALL s_axmt400_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt410" 
            CALL s_axmt410_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt420" 
            CALL s_axmt420_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt440" 
            CALL s_axmt440_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt500" 
            CALL s_axmt500_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt501" 
            CALL s_axmt500_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt510" 
            CALL s_axmt510_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt520" 
            CALL s_axmt520_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt540" 
            CALL s_axmt540_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt580" 
            CALL s_axmt580_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt600" 
            CALL s_axmt600_ws_confirm(p_docno) RETURNING r_success

       WHEN "axmt800" 
            CALL s_apmt800_ws_confirm(p_docno) RETURNING r_success

       WHEN "axrt300" 
            CALL s_axrt300_ws_confirm(p_docno) RETURNING r_success

       WHEN "axrt400" 
            CALL s_axrt400_ws_confirm(p_docno) RETURNING r_success

       WHEN "cpjt100" 
            CALL cs_cpjt100_ws_confirm(p_docno) RETURNING r_success

       WHEN "cpjt210" 
            CALL cs_cpjt210_ws_confirm(p_docno) RETURNING r_success

       WHEN "cpjt310" 
            CALL cs_cpjt310_ws_confirm(p_docno) RETURNING r_success

   END CASE 

