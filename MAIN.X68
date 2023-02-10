*-----------------------------------------------------------
* Title      :SQUAREINVADERS
* Written by :Sergi Oliver Juarez
*             Alejandro Moreno Jimenez
*-----------------------------------------------------------
    ORG    $1000
    
    INCLUDE "CONST.X68"             ; Constanstes, Colores, jugador, etc...
    INCLUDE "SYSCONST.X68"          ; Ancho/Alto Pantalla etc...
    INCLUDE "LIB/UTLCONST.X68"
    INCLUDE "LIB/DMMCONST.X68"
    INCLUDE "LIB/DMMCODE.X68"
    INCLUDE "SYSTEM.X68"            ; INICIALIZACION PERIFERICOS ETC
    INCLUDE "LIB/AGLCODE.X68"
    INCLUDE "LIB/UTLCODE.X68"
    INCLUDE "JUGADOR.X68"           ; BARRA DEL JUGADOR (PAD.X68)
    INCLUDE "LASER.X68"             ; LASER DEL JUGADOR
    INCLUDE "SCORE.X68"             ; PUNTUACION
    INCLUDE "ENEMIGO.X68"           ; ENEMIGO DEL JUEGO
    INCLUDE "GAME.X68"              ; LOGICA DEL JUEGO
    INCLUDE "GFX.X68"               ; GRAPHICS MANAGEMENT
    INCLUDE "DATA/GFXDATA.X68"      ; GRAPHICS DATA
    INCLUDE "INTRO.X68"
    INCLUDE "INSTRUCTIONS.X68"
    INCLUDE "WIN.X68"
    INCLUDE "GOVER.X68"
    INCLUDE "STATES.X68"

    
    
START:
; --- INICIALIZAR ------------------------------------------
            ORI.W  #$0700,SR    ;DESACTIVAR INTERRUPCIONES
            JSR     SYSINIT
            JSR     UTLINIT
            JSR     PJINIT
            JSR     STAINIT     
.LOOP

; --- UPDATE -----------------------------------------------

; LECTURA DISPOSITIVOS DE ENTRADA
            TRAP    #KBDUPTN

; UPDATE GAME LOGIC

            JSR     STAUPD

            
; --- AUMENTAR CONTADOR FRAMES -----------------------------
            ADDQ.W  #1,(FPSCOUNT)

; --- SYNCRONIZAR (PARA EL FRAMERATE) ----------------------
.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            

; --- DIBUJAR PANTALLA -------------------------------------

           JSR     STAPLOT

                      
           TRAP     #SCRUPTN

           BRA      .LOOP  

            SIMHALT                 ; halt simulator


            INCLUDE "VARS.X68"      ; Variables del juego
            INCLUDE "LIB/UTLVARS.X68"
            INCLUDE "SYSVAR.X68"    ; Variables sistema
            INCLUDE "LIB/DMMVARS.X68"
            

            END    START            ; last line of source









*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
