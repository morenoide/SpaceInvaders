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
            
            JSR     DMMINIT
            JSR     SCOINIT
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
            JSR     PJUPD
            JSR     LASUPD
            JSR     AGLUPD
            
            CMP.W   #SCOOUTMX,(SCOOUT)  ;SI SECUMPLE LA CONDICION DE VICTORIA
            BLT     .DONE
            MOVE.W  #3,(STANEXT)        ;CAMBIA A STATE 3
.DONE       RTS
            
; ------------------------------------------------------------------------------
GAMEPLOT
; UPDATES THE GAME
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            JSR     SCOPLOT
            JSR     PJPLOT
            JSR     LASPLOT
            JSR     AGLPLOT
            
            ;COLOR PARA DIBUJAR
            MOVE.L	#$00FFFFFF,D1	
            MOVEQ	#80,D0      
            TRAP	#15       
	
            ;Pen fill colour
            MOVE.L	#$00000000,D1
            MOVEQ	#81,D0      
            TRAP	#15     
	
            ;ANCHO LINEA
            MOVEQ	#3,D1	 
            MOVEQ	#93,D0    
            TRAP	#15            
	
            ;LINEA SUPERIOR
            MOVE.W	#0,D1             ; x1    
            MOVE.W	#510,D2             ; y1
            MOVE.W	#640,D3             ; x2
            MOVE.W	#510,D4             ; y2
            MOVEQ	#84,D0  
            TRAP	#15 
            RTS            











*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
