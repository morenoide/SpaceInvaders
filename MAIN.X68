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
    
    
    
START:
; --- INICIALIZAR ------------------------------------------
            JSR SYSINIT
            JSR PJINIT
            JSR SCOINIT
            JSR LASINIT
            JSR LASBINIT
.LOOP

; --- UPDATE -----------------------------------------------

; LECTURA DISPOSITIVOS DE ENTRADA

; UPDATE GAME LOGIC

            JSR     LASUPD
            JSR     LASBUPD
            JSR     PJUPD

; --- SYNCRONIZAR (PARA EL FRAMERATE) ----------------------


; --- DIBUJAR PANTALLA -------------------------------------

            JSR     SCOPLOT
            JSR     LASPLOT
            JSR     LASBPLOT
            JSR     PJPLOT
            
            TRAP    #0
            
            
            BRA     .LOOP

            SIMHALT                 ; halt simulator


            INCLUDE "VARS.X68"      ; Variables del juego
            INCLUDE "SYSVAR.X68"    ; Variables sistema

            END    START            ; last line of source





*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
