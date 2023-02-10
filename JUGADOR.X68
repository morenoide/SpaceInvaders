*-----------------------------------------------------------
; JUGADOR
*-----------------------------------------------------------

; ----------------------------------------------------------
PJINIT
; INICIALIZAR EL PALA DEL JUGADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
            MOVE.W #SCRWIDTH/2,(PJPOSX)
            RTS
    
PJUPD
; ACTUALIZAR EL JUGADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
            
            MOVE.W  D0,-(A7)
           
            ;ACTUALIZAR POSICION JUGADOR
.SEGUIR     MOVE.W  (PJPOSX),D0
            BTST.B  #0,(KBDVAL)
            BEQ     .CHKLEFT
            SUB.W   #PJSPEED,D0
.CHKLEFT    BTST.B  #2,(KBDVAL)
            BEQ     .CONT
            ADD.W   #PJSPEED,D0
            
            ;COLISIONES PARA QUE NO SE SALGA DE LA PANTALLA
.CONT       CMP.W   #PJANCHO/2,D0
            BGE     .CONT2
            MOVE.W  #PJANCHO/2,D0
            BRA     .DONE
            
.CONT2      CMP.W   #SCRWIDTH-PJANCHO/2,D0
            BLE     .DONE
            MOVE.W  #SCRWIDTH-PJANCHO/2,D0

            ;ACTUALIZAR VARIABLE
.DONE       MOVE.W  D0,(PJPOSX)


            MOVE.W  (A7)+,D0            

            RTS
    
PJPLOT
; ACTUALIZAR GRAFICAMENTE AL JUGADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

            MOVEM.L D0-D4/A2,-(A7)
            
            LEA     JUGADOR,A2
            
            MOVE.W  #PJY,D3              
            SUB.W   #PJALTO/2,D3         ; SET Y
            
            MOVE.W  #16-1,D6            ; D5 = X D6 = Y
.LOOP2      MOVE.W  #64-1,D5
            MOVE.W  (PJPOSX),D4
            SUB.W   #PJANCHO/2,D4             ;SET X
.LOOP       MOVE.B  (A2)+,D0
            CMP.W   #0,D0
            BEQ     .SALTO
            
            MOVE.L  #PJCOLOR,D1
            JSR     GFXDRPXL             ; DRAW PIC
            
.SALTO      ADDQ.W  #1,D4
            DBRA.W  D5,.LOOP
            ADDQ.W  #1,D3
            DBRA.W  D6,.LOOP2

*            ;DEFINIR COLOR CONTORNO
*            MOVE.B  #80,D0
*            MOVE.L  #PJCOLOR,D1
*            TRAP    #15
*                        
*            ;DEFINIR COLOR RELLENO
*            MOVE.B  #81,D0
*            MOVE.L  #PJFILL,D1
*            TRAP    #15
*            
*            ;DEFINIR COORDENADAS
*            
*                ;DEFINIR ANCHURA RECTANGULO
*            MOVE.W  (PJPOSX),D1
*            SUB.W   #PJANCHO/2,D1
*            MOVE.W  D1,D3
*            ADD.W   #PJANCHO,D3
*
*                ;DEFINIR ALTURA RECTANGULO
*            MOVE.W  #PJY-PJALTO/2,D2
*            MOVE.W  #PJY+PJALTO/2,D4
*            
*            ;DIBUJAR RECTANGULO
*            MOVE.B  #87,D0
*            TRAP    #15
            
            MOVEM.L  (A7)+,D0-D4/A2
            
            RTS
            
            
            






*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
