; ==============================================================================
; VICTORY SCREEN
; ==============================================================================

; ------------------------------------------------------------------------------
WINUPD
; VICTORY SCREEN UPDATE
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
            

.END        MOVEM.L  (A7)+,D0-D1

            RTS

; ------------------------------------------------------------------------------
WINPLOT
; VICTORY SCREEN PLOT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ------------------------------------------------------------------------------
            MOVEM.L D0-D4/A0,-(A7)
            
            CLR.L   D1
            MOVE.B  #81,D0
            TRAP    #15
            
            LEA     .TXT1,A0
            MOVE.B  #10,D0
            JSR     UTLPRINT
            
            LEA     .TXT2,A0
            MOVE.B  #27,D0
            JSR     UTLPRINT
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
.TXT1       DC.B    'YOU WON!',0
.TXT2       DC.B    'AGAIN',0
            DS.W    0









*~Font name~Fixedsys~
*~Font size~24~
*~Tab type~0~
*~Tab size~4~
