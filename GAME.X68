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
            MOVEM.L D0-D4/A0-A3,-(A7)

            JSR     SCOINIT
            JSR     LASBINIT
            JSR     LASINIT
            
            ;CREAR ENEMIGO 1
            LEA     ENEINIT,A1
            LEA     ENEUPD,A2
            LEA     ENEPLOT,A3
            MOVE.W  #ENEID,D0
            
            MOVE.W  #ENENUMF-1,D3
.LOOP2      MOVE.W  #ENENUMC-1,D4
.LOOP       MOVE.W  D4,D1   ;DEFINIR X
            MOVE.W  D3,D2   ;DEFINIR Y
            JSR     AGLADD
            
            DBRA    D4,.LOOP
            DBRA    D3,.LOOP2

            MOVEM.L (A7)+,D0-D4/A0-A3
 
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
            JSR     LASUPD
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
            JSR     LASPLOT
            JSR     AGLPLOT
            RTS            





*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
