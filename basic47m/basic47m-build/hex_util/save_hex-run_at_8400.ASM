     ORG  08400H 
; Save an area of memory in Intel Hex format
; RST 10H is keyboard input, RST 08H is vdu output
; Return to monitor
;
MON: EQU  1DC0H  ; PARSE IN GMON
CR:  EQU  0DH    
LF:  EQU  0AH    
HEXINL:	EQU 1F82H; get 4 hex keystrokes into HL
ILPRINT: EQU 1FDFH
;
     CALL  ILPRINT
     DB	"Start?",0
     CALL HEXINL; HL=start
     PUSH HL
     CALL  ILPRINT
     DB	"End?",0
     CALL HEXINL; DE=end
     EX   DE,HL
     POP HL
NEWREC:	CALL PCRLF  ;
     LD   A,E    ; FIND REC LENGTH
     SUB  L      
     LD   C,A    ; C=DIFFERENCE
     LD   A,D    ; CP HI STOP
     SBC  A,H    ; TO HI POINTER
     LD   B,A    ; B=DIFFERENCE
     JR   C,ERROR; IF DE>HL
     LD   A,16   ; REC LENGTH
     JR   NZ,NEW2; USE FULL LEN
     CP   C      ; CP TO E-L
     JR   C,NEW2 ; USE FULL LEN
     LD   A,B    ; ARE BOTH E-L
     OR   C      ;  & D-E ZERO?
     JR   Z,DONE ; YES LEN=0
     LD   A,C    ; SHORT LEN
NEW2:	LD   C,A    ; C=REC LEN
     CALL PCOLN  ; PUNCH COLON
     LD   A,C    ; GET LEN
     LD   B,0    ; ZERO CHECKSUM
     CALL PNHEX  ; PUNCH LEN
     CALL PUNHL  ; PUNCH ADDR
     XOR  A      ; ZERO RECORD TYPE
     CALL PNHEX  
PMEM:	LD   A,(HL) ; GET BYTE
     CALL PNHEX  ; PUNCH IT
     INC  HL     ; NEXT MEM ADDR
     DEC  C      ; DEC REC LEN
     JR   NZ,PMEM
     CALL CSUM   ; PUNCH C/SUM
     JR   NEWREC ; NEXT RECORD
;
ERROR:
     LD   A,"?"  
     RST 08H  ; PRINT
     JP   MON    
;
DONE:	CALL PCOLN  ; COLON
     XOR  A      ; ZERO C/SUM
     LD   B,A    
     CALL PNHEX  ; PUNCH  0 RECLEN
     LD   HL,0	 ; 
     CALL PUNHL  ; PUNCH ADDR
     XOR  A      ; OR LD A,1
     CALL PNHEX  ; 1=A/START
     CALL CSUM   ; PUNCH C/S
     CALL PCRLF  
     JP   MON    ; DONE
;
PUNHL:
     LD   A,H    
     CALL PNHEX  
     LD   A,L    
;
PNHEX:
     PUSH AF     
     ADD  A,B    ; ADD TO C/SUM
     LD   B,A    ; SAVE
     POP  AF     
     PUSH AF     
     RRA         
     RRA         
     RRA         
     RRA         
     CALL PHEX1  ; PUNCH LHS
     POP  AF     
PHEX1:
     AND  0FH    ; GET RHS
     ADD  A,90H  
     DAA         
     ADC  A,40H  
     DAA         
     JR   POUT   
;
CSUM:	LD   A,B    ; C/S TO A
     CPL         ; COMPLEMENT
     INC  A      
     JR   PNHEX  ; & RET
;
PCRLF:
     LD   A,CR   ; LF IS AUTO
     JR   POUT   ; & RETURN
;
PCOLN:	LD   A,":"  ; COLON
;
POUT:	RST 08H   
          RET         
     ;
          END         
 