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

        ;METER EN EL TRAP 0 LA RUTINA PARA ACTUALIZAR LA PANTALLA
        MOVE.L  #SCRPLOT,($80+SCRUPTN*4)
        MOVE.L  #KBDUPD,($80+KBDUPTN*4)
        MOVE.L  #MOUSEREAD,($80+MOUSETRAP*4)
        MOVE.L  #SNDPLAY,($80+SNDPLTN*4)
        MOVE.L  #SCRTIM,($60+SCRINTN*4)   ;INTERRUPCION #1
        MOVE.L  #FPSCOUNTI,($60+FPSTN*4)  ;INTERRUPCION CONTADOR FRAMES SEC
    
        JSR     SCRINIT
        JSR     KBDINIT
        JSR     SNDINIT
        JSR     DMMINIT
    
        MOVE.W  SR,-(A7)
        ANDI.W  #$D8FF,(A7)     ;ACTIVAR INTERRUPCIONES 
        
        RTE
; ----------------------------------------------------------
SNDINIT
; INICIALIZAR SISTEMA SONIDO
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
            MOVEM.L D0-D1/A0-A1,-(A7)
            
            CLR.B   D1
            LEA     .SNDLIST,A0
.LOOP       MOVE.L  (A0)+,D0
            BEQ     .DONE
            MOVE.L  D0,A1
            
            ;CHANGE IF DOESNT WORK
            ;MOVE.B  #73,D0  ;LOAD IN DIRECTX
            MOVE.B  #71,D0 ;LOAD WAV TO SOUND MEMORY
            TRAP    #15
            ADDQ.B  #1,D1
            BRA     .LOOP
            
.DONE       MOVEM.L (A7)+,D0-D1/A0-A1
            RTS
            
.SNDHIT     DC.B    'SND/HIT.wav',0
.SNDSHOOT   DC.B    'SND/SHOOT.wav',0
.SNDLIST    DC.L    .SNDHIT,.SNDSHOOT,0

; ----------------------------------------------------------
SNDPLAY
; PLAY SONIDO
; INPUT     : D7 SOUND ID
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
            MOVEM.W D0-D1,-(A7)
            
            
            ;CHANGE TO SOUND MEMORY IF DOESNT WORK
            ;MOVE.B  #73,D0  ;DIRECTX SOUND
            MOVE.B  #72,D0 ;SOUND MEMORY
            MOVE.B  D7,D1
            TRAP    #15
            MOVEM.W (A7)+,D0-D1
            
            RTE      
; ----------------------------------------------------------
SCRINIT
; INIT RESOLUCION PANTALLA, PONER MODO VENTANA, BORRAR PANTALLA
; ENABLE DOBLE BUFFER, HABILITAR INTERRUPCION TEMPORIZADA
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : D0-D1
; ----------------------------------------------------------
        
        ;GUARDAR PARA RESTAURAR LUEGO LOS REGISTROS QUE MODIFICAMOS
        MOVEM.L D0-D3,-(A7)

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
        
        ;ENABLE ENABLE TIMER
        MOVE.B  #32,D0
        MOVE.B  #6,D1
        MOVE.B  #$80|SCRINTN,D2
        MOVE.L  #1000/FPS,D3
        TRAP    #15
        
        ;ENABLE CONTADOR SEC
        MOVE.B  #32,D0
        MOVE.B  #6,D1
        MOVE.B  #$80|FPSTN,D2
        MOVE.L  #1000,D3
        TRAP    #15
        
        ;CLEAR INTERRUPT COUNTER
        CLR.B   (SCRINTCT)
        
        ;CLEAR CONTADOR FPS
        CLR.W   (FPSCOUNT)
        CLR.B   (SCRCYCCT)
        
        
        ;RESTAURAR LOS REGISTROS A SU ESTADO ANTERIOR A MODIFICACION
        MOVEM.L (A7)+,D0-D3
        
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
; ----------------------------------------------------------
SCRTIM
; RUTINA DE INTERRUPCION CONTROLADA
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------
        ADDQ.B   #1,(SCRINTCT)
        ADDQ.B   #1,(SCRCYCCT)    
        RTE
; ----------------------------------------------------------        
FPSCOUNTI
; RUTINA DE INTERRUPCION CONTROLADA SEGUNDO
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------        
            MOVE.W D0,-(A7)
            
            MOVE.W  (FPSCOUNT),D0
            MOVE.W  D0,(FPSSHOW)
            CLR.W   (FPSCOUNT) 
            
            MOVE.W  (A7)+,D0        
        RTE        
; ----------------------------------------------------------
KBDINIT
; INICIALIZAR TECLADO
; INPUT     : NONE
; OUTPUT    : NONE
; MODIFIES  : NONE
; ----------------------------------------------------------

        CLR.B   (KBDVAL)
        CLR.B   (KBDEDGE)
        
        RTS
; ----------------------------------------------------------
KBDUPD
; UPDATE KEYBOARD INFO.  
; 7 -> PAUSE
; 6 -> FIRE 3
; 5 -> FIRE 2
; 4 -> FIRE 1
; 3 -> DOWN
; 2 -> RIGHT
; 1 -> UP
; 0 -> LEFT
; INPUT    : NONE
; OUTPUT   : NONE
; MODIFIES : NONE
; ----------------------------------------------------------
        
        MOVEM.W D0-D3,-(A7)

        ; LEER PRIMERA PARTE
        
        MOVE.B  #19,D0
        MOVE.L  #KBDPAUSE<<24|KBDFIRE3<<16|KBDFIRE2<<8|KBDFIRE1,D1
        TRAP    #15
        
        ; MOVERLO AL FORMATO QUE QUEREMOS
        JSR     .PACK
        
        ;LEER SEGUNDA PARTE
        MOVE.B  #19,D0
        MOVE.L  #KBDDOWN<<24|KBDRIGHT<<16|KBDUP<<8|KBDLEFT,D1
        TRAP    #15

        ; MOVERLO AL FORMATO QUE QUEREMOS
        JSR     .PACK
        
        ;COMPUTAR KBDEGE
        MOVE.B  (KBDVAL),D0
        NOT.B   D0
        AND.B   D2,D0
        MOVE.B  D0,(KBDEDGE)

        ;GUARDAR KBDVAL
        MOVE.B  D2,(KBDVAL)     
        
        MOVEM.W (A7)+,D0-D3

        RTE


        ;RUTINA PARA MOVER AL FORMATO
.PACK   MOVE.W  #3,D3
.LOOP   LSL.L   #8,D1
        ROXL.B  #1,D2
        DBRA.W  D3,.LOOP
        RTS
        
;------------------------------------------------------------------ 
MOUSEREAD   MOVEM.L D0-D1,-(A7)

            MOVE.B  #61,D0
            CLR.B   D1
            TRAP    #15
            AND.B   #1,D0
            MOVE.B  D0,(MOUSEPRESS)
            MOVE.L  D1,(MOUSEPOS)
            
            MOVEM.L (A7)+,D0-D1
            RTE

















*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
