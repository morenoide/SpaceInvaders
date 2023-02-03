*-----------------------------------------------------------
; SYSTEM
*-----------------------------------------------------------

; ----------------------------------------------------------
SYSINIT
; INICIALIZAR EL SISTEMA
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    JSR        SCRINIT
    
    ;METER EN EL TRAP 0 LA RUTINA PARA ACTUALIZAR LA PANTALLA
    MOVE.L  #SCRPLOT,($80)
            
    MOVE.W  SR,-(A7)
    ANDI.W  #$DFFF,(A7)
    RTE
    
; ----------------------------------------------------------
SCRINIT
; INIT RESOLUCION PANTALLA, PONER MODO VENTANA, BORRAR PANTALLA
; ENABLE DOBLE BUFFER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : D0-D1
; ----------------------------------------------------------
        
        ;GUARDAR PARA RESTAURAR LUEGO LOS REGISTROS QUE MODIFICAMOS
        MOVEM.L D0-D1,-(A7)

        ;INIT RESOLUCION PANTALLA
        MOVE.B  #33,D0
        MOVE.L  #SCRWIDTH<<16|SCRHEIGHT,D1
        TRAP    #15
        
        ;DEFINIR MODO VENTANA
        MOVE.L  #1,D1
        TRAP    #15
        
        ;BORRAR PANTALLA
        MOVE.B  #11,D0
        MOVE.W  #$FF00,D1
        TRAP    #15
        
        ;ENABLE DOBLE BUFFER
        MOVE.B  #92,D0
        MOVE.B  #17,D1
        TRAP    #15
        
        
        ;RESTAURAR LOS REGISTROS A SU ESTADO ANTERIOR A MODIFICACION
        MOVEM.L (A7)+,D0-D1
        
        RTS

; ----------------------------------------------------------
SCRPLOT
; ACTUALIZAR DOBLE BUFFER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : D0-D1
; ----------------------------------------------------------
       MOVEM.W D0-D1,-(A7)
       ; SWITCH BUFFERS
       MOVE.B  #94,D0
       TRAP    #15
                  
        ; CLEAR HIDDEN BUFFER
        MOVE.B  #11,D0
        MOVE.W  #$FF00,D1
        TRAP    #15
        MOVEM.W (A7)+,D0-D1
        
        RTE










*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
