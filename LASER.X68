*-----------------------------------------------------------
; LASER
*-----------------------------------------------------------
LASINIT
; INICIALIZAR EL LASER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    MOVE.W  #SCRWIDTH/2,(LASPOSX)
    MOVE.W  #PJY-LASY,(LASPOSY)
    MOVE.W  #LASSPEED,(LASVELY)
    RTS
    
LASUPD
; ACTUALIZAR EL LASER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0,-(A7)
    
    ;ACTUALIZAR POSICION LASER
    MOVE.W  (LASPOSY),D0
    SUB.W   (LASVELY),D0
    
    ;DETECTAR COLISIONES
    
    ;GUARDAR POSICION
    MOVE.W  D0,(LASPOSY)
    
    MOVEM.L (A7)+,D0
    
    RTS
    
LASPLOT
; ACTUALIZAR GRAFICAMENTE EL SALER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0-D4,-(A7)
    
    ;DEFINIR COLOR CONTORNO
    MOVE.B  #80,D0
    MOVE.L  #LASCOLOR,D1
    TRAP    #15
                        
    ;DEFINIR COLOR RELLENO
    MOVE.B  #81,D0
    MOVE.L  #LASFILL,D1
    TRAP    #15
    
    ;DEFINIR COORDENADAS
            
        ;DEFINIR ANCHURA LASER
    MOVE.W  (LASPOSX),D1
    SUB.W   #LASX/2,D1
    MOVE.W  D1,D3
    ADD.W   #LASX,D3
            
        ;DEFINIR ALTURA LASER
    MOVE.W  (LASPOSY),D2
    SUB.W   #LASY/2,D2
    MOVE.W  D2,D4
    ADD.W   #LASY,D4
            
            ;DIBUJAR RECTANGULO
    MOVE.B  #87,D0
    TRAP    #15

    MOVEM.L (A7)+,D0-D4
    
    RTS

*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
