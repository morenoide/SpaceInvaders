*-----------------------------------------------------------
; SCORE
*-----------------------------------------------------------
SCOINIT
; INICIALIZAR EL MARCADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
            CLR.W   (SCOOUT)
            CLR.W   (FPSCOUNT)
            RTS
    
SCOPLOT
; ACTUALIZAR GRAFICAMENTE EL MARCADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

            MOVEM.L D0-D1/A1,-(A7)
            ;DEFINIR COLOR DE FONDO
            MOVE.B  #81,D0
            MOVE.L  #SCOFILL,D1
            TRAP    #15
            
            ;DEFINIR COODENADAS DONDE SE IMPRIME EL TEXTO 1
            MOVE.B  #11,D0
            MOVE.W  #SCOLINE1,D1
            TRAP    #15
            
            ;IMPRIMIR SCORE
            LEA     .TXT1,A1
            CLR.L   D1
            MOVE.W  (SCOOUT),D1
            MOVE.B  #17,D0
            TRAP    #15
            
            ;DEFINIR COODENADAS DONDE SE IMPRIME EL TEXTO 3
            MOVE.B  #11,D0
            MOVE.W  #SCOLINE3,D1
            TRAP    #15
            
            ;IMPRIMIR MAXSCORE
            LEA     .TXT3,A1
            CLR.L   D1
            MOVE.W  #FPS,D1
            MOVE.B  #17,D0
            TRAP    #15
            
            ;DEFINIR COODENADAS DONDE SE IMPRIME EL TEXTO 4
            MOVE.B  #11,D0
            MOVE.W  #SCOLINE4,D1
            TRAP    #15
            
            ;IMPRIMIR MAXSCORE
            LEA     .TXT4,A1
            CLR.L   D1
            MOVE.W  (FPSSHOW),D1
            MOVE.B  #17,D0
            TRAP    #15
            
            MOVEM.L (A7)+,D0-D1/A1
            
            RTS

;TEXTOS            
.TXT1       DC.B        'SCORE     :',0
.TXT3       DC.B        'GOAL FPS  :',0
.TXT4       DC.B        'ACTUAL FPS:',0





*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
