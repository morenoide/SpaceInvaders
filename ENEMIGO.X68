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


    ;#D1*(ANCHO + MARGEN [50]),(A0) DEFINIMOS X
    MULU.W  #ENEANCHO+50,D1
    ADD.W  #ENEANCHO,D1
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
            
            ;CHECK HORIZONTAL COLISIONS
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
            MOVE.W  (LASPOSX),D3
            
            SUB.W   #ENEALTO/2,D2
            CMP.W   D2,D3
            BLT     .DONE
            
            ADD.W   #ENEALTO,D2
            CMP.W   D2,D3
            BGT     .DONE
            
            ;Y LASER        
            MOVE.W  2(A0),D2
            MOVE.W  (LASPOSY),D3 
            
            SUB.W   #ENEANCHO/2,D2
            CMP     D2,D3
            BLT     .DONE
            
            ADD.W   #ENEANCHO,D2
            CMP     D2,D3
            BGT     .DONE            
            
            ;SI SE DA LA COLISION
            
            ADDQ.W  #1,(SCOOUT)     ;SUMA MARCADOR
            JSR     AGLKILL         ;ELIMINAMOS AGENTE CORRESPONDIENTE
            MOVE.W  #-20,D1           ;MOVEMOS EL LASER PARA NO MATAR A MAS DE UN ENEMIGO
            
            MOVE.W  D1,(LASPOSY)
            MOVE.B  #SNDHIT,D7
            TRAP    #SNDPLTN
            
            ;GUARDAR POSICION
           ;CHECK SI HA PERDIDO LA PARTIDA
.DONE       MOVE.W  2(A0),D2
            MOVE.W  #PJY-20,D3
            CMP.W   D2,D3         ;SI SECUMPLE LA CONDICION DE DERROTA(POSICION ENEMIGO (Y) IGUAL A PJY)
            BGT     .SEGUIR
            MOVE.W  #4,(STANEXT)        ;CAMBIA AL STATE 4
            
.SEGUIR     MOVE.W  D0,(A0)
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
            MOVEM.L D0-D4/A2,-(A7)
     
*            LEA     MALO,A2
*            
*            MOVE.W  2(A0),D3              
*            SUB.W   #ENEANCHO/2,D3        ; SET Y
*            
*            MOVE.W  #31,D6                ; D5 = X D6 = Y
*.LOOP2      MOVE.W  #31,D5
*            MOVE.W  (A0),D4
*            SUB.W   #ENEALTO/2,D4         ;SET X
*.LOOP       MOVE.B  (A2)+,D0
*            CMP.W   #0,D0
*            BEQ     .SALTO
*            
*            MOVE.L  #ENECOLOR,D1
*            JSR     GFXDRPXL                ; DRAW PIC
*            
*.SALTO      ADDQ.W  #1,D4
*            DBRA.W  D5,.LOOP
*            ADDQ.W  #1,D3
*            DBRA.W  D6,.LOOP2
    
            ;DEFINIR COLOR CONTORNO
            MOVE.B  #80,D0
            MOVE.L  #ENECOLOR,D1
            TRAP    #15
                        
            ;DEFINIR COLOR RELLENO
            MOVE.B  #81,D0
            MOVE.L  #ENEFILL,D1
            TRAP    #15
    
            ;DEFINIR COORDENADAS
            ;DEFINIR ANCHURA x
            MOVE.W  (A0),D1
            SUB.W   #ENEANCHO/2,D1
            MOVE.W  D1,D3
            ADD.W   #ENEANCHO,D3
            
            ;DEFINIR ALTURA y
            MOVE.W  2(A0),D2
            SUB.W   #ENEALTO/2,D2
            MOVE.W  D2,D4
            ADD.W   #ENEALTO,D4
            
            ;DIBUJAR RECTANGULO
            MOVE.B  #87,D0
            TRAP    #15

    MOVEM.L (A7)+,D0-D4/A2
    
    RTS

























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
