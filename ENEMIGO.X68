*-----------------------------------------------------------
; ENEMIGO (AGENTE)
; ENEPOSX   (A0)
; ENEPOSY   2(A0)
; ENEVEL    4(A0)
*-----------------------------------------------------------
ENEINIT
; INICIALIZAR EL ENEMIGO
; INPUT     : D1,D2 = X,Y
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------


    ;#D1*(ANCHO + MARGEN [5]),(A0) DEFINIMOS X
    MULU.W  #ENEANCHO+5,D1
    MOVE.W  D1,(A0)
*    MOVE.W  #5+ENEANCHO*D1,(A0)   ;DEFINIMOS X 
*    MOVE.W  #100+ENEALTO*D2,2(A0) ;DEFINIMOS Y

    ;#D2*(ALTO + MARGEN [15]),2(A0) DEFINIMOS Y
    MULU.W  #ENEALTO+15,D2
    ADD.W   #100,D2
    MOVE.W  D2,2(A0)
    
    MOVE.W  #ENESPEED,4(A0) ;VELOCIDAD LASER
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
            MOVE.W  (A0),D0
            MOVE.W  2(A0),D1
            ADD.W   4(A0),D0
            
            ; CHECK HORIZONTAL COLISIONS
            CMP.W   #SCRWIDTH-ENEANCHO/2,D0
            BGT     .COL
            CMP.W   #ENEANCHO,D0
            BLT     .COL
            BRA     .CHK
            
.COL        NEG.W   4(A0)
            ADD.W   #ENEYSPEED,D1

            ;CHECK SI LE HA DADO UN LASER
                ;X LASER
.CHK        MOVE.W  (A0),D2
            MOVE.W  (A0),D3
            
            SUB.W   #ENEALTO/2,D2
            CMP.W   D2,D3
            BLT     .DONE
            
            ADD.W   #ENEALTO,D2
            CMP.W   D2,D3
            BGT     .DONE
            
                ;Y LASER        
            MOVE.W  2(A0),D2
            MOVE.W  2(A0),D3 
            
            SUB.W   #ENEANCHO/2,D2
            CMP     D2,D3
            BLT     .DONE
            
            ADD.W   #ENEANCHO,D2
            CMP     D2,D3
            BGT     .DONE            
            
            ADDQ.W  #1,(SCOOUT)
            
            ;GUARDAR POSICION
.DONE       MOVE.W  D0,(A0)
            MOVE.W  D1,2(A0)
    
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
    MOVE.W  (A0),D1
    SUB.W   #ENEANCHO/2,D1
    MOVE.W  D1,D3
    ADD.W   #ENEANCHO,D3
            
        ;DEFINIR ALTURA
    MOVE.W  2(A0),D2
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
