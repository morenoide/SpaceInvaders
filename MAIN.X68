*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
    
    INCLUDE "CONST.X68"         ; Constanstes, Colores, jugador, etc...
    INCLUDE "SYSCONST.X68"      ; Ancho/Alto Pantalla etc...
    INCLUDE "LIB/DMMCONST.X68"
    INCLUDE "LIB/DMMCODE.X68"
    INCLUDE "SYSTEM.X68"        ; INICIALIZACION PERIFERICOS ETC
    INCLUDE "LIB/AGLCODE.X68"
    INCLUDE "LIB/UTLCODE.X68"
    INCLUDE "JUGADOR.X68"       ; BARRA DEL JUGADOR (PAD.X68)
    INCLUDE "LASER.X68"         ; LASER DEL JUGADOR
    INCLUDE "LASERBAD.X68"      ; LASER DE LOS ENEMIGOS
    INCLUDE "SCORE.X68"         ; PUNTUACION
    INCLUDE "ENEMIGO.X68"       ; ENEMIGO DEL JUEGO
    INCLUDE "GAME.X68"          ; LOGICA DEL JUEGO
    
    
    
START:
; --- INICIALIZAR ------------------------------------------
            ORI.W  #$0700,SR    ;DESACTIVAR INTERRUPCIONES
            JSR     SYSINIT
            JSR     UTLINIT
            JSR     PJINIT
            JSR     GAMEINIT     
.LOOP

; --- UPDATE -----------------------------------------------

; LECTURA DISPOSITIVOS DE ENTRADA
            TRAP    #KBDUPTN

; UPDATE GAME LOGIC

            JSR     GAMEUPD
            
; --- AUMENTAR CONTADOR FRAMES -----------------------------
            ADDQ.W  #1,(FPSCOUNT)

; --- SYNCRONIZAR (PARA EL FRAMERATE) ----------------------
.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            

; --- DIBUJAR PANTALLA -------------------------------------

            JSR     GAMEPLOT
            
            TRAP    #SCRUPTN

            BRA     .LOOP

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
