*-----------------------------------------------------------
; JUGADOR
*-----------------------------------------------------------

; ----------------------------------------------------------
PJINIT
; INICIALIZAR EL PALA DEL JUGADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
            MOVE.W #SCRWIDTH/2,(PJPOSX)
            RTS
    
PJUPD
; ACTUALIZAR EL JUGADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
            
            MOVE.W  D0,-(A7)
            
            ;SI SE HA PULSADO LA TECLA SPACE, MOVER EL LASER A LA POSICION DEL JUGADOR
            BTST.B  #4,(KBDEDGE)     ;SI SE HA PULSADO
            BEQ     .SEGUIR
            
            ;CREAR UN LASER NUEVO
            LEA     LASINIT,A1
            LEA     LASUPD,A2
            LEA     LASPLOT,A3
            MOVE.W  #LASID,D0
            JSR     AGLADD
            
            ;EFECTO DE SONIDO
            MOVE.B  #SNDSHOOT,D7
            TRAP    #SNDPLTN

            
            ;ACTUALIZAR POSICION JUGADOR
.SEGUIR     MOVE.W  (PJPOSX),D0
            BTST.B  #0,(KBDVAL)
            BEQ     .CHKLEFT
            SUB.W   #PJSPEED,D0
.CHKLEFT    BTST.B  #2,(KBDVAL)
            BEQ     .CONT
            ADD.W   #PJSPEED,D0
            
            ;COLISIONES PARA QUE NO SE SALGA DE LA PANTALLA
.CONT       CMP.W   #PJANCHO/2,D0
            BGE     .CONT2
            MOVE.W  #PJANCHO/2,D0
            BRA     .DONE
            
.CONT2      CMP.W   #SCRWIDTH-PJANCHO/2,D0
            BLE     .DONE
            MOVE.W  #SCRWIDTH-PJANCHO/2,D0

            ;ACTUALIZAR VARIABLE
.DONE       MOVE.W  D0,(PJPOSX)


            MOVE.W  (A7)+,D0            

            RTS
    
PJPLOT
; ACTUALIZAR GRAFICAMENTE AL JUGADOR
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

            MOVEM.L D0-D4,-(A7)

            ;DEFINIR COLOR CONTORNO
            MOVE.B  #80,D0
            MOVE.L  #PJCOLOR,D1
            TRAP    #15
                        
            ;DEFINIR COLOR RELLENO
            MOVE.B  #81,D0
            MOVE.L  #PJFILL,D1
            TRAP    #15
            
            ;DEFINIR COORDENADAS
            
                ;DEFINIR ANCHURA RECTANGULO
            MOVE.W  (PJPOSX),D1
            SUB.W   #PJANCHO/2,D1
            MOVE.W  D1,D3
            ADD.W   #PJANCHO,D3

                ;DEFINIR ALTURA RECTANGULO
            MOVE.W  #PJY-PJALTO/2,D2
            MOVE.W  #PJY+PJALTO/2,D4
            
            ;DIBUJAR RECTANGULO
            MOVE.B  #87,D0
            TRAP    #15
            
            MOVEM.L  (A7)+,D0-D4
            
            RTS
            
            
            


*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
