							   EXPORT Ana_Program

RCC_APB2ENR                    EQU 0x40021018	

GPIOA_CRL	                   EQU 0x40010800
GPIOA_IDR	                   EQU 0x40010808
GPIOA_ODR	                   EQU 0x4001080C

GPIOB_CRL	                   EQU 0x40010C00
GPIOB_IDR	                   EQU 0x40010C08
GPIOB_ODR	                   EQU 0x40010C0C

							   AREA Bolum3, CODE, READONLY

Ana_Program						                              
	                           LDR R1,=RCC_APB2ENR  ;GPIO'lar için Clock ayarlarini etkinlestir 
	                           LDR R0,[R1]          ;R1 in adresini R0 a yukle
	                           ORR R0,R0,#0xFC	    ;R0 ya 0xfc datasi arasinda veya islemi yaptir r0 a kaydet	
	                           STR R0,[R1]          ;R1 in adresini R0 a yukleyip bellege kaydet
	
	                           LDR R1,=GPIOA_CRL   ;gpioa 0 ve 7 arasi port ayari registeri   
	                           LDR R0,=0x30000003
	                           STR R0,[R1]			;çikislar  PA0 ve PA7 

	                           LDR R1,=GPIOB_CRL    ;gpiob 0 ve 7 arasi port ayari registeri   
	                           LDR R0,=0x00000008   ;pull up olarak ayarlandi 0x00000008 pull down
	                           STR R0,[R1]			;Girisler  PB0 ve PB7 	
dongu
	                           LDR R1,=GPIOB_IDR    ; input kontrol registeri
	                           LDR R0,[R1]			;R0 = GPIOB_IDR nin degeri
	                           LDR R1,=GPIOA_ODR    ; output kontrol registeri
	                           STR R0,[R1]			;GPIOA_ODR = R0
	                           B dongu
			
	                           END
							   
