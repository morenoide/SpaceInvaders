*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
    
    INCLUDE "CONST.X68"     ; Constanstes, Colores, jugador, etc...
    INCLUDE "SYSCONST.X68"  ; Ancho/Alto Pantalla etc...
    INCLUDE "SYSTEM.X68"    ; INICIALIZACION PERIFERICOS ETC
    INCLUDE "JUGADOR.X68"   ; BARRA DEL JUGADOR (PAD.X68)
    INCLUDE "LASER.X68"     ; LASER DEL JUGADOR
    INCLUDE "LASERBAD.X68"  ; LASER DE LOS ENEMIGOS
    INCLUDE "SCORE.X68"     ; PUNTUACION
    INCLUDE "ENEMIGO.X68"   ; ENEMIGO DEL JUEGO
    
    
    
START:
; --- INICIALIZAR ------------------------------------------
            ORI.W  #$0700,SR    ;DESACTIVAR INTERRUPCIONES
            JSR     SYSINIT
            JSR     PJINIT
            JSR     SCOINIT
            JSR     LASINIT
            JSR     LASBINIT
            JSR     ENEINIT
.LOOP

; --- UPDATE -----------------------------------------------

; LECTURA DISPOSITIVOS DE ENTRADA
            TRAP    #KBDUPTN

; UPDATE GAME LOGIC

            JSR     LASUPD
            JSR     LASBUPD
            JSR     PJUPD
            JSR     ENEUPD
            
; --- AUMENTAR CONTADOR FRAMES -----------------------------
            ADDQ.W  #1,(FPSCOUNT)

; --- SYNCRONIZAR (PARA EL FRAMERATE) ----------------------
.WINT       TST.B   (SCRINTCT)
            BEQ     .WINT
            CLR.B   (SCRINTCT)
            

; --- DIBUJAR PANTALLA -------------------------------------

            JSR     SCOPLOT
            JSR     LASPLOT
            JSR     LASBPLOT
            JSR     PJPLOT
            JSR     ENEPLOT
            
            TRAP    #SCRUPTN
            

            
            
            BRA     .LOOP

            SIMHALT                 ; halt simulator


            INCLUDE "VARS.X68"      ; Variables del juego
            INCLUDE "SYSVAR.X68"    ; Variables sistema

            END    START            ; last line of source









*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
