; ==============================================================================
; INTRO SCREEN
; ==============================================================================

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
ISCINIT
; INTRO SCREEN INIT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            CLR.W   (ISCTIMER)
            RTS

; ------------------------------------------------------------------------------
ISCUPD
; INTRO SCREEN UPDATE
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L  D0-D1,-(A7)
            TRAP    #MOUSETRAP
            
            TST.B   (MOUSEPRESS)
            BEQ     .END
            
            MOVE.L  (MOUSEPOS),D1
            CMP.W   #270,D1
            BLE     .END
            
            CMP.W   #370,D1
            BGE     .END
            
            SWAP    D1
            
            CMP.W   #400,D1
            BLE     .END
            
            CMP.W   #430,D1
            BGE     .END
            
            MOVE.W  #2,(STANEXT)
            

.END
            ADDQ.W   #1,(ISCTIMER)
            CMP.W   #500,(ISCTIMER)
            BLT     .DONE
            MOVE.W  #1,(STANEXT)        

.DONE       MOVEM.L  (A7)+,D0-D1

            RTS

; ------------------------------------------------------------------------------
ISCPLOT
; INTRO SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D4/A0,-(A7)
            
            ;FONDO NEGRO
            CLR.L   D1
            MOVE.B  #81,D0
            TRAP    #15
            
            ;TEXTO 1
            LEA     .TXT1,A0
            MOVE.B  #10,D0
            JSR     UTLPRINT
        
            ;TEXTO 2
            LEA     .TXT2,A0
            MOVE.B  #27,D0
            JSR     UTLPRINT
            
            MOVE.B  #15,D0
            LEA     .TXTLST,A1
.LOOP       MOVE.L  (A1)+,D1
            BEQ     .DONE
            MOVE.L  D1,A0
            JSR     UTLPRINT
            BRA     .LOOP
.DONE
            
; --- BOTON -------------------------------------------------------------------

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
            MOVE.W	#270,D1             ; x1    
            MOVE.W	#400,D2             ; y1
            MOVE.W	#380,D3             ; x2
            MOVE.W	#400,D4             ; y2
            MOVEQ	#84,D0  
            TRAP	#15    

            ;LINEA IZQ
            MOVE.W	#270,D1             ; x1
            MOVE.W	#400,D2             ; y1
            MOVE.W	#270,D3             ; x2
            MOVE.W	#430,D4             ; y2
            MOVEQ	#84,D0  
            TRAP	#15     

            ;LINEA INFERIOR
            MOVE.W	#270,D1             ; x1
            MOVE.W	#430,D2             ; y1
            MOVE.W	#380,D3             ; x2
            MOVE.W	#430,D4             ; y2
            MOVEQ	#84,D0  
            TRAP	#15 

            ;LINEA DER
            MOVE.W	#380, D1            ; x1
            MOVE.W	#400,D2             ; y1
            MOVE.W	#380,D3             ; x2
            MOVE.W	#430,D4             ; y2
            MOVEQ	#84,D0                  
            TRAP	#15
	      
            MOVEM.L (A7)+,D0-D4/A0

            RTS
.TXT1       DC.B    'SQUARE INVADERS',0
.TXT2       DC.B    'START',0
.TXT4       DC.B    '!!!!!!! !!!!!!!  !     ! !!!!!!! !!!!!!! !!!!!!!!',0
.TXT5       DC.B    '!       !     !  !     ! !     ! !     ! !       ',0
.TXT6       DC.B    '!!!!!!! !     !  !     ! !!!!!!! !!!!!!  !!!!!   ',0
.TXT7       DC.B    '      ! !  !  !  !     ! !     ! !  !    !       ',0
.TXT8       DC.B    '!!!!!!! !!!!!!!  !!!!!!! !     ! !   !   !!!!!!!!',0
.TXT9       DC.B    '             !                                   ',0
.TXTLST     DC.L    .TXT4,.TXT5,.TXT6,.TXT7,.TXT8,.TXT9,0
            DS.W    0














*~Font name~Fixedsys~
*~Font size~24~
*~Tab type~0~
*~Tab size~4~
