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
            RTS
    
PJPLOT
; ACTUALIZAR GRAFICAMENTE AL JUGADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

            MOVEM.L D0-D4,-(A7)

            ;DEFINIR COLOR CONTORNO
            MOVE.B  #80,D0
            MOVE.L  #PJCOLOR,D1
            TRAP    #15
                        
            ;DEFINIR COLOR RELLENO
            MOVE.B  #81,D0
            MOVE.L  #PJFILL,D1
            TRAP    #15
            
            ;DEFINIR COORDENADAS
            
                ;DEFINIR ANCHURA RECTANGULO
            MOVE.W  (PJPOSX),D1
            SUB.W   #PJANCHO/2,D1
            MOVE.W  D1,D3
            ADD.W   #PJANCHO,D3

                ;DEFINIR ALTURA RECTANGULO
            MOVE.W  #PJY-PJALTO/2,D2
            MOVE.W  #PJY+PJALTO/2,D4
            
            ;DIBUJAR RECTANGULO
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVEM.L  (A7)+,D0-D4
            
            RTS
            
            
            
*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
