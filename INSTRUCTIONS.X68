; ==============================================================================
; INSTRUCTIONS SCREEN
; ==============================================================================

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
INSINIT
; INSTRUCTIONS SCREEN INIT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            CLR.W   (INSTIMER)
            RTS

; ------------------------------------------------------------------------------
INSUPD
; INSTRUCTIONS SCREEN UPDATE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            BTST.B  #4,(KBDEDGE)
            BEQ     .CONT
            CLR.W   (STANEXT)
.CONT       ADDQ.W  #1,(INSTIMER)
            CMP.W   #INSMAXTM,(INSTIMER)
            BLT     .DONE
            CLR.W   (STANEXT)
.DONE       RTS

; ------------------------------------------------------------------------------
INSPLOT
; INSTRUCTIONS SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------

            MOVEM.L D0-D1/A0-A1,-(A7)
            MOVE.B  #11,D0
            LEA     .TXTLST,A1
.LOOP       MOVE.L  (A1)+,D1
            BEQ     .DONE
            MOVE.L  D1,A0
            JSR     UTLPRINT
            BRA     .LOOP
.DONE       MOVEM.L (A7)+,D0-D1/A0-A1
            RTS
.TXT1       DC.B    'BIENVENIDO A SQUARE INVADERS!',0
.TXT2       DC.B    '---------------------------------------------------------------------------------------'
.TXT3       DC.B    'EL OBJETIVO DEL JUEGO ES DERROTAR A LOS',0
.TXT4       DC.B    'SQUARES SIN SER DESTRUIDO.',0
.TXT5       DC.B    'PARA ELLO, MUEVE LA NAVE CON LAS FLECHAS',0
.TXT6       DC.B    'AUNQUE SOLO PODRAS HACERLO',0
.TXT7       DC.B    'DE DERECHA A IZQUIERDA',0
.TXT8       DC.B    'IMPORANTE!!! USA EL ESPACIO PARA DISPARAR',0
.TXT9       DC.B    'CREES QUE ES SENCILLO...PRUEBALO!!',0
            DS.W    0
.TXTLST     DC.L    .TXT1,.TXT2,.TXT3,.TXT4,.TXT5,.TXT6,.TXT7,.TXT8,.TXT9,0





*~Font name~Fixedsys~
*~Font size~24~
*~Tab type~0~
*~Tab size~4~
