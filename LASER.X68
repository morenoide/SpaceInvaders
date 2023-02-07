*-----------------------------------------------------------
; LASER (AGENTE)
; LASPOSX (W)   (A0)
; LASPOSY (W)   2(AO)
*-----------------------------------------------------------
LASINIT
; INICIALIZAR EL LASER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
    MOVE.W  (PJPOSX),D0
    SUB.W   #LASX/2,D0
    MOVE.W  D0,(A0)        ;DEFINIMOS X 
    MOVE.W  #PJY-LASY,2(A0) ;DEFINIMOS Y 
    RTS
    
LASUPD
; ACTUALIZAR EL LASER
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

            MOVEM.L D0-D1,-(A7)
    
            ;SI SE HA PULSADO LA TECLA SPACE, MOVER EL LASER A LA POSICION DEL JUGADOR
*            BTST.B  #4,(KBDEDGE)     ;SI SE HA PULSADO
*            BEQ     .SEGUIR

            ;AL PULSAR, SE MUEVE EL LASER
*            MOVE.W  (PJPOSX),D0
*            MOVE.W  D0,(LASPOSX)
*            MOVE.W  #PJY-PJALTO,D1
*            MOVE.W  D1,(LASPOSY)
            
*            ;EFECTO DE SONIDO
*            MOVE.B  #SNDSHOOT,D7
*            TRAP    #SNDPLTN
            
            ;SI X < 0, KILL
            TST.W   2(A0)
            BGT     .SEGUIR
            
            JSR     AGLKILL
            
    
            ;ACTUALIZAR POSICION LASER
.SEGUIR     MOVE.W  2(A0),D0
            SUB.W   #LASSPEED,D0
            ;SUB.W   (LASVELY),D0
            
            
    
    
            ;GUARDAR POSICION
            MOVE.W  D0,2(A0)
    
            MOVEM.L (A7)+,D0-D1
    
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
    MOVE.W  (A0),D1
    SUB.W   #LASX/2,D1
    MOVE.W  D1,D3
    ADD.W   #LASX,D3
            
        ;DEFINIR ALTURA LASER
    MOVE.W  2(A0),D2
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
