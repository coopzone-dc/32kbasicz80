5 REM Example of using Machine code from BASIC
7 REM you must answer 65000 to the Memory top? question
9 PRINT "Loading machine code, then we will call it using USR(0)"
10 FOR X =-536 TO -499
15 READ Y
25 POKE X,Y
30 NEXT X
40 POKE -32695,232
45 POKE -32694,253
50 rem this calls the routene
55 x=usr(0)
60 end
9999 REM This is the converted to decimal data from the program
10000 DATA 229,33,6,254,205,241,253,225,201,126,183
10005 DATA 200,205,251,253,35,24,247,201,245,219
10010 DATA 128,203,79,40,250,241,211,129,201,72,101,108,108,111,13,10,0
10100 REM This is the assemble example for above basic program
20001 REM FDE8          .org 0fde8h ;this is 65000, used for Memory top question
20002 REM FDE8  
20003 REM FDE8 E5    	push hl
20004 REM FDE9 21 06 FE ld hl,msg   ;simple hello
20005 REM FDEC CD F1 FD call PRINT
20006 REM FDEF E1 	pop	hl
20007 REM FDF0 C9       ret
20008 REM FDF1  
20009 REM FDF1 7E  PRINT:  LD A,(HL)  ; Get character
20010 REM FDF2 B7          OR A  ; Is it $00 ?
20011 REM FDF3 C8          RET Z  ; Then RETurn on terminator
20012 REM FDF4 CD FB FD    CALL	TXA
20013 REM FDF7 23          INC HL  ; Next Character
20014 REM FDF8 18 F7       JR PRINT  ; Continue until $00
20015 REM FDFA C9          RET
20016 REM FDFB  
20017 REM FDFB F5    TXA:   PUSH AF  ; Store character
20018 REM FDFC DB 80 conout1: IN A,($80)  ; Status byte
20019 REM FDFE CB 4F BIT 1,A  ; Set Zero flag if still transmitting character
20020 REM FE00 28 FA JR Z,conout1 ; Loop until flag signals ready
20021 REM FE02 F1    POP AF  ; Retrieve character
20022 REM FE03 D3 81 OUT ($81),A  ; Output the character
20023 REM FE05 C9    RET
20024 REM FE06  
20025 REM FE06 48 65 6C 6C msg:  .byte "Hello",13,10,0
20025 REM FE0A 6F 0D 0A 00 
20026 REM FE0E  		.end
