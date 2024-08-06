
_main:

;Embadded.c,9 :: 		void main() {
;Embadded.c,10 :: 		ADCON1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;Embadded.c,11 :: 		trisA.B0 = 1;
	BSF        TRISA+0, 0
;Embadded.c,12 :: 		trisA.B1 = 1;
	BSF        TRISA+0, 1
;Embadded.c,13 :: 		trisD = 0;
	CLRF       TRISD+0
;Embadded.c,14 :: 		portD = 0;
	CLRF       PORTD+0
;Embadded.c,15 :: 		trisB = 0;
	CLRF       TRISB+0
;Embadded.c,16 :: 		portB = 0;
	CLRF       PORTB+0
;Embadded.c,17 :: 		trisC = 0;
	CLRF       TRISC+0
;Embadded.c,18 :: 		portC = 15;
	MOVLW      15
	MOVWF      PORTC+0
;Embadded.c,19 :: 		portd.b3 = 1;//RED south
	BSF        PORTD+0, 3
;Embadded.c,20 :: 		portD.b2 = 1;//Green west
	BSF        PORTD+0, 2
;Embadded.c,21 :: 		Mode();
	CALL       _Mode+0
;Embadded.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_Automatic:

;Embadded.c,23 :: 		void Automatic()
;Embadded.c,25 :: 		for(count = 0 ; count < 10; count++)     //21  i = 2 , count = 1
	CLRF       _count+0
L_Automatic0:
	MOVLW      10
	SUBWF      _count+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Automatic1
;Embadded.c,27 :: 		portB = count + key[i];
	MOVF       _i+0, 0
	ADDLW      _key+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      _count+0, 0
	MOVWF      PORTB+0
;Embadded.c,28 :: 		if(portB == 32) // 20 segment 0010 0010     //west
	MOVF       PORTB+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_Automatic3
;Embadded.c,30 :: 		portD.b2 = 0;
	BCF        PORTD+0, 2
;Embadded.c,31 :: 		portD.b0 = 1; //RED west
	BSF        PORTD+0, 0
;Embadded.c,32 :: 		}
L_Automatic3:
;Embadded.c,33 :: 		if(portB == 35) //south
	MOVF       PORTB+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_Automatic4
;Embadded.c,35 :: 		portD.b3 = 0;
	BCF        PORTD+0, 3
;Embadded.c,36 :: 		portD.b4 = 1;  //YELLOW south
	BSF        PORTD+0, 4
;Embadded.c,37 :: 		}
L_Automatic4:
;Embadded.c,38 :: 		if(portB == 38) //south
	MOVF       PORTB+0, 0
	XORLW      38
	BTFSS      STATUS+0, 2
	GOTO       L_Automatic5
;Embadded.c,40 :: 		portD.B4 =0;
	BCF        PORTD+0, 4
;Embadded.c,41 :: 		portD.b5 =1; //GREEN south
	BSF        PORTD+0, 5
;Embadded.c,42 :: 		}
L_Automatic5:
;Embadded.c,43 :: 		if(portB == 53)  //west
	MOVF       PORTB+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_Automatic6
;Embadded.c,45 :: 		portD.b0 = 0;
	BCF        PORTD+0, 0
;Embadded.c,46 :: 		portD.b1 = 1;  //YELLOW wesr
	BSF        PORTD+0, 1
;Embadded.c,47 :: 		}
L_Automatic6:
;Embadded.c,48 :: 		delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_Automatic7:
	DECFSZ     R13+0, 1
	GOTO       L_Automatic7
	DECFSZ     R12+0, 1
	GOTO       L_Automatic7
	DECFSZ     R11+0, 1
	GOTO       L_Automatic7
;Embadded.c,49 :: 		if(portB == 55) //west         //37  : 0011 0111
	MOVF       PORTB+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L_Automatic8
;Embadded.c,51 :: 		i = -1;
	MOVLW      255
	MOVWF      _i+0
;Embadded.c,52 :: 		count = 10;
	MOVLW      10
	MOVWF      _count+0
;Embadded.c,53 :: 		portD.b5 =0;
	BCF        PORTD+0, 5
;Embadded.c,54 :: 		portD.b1 = 0;
	BCF        PORTD+0, 1
;Embadded.c,55 :: 		portd.b3 = 1;//RED south
	BSF        PORTD+0, 3
;Embadded.c,56 :: 		portD.b2 = 1;//Green west
	BSF        PORTD+0, 2
;Embadded.c,57 :: 		}
L_Automatic8:
;Embadded.c,58 :: 		if(portA.b0 != 1)
	BTFSC      PORTA+0, 0
	GOTO       L_Automatic9
;Embadded.c,60 :: 		i = -1;
	MOVLW      255
	MOVWF      _i+0
;Embadded.c,61 :: 		portB = 0;
	CLRF       PORTB+0
;Embadded.c,62 :: 		Manual();
	CALL       _Manual+0
;Embadded.c,63 :: 		break;
	GOTO       L_Automatic1
;Embadded.c,64 :: 		}
L_Automatic9:
;Embadded.c,25 :: 		for(count = 0 ; count < 10; count++)     //21  i = 2 , count = 1
	INCF       _count+0, 1
;Embadded.c,65 :: 		}
	GOTO       L_Automatic0
L_Automatic1:
;Embadded.c,66 :: 		i++;
	INCF       _i+0, 1
;Embadded.c,67 :: 		}
L_end_Automatic:
	RETURN
; end of _Automatic

_Mode:

;Embadded.c,68 :: 		void Mode()
;Embadded.c,69 :: 		{  while(1)
L_Mode10:
;Embadded.c,71 :: 		if(portA.b0 == 1)
	BTFSS      PORTA+0, 0
	GOTO       L_Mode12
;Embadded.c,73 :: 		Automatic();
	CALL       _Automatic+0
;Embadded.c,74 :: 		}
	GOTO       L_Mode13
L_Mode12:
;Embadded.c,77 :: 		Manual();
	CALL       _Manual+0
;Embadded.c,78 :: 		}
L_Mode13:
;Embadded.c,79 :: 		}
	GOTO       L_Mode10
;Embadded.c,80 :: 		}
L_end_Mode:
	RETURN
; end of _Mode

_Manual:

;Embadded.c,81 :: 		void Manual()
;Embadded.c,83 :: 		if(flag == 0)
	MOVF       _flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Manual14
;Embadded.c,85 :: 		if(portA.b1 == 1)
	BTFSS      PORTA+0, 1
	GOTO       L_Manual15
;Embadded.c,86 :: 		{   portD.b0 = 0;
	BCF        PORTD+0, 0
;Embadded.c,87 :: 		portD.b5 = 0;
	BCF        PORTD+0, 5
;Embadded.c,88 :: 		portD.b2 = 0;
	BCF        PORTD+0, 2
;Embadded.c,90 :: 		portD.b1 = 1;
	BSF        PORTD+0, 1
;Embadded.c,92 :: 		portD.b3 = 1;
	BSF        PORTD+0, 3
;Embadded.c,93 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_Manual16:
	DECFSZ     R13+0, 1
	GOTO       L_Manual16
	DECFSZ     R12+0, 1
	GOTO       L_Manual16
	DECFSZ     R11+0, 1
	GOTO       L_Manual16
	NOP
;Embadded.c,95 :: 		portD.b1 = 0;
	BCF        PORTD+0, 1
;Embadded.c,97 :: 		portD.b2 = 1;
	BSF        PORTD+0, 2
;Embadded.c,98 :: 		}
	GOTO       L_Manual17
L_Manual15:
;Embadded.c,101 :: 		portD.b2 = 0;
	BCF        PORTD+0, 2
;Embadded.c,102 :: 		portD.b5 = 0;
	BCF        PORTD+0, 5
;Embadded.c,103 :: 		portD.b3 = 0;
	BCF        PORTD+0, 3
;Embadded.c,105 :: 		portD.b4 = 1;
	BSF        PORTD+0, 4
;Embadded.c,107 :: 		portD.b0 = 1;
	BSF        PORTD+0, 0
;Embadded.c,108 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_Manual18:
	DECFSZ     R13+0, 1
	GOTO       L_Manual18
	DECFSZ     R12+0, 1
	GOTO       L_Manual18
	DECFSZ     R11+0, 1
	GOTO       L_Manual18
	NOP
;Embadded.c,110 :: 		portD.b4 = 0;
	BCF        PORTD+0, 4
;Embadded.c,112 :: 		portD.b5 = 1;
	BSF        PORTD+0, 5
;Embadded.c,113 :: 		}
L_Manual17:
;Embadded.c,114 :: 		flag = 1;
	MOVLW      1
	MOVWF      _flag+0
;Embadded.c,115 :: 		OldPortValue = portA.b1;
	MOVLW      0
	BTFSC      PORTA+0, 1
	MOVLW      1
	MOVWF      _OldPortValue+0
;Embadded.c,116 :: 		}
L_Manual14:
;Embadded.c,117 :: 		if(portA.b1 != OldPortValue) {flag = 0;}
	CLRF       R1+0
	BTFSC      PORTA+0, 1
	INCF       R1+0, 1
	MOVF       R1+0, 0
	XORWF      _OldPortValue+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Manual19
	CLRF       _flag+0
L_Manual19:
;Embadded.c,118 :: 		}
L_end_Manual:
	RETURN
; end of _Manual
