; ==============================================================================
; GAME MANAGEMENT
; ==============================================================================
; ------------------------------------------------------------------------------
GAMEINIT
; INITIALIZES GAME.
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D2/A0-A3,-(A7)

            JSR     SCOINIT
            JSR     LASBINIT
            
            ;CREAR ENEMIGO 1
            MOVE.W  #1,D1   ;DEFINIR X
            MOVE.W  #0,D2   ;DEFINIR Y
            LEA     ENEINIT,A1
            LEA     ENEUPD,A2
            LEA     ENEPLOT,A3
            MOVE.W  #ENEID,D0
            JSR     AGLADD
            
            ;CREAR ENEMIGO 2
            MOVE.W  #2,D1
            MOVE.W  #0,D2
            JSR     AGLADD
            
             ;CREAR ENEMIGO 3
            MOVE.W  #3,D1
            MOVE.W  #0,D2
            JSR     AGLADD
            
             ;CREAR ENEMIGO 4
            MOVE.W  #1,D1
            MOVE.W  #1,D2
            JSR     AGLADD
            
            MOVEM.L (A7)+,D0-D2/A0-A3
 
            RTS
; ------------------------------------------------------------------------------
GAMEUPD
; UPDATES THE GAME
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            JSR     LASBUPD
            JSR     PJUPD
            JSR     AGLUPD
            RTS
            
; ------------------------------------------------------------------------------
GAMEPLOT
; UPDATES THE GAME
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            JSR     SCOPLOT
            JSR     LASBPLOT
            JSR     PJPLOT
            JSR     AGLPLOT
            RTS            
*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
