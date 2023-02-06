*-----------------------------------------------------------
; ENEMIGO
*-----------------------------------------------------------
ENEINIT
; INICIALIZAR EL ENEMIGO
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    MOVE.W  #5+ENEANCHO,(ENEPOSX)   ;DEFINIMOS X 
    MOVE.W  #100+ENEALTO,(ENEPOSY) ;DEFINIMOS Y 
    MOVE.W  #ENESPEED,(ENEVEL) ;VELOCIDAD LASER
    RTS

; ----------------------------------------------------------    
ENEUPD
; ACTUALIZAR EL ENEMIGO
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

            MOVEM.L D0-D3,-(A7)
    
            ;ACTUALIZAR POSICION LASER
            MOVE.W  (ENEPOSX),D0
            MOVE.W  (ENEPOSY),D1
            ADD.W   (ENEVEL),D0
            
            ; CHECK HORIZONTAL COLISIONS
            CMP.W   #SCRWIDTH-ENEANCHO/2,D0
            BGT     .COL
            CMP.W   #ENEANCHO,D0
            BLT     .COL
            BRA     .CHK
            
.COL        NEG.W   (ENEVEL)
            ADD.W   #ENEYSPEED,D1

            ;CHECK SI LE HA DADO UN LASER
                ;X LASER
.CHK        MOVE.W  (ENEPOSX),D2
            MOVE.W  (LASPOSX),D3
            
            SUB.W   #ENEALTO/2,D2
            CMP.W   D2,D3
            BLT     .DONE
            
            ADD.W   #ENEALTO,D2
            CMP.W   D2,D3
            BGT     .DONE
            
                ;Y LASER        
            MOVE.W  (ENEPOSY),D2
            MOVE.W  (LASPOSY),D3 
            
            SUB.W   #ENEANCHO/2,D2
            CMP     D2,D3
            BLT     .DONE
            
            ADD.W   #ENEANCHO,D2
            CMP     D2,D3
            BGT     .DONE            
            
            ADDQ.W  #1,(SCOOUT)
            
            ;GUARDAR POSICION
.DONE       MOVE.W  D0,(ENEPOSX)
            MOVE.W  D1,(ENEPOSY)
    
            MOVEM.L (A7)+,D0-D3
    
            RTS
            
; ----------------------------------------------------------
ENEPLOT
; ACTUALIZAR GRAFICAMENTE EL ENEMIGO
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

    MOVEM.L D0-D4,-(A7)
    
    ;DEFINIR COLOR CONTORNO
    MOVE.B  #80,D0
    MOVE.L  #ENECOLOR,D1
    TRAP    #15
                        
    ;DEFINIR COLOR RELLENO
    MOVE.B  #81,D0
    MOVE.L  #ENEFILL,D1
    TRAP    #15
    
    ;DEFINIR COORDENADAS
            
        ;DEFINIR ANCHURA
    MOVE.W  (ENEPOSX),D1
    SUB.W   #ENEANCHO/2,D1
    MOVE.W  D1,D3
    ADD.W   #ENEANCHO,D3
            
        ;DEFINIR ALTURA
    MOVE.W  (ENEPOSY),D2
    SUB.W   #ENEALTO/2,D2
    MOVE.W  D2,D4
    ADD.W   #ENEALTO,D4
            
            ;DIBUJAR RECTANGULO
    MOVE.B  #87,D0
    TRAP    #15

    MOVEM.L (A7)+,D0-D4
    
    RTS





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
