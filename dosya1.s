
;konfigurasyon kismi
                       THUMB
			 
Baslama_adresi         EQU  0x20000100
	
	                   AREA Bolum1, DATA, READONLY

                       DCD Baslama_adresi;baslatma adresini tanimlar
					   DCD Resetleme_fonksiyonu   
						   
					   AREA Bolum2, CODE, READONLY   
					   ENTRY
					   
					   
Resetleme_fonksiyonu					   
                       IMPORT Ana_Program	
						   
					   B Ana_Program	

                       END
